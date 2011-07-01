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
(20104, 'Commander of horde was killen!', NULL, NULL, NULL, NULL, NULL, 'La Horda', 'La Horda', 'Коммандир орды был убит!'),
(20105, 'Commander of alliance was killen!', NULL, NULL, NULL, NULL, NULL, 'La Horda', 'La Horda', 'Коммандир альянса был убит!');

-- Alliance Gunship Cannon
UPDATE `creature_template` SET `npcflag`=1, `spell1`=69495,`vehicle_id`=452, `iconName` = 'vehichleCursor', ScriptName = 'npc_battleground_vehicle' WHERE `entry` in (34929, 35410);
DELETE FROM `npc_spellclick_spells` WHERE npc_entry IN (34929, 35410);
INSERT INTO `npc_spellclick_spells` VALUES ('34929', '60968', '0', '0', '0', '1');
INSERT INTO `npc_spellclick_spells` VALUES ('35410', '60968', '0', '0', '0', '1');
-- Horde Gunship Cannon
UPDATE `creature_template` SET `npcflag`=1, `spell1`=68825,`vehicle_id`=453, `iconName` = 'vehichleCursor', ScriptName = 'npc_battleground_vehicle' WHERE `entry` in (34935, 35427);
DELETE FROM `npc_spellclick_spells` WHERE npc_entry IN (34935, 35427);
INSERT INTO `npc_spellclick_spells` VALUES ('34935', '60968', '0', '0', '0', '1');
INSERT INTO `npc_spellclick_spells` VALUES ('35427', '60968', '0', '0', '0', '1');
-- Keep Cannon
UPDATE `creature_template` SET `npcflag`=1, `vehicle_id`=160,`spell1`=67452,`spell2`=68169, `iconName` = 'vehichleCursor', ScriptName = 'npc_battleground_vehicle' WHERE `entry` in (34944, 35429);
DELETE FROM `npc_spellclick_spells` WHERE npc_entry IN (34944, 35429);
INSERT INTO `npc_spellclick_spells` VALUES ('34944', '60968', '0', '0', '0', '1');
INSERT INTO `npc_spellclick_spells` VALUES ('35429', '60968', '0', '0', '0', '1');
-- Catapult
UPDATE `creature_template` SET `npcflag`=1, `vehicle_id`=438,`spell1`=66218,`spell2`=66296, `iconName` = 'vehichleCursor', ScriptName = 'npc_battleground_vehicle' WHERE `entry` in (34793, 35413);
DELETE FROM `npc_spellclick_spells` WHERE npc_entry IN (34793, 35413);
INSERT INTO `npc_spellclick_spells` VALUES ('34793', '60968', '0', '0', '0', '1');
INSERT INTO `npc_spellclick_spells` VALUES ('35413', '60968', '0', '0', '0', '1');
-- Demolisher
UPDATE `creature_template` SET `npcflag`=1, `vehicle_id`=509,`spell1`=67441,`spell2`=60206, `iconName` = 'vehichleCursor', ScriptName = 'npc_battleground_vehicle' WHERE `entry` in (34775, 35415);
DELETE FROM `npc_spellclick_spells` WHERE npc_entry IN (34775, 35415);
INSERT INTO `npc_spellclick_spells` VALUES ('34775', '60968', '0', '0', '0', '1');
INSERT INTO `npc_spellclick_spells` VALUES ('35415', '60968', '0', '0', '0', '1');
-- Siege Engine
UPDATE `creature_template` SET `npcflag`=1, `vehicle_id`=435,`spell1`=67816,`spell2`=67797, `iconName` = 'vehichleCursor', ScriptName = 'npc_battleground_vehicle' WHERE `entry` in (34776, 35431);
DELETE FROM `npc_spellclick_spells` WHERE npc_entry IN (34776, 35431);
INSERT INTO `npc_spellclick_spells` VALUES ('34776', '60968', '0', '0', '0', '1');
INSERT INTO `npc_spellclick_spells` VALUES ('35431', '60968', '0', '0', '0', '1');
-- Siege Engine
UPDATE `creature_template` SET `npcflag`=1, `vehicle_id`=435,`spell1`=67816,`spell2`=67797, `iconName` = 'vehichleCursor', ScriptName = 'npc_battleground_vehicle' WHERE `entry` in (35069, 35433);
DELETE FROM `npc_spellclick_spells` WHERE npc_entry IN (35069, 35433);
INSERT INTO `npc_spellclick_spells` VALUES ('35069', '60968', '0', '0', '0', '1');
INSERT INTO `npc_spellclick_spells` VALUES ('35433', '60968', '0', '0', '0', '1');

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
DELETE FROM `npc_spellclick_spells` WHERE npc_entry IN (34802, 35419);
INSERT INTO `npc_spellclick_spells` VALUES ('34802', '60968', '0', '0', '0', '1');
INSERT INTO `npc_spellclick_spells` VALUES ('35419', '60968', '0', '0', '0', '1');
-- Glaive Thrower
UPDATE `creature_template` SET `npcflag`=1, `vehicle_id`=447,`spell1`=68827,`spell2`=67195, `iconName` = 'vehichleCursor', ScriptName = 'npc_battleground_vehicle' WHERE `entry` in (35273, 35421);
DELETE FROM `npc_spellclick_spells` WHERE npc_entry IN (35273, 35421);
INSERT INTO `npc_spellclick_spells` VALUES ('35273', '60968', '0', '0', '0', '1');
INSERT INTO `npc_spellclick_spells` VALUES ('35421', '60968', '0', '0', '0', '1');
-- Flame Turret
UPDATE `creature_template` SET `npcflag`=1, `vehicle_id`=337,`spell1`=68832, `iconName` = 'vehichleCursor', ScriptName = 'npc_battleground_vehicle' WHERE `entry` in (34778, 35417);
DELETE FROM `npc_spellclick_spells` WHERE npc_entry IN (34778, 35417);
INSERT INTO `npc_spellclick_spells` VALUES ('34778', '60968', '0', '0', '0', '1');
INSERT INTO `npc_spellclick_spells` VALUES ('35417', '60968', '0', '0', '0', '1');
-- Flame Turret
UPDATE `creature_template` SET `npcflag`=1, `vehicle_id`=337,`spell1`=68832, `iconName` = 'vehichleCursor', ScriptName = 'npc_battleground_vehicle' WHERE `entry` in (36356, 36358);
DELETE FROM `npc_spellclick_spells` WHERE npc_entry IN (36356, 36358);
INSERT INTO `npc_spellclick_spells` VALUES ('36356', '60968', '0', '0', '0', '1');
INSERT INTO `npc_spellclick_spells` VALUES ('36358', '60968', '0', '0', '0', '1');
-- Siege Turret
UPDATE `creature_template` SET `npcflag`=1, `vehicle_id`=337,`spell1`=67462,`spell2`=69505, `iconName` = 'vehichleCursor', ScriptName = 'npc_battleground_vehicle' WHERE `entry` in (34777, 35436);
DELETE FROM `npc_spellclick_spells` WHERE npc_entry IN (34777, 35436);
INSERT INTO `npc_spellclick_spells` VALUES ('34777', '60968', '0', '0', '0', '1');
INSERT INTO `npc_spellclick_spells` VALUES ('35436', '60968', '0', '0', '0', '1');
-- Siege Turret
UPDATE `creature_template` SET `npcflag`=1, `vehicle_id`=337,`spell1`=67462,`spell2`=69505, `iconName` = 'vehichleCursor', ScriptName = 'npc_battleground_vehicle' WHERE `entry` in (36355, 36357);
DELETE FROM `npc_spellclick_spells` WHERE npc_entry IN (36355, 36357);
INSERT INTO `npc_spellclick_spells` VALUES ('36355', '60968', '0', '0', '0', '1');
INSERT INTO `npc_spellclick_spells` VALUES ('36357', '60968', '0', '0', '0', '1');
-- Catapult speed
UPDATE `creature_template` SET `speed_run`=1.14,`speed_walk`=1 WHERE `entry`=34793;
UPDATE `creature_template` SET `speed_run`=1.14,`speed_walk`=1 WHERE `entry`=35413;

