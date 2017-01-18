DELIMITER $$

USE `hms`$$

DROP PROCEDURE IF EXISTS `food_cancel`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `food_cancel`(IN order_id_para INT,IN seat_no_para INT)
BEGIN
	DECLARE status_para VARCHAR(20);
	SET status_para=(SELECT status_s FROM order_details WHERE order_id=order_id_para);
	IF status_para='ordered'
	THEN
              UPDATE order_details SET order_details.status_s='cancelled' WHERE order_id=order_id_para;
              UPDATE seed_seat SET seed_seat.status=0 WHERE id=seat_no_para;
              SELECT 'your order has been cancel' AS statement;
              ELSE 
              SELECT 'billed order cannot be cancelled' AS statement;
              END IF;
	END$$

DELIMITER ;