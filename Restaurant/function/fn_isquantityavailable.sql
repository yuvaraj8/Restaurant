DELIMITER $$

USE `hms`$$

DROP FUNCTION IF EXISTS `isquantityavailable`$$

CREATE DEFINER=`root`@`localhost` FUNCTION `isquantityavailable`(quantity INT,food_id INT) RETURNS TEXT CHARSET utf8
BEGIN
           DECLARE quantity_available INT;
         SET quantity_available  =(SELECT quantity FROM food_details WHERE id=food_id);
         IF(quantity>0)
         THEN
           IF (quantity_available<=quantity)
           THEN
           RETURN 'true';
           ELSE
           RETURN 'quantity is not avalaible';
           END IF;
           ELSE 
           RETURN 'enter valid quantity';
           END IF;
    END$$

DELIMITER ;