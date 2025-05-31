/* 1. Crea una base de datos llamada "MiBaseDeDatos".*/
CREATE DATABASE "MiBaseDeDatos";

/* 2. Crea una tabla llamada "Usuarios" con las columnas: "id" (entero, clave 
primaria), "nombre" (texto) y "edad" (entero).*/
CREATE TABLE Usuarios (
    id SERIAL PRIMARY KEY,
    nombre TEXT,
    edad INTEGER
);

 /*3. Inserta dos registros en la tabla "Usuarios".*/
INSERT INTO Usuarios (nombre, edad) VALUES
('Ana', 25),
('Carlos', 30);

/* 4. Actualiza la edad de un usuario en la tabla "Usuarios".*/
UPDATE Usuarios
SET edad = 26
WHERE nombre = 'Ana';

 /*5. Elimina un usuario de la tabla "Usuarios".*/
DELETE FROM Usuarios
WHERE nombre = 'Carlos';

/* Nivel de dificultad: Moderado*/
/*1. Crea una tabla llamada "Ciudades" con las columnas: "id" (entero, clave 
primaria), "nombre" (texto) y "pais" (texto).*/
CREATE TABLE Ciudades (
    id SERIAL PRIMARY KEY,
    nombre TEXT,
    pais TEXT
);


/* 2. Inserta al menos tres registros en la tabla "Ciudades".*/
INSERT INTO Ciudades (nombre, pais) VALUES
('Madrid', 'España'),
('Buenos Aires', 'Argentina'),
('Ciudad de México', 'México');

/*3. Crea una foreign key en la tabla "Usuarios" que se relacione con la columna "id" 
de la tabla "Ciudades".*/
ALTER TABLE Usuarios ADD COLUMN ciudad_id INTEGER;

ALTER TABLE Usuarios
ADD CONSTRAINT fk_ciudad
FOREIGN KEY (ciudad_id)
REFERENCES Ciudades(id);

UPDATE Usuarios
SET ciudad_id = 1
WHERE nombre = 'Ana';

 /*4. Realiza una consulta que muestre los nombres de los usuarios junto con el 
nombre de su ciudad y país (utiliza un LEFT JOIN).*/
SELECT u.nombre AS nombre_usuario, c.nombre AS ciudad, c.pais
FROM Usuarios u
LEFT JOIN Ciudades c ON u.ciudad_id = c.id;


 /*5. Realiza una consulta que muestre solo los usuarios que tienen una ciudad 
asociada (utiliza un INNER JOIN)*/
SELECT u.nombre AS nombre_usuario, c.nombre AS ciudad, c.pais
FROM Usuarios u
INNER JOIN Ciudades c ON u.ciudad_id = c.id;

