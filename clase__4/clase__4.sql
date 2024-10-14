-- Selecciona todos los pedidos con información del cliente (nombre, ciudad y país), de la compañía de logística de envíos (nombre) y la fecha de la orden (deben hacer uso de las tablas Shippers, Orders y Customers, las columnas que permiten el JOIN son CustomerID y ShipperID)

SELECT c.customername, c.country, c.city, s.ShipperName, o.OrderDate
FROM ((Orders AS o
INNER JOIN customers AS c ON o.CustomerID = c.CustomerID)
INNER JOIN shippers AS s ON o.ShipperID = s.ShipperID)

-- Obtener el número de pedidos enviados por cada remitente (Pueden hacer uso de las tablas Shippers y Orders, el JOIN se realiza por medio de la columna ShipperID)

SELECT  s.ShipperName as remitente, count(s.ShipperName) as total
FROM Orders as o
INNER JOIN shippers as s ON o.ShipperID= s.ShipperID 
group by s.ShipperName




-- Crear la tabla OrderDetails
CREATE TABLE OrderDetails (
  OrderID INT,
  Quantity INT,
  country varchar(20)
);

-- Insertar datos en la tabla
INSERT INTO OrderDetails (OrderID, Quantity, Country) VALUES
  (1, 10, 'Country1'),
  (2, 20, 'Country2'),
  (3, 30, 'Country3'),
  (4, 40, 'Country4'),
  (5, 50, 'Country5'),
  (6, 60, 'Country6'),
  (7, 70, 'Country1'),
  (8, 80, 'Country8'),
  (9, 90, 'Country9'),
  (10, 25, 'Country10'),
  (11, 35, 'Country3'),
  (12, 45, 'Country1'),
  (13, 55, 'Country4'),
  (14, 65, 'Country3'),
  (15, 75, 'Country15'),
  (16, 85, 'Country16'),
  (17, 95, 'Country4'),
  (18, 15, 'Country4'),
  (19, 5, 'Country3'),
  (20, 100, 'Country3');


SELECT OrderID,
  CASE
	WHEN Quantity > 30 THEN "Mayor 30"
	WHEN Quantity = 30 THEN "Igual30"
	ELSE "Menor30"
  END AS TextoCantidad
FROM OrderDetails


SELECT Country AS pais, COUNT(orderID) AS total
FROM OrderDetails
GROUP BY Country
HAVING total > 2
ORDER BY total DESC;
