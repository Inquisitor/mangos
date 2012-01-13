-- ----------------------------------
-- Bonechewer Riding Wolf :ID 18706 -
-- ----------------------------------
UPDATE `creature_template` SET `speed_walk` = 1, `speed_run` = 1.14286 WHERE `entry` = 18706;

-- --------------------------------------
--  Tundra Wolf :ID 25675  -
-- --------------------------------------
UPDATE `creature_template` SET `modelid_2` = 22044, `speed_run` = 1.4285 WHERE `entry` = 25675;

-- --------------------------------------
--  Oil-stained Wolf :ID 25791  -
-- --------------------------------------
UPDATE `creature_template` SET `speed_walk` = 1, `AIName` = '' WHERE `entry` = 25791;

-- --------------------------------------
--  Bloodthirsty Tundra Wolf :ID 26672  -
-- --------------------------------------
UPDATE `creature_template` SET `speed_walk` = 1.2, `speed_run` = 1.4285 WHERE `entry` = 26672;

-- --------------------------------------
--  Sinewy Wolf :ID 31233  -
-- --------------------------------------
UPDATE `creature_template` SET `speed_run` = 1.4285 WHERE `entry` = 31233;
