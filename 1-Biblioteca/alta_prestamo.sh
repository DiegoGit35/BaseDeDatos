# uso: ./alta_prestamo.sh cod_socio id_libro
libroDisponible=$(sqlite3 biblioteca.db "select * from libro where id_ejemplar = $2 and disponibilidad like 'Disponible' AND fecha_baja IS NULL")
if [ -z "$libroDisponible" ]; then
    echo "el libro no está disponible"
else
    idPrestamoPendiente=$(sqlite3 biblioteca.db "select id_prestamo from prestamo where cod_socio = $1 and id_estado like 'PENDIENTE' AND fecha_baja IS NULL")

    if [ -z "$idPrestamoPendiente" ]; then
        $(sqlite3 biblioteca.db "INSERT INTO prestamo (cod_socio) VALUES ('$1')")
        idNuevoPrestamo=$(sqlite3 biblioteca.db "select id_prestamo from prestamo where cod_socio = $1 and id_estado like 'PENDIENTE'")
        $(sqlite3 biblioteca.db "INSERT INTO item_libro_en_prestamo (id_libro, id_prestamo) VALUES ($2, $idNuevoPrestamo)")
        $(sqlite3 biblioteca.db "UPDATE libro set disponibilidad='En prestamo' where id_ejemplar = $2")
    else
      CantPrestamos=$(sqlite3 biblioteca.db "select count(id_item) from item_libro_en_prestamo where id_prestamo = $idPrestamoPendiente")
      echo "$CantPrestamos"
        if [ $CantPrestamos -gt 2 ]; then
            echo "el socio alcanzo el maximo de prestamos simultaneos"
        else
          idPrestamoPendiente=$(sqlite3 biblioteca.db "select id_prestamo from prestamo where cod_socio = $1 and id_estado like 'PENDIENTE'")
          $(sqlite3 biblioteca.db "INSERT INTO item_libro_en_prestamo (id_libro, id_prestamo) VALUES ($2, $idPrestamoPendiente)")
        $(sqlite3 biblioteca.db "UPDATE libro set disponibilidad='En prestamo' where id_ejemplar = $2")
        fi
    fi
fi
