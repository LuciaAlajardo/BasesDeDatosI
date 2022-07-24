/*  
CAMADA 5
CHEKPOINT 3
GRUPO NUMERO 9  
    
INTEGRANTES: 
1. GABRIELA BERNAL
2. GEORGINA PALAVECINO
3. LUCIA ALAJARDO
4. ROCIO LEE
5. VICTORIA FRENCH

*/
/* 1. Listar los servicios básicos de la habitación número 25*/

SELECT servicio_basico.nombre FROM habitacion
INNER JOIN habitacion_x_servicio_basico ON habitacion.numero = habitacion_x_servicio_basico.habitacion_numero
INNER JOIN servicio_basico ON habitacion_x_servicio_basico.servicio_basico_id = servicio_basico.id
WHERE numero = 25;

-- RESULTADO: 4 FILAS.

/* 2. Listar absolutamente todos los servicios básicos y la cantidad de habitaciones en las que están instalados.
Mostrar sólo el nombre del servicio básico y cantidad.*/

SELECT servicio_basico.nombre AS 'Servicio Basico', count(habitacion.numero) AS cantidad  FROM habitacion
INNER JOIN habitacion_x_servicio_basico ON habitacion.numero = habitacion_x_servicio_basico.habitacion_numero
INNER JOIN servicio_basico ON habitacion_x_servicio_basico.servicio_basico_id = servicio_basico.id
GROUP BY servicio_basico.nombre;

-- RESULTADO: 10 FILAS.

/*3. Listar todos los huéspedes que tengan tres o más check-in. Mostrar el número de huésped, apellido y nombre separado por
un espacio dentro de una misma columna denominada "Cliente" y, la cantidad de check-in que posee.*/

SELECT huesped.id AS 'Numero de Huesped', CONCAT(huesped.apellido," ",huesped.nombre) AS "Cliente", COUNT(checkin.id) AS 'Cantidad CheckIN'
FROM huesped
INNER JOIN checkin ON huesped.id = checkin.huesped_id
group by huesped.id
HAVING COUNT(checkin.id) >= 3;

-- RESULTADO: 23 FILAS.

/*4. Listar todos los huéspedes que no tengan un check-in. Mostrar el número de huésped, apellido y nombre  en mayúsculas dentro de una misma columna
denominada "huésped sin check-in".*/

SELECT huesped.id, upper(concat(huesped.apellido," ",huesped.nombre)) AS "huésped sin check-in" 
FROM checkin
RIGHT JOIN huesped ON huesped.id = checkin.huesped_id
WHERE checkin.huesped_id IS NULL;

-- RESULTADO: 16 FILAS.


/* 5. Listar todos los huéspedes que tengan al menos un check-in que corresponda a
la habitación de clase 'Classic'. Se debe mostrar el número de huésped, apellido,
nombre, número de habitación y la clase.*/

SELECT huesped.id AS 'Numero de Huesped', huesped.apellido AS Apellido , huesped.nombre AS Nombre, checkin.habitacion_numero AS 'Numero de habitacion',
 clase.nombre AS Clase  
FROM huesped
INNER JOIN checkin ON checkin.huesped_id = huesped.id
INNER JOIN habitacion ON checkin.habitacion_numero = habitacion.numero
INNER JOIN clase ON clase.id = habitacion.clase_id
WHERE Clase.nombre = 'Classic';

-- RESULTADO: 47 FILAS 

/* 6. Listar los huéspedes que tengan una o más reservas y que en la segunda letra de
su apellido contenga una "u". Se debe mostrar el número de huésped, apellido,
nombre, nombre del servicio.*/

SELECT huesped.id AS 'Numero de huesped', huesped.apellido AS Apellido, huesped.nombre AS Nombre, servicio_extra.nombre AS Servicio FROM huesped
INNER JOIN reserva ON reserva.huesped_id = huesped.id
INNER JOIN servicio_extra ON servicio_extra.id = reserva.servicio_extra_id
WHERE huesped.apellido LIKE "_u%";

-- RESULTADO: 10 FILAS

/* 7. Listar absolutamente todos los países y la cantidad de huéspedes que tengan.*/

SELECT pais.nombre AS Pais, count(huesped.id) AS 'Cantidad de húespedes' FROM pais
LEFT JOIN huesped ON huesped.pais_id = pais.id
GROUP BY pais.nombre;

