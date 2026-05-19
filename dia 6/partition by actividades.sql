-- Ej 1
SELECT temporada,
        titulo,
        fecha_estreno,
        row_number()over(partition by temporada order by fecha_estreno DESC) AS ranking_temporada
        FROM episodios;
-- Ej 2
SELECT temporada,
        titulo,
        rating_imdb,
        ROW_NUMBER() OVER (partition by temporada order by rating_imdb DESC) AS "Ranking IMDb"
        FROM episodios
        Where serie_id = 2;
        
        

        