
echo "--------------------------------------------------------"
echo "|                    ALTA DE SOCIOS                    |"
echo "--------------------------------------------------------"
echo "DNI: "
read dni
echo "dirección: "
read direccion
echo "telefono: "
read telefono
echo "apellidos: "
read apellido
echo "nombres: "
read nombre


sqlite3 biblioteca.db <<EOF
.mode table
.headers on
INSERT INTO socio (dni, direccion, telefono, nombre, apellido) 
VALUES ('$dni','$direccion','$telefono','$nombre','$apellido');
EOF
