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