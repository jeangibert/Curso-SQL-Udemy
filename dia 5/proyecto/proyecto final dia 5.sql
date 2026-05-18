SELECT series.titulo as "Titulo de serie"
,año_lanzamiento as "Año Lanazamiento",
avg(episodios.rating_imdb) AS "Rating promedio IMDB" ,
series.genero as "Genero"

FROM series

JOIN 
Episodios ON series.serie_id = episodios.serie_id

Where genero IN (SELECT genero FROM(
SELECT genero FROM series
GROUP BY genero
ORDER BY count(genero) DESC
LIMIT 3) as top3) 

GROUP by series.serie_id

ORDER BY avg(episodios.rating_imdb) DESC

-- Costo bastante en entender que para calcular el rating promedio iba a tener que unir las dos tablas para poder agrupar el rating promedio
-- por la id de la serie , despues para separar el genero es recoemndable la subconsultas realizarlas aparte y luego incrustarlas en el codigo
-- para evitar mareos 
-- Tambien algo raro es el doble select del where que esto se utiliza , es para aclarlarle al IDLE que seleccionamos la 
-- columna genero porque si no no te deja ejecutar (ya que MYSQL no permite usar limit dentro de una subconsulta por su
-- "optimizador de consultas " prohibieron esta sintaxis con lo cual tenemos que transformar ese limit en un select). 
-- Despues todo ok (:

