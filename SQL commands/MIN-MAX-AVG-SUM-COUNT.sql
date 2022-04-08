#============================================= FUNÇÕES MIN, MAX, AVG, SUM E COUNT=================================== 

#============================================= Usando função de agregação MIN ======================================
SELECT min(duracao), nome_filme FROM tbl_filme;

SELECT min(nome_filme) menor_duração FROM tbl_filme;

#============================================= Usando função de agregação MAX ======================================
SELECT max(duracao) maior_duração FROM tbl_filme;

#============================================= Usando a função de agregação AVG ====================================
#Mostra a média dos dados mostrados em uma coluna

SELECT avg(duracao) média_da_duração FROM tbl_filme;

#============================================== Usando a função de agregação SUM ===================================
SELECT sum(duracao) média_da_duração FROM tbl_filme;

#============================================== Usando a função de agregação COUNT =================================
#Mostra a contagem de um determinado dado na tabela
SELECT count(duracao) média_da_duração FROM tbl_filme;

#Jeito mais comum de se ver um count
SELECT count(*) Qtde_filmes FROM tbl_filme;

#===================================================================================================================

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