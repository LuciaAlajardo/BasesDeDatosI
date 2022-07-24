/*clase 14*/

select c.nombre as club, f.nombre, f.posicion
from club c
inner join futbolista f
on c.id = f.id_club; /*la consulta asi devuelve una lista de clubes y sus futbolistas*/
/*para que traiga a todos los futbolistas aunque no tengan club, hay que cambiar el inner por un right*/

--

select p.id, p.nombre, p.importe
from producto p
inner join venta v
on p.id = v.id_productos; /*devuelve una lista de productos, y del importe vendido*/

/*left, que devuelva todos los productos, aunque no hayan generado ventas*/
--
select e.id, e.nombre,c.nombre
from estudiante e
inner join curso c 
on e.id = c.id_estudiante; 
/*right: develva todos los cursos aunque ningun estudiante se haya inscripto en dicho curso*/

--

select p.nombre as pelicula, d.nombre as director
from peliculas p 
inner join director d
on p.director_id = d.id;
/*listar todas las peliculas que no tengan director
aca tendria que ir un where
resolucion */

select p.nombre as pelicula, d.nombre as director
from peliculas p 
left join director d
on p.director_id = d.id 
where d.id is null;
/*me pide, primero todas las peliculas, left join director, y despues, todas las peliculas que no tienen director, voy a donde d.id is null, me pide que el valor del dir no exista */

--

select pa.nombre as pais, concat(pe.apellido, '', pe.nombre) as presidente
from pais pa
left join persona pe 
on pa.presidente = pe.id; /*devuelve una lista de paises y sus presidentes
da el nombre del pais, contatena nombre y apellido del presi
como tiene el left y trae todo lo de la primera tabla, traeria si hay personas sin pais
no muestra personas que no esten asociadas como presidentes de un pais 
para que muestre todas las personas sean presidentes de un pais o no, deveria ser con un right*/

--

/*mostrar todos los paises tenga o no presidente*/

select *
from pais
left join personas
on paises.presidente = personas.idpersonas;

--

/*mostrar todass las personas sean presidentes o no.*/

select * 
from paises
right join personas
on  paises.presidente = personas.idpersonas;

--

/*mstrar solo los paises con presidente*/

select *
from pais
inner join personas
on paises.presidente = personas.idpersonas;

-- 

/*mostrar los paises que NO tienen presidente*/
/*si no necesitamos traer info de la otra tabla*/

select * 
from paises 
where presidente is null;

--

/*mostrar aquellos artistas que han actuado en dos o mas peliculas segun nuestra base de datos*/

select artista_x_pelicula.artista_id, count(*)
from artista 
inner join artista_x_pelicula
on artista.id =artista_x_pelicula.artista_id
group by artista_x_pelicula.artista_id
having count(*) > 1; 

/*tengo que seleccionar de la tabla artista x pelicula artista id, contar de la tabla artista, unir de la tabla artista x pelicula, a traves de la fk y la pm y agrupar por el id de artista y contar cuanto es */

--






