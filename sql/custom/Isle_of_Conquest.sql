DELETE FROM mangos_string WHERE entry > 20079 AND entry < 20106;
INSERT INTO mangos_string (entry, content_default, content_loc1, content_loc2, content_loc3, content_loc4, content_loc5, content_loc6, content_loc7, content_loc8) VALUES
(20080, 'The battle will begin in two minutes.', NULL, NULL, NULL, NULL, NULL, 'La batalla comenzarб en dos minutos.', 'La batalla comenzarб en dos minutos.', 'Сражение за Остров Завоеваний начнется через 2 минуты'),
(20081, 'The battle will begin in 1 minute.', NULL, NULL, NULL, NULL, NULL, 'La batalla comenzarб en un minuto.', 'La batalla comenzarб en un minuto.', 'Сражение за Остров Завоеваний начнется через 1 минуту'),
(20082, 'The battle will begin in 30 seconds!', NULL, NULL, NULL, NULL, NULL, 'La batalla comenzarб en 30 segundos. ЎPreparaos!', 'La batalla comenzarб en 30 segundos. ЎPreparaos!', 'Сражение за Остров Завоеваний начнется через 30 секунд! Приготовтесь!'),
(20083, 'The battle has begun!', NULL, NULL, NULL, NULL, NULL,'ЎLa batalla ha comenzado!', 'ЎLa batalla ha comenzado!', 'Сражение за Остров Завоеваний началось!!!'),
(20084, 'the alliance keep', NULL, NULL, NULL, NULL, NULL, 'la fortaleza de la Alianza', 'la fortaleza de la Alianza', 'крепости Альянса'),
(20085, 'the horde keep', NULL, NULL, NULL, NULL, NULL, 'la fortaleza de la Horda', 'la fortaleza de la Horda', 'крепости Орды'),
(20086, '%s wins!', NULL, NULL, NULL, NULL, NULL, 'Ў%s gana!', 'Ў%s gana!', '%s выйграл(а)'),
(20087, 'The west gate of %s is destroyed!', NULL, NULL, NULL, NULL, NULL, 'ЎLa puerta Oeste de %s ha sido destruida!', 'ЎLa puerta Oeste de %s ha sido destruida!', 'Западные ворота %s были разрушены!'),
(20088, 'The east gate of %s is destroyed!', NULL, NULL, NULL, NULL, NULL, 'ЎLa puerta Este de %s ha sido destruida!', 'ЎLa puerta Este de %s ha sido destruida!', 'Восточные ворота %s были разрушены!'),
(20089, 'The south gate of %s is destroyed!', NULL, NULL, NULL, NULL, NULL, 'ЎLa puerta Sur de %s ha sido destruida!', 'ЎLa puerta Sur de %s ha sido destruida!', 'Главные ворота Альянса были разрушены!'),
(20090, 'The north gate of %s is destroyed!', NULL, NULL, NULL, NULL, NULL, 'ЎLa puerta Norte de %s ha sido destruida!', 'ЎLa puerta Norte de %s ha sido destruida!', 'Главные ворота Орды были разрушены!'),
(20091, '$n has assaulted the %s', NULL, NULL, NULL, NULL, NULL, 'Ў$n ha asaltado %s!', 'Ў$n ha asaltado %s!', '$n осадил(а) %s'),
(20092, '$n has defended the %s', NULL, NULL, NULL, NULL, NULL, 'Ў$n ha defendido %s!', 'Ў$n ha defendido %s!', '$n защитил(а) %s'),
(20093, '$n claims the %s! If left unchallenged, the %s will control it in 1 minute!', NULL, NULL, NULL, NULL, NULL, 'Ў$n asalta %s! ЎSi no es defendido, %s lo controlarб en un minuto!', '$n атакует %s! ЎSi no es defendido, %s lo controlarб en un minuto!', '$n атакует %s! если не вернуть контроль , %s захватит его через 1 минуту!!'),
(20094, 'The %s has taken the %s', NULL, NULL, NULL, NULL, NULL, '%s ha tomado %s.', '', '%s захватывает %s'),
(20095, 'Workshop', NULL, NULL, NULL, NULL, NULL, 'el Taller', 'el Taller', 'Мастерскую'),
(20096, 'Docks', NULL, NULL, NULL, NULL, NULL, 'los Muelles', 'los Muelles', 'Доки'),
(20097, 'Refinery', NULL, NULL, NULL, NULL, NULL, 'la Refinerнa', 'la Refinerнa', 'Нефтезавод'),
(20098, 'Quarry', NULL, NULL, NULL, NULL, NULL, 'la Cantera', 'la Cantera', 'Каменоломню'),
(20099, 'Hangar', NULL, NULL, NULL, NULL, NULL, 'el Hangar', 'el Hangar', 'Ангар'),
(20100, 'Alliance', NULL, NULL, NULL, NULL, NULL, 'La Alianza', 'La Alianza', 'Альянс'),
(20101, 'Horde', NULL, NULL, NULL, NULL, NULL, 'La Horda', 'La Horda', 'Орда'),
(20102, 'Horde gate was destroyed!', NULL, NULL, NULL, NULL, NULL, 'La Horda', 'La Horda', 'Врата Орды были уничтожены!'),
(20103, 'Alliance gate was destroyed!', NULL, NULL, NULL, NULL, NULL, 'La Horda', 'La Horda', 'Врата Альянса были уничтожены!'),
(20104, 'Commander of alliance was killen!', NULL, NULL, NULL, NULL, NULL, 'La Horda', 'La Horda', 'Коммандир альянса был убит!'),
(20105, 'Commander of horde was killen!', NULL, NULL, NULL, NULL, NULL, 'La Horda', 'La Horda', 'Коммандир орды был убит!');

