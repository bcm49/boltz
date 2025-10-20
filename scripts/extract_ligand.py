import gemmi
from rdkit import Chem
from io import StringIO

def extract_ligand_from_pdb(pdb_path, output_path, ligand_resname="LIG") -> None:
    # --- Read structure ---
    st = gemmi.read_structure(pdb_path)
    model = st[0]  # usually only one model in Boltz-2 outputs
    
    # --- Collect ligand residues ---
    ligand_residues = []
    for chain in model:
        for res in chain:
            if res.name == ligand_resname:
                ligand_residues.append(res)
    
    if not ligand_residues:
        raise ValueError(f"No residues with name {ligand_resname} found.")
    
    if len(ligand_residues) > 1:
        print(f"{len(ligand_residues)} ligand residues")
    
    # --- Build RDKit molecule ---
    mol = Chem.RWMol()
    atom_map = {}
    
    # Add atoms
    for atom in res:
        rd_atom = Chem.Atom(atom.element.name)
        idx = mol.AddAtom(rd_atom)
        atom_map[atom.serial] = idx
    
    # --- Add bonds from CONECT records ---
    for conn in st.connections:
        a1, a2 = conn.partner1, conn.partner2
        # Only include bonds where both partners are in this ligand
        if (
            a1.residue.name == ligand_resname
            and a2.residue.name == ligand_resname
            and a1.atom.serial in atom_map
            and a2.atom.serial in atom_map
        ):
            mol.AddBond(
                atom_map[a1.atom.serial],
                atom_map[a2.atom.serial],
                Chem.rdchem.BondType.SINGLE
            )
    
    mol = mol.GetMol()
    
    # --- Assign 3D coordinates ---
    conf = Chem.Conformer(mol.GetNumAtoms())
    for atom in res:
        idx = atom_map[atom.serial]
        pos = atom.pos
        conf.SetAtomPosition(idx, (pos.x, pos.y, pos.z))
    mol.AddConformer(conf, assignId=True)

    
    # --- Write SDF ---
    w = Chem.SDWriter(output_sdf)
    w.write(mol)
    w.close()
    
    print(f"Wrote ligand {ligand_resname} to {output_sdf}")
    

# --- Input parameters ---
pdb_path = "my_predictions/3NEW_ALLOSTERIC_3NE/model_0.pdb"
output_sdf = "ligand.sdf"
extract_ligand_from_pdb(pdb_path, output_sdf)
