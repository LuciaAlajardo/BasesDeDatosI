/*1 Listar los servicios básicos de la habitación nro 25*/

use la_aprobacion;
select * from habitacion;

SELECT servicio_basico.nombre 
from habitacion
inner join habitacion_x_servicio_basico 
ON habitacion.numero = habitacion_x_servicio_basico.habitacion_numero
inner join servicio_basico 
ON habitacion_x_servicio_basico.servicio_basico_id = servicio_basico.id
WHERE numero = 25;


/*2 Listar absolutamente todos los servicios básicos y la cantidad de habitaciones en
las que están instalados. Mostrar sólo el nombre del servicio básico y cantidad.*/

SELECT servicio_basico.nombre, count(habitacion.numero)  from habitacion
inner join habitacion_x_servicio_basico ON habitacion.numero = habitacion_x_servicio_basico.habitacion_numero
inner join servicio_basico ON habitacion_x_servicio_basico.servicio_basico_id = servicio_basico.id
GROUP BY servicio_basico.nombre;


/*3 Listar todos los huéspedes que tengan tres o más check-in. Mostrar el número
de huésped, apellido y nombre separado por un espacio dentro de una misma
columna denominada "Cliente" y, la cantidad de check-in que posee.*/

select * from huesped;

select huesped.id,
		concat(huesped.apellido, " ", huesped.nombre) as Cliente,
        count(checkin.id)
from huesped
inner join checkin 
on huesped.id = checkin.huesped_id
group by huesped.id
having count(checkin.id) >=3;

/*4 Listar todos los huéspedes que no tengan un check-in. Mostrar el número de
huésped, apellido y nombre en mayúsculas dentro de una misma columna
denominada "huésped sin check-in".*/

select huesped.id, upper(concat(huesped.apellido," ",huesped.nombre)) AS "huésped sin check-in" 
from huesped 
left join checkin on huesped.id = checkin.huesped_id 
where checkin.huesped_id IS NUlL;

/*5 Listar todos los huéspedes que tengan al menos un check-in que corresponda a
la habitación de clase 'Classic'. Se debe mostrar el número de huésped, apellido,
nombre, número de habitación y la clase.*/

select huesped.id, huesped.apellido, huesped.nombre, habitacion.numero, habitacion.clase_id 
from huesped 
inner join checkin on huesped.id = checkin.huesped_id
inner join habitacion ON checkin.habitacion_numero = habitacion.numero
WHERE habitacion.clase_id = 2
GROUP BY huesped.id;

/*6 Listar los huéspedes que tengan una o más reservas y que en la segunda letra de
su apellido contenga una "u". Se debe mostrar el número de huésped, apellido,
nombre, nombre del servicio.*/

select huesped.id, huesped.apellido, huesped.nombre, servicio_extra.nombre AS "nombre del servicio"
from huesped
inner join reserva ON  reserva.huesped_id  = huesped.id
inner join servicio_extra ON reserva.servicio_extra_id = servicio_extra.id
WHERE huesped.apellido like "_u%";

/*7 Listar absolutamente todos los países y la cantidad de huéspedes que tengan*/

select pais.nombre,
		count(huesped.id)
from huesped 
inner join pais on pais.id = huesped.pais_id
group by pais.nombre;

/*8 Calcular el importe total y la cantidad de reservas realizadas en el mes de marzo
por cada huésped. Mostrar el apellido del huésped, importe total y cantidad de
reservas.*/
select huesped.id, huesped.apellido, sum(reserva.importe), count(reserva.id)
FROM huesped
inner join reserva ON reserva.huesped_id = huesped.id
WHERE  MONTH(reserva.fecha) = 3
GROUP BY huesped.apellido;

/*9 Calcular el importe total recaudado por mes (fecha de entrada) para la
habitación número 22. Mostrar el número de habitación, nombre de la
decoración, clase, nombre del mes y el importe total.*/

select habitacion.numero, decoracion.nombre AS "decoracion", clase.nombre AS "clase", MONTHNAME(checkin.fecha_entrada) AS "mes fecha entrada", sum(checkin.importe) AS "importe total" from checkin
inner join habitacion ON checkin.habitacion_numero = habitacion.numero
inner join decoracion ON habitacion.decoracion_id = decoracion.id
inner join clase ON habitacion.clase_id = clase.id
WHERE habitacion.numero = 22
GROUP BY MONTHNAME(checkin.fecha_entrada);

/*10 Determinar la recaudación total por país para las habitaciones número 5, 10 y
22. Mostrar nombre del país, número de habitación y el total recaudado.*/

select pais.nombre, checkin.habitacion_numero, sum(importe) 
from checkin
inner join huesped on huesped.id = checkin.huesped_id
inner join pais on pais.id = huesped.pais_id
inner join habitacion on habitacion.numero = checkin.habitacion_numero
where checkin.habitacion_numero in (5, 10, 22)
group by pais.nombre , checkin.habitacion_numero;

/*11 Calcular la recaudación total de cada forma de pago para las reservas. Mostrar la
forma de pago y el total.*/

