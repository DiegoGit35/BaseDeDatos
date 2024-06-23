sqlite3 biblioteca.db <<EOF
.mode table
.headers on
select * from prestamo JOIN estado_prestamo ON estado_prestamo.id_estado = prestamo.estado;
EOF
