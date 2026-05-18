SELECT titulo,rating_imdb,
	IF(rating_imdb >= 8,"Alto","Bajo") AS "Categoria de rating"
    From episodios ;

SELECT nombre,YEAR(fecha_nacimiento),
if(year(fecha_nacimiento) > 2000 , "Joven" , "Mayor") as "Año de nacimiento"
FROM actores;

	SELECT titulo , año_lanzamiento,
		CASE
			WHEN año_lanzamiento >= 2020 THEN "Nueva"
			WHEN año_lanzamiento BETWEEN 2010 and 2019 THEN "Clasica"
			ELSE "Antigua"
			END as Categoria
		From Series
