#!/bin/bash

sqlite3 biblioteca.db <<EOF
DELETE FROM estado_prestamo WHERE id_estado LIKE "$1";
EOF
