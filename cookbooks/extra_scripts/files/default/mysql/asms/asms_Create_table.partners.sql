use asms;

delimiter $$

-- Partners table create statement

CREATE TABLE `partners` (
`partnerId` int(11) NOT NULL AUTO_INCREMENT,
`name` varchar(100) NOT NULL,
`partnerShortCode` varchar(5) DEFAULT NULL,
`description` varchar(512) DEFAULT NULL,
`href` varchar(512) DEFAULT NULL,
`secureHref` varchar(512) DEFAULT NULL,
`isAtxIdsyncRequired` tinyint(1) DEFAULT '0',
`isRtxIdsyncRequired` tinyint(1) DEFAULT '0',
`isNetworkIdsyncRequired` tinyint(1) DEFAULT '0',
`priority` int(11) DEFAULT NULL,
`lastModified` timestamp NULL DEFAULT NULL,
`retireDate` timestamp NULL DEFAULT NULL,
`createDate` timestamp NULL DEFAULT NOW(),
PRIMARY KEY (`name`),
UNIQUE KEY `partnerName_UNIQUE` (`name`),
UNIQUE KEY `partnerId_UNIQUE` (`partnerId`),
UNIQUE KEY `partnerShortCode_UNIQUE` (`partnerShortCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$
