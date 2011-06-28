-- by Inquisitor
DELETE FROM `spell_patch` WHERE `dbc` = 'Spell.dbc' AND `entry` IN (
    64844, 47750, 52983, 52984, 52985, 71846
);
INSERT INTO `spell_patch`(`entry`,`dbc`,`data`,`comment`) VALUES 
    ( '64844','Spell.dbc','213 1','Priest - Divine Hymn - Fix dmgClass = DAMAGE_CLASS_MAGIC to benefit from SPD')
   ,( '47750','Spell.dbc','86 21','Priest - Penance (Rank 1) - Target correction')
   ,( '52983','Spell.dbc','86 21','Priest - Penance (Rank 2) - Target correction')
   ,( '52984','Spell.dbc','86 21','Priest - Penance (Rank 3) - Target correction')
   ,( '52985','Spell.dbc','86 21','Priest - Penance (Rank 4) - Target correction')
   ,( '71846','Spell.dbc','122 0','Item - Icecrown 25 Heroic Caster Weapon Proc - Fix classmask'); 
;

-- by Antimozg
DELETE FROM `spell_patch` WHERE `dbc` = 'Spell.dbc' AND `entry` IN (
    65635, 67441
);
INSERT INTO `spell_patch`(`entry`,`dbc`,`data`,`comment`) VALUES
    ( '65635','Spell.dbc','81 0','Gear Scaling - fix % damage')
   ,( '67441','Spell.dbc','76 0 88 47 91 52','Ram - hack damage on GO (tar-108 not implement)')
;
