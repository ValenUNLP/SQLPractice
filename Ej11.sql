1_

SELECT v.matricula, v.CUIT, v.nombYAp, v.direccion, v.telefono, COUNT(*) as Cantidad supervisiones
FROM Veterinario v 
INNER JOIN Supervision s ON (v.matricula = s.matricula)
WHERE (s.fechaSale BETWEEN "01/01/2020" AND "31/01/2020")
GROUP BY v.matricula, v.CUIT, v.nombYAp, v.direccion, v.telefono

2_

SELECT v.matricula, v.CUIT, v.nombYAp, v.direccion, v.telefono
FROM Veterinario v
WHERE NOT EXISTS (
  SELECT *
  FROM Supervision s
  WHERE (s.fechaSale is null)
)

3_

SELECT m.nombre, m.edad, m.raza, m.peso, m.telefonoContacto
FROM Mascota m
INNER JOIN Supervision s ON (s.codMascota = m.codMascota)
INNER JOIN Veterinario v ON (v.matricula = s.matricula)
WHERE (v.nombreYAp = "Oscar Lopez")
ORDER BY m.nombre, m.raza 

4_

UPDATE Veterinario SET nombYAp= "Pablo Lopez" WHERE matricula=MP 10000’

5_

SELECT m.nombre, m.edad, m.raza, m.peso, m.telefonoContacto
FROM Mascota m
INNER JOIN Supervision s ON (s.codMascota = m.codMascota)
INNER JOIN Veterinario v ON (v.matricula = s.matricula)
WHERE (v.matricula = "MP 1000") and m.codMascota IN (
  SELECT s.codMascota
  FROM Supervision s 
  INNER JOIN Veterinario v ON (v.matricula = s.matricula)
  WHERE (v.matricula = "MN 4545") and (s.codMascota = m.codMascota)
)

6_

SELECT b.nroBox, b.m2, b.ubicación, b.capacidad, m.nombre
FROM Box b
INNER JOIN Supervision s ON (s.nroBox = b.nroBox)
INNER JOIN Mascota m ON (s.codMascota = m.codMascota)
WHERE (s.fechaEntra BETWEEN "01/01/2020" and "31/12/2020")

