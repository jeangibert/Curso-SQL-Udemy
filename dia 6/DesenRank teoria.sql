SELECT
	titulo,
    rating_imdb,
    DENSE_RANK() OVER (order by rating_imdb DESC) as ranking_imdb
    FROM episodios


-- Es lo mismo que rank solo que no saltea puestos de clasificacion por empates como rank si no que sigue
-- en el orden sin importan si se repiten elementos en el podio anterior