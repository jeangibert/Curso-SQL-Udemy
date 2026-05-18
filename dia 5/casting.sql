DESCRIBE series;
-- Nos devuelve los tipos de datos de una tabla
SELECT * FROM episodios
Where CAST(fecha_estreno AS DATE) > "2010-01-01";
-- Si hay un mal diseño de la base de datos sobre la eleccion de los tipos de datos nos podemos asegurar que las operaciones de fecha
-- van a hacer validas casteando el campo
SELECT * FROM episodios
Where CAST(fecha_estreno AS UNSIGNED) > "2010-01-01"; -- En este caso si usamos este tipo de datos no se cumple bien el filtrado
