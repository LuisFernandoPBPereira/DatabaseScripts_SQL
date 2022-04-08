#CTRL + SHIFT + ENTER = 1ºRAIO
#CTRL + ENTER = 2ºRAIO

#DDL - (Create, Drop e Alter)

#Criando um Banco de dados
#DROP DATABASE CINETEC;
CREATE DATABASE CINETEC;

USE CINETEC;

CREATE TABLE tbl_genero(
	id_genero int primary key auto_increment,
    genero varchar(45) not null
);

CREATE TABLE tbl_ator(
	id_ator int primary key auto_increment,
    nome_ator varchar(45) not null,
    sexo varchar(1) not null,
    dt_nascimento date not null
);

CREATE TABLE tbl_diretor(
	id_diretor int primary key auto_increment,
    nome_diretor varchar(45) not null,
    nacionalidade varchar(10) not null,
    dt_nascimento date not null
);

CREATE TABLE tbl_filme(
	id_filme int primary key auto_increment,
    nome_filme_pt varchar(45) not null,
    nome_filme_en varchar(45),
    ano_lancamento int(4) not null,
    duracao int(3) not null,
    FK_id_genero int not null,
    FK_id_diretor int not null,
    constraint FK_id_genero foreign key(FK_id_genero) references tbl_genero(id_genero),
	constraint FK_id_diretor foreign key(FK_id_diretor) references tbl_diretor(id_diretor)
);

CREATE TABLE tbl_filme_has_tbl_ator(
	FK_id_filme int not null,
    FK_id_ator int not null,
    constraint FK_id_filme foreign key(FK_id_filme) references tbl_filme(id_filme),
    constraint FK_id_ator foreign key(FK_id_ator) references tbl_ator(id_ator),
    primary key(FK_id_filme, FK_id_ator)
);

#---------------------------------EXERCÍCIO - ALTERAÇÃO DO BANCO---------------------------------------

# Acrescentar na tabela DIRETOR o campo sexo sendo varchar(1) e não nulo.
ALTER TABLE tbl_diretor ADD sexo varchar(1) not null;

#Na tabela DIRETOR alterar o tamanho do campo NACIONALIDADE para varchar(45).
ALTER TABLE tbl_diretor MODIFY nacionalidade varchar(45) not null;

#Na tabela FILME excluir a coluna NOME_FILME_EN e alterar NOME_FILME_PT para apenas NOME_FILME.
ALTER TABLE tbl_filme DROP nome_filme_EN;
ALTER TABLE tbl_filme CHANGE nome_filme_pt nome_filme varchar(45) not null;

#Renomear a tabela TBL_FILME_HAS_TBL_ATOR para FILME_E_ATOR.
ALTER TABLE tbl_filme_has_tbl_ator RENAME filme_e_ator;

#---------------------------------------------------------------------------------------------------------------
#INTRODUÇÃO A DML (Data Manipulation Language - INSERT, UPDATE, DELETE, "talvez o SELECT")

#INSERT INTO tbl_ator(id_ator, nome_ator, sexo, dt_nascimento)
#	VALUES(1, "Vin Diesel", "M","1980/02/09");

#---------------------------------------------------------------------------------------------------------------
#--------------------------------- FAZENDO INSERTS NO BANCO ----------------------------------------------------

#------------------------------------------ tbl_ator -----------------------------------------------------------
INSERT INTO tbl_ator(id_ator, nome_ator, sexo, dt_nascimento)
			VALUES(1, "Andrew Garfield", "M", "1983/08/20");
            
INSERT INTO tbl_ator(id_ator, nome_ator, sexo, dt_nascimento)
			VALUES(2, "Sandra Bullock", "F", "1964/06/26");

INSERT INTO tbl_ator(id_ator, nome_ator, sexo, dt_nascimento)
			VALUES(3, "Will Smith", "M", "1968/09/25");

INSERT INTO tbl_ator(id_ator, nome_ator, sexo, dt_nascimento)
			VALUES(4, "Harrison Ford", "M", "1942/07/13");
            
INSERT INTO tbl_ator(id_ator, nome_ator, sexo, dt_nascimento)
			VALUES(5, "Hugh Jackman", "M", "1968/10/12");
            
