sqlite3 biblioteca.db <<EOF
INSERT INTO prestamo (cod_socio) VALUES ('$1');
EOF
