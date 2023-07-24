CREATE TABLE `mk_keyfobs` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`owner` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`plate` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`fakeplate` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`model` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`fobid` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`old_fobs` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `owner` (`owner`) USING BTREE,
	INDEX `plate` (`plate`) USING BTREE,
	INDEX `fobnumber` (`fobid`) USING BTREE,
	INDEX `Column 6` (`old_fobs`(1024)) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=54
;
