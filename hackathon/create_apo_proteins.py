import os
import subprocess
import json
import re
import shutil
import glob

def check_fpocket_installed():
    """Check if fpocket is installed and available in PATH."""
    if shutil.which("fpocket") is None:
        print("ERROR: fpocket is not installed or not in your PATH.")
        print("Please install it:")
        print("  conda install -c bioconda fpocket")
        return False
    return True


def parse_fpocket_output(info_file_path):
    """
    Parse Fpocket info.txt output file and extract pocket scores.
    Then get coordinates from the pockets PQR file.
    
    Returns:
        List of dicts with pocket info sorted by score (best first)
    """
    pockets = []
    try:
        with open(info_file_path, 'r') as f:
            content = f.read()
        
        # Find all pocket blocks with scores
        # Pattern captures: pocket_id, score
        pattern = r'Pocket\s+(\d+)\s+:.*?Score\s+:\s+([\d.]+)'
        matches = re.findall(pattern, content, re.DOTALL)
        
        # Get the pockets directory
        output_dir = os.path.dirname(info_file_path)
        pockets_pqr = os.path.join(output_dir, os.path.basename(info_file_path).replace('_info.txt', '_pockets.pqr'))
        
        # Read pocket centers from the PQR file
        pocket_centers = {}
        if os.path.exists(pockets_pqr):
            with open(pockets_pqr, 'r') as f:
                for line in f:
                    if line.startswith('ATOM') and 'STP' in line:  # Alpha spheres
                        parts = line.split()
                        if len(parts) >= 11:
                            res_num = int(parts[5])  # Pocket ID is in residue number
                            x, y, z = float(parts[6]), float(parts[7]), float(parts[8])
                            if res_num not in pocket_centers:
                                pocket_centers[res_num] = []
                            pocket_centers[res_num].append([x, y, z])
        
        for match in matches:
            pocket_id = int(match[0])
            score = float(match[1])
            
            # Calculate center as mean of all alpha spheres for this pocket
            if pocket_id in pocket_centers and pocket_centers[pocket_id]:
                coords = pocket_centers[pocket_id]
                center = [
                    sum(c[0] for c in coords) / len(coords),
                    sum(c[1] for c in coords) / len(coords),
                    sum(c[2] for c in coords) / len(coords)
                ]
            else:
                center = [0.0, 0.0, 0.0]  # Fallback
            
            pockets.append({
                'id': pocket_id,
                'score': score,
                'center': center
            })
        
        # Sort by score (highest first - best pockets)
        pockets.sort(key=lambda p: p['score'], reverse=True)
            
    except FileNotFoundError:
        print(f"      ERROR: File not found: {info_file_path}")
    except Exception as e:
        print(f"      ERROR parsing {info_file_path}: {e}")
        
    return pockets