INSERT INTO tbl_ator(id_ator, nome_ator, sexo, dt_nascimento)
			VALUES(6, "Angelina Jolie", "F", "1975/06/04");
            
INSERT INTO tbl_ator(id_ator, nome_ator, sexo, dt_nascimento)
			VALUES(7, "Keanu Reeves", "M", "1964/09/02");

INSERT INTO tbl_ator(id_ator, nome_ator, sexo, dt_nascimento)
			VALUES(8, "Jennifer Lawrence", "F", "1990/08/15");
            
INSERT INTO tbl_ator(id_ator, nome_ator, sexo, dt_nascimento)
			VALUES(9, "Sylvester Stallone", "M", "1946/07/06");
            
INSERT INTO tbl_ator(id_ator, nome_ator, sexo, dt_nascimento)
			VALUES(10, "James Mcavoy", "M", "1979/04/21");
            
INSERT INTO tbl_ator(id_ator, nome_ator, sexo, dt_nascimento)
			VALUES(11, "Brad Pitt", "M", "1963/12/18");
            
INSERT INTO tbl_ator(id_ator, nome_ator, sexo, dt_nascimento)
			VALUES(12, "Leonardo Dicaprio", "M", "1974/11/11");
            
INSERT INTO tbl_ator(id_ator, nome_ator, sexo, dt_nascimento)
			VALUES(13, "Vin Diesel", "M", "1967/07/18");
            
INSERT INTO tbl_ator(id_ator, nome_ator, sexo, dt_nascimento)
			VALUES(14, "Johnny Deep", "M", "1963/06/09");
            
INSERT INTO tbl_ator(id_ator, nome_ator, sexo, dt_nascimento)
			VALUES(15, "Robin Williams", "M", "1951/07/21");
            
INSERT INTO tbl_ator(id_ator, nome_ator, sexo, dt_nascimento)
			VALUES(16, "Robert Downey Jr.", "M", "1965/04/04");
            
INSERT INTO tbl_ator(id_ator, nome_ator, sexo, dt_nascimento)
			VALUES(17, "Patrick Stewart", "M", "1940/07/26");
            
INSERT INTO tbl_ator(id_ator, nome_ator, sexo, dt_nascimento)
			VALUES(18, "Sandra Bullock", "F", "1964/07/26");
            
INSERT INTO tbl_ator(id_ator, nome_ator, sexo, dt_nascimento)
			VALUES(19, "Jackie Chan", "M", "1954/04/07");
            
INSERT INTO tbl_ator(id_ator, nome_ator, sexo, dt_nascimento)
			VALUES(20, "Jennifer Aniston", "F", "1969/02/11");
            
INSERT INTO tbl_ator(id_ator, nome_ator, sexo, dt_nascimento)
			VALUES(21, "Jim Carrey", "F", "1962/01/17");
            
INSERT INTO tbl_ator(id_ator, nome_ator, sexo, dt_nascimento)
			VALUES(22, "Scarlett Johansson", "F", "1984/11/22");
            
INSERT INTO tbl_ator(id_ator, nome_ator, sexo, dt_nascimento)
			VALUES(23, "Megan Fox", "F", "1986/05/16");
            
INSERT INTO tbl_ator(id_ator, nome_ator, sexo, dt_nascimento)
			VALUES(24, "Ben Stiller", "F", "1965/11/30");
            
