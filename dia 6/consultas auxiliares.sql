WITH ListaEpisodios AS (
SELECT serie_id,titulo FROM episodios
),
ListaSeries AS (
SELECT serie_id,titulo FROM series
)

SELECT * FROM ListaEpisodios
LEFT JOIN ListaSeries
ON ListaEpisodios.serie_id = ListaSeries.serie_id

-- Tienen el mismo funcionamiento que las funciones auxiliares en python , para identificar varias utilizamos
-- el with de apertura y luego con comas separamos de las demas "consultas recursivas" me hace ruido 
-- este nombre asi que yo le digo consultas auxiliares (: