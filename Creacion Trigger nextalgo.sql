DROP TRIGGER IF EXISTS individual.incrementproduct;
DELIMITER $$
CREATE TRIGGER incrementproduct
before insert
ON producto FOR EACH ROW BEGIN
	SET NEW.valor = (select max(valor)+1000 from producto);
    
END;
$$
DELIMITER ;
