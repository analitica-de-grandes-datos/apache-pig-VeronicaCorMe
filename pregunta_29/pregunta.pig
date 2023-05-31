/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código en Pig para manipulación de fechas que genere la siguiente 
salida.

   1971-07-08,jul,07,7
   1974-05-23,may,05,5
   1973-04-22,abr,04,4
   1975-01-29,ene,01,1
   1974-07-03,jul,07,7
   1974-10-18,oct,10,10
   1970-10-05,oct,10,10
   1969-02-24,feb,02,2
   1974-10-17,oct,10,10
   1975-02-28,feb,02,2
   1969-12-07,dic,12,12
   1973-12-24,dic,12,12
   1970-08-27,ago,08,8
   1972-12-12,dic,12,12
   1970-07-01,jul,07,7
   1974-02-11,feb,02,2
   1973-04-01,abr,04,4
   1973-04-29,abr,04,4

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
u = LOAD './data.csv' USING PigStorage(',') AS (c1:int, firstname:chararray, lastname:chararray, fechas:chararray, color:chararray, c6:int);
registros = FOREACH u GENERATE fechas, LOWER(ToString(ToDate(fechas,'yyyy-MM-dd'), 'MMM')) AS M1, ToString(ToDate(fechas,'yyyy-MM-dd'), 'MM') AS M2, GetMonth(ToDate(fechas,'yyyy-MM-dd')) AS M3;
mes_enero = FOREACH registros GENERATE  fechas, REPLACE(M1,'jan','ene') AS M1, M2, M3;
mes_abril = FOREACH mes_enero GENERATE  fechas, REPLACE(M1,'apr','abr')AS M1, M2, M3;
mes_agosto = FOREACH mes_abril GENERATE  fechas, REPLACE(M1,'aug','ago')AS M1, M2, M3;
mes_diciem = FOREACH mes_agosto GENERATE  fechas, REPLACE(M1,'dec','dic')AS M1, M2, M3;
STORE mes_diciem INTO 'output' USING PigStorage(',');