INSERT INTO tbl_ator(id_ator, nome_ator, sexo, dt_nascimento)
			VALUES(25, "Emma Stone", "F", "1988/11/06");
 #------------------------------------------------------------------------------------------------------------
 #--------------------------------------------- tbl_diretor --------------------------------------------------
 
 INSERT INTO tbl_diretor(id_diretor, nome_diretor, nacionalidade, dt_nascimento, sexo)
			VALUES(1, "Steven Spielberg", "Estados Unidos", "1946/12/18", "M");
            
 INSERT INTO tbl_diretor(id_diretor, nome_diretor, nacionalidade, dt_nascimento, sexo)
			VALUES(2, "James Cameron", "Canada", "1954/08/16", "M");
            
 INSERT INTO tbl_diretor(id_diretor, nome_diretor, nacionalidade, dt_nascimento, sexo)
			VALUES(3, "José Padilha", "Brasil", "1967/08/01", "M");
            
 INSERT INTO tbl_diretor(id_diretor, nome_diretor, nacionalidade, dt_nascimento, sexo)
			VALUES(4, "George Lucas", "Estados Unidos", "1944/05/14", "M");
            
 INSERT INTO tbl_diretor(id_diretor, nome_diretor, nacionalidade, dt_nascimento, sexo)
			VALUES(5, "Alan Rickman", "Inglaterra", "1946/02/21", "M");
            
 INSERT INTO tbl_diretor(id_diretor, nome_diretor, nacionalidade, dt_nascimento, sexo)
			VALUES(6, "Fernando Meirelles", "Brasil", "1965/11/09", "M");
#-------------------------------------------------------------------------------------------------------------
#---------------------------------------- tbl_genero ---------------------------------------------------------

 INSERT INTO tbl_genero(id_genero, genero)
			VALUES(1, "Terror");
            
INSERT INTO tbl_genero(id_genero, genero)
			VALUES(2, "Ação");
            
INSERT INTO tbl_genero(id_genero, genero)
			VALUES(3, "Comédia");
            
INSERT INTO tbl_genero(id_genero, genero)
			VALUES(4, "Drama");
            
INSERT INTO tbl_genero(id_genero, genero)
			VALUES(5, "Suspense");
            
INSERT INTO tbl_genero(id_genero, genero)
			VALUES(6, "Ficção");
            
INSERT INTO tbl_genero(id_genero, genero)
			VALUES(7, "Romance");
            
INSERT INTO tbl_genero(id_genero, genero)
			VALUES(8, "Animação");
#-------------------------------------------------------------------------------------------------------
#-------------------------------------------- tbl_filme ------------------------------------------------

INSERT INTO tbl_filme(id_filme, nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor)
			VALUES(1, "Viva: A Vida é Uma Festa", 2017, 105, 8, 5);
            
INSERT INTO tbl_filme(id_filme, nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor)
			VALUES(2, "Logan", 2017, 137, 2, 1);
            
INSERT INTO tbl_filme(id_filme, nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor)
			VALUES(3, "Um Sonho de Liberdade", 1995, 142, 4, 5);

INSERT INTO tbl_filme(id_filme, nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor)
			VALUES(4, "Matrix", 1999, 150, 6, 1);
            
INSERT INTO tbl_filme(id_filme, nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor)
			VALUES(5, "Jumanji", 1996, 104, 3, 6);
            
INSERT INTO tbl_filme(id_filme, nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor)
			VALUES(6, "Cidade de Deus", 2002, 135, 2, 3);
            
INSERT INTO tbl_filme(id_filme, nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor)
			VALUES(7, "O Resgate do Soldado Ryan", 1998, 170, 2, 6);
            
INSERT INTO tbl_filme(id_filme, nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor)
			VALUES(8, "Extraordinário", 2017, 113, 4, 5);
            
INSERT INTO tbl_filme(id_filme, nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor)
			VALUES(9, "O Poderoso Chefão", 1972, 178, 2, 2);
            
INSERT INTO tbl_filme(id_filme, nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor)
			VALUES(10, "Forrest Gump", 1994, 142, 7, 1);
            
INSERT INTO tbl_filme(id_filme, nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor)
			VALUES(11, "Truque de Mestre", 2013, 125, 2, 4);
            
INSERT INTO tbl_filme(id_filme, nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor)
			VALUES(12, "Fragmentado", 2017, 117, 4, 6);
            
INSERT INTO tbl_filme(id_filme, nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor)
			VALUES(13, "Avatar", 2009, 162, 6, 2);
            
INSERT INTO tbl_filme(id_filme, nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor)
			VALUES(14, "O Preço do Amanhã", 2011, 109, 2, 3);
            
INSERT INTO tbl_filme(id_filme, nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor)
			VALUES(15, "O Senhor dos Anéis: O Retorno do Rei", 2003, 200, 6, 5);
            
INSERT INTO tbl_filme(id_filme, nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor)
			VALUES(16, "Toy Story", 1995, 141, 8, 2);
            
