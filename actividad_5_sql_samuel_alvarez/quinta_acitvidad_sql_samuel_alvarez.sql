-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.24-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para heladeria_y_pizzeria_la_65
DROP DATABASE IF EXISTS `heladeria_y_pizzeria_la_65`;
CREATE DATABASE IF NOT EXISTS `heladeria_y_pizzeria_la_65` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `heladeria_y_pizzeria_la_65`;

-- Volcando estructura para tabla heladeria_y_pizzeria_la_65.customers
DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `age` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla heladeria_y_pizzeria_la_65.customers: ~8 rows (aproximadamente)
DELETE FROM `customers`;
INSERT INTO `customers` (`id`, `name`, `age`) VALUES
	(1, 'Alexander García', 21),
	(2, 'Sergio Manrique', 26),
	(3, 'Samuel Alvarez', 18),
	(4, 'Juan Pablo Colorado', 20),
	(5, 'Anderson Lozano', 21),
	(6, 'Camila Alvarez', 19),
	(7, 'Manuela Pulgarín', 19),
	(8, 'Andrea Hernandez', 18),
	(9, 'Luis Mosquera', 22),
	(10, 'Elkin Ramirez', 20);

-- Volcando estructura para tabla heladeria_y_pizzeria_la_65.discounts
DROP TABLE IF EXISTS `discounts`;
CREATE TABLE IF NOT EXISTS `discounts` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `discount` float unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla heladeria_y_pizzeria_la_65.discounts: ~3 rows (aproximadamente)
DELETE FROM `discounts`;
INSERT INTO `discounts` (`id`, `name`, `discount`) VALUES
	(1, 'cumpleaños', 0.15),
	(2, 'miercoles_de_rebaja', 0.1),
	(3, 'viernes_de_antojo', 0.08);

-- Volcando estructura para tabla heladeria_y_pizzeria_la_65.products
DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `price` float(12,2) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla heladeria_y_pizzeria_la_65.products: ~3 rows (aproximadamente)
DELETE FROM `products`;
INSERT INTO `products` (`id`, `name`, `price`) VALUES
	(1, 'pollo', 35000.00),
	(2, 'helado', 25000.00),
	(3, 'pizza', 40000.00);

-- Volcando estructura para tabla heladeria_y_pizzeria_la_65.sales
DROP TABLE IF EXISTS `sales`;
CREATE TABLE IF NOT EXISTS `sales` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` smallint(5) unsigned NOT NULL,
  `date` date NOT NULL,
  `value` float unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla heladeria_y_pizzeria_la_65.sales: ~8 rows (aproximadamente)
DELETE FROM `sales`;
INSERT INTO `sales` (`id`, `customer_id`, `date`, `value`) VALUES
	(1, 2, '2022-06-16', 105000),
	(2, 1, '2019-06-16', 50000),
	(3, 3, '2022-06-15', 40000),
	(4, 4, '2022-06-13', 70000),
	(5, 5, '2021-05-12', 25000),
	(6, 6, '2022-06-14', 70000),
	(7, 7, '2022-06-11', 120000),
	(8, 8, '2022-06-10', 70000),
	(9, 9, '2022-06-15', 75000),
	(10, 10, '2022-06-16', 50000);

-- Volcando estructura para tabla heladeria_y_pizzeria_la_65.sales_discounts
DROP TABLE IF EXISTS `sales_discounts`;
CREATE TABLE IF NOT EXISTS `sales_discounts` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `discount_id` smallint(5) unsigned NOT NULL,
  `sale_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla heladeria_y_pizzeria_la_65.sales_discounts: ~4 rows (aproximadamente)
DELETE FROM `sales_discounts`;
INSERT INTO `sales_discounts` (`id`, `discount_id`, `sale_id`) VALUES
	(1, 1, 1),
	(2, 2, 2),
	(3, 3, 3),
	(4, 2, 4);

-- Volcando estructura para tabla heladeria_y_pizzeria_la_65.sales_products
DROP TABLE IF EXISTS `sales_products`;
CREATE TABLE IF NOT EXISTS `sales_products` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` smallint(5) unsigned NOT NULL,
  `sale_id` smallint(5) unsigned NOT NULL,
  `amount` smallint(5) unsigned NOT NULL,
  `price` float unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla heladeria_y_pizzeria_la_65.sales_products: ~9 rows (aproximadamente)
DELETE FROM `sales_products`;
INSERT INTO `sales_products` (`id`, `product_id`, `sale_id`, `amount`, `price`) VALUES
	(1, 2, 1, 2, 25000),
	(2, 1, 2, 3, 35000),
	(3, 3, 3, 1, 40000),
	(4, 1, 4, 2, 35000),
	(5, 2, 5, 1, 25000),
	(6, 1, 6, 2, 35000),
	(7, 3, 7, 3, 40000),
	(8, 1, 8, 2, 35000),
	(9, 2, 9, 3, 25000),
	(10, 2, 10, 2, 25000);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
