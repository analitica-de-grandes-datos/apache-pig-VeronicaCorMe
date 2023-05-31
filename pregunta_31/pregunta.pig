/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Cuente la cantidad de personas nacidas por año.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
u = LOAD './data.csv' USING PigStorage(',') AS (c1:int, firstname:chararray, lastname:chararray, fecha:chararray, color:chararray, c6:int);
registros = FOREACH u GENERATE SUBSTRING(fecha,0, 4) AS yyyy;
grouped = GROUP registros BY yyyy;
cuenta = FOREACH grouped GENERATE group, COUNT(registros);
STORE cuenta INTO 'output' USING PigStorage(',');
