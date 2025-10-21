"""
file passed to pqr_to_coordinates_center should be the pocket{i}_vert.pqr file in model_0_out/pockets after running fpocket -f model_0.pdb
model_0.pdb comes from boltz prediction of {protein_ligand_ID}.cif
"""

from pathlib import Path

def pqr_to_coordinates_center(file: Path) -> tuple[float, float, float]:
    input_file = file
    coordinates = []
    x_sum, y_sum, z_sum = 0, 0, 0
    with open(input_file, "r") as f:
        for line in f:
            if line.startswith("ATOM") or line.startswith("HETATM"):
                parts = line.split()
                # parts[5] = X, parts[6] = Y, parts[7] = Z
                x = float(parts[5])
                y = float(parts[6])
                z = float(parts[7])
                coordinates.append((x, y, z))
                x_sum += x
                y_sum += y
                z_sum += z

    x_mean = x_sum/len(coordinates)
    y_mean = y_sum/len(coordinates)
    z_mean = z_sum/len(coordinates)
    return (x_mean, y_mean, z_mean)


def main():
    import sys
    n = int(sys.argv[1])
    for i in range(1, n+1):
        coordinates = pqr_to_coordinates_center(f"pocket{i}_vert.pqr")
        print(coordinates)


if __name__ == "__main__":
    main()