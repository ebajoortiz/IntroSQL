/*1. Crea una tabla llamada "Productos" con las columnas: "id" (entero, clave 
primaria), "nombre" (texto) y "precio" (numérico).*/
CREATE TABLE Productos (
    id SERIAL PRIMARY KEY,
    nombre TEXT,
    precio NUMERIC
);

/* 2. Inserta al menos cinco registros en la tabla "Productos".*/
INSERT INTO Productos (nombre, precio) VALUES
('Camiseta', 19.99),
('Pantalón', 39.50),
('Zapatos', 59.99),
('Gorra', 12.00),
('Chaqueta', 79.90);

/* 3. Actualiza el precio de un producto en la tabla "Productos".*/
UPDATE Productos
SET precio = 44.99
WHERE nombre = 'Pantalón';

 /*4. Elimina un producto de la tabla "Productos".*/
DELETE FROM Productos
WHERE nombre = 'Gorra';

 /*5. Realiza una consulta que muestre los nombres de los usuarios junto con los 
nombres de los productos que han comprado (utiliza un INNER JOIN con la 
tabla "Productos")*/
CREATE TABLE Compras (
    id SERIAL PRIMARY KEY,
    usuario_id INTEGER REFERENCES Usuarios(id),
    producto_id INTEGER REFERENCES Productos(id)
);

