SELECT titulo,
año_lanzamiento,
ROW_NUMBER() OVER (Order by año_lanzamiento desc) AS clasificacion_global
from series