sqlite3 biblioteca.db "update itemo_libro_en_prestamo set fecha_baja=current_date where id_item=$1"
