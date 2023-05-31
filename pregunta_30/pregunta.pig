/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el codigo en Pig para manipulación de fechas que genere la siguiente
salida.

   1971-07-08,08,8,jue,jueves
   1974-05-23,23,23,jue,jueves
   1973-04-22,22,22,dom,domingo
   1975-01-29,29,29,mie,miercoles
   1974-07-03,03,3,mie,miercoles
   1974-10-18,18,18,vie,viernes
   1970-10-05,05,5,lun,lunes
   1969-02-24,24,24,lun,lunes
   1974-10-17,17,17,jue,jueves
   1975-02-28,28,28,vie,viernes
   1969-12-07,07,7,dom,domingo
   1973-12-24,24,24,lun,lunes
   1970-08-27,27,27,jue,jueves
   1972-12-12,12,12,mar,martes
   1970-07-01,01,1,mie,miercoles
   1974-02-11,11,11,lun,lunes
   1973-04-01,01,1,dom,domingo
   1973-04-29,29,29,dom,domingo

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

u = LOAD './data.csv' USING PigStorage(',') AS (c1:int, firstname:chararray, lastname:chararray, fechas:chararray, color:chararray, c6:int);
registros = FOREACH u GENERATE fechas, ToString(ToDate(fechas,'yyyy-MM-dd'), 'dd') AS D1, ToString(ToDate(fechas,'yyyy-MM-dd'), 'd') AS D2, ToString(ToDate(fechas,'yyyy-MM-dd'), 'EEEE') AS D4;
dia_lunes = FOREACH registros GENERATE fechas, D1,D2,REPLACE(D4,'Monday', 'lun,lunes') AS D4;
dia_martes = FOREACH dia_lunes GENERATE fechas, D1,D2,REPLACE(D4,'Tuesday', 'mar,martes')AS D4;
dia_miercoles = FOREACH dia_martes GENERATE fechas, D1,D2,REPLACE(D4,'Wednesday', 'mie,miercoles')AS D4;
dia_jueves = FOREACH dia_miercoles GENERATE fechas, D1,D2,REPLACE(D4,'Thursday', 'jue,jueves')AS D4;
dia_viernes = FOREACH dia_jueves GENERATE fechas, D1,D2,REPLACE(D4,'Friday', 'vie,viernes')AS D4;
dia_sabado = FOREACH dia_viernes  GENERATE fechas, D1,D2,REPLACE(D4,'Saturday', 'sab,sabado')AS D4;
dia_domingo = FOREACH dia_sabado GENERATE fechas, D1,D2,REPLACE(D4,'Sunday', 'dom,domingo')AS D4;
STORE dia_domingo INTO 'output' USING PigStorage(',');