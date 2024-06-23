sqlite3 biblioteca.db <<EOF
.mode table
.headers on
select libro.titulo, prestamo.id_prestamo, estado_prestamo.estado, item_libro_en_prestamo.fecha_prestamo, item_libro_en_prestamo.fecha_limite_devolucion, socio.nombre FROM libro
JOIN item_libro_en_prestamo ON libro.id_ejemplar = item_libro_en_prestamo.id_libro
JOIN prestamo ON prestamo.id_prestamo = item_libro_en_prestamo.id_prestamo
JOIN socio ON prestamo.cod_socio = socio.cod_socio
JOIN estado_prestamo ON estado_prestamo.id_estado = prestamo.estado
WHERE libro.titulo LIKE '$1%' AND prestamo.estado=1;
EOF
