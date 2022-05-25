create DATABASE bd_vendas;
USE bd_vendas;

CREATE TABLE tbl_produto(
	cod_produto   int unsigned auto_increment,
    nome_produto  varchar(100) not null,
    desc_produto  varchar(100) not null,
    unid_medida   varchar(2) not null,
    estoque_atual int default 0,
    estoque_min   int default 0,
    estoque_max   int default 0,
    valor		  decimal(10,2) not null,
    primary key(cod_produto)
);

CREATE TABLE tbl_endereco(
	id int(10) not null,
    cep int(9) not null,
    logradouro varchar(90) not null,
    bairro varchar(50) not null,
    cidade varchar(50) not null,
    estado char(2) not null,
    
    constraint pk_endereco primary key (cep)
);

CREATE TABLE tbl_cliente(
	cod_cliente  int unsigned auto_increment,
    nome_cliente varchar(45) not null,
    cpf			 varchar(11) default '',
    data_nasc	 date,
    cep			 int(9) default 0,
    numero		 varchar(10) default '',
    complemento  varchar(20) default '',
    primary key (cod_cliente),
    constraint foreign key fk_cliencep (cep) references tbl_endereco(cep)
);

CREATE TABLE tbl_pedido(
	cod_pedido   int unsigned auto_increment,
    data_pedido  date,
    data_entrega date,
    cod_cliente  int unsigned not null,
    primary key (cod_pedido),
    constraint fk_cliente foreign key (cod_cliente)
    references tbl_cliente (cod_cliente)
);

CREATE TABLE tbl_itempedido(
	qtde		  int unsigned not null,
    i_cod_pedido  int unsigned not null,
    i_cod_produto int unsigned not null,
    i_valor		  decimal(10,2) not null,
    constraint fk_pedido1
		foreign key (i_cod_pedido)
        references tbl_pedido (cod_pedido),
	constraint fk_tbl_produto1
		foreign key (i_cod_produto)
        references tbl_produto(cod_produto)
);

CREATE TABLE tbl_log(
	id_log int not null auto_increment primary key,
    usuario varchar(50) not null,
    dt_log date not null,
    hora time not null,
    tipo_operacao varchar(15),
    comando text
);


INSERT INTO tbl_produto(nome_produto, desc_produto, unid_medida,
estoque_atual, estoque_min, estoque_max, valor)VALUES
("Arroz", "Arroz agulinha tipo 1", "SC", 10, 2, 20, 12.50),
("Feijão", "Feijão carioquinha com casca", "SC", 25, 5, 60, 7.50),
("Macarrão", "Macarrão Adria espaguete", "PC", 50, 10, 80, 5.50),
("Óleo,", "Óleo Lisa", "LT", 15, 10, 45, 6.50),
("Vinagre", "Vinagre Castelo", "GR", 30, 10, 50, 7.89),
("Batata", "Batata lavada", "KG", 100, 50, 200, 4.50),
("Tomate", "Tomate vermelho", "KG", 80, 8, 160, 6.90),
("Cebola", "Cebola com casca", "KG", 50, 5, 100, 6.99),
("Leite", "Leite Leco", "CX", 25, 10, 90, 2.50),
("Café", "Café do Ponto", "SC", 500, 100, 200, 11.50);

INSERT INTO tbl_cliente(nome_cliente, cpf, data_nasc, cep, numero, complemento)VALUES
("Marcos Costa de Sousa", "12345678901", "1981-02-06", 6768100, "1525", "apto 166C"),
("Zoroastro Zoando", "01987654321", "1989-06-15", 6757190, "250", ""),
("Idelbrandolâncio Silva", "54698721364", "1974-09-27", 6753001, "120", ""),
("Cosmólio Ferreira", "41368529687", "1966-12-01", 6753020, "25", "apto 255 F"),
("Conegunda Prado", "54781269501", "1950-10-06", 6753020, "50", "apto 166C"),
("Brogundes Asmônio", "41256398745", "1940-05-10", 6753400, "100", ""),
("Iscruência da Silva", "12457965823", "1974-11-25", 6803040, "5", ""),
("Zizafânio Zizundo", "54123698562", "1964-08-14", 6803140, "25", ""),
("Ricuerda Zunda", "21698534589", "1934-10-14", 6803045, "123", ""),
("Aninoado Zinzão", "25639856971", "1976-12-25", 6803070, "50", "");


