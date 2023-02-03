USE warehouse;

SELECT in_2019.Mes,in_2020.ingreso_2020-in_2019.ingreso_2019 as Dif_mesAmes
FROM
(SELECT ve.mes Mes,ve.Ventas-co.Compras-ga.Gastos AS ingreso_2019
FROM (SELECT YEAR(Fecha),MONTH(Fecha) mes,SUM(Precio*Cantidad) AS Ventas
      FROM venta 
      WHERE YEAR(Fecha)=2019
      GROUP BY YEAR(Fecha),MONTH(Fecha)) AS ve
INNER JOIN (SELECT YEAR(Fecha),MONTH(Fecha) mes,SUM(Precio*Cantidad) AS Compras
            FROM compra
			WHERE YEAR(Fecha)=2019
            GROUP BY YEAR(Fecha),MONTH(Fecha)) AS co USING(mes)
INNER JOIN (SELECT YEAR(Fecha),MONTH(Fecha) mes,SUM(Monto) AS Gastos
            FROM gasto
            WHERE YEAR(Fecha)=2019
            GROUP BY YEAR(Fecha),MONTH(Fecha)) AS ga USING(mes)) AS in_2019
            
INNER JOIN (SELECT ve.mes Mes,ve.Ventas-co.Compras-ga.Gastos AS ingreso_2020
FROM (SELECT YEAR(Fecha),MONTH(Fecha) mes,SUM(Precio*Cantidad) AS Ventas
      FROM venta 
      WHERE YEAR(Fecha)=2020
      GROUP BY YEAR(Fecha),MONTH(Fecha)) AS ve
INNER JOIN (SELECT YEAR(Fecha),MONTH(Fecha) mes,SUM(Precio*Cantidad) AS Compras
            FROM compra
			WHERE YEAR(Fecha)=2020
            GROUP BY YEAR(Fecha),MONTH(Fecha)) AS co USING(mes)
INNER JOIN (SELECT YEAR(Fecha),MONTH(Fecha) mes,SUM(Monto) AS Gastos
            FROM gasto
            WHERE YEAR(Fecha)=2020
            GROUP BY YEAR(Fecha),MONTH(Fecha)) AS ga USING(mes)) AS in_2020
USING(Mes)
ORDER BY 2 DESC;