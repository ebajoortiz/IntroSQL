/* 1. Crea una tabla llamada "Pedidos" con las columnas: "id" (entero, clave 
primaria), "id_usuario" (entero, clave foránea de la tabla "Usuarios") y 
"id_producto" (entero, clave foránea de la tabla "Productos").*/
CREATE TABLE Pedidos (
    id SERIAL PRIMARY KEY,
    id_usuario INTEGER REFERENCES Usuarios(id),
    id_producto INTEGER REFERENCES Productos(id)
);

 /*2. Inserta al menos tres registros en la tabla "Pedidos" que relacionen usuarios con 
productos.*/
-- Asegúrate de que los IDs existen en Usuarios y Productos
INSERT INTO Pedidos (id_usuario, id_producto) VALUES
(1, 1),  -- Ana compra Camiseta
(1, 3),  -- Ana compra Zapatos
(2, 2);  -- Otro usuario (si existe) compra Pantalón

INSERT INTO Usuarios (nombre, edad) VALUES ('Luis', 28);

/* 3. Realiza una consulta que muestre los nombres de los usuarios y los nombres de 
los productos que han comprado, incluidos aquellos que no han realizado 
ningún pedido (utiliza LEFT JOIN y COALESCE).*/
SELECT
  u.nombre AS usuario,
  COALESCE(p2.nombre, 'Sin producto') AS producto
FROM Usuarios u
LEFT JOIN Pedidos p ON u.id = p.id_usuario
LEFT JOIN Productos p2 ON p.id_producto = p2.id;

/* 4. Realiza una consulta que muestre los nombres de los usuarios que han 
realizado un pedido, pero también los que no han realizado ningún pedido 
(utiliza LEFT JOIN).*/
SELECT
  u.nombre AS usuario,
  CASE
    WHEN p.id IS NOT NULL THEN 'Sí'
    ELSE 'No'
  END AS realizo_pedido
FROM Usuarios u
LEFT JOIN Pedidos p ON u.id = p.id_usuario
GROUP BY u.nombre, p.id;

 /*5. Agrega una nueva columna llamada "cantidad" a la tabla "Pedidos" y actualiza 
los registros existentes con un valor (utiliza ALTER TABLE y UPDATE)*/
ALTER TABLE Pedidos ADD COLUMN cantidad INTEGER;

UPDATE Pedidos SET cantidad = 2 WHERE id = 1;
UPDATE Pedidos SET cantidad = 1 WHERE id = 2;
UPDATE Pedidos SET cantidad = 3 WHERE id = 3;


