SELECT titulo, año_lanzamiento , genero ,
ROW_NUMBER() OVER (Order by año_lanzamiento ASC) FROM SERIES;
-- Row number lo que hace es asignar un numero a cada fila dependiendo del orden que se asigne en este caso
-- estaba ordenado segun el año de lanzamiento de la serie (dentro del segundo parentesis)
-- es muy importante entender que row number es una columna mas por lo cual va dentro del select

WITH OrdenSeries as(
SELECT titulo, año_lanzamiento , genero ,
ROW_NUMBER() OVER (Order by año_lanzamiento DESC) AS orden_lanzamiento
FROM SERIES)

SELECT * FROM OrdenSeries
WHERE orden_lanzamiento in (1,2,3)