INSERT INTO tbl_filme(id_filme, nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor)
			VALUES(17, "Star Wars: Os Últimos Jedi", 2017, 152, 6, 4);
            
INSERT INTO tbl_filme(id_filme, nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor)
			VALUES(18, "O Menino do Pijama Listrado", 2008, 94, 4, 1);
            
INSERT INTO tbl_filme(id_filme, nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor)
			VALUES(19, "O Lobo de Wall Street", 2013, 181, 4, 6);
            
INSERT INTO tbl_filme(id_filme, nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor)
			VALUES(20, "A Hora do Rush", 1998, 98, 3, 5);
            
INSERT INTO tbl_filme(id_filme, nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor)
			VALUES(21, "Piratas do Caribe - Maldição do Pérola Negra", 2003, 143, 2, 4);
            
INSERT INTO tbl_filme(id_filme, nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor)
			VALUES(22, "Passengeiros", 2016, 116, 2, 1);
            
INSERT INTO tbl_filme(id_filme, nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor)
			VALUES(23, "Beleza Oculta", 2016, 97, 4, 2);
            
INSERT INTO tbl_filme(id_filme, nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor)
			VALUES(24, "It - A Coisa", 2017, 134, 1, 3);

INSERT INTO tbl_filme(id_filme, nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor)
			VALUES(25, "Rocky V", 1990, 111, 4, 4);
            
INSERT INTO tbl_filme(id_filme, nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor)
			VALUES(26, "Titanic", 1997, 195, 7, 4);
            
INSERT INTO tbl_filme(id_filme, nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor)
			VALUES(27, "Vingadores 4", 2019, 150, 2, 2);
            
INSERT INTO tbl_filme(id_filme, nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor)
			VALUES(28, "Velozes e Furiosos 8", 2017, 136, 2, 6);
            
INSERT INTO tbl_filme(id_filme, nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor)
			VALUES(29, "Transformers", 2007, 150, 2, 4);
            
INSERT INTO tbl_filme(id_filme, nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor)
			VALUES(30, "Ilha do Medo", 2010, 139, 5, 1);
#=======================================================================================================================
#=================================================== UPDATE ============================================================
UPDATE tbl_ator SET nome_ator = "Elizabeth Olsen", dt_nascimento = "1989/02/16" WHERE id_ator = 18;
UPDATE tbl_ator SET sexo = "M" WHERE id_ator = 21 OR id_ator = 24;

#=======================================================================================================================
#=================================================== DELETE ============================================================

#DELETE FROM tbl_filme WHERE id_filme = 13;

#==================================================== DQL ===============================================================
#================================================== SELECT ==============================================================

SELECT * FROM tbl_ator;
SELECT nome_diretor, nacionalidade FROM tbl_diretor;
SELECT * FROM tbl_diretor WHERE nacionalidade = "Brasil";
SELECT nome_ator, nacionalidade, dt_nascimento FROM tbl_diretor
	WHERE nacionalidade = "Brasil" OR nacionalidade = "Estados Unidos";
#Realizar buscas por "pedaços" de palavras - o comando "LIKE" - (% - CORINGA)
SELECT * FROM tbl_ator WHERE nome_ator LIKE "%E";
SELECT * FROM tbl_ator WHERE nome_ator LIKE "%DE%";

#Realizando buscas com intervalo de datas
SELECT * FROM tbl_ator WHERE dt_nascimento > "1980/01/01" AND dt_nascimento < "1990/01/01";
#DIFERENTE = <> ou !=

SELECT * FROM tbl_ator WHERE dt_nascimento <> "1986/05/16";

SELECT * FROM tbl_ator WHERE dt_nascimento BETWEEN "1980/01/01" AND "1990/01/01";

#Funções Agregação - (MIN, MAX, AVG, COUNT, SUM)
#ORDER BY
#GROUP BY

#SUBQUERY

#============================================= Usando função de agregação MIN ======================================
SELECT min(duracao), nome_filme FROM tbl_filme;

SELECT min(nome_filme) menor_duração FROM tbl_filme;

#============================================= Usando função de agregação MAX ======================================
SELECT max(duracao) maior_duração FROM tbl_filme;

