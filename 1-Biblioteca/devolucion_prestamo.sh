# para hacer la devolucion, es necesario seguir una serie de pasos, y lo unico que necesitamos tener como input es el id del libro (id_ejemplar), a partir de este id vamos a buscar un item_libro_en_prestamo que tenga en sus filas id_ejemplar y no tenga una fecha de devolucion asignada, a partir de ese item buscamos el prestamo, y a partir del prestamo buscamos los otros item_libro_en_prestamo que tengan ese id_prestamo y no tengan asignada fecha_devolucion, asi sabremos cuantos libros debe el socio (un prestamo determinado solo pertenece a un socio), si el socio devuelve todos los libros del prestamo se marca el prestamo como devuelto o devuelto fuera de tiempo, segun sea el caso

fechaActual="$(date --iso-8601)"
idPrestamo=$(sqlite3 biblioteca.db "select id_prestamo from item_libro_en_prestamo where id_libro=$1 and fecha_devolucion IS NULL")

# asignamos fecha de devolucion para el libro a devolver 
sqlite3 biblioteca.db "update item_libro_en_prestamo set fecha_devolucion='$fechaActual' where id_libro=$1"

sqlite3 biblioteca.db "UPDATE libro SET disponibilidad='Disponible' WHERE id_ejemplar= $1"

cantPrestamos=$(sqlite3 biblioteca.db "select count(id_item) from item_libro_en_prestamo where id_prestamo=$idPrestamo and fecha_devolucion IS NULL")

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
