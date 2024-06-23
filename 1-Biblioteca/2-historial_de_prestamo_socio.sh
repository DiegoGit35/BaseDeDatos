sqlite3 biblioteca.db <<EOF
.mode table
.headers on
SELECT libro.titulo,
       item_libro_en_prestamo.fecha_prestamo,
       CASE WHEN item_libro_en_prestamo.fecha_devolucion IS NULL THEN 'No devuelto'
            ELSE item_libro_en_prestamo.fecha_devolucion
       END AS fecha_devolucion,
       socio.apellido || ' ' || socio.nombre AS Nombre
FROM libro
JOIN item_libro_en_prestamo ON libro.id_ejemplar = item_libro_en_prestamo.id_libro
JOIN prestamo ON prestamo.id_prestamo = item_libro_en_prestamo.id_prestamo
JOIN socio ON prestamo.cod_socio = socio.cod_socio
WHERE socio.cod_socio LIKE '$1';
EOF
