CREATE TABLE socio(cod_socio integer PRIMARY KEY,
  dni integer,
  direccion text,
  telefono integer,
  nombre text,
  apellido text,
  fecha_baja text,
  UNIQUE (dni)
);

CREATE TABLE prestamo(
  id_prestamo integer NOT NULL PRIMARY KEY,
  cod_socio integer references socio(cod_socio)
  on DELETE restrict deferrable initially deferred,
  id_estado text references estado_prestamo(id_estado) on DELETE restrict deferrable initially deferred NOT NULL DEFAULT "PENDIENTE",
  fecha_baja text
);

CREATE TABLE  item_libro_en_prestamo(
  id_item integer PRIMARY KEY,
  id_libro  integer references libro(id_ejemplar)
  on DELETE restrict deferrable initially deferred,
  id_prestamo integer references prestamo(id_prestamo) ON DELETE restrict deferrable initially deferred,
  fecha_prestamo NOT NULL DEFAULT CURRENT_DATE,
  fecha_limite_devolucion ,
  fecha_devolucion text,
  fecha_baja text
);


CREATE TABLE  libro(
  id_ejemplar integer PRIMARY KEY,
  anio  integer,
  titulo  text,
  editorial text,
  estado_fisico text NOT NULL DEFAULT "Bueno",
  disponibilidad text NOT NULL DEFAULT "Disponible",
  timestamp_registro current_timestamp NOT NULL DEFAULT CURRENT_DATE,
  autores text,
  isbn  integer,
  fecha_baja text
);

CREATE TRIGGER  fecha_limite AFTER INSERT ON item_libro_en_prestamo
BEGIN
    UPDATE item_libro_en_prestamo SET fecha_limite_devolucion=DATE(fecha_prestamo, '+15 days') WHERE fecha_limite_devolucion IS NULL;
END
