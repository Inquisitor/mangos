-- by Inquisitor
DELETE FROM `spell_patch` WHERE `entry` IN (64844) AND `dbc` = 'Spell.dbc';
INSERT INTO `spell_patch`(`entry`,`dbc`,`data`,`comment`) VALUES 
    ( '64844','Spell.dbc','213 1','Priest - Divine Hymn - Fix dmgClass = DAMAGE_CLASS_MAGIC to benefit from SPD')
;