-- Alliance Gunship Cannon
UPDATE `creature_template` SET `npcflag`=1, `spell1`=69495,`vehicle_id`=452, `iconName` = 'vehichleCursor', ScriptName = 'npc_battleground_vehicle' WHERE `entry` in (34929, 35410);
-- Horde Gunship Cannon
UPDATE `creature_template` SET `npcflag`=1, `spell1`=68825,`vehicle_id`=453, `iconName` = 'vehichleCursor', ScriptName = 'npc_battleground_vehicle' WHERE `entry` in (34935, 35427);
-- Keep Cannon
UPDATE `creature_template` SET `npcflag`=1, `vehicle_id`=160,`spell1`=67452,`spell2`=68169, `iconName` = 'vehichleCursor', ScriptName = 'npc_battleground_vehicle' WHERE `entry` in (34944, 35429);
-- Catapult
UPDATE `creature_template` SET `npcflag`=1, `vehicle_id`=438,`spell1`=66218,`spell2`=66296, `iconName` = 'vehichleCursor', ScriptName = 'npc_battleground_vehicle' WHERE `entry` in (34793, 35413);
-- Demolisher
UPDATE `creature_template` SET `npcflag`=1, `vehicle_id`=509,`spell1`=67441,`spell2`=60206, `iconName` = 'vehichleCursor', ScriptName = 'npc_battleground_vehicle' WHERE `entry` in (34775, 35415);
-- Siege Engine
UPDATE `creature_template` SET faction_A=84, faction_H=84, `npcflag`=1, `vehicle_id`=514,`spell1`=67816,`spell2`=67797, `iconName` = 'vehichleCursor', ScriptName = 'npc_battleground_vehicle' WHERE `entry` in (34776, 35431);
-- Siege Engine
UPDATE `creature_template` SET faction_A=83, faction_H=83, `npcflag`=1, `vehicle_id`=514,`spell1`=67816,`spell2`=67797, `iconName` = 'vehichleCursor', ScriptName = 'npc_battleground_vehicle' WHERE `entry` in (35069, 35433);

DELETE FROM `vehicle_accessory` WHERE `entry` IN (35069, 34776, 35431, 35433);
INSERT INTO `vehicle_accessory` VALUES
(35069, 36355, 7, 0, 'Isle of Conquest Siege Engine'),
(35433, 36357, 7, 0, 'Isle of Conquest Siege Engine'),
(34776, 34777, 7, 0, 'Isle of Conquest Siege Engine'),
(35431, 35436, 7, 0, 'Isle of Conquest Siege Engine'),

