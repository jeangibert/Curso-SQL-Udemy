SELECT * FROM episodios
Where serie_id = (SELECT serie_id FROM series Where titulo = 'The Office')

-- Utilizamos subconsultas las cuales las identificamos con los parentesis !!