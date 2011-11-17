-- Creature template
-- Commit 91fff03866982767a654

UPDATE `creature_template` SET `spell1`='55328' WHERE `entry`='3579';
UPDATE `creature_template` SET `spell1`='55329' WHERE `entry`='3911';
UPDATE `creature_template` SET `spell1`='55330' WHERE `entry`='3912';
UPDATE `creature_template` SET `spell1`='55332' WHERE `entry`='3913';
UPDATE `creature_template` SET `spell1`='55333' WHERE `entry`='7398';
UPDATE `creature_template` SET `spell1`='55335' WHERE `entry`='7399';
UPDATE `creature_template` SET `spell1`='55278' WHERE `entry`='15478';
UPDATE `creature_template` SET `spell1`='58589' WHERE `entry`='31120';
UPDATE `creature_template` SET `spell1`='58590' WHERE `entry`='31121';
UPDATE `creature_template` SET `spell1`='58591' WHERE `entry`='31122';
UPDATE `creature_template` SET `spell1`='3606'  WHERE `entry`='2523'; -- Searing totem
UPDATE `creature_template` SET `spell1`='51963',  ScriptName ='' WHERE  entry =27829; -- Ebon gargoyle
INSERT INTO creature_ai_scripts (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, `comment`) VALUES
(3254751, 32547, 2, 0, 100, 1, 2, 1, 1000, 1000, 42, 1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'ytdb'),
(3254752, 32547, 4, 0, 100, 0, 0, 0, 0, 0, 20, 0, 0, 0, 21, 0, 0, 0, 0, 0, 0, 0, 'ytdb');
UPDATE `creature_template` SET AIName ='EventAI' WHERE entry =32547; -- Highlord's Nemesis Trainer