INSERT INTO tbl_pedido(cod_cliente, data_pedido, data_entrega)VALUES
(1, "2022-01-02", "2022-01-05"),
(3, "2022-01-22", "2022-01-23"),
(7, "2022-01-25", "2022-01-29"),
(9, "2022-02-02", "2022-02-05"),
(10, "2022-02-17", "2022-02-19");

INSERT INTO tbl_itempedido(qtde, i_cod_pedido, i_cod_produto, i_valor)VALUES
#1º PEDIDO - 1PCT Feijão, 1GR Vinagre e 1KG Tomate
(1, 1, 2, 7.50),
(1, 1, 5, 7.89),
(1, 1, 7, 6.90),
#2º PEDIDO - 1PCT Arroz, 1PCT Macarrão e 1KG Batata
(1, 2, 1, 12.50),
(1, 2, 3, 5.50),
(1, 2, 6, 4.50),
#3º PEDIDO - 1PCT Macarrão, 1KG Batata e 1CX Leite
(1, 3, 3, 5.50),
(1, 3, 6, 4.50),
(1, 3, 9, 11.50),
#4º PEDIDO - 1KG Batata, 1CX Leite e 1PCT Feijão
(1, 4, 6, 4.50),
(1, 4, 9, 11.50),
(1, 4, 2, 7.50),
#5º PEDIDO - 1PCT Arroz, 1PCT Feijão e 1LT Óleo
(1, 5, 1, 12.50),
(1, 5, 2, 7.50),
(1, 5, 4, 6.50);

#========================================================================================

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



#=================================== EXERCÍCIOS =====================================

##====================== EXERCÍCIO A
/*CREATE VIEW vw_exercicioA as
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
*/




#============================================================
delimiter $
CREATE TRIGGER trg_log BEFORE DELETE
ON tbl_cliente
FOR EACH ROW
BEGIN
	INSERT INTO tbl_log
			(usuario, dt_log, hora)
	VALUES(user(), curdate(), curtime());
end $
delimiter $;
#============================================================

#===============================================EXERCÍCIO B - TRIGGER
delimiter $
CREATE TRIGGER trg_log_pedido BEFORE UPDATE
ON tbl_pedido
FOR EACH ROW
BEGIN
	INSERT INTO tbl_log
			(usuario, dt_log, hora, tipo_operacao, comando)
	VALUES(user(), curdate(), curtime(), "UPDATE", "tbl_pedido");
end $
delimiter $;

UPDATE tbl_pedido SET data_entrega = "2022-02-19" WHERE cod_pedido = 5;
#===========================================================================

#==========================================================EXERCÍCIO C - TRIGGER
delimiter $
CREATE TRIGGER trg_log_produto BEFORE DELETE
ON tbl_produto
FOR EACH ROW
BEGIN
	INSERT INTO tbl_log
			(usuario, dt_log, hora, tipo_operacao, comando)
	VALUES(user(), curdate(), curtime(), "DELETE", "tbl_produto");
end $
delimiter $;

DELETE FROM tbl_produto WHERE cod_produto = 8;
#======================================================================

#========================================EXERCÍCIO D - TRIGGER
delimiter $
CREATE TRIGGER trg_log_cliente AFTER INSERT
ON tbl_cliente
FOR EACH ROW
BEGIN
	INSERT INTO tbl_log
			(usuario, dt_log, hora, tipo_operacao, comando)
	VALUES(user(), curdate(), curtime(), "INSERT", "tbl_cliente");
end $
delimiter $;

INSERT INTO tbl_cliente(nome_cliente, cpf, data_nasc, cep, numero, complemento)
					VALUES("PUDIM_GOSTOSO", "09256794233", "2004-10-20", 6803070, "500", "");


