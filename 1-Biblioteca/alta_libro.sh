

echo "--------------------------------------------------------"
echo "|                     ALTA DE LIBROS                   |"
echo "--------------------------------------------------------"
echo "Nombre del libro:"
read titulo
echo "Año de publicacion: "
read anio
echo "Editorial: "
read editorial
#echo "Estado físico: "
#read estado_fisico
#echo "Disponibilidad: "
#read disponibilidad
#echo "Fecha registro: "
#read fecha_registro
echo "Autores: "
read autores
echo "ISBN: "
read isbn

sqlite3 biblioteca.db <<EOF
INSERT INTO libro (anio, titulo, editorial, autores, isbn) VALUES ('$anio','$titulo','$editorial','$autores','$isbn');
EOF


sqlite3 biblioteca.db <<EOF
.mode table
.headers on
SELECT * FROM libro;
EOF
