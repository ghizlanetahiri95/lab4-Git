
#!/bin/bash

# Número de alumno
alumno_number=30

# Obtener la ruta completa de los archivos en el directorio actual
files=$(ls /home/alumno30/lab4_git/*.fastq)

# Iterar sobre cada fichero y cortar la parte superior según la proporción
for file in $files; do
    # Obtener el nombre del archivo sin la ruta
    file_name=$(basename $file)

    # Nombre del nuevo fichero con la parte superior cortada
    new_file="/home/alumno30/lab4_git/cut_${file_name}"

    # Calcular el número de líneas a cortar y redondear hacia abajo
    lines_to_cut=$(echo "$(wc -l $file | awk '{print int($1 * $alumno_number)}')" | bc)

    # Cortar y guardar la parte superior en el nuevo fichero
    head -n $lines_to_cut $file > $new_file

    echo "Archivo $file_name cortado y guardado en $new_file"
done



