SELECT fecha_estreno,year(fecha_estreno),month(fecha_estreno),day(fecha_estreno) FROM episodios;

SELECT fecha_estreno,
DATE_ADD(fecha_estreno,INTERVAL	30 DAY) 
FROM episodios;

SELECT * ,DATEDIFF(CURDATE(),fecha_estreno) AS "Dias de estreno"

FROM episodios;