-- RESULTADO: 20 FILAS


/* 8. Calcular el importe total y la cantidad de reservas realizadas en el mes de marzo
por cada huésped. Mostrar el apellido del huésped, importe total y cantidad de
reservas.*/

SELECT huesped.apellido AS Apellido , sum(checkin.importe) AS 'Importe Total', count(reserva.huesped_id) AS 'Cantidad de Reservas' 
FROM huesped
INNER JOIN checkin ON checkin.huesped_id = huesped.id
INNER JOIN reserva ON reserva.huesped_id = huesped.id
WHERE month(reserva.fecha)=3
GROUP BY huesped.id;

-- RESULTADO: 9 FILAS

/*9 Calcular el importe total recaudado por mes (fecha de entrada) para la
habitación número 22. Mostrar el número de habitación, nombre de la
decoración, clase, nombre del mes y el importe total.*/

SELECT habitacion.numero, decoracion.nombre AS "DECORACION", clase.nombre AS "CLASE", MONTHNAME(checkin.fecha_entrada) AS "MES DE ENTRADA", 
		SUM(checkin.importe) AS "IMPORTE TOTAL" 
FROM checkin
INNER JOIN habitacion ON checkin.habitacion_numero = habitacion.numero
INNER JOIN decoracion ON habitacion.decoracion_id = decoracion.id
INNER JOIN clase ON habitacion.clase_id = clase.id
WHERE habitacion.numero = 22
GROUP BY MONTHNAME(checkin.fecha_entrada);

-- RESULTADO: 3 filas

/* 10 Determinar la recaudación total por país para las habitaciones número 5, 10 y 22. 
Mostrar nombre del país, número de habitación y el total recaudado.*/

SELECT pais.nombre AS "NOMBRE PAIS", checkin.habitacion_numero AS "NUMERO DE HABITACION", 
		SUM(importe) AS "TOTAL RECAUDADO"
FROM checkin
INNER JOIN huesped ON huesped.id = checkin.huesped_id
INNER JOIN pais ON pais.id = huesped.pais_id
INNER JOIN habitacion ON habitacion.numero = checkin.habitacion_numero
WHERE checkin.habitacion_numero IN (5, 10, 22)
GROUP BY pais.nombre , checkin.habitacion_numero;

-- RESULTADOS: 8 filas

/* 11 Calcular la recaudación total de cada forma de pago para las reservas. Mostrar la
forma de pago y el total.*/

SELECT forma_pago.nombre AS "FORMA DE PAGO", 
		SUM(reserva.importe) AS "TOTAL" 
FROM reserva
INNER JOIN forma_pago ON reserva.forma_pago_id = forma_pago.id
GROUP BY forma_pago.nombre;

-- RESULTADO: 4 filas


/*12. Listar los empleados del sector 'administración' que su país de origen sea
'Argentina'. Mostrar el número de legajo, apellido, la primera inicial del primer
nombre y un punto, nombre de su país de origen y el nombre del sector. */
 
SELECT legajo, apellido, concat(SUBSTRING(emp.nombre,1,1) ,'. ') AS Nombre ,pa.nombre AS Pais, sec.nombre AS Sector
FROM empleado emp
INNER JOIN sector sec ON emp.sector_id = sec.id
INNER JOIN pais pa ON pa.id = emp.pais_id
WHERE sec.nombre = 'administración' AND pa.nombre = 'Argentina';

-- 3 rows selected

/*13. Listar todos los servicios básicos que tienen las habitaciones (desde la 20 hasta
la 24) y su clase. Mostrar número de habitación, clase y el nombre de los
servicios básicos. Ordenar por número de habitación y servicio.*/

SELECT numero, cla.nombre AS clase , serbasic.nombre AS servicio
FROM  habitacion hab
INNER JOIN habitacion_x_servicio_basico habxserv ON hab.numero = habxserv.habitacion_numero
INNER JOIN servicio_basico serbasic ON habxserv.servicio_basico_id = serbasic.id
INNER JOIN clase cla ON hab.clase_id = cla.id
WHERE numero BETWEEN 20 AND 24
ORDER BY numero, serbasic.nombre;

-- 28 rows selected

/*14. Listar las decoraciones que no están aplicadas en ninguna habitación.*/

