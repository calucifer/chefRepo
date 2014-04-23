 /**
 
 Zone ID's
  NONE   = -1
  GLOBAL = 0
  US     = 1
  JP     = 2
**/
use segment_stats;
 
CREATE TABLE `audience_stats` (
`reportDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`keyName` varchar(64) NOT NULL,
`keyValue` varchar(64) NOT NULL,
`adcomDailyImpressions` bigint(20) DEFAULT '0',
`adcomDailyUniques` bigint(20) DEFAULT '0',
`adcom30dayImpressions` bigint(20) DEFAULT '0',
`adcom30dayUniques` bigint(20) DEFAULT '0',
`adtechDailyImpressions` bigint(20) DEFAULT '0',
`adtechDailyUniques` bigint(20) DEFAULT '0',
`adtech30dayImpressions` bigint(20) DEFAULT '0',
`adtech30dayUniques` bigint(20) DEFAULT '0',
 `zone` int(45) DEFAULT -1,
 INDEX zoneTime (zone,keyName,reportDate),
 INDEX zoneKeyName (zone,keyName),
 PRIMARY KEY (`reportDate`,`keyName`,`keyValue`, `zone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

