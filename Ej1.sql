
1_
  
SELECT *
FROM Cliente
WHERE (apellido LIKE "Pe%")

2_

SELECT c.nombre, c.apellido, c.DNI, c.teléfono, c.dirección
FROM Cliente c INNER JOIN Factura f ON (c.idCliente = f.idCliente)
WHERE (c.fecha BETWEEN 01/01/2017 and 31/12/2017)
EXCEPT(
  SELECT c.nombre, c.apellido, c.DNI, c.teléfono, c.dirección
  FROM Cliente c INNER JOIN Factura f ON (c.idCliente = f.idCliente)
  WHERE (c.fecha < 01/01/2017 and  c.fecha > 31/12/2017)
)

3_

SELECT p.descripcion, p.nombreP, p.stock, p.precio
FROM Producto p
INNER JOIN Detalle d ON (p.idProducto = d.idProducto)
INNER JOIN Factura f ON (d.nroTicket = f.nroTicket)
INNER JOIN Cliente c ON (f.idCliente = c.idCliente)
WHERE (c.DNI = 45789456)
EXCEPT(
  INNER JOIN Detalle d ON (p.idProducto = d.idProducto)
  INNER JOIN Factura f ON (d.nroTicket = f.nroTicket)
  INNER JOIN Cliente c ON (f.idCliente = c.idCliente)
  WHERE (c.apellido = "Garcia") 
)

4_

SELECT p.descripcion, p.nombreP, p.stock, p.precio
FROM Producto p
INNER JOIN Detalle d ON (p.idProducto = d.idProducto)
INNER JOIN Factura f ON (d.nroTicket = f.nroTicket)
INNER JOIN Cliente c ON (f.idCliente = c.idCliente)
EXCEPT(
  INNER JOIN Detalle d ON (p.idProducto = d.idProducto)
  INNER JOIN Factura f ON (d.nroTicket = f.nroTicket)
  INNER JOIN Cliente c ON (f.idCliente = c.idCliente)
  WHERE (c.telefono LIKE "221%") 
)
///

SELECT descripcion, nombreP, stock, precio
FROM Producto p
WHERE idProducto NOT IN(
  SELECT p.idProducto
  FROM Producto p
  INNER JOIN Detalle d ON (p.idProducto = d.idProducto)
  INNER JOIN Factura f ON (d.nroTicket = f.nroTicket)
  INNER JOIN Cliente c ON (f.idCliente = c.idCliente)
  WHERE (c.telefono LIKE "221%") 
)

5_

SELECT descripcion, nombreP, precio, SUM (d.cantidad) as Cantidad
FROM Producto p
LEFT JOIN Detalle d ON (p.idProducto = d.idProducto)
GROUP BY p.idProducto, p.nombreP, p.descripcion, p.precio

6_

SELECT nombre, apellido, DNI, telefono
FROM Producto p
INNER JOIN Detalle d ON (p.idProducto = d.idProducto)
INNER JOIN Factura f ON (d.nroTicket = f.nroTicket)
INNER JOIN Cliente c ON (f.idCliente = c.idCliente)
WHERE (p.nombreP = "prod1") AND (c.idCliente IN (
  SELECT c.idCliente
  FROM Producto p
  INNER JOIN Detalle d ON (p.idProducto = d.idProducto)
  INNER JOIN Factura f ON (d.nroTicket = f.nroTicket)
  INNER JOIN Cliente c ON (f.idCliente = c.idCliente)
  WHERE (p.nombreP = "prod2")
))
EXCEPT(
  SELECT nombre, apellido, DNI, telefono
  FROM Producto p
  INNER JOIN Detalle d ON (p.idProducto = d.idProducto)
  INNER JOIN Factura f ON (d.nroTicket = f.nroTicket)
  INNER JOIN Cliente c ON (f.idCliente = c.idCliente)
  WHERE(p.nombreP = "prod3")
)
  
7_

SELECT f.nroTicket, f.total, f.fecha, f.hora, c.DNI
FROM Cliente c
INNER JOIN Factura f ON (c.idCliente = f.idCliente)
INNER JOIN Detalle d ON (f.nroTicket = d.nroTicket)
INNER JOIN Producto p ON (d.idProducto = p.idProducto)
WHERE (p.nombreP = "prod38" OR f.fecha BETWEEN 01/01/2019 and 31/12/2019)

8_

INSERT INTO Cliente VALUES (500002,"Jorge Luis","Castor","40578999","221-4400789","11 entre 500 y 501 nro:2587")

9_
SELECT f.nroTicket, f.total, f.fecha, f.hora
FROM Cliente c
INNER JOIN Factura f ON (c.idCliente = f.idCliente)
INNER JOIN Detalle d ON (f.nroTicket = d.nroTicket)
INNER JOIN Producto p ON (d.idProducto = p.idProducto)
WHERE (c.nombre = "Jorge" and c.apellido = "Perez" and p.nombreP != "Z")

10_
SELECT c.DNI, c.apellido, c.nombre
FROM Factura f 
INNER JOIN Cliente c ON (f.idCliente =  c.idCliente)
GROUP BY c.DNI, c.apellido, c.nombre
HAVING SUM (f.total) > 10000000




