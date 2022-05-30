#SELECT * FROM tbl_produto;

#============================= EXERCÍCIO - A
/*Neste exercício, irei pegar um código de um produto qualquer
e colocá-lo um percentual de 50% de acréscimo em seu valor,
além de printar uma mensagem de êxito ou erro.*/

delimiter $
CREATE PROCEDURE prc_prod_calc_perc( IN codprod int, IN perc_prod decimal(10, 2),
									OUT msg varchar(100))
	BEGIN
		
        DECLARE percentual decimal(10, 2);
        DECLARE erro bool;
        
        SET erro = true;
        
        IF(perc_prod > 0) THEN
			SET percentual = perc_prod;
		ELSE
			SET erro = false;
           SET msg = "Valor não sofreu acréscimo, verifique!";
		END IF;
        
        IF (ERRO) THEN
			SELECT valor valor_original, 
			valor + valor * perc_prod valor_com_acrescimo
			FROM tbl_produto
			WHERE cod_produto = codprod;
            SET msg = "Acréscimo realizado com sucesso!";
        END IF;
	
	END $
delimiter ;

call prc_prod_calc_perc(2, 0.50, @msg);
SELECT @msg;

#======================================== EXERCÍCIO - B e C
SELECT * FROM tbl_cliente;
SELECT * FROM tbl_log;
#drop trigger trg_prc_log_cliente;

delimiter $
CREATE PROCEDURE prc_ins_tbl_log(OUT msg varchar(100))
	BEGIN
		INSERT INTO tbl_log
			(usuario, dt_log, hora, tipo_operacao, comando)
	VALUES(user(), curdate(), curtime(), "INS_TRIGGER", "tbl_cliente");
    SET msg = "Insert realizado!";
    END $
delimiter $;

delimiter $
CREATE TRIGGER trg_prc_log_cliente AFTER INSERT
ON tbl_cliente
FOR EACH ROW
BEGIN
	call prc_ins_tbl_log(@msg);
end $
delimiter $;

INSERT INTO tbl_cliente(nome_cliente, cpf, data_nasc, cep, numero, complemento)
					VALUES("PUDIM_SAFADO_DELICIOSO", "19259755533", "2000-10-20", 6803070, "552", "");
SELECT @msg;
                    
