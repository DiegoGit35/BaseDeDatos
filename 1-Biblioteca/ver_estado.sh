#!/bin/bash

sqlite3 biblioteca.db <<EOF
SELECT * FROM estado_prestamo;
EOF
