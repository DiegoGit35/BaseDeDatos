-- Insertar datos de libros
INSERT INTO libro (anio, titulo, editorial, autores, isbn)
VALUES
  (2005, 'El señor de los anillos', 'Minotauro', 'J.R.R. Tolkien', 9788445071420),
  (2005, 'El señor de los anillos', 'Minotauro', 'J.R.R. Tolkien', 9788445071420),
  (2005, 'El señor de los anillos', 'Minotauro', 'J.R.R. Tolkien', 9788445071420),
  (2005, 'El señor de los anillos', 'Minotauro', 'J.R.R. Tolkien', 9788445071420),
  (2005, 'El señor de los anillos', 'Minotauro', 'J.R.R. Tolkien', 9788445071420),
  (1997, 'Harry Potter y la piedra filosofal', 'Salamandra', 'J.K. Rowling', 9788478884450),
  (1997, 'Harry Potter y la piedra filosofal', 'Salamandra', 'J.K. Rowling', 9788478884450),
  (1997, 'Harry Potter y la piedra filosofal', 'Salamandra', 'J.K. Rowling', 9788478884450),
  (1997, 'Harry Potter y la piedra filosofal', 'Salamandra', 'J.K. Rowling', 9788478884450),
  (1997, 'Harry Potter y la piedra filosofal', 'Salamandra', 'J.K. Rowling', 9788478884450),
  (1949, '1984', 'Debolsillo', 'George Orwell', 9786073113905),
  (1949, '1984', 'Debolsillo', 'George Orwell', 9786073113905),
  (1949, '1984', 'Debolsillo', 'George Orwell', 9786073113905),
  (1949, '1984', 'Debolsillo', 'George Orwell', 9786073113905),
  (1949, '1984', 'Debolsillo', 'George Orwell', 9786073113905),
  (1949, '1984', 'Debolsillo', 'George Orwell', 9786073113905),
  (1960, 'To Kill a Mockingbird', 'J.B. Lippincott & Co.', 'Harper Lee', 9780061120084),
  (1960, 'To Kill a Mockingbird', 'J.B. Lippincott & Co.', 'Harper Lee', 9780061120084),
  (1960, 'To Kill a Mockingbird', 'J.B. Lippincott & Co.', 'Harper Lee', 9780061120084),
  (2010, 'The Hunger Games', 'Scholastic Press', 'Suzanne Collins', 9780439023481),
  (2010, 'The Hunger Games', 'Scholastic Press', 'Suzanne Collins', 9780439023481),
  (2010, 'The Hunger Games', 'Scholastic Press', 'Suzanne Collins', 9780439023481),
  (2010, 'The Hunger Games', 'Scholastic Press', 'Suzanne Collins', 9780439023481),
  (2010, 'The Hunger Games', 'Scholastic Press', 'Suzanne Collins', 9780439023481),
  (1998, 'The Alchemist', 'HarperCollins', 'Paulo Coelho', 9780061122415),
  (1998, 'The Alchemist', 'HarperCollins', 'Paulo Coelho', 9780061122415),
  (1998, 'The Alchemist', 'HarperCollins', 'Paulo Coelho', 9780061122415),
  (1998, 'The Alchemist', 'HarperCollins', 'Paulo Coelho', 9780061122415),
  (1998, 'The Alchemist', 'HarperCollins', 'Paulo Coelho', 9780061122415),
  (2007, 'The Road', 'Knopf', 'Cormac McCarthy', 9780307265432),
  (2007, 'The Road', 'Knopf', 'Cormac McCarthy', 9780307265432),
  (2007, 'The Road', 'Knopf', 'Cormac McCarthy', 9780307265432),
  (2015, 'Gone Girl', 'Crown Publishing Group', 'Gillian Flynn', 9780307588371),
  (2015, 'Gone Girl', 'Crown Publishing Group', 'Gillian Flynn', 9780307588371),
  (2015, 'Gone Girl', 'Crown Publishing Group', 'Gillian Flynn', 9780307588371),
  (1984, 'The Catcher in the Rye', 'Little, Brown and Company', 'J.D. Salinger', 9780316769488),
  (2009, 'The Help', 'Putnam Adult', 'Kathryn Stockett', 9780399155345);

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
INSERT INTO prestamo (cod_socio)
VALUES
  (1),
  (2),
  (3),
  (5),
  (6),
  (7),
  (8),
  (9);

-- Insertar datos de items en préstamo
INSERT INTO item_libro_en_prestamo (id_libro, id_prestamo, fecha_prestamo)
VALUES
  (17, 10, '2024-05-07'),
  (22, 12, '2024-05-08'),
  (38, 13, '2024-05-10'),
  (64, 14, '2024-05-11'),
  (10, 14, '2024-05-11'),
  (97, 17, '2024-05-12'),
  (52, 18, '2024-05-13'),
  (95, 19, '2024-05-13'),
  (5, 15, '2024-05-15'),
  (11, 16, '2024-05-16'),
  (63, 16, '2024-05-21');

-- update libro set disponibilidad = "En Prestamo" where libro.id_ejemplar IN (select id_libro from item_libro_en_prestamo where fecha_devolucion is null);