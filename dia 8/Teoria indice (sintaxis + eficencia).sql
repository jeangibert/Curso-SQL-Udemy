-- INDICES
-- Al momento de tener un gran volumen de datos y queremos facilitar la busqueda a traves de un campo por ejemplo apellido , podemos utilizar
-- indices , los cuales dado un campo creamos un indice y podemos buscar filas con este mismo.
-- Esto puede facilitar la busqueda pero dificulta la inserccion o eliminacion de elementos ya que utiliza el tipo de estructura de datos
-- de B-TREE , es un arbol el cual tiene distintos nodos que utiliza como señales para detectar si el indice es mayor o menor que estos nodos.
-- Por eso al insertar o modificar hay que arreglar esta estructura con lo cual puede hacer menos eficiente

CREATE INDEX idx_apellido
ON Empleados(apellido);

-- Creamos el indice id apellido en la tabla empleados en el campo de apellidos para facilitar la busqueda por apellidos