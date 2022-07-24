/*clase 13;*/
use proyecto_spotify;
select * from cancion;

select MIN(duracion),
	AVG (duracion),
	MAX (duracion)
from cancion; /*minima, promedio, max*/

select max(fechacreacion)
from playlist
where titulo like '%A%'; /*contenga la A, en titulo, va a buscar la mas nueva. '%__n__%' de una palabra con 5 caracteres*/

select count(duracion),
	sum (duracion)
    from cancion; /*contar cuantas canciones tengo y va  a sumar toda la duracion de duracion*/

select Pais_idpais,
		count(*)
from usuario
group by Pais_idpais; /*agrupados por pais, que seleccione el id de pais y la cantidad de usuarios por pais*/

select Pais_idpais,
	count(*) as Cantidad
from discografica
group by Pais_idpais
having count(*) >5; /*agrupamos idpais de discografica. mostrame el pasis y la cantidad de discofraficas por pais, ademas, que eso que esta contando sea mayor a 5. me muestra los paises que tengan mas de 5 discograficas*/

select Password,
		count(*) as cantidad,
        min(fecha) as primerafecha,
        max(fecha) as ultimafecha
from passwordxusuario
group by Password
order by count(*) desc; 
/*agrapamos por password, el tipo de password, cuanta gente uso la misma contraseña, tambien cuando fue la primera y ultima vez que se uso la misma contraseña, y lo tiene que ordenar de manera desc */

select ca.titulo as cancion
from cancion ca
join album al 
on ca.idalbum = al.idalbum
where al.imagenportada is null; /*vamos a unir dos tablas, cancion y album, les pone un psedonimo CA AL, tambien se puede obviar la palabra as, 
se puede obviar el alias para no mezclar, entnces, mostra el titulo de las canciones que cumplen con su album no tiene imagen de portada, si el 
album no tiene portada mostrame todas las caciones*/

select ca.titulo as cancion,
	al.titulo as album,
    ar.nombre as banda
from cancion ca
join album al 
on ca.idalbum = al.idalbum
join artista ar 
on al.idartista = ar.idartista
where ca.titulo like '%z%';
/*titulo de cancion lo cambia a cancion, al titulo de album lo muestra como album, nombre de artista lo muestra como banda
une tres listas, cancion, album y artista
id cancion = id de album. idartista = id artista, siempre y cuando el titulo de la cancion tenga un z*/
/*me traigo titulo de la tabla cancion, titul de la tabla album, nomb de la tabla artista.
como cada dato esta en tabla distintas hay que hacer el join de las tablas
*/

select p.titulo as playlist, u.nombreusuario
from playlist p 
join usuario u on p.usuario = u.idusuario
order by cantcanciones desc 
limit 1;
/*muestra la playlist con mas canciones y el nombre el usuario del duño de esa playlis*/

select nombreusuario,
	count(*)
from usuario u 
join playlist p on u.idusuario = p.idusuario
group by nombreusuario; 
/*agrupa nombreusuario, las cuenta, de la tabla usuario, une con playlis a traves de idusuario y idus, de playlis no 
muestra nada. cuenta de aquellos usuarios cuantas plylist tienen*/

select nombreusuario,
	count(*)
from usuario u 
group by nombreusuario; /*cuenta por nombre de usuario, mira los usuarios con el mismo nombre los agrupa y los cuenta*/

select u.nombreusuario,
		max(date_add(p.fecha,interval 90 day))
from passwordxusuario p 
join ususario u on p.idusuario = u.idusuario
group by u.nombreusuario;

/*agrupa nombre de usuario de la tabla usuario, podemos pensar como un bank de cuantos dias de antiguedad tiene este password, 
de las contraseña mas nueva cuato tiene de antiguedad. 
nos va a mostrar el nombree de usuario y la fecha adelantada en 90 dias de la tabla passwordxusuario p unidas las dos tablas
agrupada por nombre de usuario
date_add, hace que a una fecha le sume 90 dias*/