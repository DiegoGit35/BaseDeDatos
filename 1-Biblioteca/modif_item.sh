
echo "--------------------------------------------------------"
echo "|                 MODIFICACIÓN DE ITEM                 |"
echo "--------------------------------------------------------"
echo "Ingrese el id del item: "
read id_item


item=$(sqlite3 biblioteca.db "select * from item_libro_en_prestamo where id_item = $id_item")
if [ -z "$item" ]; then
    echo "el item no existe"
else
    echo $item
    echo "ID libro: "
    read id_libro
    # echo "ID prestamo: "
    # read id_prestamo
    echo "Fecha devolución: "
    read fecha_devolucion
    echo "Fecha baja: "
    read fecha_baja


sqlite3 biblioteca.db <<EOF
update item_libro_en_prestamo set id_libro = $id_libro, fecha_devolucion = $fecha_devolucion, fecha_baja = $fecha_baja where id_item = $id_item;
EOF
fi

sqlite3 biblioteca.db <<EOF
.mode table
.headers on
SELECT * FROM item_libro_en_prestamo;
EOF