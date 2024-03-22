sqlite3 biblioteca.db "select * from libro where id_ejemplar=(select id_libro from item_libro_en_prestamo where fecha_devolucion=NULL)"