Update creature_template set ScriptName='' where entry in (35419, 35421, 35415, 36358, 35417, 35413, 35410, 35427, 35429, 35433, 35431, 34777, 35436, 36355, 36357);
update creature_template set PowerType=3, minmana=100, maxmana=100 where entry in (34793, 35413, 34776, 35431, 35069, 35433, 34778, 35417, 36356, 36358, 34777, 35436, 36355, 36357);


-- Update alliance boss faction 
UPDATE `creature_template` SET `faction_A`=84, `faction_H`=84, dmg_multiplier=12, type_flags=0, MovementType=1, mechanic_immune_mask=1, `ScriptName`='' WHERE `entry` IN (34924, 35403);
-- Update horde boss faction 
UPDATE `creature_template` SET `faction_A`=83, `faction_H`=83, dmg_multiplier=12, type_flags=0, MovementType=1, mechanic_immune_mask=1, `ScriptName`='' WHERE `entry` IN (34922, 35405);
-- Update Kor Kron Guard faction 
UPDATE `creature_template` SET `faction_A`=83, `faction_H`=83, dmg_multiplier=12, type_flags=0, MovementType=1, mechanic_immune_mask=1, `ScriptName`='' WHERE `entry` IN (34918, 35407);
-- Update Npc Seven TH Legion Infantry faction 
UPDATE `creature_template` SET `faction_A`=84, `faction_H`=84, dmg_multiplier=12, type_flags=0, MovementType=1, mechanic_immune_mask=1, `ScriptName`='' WHERE `entry` IN (34919, 35401);

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