def run_fpocket_on_apo_proteins(apo_dir, output_json, top_n_pockets=5):
    """
    Run Fpocket on all apo protein structures to find allosteric sites.
    
    Args:
        apo_dir: Directory containing apo protein PDB files
        output_json: Path to save fpocket results
        top_n_pockets: Number of top pockets to keep per protein
    """
    print("="*70)
    print("Finding Allosteric Pockets with Fpocket")
    print("="*70)
    print(f"Input directory: {apo_dir}")
    print(f"Output file: {output_json}")
    print(f"Keeping top {top_n_pockets} pockets per protein\n")
    
    # Check fpocket installation
    if not check_fpocket_installed():
        return
    
    # Find all apo PDB files
    apo_files = glob.glob(os.path.join(apo_dir, "*_apo.pdb"))
    
    if not apo_files:
        print(f"ERROR: No apo PDB files found in {apo_dir}")
        print("Please run create_apo_proteins.py first!")
        return
    
    print(f"Found {len(apo_files)} apo protein files\n")
    
    all_pockets = {}
    successful = 0
    failed = 0
    
    for apo_file in sorted(apo_files):
        basename = os.path.basename(apo_file)
        protein_id = basename.replace('_apo.pdb', '')
        
        print(f"[{successful + failed + 1}/{len(apo_files)}] Running Fpocket on {basename}")
        
        try:
            # Run Fpocket - change to the file's directory first so output goes there
            file_dir = os.path.dirname(os.path.abspath(apo_file))
            result = subprocess.run(
                ['fpocket', '-f', os.path.basename(apo_file)],
                cwd=file_dir,  # Run fpocket IN the apo_proteins_pdb directory
                capture_output=True,
                text=True
            )
            
            # Debug: Show fpocket output for first protein or if it failed
            if (successful + failed == 0) or result.returncode != 0:
                print(f"  🔍 Fpocket return code: {result.returncode}")
                if result.stdout:
                    print(f"     STDOUT:\n{result.stdout}")
                if result.stderr:
                    print(f"     STDERR:\n{result.stderr}")
            
            # Define fpocket output paths - will be in same dir as input file
            base_name = os.path.basename(apo_file).replace('.pdb', '')
            file_dir = os.path.dirname(os.path.abspath(apo_file))
            output_dir = os.path.join(file_dir, f"{base_name}_out")
            info_file = os.path.join(output_dir, f"{base_name}_info.txt")
            
            # Debug: List all files/dirs created (for first file only)
            if successful + failed == 0:
                print(f"  🔍 Looking for: {output_dir}")
                print(f"  🔍 Current directory contents matching *_out:")
                out_dirs = glob.glob("*_out")
                print(f"     {out_dirs if out_dirs else 'None found'}")
                print(f"  🔍 Current directory contents matching {base_name}*:")
                matching = glob.glob(f"{base_name}*")
                print(f"     {matching if matching else 'None found'}")
            
            if os.path.exists(info_file):
                pockets = parse_fpocket_output(info_file)
                
                if pockets:
                    # Keep only top N pockets
                    top_pockets = pockets[:top_n_pockets]
                    all_pockets[protein_id] = top_pockets
                    successful += 1
                    
                    scores_str = ", ".join([f"{p['score']:.2f}" for p in top_pockets])
                    print(f"  ✅ Found {len(pockets)} pockets (keeping top {len(top_pockets)})")
                    print(f"     Top pocket scores: [{scores_str}]")
                    print(f"     Top pocket center: [{top_pockets[0]['center'][0]:.3f}, "
                          f"{top_pockets[0]['center'][1]:.3f}, {top_pockets[0]['center'][2]:.3f}]\n")
                else:
                    print("  ⚠️  No pockets found\n")
                    failed += 1
                
                # Cleanup fpocket output directory to save space
                if os.path.exists(output_dir):
                    shutil.rmtree(output_dir)
            else:
                print(f"  ❌ Fpocket output not found: {info_file}")
                # Check what files were actually created
                if os.path.exists(output_dir):
                    files = os.listdir(output_dir)
                    print(f"     Found directory but with files: {files[:5]}\n")
                else:
                    print(f"     Directory doesn't exist: {output_dir}\n")
                failed += 1
                
        except subprocess.CalledProcessError as e:
            print(f"  ❌ Fpocket failed: {e.stderr}\n")
            failed += 1
        except Exception as e:
            print(f"  ❌ Unexpected error: {e}\n")
            failed += 1
    
    # Save results
    with open(output_json, 'w') as f:
        json.dump(all_pockets, f, indent=2)
    
    # Summary
    print("="*70)
    print("FPOCKET ANALYSIS COMPLETE")
    print("="*70)
    print(f"Total proteins: {len(apo_files)}")
    print(f"Successful: {successful}")
    print(f"Failed: {failed}")
    print(f"Results saved to: {output_json}")
    
    # Show sample
    if all_pockets:
        sample_id = list(all_pockets.keys())[0]
        print(f"\nSample entry ({sample_id}):")
        print(json.dumps(all_pockets[sample_id][:2], indent=2))  # Show top 2 pockets


def main():
    apo_dir = 'hackathon/apo_proteins_pdb'  # NEW: Use properly converted PDB files
    output_json = 'hackathon/allosteric_pockets_fpocket.json'
    
    # Check if apo directory exists
    if not os.path.exists(apo_dir):
        print(f"ERROR: Apo proteins directory not found: {apo_dir}")
        print("Please run create_apo_proteins.py first!")
        return
    
    run_fpocket_on_apo_proteins(apo_dir, output_json, top_n_pockets=5)


if __name__ == "__main__":
    main()
