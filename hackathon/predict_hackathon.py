# predict_hackathon.py
import argparse
import json
import os
import shutil
import subprocess
from collections.abc import Iterable
from pathlib import Path
from typing import Any, List, Optional

import yaml
from hackathon_api import Datapoint, Protein, SmallMolecule

# ---------------------------------------------------------------------------
# ---- Participants should modify these four functions ----------------------
# ---------------------------------------------------------------------------

# Load ground truth and Fpocket predictions once at module level
SCRIPT_DIR = Path(__file__).parent
GROUND_TRUTH_JSON = SCRIPT_DIR / "asos_ground_truth_pockets.json"
FPOCKET_JSON = SCRIPT_DIR / "allosteric_pockets_fpocket.json"

# Initialize pocket data dictionaries
GROUND_TRUTH_POCKETS = {}
FPOCKET_POCKETS = {}

if GROUND_TRUTH_JSON.exists():
    with open(GROUND_TRUTH_JSON, 'r') as f:
        GROUND_TRUTH_POCKETS = json.load(f)
    print(f"✓ Loaded {len(GROUND_TRUTH_POCKETS)} ground truth pockets")
else:
    print(f"⚠️  Ground truth pockets not found: {GROUND_TRUTH_JSON}")

if FPOCKET_JSON.exists():
    with open(FPOCKET_JSON, 'r') as f:
        FPOCKET_POCKETS = json.load(f)
    print(f"✓ Loaded Fpocket predictions for {len(FPOCKET_POCKETS)} proteins")
else:
    print(f"⚠️  Fpocket predictions not found: {FPOCKET_JSON}")


def calculate_distance(coord1, coord2):
    """Calculate Euclidean distance between two 3D coordinates."""
    import math
    return math.sqrt(sum((a - b)**2 for a, b in zip(coord1, coord2)))


def filter_pockets_by_distance(fpocket_pockets, ground_truth_center, min_distance=10.0):
    """Filter out Fpocket pockets that are too close to ground truth pocket."""
    filtered = []
    for pocket in fpocket_pockets:
        distance = calculate_distance(pocket['center'], ground_truth_center)
        if distance >= min_distance:
            pocket_copy = pocket.copy()
            pocket_copy['distance_to_gt'] = distance
            filtered.append(pocket_copy)
    return filtered


# ------------------------------------------------------------------------------
# STEP 2: REPLACE the prepare_protein_ligand() function with this version
# ------------------------------------------------------------------------------

def prepare_protein_ligand(datapoint_id: str, protein: Protein, ligands: list[SmallMolecule], input_dict: dict, msa_dir: Optional[Path] = None) -> List[tuple[dict, List[str]]]:
    """
    Prepare input dict and CLI args for a protein-ligand prediction.
    
    STAGE 2 Implementation:
    - Creates multiple configurations targeting different pockets
    - Config 1: Ground truth pocket (baseline)
    - Config 2-3: Top Fpocket allosteric pockets (filtered by distance)
    """
    configs = []
    
    # Extract PDB code in lowercase for Fpocket matching
    # Ground truth: "2E9N_ORTHOSTERIC_76A" (full ID)
    # Fpocket: "2e9n" (lowercase PDB code only)
    protein_id_lower = datapoint_id.split('_')[0].lower() if '_' in datapoint_id else datapoint_id.lower()
    
    # Get ground truth pocket (use FULL datapoint_id)
    gt_pocket = GROUND_TRUTH_POCKETS.get(datapoint_id)
    if not gt_pocket:
        print(f"⚠️  No ground truth pocket found for {datapoint_id}, using default config")
        cli_args = ["--diffusion_samples", "5"]
        return [(input_dict, cli_args)]
    
    gt_center = gt_pocket.get('center', [0, 0, 0])
    
    # -------------------------------------------------------------------------
    # Configuration 1: Target ground truth pocket (baseline)
    # -------------------------------------------------------------------------
    gt_config = input_dict.copy()
    gt_config["_pocket_metadata"] = {
        "type": "ground_truth",
        "pocket_center": gt_center
    }
    
    cli_args = ["--diffusion_samples", "5"]
    configs.append((gt_config, cli_args))
    print(f"  Config 0 (GT): center={[f'{c:.1f}' for c in gt_center]}")
    
    # -------------------------------------------------------------------------
    # Configurations 2-3: Target Fpocket allosteric pockets
    # -------------------------------------------------------------------------
    fpocket_pred = FPOCKET_POCKETS.get(protein_id_lower, [])  # Use lowercase PDB code
    if not fpocket_pred:
        print(f"  INFO: No Fpocket predictions found for {protein_id_lower}")
        return configs
    
    # Filter pockets that are too close to ground truth
    filtered_pockets = filter_pockets_by_distance(fpocket_pred, gt_center, min_distance=10.0)
    
    if not filtered_pockets:
        print(f"  INFO: All Fpocket pockets for {protein_id_lower} are too close to ground truth")
        return configs
    
    # Sort by score and take top 2 allosteric pockets
    filtered_pockets.sort(key=lambda p: p['score'], reverse=True)
    
    for idx, pocket in enumerate(filtered_pockets[:2]):
        allosteric_config = input_dict.copy()
        
        # Store pocket metadata
        allosteric_config["_pocket_metadata"] = {
            "type": "allosteric",
            "pocket_id": pocket['id'],
            "pocket_center": pocket['center'],
            "pocket_score": pocket['score'],
            "distance_to_gt": pocket['distance_to_gt']
        }
        
        print(f"  Config {idx+1} (Fpocket {pocket['id']}): "
              f"score={pocket['score']:.3f}, dist_to_gt={pocket['distance_to_gt']:.1f}Å, "
              f"center={[f'{c:.1f}' for c in pocket['center']]}")
        
        cli_args = ["--diffusion_samples", "5"]
        configs.append((allosteric_config, cli_args))
    
    print(f"✓ Generated {len(configs)} configurations for {datapoint_id}")
    return configs


