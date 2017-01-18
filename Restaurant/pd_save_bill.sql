DELIMITER $$

USE `hms`$$

DROP PROCEDURE IF EXISTS `view_bill`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `view_bill`(IN id INT)
BEGIN
	   DECLARE show_bill INT;
             SET show_bill=(SELECT price FROM order_details WHERE order_id=id);
             SELECT show_bill AS your_bill;
	END$$

DELIMITER ;