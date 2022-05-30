delimiter $
CREATE PROCEDURE prc_lista_prod()
	BEGIN
		SELECT * FROM tbl_produto
        WHERE cod_produto IN (1,3,5,7);
	END $
delimiter ;

call prc_lista_prod();
#=====================================================

delimiter $
CREATE PROCEDURE prc_prod_param_in( IN nome_prod varchar(50))
	BEGIN
		SELECT * FROM tbl_produto
        WHERE nome_produto = nome_prod;
	END $
delimiter ;

call prc_prod_param_in("arroz")
#====================================================

delimiter $
CREATE PROCEDURE prc_prod_param_out( OUT total decimal(10, 2))
	BEGIN
		SELECT sum(valor) INTO total 
        FROM tbl_produto;
	END $
delimiter ;

call prc_prod_param_out(@total);
SELECT @total;
#======================================================

delimiter $
CREATE PROCEDURE prc_prod_param_inout( IN codprod int, INOUT nome_prod char(15), 
									   INOUT valor_prod decimal(10, 2))
	BEGIN
		SELECT nome_produto, valor 
        FROM tbl_produto
		WHERE cod_produto = codprod;
	END $
delimiter ;

call prc_prod_param_inout(10, @nomeprod, @valorprod);
#====================================================================

delimiter $
CREATE PROCEDURE prc_ins_prod( IN vnomeprod char(100),
							   IN vvalor decimal(10, 2),
                               OUT msg varchar(100))
	BEGIN
		DECLARE valor decimal(10, 2);
        DECLARE erro bool;
        
        SET erro = true;
        
        IF(vvalor > 0) THEN
			SET valor = vvalor;
		ELSE
			SET erro = false;
            SET msg = "Valor zerado, verifique!";
		END IF;
        
        IF (ERRO) THEN
			INSERT INTO tbl_produto (nome_produto, valor)
						      VALUES(vnomeprod, vvalor);
			SET msg = "Incluído com sucesso!";
		END IF;
	END $
delimiter ;

call prc_ins_prod('ovo', 2.55, @msg);
SELECT @msg;




