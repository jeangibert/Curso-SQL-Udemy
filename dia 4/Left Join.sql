SELECT s.titulo,
e.titulo
FROM series AS s
LEFT JOIN episodios AS e
ON s.serie_id = e.serie_id
ORDER BY s.tituloduracionduracionduracion