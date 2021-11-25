-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2021 at 05:54 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `signup`
--

-- --------------------------------------------------------

--
-- Table structure for table `alldepart`
--

CREATE TABLE `alldepart` (
  `id` int(11) NOT NULL,
  `empid` varchar(255) DEFAULT NULL,
  `depart` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `alldepart`
--

INSERT INTO `alldepart` (`id`, `empid`, `depart`) VALUES
(1, '1', '6'),
(2, '1', '7'),
(3, '2', '6'),
(4, '2', '7'),
(5, '4', '5'),
(6, '4', '6'),
(7, '5', '1'),
(8, '5', '2'),
(9, '5', '8'),
(10, '7', '6');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id` int(11) NOT NULL,
  `city_name` varchar(100) NOT NULL,
  `state_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `city_name`, `state_id`) VALUES
(1, 'Patna', 1),
(2, 'Danapur', 1),
(3, 'Kanpur', 2),
(4, 'Aagra', 2),
(5, 'Indore', 3),
(6, 'Bhopal', 3),
(7, 'Karachi city', 5),
(8, 'Lahor City', 6);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `country_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `country_name`) VALUES
(1, 'India'),
(2, 'America'),
(3, 'Japan'),
(4, 'England'),
(5, 'Pakistan');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `depart` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `depart`) VALUES
(1, 'IT'),
(2, 'Developer'),
(3, 'HR'),
(4, 'Office Boy'),
(5, 'Quality'),
(6, 'Sales'),
(7, 'Research'),
(8, 'Management');

-- --------------------------------------------------------

--
-- Table structure for table `emp_detail`
--

CREATE TABLE `emp_detail` (
  `eid` int(11) NOT NULL,
  `profile_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emp_detail`
--

INSERT INTO `emp_detail` (`eid`, `profile_id`, `name`, `address`, `gender`, `status`) VALUES
(1, 'EQ111', 'ravi', 'ujjain', 'Male', 0),
(2, 'EQ111', 'Archana', 'indore', 'Female', 0),
(4, 'EQ111', 'suresh', 'equicom', 'Male', 0),
(5, 'EQ151', 'Neha', 'Heart', 'Female', 0),
(7, 'EQ111', 'rohit', 'indore', 'Male', 0);

-- --------------------------------------------------------

--
-- Table structure for table `emp_mobile`
--

CREATE TABLE `emp_mobile` (
  `id` int(11) NOT NULL,
  `pro_id` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `emp_profile`
--

CREATE TABLE `emp_profile` (
  `id` int(11) NOT NULL,
  `emp_id` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emp_profile`
--

INSERT INTO `emp_profile` (`id`, `emp_id`, `email`, `password`) VALUES
(1, 'EQ151', 'suman@gmail.com', 'admin!@#'),
(2, 'EQ111', 'ravi@gmail.com', 'ravi');

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int(11) NOT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `uploaded_on` datetime NOT NULL,
  `status` enum('1','0') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `l_id` int(11) NOT NULL,
  `userID` varchar(255) DEFAULT NULL,
  `lang` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`l_id`, `userID`, `lang`) VALUES
(1, '282', '1'),
(2, '282', '3'),
(3, '283', '4'),
(4, '283', '4'),
(5, '281', '3');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `qualification` varchar(100) DEFAULT NULL,
  `pic` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `countryID` varchar(255) DEFAULT NULL,
  `stateID` varchar(255) DEFAULT NULL,
  `cityID` varchar(255) DEFAULT NULL,
  `size` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `name`, `email`, `password`, `mobile`, `gender`, `qualification`, `pic`, `date`, `countryID`, `stateID`, `cityID`, `size`, `status`) VALUES
