# se puede dar de baja un libro que esta en prestamo?

echo "--------------------------------------------------------"
echo "|                MODIFICACIÓN DE LIBROS                |"
echo "--------------------------------------------------------"

echo "ingrese el codigo del libro: "
read idEjemplar

sqlite3 biblioteca.db <<EOF
.headers on
.mode table
select * from libro where id_ejemplar = $idEjemplar;
EOF

echo "Columna a modificar: "
read columna
echo "Nuevo valor de la columna: "
read valor

if [ "$valor" == "id_ejemplar" ]; then
    echo "no se puede modificar el codigo de libro!"
else
    estado=$(sqlite3 biblioteca.db "select disponibilidad from libro where id_ejemplar = $idEjemplar")
    if [ "$estado" == "Disponible" ]; then
        sqlite3 biblioteca.db "update libro set $columna=$valor where id_ejemplar=$idEjemplar"
    fi
fi

sqlite3 biblioteca.db <<EOF
.headers on
.mode table
select * from libro where id_ejemplar = $idEjemplar;
EOF
