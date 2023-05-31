/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
filas = LOAD './data.tsv' AS (letras:chararray, fechas:chararray, valor:int);
valores = FOREACH filas GENERATE valor;
Ord = ORDER valores BY valor;
registros = LIMIT Ord 5;
STORE registros INTO 'output' USING PigStorage(',');