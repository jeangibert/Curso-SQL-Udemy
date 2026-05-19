-- Ej 1
SELECT
	titulo,
    duracion,
    dense_rank () OVER (order by duracion DESC) as ranking_por_duracion
    FROM episodios