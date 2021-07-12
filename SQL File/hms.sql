-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 17, 2020 at 05:07 PM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `updationDate` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `updationDate`) VALUES
(1, 'admin', 'Test@12345', '28-12-2016 11:42:05 AM');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
CREATE TABLE IF NOT EXISTS `appointment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doctorSpecialization` varchar(255) DEFAULT NULL,
  `doctorId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `consultancyFees` int(11) DEFAULT NULL,
  `appointmentDate` varchar(255) DEFAULT NULL,
  `appointmentTime` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `userStatus` int(11) DEFAULT NULL,
  `doctorStatus` int(11) DEFAULT NULL,
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`id`, `doctorSpecialization`, `doctorId`, `userId`, `consultancyFees`, `appointmentDate`, `appointmentTime`, `postingDate`, `userStatus`, `doctorStatus`, `updationDate`) VALUES
(1, 'Ayurvedik', 1, 1, 500, '2020-01-31', '2:45 PM', '2020-01-11 09:04:14', 1, 0, '2020-01-11 15:15:06'),
(2, 'Ayurvedik', 1, 1, 500, '2020-01-31', '8:45 PM', '2020-01-11 15:10:19', 1, 1, NULL),
(3, 'Ayurvedik', 1, 1, 500, '2020-01-28', '10:00 PM', '2020-01-11 16:23:24', 1, 1, NULL),
(4, 'Ayurvedik', 1, 1, 500, '2020-01-13', '8:45 AM', '2020-01-12 03:01:40', 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
CREATE TABLE IF NOT EXISTS `doctors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `specilization` varchar(255) DEFAULT NULL,
  `doctorName` varchar(255) DEFAULT NULL,
  `address` longtext,
  `docFees` varchar(255) DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `docEmail` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `specilization`, `doctorName`, `address`, `docFees`, `contactno`, `docEmail`, `password`, `creationDate`, `updationDate`) VALUES
