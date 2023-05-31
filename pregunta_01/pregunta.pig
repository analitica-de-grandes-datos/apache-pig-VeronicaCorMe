/* 
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra.
Almacene los resultados separados por comas. 

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
filas = LOAD './data.tsv' AS (letras:chararray, fechas:chararray, valor:int);
letras_agrupadas = GROUP filas BY letras;
Conteo = FOREACH letras_agrupadas GENERATE group, COUNT(filas);
STORE Conteo INTO 'output' USING PigStorage(',');