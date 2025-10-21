import subprocess
from pathlib import Path

from rdkit import Chem
from rdkit.Chem import AllChem

import subprocess as sp

import json

def create_receptor_and_box(
    pdb_path: Path,
    output_name: str,
    center: tuple[float, float, float],
    box_size: tuple[float, float, float],
) -> tuple[Path, Path]:
    subprocess.run(
        [
            "mk_prepare_receptor.py",
            "-i",
            pdb_path,
            "-o",
            output_name,
            "-p",
            "-v",
            "--box_size",
            str(box_size[0]),
            str(box_size[1]),
            str(box_size[2]),
            "--box_center",
            str(center[0]),
            str(center[1]),
            str(center[2]),
            "--allow_bad_res",
            "--default_altloc",
            "A",
        ]
    )
    return (Path(f"{output_name}.pdbqt"), Path(f"{output_name}.box.txt"))


def create_conformer(smiles: str, output_path: Path) -> None:
    mol = Chem.MolFromSmiles(smiles)
    mol = Chem.AddHs(mol)
    AllChem.EmbedMolecule(mol)
    w = Chem.SDWriter(output_path.with_suffix(".sdf"))
    w.write(mol)
    w.close()

    subprocess.run(["mk_prepare_ligand.py", "-i", output_path.with_suffix(".sdf"), "-o", output_path])

def dock(receptor_path, ligand_path, box_path, num_modes: int) -> None:
    # vina --receptor 3new_model_0_receptor.pdbqt --ligand ligand.pdbqt --config 3new_model_0_receptor.box.txt
    subprocess.run(["vina", "--receptor", receptor_path, "--ligand", ligand_path, "--config", box_path, "--num_modes", str(num_modes)])


def write_pdb(receptor_path, ligand_path, complex_path) -> None:
    subprocess.run(["pymol", "-cq", Path("hackathon/merge_complex.py"), "--", receptor_path, ligand_path, complex_path])
    

def prepare_and_dock(
    pdb_path, receptor_output_name, ligand_output_path, smiles, center, box_size=(20, 20, 20), num_modes: int = 3
) -> list[(Path, float)]:
    receptor_path, box_path = create_receptor_and_box(
        pdb_path, receptor_output_name, center, box_size
    )
    create_conformer(smiles, ligand_output_path)
    dock(receptor_path, ligand_output_path, box_path, num_modes)
    docked_ligand_path = ligand_output_path.with_name(f"{ligand_output_path.stem}_out.pdbqt")
    scores = []
    for line in docked_ligand_path.open("r"):
        if not "REMARK VINA RESULT" in line:
            continue
        scores.append(float(line.replace("REMARK VINA RESULT:","").strip().split()[0]))
    complex_name = ligand_output_path.with_name(ligand_output_path.stem.replace("ligand", "complex"))
    write_pdb(receptor_path, docked_ligand_path, complex_name)
    complexes = [complex_name.with_name(f"{complex_name.name}_model_{i}.pdb") for i in range(1, num_modes+1)]
    for complex in complexes:
        text = complex.read_text()
        complex.write_text(text.replace("UNL", "LIG"))
    return list(zip(complexes, scores))


def create_args(
    input_dict: dict,
    predictions_dir: Path,
    output_dir: Path,
    center: tuple[float, float, float],
    box_size=(20, 20, 20),
    ground_truth: bool = False,
) -> tuple:
    datapoint_id = input_dict["datapoint_id"]
    pdb_path = predictions_dir / datapoint_id / "model_0.pdb"
    if ground_truth:
        pdb_code = datapoint_id.split("_", maxsplit=1)[0].lower()
        pdb_path = Path("hackathon_data") / "datasets" / "asos_public" / "ground_truth" / f"{pdb_code}_chain_subset.cif"
    return (
        pdb_path,
        output_dir / f"{datapoint_id}_receptor",
        output_dir / f"{datapoint_id}_ligand.pdbqt",
        input_dict["ligands"][0]["smiles"],
        center,
        box_size,
    )

def main():
    
    output_dir = Path("my_docking_results")
    output_dir.mkdir(exist_ok=True)
    
    ground_truth_pockets = json.loads(Path("ground_truth_pockets.json").read_text())
    
    with Path("hackathon_data/datasets/asos_public/asos_public.jsonl").open("r") as f:
        for line in f:
            data = json.loads(line)
            datapoint_id = data["datapoint_id"]
            center = ground_truth_pockets[datapoint_id]["center"]
            prepare_and_dock(
                *create_args(
                    data,
                    Path("my_predictions"),
                    output_dir,
                    center,
                    ground_truth=True
                )
            )

if __name__ == "__main__":
    main()
