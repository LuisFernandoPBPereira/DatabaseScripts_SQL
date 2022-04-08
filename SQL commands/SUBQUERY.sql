#===================================================== SUBQUERY ================================================

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