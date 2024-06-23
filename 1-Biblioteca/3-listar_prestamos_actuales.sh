sqlite3 biblioteca.db <<EOF
.mode table
.headers on
select item_libro_en_prestamo.id_item, libro.titulo, item_libro_en_prestamo.fecha_prestamo, 
item_libro_en_prestamo.fecha_limite_devolucion, estado_prestamo.estado, 
socio.apellido || ' ' || socio.nombre AS Nombre
FROM libro
JOIN item_libro_en_prestamo ON libro.id_ejemplar = item_libro_en_prestamo.id_libro
JOIN prestamo ON prestamo.id_prestamo = item_libro_en_prestamo.id_prestamo
JOIN estado_prestamo ON estado_prestamo.id_estado = prestamo.estado
JOIN socio ON prestamo.cod_socio = socio.cod_socio
WHERE prestamo.estado = 1;
EOF
