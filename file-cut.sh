#!/bin/bash

# Calcular la proporción para el alumno30
proportion=$(echo "scale=2; 1 / 30" | bc)

# Obtener el nombre de los ficheros en el directorio actual
files=$(ls *.fastq)

# Iterar sobre cada fichero y cortar la parte superior según la proporción
for file in $files; do
    # Nombre del nuevo fichero con la parte superior cortada
    new_file="cut_${file}"

    # Calcular el número de líneas a cortar
    lines_to_cut=$(echo "$(wc -l $file | awk '{print $1}') * $proportion" | bc | cut -f1 -d.)

    # Cortar y guardar la parte superior en el nuevo fichero
    head -n $lines_to_cut $file > $new_file

    echo "Archivo $file cortado y guardado en $new_file"
done
