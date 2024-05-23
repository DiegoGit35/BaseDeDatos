# uso: ./alta_prestamo.sh cod_socio id_libro

echo "ingrese el codigo del socio: "
read cod_socio
echo "ingrese el id del libro: "
read id_libro

libroDisponible=$(sqlite3 biblioteca.db "select * from libro where id_ejemplar = $id_libro and disponibilidad like 'Disponible'")
echo "disponibilidad libro $libroDisponible"
if [ -z "$libroDisponible" ]; then
    echo "el libro no está disponible"
else
    idPrestamo=$(sqlite3 biblioteca.db "select id_prestamo from prestamo where cod_socio = $cod_socio and id_estado like 'PENDIENTE'")

    if [ -z "$idPrestamo" ]; then
        $(sqlite3 biblioteca.db "INSERT INTO prestamo (cod_socio) VALUES ('$cod_socio')")
        idPrestamo=$(sqlite3 biblioteca.db "select id_prestamo from prestamo where cod_socio = $cod_socio and id_estado like 'PENDIENTE'")
        $(sqlite3 biblioteca.db "INSERT INTO item_libro_en_prestamo (id_libro, id_prestamo) VALUES ($id_libro, $idPrestamo)")
        $(sqlite3 biblioteca.db "UPDATE libro set disponibilidad='En prestamo' where id_ejemplar = $id_libro")
    else
      CantPrestamos=$(sqlite3 biblioteca.db "select count(id_item) from item_libro_en_prestamo where id_prestamo = $idPrestamo AND fecha_devolucion IS NULL")
      #echo "el socio tiene $CantPrestamos prestamos anteriores"
        if [ $CantPrestamos -gt 2 ]; then
            echo "el socio alcanzo el maximo de prestamos simultaneos"
        else
          idPrestamo=$(sqlite3 biblioteca.db "select id_prestamo from prestamo where cod_socio = $cod_socio and id_estado like 'PENDIENTE'")
          $(sqlite3 biblioteca.db "INSERT INTO item_libro_en_prestamo (id_libro, id_prestamo) VALUES ($id_libro, $idPrestamo)")
        $(sqlite3 biblioteca.db "UPDATE libro set disponibilidad='En prestamo' where id_ejemplar = $id_libro")
        fi
    fi
sqlite3 biblioteca.db <<EOF
.mode table
.headers on
SELECT * FROM item_libro_en_prestamo WHERE id_prestamo = $idPrestamo;
EOF
fi


