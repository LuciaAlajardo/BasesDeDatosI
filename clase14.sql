clase 14
/*fk siempre apuntana otra tabla*/
select nombre, apellido
from estudiates
where pais in ('Arg,', 'uru'); /*nombre y apellido de estudiantes que tengan de pais de origen arg o uru*/

select nro_factura, importe
from facturas
order by importe desc;
/*trae nro de factura e importe de facturas y ordenar por importe desc*/

select carrera, count(*)
from alumnos
group by carrera;
/*me agrupa por carrera, las cuenta, de la tabla alumnos, y nos dice cuantos alumnos tengo por carrera*/

select carrera, count(*)
from alumnos
group by carrera
having count(*) > 5; 
/*agrupa por carrera, las cuenta, trae las carreras con mayor a 5 alumnos*/

/*para borrar un registro que tiene una fk hay que ir a la otra tabla y borrar eso, los datos que apuntan a la tabla*/

select * from album
where imagenportada is not null; /*mostrame todos los almbums con imagen de portada*/

select * from album
where imagenportada is null; /*mostrame todos los almbums sin imagen de portada*/


select album.IdAlbum, count(*) as cantCanciones 
from cancion
inner join album on /*donde*/ album.idAlbum = cancion.idAlbum 
where album.titulo like '%e%'
group by album.titulo
having cantCanciones >2 /*la cantidad de albunes que tengan mayor a 2 canciones*/
order by cantCanciones desc
limit 3;
/*si en el select tenemos una agrupacion va, lo que tengo en el group by o funcion de agregacion*/

