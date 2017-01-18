DELIMITER $$

USE `hms`$$

DROP FUNCTION IF EXISTS `validation_of_order_id`$$

CREATE DEFINER=`root`@`localhost` FUNCTION `validation_of_order_id`(order_ids INT) RETURNS TEXT CHARSET utf8
BEGIN
      IF EXISTS(SELECT order_details.order_id FROM order_details  WHERE order_details.order_id=order_ids)
      THEN 
      RETURN 'order id is already placed';
      ELSE
        RETURN 'false';
        END IF;
    

    END$$

DELIMITER ;