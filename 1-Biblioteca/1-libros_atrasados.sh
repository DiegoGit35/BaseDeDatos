sqlite3 biblioteca.db <<EOF
.mode table
.headers on
SELECT prestamo.id_prestamo AS "ID prestamo", libro.titulo AS "Titulo del libro", socio.apellido || ' ' || socio.nombre AS "Nombre completo", item_libro_en_prestamo.fecha_limite_devolucion AS "Fecha límite de devolución",
CASE
    WHEN item_libro_en_prestamo.fecha_limite_devolucion < current_date THEN
        julianday(current_date) - julianday(item_libro_en_prestamo.fecha_limite_devolucion) 
        ELSE
            0
    END 
    AS "Dias de atraso"
FROM libro
JOIN item_libro_en_prestamo ON libro.id_ejemplar = item_libro_en_prestamo.id_libro
JOIN prestamo ON item_libro_en_prestamo.id_prestamo = prestamo.id_prestamo
JOIN socio ON prestamo.cod_socio = socio.cod_socio 
WHERE item_libro_en_prestamo.fecha_limite_devolucion < current_date AND prestamo.estado = 1;
EOF

