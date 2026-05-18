SELECT * FROM series
WHERE genero = "Ciencia ficción"
UNION ALL
SELECT * FROM series
WHERE genero = "Drama"
-- Union All preserva repetidos 
-- Puede haber varios Unions ALL
