DELIMITER $$

USE `hms`$$

DROP PROCEDURE IF EXISTS `payement_bill`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `payement_bill`(IN order_id_para INT,IN seat_no_para INT)
BEGIN
                  DECLARE status_para VARCHAR(20);
                  SET status_para=(SELECT status_s FROM order_details WHERE order_id=order_id_para);
                  IF(status_para='ordered')
                  THEN
                  UPDATE order_details SET status_s='billed' WHERE order_id=order_id_para;
                  UPDATE seed_seat SET seat_no=0 WHERE id=seat_no_para;
                  ELSE
                  SELECT 'you have canceled your order..you cannot make payement to canceled order' AS statement;
                  END IF;
	END$$

DELIMITER ;