(1, 'Ayurvedik', 'Kunal More', 'Baner', '500', 7719906992, 'k@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '2020-01-11 09:03:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `doctorslog`
--

DROP TABLE IF EXISTS `doctorslog`;
CREATE TABLE IF NOT EXISTS `doctorslog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctorslog`
--

INSERT INTO `doctorslog` (`id`, `uid`, `username`, `userip`, `loginTime`, `logout`, `status`) VALUES
(1, 1, 'k@gmail.com', 0x3a3a3100000000000000000000000000, '2020-01-11 09:04:34', '11-01-2020 02:36:54 PM', 1),
(2, 1, 'sh@gmail.com', 0x3a3a3100000000000000000000000000, '2020-01-11 09:07:07', '11-01-2020 02:38:05 PM', 1),
(3, 1, 'k@gmail.com', 0x3a3a3100000000000000000000000000, '2020-01-11 09:08:15', '11-01-2020 02:39:07 PM', 1),
(4, 1, 'sh@gmail.com', 0x3a3a3100000000000000000000000000, '2020-01-11 09:09:15', '11-01-2020 02:40:34 PM', 1),
(5, 1, 'k@gmail.com', 0x3a3a3100000000000000000000000000, '2020-01-11 09:10:53', '11-01-2020 02:44:01 PM', 1),
(6, 1, 'sh@gmail.com', 0x3a3a3100000000000000000000000000, '2020-01-11 09:15:25', '11-01-2020 02:46:28 PM', 1),
(7, 1, 'k@gmail.com', 0x3a3a3100000000000000000000000000, '2020-01-11 09:16:38', '11-01-2020 02:47:52 PM', 1),
(8, 1, 'k@gmail.com', 0x3a3a3100000000000000000000000000, '2020-01-11 09:30:27', '11-01-2020 03:16:57 PM', 1),
(9, 1, 'sh@gmail.com', 0x3a3a3100000000000000000000000000, '2020-01-11 09:50:59', '11-01-2020 04:04:27 PM', 1),
(10, 1, 'sh@gmail.com', 0x3a3a3100000000000000000000000000, '2020-01-11 10:34:44', NULL, 1),
(11, 1, 'sh@gmail.com', 0x3a3a3100000000000000000000000000, '2020-01-11 10:38:09', '11-01-2020 05:57:37 PM', 1),
(12, 1, 'sh@gmail.com', 0x3a3a3100000000000000000000000000, '2020-01-11 12:30:46', NULL, 1),
(13, 1, 'sh@gmail.com', 0x3a3a3100000000000000000000000000, '2020-01-11 12:36:04', '11-01-2020 06:35:12 PM', 1),
(14, 1, 'sh@gmail.com', 0x3a3a3100000000000000000000000000, '2020-01-11 13:05:20', NULL, 1),
(15, 1, 'sh@gmail.com', 0x3a3a3100000000000000000000000000, '2020-01-11 13:25:51', '11-01-2020 08:19:00 PM', 1),
(16, 1, 'sh@gmail.com', 0x3a3a3100000000000000000000000000, '2020-01-11 14:52:43', '11-01-2020 08:39:26 PM', 1),
(17, 1, 'sh@gmail.com', 0x3a3a3100000000000000000000000000, '2020-01-11 15:10:53', '11-01-2020 08:44:28 PM', 1),
(18, 1, 'k@gmail.com', 0x3a3a3100000000000000000000000000, '2020-01-11 15:14:58', '11-01-2020 08:48:16 PM', 1),
(19, 1, 'sh@gmail.com', 0x3a3a3100000000000000000000000000, '2020-01-11 15:22:53', '11-01-2020 08:53:03 PM', 1),
(20, 1, 'sh@gmail.com', 0x3a3a3100000000000000000000000000, '2020-01-11 15:24:09', '11-01-2020 08:56:25 PM', 1),
(21, 1, 'k@gmail.com', 0x3a3a3100000000000000000000000000, '2020-01-11 15:27:41', NULL, 1),
(22, 1, 'sh@gmail.com', 0x3a3a3100000000000000000000000000, '2020-01-11 15:27:47', NULL, 1),
(23, 1, 'k@gmail.com', 0x3a3a3100000000000000000000000000, '2020-01-11 16:04:29', NULL, 1),
(24, 1, 'sh@gmail.com', 0x3a3a3100000000000000000000000000, '2020-01-11 16:24:12', '11-01-2020 09:56:49 PM', 1),
(25, 1, 'k@gmail.com', 0x3a3a3100000000000000000000000000, '2020-01-11 16:27:01', NULL, 1),
(26, 1, 'k@gmail.com', 0x3a3a3100000000000000000000000000, '2020-01-11 19:53:50', NULL, 1),
(27, 1, 'sh@gmail.com', 0x3a3a3100000000000000000000000000, '2020-01-11 20:16:52', '12-01-2020 01:48:11 AM', 1),
(28, 1, 'k@gmail.com', 0x3a3a3100000000000000000000000000, '2020-01-11 20:18:23', NULL, 1),
(29, 1, 'k@gmail.com', 0x3a3a3100000000000000000000000000, '2020-01-12 00:41:47', NULL, 1),
(30, NULL, 'tushar@gmail.com', 0x3a3a3100000000000000000000000000, '2020-01-12 02:30:56', NULL, 0),
(31, NULL, 'tushar@gmail.com', 0x3a3a3100000000000000000000000000, '2020-01-12 02:31:03', NULL, 0),
(32, 1, 'k@gmail.com', 0x3a3a3100000000000000000000000000, '2020-01-12 02:31:46', '12-01-2020 08:04:19 AM', 1),
(33, 1, 'k@gmail.com', 0x3a3a3100000000000000000000000000, '2020-01-12 02:38:13', '12-01-2020 08:09:00 AM', 1),
(34, NULL, 'tushar@gmail.com', 0x3a3a3100000000000000000000000000, '2020-01-12 02:42:42', NULL, 0),
(35, 1, 'k@gmail.com', 0x3a3a3100000000000000000000000000, '2020-01-12 02:42:59', NULL, 1),
(36, 1, 'k@gmail.com', 0x3a3a3100000000000000000000000000, '2020-01-12 02:57:51', NULL, 1),
(37, 1, 'sh@gmail.com', 0x3a3a3100000000000000000000000000, '2020-01-12 02:58:56', NULL, 1),
(38, NULL, 'admin', 0x3a3a3100000000000000000000000000, '2020-01-12 02:59:18', NULL, 0),
(39, NULL, 'admin', 0x3a3a3100000000000000000000000000, '2020-01-12 02:59:30', NULL, 0),
(40, NULL, 'admin', 0x3a3a3100000000000000000000000000, '2020-01-12 03:00:09', NULL, 0),
(41, 1, 'k@gmail.com', 0x3a3a3100000000000000000000000000, '2020-01-12 03:16:25', NULL, 1),
(42, 1, 'k@gmail.com', 0x3a3a3100000000000000000000000000, '2020-01-12 03:29:57', NULL, 1),
(43, 1, 'k@gmail.com', 0x3a3a3100000000000000000000000000, '2020-01-12 03:36:09', '12-01-2020 09:13:42 AM', 1),
(44, 1, 'k@gmail.com', 0x3a3a3100000000000000000000000000, '2020-01-12 03:44:29', '12-01-2020 09:27:57 AM', 1);

-- --------------------------------------------------------

--
-- Table structure for table `doctorspecilization`
--

DROP TABLE IF EXISTS `doctorspecilization`;
CREATE TABLE IF NOT EXISTS `doctorspecilization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `specilization` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctorspecilization`
--

INSERT INTO `doctorspecilization` (`id`, `specilization`, `creationDate`, `updationDate`) VALUES
(1, 'Ayurvedik', '2020-01-11 09:02:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_patient_relation`
--

DROP TABLE IF EXISTS `doctor_patient_relation`;
CREATE TABLE IF NOT EXISTS `doctor_patient_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `status` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor_patient_relation`
--

INSERT INTO `doctor_patient_relation` (`id`, `patient_id`, `doctor_id`, `status`) VALUES
(21, 1, 1, 'Pending'),
(18, 4, 1, 'Pending'),
(17, 2, 1, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `receptionist`
--

DROP TABLE IF EXISTS `receptionist`;
CREATE TABLE IF NOT EXISTS `receptionist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `address` longtext,
  `contactno` bigint(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(1000) DEFAULT NULL,
  `creationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `receptionist`
--

INSERT INTO `receptionist` (`id`, `name`, `address`, `contactno`, `email`, `password`, `creationDate`, `updationDate`) VALUES
(1, 'Shraddha Mandekar', 'Baner', 7719906992, 'sh@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '2020-01-11 09:01:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblcontactus`
--

DROP TABLE IF EXISTS `tblcontactus`;
CREATE TABLE IF NOT EXISTS `tblcontactus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint(12) DEFAULT NULL,
  `message` mediumtext,
  `PostingDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `AdminRemark` mediumtext,
  `LastupdationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `IsRead` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblmedicalhistory`
--

DROP TABLE IF EXISTS `tblmedicalhistory`;
CREATE TABLE IF NOT EXISTS `tblmedicalhistory` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `PatientID` int(10) DEFAULT NULL,
  `BloodPressure` varchar(200) DEFAULT NULL,
  `BloodSugar` varchar(200) NOT NULL,
  `Weight` varchar(100) DEFAULT NULL,
  `Temperature` varchar(200) DEFAULT NULL,
  `MedicalPres` mediumtext,
  `CreationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblmedicalhistory`
--

INSERT INTO `tblmedicalhistory` (`ID`, `PatientID`, `BloodPressure`, `BloodSugar`, `Weight`, `Temperature`, `MedicalPres`, `CreationDate`) VALUES
(11, 1, 'TDVrMGxvejBpVE1ocUR2ZnUvQWgydz09', 'UzNiYTNoYXRwZlpsTnVIdmtBUmJTUT09', 'MmF5b0pRUkd1RklLKzI3R1BXRnRldz09', 'eHZpSm5HUzNrb2pkemFjeDEyT3NuZz09', 'UFdqOThOT1JjVzIxRC9LN3E5dllZbzBHaFFDUkZXdUx3dTVNUU9OT3RPdE9sMC9PRzVHSGc3NXZQM1o5OUdVT2NBOERoclErV1czcUVpU2k1L29qNUFnMFhKSllBcU03U3lHMHZ5djhSU3hCb0pyaFU5RjkzZTd4YkZsOHhJZEJNeU9lVlRib250cy85Y3BlRzZ0dlhzeTdDS3BaR25xalJHU2YyQ0Q4ZnpjPQ==', '2020-01-12 03:08:15'),
(12, 1, 'UnVVSExEZUtuVmlzL0VwWXF5TUZ4QT09', 'UzNiYTNoYXRwZlpsTnVIdmtBUmJTUT09', 'S1BBNEgvbGxFVldaSGZWYU84cXF0Zz09', 'eHZpSm5HUzNrb2pkemFjeDEyT3NuZz09', 'ejVscFZqTjZxQllzNmZ4RHA1L3ZmankyVnlycWl2UHJtNTAvNkpabGRCOEJRSzFoVXMrWEdBb1V6MEhMOVhSaExrMzVhdFhvQ01wcUdIOUtkUWxjZU5lT1BBK3A2SUdwRlR6aFpJcWdGUmM9', '2020-01-12 03:12:09'),
(13, 1, 'c3N3SzNuTXhITDNvRjlQb2RKU0s0UT09', 'c3N3SzNuTXhITDNvRjlQb2RKU0s0UT09', 'c3N3SzNuTXhITDNvRjlQb2RKU0s0UT09', 'c3N3SzNuTXhITDNvRjlQb2RKU0s0UT09', 'c3N3SzNuTXhITDNvRjlQb2RKU0s0UT09', '2020-01-12 03:18:35'),
(14, 1, '12', '12', '12', '12', '12', '2020-01-12 03:34:18'),
(15, 2, 'c3N3SzNuTXhITDNvRjlQb2RKU0s0UT09', 'c3N3SzNuTXhITDNvRjlQb2RKU0s0UT09', 'c3N3SzNuTXhITDNvRjlQb2RKU0s0UT09', 'c3N3SzNuTXhITDNvRjlQb2RKU0s0UT09', 'c3N3SzNuTXhITDNvRjlQb2RKU0s0UT09', '2020-01-12 03:37:47'),
(16, 1, 'UnVVSExEZUtuVmlzL0VwWXF5TUZ4QT09', 'YjBkN1o2Y3dCa0FibzdFeHRtSkVEUT09', 'UFVsK3JwRFlPYjhGSXAwU201cTFFUT09', 'eHZpSm5HUzNrb2pkemFjeDEyT3NuZz09', 'TXpmZ0ltMytUT0I2TWNHWnFyYXFjcVBUc214aGE4K1BnREpWUDJMRXZ1YnUwTm1Ubm5VYnI5RE9mNDVyTXA1OHY3MWhzWWIyV2N4WVYveTVvQnJOS3c9PQ==', '2020-01-12 03:46:02');

-- --------------------------------------------------------

--
-- Table structure for table `tblpatient`
--

DROP TABLE IF EXISTS `tblpatient`;
CREATE TABLE IF NOT EXISTS `tblpatient` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Docid` int(10) DEFAULT NULL,
  `PatientName` varchar(200) DEFAULT NULL,
  `PatientContno` bigint(10) DEFAULT NULL,
  `PatientEmail` varchar(200) DEFAULT NULL,
  `PatientGender` varchar(50) DEFAULT NULL,
  `PatientAdd` mediumtext,
  `PatientAge` int(10) DEFAULT NULL,
  `PatientMedhis` mediumtext,
  `CreationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblpatient`
--

INSERT INTO `tblpatient` (`ID`, `Docid`, `PatientName`, `PatientContno`, `PatientEmail`, `PatientGender`, `PatientAdd`, `PatientAge`, `PatientMedhis`, `CreationDate`, `UpdationDate`) VALUES
(1, 1, 'saurabh', 8484052559, 's@gmail.com', 'male', 'sdsds', 85, 'na', '2020-01-12 02:44:07', NULL),
(2, 1, 'Sanju baba', 7887592411, 'Shradhamandekar@gmail.com', 'male', 'BANER', 60, 'na', '2020-01-12 03:36:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

DROP TABLE IF EXISTS `userlog`;
CREATE TABLE IF NOT EXISTS `userlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `uid`, `username`, `userip`, `loginTime`, `logout`, `status`) VALUES
(1, 1, 'tushar@gmail.com', 0x3a3a3100000000000000000000000000, '2020-01-11 08:58:04', '11-01-2020 02:28:23 PM', 1),
(2, 1, 'tushar@gmail.com', 0x3a3a3100000000000000000000000000, '2020-01-11 09:03:34', '11-01-2020 02:34:22 PM', 1),
(3, 1, 'tushar@gmail.com', 0x3a3a3100000000000000000000000000, '2020-01-11 09:14:15', '11-01-2020 02:45:13 PM', 1),
(4, 1, 'tushar@gmail.com', 0x3a3a3100000000000000000000000000, '2020-01-11 15:09:59', '11-01-2020 08:40:42 PM', 1),
(5, 1, 'tushar@gmail.com', 0x3a3a3100000000000000000000000000, '2020-01-11 15:27:28', NULL, 1),
(6, 1, 'tushar@gmail.com', 0x3a3a3100000000000000000000000000, '2020-01-11 16:22:28', '11-01-2020 09:53:59 PM', 1),
(7, 1, 'tushar@gmail.com', 0x3a3a3100000000000000000000000000, '2020-01-12 01:28:48', '12-01-2020 08:00:50 AM', 1),
(8, 1, 'tushar@gmail.com', 0x3a3a3100000000000000000000000000, '2020-01-12 02:34:34', '12-01-2020 08:08:02 AM', 1),
(9, 1, 'tushar@gmail.com', 0x3a3a3100000000000000000000000000, '2020-01-12 02:39:15', '12-01-2020 08:23:19 AM', 1),
(10, NULL, 'tushar@gamil.com', 0x3a3a3100000000000000000000000000, '2020-01-12 02:40:02', NULL, 0),
(11, 2, 's@gmail.com', 0x3a3a3100000000000000000000000000, '2020-01-12 02:42:09', NULL, 1),
(12, NULL, 's@gmai.com', 0x3a3a3100000000000000000000000000, '2020-01-12 02:56:12', NULL, 0),
(13, 2, 's@gmail.com', 0x3a3a3100000000000000000000000000, '2020-01-12 02:56:22', NULL, 1),
(14, 1, 'tushar@gmail.com', 0x3a3a3100000000000000000000000000, '2020-01-17 16:35:10', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullName` varchar(255) DEFAULT NULL,
  `address` longtext,
  `city` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `regDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullName`, `address`, `city`, `gender`, `email`, `password`, `regDate`, `updationDate`) VALUES
(1, 'Tushar Mahalle', 'Baner', 'Pune', 'male', 'tushar@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '2020-01-11 08:57:53', NULL),
(2, 'saurabh', 'pune', 'pune', 'male', 's@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '2020-01-12 02:41:38', NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
