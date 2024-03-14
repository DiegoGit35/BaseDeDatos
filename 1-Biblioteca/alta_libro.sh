sqlite3 biblioteca.db <<EOF
INSERT INTO libro (anio, titulo, editorial, estado, autores, isbn) VALUES ('$1','$2','$3','$4','$5','$6');
EOF
