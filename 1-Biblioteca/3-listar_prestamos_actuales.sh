sqlite3 biblioteca.db "select libro.titulo, item_libro_en_prestamo.fecha_prestamo, item_libro_en_prestamo.fecha_limite_devolucion, prestamo.id_estado, socio.nombre FROM libro
JOIN item_libro_en_prestamo ON libro.id_ejemplar = item_libro_en_prestamo.id_libro
JOIN prestamo ON prestamo.id_prestamo = item_libro_en_prestamo.id_prestamo
JOIN socio ON prestamo.cod_socio = socio.cod_socio
WHERE prestamo.id_estado LIKE 'PENDIENTE';
"
