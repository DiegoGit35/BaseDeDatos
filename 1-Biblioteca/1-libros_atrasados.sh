sqlite3 biblioteca.db "SELECT libro.titulo, socio.nombre, item_libro_en_prestamo.fecha_limite_devolucion 
FROM libro
JOIN item_libro_en_prestamo ON libro.id_ejemplar = item_libro_en_prestamo.id_libro
JOIN prestamo ON item_libro_en_prestamo.id_prestamo = prestamo.id_prestamo
JOIN socio ON prestamo.cod_socio = socio.cod_socio 
WHERE item_libro_en_prestamo.fecha_limite_devolucion < current_date;"

