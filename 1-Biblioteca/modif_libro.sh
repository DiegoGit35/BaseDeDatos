# se puede dar de baja un libro que esta en prestamo?
sqlite3 biblioteca.db "update libro set $2=$3 where id_ejemplar=$1"
