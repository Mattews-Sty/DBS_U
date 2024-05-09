-- 1. Encuentra la cantidad total de extintores por cada ubicación.
SELECT ubicaciones.nombre AS ubicacion, COUNT(extintores.id) AS cantidad_extintores
FROM ubicaciones
LEFT JOIN extintores ON ubicaciones.id = extintores.idubicacion
GROUP BY ubicaciones.id;

-- 2. Calcula la suma de las capacidades de todos los extintores por cada tipo de extintor.
SELECT tipos.nombre AS tipo_extintor, SUM(extintores.capacidad) AS suma_capacidades
FROM tipos
LEFT JOIN extintores ON tipos.id = extintores.idtipo
GROUP BY tipos.id;

-- 3. Obtiene la fecha de fabricación más reciente de cada tipo de extintor.
SELECT tipos.nombre AS tipo_extintor, MAX(extintores.fechafabricacion) AS fecha_fabricacion_mas_reciente
FROM tipos
LEFT JOIN extintores ON tipos.id = extintores.idtipo
GROUP BY tipos.id;

-- 4. Encuentra el número de inspecciones realizadas en cada extintor.
SELECT idextintor, COUNT(*) AS cantidad_inspecciones
FROM inspecciones
GROUP BY idextintor;

-- 5. Calcula la suma de las capacidades de los extintores suministrados por cada proveedor en un rango de fechas (usted define las fechas).
SELECT proveedores.nombre AS proveedor, SUM(extintores.capacidad) AS suma_capacidades
FROM proveedores
JOIN extintores ON proveedores.id = extintores.idproveedor
WHERE extintores.fechafabricacion BETWEEN '2024-01-01' AND '2024-05-01'
GROUP BY proveedores.id;

-- 6. Encuentra la cantidad de recargas realizadas en extintores de un tipo específico en ubicaciones que sean salas (sala 1, sala 2, sala n, etc.).
SELECT COUNT(*) AS cantidad_recargas
FROM recargas
JOIN extintores ON recargas.idextintor = extintores.id
JOIN ubicaciones ON extintores.idubicacion = ubicaciones.id
WHERE ubicaciones.nombre LIKE 'sala%' AND extintores.idtipo = 1;

-- 7. Encuentra el número de recargas realizadas en extintores cuya última inspección fue hace más de seis meses.
SELECT COUNT(*) AS cantidad_recargas
FROM recargas
JOIN inspecciones ON recargas.idextintor = inspecciones.idextintor
WHERE DATEDIFF(CURRENT_DATE(), inspecciones.fecha) > 180;

-- 8. Encuentra la cantidad de inspecciones realizadas en extintores que tienen al menos dos recargas en el último año.
SELECT COUNT(*) AS cantidad_inspecciones
FROM inspecciones
JOIN (SELECT idextintor, COUNT(*) AS recargas_ultimo_anio
      FROM recargas
      WHERE fecha >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 YEAR)
      GROUP BY idextintor
      HAVING recargas_ultimo_anio >= 2) AS recargas ON inspecciones.idextintor = recargas.idextintor;

-- 9. Determina el promedio de las capacidades de los extintores que tienen más de tres recargas en total.
SELECT AVG(extintores.capacidad) AS promedio_capacidades
FROM extintores
JOIN (SELECT idextintor, COUNT(*) AS total_recargas
      FROM recargas
      GROUP BY idextintor
      HAVING total_recargas > 3) AS recargas ON extintores.id = recargas.idextintor;

-- 10. Encuentra la cantidad de recargas realizadas en extintores cuya fecha de última inspección está entre dos fechas específicas.
SELECT COUNT(*) AS cantidad_recargas
FROM recargas
JOIN (SELECT idextintor, MAX(fecha) AS ultima_inspeccion
      FROM inspecciones
      GROUP BY idextintor) AS inspecciones ON recargas.idextintor = inspecciones.idextintor
WHERE inspecciones.ultima_inspeccion BETWEEN '2023-01-01' AND '2023-12-31';
