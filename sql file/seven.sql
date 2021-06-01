-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 01, 2021 at 11:01 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `seven`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(2) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Security'),
(2, 'Health & Safety'),
(3, 'Loss Prevention');

-- --------------------------------------------------------

--
-- Table structure for table `incident`
--

CREATE TABLE `incident` (
  `id` int(11) NOT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `title` text NOT NULL,
  `category` int(2) NOT NULL,
  `comments` text NOT NULL,
  `incidentDate` datetime NOT NULL,
  `createDate` datetime NOT NULL,
  `modifyDate` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `incident`
--

INSERT INTO `incident` (`id`, `latitude`, `longitude`, `title`, `category`, `comments`, `incidentDate`, `createDate`, `modifyDate`) VALUES
(1, '12.92315010', '74.78185170', 'incident title', 1, 'This is a string of comments', '2020-09-01 13:26:00', '2020-09-01 13:32:59', '2020-09-01 13:32:59'),
(2, '12.92315010', '74.78185170', 'incident title', 1, 'This is a string of comments', '2020-09-01 13:26:00', '2020-09-01 13:32:59', '2020-09-01 13:32:59'),
(3, '12.92315010', '74.78185170', 'incident title', 1, 'This is a string of comments', '2020-09-01 13:26:00', '2020-09-01 13:32:59', '2020-09-01 13:32:59');

-- --------------------------------------------------------

--
-- Table structure for table `people`
--

CREATE TABLE `people` (
  `id` int(11) NOT NULL,
  `incident_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `type` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `people`
--

INSERT INTO `people` (`id`, `incident_id`, `name`, `type`) VALUES
(1, 1, 'Name of person', 'staff'),
(2, 1, 'Name of person', 'witness'),
(3, 1, 'Name of person', 'staff'),
(4, 2, 'Name of person', 'staff'),
(5, 2, 'Name of person', 'witness'),
(6, 2, 'Name of person', 'staff'),
(7, 3, 'Name of person', 'staff'),
(8, 3, 'Name of person', 'witness'),
(9, 3, 'Name of person', 'staff');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `incident`
--
ALTER TABLE `incident`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `incident`
--
ALTER TABLE `incident`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `people`
--
ALTER TABLE `people`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
