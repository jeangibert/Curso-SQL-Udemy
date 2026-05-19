SELECT
	titulo,
    descripcion
FROM 
	series
WHERE descripcion REGEXP '(?i)londres'
    
    
-- (?i) Busca patrones sin que nos importen las minusculas o mayusculas
