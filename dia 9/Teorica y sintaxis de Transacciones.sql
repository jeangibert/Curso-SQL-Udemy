-- Transacciones
-- Las transacciones en criollo son como un chequeo de que la modificacion que hagamos a la base de datos no rompa nada o deje cosas raras.
-- La idea es hacer acciones las cuales alteren estas bases de datos , podemos tener una copia de seguridad (savepoint) y luego de ejecutar
-- estas acciones y hacer un codigo que chequee la coherencia de la base de datos podamos estar seguros de que se maneje bien la base de datos!

-- Sintaxis

BEGIN;
SAVEPOINT PreVerificacion;
CALL AgregarEmpleado ("Raul","Alvarez","raulalvarez@yahoo.com.ar",5);
CALL AgregarEmpleado ("Pepe","Sanchez","pepesanchez@yahoo.com.ar",5);
-- Aca iria el codigo para el chequeo de la base de datos ,ya sea que no queden campos importantes nullos / que los mails sean de un cierto
-- dominion o miles de chequeos mas q se podrian hacer

ROLLBACK To PreVerificacion; -- Esto lo que hace es que si salta falso en el chequeo volvamos al punto de guardado!