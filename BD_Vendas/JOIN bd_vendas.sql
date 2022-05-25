#Relembrando JOIN

#INNER JOIN
SELECT * FROM tbl_cliente as c
	JOIN tbl_pedido as p
    ON c.cod_cliente = p.cod_cliente;
    
#LEFT JOIN
SELECT * FROM tbl_cliente as c LEFT JOIN tbl_pedido as p
	ON c.cod_cliente = p.cod_cliente;
    
#RIGHT JOIN
SELECT * FROM tbl_pedido as p RIGHT JOIN tbl_cliente as c
	ON 	P.cod_cliente = c.cod_cliente;
    