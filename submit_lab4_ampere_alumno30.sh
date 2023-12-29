#!/bin/bash


#SBATCH -p hpc-bio-ampere
#SBATCH --chdir=/home/alumno30/lab4_git
#SBATCH -J submit_lab4_ampere-alumno30
#SBATCH --ntasks=4
#SBATCH --cpus-per-task=4
#SBATCH --ntasks-per-node=4
#SBATCH --output=slurm-%j.out
#SBATCH --error=%u-%j.err


# Configurar el número de hilos para OpenMP

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
echo "OMP_NUM_THREADS: $OMP_NUM_THREADS"

# Ejecutar el script con srun
time srun -n 4 -p hpc-bio-ampere ./file_cut.sh