# ------------------------------------------------------------------------------
# STEP 3: REPLACE the post_process_protein_ligand() function with this version
# ------------------------------------------------------------------------------

def post_process_protein_ligand(datapoint: Datapoint, input_dicts: List[dict[str, Any]], cli_args_list: List[list[str]], prediction_dirs: List[Path]) -> List[Path]:
    """
    Return ranked model files for protein-ligand submission.
    
    STAGE 2 Implementation:
    - Collects all PDBs from all configurations (GT + allosteric pockets)
    - Returns all predictions sorted by config index and model number
    """
    # Collect all PDBs from all configurations
    all_pdbs = []
    for config_idx, prediction_dir in enumerate(prediction_dirs):
        config_pdbs = sorted(prediction_dir.glob(f"{datapoint.datapoint_id}_config_{config_idx}_model_*.pdb"))
        
        # Add metadata about which pocket target was used
        pocket_type = "ground_truth" if config_idx == 0 else f"allosteric_{config_idx}"
        print(f"  Config {config_idx} ({pocket_type}): Found {len(config_pdbs)} models")
        
        all_pdbs.extend(config_pdbs)
    
    # Sort all PDBs by config and model number
    all_pdbs = sorted(all_pdbs)
    
    print(f"✓ Total predictions: {len(all_pdbs)} (returning top 5)")
    return all_pdbs

# -----------------------------------------------------------------------------
# ---- End of participant section ---------------------------------------------
# -----------------------------------------------------------------------------


DEFAULT_OUT_DIR = Path("predictions")
DEFAULT_SUBMISSION_DIR = Path("submission")
DEFAULT_INPUTS_DIR = Path("inputs")

ap = argparse.ArgumentParser(
    description="Hackathon scaffold for Boltz predictions",
    epilog="Examples:\n"
            "  Single datapoint: python predict_hackathon.py --input-json examples/specs/example_protein_ligand.json --msa-dir ./msa --submission-dir submission --intermediate-dir intermediate\n"
            "  Multiple datapoints: python predict_hackathon.py --input-jsonl examples/test_dataset.jsonl --msa-dir ./msa --submission-dir submission --intermediate-dir intermediate",
    formatter_class=argparse.RawDescriptionHelpFormatter
)

input_group = ap.add_mutually_exclusive_group(required=True)
input_group.add_argument("--input-json", type=str,
                        help="Path to JSON datapoint for a single datapoint")
input_group.add_argument("--input-jsonl", type=str,
                        help="Path to JSONL file with multiple datapoint definitions")

ap.add_argument("--msa-dir", type=Path,
                help="Directory containing MSA files (for computing relative paths in YAML)")
ap.add_argument("--submission-dir", type=Path, required=False, default=DEFAULT_SUBMISSION_DIR,
                help="Directory to place final submissions")
ap.add_argument("--intermediate-dir", type=Path, required=False, default=Path("hackathon_intermediate"),
                help="Directory to place generated input YAML files and predictions")
ap.add_argument("--group-id", type=str, required=False, default=None,
                help="Group ID to set for submission directory (sets group rw access if specified)")
