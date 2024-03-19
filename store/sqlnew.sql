/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 5.7.9 : Database - bake_storemes
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bake_storemes` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `bake_storemes`;

/*Table structure for table `brand` */

-- DROP TABLE IF EXISTS `brand`;

-- CREATE TABLE `brand` (
--   `brand_id` int(11) NOT NULL AUTO_INCREMENT,
--   `brand_name` varchar(100) DEFAULT NULL,
--   `brand_description` varchar(100) DEFAULT NULL,
--   `brand_status` varchar(1) DEFAULT NULL,
--   PRIMARY KEY (`brand_id`)
-- ) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- /*Data for the table `brand` */

-- insert  into `brand`(`brand_id`,`brand_name`,`brand_description`,`brand_status`) values 
-- (1,'bag','dfghjk1','0'),
-- (2,'ring','fgfgfs','0'),
-- (3,'user1','fghjkl','1'),
-- (4,'parle','xbzhdf','1'),
-- (5,'fhdfjdss','dkjhkjss','1');

/*Table structure for table `card` */

-- DROP TABLE IF EXISTS `card`;

-- CREATE TABLE `card` (
--   `card_id` int(11) NOT NULL AUTO_INCREMENT,
--   `customer_id` int(11) DEFAULT NULL,
--   `card_no` varchar(100) DEFAULT NULL,
--   `card_name` varchar(100) DEFAULT NULL,
--   `expiry_date` varchar(100) DEFAULT NULL,
--   PRIMARY KEY (`card_id`)
-- ) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `card` */

-- insert  into `card`(`card_id`,`customer_id`,`card_no`,`card_name`,`expiry_date`) values 
-- (1,1,'1234567890123456','dfsgsge','2023-08'),
-- (2,1,'3345435435356357','bgggxfd','2023-12'),
-- (3,4,'4637865387658462','hgggjh','2023-12');

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) DEFAULT NULL,
  `category_description` varchar(100) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `category` */

insert  into `category`(`category_id`,`category_name`,`category_description`,`status`) values 
(1,'bags','dddzds1','1'),
(2,'jewllery','fghjkl','1');

/*Table structure for table `complaint` */

-- DROP TABLE IF EXISTS `complaint`;

-- CREATE TABLE `complaint` (
--   `complaint_id` int(11) NOT NULL AUTO_INCREMENT,
--   `customer_id` int(11) DEFAULT NULL,
--   `complaint` varchar(100) DEFAULT NULL,
--   `reply` varchar(100) DEFAULT NULL,
--   `date` varchar(100) DEFAULT NULL,
--   PRIMARY KEY (`complaint_id`)
-- ) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `complaint` */

-- insert  into `complaint`(`complaint_id`,`customer_id`,`complaint`,`reply`,`date`) values 
-- (1,1,'good','ok','2023-01-10');

/*Table structure for table `courier` */

-- DROP TABLE IF EXISTS `courier`;

-- CREATE TABLE `courier` (
--   `courier_id` int(11) NOT NULL AUTO_INCREMENT,
--   `staff_id` int(11) DEFAULT NULL,
--   `username` varchar(100) DEFAULT NULL,
--   `courier_name` varchar(100) DEFAULT NULL,
--   `courier_building_name` varchar(100) DEFAULT NULL,
--   `courier_street` varchar(100) DEFAULT NULL,
--   `courier_city` varchar(100) DEFAULT NULL,
--   `courier_state` varchar(100) DEFAULT NULL,
--   `courier_pincode` varchar(100) DEFAULT NULL,
--   `courier_phone` varchar(100) DEFAULT NULL,
--   `courier_email` varchar(100) DEFAULT NULL,
--   `date_added` varchar(100) DEFAULT NULL,
--   `courier_status` varchar(100) DEFAULT NULL,
--   PRIMARY KEY (`courier_id`)
-- ) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `courier` */

-- insert  into `courier`(`courier_id`,`staff_id`,`username`,`courier_name`,`courier_building_name`,`courier_street`,`courier_city`,`courier_state`,`courier_pincode`,`courier_phone`,`courier_email`,`date_added`,`courier_status`) values 
-- (1,0,'hai@gmail.com','user qwerty1','xfdsgdsg1','xfdsgdsg1','ddgdsgdsg1','dgdsgd1','123456','0234567890','student1@gmail.com','2023-01-21','1'),
-- (2,0,'qerty','kjgasdhu','klajsfiuskla','dskjafhyoli','kljsdfyuql',',mgkuyilw','567890','8970869056','anan@gmail.com','2023-04-17','1');

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `customer_fname` varchar(100) DEFAULT NULL,
  `customer_lname` varchar(100) DEFAULT NULL,
  `customer_houser_name` varchar(100) DEFAULT NULL,
  `customer_street` varchar(100) DEFAULT NULL,
  `customer_city` varchar(100) DEFAULT NULL,
  `customer_state` varchar(100) DEFAULT NULL,
  `customer_pincode` varchar(100) DEFAULT NULL,
  `customer_phone` varchar(100) DEFAULT NULL,
  `customer_email` varchar(100) DEFAULT NULL,
  `customer_status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `customer` */

