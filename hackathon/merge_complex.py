"""
combine_pdbqt.py

Combine a receptor and ligand PDBQT file into a single PDB file using PyMOL's cmd API.

Usage (command line):
    conda run -n pymol pymol -cq combine_pdbqt.py -- receptor.pdbqt ligand_out.pdbqt complex.pdb
"""

import sys
from pymol import cmd

def combine_pdbqt(receptor_file, ligand_file, output_name):
    """
    Load receptor and ligand PDBQT files and save a combined PDB.
    """
    # Load files as separate objects
    cmd.load(receptor_file, "receptor")
    cmd.load(ligand_file, "ligand")

    states = cmd.count_states("ligand")

    for i in range(1, states+1):
        if i != 1:
            cmd.create("receptor", "receptor", 1, i)
        # Combine both selections into one
        # cmd.create(f"complex_{i}", f"receptor or (ligand and state {i})")
        # Save combined structure as PDB
        output_filename = f"{output_name}_model_{i}.pdb"
        cmd.save(output_filename, f"receptor or ligand", i)
        print(f"[INFO] Combined structure {i} saved to: {output_filename}")

    # Quit PyMOL cleanly
    cmd.quit()

# Allow command-line usage: pymol -cq combine_pdbqt.py -- receptor ligand output
args = [a for a in sys.argv if not a.startswith('-')]
if len(args) == 4:
    _, receptor, ligand, output = args
    combine_pdbqt(receptor, ligand, output)
else:
    print("Usage: pymol -cq combine_pdbqt.py -- receptor.pdbqt ligand_out.pdbqt complex.pdb")
