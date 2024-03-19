CREATE TABLE   socio(cod_socio integer PRIMARY KEY,
  dni integer,
  direccion text,
  telefono integer,
  nombre text,
  apellido text,
  UNIQUE (dni)
);

CREATE TABLE   socio_baja(cod_socio integer PRIMARY KEY,
  dni integer,
  direccion text,
  telefono integer,
  nombre text,
  apellido text,
  timestamp_baja current_timestamp NOT NULL DEFAULT CURRENT_DATE,
  UNIQUE (dni)
);

CREATE TABLE  estado_prestamo(
  id_estado text UNIQUE NOT NULL PRIMARY KEY
);

CREATE TABLE  prestamo(
  id_prestamo integer NOT NULL PRIMARY KEY,
  cod_socio integer references socio(cod_socio)
  on DELETE restrict deferrable initially deferred,
  fecha_prestamo NOT NULL DEFAULT CURRENT_DATE,
  id_estado text references estado_prestamo(id_estado) on DELETE restrict deferrable initially deferred NOT NULL DEFAULT "PENDIENTE"
);

CREATE TABLE  prestamo_baja(
  id_prestamo integer NOT NULL PRIMARY KEY,
  cod_socio integer references socio(cod_socio)
  on DELETE restrict deferrable initially deferred,
  fecha_prestamo NOT NULL DEFAULT CURRENT_DATE,
  id_estado text references estado_prestamo(id_estado) on DELETE restrict deferrable initially deferred,
  timestamp_baja  current_timestamp NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE  item_libro_en_prestamo(
  id_item integer PRIMARY KEY,
  id_libro  integer references libro(id_ejemplar)
  on DELETE restrict deferrable initially deferred,
  id_prestamo integer references prestamo(id_prestamo) ON DELETE restrict deferrable initially deferred,
  fecha_devolucion text
);


CREATE TABLE  item_libro_en_prestamo_baja(
  id_item integer PRIMARY KEY,
  id_libro  integer references libro(id_ejemplar)
  on DELETE restrict deferrable initially deferred,
  id_prestamo integer references prestamo(id_prestamo) ON DELETE restrict deferrable initially deferred,
  fecha_devolucion CURRENT_DATE
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
  isbn  integer
);

CREATE TABLE  libro_baja(
  id_ejemplar integer PRIMARY KEY,
  anio  integer,
  titulo  text,
  editorial text,
  estado_fisico text,
  disponibilidad text NOT NULL DEFAULT "Baja",
  timestamp_registro current_timestamp,
  timestamp_baja current_timestamp NOT NULL DEFAULT CURRENT_DATE,
  autores text,
  isbn  integer
);


