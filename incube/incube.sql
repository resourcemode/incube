-- phpMyAdmin SQL Dump
-- version 4.2.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 06, 2014 at 06:09 PM
-- Server version: 5.6.19
-- PHP Version: 5.5.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `incube_bus`
--

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

CREATE TABLE IF NOT EXISTS `bus` (
`bus_id` int(11) NOT NULL,
  `bus_name` varchar(100) DEFAULT NULL,
  `bus_number` int(11) DEFAULT NULL,
  `bus_type` int(11) DEFAULT NULL,
  `bus_interval` time DEFAULT NULL,
  `bus_location` int(11) DEFAULT NULL,
  `bus_speed` int(11) DEFAULT NULL,
  `bus_created` datetime DEFAULT NULL,
  `bus_creator` varchar(100) NOT NULL DEFAULT 'Application',
  `bus_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bus_updator` varchar(100) NOT NULL DEFAULT 'Application',
  `bus_isdeleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `bus`
--

INSERT INTO `bus` (`bus_id`, `bus_name`, `bus_number`, `bus_type`, `bus_interval`, `bus_location`, `bus_speed`, `bus_created`, `bus_creator`, `bus_updated`, `bus_updator`, `bus_isdeleted`) VALUES
(1, 'SBS Transit', 147, 3, '00:10:00', 2, 60, '2014-08-02 00:00:00', 'Application', '2014-08-01 08:41:34', 'Application', 0),
(2, 'SMRT Transit', 123, 1, NULL, 2, 65, NULL, 'Application', '2014-08-03 03:09:01', 'Application', 0),
(3, 'SMRT ', 111, 2, NULL, 1, 50, NULL, 'Application', '2014-08-04 01:42:44', 'Application', 0),
(4, 'SBS ', 99, 1, NULL, 1, 70, NULL, 'Application', '2014-10-06 09:36:27', 'Application', 0),
(5, 'SBS ', 100, 2, NULL, 3, 100, NULL, 'Application', '2014-10-06 09:36:47', 'Application', 0),
(6, 'SBS ', 99, 1, NULL, 2, 80, NULL, 'Application', '2014-10-06 09:36:54', 'Application', 0),
(7, 'SMRT ', 777, 1, NULL, 4, 70, NULL, 'Application', '2014-10-06 09:39:17', 'Application', 0),
(8, 'SMRT ', 33, 1, NULL, 4, 60, NULL, 'Application', '2014-10-06 09:39:54', 'Application', 0),
(9, 'SMRT ', 22, 1, NULL, 3, 105, NULL, 'Application', '2014-10-06 09:42:59', 'Application', 0),
(10, 'SMRT ', 45, 1, NULL, 6, 100, NULL, 'Application', '2014-10-06 09:49:07', 'Application', 0);

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE IF NOT EXISTS `location` (
`loc_id` int(11) NOT NULL,
  `loc_name` varchar(255) DEFAULT NULL,
  `loc_distance` int(11) DEFAULT NULL,
  `loc_created` datetime DEFAULT NULL,
  `loc_creator` varchar(100) NOT NULL DEFAULT 'Application',
  `loc_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `loc_updator` varchar(100) NOT NULL DEFAULT 'Application',
  `loc_isdeleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`loc_id`, `loc_name`, `loc_distance`, `loc_created`, `loc_creator`, `loc_updated`, `loc_updator`, `loc_isdeleted`) VALUES
(1, 'Bugis', 5, '2014-08-02 00:00:00', 'Application', '2014-08-01 08:38:23', 'Application', 0),
(2, 'City Hall', 15, '2014-08-02 00:00:00', 'Application', '2014-08-01 08:38:23', 'Application', 0),
(3, 'Buangkok', 30, '2014-08-02 00:00:00', 'Application', '2014-08-01 08:39:03', 'Application', 0),
(4, 'Raffles', 60, '2014-08-02 00:00:00', 'Application', '2014-08-01 08:39:03', 'Application', 0),
(5, 'Paya Lebar', 20, NULL, 'Application', '2014-08-04 02:01:09', 'Application', 0),
(6, 'Hougang', 40, NULL, 'Application', '2014-08-04 03:01:51', 'Application', 0);

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE IF NOT EXISTS `type` (
`type_id` int(11) NOT NULL,
  `type_name` varchar(100) DEFAULT NULL,
  `type_created` datetime DEFAULT NULL,
  `bus_creator` varchar(100) NOT NULL DEFAULT 'Application',
  `type_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type_updator` varchar(100) NOT NULL DEFAULT 'Application',
  `type_isdeleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`type_id`, `type_name`, `type_created`, `bus_creator`, `type_updated`, `type_updator`, `type_isdeleted`) VALUES
(1, 'Tour Bus', '2014-08-02 00:00:00', 'Application', '2014-08-01 16:11:51', 'Application', 0),
(2, 'School Bus', '2014-08-02 00:00:00', 'Application', '2014-08-01 16:11:51', 'Application', 0),
(3, 'Public Single-deck Bus', '2014-08-02 00:00:00', 'Application', '2014-08-01 16:14:21', 'Application', 0),
(4, 'Public Double-decker Bus', '2014-08-02 00:00:00', 'Application', '2014-08-01 16:14:21', 'Application', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bus`
--
ALTER TABLE `bus`
 ADD PRIMARY KEY (`bus_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
 ADD PRIMARY KEY (`loc_id`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
 ADD PRIMARY KEY (`type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bus`
--
ALTER TABLE `bus`
MODIFY `bus_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
MODIFY `loc_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
