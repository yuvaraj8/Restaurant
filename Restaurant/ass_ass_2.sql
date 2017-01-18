

DELIMITER $$
CREATE PROCEDURE RestaurantStudy(seatnopar INT,food VARCHAR(20),ordertime TIME,qty INT)
BEGIN 
DECLARE rem INT; 
DECLARE seId INT;
DECLARE seatid INT;
DECLARE itemidpar INT;
SET seId=(SELECT Sessionid FROM sessions WHERE ordertime BETWEEN Fromtime AND Totime);
SET itemidpar=(SELECT ItemId FROM itemslist WHERE Items=food AND Sessionid=seId);

IF seId=(SELECT Sessionid FROM itemslist WHERE ItemId=itemidpar)
THEN
IF  (SELECT COUNT(DISTINCT(Foodordered)) FROM ordertransaction WHERE SeatNo=seatnopar)<=4
THEN
        IF EXISTS(SELECT SeatNo FROM seatdetails WHERE SeatNo=seatnopar)
        THEN
                UPDATE seatdetails
		SET SeatStatus='SeatTaken'
		WHERE SeatNo=seatnopar;
		SELECT remaining INTO rem FROM remainingdetails WHERE ItemId=itemidpar;
		IF rem<qty 
		THEN 
			SELECT 'Item got over' AS message;
		ELSE 
			UPDATE remainingdetails
			SET remaining=rem-qty
			WHERE ItemId=itemidpar;
			INSERT INTO ordertransaction(ItemId,SeatNo,Foodordered,Quantity,OrderTime,STATUS) VALUES(itemidpar,seatnopar,food,qty,ordertime,'OrderPlaced');
                SELECT 'Order Placed' AS statement;		
		END IF;
	ELSE 
		SELECT 'There is no seat' AS message;
		END IF;
       ELSE
       UPDATE seatdetails
               SET SeatStatus='Available'
               WHERE SeatNo=seatnopar;	
       SELECT 'Your items limit exceeded' AS statement;
               END IF ;
       ELSE 
       SELECT 'Item is wrongly ordered' AS statement;
       END IF;

END $$
DELIMITER ;



CALL RestaurantStudy(101,'dosa','09:00',5);
SELECT * FROM ordertransaction
TRUNCATE TABLE ordertransaction



DROP PROCEDURE RestaurantStudy;