-- Pregunta 1
-- ¿Quien es el actor o actriz que ha participado en la mayor cantidad de series?
SELECT actor_id,count(actor_id) AS Cantidad_Actuaciones FROM actuaciones
GROUP BY actor_id
ORDER BY Cantidad_Actuaciones DESC
LIMIT 1;
-- El actor que participio en mas series (2) es el actor con id 18
-- Pregunta 2
-- ¿Cual es la serie con mejor rating promedio segun imdb?
SELECT serie_id , avg(rating_imdb) AS Rating_Promedio FROM episodios
GROUP BY serie_id
ORDER BY Rating_Promedio DESC
LIMIT 1;
-- La serie con mejor rating en IMDB es la de id 8 con 9.22727
-- Pregunta 3
-- ¿Cual es el episodio con la duración más larga?
SELECT * FROM episodios
ORDER BY duracion desc
LIMIT 1;
-- El episodio que mas dura es The Sign of Three

