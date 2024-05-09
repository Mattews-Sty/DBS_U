SELECT ubicaciones.nombre AS ubicacion, COUNT(extintores.id) AS cantidad_extintores
FROM ubicaciones
LEFT JOIN extintores ON ubicaciones.id = extintores.idubicacion
GROUP BY ubicaciones.id;

SELECT tipos.nombre AS tipo_extintor, SUM(extintores.capacidad) AS suma_capacidades
FROM tipos
LEFT JOIN extintores ON tipos.id = extintores.idtipo
GROUP BY tipos.id;

SELECT tipos.nombre AS tipo_extintor, MAX(extintores.fechafabricacion) AS fecha_fabricacion_mas_reciente
FROM tipos
LEFT JOIN extintores ON tipos.id = extintores.idtipo
GROUP BY tipos.id;

SELECT idextintor, COUNT(*) AS cantidad_inspecciones
FROM inspecciones
GROUP BY idextintor;

SELECT proveedores.nombre AS proveedor, SUM(extintores.capacidad) AS suma_capacidades
FROM proveedores
JOIN extintores ON proveedores.id = extintores.idproveedor
WHERE extintores.fechafabricacion BETWEEN '2024-01-01' AND '2024-05-01'
GROUP BY proveedores.id;

SELECT COUNT(*) AS cantidad_recargas
FROM recargas
JOIN extintores ON recargas.idextintor = extintores.id
JOIN ubicaciones ON extintores.idubicacion = ubicaciones.id
WHERE ubicaciones.nombre LIKE 'sala%' AND extintores.idtipo = 1;

SELECT COUNT(*) AS cantidad_recargas
FROM recargas
JOIN inspecciones ON recargas.idextintor = inspecciones.idextintor
WHERE DATEDIFF(CURRENT_DATE(), inspecciones.fecha) > 180;

SELECT COUNT(*) AS cantidad_inspecciones
FROM inspecciones
JOIN (SELECT idextintor, COUNT(*) AS recargas_ultimo_anio
      FROM recargas
      WHERE fecha >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 YEAR)
      GROUP BY idextintor
      HAVING recargas_ultimo_anio >= 2) AS recargas ON inspecciones.idextintor = recargas.idextintor;

