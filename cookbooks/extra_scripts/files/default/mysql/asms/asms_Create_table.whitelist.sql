use asms;
delimiter $$

-- whitelist table create statement

CREATE TABLE `whitelist` (
`whitelistId` int(11) NOT NULL AUTO_INCREMENT,
`application` varchar(20) DEFAULT NULL,
`lastModified` timestamp NOT NULL DEFAULT NOW() ON UPDATE NOW(),
PRIMARY KEY (`whitelistId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$
