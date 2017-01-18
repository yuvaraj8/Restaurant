DELIMITER $$

USE `hms`$$

DROP FUNCTION IF EXISTS `single_item_price`$$

CREATE DEFINER=`root`@`localhost` FUNCTION `single_item_price`( food_name VARCHAR(20)) RETURNS INT(11)
BEGIN
        DECLARE food_price INT;
        SET food_price=(SELECT price FROM seed_food WHERE name_of_food=food_name LIMIT 1);
        RETURN food_price;
        
    END$$

DELIMITER ;