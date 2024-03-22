sqlite3 biblioteca.db "update prestamo set fecha_baja=current_date where prestamo=$1"
