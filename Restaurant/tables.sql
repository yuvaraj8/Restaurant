/*
SQLyog Community v12.3.3 (64 bit)
MySQL - 5.6.10 : Database - hms
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`hms` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `hms`;

/*Table structure for table `food_details` */

DROP TABLE IF EXISTS `food_details`;

CREATE TABLE `food_details` (
  `id` int(11) NOT NULL,
  `food_id` int(20) NOT NULL,
  `session` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`food_id`,`session`),
  KEY `f_ke1` (`session`),
  CONSTRAINT `f_ke` FOREIGN KEY (`food_id`) REFERENCES `seed_food` (`id`),
  CONSTRAINT `f_ke1` FOREIGN KEY (`session`) REFERENCES `seed_session` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `food_details` */

insert  into `food_details`(`id`,`food_id`,`session`,`quantity`) values 
(1,1,1,100),
(2,2,1,100),
(3,3,1,100),
(4,4,1,100),
(5,5,1,100),
(6,6,1,100),
(11,6,3,198),
(7,7,1,100),
(12,7,3,196),
(8,8,2,75),
(9,9,2,75),
(10,10,2,75),
(13,11,3,200),
(14,12,4,100),
(15,13,4,100),
(16,14,4,100);

/*Table structure for table `food_ordered` */

DROP TABLE IF EXISTS `food_ordered`;

CREATE TABLE `food_ordered` (
  `order_id` int(11) NOT NULL,
  `food_id` varchar(20) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '0',
  `price` int(10) unsigned NOT NULL,
  PRIMARY KEY (`order_id`,`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `food_ordered` */

insert  into `food_ordered`(`order_id`,`food_id`,`quantity`,`price`) values 
(111,'11',1,50),
(111,'12',2,30);

/*Table structure for table `max_order` */

DROP TABLE IF EXISTS `max_order`;

CREATE TABLE `max_order` (
  `id` int(11) NOT NULL,
  `max_order` int(11) NOT NULL,
  `key` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `max_order` */

insert  into `max_order`(`id`,`max_order`,`key`) values 
(1,5,'weekday');

/*Table structure for table `order_details` */

DROP TABLE IF EXISTS `order_details`;

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seat_no` int(11) DEFAULT NULL,
  `order_id` varchar(20) NOT NULL DEFAULT '0',
  `price` int(11) DEFAULT NULL,
  `status_s` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

/*Data for the table `order_details` */

insert  into `order_details`(`id`,`seat_no`,`order_id`,`price`,`status_s`) values 
(59,7,'111',80,'billed');

/*Table structure for table `seed_food` */

DROP TABLE IF EXISTS `seed_food`;

CREATE TABLE `seed_food` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `seed_food` */

insert  into `seed_food`(`id`,`name`,`price`) values 
(1,'Idly',5),
(2,'Vada',6),
(3,'Dosa',7),
(4,'Poori',8),
(5,'pongal',4),
(6,'Coffee',6),
(7,'Tea',7),
(8,'SouthIndianMeals',20),
(9,'NorthIndianThali',25),
(10,'varietyRice',35),
(11,'Snacks',50),
(12,'FriedRice',15),
(13,'chappathi',20),
(14,'chatItems',25);

/*Table structure for table `seed_seat` */

DROP TABLE IF EXISTS `seed_seat`;

CREATE TABLE `seed_seat` (
  `id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `seed_seat` */

insert  into `seed_seat`(`id`,`status`) values 
(1,0),
(2,0),
(3,0),
(4,0),
(5,0),
(6,0),
(7,1),
(8,0),
(9,0),
(10,0);

/*Table structure for table `seed_session` */

DROP TABLE IF EXISTS `seed_session`;

CREATE TABLE `seed_session` (
  `id` int(11) NOT NULL,
  `session` varchar(20) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `seed_session` */

insert  into `seed_session`(`id`,`session`,`start_time`,`end_time`) values 
(1,'Break_fast','08:00:00','11:00:00'),
(2,'Lunch','11:15:00','15:00:00'),
(3,'Refreshment','15:15:00','23:00:00'),
(4,'Dinner','19:00:00','23:00:00');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
