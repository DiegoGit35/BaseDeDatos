#  que hacemos si tiene prestamos pendientes?
echo "--------------------------------------------------------"
echo "|                MODIFICACIÓN DE SOCIOS                |"
echo "--------------------------------------------------------"
echo "ingrese el codigo del socio: "
read codSocio

sqlite3 biblioteca.db <<EOF
.headers on
.mode table
select * from socio where cod_socio = $codSocio;
EOF

echo "Columna a modificar: "
read columna
echo "Nuevo valor de la columna: "
read valor

if [ "$valor" == "cod_socio" ]; then
    echo "no se puede modificar el codigo de socio!"
else
    sqlite3 biblioteca.db "update socio set $columna=$valor where cod_socio=$codSocio"
fi

sqlite3 biblioteca.db <<EOF
.headers on
.mode table
select * from socio where cod_socio = $codSocio;
EOF