SELECT  deco.nombre  AS 'Decoraciones no Aplicadas' FROM decoracion deco
LEFT JOIN habitacion hab ON hab.decoracion_id = deco.id
WHERE numero IS NULL;

-- RESULTADO: 2 rows selected

/*15. Listar todos los empleados categorizándolos por edad. Las categorías son:
'junior' (hasta 35 años), 'semi-senior' (entre 36 a 40 años) y 'senior' (más de 40).
Mostrar el apellido, nombre, edad, categoría y ordenar por edad*/

SELECT apellido, nombre, TIMESTAMPDIFF(YEAR,fecha_nacimiento,NOW()) AS edad, fecha_nacimiento, (
CASE 
	WHEN timestampdiff(YEAR,fecha_nacimiento,NOW()) <= 35 THEN 'junior'
    WHEN timestampdiff(YEAR,fecha_nacimiento,NOW()) BETWEEN  36 AND 40 THEN 'semi-senior' 
    WHEN timestampdiff(YEAR,fecha_nacimiento,NOW()) >= 41  THEN 'senior' 
END) AS categoria
FROM empleado
ORDER BY TIMESTAMPDIFF(YEAR,fecha_nacimiento,NOW());

-- RESULTADO: 25 rows selected


/* 16.  Calcular la cantidad y el promedio de cada forma de pago para los check-in.
Mostrar la forma de pago, cantidad y el promedio formateado con dos
decimales */

SELECT forma_pago.nombre AS "Forma de Pago",  count(*) AS "Cantidad" , ROUND(AVG(checkin.importe),2) AS "Promedio"
FROM forma_pago
INNER JOIN checkin ON checkin.forma_pago_id = forma_pago.id
GROUP BY forma_pago.nombre;

-- 4 row(s) returned


/* 17. Calcular la edad de los empleados de Argentina. Mostrar el apellido, nombre y la
edad del empleado.*/

SELECT empleado.apellido AS "Apellido", empleado.nombre AS "Nombre", pais.nombre AS "Pais", TRUNCATE((DATEDIFF(NOW(), fecha_nacimiento)/365.25), 0 ) AS "Edad"
FROM empleado
INNER JOIN pais ON empleado.pais_id = pais.id
WHERE pais.nombre = "Argentina";

-- 17 row(s) returned

/* 18. Calcular el importe total para los check-in realizados por el huésped 'Mercado
Joel'. Mostrar apellido, nombre, importe total y el país de origen*/

SELECT CONCAT(huesped.nombre, " ", huesped.apellido) AS "Nombre Completo", SUM(checkin.importe) AS "Importe total", pais.nombre AS "Pais Origen" 
FROM Huesped 
INNER JOIN checkin ON checkin.huesped_id = huesped.id
INNER JOIN pais ON pais.id = huesped.pais_id 
WHERE huesped.nombre = "Joel" AND huesped.apellido = "Mercado";

-- 1 row(s) returned

/* 19. Listar la forma de pago empleada por cada servicio extra. Se debe mostrar el
nombre del servicio extra, nombre de la forma de pago y calcular la cantidad y
total recaudado.*/

SELECT servicio_extra.nombre AS "Servicio extra", forma_pago.nombre AS "Forma de pago", SUM(servicio_extra.costo_hora) AS "Total recaudado" 
FROM servicio_extra 
INNER JOIN reserva ON reserva.servicio_extra_id = servicio_extra_id
INNER JOIN forma_pago ON reserva.forma_pago_id = reserva.id
GROUP BY forma_pago.nombre, servicio_extra.nombre;

-- RESULTADO: 16 FILAS


/* 20. Listar la forma de pago empleada para el servicio extra 'Sauna' y los huéspedes correspondientes. Se debe mostrar el nombre del servicio extra, 
nombre de la forma de pago, numero del cliente e importe total.*/

SELECT servicio_extra.nombre AS "Servicio Extra" , forma_pago.nombre AS "Forma de Pago" , huesped.id AS "Numero Huesped" ,reserva.importe AS "importe total"
FROM huesped
INNER JOIN reserva ON huesped.id = reserva.huesped_id
INNER JOIN forma_pago ON reserva.forma_pago_id = forma_pago.id 
INNER JOIN servicio_extra ON reserva.servicio_extra_id = servicio_extra.id
WHERE servicio_extra.nombre = "Sauna";

-- RESULTADO: 25 FILAS

