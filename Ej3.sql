1_

SELECT c.nombre, c.anioFundacion
FROM Club c
INNER JOIN Ciudad ciu ON (c.codigoCiudad = ciu.codigoCiudad)
WHERE (ciu.nombre = "La Plata") and (NOT EXIST(
  SELECT *
  FROM Estadio e
  WHERE (e.codigoClub = c.codigoClub)
))

SELECT c.nombre, c.anioFundacion
FROM Club c 
    LEFT JOIN Estadio e ON (c.codigoClub = e.codigoClub)
    INNER JOIN Ciudad ciu ON (c.codigoCiudad = ciu.codigoCiudad)
WHERE ciu.nombre = "La Plata" and e.codigoEstadio IS NULL

2_

SELECT c.nombre
FROM Club c
WHERE NOT EXIST (
  SELECT *
  FROM ClubJugador cj
  INNER JOIN Jugador j ON (cj.DNI = j.DNI)
  INNER JOIN Ciudad ciu ON (ciu.codigoCiudad = j.codigoCiudad)
  WHERE(c.codigoClub = cj.codigoClub) and (ciu.nombre = "Berisso")
)


3_

SELECT j.DNI, j.nombre, j.apellido
FROM Jugador j
INNER JOIN ClubJugador cj ON (cj.DNI = j.DNI)
INNER JOIN Club c ON (c.codigoClub = cj.codigoClub)
WHERE(Club.nombre = "Gimnasiaxd")

4_

SELECT j.DNI, j.nombre, j.apellido
FROM Jugador j
INNER JOIN ClubJugador cj ON (cj.DNI = j.DNI)
INNER JOIN Club c ON (c.codigoClub = cj.codigoClub)
INNER JOIN Ciudad ciu ON (Club.codigoCiudad = ciu.codigoCiudad)
WHERE(j.edad >= 29) and (ciu.nombre = "Cordoba")
  
5_

SELECT c.nombre, AVG(j.edad) as Promedio
FROM Club c LEFT JOIN ClubJugador cj ON (c.codigoClub = cj.codigoClub)
INNER JOIN Jugador j ON (cj.DNI = j.DNI)
WHERE cj.hasta IS NULL
GROUP BY c.codigoClub, c.nombre

6_

SELECT j.nombre, j.apellido, j.edad, COUNT(*) as Cantidad
FROM Jugador j INNER JOIN ClubJugador cj ON (j.DNI = cj.DNI)
GROUP BY j.DNI, j.nombre, j.apellido, j.edad

7_

SELECT c.nombre
FROM Club c
WHERE NOT EXIST(
  SELECT *
  FROM ClubJugador cj
  INNER JOIN Jugador j ON (j.DNI = cj.DNI)
  INNER JOIN Ciudad ciu ON (j.codigoCiudad = ciu.codigoCiudad)
  WHERE (cj.codigoClub = c.codigoClub) and (ciu.nombre = "Mar del Plata")
)

8_
  
SELECT j.nombre, j.apellido
FROM Jugador j
WHERE NOT EXIST (
    SELECT *
    FROM Club c 
    WHERE NOT EXIST (
        SELECT *
        FROM ClubJugador cj 
        WHERE (cj.codigoClub = c.codigoClub) AND (cj.DNI = j.DNI)
    )
)
  
9_

 INSERT INTO Club (codigoClub, nombre, anioFundacion, codigoCiudad(FK))
 VALUES (1234,"Estrella de Berisso","1921",(
    SELECT c.codigoCiudad
    FROM Ciudad 
    WHERE Ciudad.nombre = "Berisso"
    )
 )
