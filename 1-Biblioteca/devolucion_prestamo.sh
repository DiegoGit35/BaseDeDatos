fechaActual="$(date --iso-8601)"
echo "la fecha altual es: $fechaActual"
idPrestamo=$(sqlite3 biblioteca.db "select id_prestamo from item_libro_en_prestamo where id_libro=$1 and fecha_devolucion IS NULL")
echo "id Prestamo es $idPrestamo"

sqlite3 biblioteca.db "update item_libro_en_prestamo set fecha_devolucion='$fechaActual' where id_libro=$1"
# echo "seteada fecha devolucion: $fechaActual en item"

sqlite3 biblioteca.db "UPDATE libro SET disponibilidad='Disponible' WHERE id_ejemplar= $1"
# echo "seteado disponible en libro"

cantPrestamos=$(sqlite3 biblioteca.db "select count(id_item) from item_libro_en_prestamo where id_prestamo=$idPrestamo and fecha_devolucion IS NULL")
echo "hay $cantPrestamos prestamos pendientes para este socio"

if [ 0 -eq $cantPrestamos ]; then 
  fecha_prestamo=$(sqlite3 biblioteca.db "select fecha_prestamo from prestamo where id_prestamo=$idPrestamo")
  echo "fecha prestamo es: $fecha_prestamo"
  fecha_limite_devolucion="$(sqlite3 biblioteca.db "SELECT DATE('$fecha_prestamo', '15 days')")";
  echo "la fecha limite de devolucion es: $fecha_limite_devolucion"
  if [ "$fechaActual" > "$fecha_limite_devolucion" ]; then
    echo "la fecha limite de devolucion no es mayor a la fecha actual"
    sqlite3 biblioteca.db "update prestamo set id_estado='DEVOLUCION ATRASADA' where id_prestamo=$idPrestamo"
  else
    echo "la fecha limite de devolucion es mayor a la fecha actual"
    sqlite3 biblioteca.db "update prestamo set id_estado='DEVUELTO A TIEMPO' where id_prestamo=$idPrestamo"
  fi
fi
