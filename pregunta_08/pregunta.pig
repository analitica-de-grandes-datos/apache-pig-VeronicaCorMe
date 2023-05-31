/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
columna 3 es:

  ((b,jjj), 216)

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
filas = LOAD './data.tsv' USING PigStorage('\t') AS (c1:chararray, c2:bag{}, c3:map[]);
columnas = FOREACH filas GENERATE FLATTEN(c2) AS t1, FLATTEN(c3) AS t2;
grupos = GROUP columnas BY ($0,$1);
cuenta = FOREACH grupos GENERATE group, COUNT(columnas);
STORE cuenta INTO 'output' USING PigStorage(',');