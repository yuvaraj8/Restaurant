DELIMITER $$

USE `hms`$$

DROP FUNCTION IF EXISTS `isfoodavailable`$$

CREATE DEFINER=`root`@`localhost` FUNCTION `isfoodavailable`(food_name VARCHAR(20)) RETURNS TEXT CHARSET utf8
BEGIN
           IF EXISTS(SELECT seed_food.name FROM seed_food WHERE seed_food.name=food_name )
           THEN
           RETURN 'true';
           ELSEIF NOT EXISTS(SELECT seed_food.name FROM seed_food WHERE seed_food.name=food_name) THEN
              RETURN 'food is not in the list';   
           ELSE
           RETURN 'invalid session';
           END IF;
    END$$

DELIMITER ;