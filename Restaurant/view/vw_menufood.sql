DELIMITER $$

ALTER ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `menu_food` AS (
SELECT
  `seed_food`.`name`       AS `name`,
  `seed_food`.`price`      AS `price`,
  `seed_session`.`session` AS `session`
FROM ((`seed_food`
    JOIN `food_details`
      ON ((`seed_food`.`id` = `food_details`.`food_id`)))
   JOIN `seed_session`
     ON ((`seed_session`.`id` = `food_details`.`session`))))$$

DELIMITER ;