(35069, 34778, 1, 0, 'Isle of Conquest Siege Engine'),
(35433, 35417, 1, 0, 'Isle of Conquest Siege Engine'),
(34776, 36356, 1, 0, 'Isle of Conquest Siege Engine'),
(35431, 36358, 1, 0, 'Isle of Conquest Siege Engine'),

(35069, 34778, 2, 0, 'Isle of Conquest Siege Engine'),
(35433, 35417, 2, 0, 'Isle of Conquest Siege Engine'),
(34776, 36356, 2, 0, 'Isle of Conquest Siege Engine'),
(35431, 36358, 2, 0, 'Isle of Conquest Siege Engine');

-- Glaive Thrower
UPDATE `creature_template` SET `npcflag`=1, `vehicle_id`=447,`spell1`=68827,`spell2`=67195, `iconName` = 'vehichleCursor', ScriptName = 'npc_battleground_vehicle' WHERE `entry` in (34802, 35419);
-- Glaive Thrower
UPDATE `creature_template` SET `npcflag`=1, `vehicle_id`=447,`spell1`=68827,`spell2`=67195, `iconName` = 'vehichleCursor', ScriptName = 'npc_battleground_vehicle' WHERE `entry` in (35273, 35421);
-- Flame Turret
UPDATE `creature_template` SET faction_A=83, faction_H=83, `npcflag`=1, `vehicle_id`=337,`spell1`=68832, `iconName` = 'vehichleCursor', ScriptName = 'npc_battleground_vehicle' WHERE `entry` in (34778, 35417);
-- Flame Turret
UPDATE `creature_template` SET faction_A=84, faction_H=84, `npcflag`=1, `vehicle_id`=337,`spell1`=68832, `iconName` = 'vehichleCursor', ScriptName = 'npc_battleground_vehicle' WHERE `entry` in (36356, 36358);
-- Siege Turret
UPDATE `creature_template` SET faction_A=84, faction_H=84, `npcflag`=1, `vehicle_id`=337,`spell1`=67462,`spell2`=69505, `iconName` = 'vehichleCursor', ScriptName = 'npc_battleground_vehicle' WHERE `entry` in (34777, 35436);
-- Siege Turret
UPDATE `creature_template` SET faction_A=83, faction_H=83, `npcflag`=1, `vehicle_id`=337,`spell1`=67462,`spell2`=69505, `iconName` = 'vehichleCursor', ScriptName = 'npc_battleground_vehicle' WHERE `entry` in (36355, 36357);
-- Catapult speed
UPDATE `creature_template` SET `speed_run`=1.14,`speed_walk`=1 WHERE `entry`=34793;
UPDATE `creature_template` SET `speed_run`=1.14,`speed_walk`=1 WHERE `entry`=35413;

Update creature_template set ScriptName='' where entry in (35419, 35421, 35415, 36358, 35417, 35413, 35410, 35427, 35429, 35433, 35431, 34777, 35436, 36355, 36357);
update creature_template set PowerType=3, minmana=100, maxmana=100 where entry in (34793, 35413, 34776, 35431, 35069, 35433, 34778, 35417, 36356, 36358, 34777, 35436, 36355, 36357);


-- Update alliance boss faction 
UPDATE `creature_template` SET `npcflag`=1, `faction_A`=84, `faction_H`=84, `dmg_multiplier`=50, `minhealth`=1827000, `maxhealth`=1827000, `unit_flags`=4096, `type_flags`=4, `mechanic_immune_mask`=650854235, `ScriptName`='' WHERE `entry` IN (34924, 35403);
-- Update horde boss faction 
UPDATE `creature_template` SET `npcflag`=1, `faction_A`=83, `faction_H`=83, `dmg_multiplier`=50, `minhealth`=1827000, `maxhealth`=1827000, `unit_flags`=4096, `type_flags`=4, `mechanic_immune_mask`=650854235, `ScriptName`='' WHERE `entry` IN (34922, 35405);
-- Update Kor Kron Guard faction 
UPDATE `creature_template` SET `npcflag`=1, `faction_A`=83, `faction_H`=83, `dmg_multiplier`=15, `minhealth`=35000, `maxhealth`=35000, `unit_flags`=4096, `type_flags`=4, `mechanic_immune_mask`=650854235, `ScriptName`='' WHERE `entry` IN (34918, 35407);
-- Update Npc Seven TH Legion Infantry faction 
UPDATE `creature_template` SET `npcflag`=1, `faction_A`=84, `faction_H`=84, `dmg_multiplier`=15, `minhealth`=35000, `maxhealth`=35000, `unit_flags`=4096, `type_flags`=4, `mechanic_immune_mask`=650854235, `ScriptName`='' WHERE `entry` IN (34919, 35401);

