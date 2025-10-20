import subprocess
import os

# Define the input PDB file
input_pdb = ".pdb"

# Check if the PDB file exists
if not os.path.exists(input_pdb):
    raise FileNotFoundError(f"Input PDB file not found: {input_pdb}")

# Construct the fpocket command.
# The "-f" flag specifies the input file.
command = ["fpocket", "-f", input_pdb]

# Run the command and capture the output
try:
    print(f"Running fpocket on {input_pdb}...")
    result = subprocess.run(command, capture_output=True, text=True, check=True)
    print("fpocket run complete.")
    # You can print the standard output if needed
    # print(result.stdout)
except subprocess.CalledProcessError as e:
    print(f"An error occurred while running fpocket: {e}")
    print(f"fpocket stderr: {e.stderr}")
except Exception as e:
    print(f"An unexpected error occurred: {e}")