insert  into `customer`(`customer_id`,`username`,`customer_fname`,`customer_lname`,`customer_houser_name`,`customer_street`,`customer_city`,`customer_state`,`customer_pincode`,`customer_phone`,`customer_email`,`customer_status`) values 
(1,'user@gmail.com','user','qwerty','xfdsgdsg','gsdgdsg','ddgdsgdsg','dgdsgd','123456','2345678907','student@gmail.com',0),
(2,'adhilakhan02@gmail.com','adhila','khan','velamparambil','kochukadavu','mala','kerala','680734','8970869056','adhilakhan02@gmail.com',1),
(3,'maya','gkjfuy','lkjhoui','ryrthtdh','htghrt','ehtehd','ertghuye','897065','8970869056','mayaxaviour@gmail.com',1),
(4,'Reshma kamath','Reshmas','Kamaths','Thushiparambil houses','Shivalayam roads','Ernakulams','Keralas ','682035','8078770123','barbequeen650@gmail.com',1);

/*Table structure for table `delivery` */

DROP TABLE IF EXISTS `delivery`;

CREATE TABLE `delivery` (
  `delivery_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_master_id` int(11) DEFAULT NULL,
  `courier_id` int(11) DEFAULT NULL,
  `delivery_date` varchar(100) DEFAULT NULL,
  `status` varchar(41) DEFAULT NULL,
  PRIMARY KEY (`delivery_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `delivery` */

insert  into `delivery`(`delivery_id`,`order_master_id`,`courier_id`,`delivery_date`,`status`) values 
(1,3,1,'2023-01-10','Delivered'),
(2,2,1,'2023-04-07','Assigned'),
(3,1,1,'2023-04-19','Assigned'),
(4,1,1,'2023-04-19','Delivered');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `username` varchar(100) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `user_type` varchar(100) DEFAULT NULL,
  `status` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`username`,`password`,`user_type`,`status`) values 
('admin@gmail.com','admin','admin','1'),
('hai@gmail.com','hai','courier','1'),
('courier@gmail.com','cou','courier','1'),
('renuka@gmail.com','1234','staff','1'),
('user@gmail.com','user','customer','1'),
('ven','ven','vendor','1'),
('suresh@gmail.com','12345','vendor','1'),
('qerty','quer','courier','1'),
('adhilakhan02@gmail.com','adhi#776','customer','1'),
('maya','maya2','customer','1'),
('Reshma kamath','123456','customer','1');

/*Table structure for table `order_details` */

DROP TABLE IF EXISTS `order_details`;

CREATE TABLE `order_details` (
  `order_details_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_master_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` varchar(100) DEFAULT NULL,
  `total_price` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`order_details_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `order_details` */

insert  into `order_details`(`order_details_id`,`order_master_id`,`product_id`,`quantity`,`total_price`) values 
(1,1,6,'1','1200'),
(2,2,6,'1','1200');

/*Table structure for table `order_master` */

DROP TABLE IF EXISTS `order_master`;

CREATE TABLE `order_master` (
  `order_master_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `total_amount` int(100) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL,
  `order_status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`order_master_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `order_master` */

insert  into `order_master`(`order_master_id`,`customer_id`,`total_amount`,`date`,`order_status`) values 
(1,4,1200,'2023-04-19','Delivered'),
(2,4,1200,'2023-04-19','paid');

/*Table structure for table `payment` */

DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_master_id` int(11) DEFAULT NULL,
  `amount` varchar(100) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `payment` */

insert  into `payment`(`payment_id`,`order_master_id`,`amount`,`date`) values 
(1,2,'600','2023-01-10'),
(2,3,'120600','2023-01-10'),
(3,4,'460','2023-04-07'),
(4,5,'110','2023-04-07'),
(5,6,'1100','2023-04-17'),
(6,7,'1112','2023-04-17'),
(7,1,'1200','2023-04-19'),
(8,2,'1200','2023-04-19');

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `product_description` varchar(100) DEFAULT NULL,
  `product_image` varchar(1000) DEFAULT NULL,
  `stock` varchar(100) DEFAULT NULL,
  `product_status` varchar(1) DEFAULT NULL,
  `rate` varchar(100) DEFAULT NULL,
  `ExpiryDate` varchar(100) DEFAULT NULL,
  `ManufactureDate` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `product` */

insert  into `product`(`product_id`,`brand_id`,`category_id`,`product_name`,`product_description`,`product_image`,`stock`,`product_status`,`rate`,`ExpiryDate`,`ManufactureDate`) values 
(5,4,2,'asdfg','gfdyj,bk','static/image99ad6821-cd71-4a62-964e-fcf32ea6bd30deepavali.jpg','0','1','58','2022-03-02','2023-05-04'),
(6,4,2,'vendor','ggdgfdg','static/imagef72e63b2-095a-4070-9b8e-6c9f8e1119d6bike.jpg','3','1','1200','5443-05-31','2455-03-04');

/*Table structure for table `purchase_child` */

DROP TABLE IF EXISTS `purchase_child`;

CREATE TABLE `purchase_child` (
  `purchase_child_id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_master_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `cost_price` varchar(100) DEFAULT NULL,
  `selling_price` varchar(100) DEFAULT NULL,
  `quantity` varchar(100) DEFAULT NULL,
  `pc_status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`purchase_child_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `purchase_child` */

insert  into `purchase_child`(`purchase_child_id`,`purchase_master_id`,`product_id`,`cost_price`,`selling_price`,`quantity`,`pc_status`) values 
(1,1,6,'200','1200','1','stock added'),
(2,2,6,'500','3000','3','available'),
(3,3,6,'2400','1200','4','stock added'),
(4,2,6,'1200','1200','1','available');

/*Table structure for table `purchase_master` */

DROP TABLE IF EXISTS `purchase_master`;

CREATE TABLE `purchase_master` (
  `purchase_master_id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `total` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`purchase_master_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `purchase_master` */

insert  into `purchase_master`(`purchase_master_id`,`vendor_id`,`staff_id`,`total`,`status`,`date`) values 
(1,4,0,'200','paid','2023-04-19'),
(2,3,0,'2700','pending','2023-04-19'),
(3,4,0,'4800','paid','2023-04-19');

/*Table structure for table `staff` */

-- DROP TABLE IF EXISTS `staff`;

-- CREATE TABLE `staff` (
--   `staff_id` int(11) NOT NULL AUTO_INCREMENT,
--   `username` varchar(100) DEFAULT NULL,
--   `staff_fname` varchar(100) DEFAULT NULL,
--   `staff_lname` varchar(100) DEFAULT NULL,
--   `staff_house_name` varchar(100) DEFAULT NULL,
--   `staff_street` varchar(100) DEFAULT NULL,
--   `staff_city` varchar(100) DEFAULT NULL,
--   `staff_state` varchar(100) DEFAULT NULL,
--   `staff_pincode` varchar(100) DEFAULT NULL,
--   `staff_phone` varchar(100) DEFAULT NULL,
--   `staff_email` varchar(100) DEFAULT NULL,
--   `staff_salary` varchar(100) DEFAULT NULL,
--   `date_added` varchar(100) DEFAULT NULL,
--   `staff_status` varchar(100) DEFAULT NULL,
--   PRIMARY KEY (`staff_id`)
-- ) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `staff` */

-- insert  into `staff`(`staff_id`,`username`,`staff_fname`,`staff_lname`,`staff_house_name`,`staff_street`,`staff_city`,`staff_state`,`staff_pincode`,`staff_phone`,`staff_email`,`staff_salary`,`date_added`,`staff_status`) values 
-- (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
-- (2,'renuka@gmail.com','user1','qwerty1','xfdsgdsg1','gsdgdsg1','ddgdsgdsg1','sdnsadas1','123456','1234567890','student@gmail.com','5001','2023-01-22','0');

/*Table structure for table `vendor` */

DROP TABLE IF EXISTS `vendor`;

CREATE TABLE `vendor` (
  `vendor_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `vendor_name` varchar(100) DEFAULT NULL,
  `vendor_building_name` varchar(100) DEFAULT NULL,
  `vendor_street` varchar(100) DEFAULT NULL,
  `vendor_city` varchar(100) DEFAULT NULL,
  `vendor_state` varchar(100) DEFAULT NULL,
  `vendor_pincode` varchar(100) DEFAULT NULL,
  `vendor_phone` varchar(100) DEFAULT NULL,
  `vendor_email` varchar(100) DEFAULT NULL,
  `date_added` varchar(100) DEFAULT NULL,
  `vendor_status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`vendor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `vendor` */

insert  into `vendor`(`vendor_id`,`username`,`staff_id`,`vendor_name`,`vendor_building_name`,`vendor_street`,`vendor_city`,`vendor_state`,`vendor_pincode`,`vendor_phone`,`vendor_email`,`date_added`,`vendor_status`) values 
(1,NULL,0,'user qwerty','xfdsgdsg','xfdsgdsg','ddgdsgdsg1','dgdsgd1','123456','1234678901','student@gmail.com','2023-01-27','0'),
(2,NULL,0,'ujkuyky1','kjukyh1','jjkyuk1','jkjhkhjm1','jkjhkhj1','123456','1234560987','mkh@gmail.com','2023-01-08','1'),
(3,'ven',0,'user qwerty','user qwerty','xfdsgdsg','ddgdsgdsg','dgdsgd','123456','1234578908','student@gmail.com','2023-04-07','1'),
(4,'suresh@gmail.com',0,'ap kakku and sons',',mds.aho.n',',m.hiuo8','Aluva','kerala','680976','8970869056','suresh@gmail.com','2023-04-17','1');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