-- Spirit guides (This must be done with BG events - this is hacky way)
DELETE FROM creature WHERE guid = '4456542';
INSERT INTO creature VALUES (4456542,13117,628,2,1,0,413,1300.96,-833.926,48.9162,1.54371,25,5,0,37420,6310,0,0);
DELETE FROM creature WHERE guid = '4456545';
INSERT INTO creature VALUES (4456545,13116,628,2,1,0,3043,1300.96,-833.926,48.9162,1.54371,25,5,0,37890,6310,0,0);
DELETE FROM creature WHERE guid = '4456548';
INSERT INTO creature VALUES (4456548,13117,628,2,1,0,413,774.936,-649.506,9.74979,4.73256,25,5,0,37420,6310,0,0);
DELETE FROM creature WHERE guid = '4456551';
INSERT INTO creature VALUES (4456551,13116,628,2,1,0,3043,774.936,-649.506,9.74979,4.73256,25,5,0,37890,6310,0,0);
DELETE FROM creature WHERE guid = '4456554';
INSERT INTO creature VALUES (4456554,13117,628,2,1,0,413,802.641,-1123.01,134.439,2.17347,25,5,0,37420,6310,0,0);
DELETE FROM creature WHERE guid = '4456557';
INSERT INTO creature VALUES (4456557,13116,628,2,1,0,3043,802.641,-1123.01,134.439,2.17347,25,5,0,37890,6310,0,0);
DELETE FROM creature WHERE guid = '4456560';
INSERT INTO creature VALUES (4456560,13117,628,2,1,0,413,278.452,-883.192,49.889,1.62151,25,5,0,37420,6310,0,0);
DELETE FROM creature WHERE guid = '4456563';
INSERT INTO creature VALUES (4456563,13116,628,2,1,0,3043,278.452,-883.192,49.889,1.62151,25,5,0,37890,6310,0,0);
DELETE FROM creature WHERE guid = '4456580';
INSERT INTO creature VALUES (4456580,13117,628,2,1,0,413,629.43,-279.53,11.321,0.106643,25,5,0,37420,6310,0,0);
DELETE FROM creature WHERE guid = '4456583';
INSERT INTO creature VALUES (4456583,13116,628,2,1,0,3043,629.43,-279.53,11.321,0.106643,25,5,0,37890,6310,0,0);