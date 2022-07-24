/*clase 16*/

/*Realizar una consulta sobre la tabla canciones con la siguiente información:
● Solo los 10 primeros caracteres del nombre de la canción en mayúscula.
● La duración de la canción expresada en minutos. Ejemplo 5:10
● El peso en kbytes en número entero (sin decimales, 1000 bytes = 1 kb)
● El precio formateado con 3 decimales, Ej: $100.123
● El primer compositor de la canción (notar que si hay más de uno,
mostrar separados por coma)
si no tiene compositor, mostrar sin datos*/

USE musimundos;
select * from canciones;

select substring(upper(nombre),1,10) AS CANCION, /*para cortar y mayus Otra manera es, left/right(nombre,10) a este no se le aclara desde donde*/
sec_to_time(round(milisegundos/1000, 0)) AS DURACION, /*lo dividimos para que pase a segundos, y despues agregamos la funcion*/
/*round es para que redondee*/
round(bytes/1000) AS KBYTES,
concat('$', format(precio_unitario, 3))AS PRECIO, /*concatenamos con el signo $*/
case
	when compositor IS NULL or compositor = '' THEN '<sin datos>'
    ELSE substring_index(compositor, ',', 1) 
END AS COMPOSITOR
/*le pasamos el string, el limitador, y el nuro de coma que queremos encontrar*/
from canciones;
