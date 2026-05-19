WITH cantidadSeries AS (
SELECT año_lanzamiento, count(*) As total_series FROM series
WHERE series.genero = 'Ciencia ficción'
group by año_lanzamiento
)

SELECT * FROM cantidadSeries
ORDER by cantidadSeries.año_lanzamiento
