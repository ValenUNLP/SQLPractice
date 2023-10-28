1_

SELECT a.razon_social, a.dirección, a.teléfono
FROM Agencia a
INNER JOIN Viaje v ON (v.razon_social = a.razon_social)
INNER JOIN Ciudad ci ON (c.codigoPostal = v.cpOrigen)
INNER JOIN Cliente c ON (v.DNI = c.DNI)
WHERE ci.nombreCiudad = "La Plata" and c.apellido = "Roma"
ORDER BY a.razon_social, a.telefono

2_

SELECT v.fecha, v.hora, c.DNI, c.nombre, c.apellido, c.telefono, c.direccion, ori.nombre, dest.nombre
FROM Viaje v 
INNER JOIN Cliente c ON (v.DNI = c.DNI)
INNER JOIN Ciudad ori ON (ori.codigoPostal = v.cpOrigen)
INNER JOIN Ciudad dest ON (dest.codigoPostal = v.cpDestino)
WHERE(v.fecha BETWEEN 01/01/2019 and 31/12/2019 and v.descripcion = "demorado")

3_

SELECT a.RAZON_SOCIAL, a.direccion, a.telef, a.email
FROM Agencia a
INNER JOIN Viaje v ON (v.razonSocial = a.razon_social)
WHERE (v.fecha BETWEEN 01/01/2019 and 31/12/2019) and (a.email LIKE "%@jmail.com")

4_

SELECT c.DNI, c.nombre, c.apellido, c.telefono, c.direccion
FROM Cliente c 
INNER JOIN Viaje v ON (v.DNI = c.DNI)
INNER JOIN Ciudad dest ON (dest.codigoPostal = v.cpDestino)
WHERE (dest.nombreCiudad = "Brandsen")
EXCEPT(
  SELECT c.DNI, c.nombre, c.apellido, c.telefono, c.direccion
  FROM Cliente c 
  INNER JOIN Viaje v ON (v.DNI = c.DNI)
  INNER JOIN Ciudad dest ON (dest.codigoPostal = v.cpDestino)
  WHERE NOT (dest.nombreCiudad = "Brandsen")
)

5_

SELECT COUNT(*) as "Cantidad de Viajes"
FROM AGENCIA a 
    INNER JOIN VIAJE v (a.RAZON_SOCIAL = v.RAZON_SOCIAL)
    INNER JOIN Ciudad c (v.cpDestino = c.CODIGOPOSTAL)
WHERE a.RAZON_SOCIAL = "TAXI Y" and c.nombreCiudad = "Villa Elisa"

6_

SELECT c.nombre, c.apellido, c.direccion, c.telefono
FROM Cliente c
WHERE c.DNI IN (
    SELECT v.DNI
    FROM Viaje v
    WHERE NOT EXIST (
        SELECT a.RAZON_SOCIAL
        FROM AGENCIA a
        EXCEPT (
            SELECT v2.RAZON_SOCIAL
            FROM VIAJE v2, AGENCIA a2
            WHERE (v2.RAZON_SOCIAL = a2.RAZON_SOCIAL) AND (v.DNI = v2.DNI)
        )
    )
)

SELECT c.nombre, c.apellido, c.direccion, c.telefono
FROM Cliente c
WHERE NOT EXIST (
    SELECT *
    FROM Agencia a
    WHERE NOT EXIST (
        SELECT *
        FROM Viaje v 
        WHERE (a.razon_social = v.razon_social) AND (v.DNI = c.DNI)
    )
)


7_
UPDATE CLIENTE SET telefono="221-4400897" WHERE DNI="38495444"

8_

SELECT a.RAZON_SOCIAL, a.direccion, a.telef
FROM AGENCIA a 
INNER JOIN VIAJE v ON (a.RAZON_SOCIAL = v.RAZON_SOCIAL)
GROUP BY v.RAZON_SOCIAL, v.direccion, v.telef
HAVING COUNT(*) >= ALL (
    SELECT COUNT(*)
    FROM VIAJE v
    GROUP BY v.RAZON_SOCIAL
)

9_
  
SELECT c.nombre, c.apellido, c.telefono
FROM CLIENTE c 
INNER JOIN VIAJE v ON (c.DNI = v.DNI)
GROUP BY c.nombre, c.apellido, c.telefono
HAVING COUNT(*) >= 10
  
10_

DELETE FROM VIAJE WHERE DNI="40325692"
DELETE FROM CLIENTE WHERE DNI="40325692"







