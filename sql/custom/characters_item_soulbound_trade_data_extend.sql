ALTER TABLE `characters`.`item_soulbound_trade_data` 
	ADD COLUMN `item_template` MEDIUMINT(8) UNSIGNED DEFAULT '0' NOT NULL AFTER `allowedPlayers`,
	ADD COLUMN `datetime` TIMESTAMP NOT NULL AFTER `item_template`;

