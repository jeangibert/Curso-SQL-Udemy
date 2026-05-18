SELECT * FROM series
WHERE genero = "Ciencia ficción"
UNION
SELECT * FROM series
WHERE genero = "Drama"
-- Union NO preserva repetidos 
-- Puede haber varios UNION