-- those doors are not selectables
UPDATE `gameobject_template` SET `flags`=0x00000021 WHERE `entry` IN (195223,195703,195491,195451,195452,195437,195436);

-- alliance bombs, they can be only used by the horde
UPDATE `gameobject_template` SET `faction`=1995 WHERE `entry`=195332;
-- horde bombs, they can be only used by the alliance
UPDATE `gameobject_template` SET `faction`=1997 WHERE `entry`=195333;

-- horde teleporters
UPDATE `gameobject_template` SET `faction`=1995 WHERE `entry` IN  (195314,195313);
DELETE FROM spell_script_target WHERE targetEntry IN  (195314,195313);
INSERT INTO spell_script_target VALUES (66551, 0, 195314);
INSERT INTO spell_script_target VALUES (66550, 0, 195313);

-- alliance teleporters
UPDATE `gameobject_template` SET `faction`=1997 WHERE `entry` IN (195315,195316);
DELETE FROM spell_script_target WHERE targetEntry IN (195315,195316);
INSERT INTO spell_script_target VALUES (66551, 0, 195315);
INSERT INTO spell_script_target VALUES (66550, 0, 195316);


-- Refinery's and Quarry's spells.
DELETE FROM `spell_area` WHERE `spell` IN (68719,68720);
INSERT INTO `spell_area` (`spell`,`area`) VALUES 
(68719,4741),
(68719,4747),
(68719,4748),
(68719,4749),
(68719,4750),
(68719,4751),
(68719,4752),
(68719,4753),
(68719,4710),
(68720,4741),
(68720,4747),
(68720,4748),
(68720,4749),
(68720,4750),
(68720,4751),
(68720,4752),
(68720,4710),
(68720,4753);

-- Bosses
DELETE FROM creature WHERE guid>200099 AND guid<200110;
INSERT INTO creature VALUES (200100, 34922, 628, 3, 1, 0, 0, 1295.44,-765.733,70.0541,0.0, 0, 600, 5, 0, 0, 0, 0, 0);
INSERT INTO creature VALUES (200101, 34924, 628, 3, 1, 0, 0, 224.983,-831.573,60.9034,0.0, 0, 600, 5, 0, 0, 0, 0, 0);

INSERT INTO creature VALUES (200102, 34918, 628, 3, 1, 0, 0, 1296.01,-773.256,69.958,0.292168, 0, 600, 5, 0, 0, 0, 0, 0);
INSERT INTO creature VALUES (200103, 34918, 628, 3, 1, 0, 0, 1295.94,-757.756,69.9587,6.02165, 0, 600, 5, 0, 0, 0, 0, 0);
INSERT INTO creature VALUES (200104, 34918, 628, 3, 1, 0, 0, 1295.09,-760.927,69.9587,5.94311, 0, 600, 5, 0, 0, 0, 0, 0);
INSERT INTO creature VALUES (200105, 34918, 628, 3, 1, 0, 0, 1295.13,-769.7,69.95,0.34, 0, 600, 5, 0, 0, 0, 0, 0);

INSERT INTO creature VALUES (200106, 34919, 628, 3, 1, 0, 0, 223.969,-822.958,60.8151,0.46337, 0, 600, 5, 0, 0, 0, 0, 0);
INSERT INTO creature VALUES (200107, 34919, 628, 3, 1, 0, 0, 224.211,-826.952,60.8188,6.25961, 0, 600, 5, 0, 0, 0, 0, 0);
INSERT INTO creature VALUES (200108, 34919, 628, 3, 1, 0, 0, 223.119,-838.386,60.8145,5.64857, 0, 600, 5, 0, 0, 0, 0, 0);
INSERT INTO creature VALUES (200109, 34919, 628, 3, 1, 0, 0, 223.889,-835.102,60.8201,6.21642, 0, 600, 5, 0, 0, 0, 0, 0);

