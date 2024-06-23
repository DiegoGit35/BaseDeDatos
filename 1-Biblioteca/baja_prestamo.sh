
echo "ingrese el codigo del prestamo: "
read idPrestamo

itemsPendientes=$(sqlite3 biblioteca.db "select count(*) from item_libro_en_prestamo 
where id_prestamo = $idPrestamo and fecha_devolucion IS NULL")
echo "el prestamo tiene $itemsPendientes items pendientes"
if [ $itemsPendientes == 0 ]; then
    sqlite3 biblioteca.db "update prestamo set fecha_baja=current_date where id_prestamo=$idPrestamo"
else 
    echo "El prestamo tiene items pendientes. No es posible dar de baja"
fi



# sqlite3 biblioteca.db "update prestamo set fecha_baja=current_date where prestamo=$1"
