SELECT titulo FROM series
Where serie_id IN (SELECT serie_id FROM Episodios GROUP BY serie_id HAVING (avg(rating_imdb) > 8))
-- Seleccionamos los titulos de las series que tengan mayor rating promedio a 8 , es muy importante a la hora de utilizar where
-- si el filtrado nos devuelve mas de un dato vamos a tener q usar In ya que no sirve el = en este caso