(148, 'Neha', 'neha@gmail.com', '123', '', 'Female', 'MCA,BCA', 'dextop.jpg', '0000-00-00', NULL, NULL, NULL, '', 1),
(149, 'Bunty', 'bunty@gmail.com', '145', '9304879388', 'Female', 'MCA,BCA', 'man2.jpg', '0000-00-00', NULL, NULL, NULL, '', 0),
(209, 'dolly', 'dolly@gmail.com', '$2y$10$3IOedHuU3FYi0cko.F243u9FZeXRu4Kz.MrUe3n8ENvPbEaSoaNQm', '7065999400', '', 'BCA,B.Tech', '', '0000-00-00', NULL, NULL, NULL, '', 0),
(210, 'rahul', 'rahul@gmail.com', '$2y$10$ywxcm/Zj7rY1ckOAQORs4.8YWAvvsuB23a7rcAUVAllh8a7YNkrh2', '8745782547', '', 'BCA,B.Tech', '', '0000-00-00', NULL, NULL, NULL, '', 0),
(211, 'sishu', 'sishu@gmail.com', '$2y$10$GhG7/pKJ4wIrMM4d1NyhUOnuZDnI2kIgLtn.WBKac6QnI9VB.Ma.C', '8888888888', '', 'BCA,B.Tech', '', '0000-00-00', NULL, NULL, NULL, '', 0),
(223, 'aditi', 'aditi@gmail.com', '', '', '', '', '', '0000-00-00', NULL, NULL, NULL, '', 0),
(260, 'tej', 'tej@gmail.com', '123456', '8745782547', 'Female', 'BCA,B.Tech', '1629552440.jpg', NULL, NULL, NULL, NULL, NULL, 0),
(280, 'demo name', 'demo@gmail.com', '123456', '994934739', 'Female', 'BCA,B.Tech', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(281, 'demo2 up', 'demo2@gmail.com', '12367', '895794859487', 'Female', 'BCA', '1637858923.car.jpg', NULL, '1', '2', '3', NULL, 0),
(282, 'rishi', 'rishi@gmail.com', '123456', '3232434355', 'Male', 'B.Tech', NULL, NULL, '1', '2', '3', NULL, 0),
(283, 'puja k', 'puja@gmail.com', '123456', '43554466', 'Female', 'BCA', '1637765344.jpg', NULL, '1', '3', '5', NULL, 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `neha`
-- (See below for the actual view)
--
CREATE TABLE `neha` (
);

-- --------------------------------------------------------

--
-- Table structure for table `razorpay`
--

CREATE TABLE `razorpay` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `payment_id` varchar(255) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `razorpay`
--

INSERT INTO `razorpay` (`id`, `name`, `amount`, `payment_status`, `payment_id`, `added_on`) VALUES
(1, 'suman', 100, 'Complete', 'pay_HYHbtSXr6ubNxc', '2021-07-13 06:27:56');

-- --------------------------------------------------------

--
-- Table structure for table `reference`
--

CREATE TABLE `reference` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `friend_name` varchar(255) DEFAULT NULL,
  `friend_mobile` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reference`
--

INSERT INTO `reference` (`id`, `student_id`, `friend_name`, `friend_mobile`) VALUES
(1, 273, 'rajendra', '89574985'),
(2, 273, 'ravi', '854854849');

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `id` int(11) NOT NULL,
  `state_name` varchar(100) NOT NULL,
  `country_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`id`, `state_name`, `country_id`) VALUES
(1, 'Bihar', 1),
(2, 'UP', 1),
(3, 'MP', 1),
(4, 'Jharkhand', 1),
(5, 'Karachi', 5),
(6, 'Lahor', 5);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `std_name` varchar(100) NOT NULL,
  `std_suname` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `std_name`, `std_suname`) VALUES
(1, 'Neha', 'Kumari'),
(2, 'Micki', 'Kumari'),
(3, 'Ram', 'Kumar'),
(4, 'Rahul 1', 'Kumar'),
(5, 'Sishu 2', 'Rai');

-- --------------------------------------------------------

--
-- Structure for view `neha`
--
DROP TABLE IF EXISTS `neha`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `neha`  AS  select `login`.`id` AS `id`,`login`.`name` AS `name`,`login`.`email` AS `email`,`login`.`password` AS `password`,`login`.`mobile` AS `mobile`,`login`.`gender` AS `gender`,`login`.`qualification` AS `qualification`,`login`.`pic` AS `pic`,`login`.`path` AS `path`,`login`.`date` AS `date`,`login`.`size` AS `size`,`login`.`status` AS `status` from `login` where `login`.`id` = 2 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alldepart`
--
ALTER TABLE `alldepart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emp_detail`
--
ALTER TABLE `emp_detail`
  ADD PRIMARY KEY (`eid`);

--
-- Indexes for table `emp_mobile`
--
ALTER TABLE `emp_mobile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emp_profile`
--
ALTER TABLE `emp_profile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`l_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `razorpay`
--
ALTER TABLE `razorpay`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reference`
--
ALTER TABLE `reference`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alldepart`
--
ALTER TABLE `alldepart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `emp_detail`
--
ALTER TABLE `emp_detail`
  MODIFY `eid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `emp_mobile`
--
ALTER TABLE `emp_mobile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emp_profile`
--
ALTER TABLE `emp_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `l_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=284;

--
-- AUTO_INCREMENT for table `razorpay`
--
ALTER TABLE `razorpay`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reference`
--
ALTER TABLE `reference`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
