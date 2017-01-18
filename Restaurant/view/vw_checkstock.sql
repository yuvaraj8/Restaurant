DELIMITER $$

ALTER ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `check_stock` AS (
SELECT
  `food_details`.`session`  AS `session`,
  `seed_food`.`name`        AS `name`,
  `food_details`.`quantity` AS `quantity`
FROM (`food_details`
   JOIN `seed_food`
     ON ((`seed_food`.`id` = `food_details`.`food_id`))))$$

DELIMITER ;