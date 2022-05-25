#================================== VIEWS ================================================

CREATE VIEW vw_cliped as
	SELECT c.cod_cliente as codigo, 
		   c.nome_cliente as nome, 
		   p.cod_cliente as pedido,
           p.data_pedido as data_requisicao
	   FROM tbl_cliente c, tbl_pedido p
       WHERE c.cod_cliente = p.cod_cliente;
SELECT * FROM vw_cliped;

CREATE VIEW vw_clipedprod as
	SELECT c.cod_cliente as codigo, 
		   c.nome_cliente as nome,
           p.cod_pedido as pedido,
           p.data_pedido as data_requisicao,
           i.i_cod_produto as produto, i.qtde
	   FROM tbl_cliente c, tbl_pedido p, tbl_itempedido i
       WHERE c.cod_cliente = p.cod_cliente
       AND i.i_cod_pedido = p.cod_pedido;
SELECT * FROM vw_clipedprod;
       
CREATE VIEW vw_produtototal as
	SELECT c.cod_cliente as codigo,
		   c.nome_cliente as nome,
           p.cod_pedido as pedido,
           p.data_pedido as data_requisicao,
		   i.i_cod_produto as produto,
           pr.nome_produto as descricao, i.qtde,
           pr.valor, i.qtde * pr.valor as totalcomprado
	   FROM tbl_cliente c, tbl_pedido p, tbl_itempedido i, tbl_produto pr
       WHERE c.cod_cliente = p.cod_cliente
       AND i.i_cod_pedido = p.cod_pedido
       AND i.i_cod_produto = pr.cod_produto;
SELECT * FROM vw_produtototal;
       
CREATE VIEW vw_consolidavenda(cod_pedido, cod_produto, valor) as
	SELECT p.cod_pedido,
		   i.i_cod_produto, i.qtde * pr.valor
	   FROM tbl_pedido p, tbl_itempedido i, tbl_produto pr
       WHERE i.i_cod_pedido = p.cod_pedido
       AND i.i_cod_produto = pr.cod_produto;
SELECT * FROM vw_consolidavenda;
       
CREATE VIEW vw_vendatotal(cod_pedido, total_valor) as
	SELECT p.cod_pedido, SUM(i.qtde * pr.valor)
    FROM tbl_pedido p, tbl_itempedido i, tbl_produto pr
    WHERE i.i_cod_pedido = p.cod_pedido
    AND i.i_cod_produto = pr.cod_produto
    GROUP BY p.cod_pedido;
SELECT * FROM vw_vendatotal;
