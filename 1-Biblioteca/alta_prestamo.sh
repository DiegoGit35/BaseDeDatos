existeSocio=$(sqlite3 biblioteca.db "select * from socio where cod_socio = $1")
if [ -z "$existeSocio" ]; then
    echo "el socio existe"
else
    tienePrestamos=$(sqlite3 biblioteca.db "select id_estado from prestamo where cod_socio = $1")
    if [ -z "$tienePrestamos" ]; then
        idPrestamo=$(sqlite3 biblioteca.db "select id_prestamo from prestamo where cod_socio = $1")
        cuantosTiene=$(sqlite3 biblioteca.db "select count(id_item) from item_libro_en_prestamo where id_prestamo = $(id_prestamo)")
        if [ "$cuantosTiene" > 2 ]; then
            echo "el socio alcanzo el maximo de prestamos simultaneos"
        fi
    else
        echo "estamos aca"
        $(sqlite3 biblioteca.db "INSERT INTO prestamo (cod_socio) VALUES ('$1')")
        idNuevoPrestamo=$(sqlite3 biblioteca.db "select id_prestamo from prestamo where cod_socio = $1 and id_estado like 'PENDIENTE'")
        echo "no se si por aca"
        $(sqlite3 biblioteca.db "INSERT INTO item_libro_en_prestamo (id_libro, id_prestamo) VALUES ($2, $idNuevoPrestamo)")
        echo "ded"
    fi
fi
