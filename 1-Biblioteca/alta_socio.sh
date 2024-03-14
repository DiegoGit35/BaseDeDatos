sqlite3 biblioteca.db <<EOF
INSERT INTO socio (dni, direccion, telefono, nombre, apellido) VALUES ('$1','$2','$3','$4','$5');
EOF
