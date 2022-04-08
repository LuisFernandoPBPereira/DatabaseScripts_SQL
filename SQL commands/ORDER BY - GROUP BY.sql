#================================================== ORDER BY E GROUP BY ===========================================

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
