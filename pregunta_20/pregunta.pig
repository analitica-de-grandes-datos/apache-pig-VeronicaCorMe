/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT
       firstname,
       color
   FROM 
       u 
   WHERE 
      color REGEXP '^[^b]';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
u = LOAD './data.csv' USING PigStorage(',') AS (c1:int, firstname:chararray, lastname:chararray, fecha:chararray, color:chararray, c6:int);
registros = FOREACH u GENERATE firstname, color;
filtros = FILTER registros BY color MATCHES '^[^b].*';
STORE filtros INTO 'output' USING PigStorage(',');

