sqlite3 biblioteca.db <<EOF
.mode table
.headers on
select libro.titulo, libro.autores, libro.disponibilidad from libro where titulo LIKE '%$1%' ORDER BY disponibilidad
EOF