#============================================= Usando a função de agregação AVG ======================================
#Mostra a média dos dados mostrados em uma coluna

SELECT avg(duracao) média_da_duração FROM tbl_filme;

#============================================== Usando a função de agregação SUM =======================================
SELECT sum(duracao) média_da_duração FROM tbl_filme;

#============================================== Usando a função de agregação COUNT ======================================
#Mostra a contagem de um determinado dado na tabela
SELECT count(duracao) média_da_duração FROM tbl_filme;

#Jeito mais comum de se ver um count
SELECT count(*) Qtde_filmes FROM tbl_filme;

#========================================================================================================================

#SOMA DAS COLUNAS
SELECT sum(duracao), sum(ano_lancamento) FROM tbl_filme;
SELECT sum(duracao) + sum(ano_lancamento) soma_das_colunas FROM tbl_filme;

#FUNÇÕES DE AGREGAÇÃO NA MESMA QUERY
SELECT min(duracao), max(duracao), avg(duracao), sum(duracao), count(duracao) FROM tbl_filme;


#decimal recebe dois valores (1º é a quantidade de números, 2º é a quantidade de números após a vírgula
SELECT CAST(AVG(duracao) as decimal(10, 2)) FROM tbl_filme;

#=======================================================================================================================

SELECT count(*) total_atrizes FROM tbl_ator WHERE sexo = "F";

SELECT * FROM tbl_genero;

SELECT sum(duracao) FROM tbl_filme WHERE FK_id_genero = 1;

SELECT genero FROM tbl_genero WHERE id_genero = 4;

#========================================================================================================================

SELECT nome_filme FROM tbl_filme WHERE duracao = (SELECT max(duracao) maior_duração FROM tbl_filme);

#=========================================================================================================================
#	ORDER BY		ORDENAR OS RESULTADOS DE UMA BUSCA A PARTIR DE UM DETERMINADO CAMPO

SELECT * FROM tbl_filme ORDER BY nome_filme; #ASC ordena de forma crescente
SELECT * FROM tbl_filme ORDER BY nome_filme DESC;

SELECT * FROM tbl_filme ORDER BY ano_lancamento, nome_filme;

#=========================================================================================================================
#	GROUP BY		

SELECT * FROM tbl_filme GROUP BY ano_lancamento;

#GROUP BY + COUNT()
#QUANTOS FILMES EXISTEM PARA CADA ANO
#				|
#				|
#   			V

SELECT count(*) total_filmes, ano_lancamento FROM tbl_filme GROUP BY ano_lancamento;

SELECT count(*) total_filmes, ano_lancamento FROM tbl_filme GROUP BY ano_lancamento ORDER BY total_filmes DESC;

#TOTAL DE ATORES E ATRIZES CADASTRADAS NO BANCO
SELECT count(*) total, sexo FROM tbl_ator GROUP BY sexo ORDER BY total DESC;

#===========================================================================================================================

#=============================================== LIMIT
#LIMITA O NÚMERO DE RESULTADOS NA CONSULTA

SELECT * FROM tbl_ator LIMIT 0,10; 

#=============================================== IN

#FACILITA A QUERY, DIMINUINDO A DIGITAÇÃO E O TAMANHO

SELECT * FROM tbl_filme WHERE fk_id_genero IN(1,2,3) ORDER BY FK_id_genero;

#SELECIONAR QUANTOS FILMES ESTÃO CADASTRADOS ONDE O GÊNERO 
#SEJA 1, 2, 3 E 4 E OS FILMES TENHAM SIDO LANÇADOS APÓS 2000 

SELECT count(*) total_filmes FROM tbl_filme WHERE fk_id_genero IN(1,2,3,4)
						AND ano_lancamento > 2000 ORDER BY FK_id_genero;
                        

#SABER QUANTO FILMES DETERMINADO GÊNERO TEM                        
SELECT count(*)total_filmes, FK_id_genero FROM tbl_filme WHERE fk_id_genero IN(1,2,3,4)
				 AND ano_lancamento > 2000 GROUP BY FK_id_genero ORDER BY FK_id_genero;

#=============================================== DISTINCT

