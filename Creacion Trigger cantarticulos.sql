DELIMITER $$
CREATE TRIGGER cantarticulos_solo_1a5
before insert
ON ventas FOR EACH ROW BEGIN
	if (new.cantarticulos >5) then
    signal SQLSTATE '45000'
    set message_text = 'Cantidad superior a 5';
    END IF;
END;
$$
DELIMITER ;
