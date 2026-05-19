SELECT
	titulo,
    rating_imdb,
    RANK() OVER (order by rating_imdb) AS ranking_imdb
    FROM episodios
    
-- La idea es la misma que row number solo que maneja distinto los empates;
-- En este caso si 2 episodios tienen la misma valoracion no asigna uno sobre el otro si no
-- le pone el mismo rango! Pero si hay 4 primer puesto , el segundo puesto pasara a estar en 5to lugar
