-- Ej 1
SELECT
	titulo,
    rating_imdb,
    rank() over (Order by rating_imdb DESC) as ranking_imdb
    From episodios