select *,sum(importe)  from reserva
inner join forma_pago ON reserva.forma_pago_id = forma_pago.id
group by forma_pago.nombre;

/*12 Listar los empleados del sector 'administración' que su país de origen sea
'Argentina'. Mostrar el número de legajo, apellido, la primera inicial del primer
nombre y un punto, nombre de su país de origen y el nombre del sector.*/

select empleado.legajo,
		empleado.apellido,
        concat(left(empleado.nombre,1), ".") as "nombre",
        pais.nombre as "pais",
        sector.nombre as "sector"
from empleado
inner join pais on empleado.pais_id = pais.id
inner join sector on empleado.sector_id = sector.id
where pais.nombre = "Argentina" and empleado.sector_id = 1;

/*13 Listar todos los servicios básicos que tienen las habitaciones (desde la 20 hasta
la 24) y su clase. Mostrar número de habitación, clase y el nombre de los
servicios básicos. Ordenar por número de habitación y servicio.*/

select habitacion_x_servicio_basico.habitacion_numero,clase.nombre,servicio_basico.nombre 
from habitacion
inner join habitacion_x_servicio_basico 
on habitacion_x_servicio_basico.habitacion_numero = habitacion.numero
inner join servicio_basico on servicio_basico.id=habitacion_x_servicio_basico.servicio_basico_id
inner join clase on clase.id = habitacion.clase_id
where habitacion_x_servicio_basico.habitacion_numero between 20 and 24;

/*14 Listar las decoraciones que no están aplicadas en ninguna habitación.*/

SELECT * 
FROM decoracion
LEFT JOIN habitacion ON habitacion.decoracion_id=decoracion.id
WHERE habitacion.decoracion_id is null OR habitacion.decoracion_id= " ";

/*15 Listar todos los empleados categorizándolos por edad. Las categorías son:
'junior' (hasta 35 años), 'semi-senior' (entre 36 a 40 años) y 'senior' (más de 40).
Mostrar el apellido, nombre, edad, categoría y ordenar por edad.*/

select apellido, nombre,  TIMESTAMPDIFF(YEAR,fecha_nacimiento,CURDATE()) AS "edad", 
CASE
	WHEN TIMESTAMPDIFF(YEAR,fecha_nacimiento,CURDATE()) <= 35 THEN "junior"
	WHEN TIMESTAMPDIFF(YEAR,fecha_nacimiento,CURDATE()) BETWEEN 36 AND 40 THEN "semi-senior"
    ELSE "senior"
 END AS "categoría"
 FROM empleado
 ORDER BY TIMESTAMPDIFF(YEAR,fecha_nacimiento,CURDATE());
 /*---------------------*/

/*---------------------*/
/*16 Calcular la cantidad y el promedio de cada forma de pago para los check-in.
Mostrar la forma de pago, cantidad y el promedio formateado con dos
decimales.*/

select forma_pago.nombre, 
		count(*) as "cantidad",
        sum(checkin.importe) as total, 
		avg(checkin.importe) as promedio 
from checkin 
inner join forma_pago 
where checkin.forma_pago_id = forma_pago.id
group by forma_pago.nombre;



/*17 Calcular la edad de los empleados de Argentina. Mostrar el apellido, nombre y la
edad del empleado.*/

select empleado.apellido, empleado.nombre, TIMESTAMPDIFF(YEAR,fecha_nacimiento,CURDATE()) AS "edad"
from empleado
inner join pais ON empleado.pais_id = pais.id
WHERE pais.id = 1;


/*18 Calcular el importe total para los check-in realizados por el huésped 'Mercado
Joel'. Mostrar apellido, nombre, importe total y el país de origen.*/

select huesped.nombre as nombre, huesped.apellido as apellido, pais.nombre as pais, 
	sum(importe) as importe 
from checkin 
join huesped 
join pais 
where huesped.id = checkin.huesped_id and huesped.pais_id = pais.id and huesped.nombre = 'Joel' and huesped.apellido = 'Mercado'
group by huesped_id;

/*19 Listar la forma de pago empleada por cada servicio extra. Se debe mostrar el
nombre del servicio extra, nombre de la forma de pago y calcular la cantidad y
total recaudado.*/

select servicio_extra.nombre, forma_pago.nombre, 
	count(*) as cantidad, sum(reserva.importe) as importe 
from reserva join servicio_extra 
join forma_pago 
where reserva.servicio_extra_id = servicio_extra.id and reserva.forma_pago_id = forma_pago_id
group by servicio_extra.nombre, forma_pago.nombre;

/*20 Listar la forma de pago empleada para el servicio extra 'Sauna' y los huéspedes
correspondientes. Se debe mostrar el nombre del servicio extra, nombre de la
forma de pago, número del cliente e importe total.*/

select huesped.id as numeroCliente, servicio_extra.nombre, forma_pago.nombre, 
	sum(importe) 
    from huesped 
    join servicio_extra 
    join reserva 
    join forma_pago
    where huesped.id = reserva.huesped_id and forma_pago.id = reserva.forma_pago_id and servicio_extra.nombre = 'Sauna'
    group by huesped.id;
    
    
    
    
    
    
    
    --
select apellido
from empleado;




    
    