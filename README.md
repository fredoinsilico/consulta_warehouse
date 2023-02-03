# Consulta_warehouse

DESCRIPCION : Consulta para obtener el mes con mayor diferencia entre (ingresos y egresos) comparados mes a mes del warehouse de la tienda de nuestra base de datos

SOFTWARE: MYSQL WorkBench 8.0

PROCESO: El proceso realiza una consulta que en su interior tiene Subconsultas con INNER JOINs de tablas distintas, teniendo como separacion los años (2019 y 2020) 
         y la diferencia mes a mes (Es decir -> Obtenemos una ganancia total por mes, restando las ganancias del mes de Enero 2020 - las Ganancias de Enero del 2019, 
         anotando ello dentro del campo Dif_mesAmes para el mes 1 referente a enero)         
         El INNER JOIN general une los campos por la columna *Mes* comparando los datos del 2019 y 2020.
         Se añadio un ORDER BY para obtener los resultados de mayor a menor. 
         
         INGRESOS = Ventas (Precio * Cantidad)
         EGRESOS = Compras (Precio * Cantidad) – Gastos
         
Resultado: El Resultado fue una fila con el valor para mes = *4* y Dif_mesAmes = 1744266.320 que en resumidas cuentas nos indica que los ingresos fueron mayores para
           la diferencia de Abril 2020 menos Abril 2019


