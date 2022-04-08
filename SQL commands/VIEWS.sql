#================================================= VIEWS =====================================
/*BANCO BD_Vendas <------------------*/

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



#=================================== EXERCÍCIOS =====================================

##====================== EXERCÍCIO A
CREATE VIEW vw_exercicioA as
	SELECT c.cod_cliente as codigo, 
		   c.nome_cliente as nome,
           p.cod_pedido as pedido,
           p.data_pedido as data_requisicao,
           p.data_entrega as data_entrega,
           i.i_cod_produto as produto, i.qtde
	   FROM tbl_cliente c, tbl_pedido p, tbl_itempedido i
       WHERE c.cod_cliente = p.cod_cliente
       AND i.i_cod_pedido = p.cod_pedido
       AND data_pedido > "2014-01-30";
SELECT * FROM vw_exercicoA;

##====================== EXERCÍCIO B
CREATE VIEW vw_exercicioB as
	SELECT c.cod_cliente as codigo,
		   c.nome_cliente as nome,
           p.cod_pedido as pedido,
           p.data_pedido as data_requisicao,
           p.data_entrega as data_entrega,
           i.qtde as quantidade,
		   i.i_cod_produto as produto,
           pr.nome_produto as descricao
	   FROM tbl_cliente c, tbl_pedido p, tbl_itempedido i, tbl_produto pr
       WHERE c.cod_cliente = p.cod_cliente
       AND i.i_cod_pedido = p.cod_pedido
       AND i.i_cod_produto = pr.cod_produto
       AND i.qtde > 25;
       
#INSERT DE TESTE DO EXERCÍCIO B
INSERT INTO tbl_itempedido(qtde, i_cod_pedido, i_cod_produto, i_valor)VALUES
(26, 1, 2, 7.50),
(10, 1, 5, 7.89),
(10, 1, 7, 6.90);
SELECT * FROM vw_exercicioB;

##====================== EXERCÍCIO C
CREATE VIEW vw_exercicioC as
	SELECT p.cod_pedido as pedido,
		   c.cod_cliente as codigo_cliente,
           i.qtde as quantidade,
		   i.i_cod_produto as produto,
           pr.nome_produto as descricao
	   FROM tbl_cliente c, tbl_pedido p, tbl_itempedido i, tbl_produto pr
       WHERE c.cod_cliente = p.cod_cliente
       AND i.i_cod_pedido = p.cod_pedido
       AND i.i_cod_produto = pr.cod_produto;
SELECT * FROM vw_exercicioC;

#====================== EXERCÍCIO D
CREATE VIEW vw_exercicioD as
	SELECT i.i_cod_produto as produto,
           pr.nome_produto as descricao,
           pr.valor as valor_atual,
           (pr.valor * 1.112) as valor_reajustado
	   FROM tbl_itempedido i, tbl_produto pr
       WHERE i.i_cod_produto = pr.cod_produto;
SELECT * FROM vw_exercicioD;