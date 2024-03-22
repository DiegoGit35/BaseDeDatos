sqlite3 biblioteca.db "select libro.titulo, libro.autores, libro.disponibilidad from libro where titulo LIKE '%$1%' ORDER BY disponibilidad"