#ELE FILTRA A CONSULTA, PARECIDO COM O GROUP BY
SELECT distinct(nacionalidade) FROM tbl_diretor ORDER BY nacionalidade ASC;

#=============================================== HAVING

#ESPECIFICA CONDIÇÕES DE FILTROS EM UM GRUPO DE REGISTROS OU AGREGAÇÕES

SELECT * FROM tbl_diretor HAVING nacionalidade = "Canada";

SELECT nacionalidade, count(*) total FROM tbl_diretor GROUP BY nacionalidade HAVING total >= 2;

/*SELECIONAR QUANTOS FILMES FORMA LANÇADOS EM CADA UM DOS ANOS ENTRE
OS ANOS 1980 A 2000 E EXIBIR APENAS OS RESULTADOS ONDE TIVERAM MAIS DE 4 FILMES*/

SELECT count(*) total_filmes, ano_lancamento FROM tbl_filme WHERE ano_lancamento > 1980 
AND ano_lancamento < 2000 GROUP BY ano_lancamento HAVING total_filmes >= 2;

SELECT count(*) total_filmes, ano_lancamento FROM tbl_filme WHERE ano_lancamento 
BETWEEN 1980 AND 2000 GROUP BY ano_lancamento HAVING total_filmes >= 2;

#=============================================== CURDATE()

#PROPRIEDADE QUE PEGA A DATA ATUAL DO SERVIDOR

SELECT curdate();

#=============================================== NOW()

#PROPRIEDADE QUE PEGA A DATA E HORA ATUAL DO SERVIDOR

SELECT now();

#SELECIONE TODOS OS ATORES/ATRIZES QUE NASCERAM EM 1980
SELECT * FROM tbl_ator WHERE dt_nascimento BETWEEN "1980-01-01" AND "1990-12-31";

#SELECIONAR TODOS OS ATORES/ATRIZES QUE NASCERAM NO DIA 15

SELECT * FROM tbl_ator WHERE day(dt_nascimento) = 15;

SELECT * FROM tbl_ator;

# comando INTERVAL

SELECT NOW() + interval 3 day;

SELECT NOW() + interval 3 month;

SELECT curdate()  - interval 1 year data_servidor;

# SUBQUERY

SELECT (select now() + interval 2 day) + interval 1 month;

SELECT nome_filme, max(duracao) FROM tbl_filme;


SELECT max(duracao) FROM tbl_filme;

SELECT nome_filme, duracao FROM tbl_filme WHERE duracao = (
	SELECT max(duracao) FROM tbl_filme
)
UNION
SELECT nome_filme, duracao FROM tbl_filme WHERE duracao = (
	SELECT min(duracao) FROM tbl_filme
);





/*EXERCÍCIOS DE SELECT*/

# 1- Selecionar todos os atores que comecem com a letra "A".
SELECT * FROM tbl_ator WHERE nome_ator LIKE "A%";

# 2- Selecionar a maior duracao dos filmes cadastrados.
SELECT max(duracao) FROM tbl_filme;

# 3- Selecionar a menor duracao dos filmes lancado entre os anos 2000 e 2010. 
SELECT nome_filme, min(duracao) FROM tbl_filme WHERE duracao = (SELECT min(duracao) FROM tbl_filme WHERE ano_lancamento BETWEEN 2000 AND 2010); 

# 4- Selecionar os filmes exibibindo apenas aqueles que pertencerem ao genero "Ação".
SELECT * FROM tbl_filme WHERE FK_id_genero = 2;

# 5- Selecionar os filmes exibindo aqueles que pertecerem ao genero "Drama" e que tenham sido lançados apos o ano 2010.
SELECT * FROM tbl_filme WHERE ano_lancamento > 2010 AND FK_id_genero = 4;

# 6- Exibir todos os filmes e seus anos de lancamentos organizando da seguinte maneira
# (ordem de ano do mais novo para o mais velho e nome do filme em ordem alfabetica).
SELECT nome_filme, ano_lancamento FROM tbl_filme ORDER BY ano_lancamento DESC, nome_filme ASC;