-- Spirit guides (This must be done with BG events - this is hacky way)
DELETE FROM creature WHERE guid>4456541 AND guid<4456584;
DELETE FROM creature WHERE guid>200109 AND guid<200122;
INSERT INTO creature VALUES (200110,13117,628,2,1,0,413,1300.96,-833.926,48.9162,1.54371,0,25,5,0,37420,6310,0,0);
INSERT INTO creature VALUES (200111,13116,628,2,1,0,3043,1300.96,-833.926,48.9162,1.54371,0,25,5,0,37890,6310,0,0);
INSERT INTO creature VALUES (200112,13117,628,2,1,0,413,774.936,-649.506,9.74979,4.73256,0,25,5,0,37420,6310,0,0);
INSERT INTO creature VALUES (200113,13116,628,2,1,0,3043,774.936,-649.506,9.74979,4.73256,0,25,5,0,37890,6310,0,0);
INSERT INTO creature VALUES (200114,13117,628,2,1,0,413,802.641,-1123.01,134.439,2.17347,0,25,5,0,37420,6310,0,0);
INSERT INTO creature VALUES (200115,13116,628,2,1,0,3043,802.641,-1123.01,134.439,2.17347,0,25,5,0,37890,6310,0,0);
INSERT INTO creature VALUES (200116,13117,628,2,1,0,413,278.452,-883.192,49.889,1.62151,0,25,5,0,37420,6310,0,0);
INSERT INTO creature VALUES (200117,13116,628,2,1,0,3043,278.452,-883.192,49.889,1.62151,0,25,5,0,37890,6310,0,0);
INSERT INTO creature VALUES (200118,13117,628,2,1,0,413,629.43,-279.53,11.321,0.106643,0,25,5,0,37420,6310,0,0);
INSERT INTO creature VALUES (200119,13116,628,2,1,0,3043,629.43,-279.53,11.321,0.106643,0,25,5,0,37890,6310,0,0);

INSERT INTO creature VALUES (200120,13117,628,2,1,0,413,1148.65,-1250.98,16.60,1.74,0,25,5,0,37420,6310,0,0);
INSERT INTO creature VALUES (200121,13116,628,2,1,0,3043,438.86,-310.04,51.81,5.87,0,25,5,0,37890,6310,0,0);

DELETE FROM battleground_events WHERE map=628;
INSERT INTO battleground_events VALUES (628, 0, 0, 'SpiritGuide Alliance');
INSERT INTO battleground_events VALUES (628, 0, 1, 'SpiritGuide Horde');
INSERT INTO battleground_events VALUES (628, 1, 0, 'SpiritGuide Alliance, Horde base');
INSERT INTO battleground_events VALUES (628, 1, 1, 'SpiritGuide Horde, Horde base');
INSERT INTO battleground_events VALUES (628, 2, 0, 'SpiritGuide Alliance, Workshop');
INSERT INTO battleground_events VALUES (628, 2, 1, 'SpiritGuide Horde, Workshop');
INSERT INTO battleground_events VALUES (628, 3, 0, 'SpiritGuide Alliance, Hangar');
INSERT INTO battleground_events VALUES (628, 3, 1, 'SpiritGuide Horde, Hangar');
INSERT INTO battleground_events VALUES (628, 4, 0, 'SpiritGuide Alliance, Ally Base');
INSERT INTO battleground_events VALUES (628, 4, 1, 'SpiritGuide Horde, Ally base');
INSERT INTO battleground_events VALUES (628, 5, 0, 'SpiritGuide Alliance, Docks');
INSERT INTO battleground_events VALUES (628, 5, 1, 'SpiritGuide Horde, Docks');

DELETE FROM creature_battleground WHERE guid>200109 AND guid<200122;

