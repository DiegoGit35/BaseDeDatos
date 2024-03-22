# se puede dar de baja un prestamo pendiente? 
sqlite3 biblioteca.db "update prestamo set $2=$3 where id_prestamo=$1"
