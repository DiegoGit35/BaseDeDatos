sqlite3 biblioteca.db "update item_libro_en_prestamo set "

sqlite3 biblioteca.db "UPDATE prestamo SET id_estado='Devuelto', fecha_devolucion=$(date --iso-8601) where id_prestamo=$1"
sqlite3 biblioteca.db "UPDATE libro SET disponibilidad='Disponible' WHERE id_ejemplar= $2"
