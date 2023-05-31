/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
aparece cada letra minúscula en la columna 2.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
filas = LOAD './data.tsv' USING PigStorage('\t') AS (Letra_may:chararray, letra_minus:bag{}, otr:chararray);
columnas = FOREACH filas GENERATE FLATTEN (letra_minus) AS letra;
grouped = GROUP columnas BY letra;
cuenta = FOREACH grouped GENERATE group, COUNT(columnas);
STORE cuenta INTO 'output' USING PigStorage(',');