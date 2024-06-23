# uso: ./alta_prestamo.sh cod_socio id_libro
echo "--------------------------------------------------------"
echo "|                   ALTA DE PRESTAMOS                  |"
echo "--------------------------------------------------------"
echo "ingrese el codigo del socio: "
read cod_socio
echo "ingrese el id del libro: "
read id_libro
libroDisponible=$(sqlite3 biblioteca.db "select * from libro where id_ejemplar = $id_libro and disponibilidad like 'Disponible' AND fecha_baja IS NULL")
socioDisponible=$(sqlite3 biblioteca.db "select * from socio where cod_socio = $cod_socio and fecha_baja IS NULL")

if [ -z "$libroDisponible" ] || [ -z "$socioDisponible" ]; then
    echo "el libro o socio no están disponible"
else
    idPrestamoPendiente=$(sqlite3 biblioteca.db "select id_prestamo from prestamo where cod_socio = $cod_socio and estado = 1 AND fecha_baja IS NULL")

    if [ -z "$idPrestamoPendiente" ]; then
        echo "no prestamos pendientes"
        $(sqlite3 biblioteca.db "INSERT INTO prestamo (cod_socio) VALUES ('$cod_socio')")
        idNuevoPrestamo=$(sqlite3 biblioteca.db "select id_prestamo from prestamo where cod_socio = $cod_socio and estado = 1")
        echo "id nuevo prestamo $idNuevoPrestamo"
        $(sqlite3 biblioteca.db "INSERT INTO item_libro_en_prestamo (id_libro, id_prestamo) VALUES ($id_libro, $idNuevoPrestamo)")
        # echo "no prestamos pendientes"
        $(sqlite3 biblioteca.db "UPDATE libro set disponibilidad='En prestamo' where id_ejemplar = $id_libro")
    else
      CantPrestamos=$(sqlite3 biblioteca.db "select count(id_item) from item_libro_en_prestamo where id_prestamo = $idPrestamoPendiente")
    #   echo "$CantPrestamos"
        if [ $CantPrestamos -gt 2 ]; then
            echo "el socio alcanzo el maximo de prestamos simultaneos"
        else
          idPrestamoPendiente=$(sqlite3 biblioteca.db "select id_prestamo from prestamo where cod_socio = $cod_socio and estado = 1")
          $(sqlite3 biblioteca.db "INSERT INTO item_libro_en_prestamo (id_libro, id_prestamo) VALUES ($id_libro, $idPrestamoPendiente)")
        $(sqlite3 biblioteca.db "UPDATE libro set disponibilidad='En prestamo' where id_ejemplar = $id_libro")
        fi
    fi
fi
