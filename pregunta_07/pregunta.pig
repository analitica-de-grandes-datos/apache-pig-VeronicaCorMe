/*
Pregunta
===========================================================================

Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
columna 3 separados por coma. La tabla debe estar ordenada por las 
columnas 1, 2 y 3.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
filas = LOAD './data.tsv' USING PigStorage('\t') AS (c1:chararray, c2:bag{}, c3:map[]);
cuenta = FOREACH filas GENERATE c1 AS letras, COUNT(c2) AS t2, SIZE(c3) AS t3;
Ord = ORDER cuenta BY letras, t2, t3;
STORE Ord INTO 'output' USING PigStorage(',');