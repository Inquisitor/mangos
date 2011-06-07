/* 7th Legion Chain Gun */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (27714);
INSERT INTO npc_spellclick_spells VALUES (27714, 67373, 0, 0, 0, 1);
REPLACE INTO creature_template_addon VALUES (27714, 0, 0, 0, 0, 0, 68, NULL);
REPLACE INTO vehicle_data VALUES (68, 5, 49190, 49550, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (1301, 3);
UPDATE creature_template SET IconName = 'Gunner' WHERE entry IN (27714);

/* Alliance Steam Tank */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (27587);
INSERT INTO npc_spellclick_spells VALUES (27587, 43695, 0, 0, 0, 0);
REPLACE INTO creature_template_addon VALUES (27587, 0, 0, 0, 0, 0, 56, NULL);
REPLACE INTO vehicle_data VALUES (56, 4, 49315, 49333, 49109, 49081, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (945, 3),(946, 8),(949, 8),(950, 8);
UPDATE creature_template SET IconName = 'vehichleCursor' WHERE entry IN (27587);
UPDATE creature_template SET modelid_1 = 25341 WHERE entry = 27587;
UPDATE creature_model_info SET modelid_other_gender = 0 WHERE modelid = 25341;
-- UPDATE creature_template_addon SET passengers = '27163 1 27588 2 27588 3' WHERE entry = 27587;

/* Broken-down Shredder */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (27354);
INSERT INTO npc_spellclick_spells VALUES (27354, 67373, 0, 0, 0, 1);
REPLACE INTO creature_template_addon VALUES (27354, 0, 0, 0, 0, 0, 49, NULL);
REPLACE INTO vehicle_data VALUES (49, 4, 48558, 48604, 48548, 0, 48610, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (821, 3);
UPDATE creature_template SET IconName = 'vehichleCursor' WHERE entry IN (27354);

/* Enraged Mammoth */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (28851);
INSERT INTO npc_spellclick_spells VALUES (28851, 67373, 0, 0, 0, 1);
REPLACE INTO creature_template_addon VALUES (28851, 0, 0, 0, 0, 0, 145, NULL);
REPLACE INTO vehicle_data VALUES (145, 4, 52603, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (1906, 3);
UPDATE creature_template SET IconName = 'vehichleCursor' WHERE entry IN (28851);

/* Flamebringer */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (27292);
INSERT INTO npc_spellclick_spells VALUES (27292, 67373, 0, 0, 0, 1);
REPLACE INTO creature_template_addon VALUES (27292, 0, 0, 0, 0, 0, 50, NULL);
REPLACE INTO vehicle_data VALUES (50, 4, 48619, 48620, 52812, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (841, 3);
UPDATE creature_template SET IconName = 'vehichleCursor' WHERE entry IN (27292);

/* Forsaken Blight Spreader */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (26523);
INSERT INTO npc_spellclick_spells VALUES (26523, 47961, 0, 0, 0, 1);
REPLACE INTO creature_template_addon VALUES (26523, 0, 0, 0, 0, 0, 36, NULL);
REPLACE INTO vehicle_data VALUES (36, 4, 48211, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (644, 3);
UPDATE creature_template SET IconName = 'vehichleCursor' WHERE entry = 26523;

/* Highland Mustang */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (26472);
INSERT INTO npc_spellclick_spells VALUES (26472, 67373, 0, 0, 0, 1);
REPLACE INTO creature_template_addon VALUES (26472, 0, 0, 0, 0, 0, 62, NULL);
REPLACE INTO vehicle_data VALUES (62, 4, 49285, 29577, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (1270, 3);
UPDATE creature_template SET IconName = 'vehichleCursor' WHERE entry IN (26472);

/* Horde Siege Tank */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (25334);
INSERT INTO npc_spellclick_spells VALUES (25334, 43695, 0, 0, 0, 0);
REPLACE INTO creature_template_addon VALUES (25334, 0, 0, 0, 0, 0, 26, NULL);
REPLACE INTO vehicle_data VALUES (26, 4, 50672, 45750, 50677, 47849, 47962, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (365,3),(366,6),(367,6),(368,6);
UPDATE creature_template SET IconName = 'vehichleCursor' WHERE entry = 25334;

/* Infected Kodo Beast */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (25596);
INSERT INTO npc_spellclick_spells VALUES (25596, 45875, 11690, 1, 11690, 1);
REPLACE INTO creature_template_addon VALUES (25596, 0, 0, 0, 0, 0, 29, NULL);
REPLACE INTO vehicle_data VALUES (29, 12, 45876, 45877, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (422, 3);
UPDATE creature_template SET speed_run = 2, IconName = 'vehichleCursor' WHERE entry = 25596;
REPLACE INTO spell_script_target VALUES (45877, 1, 25596);
/* Bring 'Em Back Alive quest */
REPLACE INTO creature_ai_scripts VALUES (2559651,25596,8,0,100,0,45877,-1,0,0,33,25698,0,0,41,0,0,0,0,0,0,0,'q11690');
UPDATE creature_template SET AIName = 'EventAI' WHERE entry = 25596;

/* Kor'kron War Rider */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (26813);
INSERT INTO npc_spellclick_spells VALUES (26813, 47424, 0, 0, 0, 1);
REPLACE INTO creature_template_addon VALUES (26813, 0, 0, 0, 0, 0, 80, NULL);
REPLACE INTO vehicle_data VALUES (80, 4, 47434, 63507, 47454, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (1431, 3),(1432, 2);
UPDATE creature_template SET IconName = 'vehichleCursor' WHERE entry IN (26813);
UPDATE creature_template SET modelid_2 = 0 WHERE entry = 26813;

/* Kor'kron War Rider II */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (26572);
INSERT INTO npc_spellclick_spells VALUES (26572, 47424, 0, 0, 0, 1);
REPLACE INTO creature_template_addon VALUES (26572, 0, 0, 0, 0, 0, 34, NULL);
REPLACE INTO vehicle_data VALUES (34, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (601, 3);
UPDATE creature_template SET IconName = 'vehichleCursor' WHERE entry IN (26572);

/* Massacre At Light's Point (new) */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (28887,28833,28864);
INSERT INTO npc_spellclick_spells VALUES (28833,52447,12701,1,12701,1),(28887,52447,12701,1,12701,1),(28864,67373,0,0,0,1);
REPLACE INTO creature_template_addon VALUES (28887,0,0,2049,0,0,79,''),(28833,0,0,2049,0,0,79,''),(28864,0,0,0,0,0,143,NULL);
REPLACE INTO vehicle_data VALUES (143,12,0,0,0,0,0,0,0,0,0,0,0),(79,5,52435,52576,52588,0,0,0,0,0,0,0,0);
REPLACE INTO vehicle_seat_data VALUES (1427, 3),(1902, 3);
UPDATE creature_template SET IconName = 'vehichleCursor', InhabitType = 3 WHERE entry IN (28887,28833,28864);
DELETE FROM creature_addon WHERE guid IN (SELECT guid FROM creature WHERE id IN (28887,28833,28864));

/* Onslaught Warhorse */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (27213);
INSERT INTO npc_spellclick_spells VALUES (27213, 67373, 0, 0, 0, 1);
REPLACE INTO creature_template_addon VALUES (27213, 0, 0, 0, 0, 0, 43, NULL);
REPLACE INTO vehicle_data VALUES (43, 4, 48297, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (742, 3);
UPDATE creature_template SET IconName = 'vehichleCursor' WHERE entry = 27213;

/* Refurbished Shredder */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (27496);
INSERT INTO npc_spellclick_spells VALUES (27496, 60944, 0, 0, 0, 1);
REPLACE INTO creature_template_addon VALUES (27496, 0, 0, 0, 0, 0, 55, NULL);
REPLACE INTO vehicle_data VALUES (55, 4, 48548, 48604, 48558, 0, 48610, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (922, 3);
UPDATE creature_template SET IconName = 'vehichleCursor' WHERE entry IN (27496);

/* Rocket Propelled Warhead */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (27593);
INSERT INTO npc_spellclick_spells VALUES (27593, 49177, 0, 0, 0, 1);
REPLACE INTO creature_template_addon VALUES (27593, 0, 0, 0, 0, 0, 57, NULL);
REPLACE INTO vehicle_data VALUES (57, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (961, 3);
UPDATE creature_template SET IconName = 'vehichleCursor' WHERE entry IN (27593);

/* Steel Gate Flying Machine */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (24418);
INSERT INTO npc_spellclick_spells VALUES (24418, 67373, 0, 0, 0, 1);
REPLACE INTO creature_template_addon VALUES (24418, 0, 0, 0, 0, 0, 8, NULL);
REPLACE INTO vehicle_data VALUES (8, 4, 44009, 43770, 43799, 43769, 47769, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (261, 3),(461, 2);
UPDATE creature_template SET IconName = 'vehichleCursor', InhabitType = 3 WHERE entry IN (24418);

/* the Oculus (new) */
DELETE FROM spell_script_target where entry IN (49460, 49346, 49464);
DELETE FROM npc_spellclick_spells where npc_entry IN (27755, 27692, 27756);
DELETE FROM creature_template_addon where entry IN (27755, 27692, 27756);
UPDATE creature_template SET IconName = 'vehichleCursor', InhabitType = 3 WHERE entry IN (27755,27756,27692);
/* Amber Drake */
INSERT INTO spell_script_target VALUES (49460, 1, 27755);
INSERT INTO npc_spellclick_spells VALUES (27755, 49459, 0, 0, 0, 1);
INSERT INTO creature_template_addon VALUES (27755, 0, 0, 0, 0, 0, 70, NULL);
REPLACE INTO vehicle_data VALUES (70, 12, 49840, 49838, 49592, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (1323, 3);
/* Emerald Drake */
INSERT INTO spell_script_target VALUES (49346, 1, 27692);
INSERT INTO npc_spellclick_spells VALUES (27692, 49427, 0, 0, 0, 1);
INSERT INTO creature_template_addon VALUES (27692, 0, 0, 0, 0, 0, 181, NULL);
REPLACE INTO vehicle_data VALUES (181, 12, 50328, 50341, 50344, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (2081, 3);
/* Ruby Drake */
INSERT INTO spell_script_target VALUES (49464, 1, 27756);
INSERT INTO npc_spellclick_spells VALUES (27756, 49463, 0, 0, 0, 1);
INSERT INTO creature_template_addon VALUES (27756, 0, 0, 0, 0, 0, 186, NULL);
REPLACE INTO vehicle_data VALUES (186, 12, 50232, 50248, 50240, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (2089, 3);
/* Hack for broken Nexus Portal */
UPDATE gameobject_template SET data0 = 49665 WHERE entry = 189985;
UPDATE spell_target_position SET id = 49665 WHERE id = 49305;

/* Wintergarde Gryphon */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (27258);
INSERT INTO npc_spellclick_spells VALUES (27258, 49288, 0, 0, 0, 1);
REPLACE INTO creature_template_addon VALUES (27258, 0, 0, 0, 0, 0, 44, NULL);
REPLACE INTO vehicle_data VALUES (44, 4, 48363, 48397, 54170, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (762, 3),(764, 2);
UPDATE creature_template SET IconName = 'vehichleCursor', InhabitType = 3 WHERE entry IN (27258);
/* Wintergarde Gryphon II, Into Hostile Territory quest */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (27661);
INSERT INTO npc_spellclick_spells VALUES (27661, 48862, 0, 0, 0, 1);
REPLACE INTO creature_template_addon VALUES (27661, 0, 0, 0, 0, 0, 61, NULL);
REPLACE INTO vehicle_data VALUES (61, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (1267, 3),(1268, 2);
UPDATE creature_template SET IconName = 'vehichleCursor', InhabitType = 3 WHERE entry IN (27661);

/* Wintergrasp Tower Cannon (new) */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (28366);
INSERT INTO npc_spellclick_spells VALUES (28366, 60968, 0, 0, 0, 1);
REPLACE INTO creature_template_addon VALUES (28366, 0, 0, 0, 0, 0, 244, NULL);
REPLACE INTO vehicle_data VALUES (244, 5, 51362, 51421, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (2283, 3);

/* Ulduar Salvaged vehicles (fixes) */
UPDATE creature_model_info SET bounding_radius = '0.306' WHERE modelid IN (25870,25871);
UPDATE creature_template SET IconName = 'Gunner' WHERE entry = 33167;
DELETE FROM creature_addon WHERE guid IN (SELECT guid FROM creature WHERE id IN (33060,33062,33109));
UPDATE creature_template SET AIName = 'NullAI' WHERE entry IN (33243,33229,33272);

/* Wooly Mammoth Bull */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (25743);
INSERT INTO npc_spellclick_spells VALUES (25743, 43695, 0, 0, 0, 0);
REPLACE INTO creature_template_addon VALUES (25743, 0, 0, 0, 0, 0, 72, NULL);
REPLACE INTO vehicle_data VALUES (72, 12, 46317, 46315, 46316, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (1362, 3);
UPDATE creature_template SET IconName = 'vehichleCursor' WHERE entry IN (25743);
UPDATE creature_template SET faction_A = 7, faction_H = 7 WHERE entry IN (25743);

/* Wyrmrest Defender */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (27629);
INSERT INTO npc_spellclick_spells VALUES (27629, 49256, 12372, 1, 12372, 1);
REPLACE INTO creature_template_addon VALUES (27629,0,50331648,1,0,0,60,NULL);
REPLACE INTO vehicle_data VALUES (60,4,49161,49243,49263,49264,49367,0,0,0,0,0,0);
REPLACE INTO vehicle_seat_data VALUES (1262, 3);
UPDATE creature_template SET IconName = 'vehichleCursor', InhabitType = 3 WHERE entry IN (27629);
/* Defending Wyrmrest Temple quest */
REPLACE INTO spell_script_target VALUES (49370,1,27698),(49367,1,27698);
UPDATE quest_template SET ReqSpellCast3 = 49367 WHERE entry = 12372;
UPDATE creature_template SET npcflag = 0, unit_flags = 0 WHERE entry IN (27629);

/* Wyrmrest Skytalon */
DELETE FROM npc_spellclick_spells WHERE npc_entry = 32535;
INSERT INTO npc_spellclick_spells VALUES (32535, 61245, 0, 0, 0, 1);
REPLACE INTO creature_template_addon VALUES (32535, 0, 0, 0, 0, 0, 165, NULL);
REPLACE INTO vehicle_data VALUES (165, 12, 56091, 61621, 57090, 57143, 57108, 57092, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (2061, 3);
UPDATE creature_template SET IconName = 'vehichleCursor', InhabitType = 3 WHERE entry = 32535;
/* Aces High! quests */
REPLACE INTO gossip_scripts VALUES (32548,0,15,61287,1,0,0,0,0,0,0,0,0,0,0,0,0,0,'');
REPLACE INTO gossip_menu_option VALUES (10204,1,0,'I am ready Lady Corastrasza.',1,1,0,0,32548,0,0,NULL,9,13413,0,0,0,0,0,0,0);
REPLACE INTO gossip_menu_option VALUES (10204,2,0,'I am ready Lady Corastrasza.',1,1,0,0,32548,0,0,NULL,9,13414,0,0,0,0,0,0,0);

/* Wyrmrest Vanquisher */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (27996);
INSERT INTO npc_spellclick_spells VALUES (27996, 67373, 0, 0, 0, 1);
REPLACE INTO creature_template_addon VALUES (27996, 0, 50331648, 1, 0, 0, 99, NULL);
REPLACE INTO vehicle_data VALUES (99, 4, 50430, 55987, 50348, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (1520, 3),(1521, 8);
UPDATE creature_template SET IconName = 'vehichleCursor', InhabitType = 3 WHERE entry IN (27996);

/* Fizzcrank Bomber */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (25765);
INSERT INTO npc_spellclick_spells VALUES (25765, 67373, 0, 0, 0, 1);
REPLACE INTO creature_template_addon VALUES (25765, 0, 0, 0, 0, 0, 492, NULL);
REPLACE INTO vehicle_data VALUES (492, 4, 45971, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (5506, 3);
UPDATE creature_template SET IconName = 'vehichleCursor', InhabitType = 3 WHERE entry IN (25765);

/* Dusk */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (26191);
INSERT INTO npc_spellclick_spells VALUES (26191, 67373, 0, 0, 0, 1);
REPLACE INTO creature_template_addon VALUES (26191, 0, 0, 0, 0, 0, 200, NULL);
REPLACE INTO vehicle_data VALUES (200, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (2144, 3);
UPDATE creature_template SET IconName = 'vehichleCursor' WHERE entry IN (26191);

/* Tatjana's Horse */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (27626);
INSERT INTO npc_spellclick_spells VALUES (27626, 67373, 0, 0, 0, 1);
REPLACE INTO creature_template_addon VALUES (27626, 0, 0, 0, 0, 0, 59, NULL);
REPLACE INTO vehicle_data VALUES (59, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (1241, 3),(1242, 2);
UPDATE creature_template SET IconName = 'vehichleCursor' WHERE entry IN (27626);

/* Antipersonnel Cannon */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (27894);
INSERT INTO npc_spellclick_spells VALUES (27894, 67373, 0, 0, 0, 1);
REPLACE INTO creature_template_addon VALUES (27894, 0, 0, 0, 0, 0, 160, NULL);
REPLACE INTO vehicle_data VALUES (160, 5, 49872, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (2029, 3);
UPDATE creature_template SET IconName = 'Gunner' WHERE entry IN (27894);
/* Antipersonnel Cannon II */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (32795);
INSERT INTO npc_spellclick_spells VALUES (32795, 67373, 0, 0, 0, 1);
REPLACE INTO creature_template_addon VALUES (32795, 0, 0, 0, 0, 0, 160, NULL);
REPLACE INTO vehicle_data VALUES (160, 5, 49872, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (2029, 3);
UPDATE creature_template SET IconName = 'Gunner' WHERE entry IN (32795);

/* Wintergrasp Demolisher */
UPDATE creature_template SET maxhealth = 50000, minhealth = 50000 WHERE entry = 28094;
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (28094);
INSERT INTO npc_spellclick_spells VALUES (28094, 60968, 0, 0, 0, 1);
REPLACE INTO creature_template_addon VALUES (28094, 0, 0, 0, 0, 0, 106, NULL);
REPLACE INTO vehicle_data VALUES (106, 4, 50896, 50652, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (1554, 3),(1556, 6),(1557, 6);
UPDATE creature_template SET IconName = 'vehichleCursor' WHERE entry IN (28094);

/* Wintergrasp Siege Engine */
UPDATE creature_template SET maxhealth = 75000, minhealth = 75000 WHERE entry IN (28312,32627);
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (28312);
INSERT INTO npc_spellclick_spells VALUES (28312, 60968, 0, 0, 0, 1);
REPLACE INTO creature_template_addon VALUES (28312, 0, 0, 0, 0, 0, 117, '28319 7');
REPLACE INTO vehicle_data VALUES (117, 4, 51678, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (1648, 3),(1649, 2),(1650, 2),(1652, 4);
UPDATE creature_template SET IconName = 'vehichleCursor' WHERE entry IN (28312);
/* Wintergrasp Siege Engine II */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (32627);
INSERT INTO npc_spellclick_spells VALUES (32627, 60968, 0, 0, 0, 1);
REPLACE INTO creature_template_addon VALUES (32627, 0, 0, 0, 0, 0, 117, '32629 7');
REPLACE INTO vehicle_data VALUES (117, 4, 51678, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (1648, 3),(1649, 2),(1650, 2),(1652, 2);
UPDATE creature_template SET IconName = 'vehichleCursor' WHERE entry IN (32627);

/* Wintergrasp Siege Turret */
UPDATE creature_template SET maxhealth = 50000, minhealth = 50000 WHERE entry IN (28319,32629);
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (28319);
INSERT INTO npc_spellclick_spells VALUES (28319, 60968, 0, 0, 0, 1);
REPLACE INTO creature_template_addon VALUES (28319, 0, 0, 0, 0, 0, 116, NULL);
REPLACE INTO vehicle_data VALUES (116, 5, 51362, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (1643, 3);
UPDATE creature_template SET IconName = 'Gunner' WHERE entry IN (28319);
/* Wintergrasp Siege Turret II */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (32629);
INSERT INTO npc_spellclick_spells VALUES (32629, 60968, 0, 0, 0, 1);
REPLACE INTO creature_template_addon VALUES (32629, 0, 0, 0, 0, 0, 116, NULL);
REPLACE INTO vehicle_data VALUES (116, 5, 51362, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (1643, 3);
UPDATE creature_template SET IconName = 'Gunner' WHERE entry IN (32629);

/* Battleground Demolisher */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (28781);
INSERT INTO npc_spellclick_spells VALUES (28781, 67373, 0, 0, 0, 1);
REPLACE INTO creature_template_addon VALUES (28781, 0, 0, 0, 0, 0, 158, NULL);
REPLACE INTO vehicle_data VALUES (158, 4, 52338, 60206, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (2021, 3),(2023, 2),(2024, 2);
UPDATE creature_template SET IconName = 'vehichleCursor' WHERE entry IN (28781);
/* Battleground Demolisher II */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (32796);
INSERT INTO npc_spellclick_spells VALUES (32796, 67373, 0, 0, 0, 1);
REPLACE INTO creature_template_addon VALUES (32796, 0, 0, 0, 0, 0, 158, NULL);
REPLACE INTO vehicle_data VALUES (158, 4, 52338, 60206, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (2021, 3),(2023, 2),(2024, 2);
UPDATE creature_template SET IconName = 'vehichleCursor' WHERE entry IN (32796);

/* Frostbite */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (29857);
INSERT INTO npc_spellclick_spells VALUES (29857, 67373, 0, 0, 0, 1);
REPLACE INTO creature_template_addon VALUES (29857, 0, 0, 0, 0, 0, 202, NULL);
REPLACE INTO vehicle_data VALUES (202, 4, 54996, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (2164, 3);
UPDATE creature_template SET IconName = 'vehichleCursor' WHERE entry IN (29857);

/* Valkyrion Harpoon Gun */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (30066);
INSERT INTO npc_spellclick_spells VALUES (30066, 67373, 0, 0, 0, 1);
REPLACE INTO creature_template_addon VALUES (30066, 0, 0, 0, 0, 0, 213, NULL);
REPLACE INTO vehicle_data VALUES (213, 4, 55812, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (2186, 3);
UPDATE creature_template SET IconName = 'vehichleCursor' WHERE entry IN (30066);

/* Argent Skytalon */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (30228);
INSERT INTO npc_spellclick_spells VALUES (30228, 67373, 0, 0, 0, 1);
REPLACE INTO creature_template_addon VALUES (30228, 0, 50331648, 1, 0, 0, 234, NULL);
REPLACE INTO vehicle_data VALUES (234, 4, 56683, 56684, 56712, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (2235, 3),(2236, 8);
UPDATE creature_template SET IconName = 'vehichleCursor', InhabitType = 3 WHERE entry IN (30228);

/* Jotunheim Rapid-Fire Harpoon */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (30337);
INSERT INTO npc_spellclick_spells VALUES (30337, 67373, 0, 0, 0, 1);
REPLACE INTO creature_template_addon VALUES (30337, 0, 0, 0, 0, 0, 229, NULL);
REPLACE INTO vehicle_data VALUES (229, 4, 0, 0, 56570, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (2229, 3);
UPDATE creature_template SET IconName = 'vehichleCursor' WHERE entry IN (30337);

/* Nergeld */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (30403);
INSERT INTO npc_spellclick_spells VALUES (30403, 56699, 0, 0, 0, 1);
REPLACE INTO creature_template_addon VALUES (30403, 0, 0, 0, 0, 0, 236, NULL);
REPLACE INTO vehicle_data VALUES (236, 4, 60540, 56746, 56748, 56747, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (2238, 3);
UPDATE creature_template SET IconName = 'vehichleCursor' WHERE entry IN (30403); 
