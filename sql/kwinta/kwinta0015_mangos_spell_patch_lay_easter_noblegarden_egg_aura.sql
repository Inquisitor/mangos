DELETE FROM `spell_patch` WHERE `dbc` = 'Spell.dbc' AND `entry` in (61719);
INSERT INTO `spell_patch`(`entry`,`dbc`,`data`,`comment`) VALUES
    ( '61719','Spell.dbc','31 0 32 0 33 0','Easter Lay Noblegarden Egg Aura - remove inrerruptions')
;

DELETE FROM `achievement_criteria_requirement` WHERE `criteria_id` IN (9118);
INSERT INTO `achievement_criteria_requirement` (`criteria_id`, `type`, `value1`, `value2`) VALUES
    ('9118', '6', '543', '0')
;
