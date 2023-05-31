/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname 
   FROM 
       u 
   WHERE 
       SUBSTRING(firstname, 0, 1) >= 'm';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
u = LOAD './data.csv' USING PigStorage(',') AS (c1:int, firstname:chararray, lastname:chararray, fecha:chararray, color:chararray, c6:int);
nombres = FOREACH u GENERATE  firstname;
filtros = FILTER nombres BY SUBSTRING(firstname,0,1) >= 'M';
STORE filtros INTO 'output' USING PigStorage(',');
