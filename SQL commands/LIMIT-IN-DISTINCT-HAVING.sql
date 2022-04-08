#=================================================== LIMIT, IN, DISTINCT E HAVING ===================================================

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