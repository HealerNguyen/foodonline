-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 14, 2019 at 10:02 PM
-- Server version: 5.7.25-0ubuntu0.16.04.2
-- PHP Version: 7.0.33-2+ubuntu16.04.1+deb.sury.org+2+will+reach+end+of+life+in+april+2019

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `foodonline`
--
CREATE DATABASE IF NOT EXISTS `foodonline` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `foodonline`;

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `bill_no` int(11) NOT NULL,
  `bill_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mobile` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bill_det`
--

CREATE TABLE `bill_det` (
  `bill_no` int(11) NOT NULL,
  `itemid` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `photo` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `price`, `category`, `photo`) VALUES
(1, 'Magarita Pizza', 3.75, 'Pizza', 'Margarita2_big.jpg'),
(2, 'Chicken Alfredo', 5.99, 'Pizza', 'Chicken Alfredo2_big.jpg'),
(3, 'PepperOnl Lover Pizza', 4.74, 'Pizza', 'Pepperoni lovers2_big.jpg'),
(4, 'Plain Nuttela Pizza', 3.44, 'Pizza', 'plain Nutella2_big.jpg'),
(5, 'Phily Steak Sanwich', 2.54, 'Sanwich', 'Philly steak sandwich2_big.jpg'),
(6, 'Chicken Sanwich', 2.47, 'Sanwich', 'Chicken sandwich2_big.jpg'),
(7, 'Hotdog Sanwich', 2.15, 'Sanwich', 'hotdog sandwich2_big.jpg'),
(8, 'Turkey Sanwich', 2.49, 'Sanwich', 'turkey sandwich2_big.jpg'),
(9, 'Caesar Salad', 3.01, 'Salad', 'Caesar salad2_big.jpg'),
(10, 'Greek Salad', 5.99, 'Salad', 'Greek salad2_big.jpg'),
(11, 'Arabic Salad', 6.99, 'Salad', 'Arabic salad2_big.jpg'),
(12, 'Tuna Salad', 4.99, 'Salad', 'Tuna salad2_big.jpg'),
(13, 'Bonless Wing', 5.99, 'Wing', 'bonless wing_big.jpg'),
(14, 'Bonless Wings', 6.89, 'Wing', 'bonless_wing_big1.jpg'),
(15, 'Peppsi diet', 1.89, 'Water', 'Diet_Pepsi_big.jpg'),
(16, 'Peppsi min', 5.99, 'Water', 'Pepsi-min_636021950800177962.jpg'),
(17, 'Mountain Dew', 4.99, 'Water', 'mtnDew_big.jpg'),
(18, 'Water min', 3.99, 'Water', 'Water-min_636021951390013962.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `temp_order`
--

CREATE TABLE `temp_order` (
  `mobile` varchar(13) DEFAULT NULL,
  `itemid` int(11) DEFAULT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `mobile` varchar(13) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`bill_no`);

--
-- Indexes for table `bill_det`
--
ALTER TABLE `bill_det`
  ADD KEY `bill_no` (`bill_no`),
  ADD KEY `itemid` (`itemid`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `temp_order`
--
ALTER TABLE `temp_order`
  ADD KEY `itemid` (`itemid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `bill_no` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`bill_no`) REFERENCES `bill_det` (`bill_no`);

--
-- Constraints for table `bill_det`
--
ALTER TABLE `bill_det`
  ADD CONSTRAINT `bill_det_ibfk_1` FOREIGN KEY (`itemid`) REFERENCES `items` (`id`);

--
-- Constraints for table `temp_order`
--
ALTER TABLE `temp_order`
  ADD CONSTRAINT `temp_order_ibfk_1` FOREIGN KEY (`itemid`) REFERENCES `items` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
