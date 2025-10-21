import json
import jsonlines
import os
import numpy as np

def get_ligand_coords_from_cif(cif_path, ligand_ccd):
    """
    Parses a CIF file and extracts the coordinates of a specific ligand.

    Args:
        cif_path (str): Path to the .cif structure file.
        ligand_ccd (str): The CCD/residue name of the ligand (e.g., '76A').

    Returns:
        numpy.ndarray: An array of the ligand's atomic coordinates, or None if not found.
    """
    coords = []
    try:
        with open(cif_path, 'r') as f:
            for line in f:
                if line.startswith('HETATM') and ligand_ccd in line:
                    parts = line.split()
                    try:
                        # Try mmCIF format first (coordinates usually at indices 10, 11, 12)
                        # Format: HETATM atom# atom_type . residue chain ? res# ? x y z occupancy b-factor ...
                        if len(parts) >= 13:
                            x, y, z = float(parts[10]), float(parts[11]), float(parts[12])
                        # Fallback to PDB-like format
                        elif len(parts) >= 9:
                            x, y, z = float(parts[6]), float(parts[7]), float(parts[8])
                        else:
                            continue
                        
                        coords.append([x, y, z])
                    except (ValueError, IndexError):
                        print(f"      Warning: Could not parse line: {line.strip()}")
                        continue
        
        if not coords:
            return None
            
        return np.array(coords)

    except FileNotFoundError:
        print(f"      ERROR: File not found: {cif_path}")
        return None
    except Exception as e:
        print(f"      ERROR reading file: {e}")
        return None


def main():
    dataset_file = 'hackathon_data/datasets/asos_public/asos_public.jsonl'
    ground_truth_dir = 'hackathon_data/datasets/asos_public/ground_truth'
    output_path = 'hackathon/asos_ground_truth_pockets.json'
    
    # Ensure output directory exists
    os.makedirs('hackathon', exist_ok=True)
    
    ground_truth_pockets = {}
    total_count = 0
    success_count = 0

    print("="*70)
    print("ASOS Ground Truth Pocket Center Calculation")
    print("="*70)
    print(f"Reading dataset from: {dataset_file}")
    print(f"Ground truth CIF files in: {ground_truth_dir}\n")
    
    with jsonlines.open(dataset_file) as reader:
        for datapoint in reader:
            total_count += 1
            
            # Extract data using correct keys
            datapoint_id = datapoint['datapoint_id']
            cif_filename = datapoint['ground_truth']['structure']
            cif_path = os.path.join(ground_truth_dir, cif_filename)
            
            # Get ligand CCD code (e.g., '76A')
            ligand_types = datapoint['ground_truth']['ligand_types']
            if not ligand_types:
                print(f"[{total_count}] {datapoint_id}: No ligand types found")
                continue
                
            # Use first ligand (could extend to handle multiple)
            ligand_ccd = ligand_types[0]['ccd']
            ligand_type = ligand_types[0]['type']  # orthosteric or allosteric
            
            print(f"[{total_count}] Processing {datapoint_id}")
            print(f"    Ligand: {ligand_ccd} ({ligand_type})")
            print(f"    CIF file: {cif_filename}")

            # Check if file exists
            if not os.path.exists(cif_path):
                print(f"    ❌ CIF file not found: {cif_path}")
                continue

            ligand_coords = get_ligand_coords_from_cif(cif_path, ligand_ccd)

            if ligand_coords is not None and ligand_coords.shape[0] > 0:
                # Calculate the geometric center (centroid) of the ligand
                center = np.mean(ligand_coords, axis=0)
                
                # Calculate bounding box for reference
                min_coords = np.min(ligand_coords, axis=0)
                max_coords = np.max(ligand_coords, axis=0)
                dimensions = max_coords - min_coords
                
                ground_truth_pockets[datapoint_id] = {
                    'center': center.tolist(),
                    'ligand_ccd': ligand_ccd,
                    'ligand_type': ligand_type,
                    'num_atoms': len(ligand_coords),
                    'dimensions': dimensions.tolist(),
                    'cif_file': cif_filename
                }
                success_count += 1
                print(f"    ✅ Center: [{center[0]:7.3f}, {center[1]:7.3f}, {center[2]:7.3f}]")
                print(f"       Atoms: {len(ligand_coords)}, Dimensions: [{dimensions[0]:.1f}, {dimensions[1]:.1f}, {dimensions[2]:.1f}] Å\n")
            else:
                print(f"    ❌ Failed to find coordinates for ligand '{ligand_ccd}'\n")

    # Save the final dictionary to a JSON file
    with open(output_path, 'w') as f:
        json.dump(ground_truth_pockets, f, indent=2)
    
    print("="*70)
    print("RESULTS SUMMARY")
    print("="*70)
    print(f"Total datapoints: {total_count}")
    print(f"Successfully processed: {success_count}/{total_count}")
    print(f"Results saved to: {output_path}")
    
    # Show a sample entry
    if ground_truth_pockets:
        sample_id = list(ground_truth_pockets.keys())[0]
        print(f"\nSample entry ({sample_id}):")
        print(json.dumps(ground_truth_pockets[sample_id], indent=2))

if __name__ == "__main__":
    main()

