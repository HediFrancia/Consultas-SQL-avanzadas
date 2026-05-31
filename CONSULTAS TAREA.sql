--INSERTAR NUEVO PROPIETARIO
INSERT INTO propietarios (nombre, apellido, email, telefono)
VALUES ('Carlos', 'Arias', 'carlos.arias@email.com', '+503-7890-1234');

SELECT * FROM propietarios

-- INSERTAR ALOJAMIENTO
INSERT INTO alojamientos (id_propietario, nombre, descripcion tipo, direccion, ciudad, pais, precio_noche, capacidad_personas, num_habitaciones, num_banos)
VALUES (6, 'Apartamento Villa Pamplona', 'Apartamento recién moedelado''apartamento', 'Calle Venecia', 'La libertad', 'El Salvador', 85.00, 4, 2, 2);

select * from alojamientos 

-- INSERTAR HUESPED 
INSERT INTO huespedes (nombre, apellido, email, nacionalidad)
VALUES ('Rodrigo', 'Cerritos', 'cerritos.r@email.com', 'Estados Unidos');

select * from huespedes

--INSERTAR RESERVA
INSERT INTO reservas (id_alojamiento, id_huesped, fecha_entrada, fecha_salida, num_personas, precio_total)
VALUES (11, 6, '2026-06-10', '2026-06-15', 3, 425.00);

SELECT * FROM reservas

--INSERTAR PAGO
INSERT INTO pagos (id_reserva, monto, metodo_pago)
VALUES (15, 425.00, 'tarjeta');

select * from pagos

-- SELECT ALOJAMIENTOS ACTIVOS

SELECT * FROM ALOJAMIENTOS
--
SELECT nombre, tipo, ciudad, precio_noche
FROM alojamientos
WHERE activo = true;

 -- SELECT  Huéspedes por país
SELECT nombre, apellido, email, nacionalidad
FROM huespedes
WHERE nacionalidad = 'Estados Unidos';

-- SELECT - Reservas por fechas (BETWEEN)
SELECT id_reserva, fecha_entrada, fecha_salida, precio_total
FROM reservas
WHERE fecha_entrada BETWEEN '2025-07-01' AND '2025-08-31';

-- UPDATE - Actualizar precio
UPDATE alojamientos
SET precio_noche = 50.00
WHERE id_alojamiento = 1;

select * from alojamientos

-- UPDATE - Estado reserva
select * from reservas 

UPDATE reservas
SET estado = 'completada'
WHERE id_reserva = 5;

 -- DELETE - Eliminar reseña
 select * from resenas
 
DELETE FROM resenas
WHERE id_resena = 3;


-- JOIN - Reservas + huésped (INNER JOIN)
SELECT 
    r.id_reserva,
    r.fecha_entrada,
    r.precio_total,
    h.nombre,
    h.apellido,
    h.nacionalidad
FROM reservas r
INNER JOIN huespedes h ON r.id_huesped = h.id_huesped;

--JOIN - Alojamiento completo (INNER JOIN múltiple)
SELECT 
    aloja.nombre AS alojamiento,
    aloja.ciudad,
    p.nombre AS propietario,
    r.fecha_entrada
FROM alojamientos aloja
INNER JOIN propietarios p ON aloja.id_propietario = p.id_propietario
INNER JOIN reservas r ON aloja.id_alojamiento = r.id_alojamiento;

 -- JOIN - Pagos + reservas (JOIN combinado)
SELECT 
    pag.monto,
    pag.metodo_pago,
    r.fecha_entrada,
    h.nombre AS huesped
FROM pagos pag
INNER JOIN reservas r ON pag.id_reserva = r.id_reserva
INNER JOIN huespedes h ON r.id_huesped = h.id_huesped;


-- LEFT JOIN - Sin reseñas (incluye nulls)
SELECT 
    a.nombre AS alojamiento,
    COUNT(res.id_resena) AS total_resenas
FROM alojamientos a
LEFT JOIN resenas res ON a.id_alojamiento = res.id_alojamiento
GROUP BY a.nombre
HAVING COUNT(res.id_resena) = 0;

