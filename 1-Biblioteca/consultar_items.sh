sqlite3 biblioteca.db <<EOF
.mode table
.headers on
SELECT * FROM item_libro_en_prestamo;
EOF
