/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       color 
   FROM 
       u 
   WHERE 
       color NOT LIKE 'b%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

*/
filas = LOAD './data.csv' USING PigStorage(',') AS (c1:int, nombre:chararray, apellido:chararray, fecha:chararray, color:chararray, c6:int);
registros = FOREACH filas GENERATE color;
flitros = FILTER registros BY (NOT (color matches '[b].*'));
STORE flitros INTO 'output' USING PigStorage(',');