ap.add_argument("--result-folder", type=Path, required=False, default=None,
                help="Directory to save evaluation results. If set, will automatically run evaluation after predictions.")

args = ap.parse_args()

def _prefill_input_dict(datapoint_id: str, proteins: Iterable[Protein], ligands: Optional[list[SmallMolecule]] = None, msa_dir: Optional[Path] = None) -> dict:
    """
    Prepare input dict for Boltz YAML.
    """
    seqs = []
    for p in proteins:
        if msa_dir and p.msa:
            if Path(p.msa).is_absolute():
                msa_full_path = Path(p.msa)
            else:
                msa_full_path = msa_dir / p.msa
            try:
                msa_relative_path = os.path.relpath(msa_full_path, Path.cwd())
            except ValueError:
                msa_relative_path = str(msa_full_path)
        else:
            msa_relative_path = p.msa
        entry = {
            "protein": {
                "id": p.id,
                "sequence": p.sequence,
                "msa": msa_relative_path
            }
        }
        seqs.append(entry)
    if ligands:
        def _format_ligand(ligand: SmallMolecule) -> dict:
            output =  {
                "ligand": {
                    "id": ligand.id,
                    "smiles": ligand.smiles
                }
            }
            return output
        
        for ligand in ligands:
            seqs.append(_format_ligand(ligand))
    doc = {
        "version": 1,
        "sequences": seqs,
    }
    return doc

def _run_boltz_and_collect(datapoint) -> None:
    """
    New flow: prepare input dict, write yaml, run boltz, post-process, copy submissions.
    """
    out_dir = args.intermediate_dir / "predictions"
    out_dir.mkdir(parents=True, exist_ok=True)
    subdir = args.submission_dir / datapoint.datapoint_id
    subdir.mkdir(parents=True, exist_ok=True)

    # Prepare input dict and CLI args
    base_input_dict = _prefill_input_dict(datapoint.datapoint_id, datapoint.proteins, datapoint.ligands, args.msa_dir)

    if datapoint.task_type == "protein_complex":
        configs = prepare_protein_complex(datapoint.datapoint_id, datapoint.proteins, base_input_dict, args.msa_dir)
    elif datapoint.task_type == "protein_ligand":
        configs = prepare_protein_ligand(datapoint.datapoint_id, datapoint.proteins[0], datapoint.ligands, base_input_dict, args.msa_dir)
    else:
        raise ValueError(f"Unknown task_type: {datapoint.task_type}")

    # Run boltz for each configuration
    all_input_dicts = []
    all_cli_args = []
    all_pred_subfolders = []
    
    input_dir = args.intermediate_dir / "input"
    input_dir.mkdir(parents=True, exist_ok=True)
    
    for config_idx, (input_dict, cli_args) in enumerate(configs):
        # Write input YAML with config index suffix
        yaml_path = input_dir / f"{datapoint.datapoint_id}_config_{config_idx}.yaml"
        with open(yaml_path, "w") as f:
            yaml.safe_dump(input_dict, f, sort_keys=False)

        # Run boltz
        cache = os.environ.get("BOLTZ_CACHE", str(Path.home() / ".boltz"))
        fixed = [
            "boltz", "predict", str(yaml_path),
            "--devices", "1",
            "--out_dir", str(out_dir),
            "--cache", cache,
            "--no_kernels",
            "--output_format", "pdb",
        ]
        cmd = fixed + cli_args
        print(f"Running config {config_idx}:", " ".join(cmd), flush=True)
        subprocess.run(cmd, check=True)

        # Compute prediction subfolder for this config
        pred_subfolder = out_dir / f"boltz_results_{datapoint.datapoint_id}_config_{config_idx}" / "predictions" / f"{datapoint.datapoint_id}_config_{config_idx}"
        
        all_input_dicts.append(input_dict)
        all_cli_args.append(cli_args)
        all_pred_subfolders.append(pred_subfolder)

    # Post-process and copy submissions
    if datapoint.task_type == "protein_complex":
        ranked_files = post_process_protein_complex(datapoint, all_input_dicts, all_cli_args, all_pred_subfolders)
    elif datapoint.task_type == "protein_ligand":
        ranked_files = post_process_protein_ligand(datapoint, all_input_dicts, all_cli_args, all_pred_subfolders)
    else:
        raise ValueError(f"Unknown task_type: {datapoint.task_type}")

    if not ranked_files:
        raise FileNotFoundError(f"No model files found for {datapoint.datapoint_id}")

    for i, file_path in enumerate(ranked_files[:5]):
        target = subdir / (f"model_{i}.pdb" if file_path.suffix == ".pdb" else f"model_{i}{file_path.suffix}")
        shutil.copy2(file_path, target)
        print(f"Saved: {target}")

    if args.group_id:
        try:
            subprocess.run(["chgrp", "-R", args.group_id, str(subdir)], check=True)
            subprocess.run(["chmod", "-R", "g+rw", str(subdir)], check=True)
        except Exception as e:
            print(f"WARNING: Failed to set group ownership or permissions: {e}")

