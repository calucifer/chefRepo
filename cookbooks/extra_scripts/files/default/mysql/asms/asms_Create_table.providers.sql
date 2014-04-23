use asms;

delimiter $$

-- Providers table create statement

CREATE TABLE `providers` (
`providerId` int(11) NOT NULL AUTO_INCREMENT,
`name` varchar(32) NOT NULL,
`description` varchar(512) DEFAULT NULL,
`isStreamingRequired` tinyint(1) DEFAULT '0',
`isPixelBasedStreamingRequired` tinyint(1) DEFAULT '0',
`isFtpRequired` tinyint(1) DEFAULT '0',
`isPredictive` tinyint(1) DEFAULT '0',
`jsonStreamingClass` varchar(200) DEFAULT NULL,
`ftpUsername` varchar(45) DEFAULT NULL,
`ftpPassword` varchar(45) DEFAULT NULL,
`ignoreProviderInbDPR` tinyint(1) DEFAULT '0',
`priority` int(11) DEFAULT NULL,
`aceElementType` varchar(45) DEFAULT NULL,
`lastModified` timestamp NULL DEFAULT NULL,
`retireDate` timestamp NULL DEFAULT NULL,
`createDate` timestamp NULL DEFAULT NOW(),
PRIMARY KEY (`name`),
UNIQUE KEY `providerId_UNIQUE` (`providerId`),
UNIQUE KEY `providerName_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$
