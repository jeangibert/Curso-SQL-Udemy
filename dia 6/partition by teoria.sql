SELECT
titulo,
genero,
año_lanzamiento,
row_number() over(partition by genero order by año_lanzamiento DESC) AS ranking_genero
from series

-- Partition by lo que hace es subdividir por bloques segun el argumento que le pasemos , en este caso
-- lo dividimos por generos y hacemos un rankin con la funcion row_number