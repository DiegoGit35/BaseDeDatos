#  que hacemos si tiene prestamos pendientes?
echo "ingrese el codigo del socio: "
read codSocio

prestamosPendientes=$(sqlite3 biblioteca.db "select * from prestamo where cod_socio = $codSocio and estado = 1")
# echo $prestamosPendientes
if [ -z "$prestamosPendientes" ]; then
    sqlite3 biblioteca.db "update socio set fecha_baja=current_date where cod_socio=$codSocio"
else 
    echo "El socio tiene prestamos pendientes. No es posible dar de baja"
fi


#sqlite3 biblioteca.db "update socio set fecha_baja=current_date where cod_socio=$1"