# 7- Exibir a soma da duracao de todos os filmes que foram lancados entre 2010 e 2018 e pertecerem ao genero "ficçao"
SELECT sum(duracao) FROM tbl_filme WHERE ano_lancamento BETWEEN 2010 AND 2018 AND FK_id_genero = 6;

# 8- Exibir quantos filmes foram lancados antes do ano 2000.
SELECT count(*) Quantidade_filmes_lançados FROM tbl_filme WHERE ano_lancamento < 2000;

# 9- Exibir qual a media de duracao dos filmes lancados apos o ano 2000.
SELECT CAST(avg(duracao) as decimal(10, 2)) Média_duração FROM tbl_filme WHERE ano_lancamento > 2000;

# 10- Quantos filmes pertecem a cada um dos generos.
SELECT count(*) Qtde_filmes, FK_id_genero FROM tbl_filme GROUP BY FK_id_genero;

# 11- Exibir em ordem alfabetica quais atores e em quais anos nasceram entre 1960 e 1980.
SELECT nome_ator, dt_nascimento FROM tbl_ator WHERE dt_nascimento BETWEEN "1960-01-01" AND "1980-01-01" ORDER BY nome_ator ASC; 

# 12- Exibir todas informações sobre os atores do mais jovem para o mais velho.
SELECT * FROM tbl_ator ORDER BY dt_nascimento DESC;

# 13- Selecionar quantos filmes foram lancados em cada um dos anos.
SELECT count(*) filmes_lançados, ano_lancamento FROM tbl_filme GROUP BY ano_lancamento;

# 14- Exibir quantos diretores pertencem a cada pais.
SELECT count(*) Qtde_diretores, nacionalidade FROM tbl_diretor GROUP BY nacionalidade;

# 15- exibir o total de filmes, a soma das durações e a media das duracoes para cada um 
# dos generos de filmes organizando da menor media para a maior. 
SELECT count(nome_filme), sum(duracao), avg(duracao) media_duracao, FK_id_genero FROM tbl_filme GROUP BY FK_id_genero ORDER BY media_duracao;

# 16- Selecionar todos os filmes que contenham a silaba "DE" no nome e em ordem alfabetica de Z-A.
SELECT * FROM tbl_filme WHERE nome_filme LIKE "%DE%" ORDER BY nome_filme DESC;


#SELECT nome_filme FROM tbl_filme WHERE duracao = (SELECT max(duracao) maior_duração FROM tbl_filme);

/*
================================================ JOIN ============================================================
*/
/*
SINTAXES

PODEMOS USAR "INNER JOIN" OU "JOIN"

SELECT a.nome_livro, b.nome_categoria , c.nome_editora FROM tbl_livros a 
JOIN tbl_Categoria b ON a.FK_Categoria = b.codigo_categoria
JOIN tbl_Editora c ON a.FK_Editora = c.codigo_editora;
*/

#Exibir a quantidade de filmes que cada diretor trabalhou
SELECT nome_diretor, count(*) qtd_filmes FROM tbl_filme 
INNER JOIN tbl_diretor ON FK_id_diretor = id_diretor
GROUP BY nome_diretor;

#SELECIONAR TODOS OS FILMES QUE FOREM DO GENERO "TERROR" E FORAM LANÇADOS POR DIRETORES BRASILEIROS
SELECT nome_filme filme, nome_diretor diretor, nacionalidade, genero FROM tbl_filme 
	JOIN tbl_diretor ON FK_id_diretor = id_diretor
	JOIN tbl_genero  ON FK_id_genero  = id_genero
		WHERE FK_id_genero = 1
			AND nacionalidade = "Brasil";

#SELECIONAR O NOME E DATA DE NASCIMENTO DOS DIRETORES QUE LANÇARAM FILMES DE COMEDIA COM DURAÇÃO
#MAIOR QUE 100 MIN
SELECT nome_diretor, dt_nascimento, genero FROM tbl_filme 
	JOIN tbl_genero  ON FK_id_genero  = id_genero
    JOIN tbl_diretor ON FK_id_diretor = id_diretor 
		WHERE id_genero = 3
			AND duracao > 100;
            
#(SELECT id_diretor FROM tbl_diretor WHERE nacionalidade = "Brasil")
SELECT * FROM tbl_genero;





