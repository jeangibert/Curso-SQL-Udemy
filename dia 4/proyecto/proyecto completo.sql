-- ¿Qué géneros son más prevalentes en la base de datos NetflixDB? 
-- Genera una lista de los distintos géneros y la cantidad de series por cada uno.
SELECT genero, count(genero) as cantidad_series
FROM series
GROUP BY genero
ORDER BY cantidad_series DESC;

-- Esta consulta SQL nos permite ver cuántas series hay en cada género dentro de la base de datos NetflixDB. 
-- Agrupando las series por su género y contándolas, podemos identificar cuáles géneros son más prevalentes.


-- ¿Cuáles son las tres series con mayor rating IMDB y cuántos episodios tienen? 
-- Considera usar un JOIN para combinar la información de las tablas de series y episodios.
SELECT s.titulo AS "Titulo de Serie",
	   count(e.serie_id) AS "Cantidad de episodios",
       max(e.rating_imdb) AS "Rating Maximo"
FROM Series AS s
INNER JOIN Episodios AS e
ON s.serie_id = e.serie_id
GROUP BY s.titulo
Order BY max(e.rating_imdb) DESC
Limit 3;
	
-- Con esta consulta, identificamos las tres series con el mayor rating IMDB 
-- en la base de datos y contamos cuántos episodios tiene cada una de ellas, combinando información de las tablas Series y Episodios.

-- ¿Cuál es la duración total de todos los episodios para la serie "Stranger Things"? 
-- Este análisis te permitirá entender el compromiso temporal necesario para ver una serie completa.
SELECT Series.titulo AS "Serie",
	   sum(Episodios.duracion) AS "Duracion Total"
FROM Series 
JOIN Episodios
ON Series.serie_id = Episodios.serie_id
Where Series.titulo = "Stranger Things"





