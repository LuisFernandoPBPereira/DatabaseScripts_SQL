#===================================================== JOIN ===============================================

/* =====================ESSES JOINS SÃO BASEADOS EM UM EXERCÍCIO PASSADO EM AULA ==================*/
/*BANCO BIBLIOTECA  <-------*/

#2- UTILIZANDO O RECURSO "IN", SELECIONAR O NOME, AS PAGINAS E A 
#CATEGORIA DE TODOS OS LIVROS DAS CATEGORIAS "CONTOS", "POESIA" E 
#"AVENTURA":
SELECT * FROM tbl_categoria;
SELECT nome_livro, paginas, nome_categoria FROM tbl_livros 
	JOIN tbl_categoria ON FK_Categoria = codigo_categoria 
    WHERE codigo_categoria IN (1, 4, 14);
    
#4- Exibir o nome dos livros cadastrados, juntamente com suas categorias
#e nome das editoras que o produziram.
SELECT nome_livro, nome_categoria, nome_editora FROM tbl_livros
	JOIN tbl_categoria ON FK_Categoria = codigo_categoria
	JOIN tbl_editora ON FK_Editora = codigo_editora;
    
#5- Exibir os autores que produziram livros da categoria de romance e
#quantos livros cada um produziu ordenando por quem produziu mais primeiro.
SELECT nome_autor, COUNT(nome_categoria) quantidade_livros FROM tbl_autor
        JOIN autor_livro ON codigo_autor = FK_Autor
        JOIN tbl_livros ON codigo_livro = FK_Livro
        JOIN tbl_categoria ON codigo_categoria = FK_Categoria 
        WHERE nome_categoria = 'Romance'
        GROUP BY nome_autor
        ORDER BY quantidade_livros DESC;
        
#6- Exibir os nomes dos autores e o nome dos seus livros.
SELECT nome_autor, nome_livro FROM tbl_autor
	JOIN autor_livro ON codigo_autor = FK_Autor
	JOIN tbl_livros ON codigo_livro = FK_Livro;
    
#7- Exibir os nomes dos autores e quantos livros cada um 
#produziu em ordem do que tem mais livros para o que tem menos livros.
SELECT nome_autor, COUNT(nome_categoria) quantidade_livros FROM tbl_autor
	JOIN autor_livro ON codigo_autor = FK_Autor
    JOIN tbl_livros ON codigo_livro = FK_Livro
    JOIN tbl_categoria ON FK_Categoria = codigo_categoria
    GROUP BY nome_autor
    ORDER BY quantidade_livros DESC;
    
#8- EXIBIR APENAS O NOME, A SUA CATEGORIA E VALOR_UNITARIO PARA 
#TODOS OS LIVROS QUE O VALOR UNITARIO FOR SUPERIOR A MEDIA DOS 
#PREÇOS. ORDENAR A BUSCA DO MENOR VALOR PARA O MAIOR. # DICA: 
#UTILIZE SUBQUERY E ORDER BY
SELECT nome_livro, nome_categoria, valor_unitario FROM tbl_livros
	JOIN tbl_categoria ON FK_Categoria = codigo_categoria
    WHERE valor_unitario > (SELECT AVG(valor_unitario) FROM tbl_livros)
    ORDER BY valor_unitario;
    
#9- EXIBIR O NOME DO LIVRO, A QUANTIDADE DE PAGINAS E O NOME DA 
#CATEGORIA PARA TODOS OS LIVROS QUE O NUMERO DE PAGINAS SEJA 
#MENOR QUE A MEDIA DAS PAGINAS. ORDERNAR A BUSCA DO MAIOR PARA 
#O MENOR VALOR DA COLUNA PAGINAS
SELECT nome_livro, paginas, nome_categoria FROM tbl_livros
	 JOIN tbl_categoria ON FK_Categoria = codigo_categoria
     WHERE paginas < (SELECT AVG(paginas) FROM tbl_livros)
     ORDER BY paginas DESC;
     

/*INNER, LEFT E RIGHT JOIN*/
/*BANCO BD_Vendas  <-------------*/
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