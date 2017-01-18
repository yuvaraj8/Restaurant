DELIMITER $$

USE `hms`$$

DROP FUNCTION IF EXISTS `isseatavailable`$$

CREATE DEFINER=`root`@`localhost` FUNCTION `isseatavailable`(seat_no_para INT) RETURNS TEXT CHARSET utf8
BEGIN
          DECLARE seat INT;
          DECLARE max_seat INT;
          SET seat=(SELECT seed_seat.status FROM seed_seat WHERE id=seat_no_para);
          SET max_seat=(SELECT COUNT(*) FROM seed_seat);
          IF (seat_no_para<=max_Seat)
          THEN
           IF (seat=0)
              THEN 
              RETURN 'true';
              ELSE
              RETURN 'seat already occupied';
              END IF;
              ELSE 
              RETURN 'select proper seat no';
              END IF;
          
    END$$

DELIMITER ;