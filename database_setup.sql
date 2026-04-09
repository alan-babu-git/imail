-- iMail Spam Detection Project - Database Schema
-- Compatible with MySQL/MariaDB (HeidiSQL)

CREATE DATABASE IF NOT EXISTS spam;
USE spam;

-- Table for User Accounts
DROP TABLE IF EXISTS `signup`;
CREATE TABLE `signup` (
  `name` varchar(500) DEFAULT NULL,
  `dob` varchar(500) DEFAULT NULL,
  `gender` varchar(500) DEFAULT NULL,
  `mobile` varchar(500) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `sec_que` varchar(500) DEFAULT NULL,
  `mail` varchar(500) NOT NULL,
  `pwd` varchar(500) DEFAULT NULL,
  `status` varchar(45) DEFAULT 'active',
  PRIMARY KEY (`mail`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Table for Emails
DROP TABLE IF EXISTS `mails`;
CREATE TABLE `mails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mfrom` varchar(300) NOT NULL,
  `mto` varchar(300) NOT NULL,
  `sub` text NOT NULL,
  `mess` text NOT NULL,
  `mdate` varchar(45) NOT NULL,
  `mtime` varchar(45) NOT NULL,
  `typ` varchar(45) NOT NULL,
  `file` longtext NOT NULL,
  `fname` longtext NOT NULL,
  `ftype` longtext NOT NULL,
  `rcode` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Table for Monitoring Users/Spammers
DROP TABLE IF EXISTS `monitor`;
CREATE TABLE `monitor` (
  `mfrom` varchar(300) NOT NULL,
  `stat` varchar(45) DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Table for Word Analysis (Optional, based on project logic)
DROP TABLE IF EXISTS `spams`;
CREATE TABLE `spams` (
  `word` varchar(500) DEFAULT NULL,
  `cnt` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
