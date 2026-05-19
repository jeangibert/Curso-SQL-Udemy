WITH cantidad_Episodios_Serie AS(
SELECT
	serie_id,
    count(serie_id) AS CantidadEpisodios,
    avg(rating_imdb) AS rating_promedio_imdb
    FROM episodios
    group by serie_id
)

SELECT
	series.titulo as 'Titulo de la serie',
    cantidad_Episodios_Serie.CantidadEpisodios AS "Cantidad de episodios",
    cantidad_Episodios_Serie.rating_promedio_imdb AS "Rating promedio de IMDb"
    FROM series

Join cantidad_Episodios_Serie
ON series.serie_id = cantidad_Episodios_Serie.serie_id

	order by rating_promedio_imdb DESC

-- Se podria haber utilizado otra CTE para la parte del ranking (es como la solucion que propone el curso)
-- pero como me salio asi y entendi la otra forma lo voy a dejar asi.
-- Al finalizar me habia dado cuenta debido a que la CTE es cantidad de episodios y en ella tmb calculo
-- el rating y esto podria quedar medio confuso 