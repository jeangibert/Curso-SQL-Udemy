SELECT 
s.titulo,
a.personaje
FROM series AS s
INNER JOIN actuaciones AS a
ON a.serie_id = s.serie_id
Where s.titulo = "Breaking Bad"
-- Join = Inner Join da lo mismo escribirlo de una o otra