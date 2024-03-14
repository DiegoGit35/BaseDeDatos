#!/bin/bash
#
sqlite3 biblioteca.db <<EOF
INSERT INTO estado_prestamo(id_estado) VALUES ('$1');
EOF
