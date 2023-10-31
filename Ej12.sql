1_
  
SELECT c.DNI, c.nombYAp, c.direccionC, c.fechaNacimiento, c.celular
FROM Cliente c
WHERE NOT EXISTS (
  SELECT *
  FROM Atencion a
  WHERE (a.nroCliente = c.nroCliente) and (a.fecha BETWEEN "01/01/2020" and "31/12/2020")
)

2_

SELECT b.DNIB, b.nombYApB, b.direccionB, b.telefonoContacto, b.mail, COUNT(*) as Atenciones
FROM Barbero b
INNER JOIN Atencion a ON (a.codEmpleado = b.codEmpleado)
WHERE (a.fecha BETWEEN "01/01/2018" and "31/12/2018")
GROUP BY b.codEmpleado, b.DNIB, b.nombYApB, b.direccionB, b.telefonoContacto, b.mail

3_

SELECT DISTINCT b.razon_social, b.direccion, b.telefono
FROM Barberia b
INNER JOIN Atencion a ON (a.razonSocial = b.razonSocial)
INNER JOIN Cliente c ON (c.nroCliente = a.nroCliente)
WHERE (c.DNI = "22283566")
ORDER BY b.razon_social, b.direccion

4_

SELECT b.DNIB, b.nombYApB, b.direccionB, b.telefonoContacto, b.mail
FROM Barbero b 
LEFT JOIN Atencion a ON(b.codEmpleado = a.codEmpleado)
WHERE a.valor > 5000

5_

SELECT c.DNI, c.nombYAp, c.direccionC, c.fechaNacimiento, c.celular
FROM Cliente c
INNER JOIN Atencion a ON (a.nroCliente = c.nroCliente)
INNER JOIN Barberia b ON (b.razonSocial = a.razonSocial)
WHERE (b.razonSocial = "Corta barba") and c.DNI IN (
  SELECT a.DNI
  FROM Atencion a
  INNER JOIN Barberia b ON (b.razonSocial = a.razonSocial)
  WHERE (b.razonSocial = "Barberia barbara")
)

6_

DELETE FROM Atencion WHERE nroCliente IN (
    SELECT c.nroCliente
    FROM Cliente c
    WHERE dni="22222222"
)
DELETE FROM Cliente WHERE dni="22222222";











