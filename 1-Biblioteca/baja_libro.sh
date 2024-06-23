sqlite3 biblioteca.db "update libro set fecha_baja=current_date where id_ejemplar=$1"
sqlite3 biblioteca.db "update libro set disponibilidad="No Disponible" where id_ejemplar=$1"
