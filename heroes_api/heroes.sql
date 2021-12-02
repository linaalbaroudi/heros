-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2021 at 10:30 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `heroes_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `heroes`
--

CREATE TABLE `heroes` (
  `name` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `powers` varchar(800) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `rate` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `heroes`
--

INSERT INTO `heroes` (`name`, `description`, `powers`, `rate`) VALUES
('Mr. Robot', 'I am Mr. Robot. Hi there.', 'coding with vim, Know angular.', 4),
('Richard', 'I am Mr. Richard. Hi there.', 'freedom protector', 4),
('Tim Berners-Lee', 'I am Mr. Tim Berners-Lee. Earth is safe because of me.', 'Moving things, Through HTTP, & The director of the world wide web consortium (W3C).', 2),
('Lina Albaroudi', 'Lina Albaroudi is a fresh graduate software engineer with a minor in cyber security. Lina is a front end flutter developer and a QA Analyst in Zone. Lina has worked as a flutter developer for Juziat o', 'Flutter developer, Quality Assurance, Software Testing, Cyber Security.', 5);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
