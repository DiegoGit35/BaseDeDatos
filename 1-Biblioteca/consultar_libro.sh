sqlite3 biblioteca.db <<EOF
.mode table
.headers on
SELECT * FROM libro;
EOF
