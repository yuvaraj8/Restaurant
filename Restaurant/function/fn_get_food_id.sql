DELIMITER $$

USE `hms`$$

DROP FUNCTION IF EXISTS `get_food_id`$$

CREATE DEFINER=`root`@`localhost` FUNCTION `get_food_id`(fname VARCHAR(20)) RETURNS INT(11)
BEGIN
             RETURN (SELECT id FROM seed_food WHERE seed_food.name=fname);
    END$$

DELIMITER ;