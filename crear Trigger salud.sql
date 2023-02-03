DROP TRIGGER IF EXISTS abpro5.sistemasalud_t;
DELIMITER $$
CREATE TRIGGER sistemasalud_t
before insert
ON cliente FOR EACH ROW BEGIN
	if (new.sistemasalud >2 and new.sistemasalud <1) then
    signal SQLSTATE '45000'
    set message_text = 'Valor no corresponde: sistema salud solo admite 1 o 2';
    END IF;
END;
$$
DELIMITER ;