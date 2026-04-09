-- iMail Database Initialization Script

-- 1. Signup Table (Users)
CREATE TABLE IF NOT EXISTS `signup` (
  `name` varchar(45) NOT NULL,
  `mail` varchar(45) NOT NULL,
  `pass` varchar(45) NOT NULL,
  `cell` varchar(45) NOT NULL,
  `gen` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`mail`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 2. Mails Table (Messages)
CREATE TABLE IF NOT EXISTS `mails` (
  `id` int(11) NOT NULL DEFAULT 0,
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
  `rcode` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 3. Monitor Table
CREATE TABLE IF NOT EXISTS `monitor` (
  `user` varchar(45) NOT NULL,
  `mail` varchar(45) NOT NULL,
  `typ` varchar(45) NOT NULL,
  `mdate` varchar(45) NOT NULL,
  `mtime` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 4. Spams Table
CREATE TABLE IF NOT EXISTS `spams` (
  `user` varchar(45) NOT NULL,
  `mail` varchar(45) NOT NULL,
  `typ` varchar(45) NOT NULL,
  `mdate` varchar(45) NOT NULL,
  `mtime` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Add some default data if needed
INSERT IGNORE INTO `signup` VALUES ('Admin','admin@imail.com','admin123','1234567890','Male','India','Active');