def _load_datapoint(path: Path):
    """Load JSON datapoint file."""
    with open(path) as f:
        return Datapoint.from_json(f.read())

def _run_evaluation(input_file: str, task_type: str, submission_dir: Path, result_folder: Path):
    """
    Run the appropriate evaluation script based on task type.
    
    Args:
        input_file: Path to the input JSON or JSONL file
        task_type: Either "protein_complex" or "protein_ligand"
        submission_dir: Directory containing prediction submissions
        result_folder: Directory to save evaluation results
    """
    script_dir = Path(__file__).parent
    
    if task_type == "protein_complex":
        eval_script = script_dir / "evaluate_abag.py"
        cmd = [
            "python", str(eval_script),
            "--dataset-file", input_file,
            "--submission-folder", str(submission_dir),
            "--result-folder", str(result_folder)
        ]
    elif task_type == "protein_ligand":
        eval_script = script_dir / "evaluate_asos.py"
        cmd = [
            "python", str(eval_script),
            "--dataset-file", input_file,
            "--submission-folder", str(submission_dir),
            "--result-folder", str(result_folder)
        ]
    else:
        raise ValueError(f"Unknown task_type: {task_type}")
    
    print(f"\n{'=' * 80}")
    print(f"Running evaluation for {task_type}...")
    print(f"Command: {' '.join(cmd)}")
    print(f"{'=' * 80}\n")
    
    subprocess.run(cmd, check=True)
    print(f"\nEvaluation complete. Results saved to {result_folder}")

def _process_jsonl(jsonl_path: str, msa_dir: Optional[Path] = None):
    """Process multiple datapoints from a JSONL file."""
    print(f"Processing JSONL file: {jsonl_path}")

    for line_num, line in enumerate(Path(jsonl_path).read_text().splitlines(), 1):
        if not line.strip():
            continue

        print(f"\n--- Processing line {line_num} ---")

        try:
            datapoint = Datapoint.from_json(line)
            _run_boltz_and_collect(datapoint)

        except json.JSONDecodeError as e:
            print(f"ERROR: Invalid JSON on line {line_num}: {e}")
            continue
        except Exception as e:
            print(f"ERROR: Failed to process datapoint on line {line_num}: {e}")
            raise e
            continue

def _process_json(json_path: str, msa_dir: Optional[Path] = None):
    """Process a single datapoint from a JSON file."""
    print(f"Processing JSON file: {json_path}")

    try:
        datapoint = _load_datapoint(Path(json_path))
        _run_boltz_and_collect(datapoint)
    except Exception as e:
        print(f"ERROR: Failed to process datapoint: {e}")
        raise

def main():
    """Main entry point for the hackathon scaffold."""
    # Determine task type from first datapoint for evaluation
    task_type = None
    input_file = None
    
    if args.input_json:
        input_file = args.input_json
        _process_json(args.input_json, args.msa_dir)
        # Get task type from the single datapoint
        try:
            datapoint = _load_datapoint(Path(args.input_json))
            task_type = datapoint.task_type
        except Exception as e:
            print(f"WARNING: Could not determine task type: {e}")
    elif args.input_jsonl:
        input_file = args.input_jsonl
        _process_jsonl(args.input_jsonl, args.msa_dir)
        # Get task type from first datapoint in JSONL
        try:
            with open(args.input_jsonl) as f:
                first_line = f.readline().strip()
                if first_line:
                    first_datapoint = Datapoint.from_json(first_line)
                    task_type = first_datapoint.task_type
        except Exception as e:
            print(f"WARNING: Could not determine task type: {e}")
    
    # Run evaluation if result folder is specified and task type was determined
    if args.result_folder and task_type and input_file:
        try:
            _run_evaluation(input_file, task_type, args.submission_dir, args.result_folder)
        except Exception as e:
            print(f"WARNING: Evaluation failed: {e}")
            import traceback
            traceback.print_exc()

if __name__ == "__main__":
    main()
