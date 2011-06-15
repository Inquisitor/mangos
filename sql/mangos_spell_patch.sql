-- by Inquisitor
DELETE FROM `spell_patch` WHERE `entry` IN (64844, 47750, 52983, 52984, 52985) AND `dbc` = 'Spell.dbc';
INSERT INTO `spell_patch`(`entry`,`dbc`,`data`,`comment`) VALUES 
    ( '64844','Spell.dbc','213 1','Priest - Divine Hymn - Fix dmgClass = DAMAGE_CLASS_MAGIC to benefit from SPD')
   ,( '47750','Spell.dbc','86 21','Priest - Penance (Rank 1) - Target correction')
   ,( '52983','Spell.dbc','86 21','Priest - Penance (Rank 2) - Target correction')
   ,( '52984','Spell.dbc','86 21','Priest - Penance (Rank 3) - Target correction')
   ,( '52985','Spell.dbc','86 21','Priest - Penance (Rank 4) - Target correction')
;

-- by Antimozg
DELETE FROM `spell_patch` WHERE `dbc` = 'Achievement_Criteria.dbc' AND `entry` IN (8758);
INSERT INTO `spell_patch`(`entry`,`dbc`,`data`,`comment`) VALUES
    ( '8758','Achievement_Criteria.dbc','2 1 3 607 26 2','BG Strand of the Ancients - Storm the Beach achievement requirements correction')
;
