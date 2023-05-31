/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Genere una relación con el apellido y su longitud. Ordene por longitud y 
por apellido. Obtenga la siguiente salida.

  Hamilton,8
  Garrett,7
  Holcomb,7
  Coffey,6
  Conway,6

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
filas = LOAD './data.csv' USING PigStorage(',') AS (c1:int, nombre:chararray, apellido:chararray, fecha:chararray, color:chararray, c6:int);
apellidos = FOREACH filas GENERATE apellido, SIZE(apellido) AS longitud;
Ord = ORDER apellidos BY  longitud DESC, apellido;
resultado = LIMIT Ord 5;
STORE resultado INTO 'output' USING PigStorage(',');