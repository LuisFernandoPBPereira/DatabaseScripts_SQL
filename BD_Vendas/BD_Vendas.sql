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





