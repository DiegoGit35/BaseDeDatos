fechaActual="$(date --iso-8601)"
echo "ingrese el codigo del libro a devolver: "
read id_libro
idItemPrestamo=$(sqlite3 biblioteca.db "select id_item from item_libro_en_prestamo where id_libro=$id_libro and fecha_devolucion IS NULL")
echo "id item: $idItemPrestamo"
idPrestamo=$(sqlite3 biblioteca.db "select id_prestamo from item_libro_en_prestamo where id_item=$idItemPrestamo")

# asignamos fecha de devolucion para el libro a devolver 
sqlite3 biblioteca.db "update item_libro_en_prestamo set fecha_devolucion='$fechaActual' where id_libro=$id_libro"

sqlite3 biblioteca.db "UPDATE libro SET disponibilidad='Disponible' WHERE id_ejemplar= $id_libro"

cantPrestamos=$(sqlite3 biblioteca.db "select count(id_item) from item_libro_en_prestamo where id_prestamo=$idPrestamo and fecha_devolucion IS NULL")
echo "cantidad prestamos pendiente del socio: $cantPrestamos"
if [ 0 -eq $cantPrestamos ]; then 
  fecha_prestamo=$(sqlite3 biblioteca.db "select fecha_prestamo from item_libro_en_prestamo where id_item=$idItemPrestamo")
  # echo "fecha prestamo es: $fecha_prestamo"
  fecha_limite_devolucion="$(sqlite3 biblioteca.db "select fecha_limite_devolucion from item_libro_en_prestamo where id_item=$idItemPrestamo")"; 
  # echo "la fecha limite de devolucion es: $fecha_limite_devolucion"
  if [ "$fechaActual" > "$fecha_limite_devolucion" ]; then
    # echo "la fecha limite de devolucion no es mayor a la fecha actual"
    sqlite3 biblioteca.db "update prestamo set estado=3 where id_prestamo=$idPrestamo"
  else
    # echo "la fecha limite de devolucion es mayor a la fecha actual"
    sqlite3 biblioteca.db "update prestamo set estado=2 where id_prestamo=$idPrestamo"
  fi
fi
