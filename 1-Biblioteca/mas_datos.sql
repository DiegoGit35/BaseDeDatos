-- Insertar datos de libros
INSERT INTO libro (id_ejemplar, anio, disponibilidad, titulo, editorial, autores, isbn)
VALUES
  (1, 2005, 'En Prestamo', 'El señor de los anillos', 'Minotauro', 'J.R.R. Tolkien', 9788445071420),
  (2, 1997, 'En Prestamo', 'Harry Potter y la piedra filosofal', 'Salamandra', 'J.K. Rowling', 9788478884450),
  (3, 1949, 'En Prestamo', '1984', 'Debolsillo', 'George Orwell', 9786073113905),
  (4, 2003, 'En Prestamo', 'Cien años de soledad', 'Diana', 'Gabriel García Márquez', 9788437613612),
  (5, 1960, 'En Prestamo', 'To Kill a Mockingbird', 'J.B. Lippincott & Co.', 'Harper Lee', 9780061120084),
  (6, 1943, 'En Prestamo', 'El principito', 'Reynal & Hitchcock', 'Antoine de Saint-Exupéry', 9780156012195),
  (7, 2010, 'En Prestamo', 'The Hunger Games', 'Scholastic Press', 'Suzanne Collins', 9780439023481),
  (8, 1998, 'En Prestamo', 'The Alchemist', 'HarperCollins', 'Paulo Coelho', 9780061122415),
  (9, 2007, 'En Prestamo', 'The Road', 'Knopf', 'Cormac McCarthy', 9780307265432),
  (10, 2015, 'En Prestamo', 'Gone Girl', 'Crown Publishing Group', 'Gillian Flynn', 9780307588371),
  (11, 1984, 'En Prestamo', 'The Catcher in the Rye', 'Little, Brown and Company', 'J.D. Salinger', 9780316769488),
  (12, 2009, 'En Prestamo', 'The Help', 'Putnam Adult', 'Kathryn Stockett', 9780399155345);

-- Insertar datos de socios
INSERT INTO socio (cod_socio, dni, direccion, telefono, nombre, apellido)
VALUES
  (1, 12345678, 'Calle Ficticia 123', 1122334455, 'Juan', 'Pérez'),
  (2, 87654321, 'Avenida Imaginaria 456', 5544332211, 'María', 'González'),
  (3, 11111111, 'Calle Inventada 789', 9876543210, 'Carlos', 'Martínez'),
  (4, 22222222, 'Calle Imaginaria 567', 9988776655, 'Laura', 'López'),
  (5, 33333333, 'Avenida Ficticia 890', 8877665544, 'Pedro', 'Rodríguez'),
  (6, 44444444, 'Calle Inventada 1234', 6655443322, 'Ana', 'Sánchez'),
  (7, 55555555, 'Avenida Ficticia 1234', 1122334455, 'Diego', 'Hernández'),
  (8, 66666666, 'Calle Imaginaria 5678', 9988776655, 'Lucía', 'Martínez'),
  (9, 77777777, 'Calle Inventada 5678', 8877665544, 'Luis', 'García');

-- Insertar datos de préstamos
INSERT INTO prestamo (id_prestamo, cod_socio)
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5),
  (6, 6),
  (7, 7),
  (8, 8),
  (9, 9);

-- Insertar datos de items en préstamo
INSERT INTO item_libro_en_prestamo (id_item, id_libro, id_prestamo, fecha_prestamo)
VALUES
  (1, 1, 1, '2024-04-20'),
  (2, 2, 2, '2024-04-21'),
  (3, 3, 3, '2024-04-22'),
  (4, 4, 4, '2024-04-19'),
  (5, 5, 5, '2024-04-20'),
  (6, 6, 6, '2024-04-21'),
  (7, 7, 7, '2024-04-18'),
  (8, 8, 8, '2024-04-19'),
  (9, 9, 9, '2024-04-20'),
  (10, 10, 4, '2024-04-17'),
  (11, 11, 6, '2024-04-16'),
  (12, 12, 4, '2024-04-15');

