#======================================================== CURDATE E NOW ==================================================

#=============================================== CURDATE()

#PROPRIEDADE QUE PEGA A DATA ATUAL DO SERVIDOR

SELECT curdate();
#==============================================  CURTIME()

SELECT curtime();

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