INSERT INTO creature_battleground VALUES (200110, 1, 1);
INSERT INTO creature_battleground VALUES (200111, 1, 0);
INSERT INTO creature_battleground VALUES (200112, 2, 1);
INSERT INTO creature_battleground VALUES (200113, 2, 0);
INSERT INTO creature_battleground VALUES (200114, 3, 1);
INSERT INTO creature_battleground VALUES (200115, 3, 0);
INSERT INTO creature_battleground VALUES (200116, 4, 1);
INSERT INTO creature_battleground VALUES (200117, 4, 0);
INSERT INTO creature_battleground VALUES (200118, 5, 1);
INSERT INTO creature_battleground VALUES (200119, 5, 0);

INSERT INTO creature_battleground VALUES (200120, 0, 1);
INSERT INTO creature_battleground VALUES (200121, 0, 0);


-- Seaforium source
DELETE FROM `creature_template` WHERE `entry` in (50001);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `unk16`, `power_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES
(50001, 0, 0, 0, 0, 0, 27462, 0, 27462, 0, 'Seaforium Bomb', NULL, 'Interact', 0, 80, 80, 7500, 7500, 0, 0, 9730, 7, 7, 1, 1, 0.5, 0, 420, 630, 0, 157, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 336, 504, 126, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 94, 1, 0, 0, 0, 'npc_ic_bomb');

-- Huge Seaforium source
DELETE FROM `creature_template` WHERE `entry` in (49999);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `unk16`, `power_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES
(49999, 0, 0, 0, 0, 0, 27462, 0, 27462, 0, 'Huge Seaforium Bomb', NULL, 'Interact', 0, 80, 80, 10000, 10000, 0, 0, 9730, 7, 7, 1, 1, 0.5, 0, 420, 630, 0, 157, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 336, 504, 126, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 94, 1, 0, 0, 0, 'npc_ic_huge_bomb');

DELETE FROM achievement_criteria_requirement WHERE criteria_id IN (12183, 12068, 11497, 11498, 11500, 11501, 12178, 12179, 12181, 12182);
INSERT INTO achievement_criteria_requirement VALUES
(12183, 6, 4710, 0),
(12068, 6, 4710, 0),
(11497, 1, 35273, 0),
(11498, 1, 34775, 0),
(11500, 1, 34793, 0),
(11501, 1, 35069, 0),
(12178, 1, 34802, 0),
(12179, 1, 34775, 0),
(12181, 1, 34793, 0),
(12182, 1, 34776, 0);

DELETE FROM creature_ai_scripts WHERE creature_id in (34924, 35403, 34922, 35405);
INSERT INTO creature_ai_scripts (id, creature_id, event_type, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3) VALUES
(3492401, 34924, 0, 100, 1, 20000, 21000, 20000, 21000, 11,  68506, 1, 0),
(3492402, 34924, 0, 100, 1, 15000, 16000, 15000, 16000, 11,  67280, 4, 0),
(3492403, 34924, 0, 100, 1, 10000, 11000, 10000, 11000, 11,  39171, 1, 0),
(3540301, 35403, 0, 100, 1, 20000, 21000, 20000, 21000, 11,  68506, 1, 0),
(3540302, 35403, 0, 100, 1, 15000, 16000, 15000, 16000, 11,  67280, 4, 0),
(3540303, 35403, 0, 100, 1, 10000, 11000, 10000, 11000, 11,  39171, 1, 0),
(3492201, 34922, 0, 100, 1, 20000, 21000, 20000, 21000, 11,  68506, 1, 0),
(3492202, 34922, 0, 100, 1, 15000, 16000, 15000, 16000, 11,  67280, 4, 0),
(3492203, 34922, 0, 100, 1, 10000, 11000, 10000, 11000, 11,  39171, 1, 0),
(3540501, 35405, 0, 100, 1, 20000, 21000, 20000, 21000, 11,  68506, 1, 0),
(3540502, 35405, 0, 100, 1, 15000, 16000, 15000, 16000, 11,  67280, 4, 0),
(3540503, 35405, 0, 100, 1, 10000, 11000, 10000, 11000, 11,  39171, 1, 0);

UPDATE creature_template SET AIName='EventAI' where entry in (34924, 35403, 34922, 35405);

