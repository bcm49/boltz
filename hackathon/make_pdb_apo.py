from pymol import cmd
from pathlib import Path
import sys

def make_pdb_apo(pdb_path: Path):
    cmd.load(pdb_path, "system")
    cmd.save(pdb_path, "polymer")

make_pdb_apo(sys.argv[1])