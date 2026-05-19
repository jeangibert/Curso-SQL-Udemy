WITH primerosEpisodiosSeries AS(
    SELECT serie_id,min(fecha_estreno) AS fechaEstreno FROM episodios
    group by serie_id
)
SELECT series.titulo AS "Título de la Serie" , primerosEpisodiosSeries.fechaEstreno AS "Fecha del Primer Episodio"
FROM series
JOIN primerosEpisodiosSeries
ON series.serie_id = primerosEpisodiosSeries.serie_id
ORDER BY fechaEstreno ASC


        