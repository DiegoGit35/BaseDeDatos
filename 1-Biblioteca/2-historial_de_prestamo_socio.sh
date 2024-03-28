sqlite3 biblioteca.db "select libro.titulo, item_libro_en_prestamo.fecha_prestamo, prestamo.id_estado, socio.nombre FROM libro
JOIN item_libro_en_prestamo ON libro.id_ejemplar = item_libro_en_prestamo.id_libro
JOIN prestamo ON prestamo.id_prestamo = item_libro_en_prestamo.id_prestamo
JOIN socio ON prestamo.cod_socio = socio.cod_socio
WHERE socio.cod_socio LIKE '$1';
"
