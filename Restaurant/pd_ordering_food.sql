DELIMITER $$



CREATE DEFINER=`root`@`localhost` PROCEDURE `ordering_food`(IN food_name VARCHAR(50),IN quantity_para VARCHAR(20),IN order_id_para INT,IN no_of_item INT,IN seat_no_para INT,OUT err_message VARCHAR(100))
BEGIN
    DECLARE fname VARCHAR(20);
    DECLARE fname1 VARCHAR(20);
    DECLARE fid VARCHAR(20)  ;
    DECLARE quants VARCHAR(20) ;
    DECLARE quants1 VARCHAR(20);
    DECLARE time_current TIME;
    DECLARE session_id_para INT;
    DECLARE quantity_sec_para INT;
    DECLARE price_para INT;
    DECLARE price_sec_para INT;
    DECLARE total_price INT;
    DECLARE food_available TEXT;
    DECLARE i INT DEFAULT 0;
    DECLARE quantity_available TEXT;
    DECLARE valid_order_id TEXT;
    DECLARE seat_available TEXT;
    DECLARE fid1 INT;
    SET time_current=TIME(NOW());
    
    
    IF (SELECT max_order FROM max_order WHERE max_order.key='weekday')>=no_of_item
            THEN 
           
           
              test_loop : LOOP
               IF(i=no_of_item)
               THEN 
               LEAVE test_loop;
                  END IF;
           SET fname=(SELECT SUBSTRING_INDEX(food_name,',','1'));
           SET fname1=(SELECT CONCAT(fname,','));
           SET food_name= (SELECT REPLACE(food_name,fname1,' '));
           SET food_name =(SELECT LTRIM(food_name));
           SET fid1=(SELECT get_food_id(fname));
           SET fid=(SELECT food_details.`id` FROM food_details JOIN seed_session ON food_details.`session`=seed_session.`id` WHERE food_details.food_id=fid1 AND CURTIME() BETWEEN seed_session.`start_time` AND seed_session.`end_time`);         
           SET quants=(SELECT SUBSTRING_INDEX(quantity_para,',','1'));
           SET quants1=(SELECT CONCAT(quants,','));
           SET quantity_para=(SELECT REPLACE(quantity_para,quants1,' '));
           SET quantity_para=(SELECT LTRIM(quantity_para));
           SET session_id_para=(SELECT food_details.session FROM food_details WHERE food_details.id=fid);
           SET quantity_sec_para=(SELECT quantity FROM food_details WHERE id=fid);
           SET food_available= (SELECT isfoodavailable(fname));
           SET quantity_available=(SELECT isquantityavailable(quants,fid));
           SET valid_order_id= (SELECT validation_of_order_id(order_id_para));
            SET seat_available=isseatavailable(seat_no_para);
            IF seat_available != 'true'
            THEN 
           SET err_message=   seat_available;
            ELSEIF food_available != 'true'
                THEN 
           SET err_message=  food_available ;
           ELSEIF quantity_available != 'true'
           THEN 
           SET err_message= quantity_available ;
           ELSEIF valid_order_id != 'false'
           THEN 
         SET err_message=  valid_order_id ;
           
          
	          
			ELSEIF time_current BETWEEN (SELECT TIME(start_time) FROM seed_session WHERE seed_session.id=session_id_para) AND
			(SELECT TIME(end_time) FROM seed_session WHERE seed_session.id=session_id_para)
			THEN
			SET err_message= "your order is placed" ;
			UPDATE food_details SET food_details.quantity=food_details.quantity-quants WHERE id=fid;
			SET price_para=(SELECT price FROM seed_food WHERE id=fid);
			SET price_sec_para=(price_para*quants);
			INSERT INTO food_ordered(order_id,food_id,quantity,price) VALUES(order_id_para,fid,quants,price_sec_para);
			ELSE 
			SET err_message="ordered food from proper category";
			END IF;
                  
		  
          
        
            SET i=i+1;
            END   LOOP;
            IF i=no_of_item
            THEN
            SET total_price=(SELECT  SUM(price) FROM food_ordered WHERE order_id=order_id_para);
                  INSERT INTO order_details(seat_no,order_id,price,status_s) VALUES(seat_no_para,order_id_para,total_price,'ordered');
                   UPDATE seed_seat SET seat_no=1 WHERE seed_seat.id=seat_no_para;
            
            END IF;
                 
                 ELSE
                 SET err_message= "you can order only 5 item per order";
                
                 END IF;
	END$$

DELIMITER ;