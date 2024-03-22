#  que hacemos si tiene prestamos pendientes?
sqlite3 biblioteca.db "update socio set $2=$3 where cod_socio=$1"
