/*
Pregunta
===========================================================================

Ordene el archivo `data.tsv`  por letra y valor (3ra columna). Escriba el
resultado separado por comas.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

     >>> Escriba el codigo del mapper a partir de este punto <<<
*/
filas = LOAD './data.tsv' AS (letras:chararray, fechas:chararray, valor:int);
Ord =   ORDER filas BY letras, valor;
STORE Ord INTO 'output' USING PigStorage(',');