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

-- by Antimozg
DELETE FROM `spell_patch` WHERE `dbc` = 'Achievement_Criteria.dbc' AND `entry` IN (
    12183, 12068
);
INSERT INTO `spell_patch`(`entry`,`dbc`,`data`,`comment`) VALUES
    ( '12183','Achievement_Criteria.dbc','2 56','Fix Achi 3855 - need Kill (not XK)')
   ,( '12068','Achievement_Criteria.dbc','2 56','Fix Achi 3850 - need Kill (not XK)')
;
-- by Warlord
REPLACE INTO spell_patch VALUES (64962,'Spell.dbc','87 1','Item - Death Knight T8 DPS Relic-64962 (Update EffectImplicitTargetA2 Fix dummy aura targeting)');

REPLACE INTO spell_patch VALUES (54931,'Spell.dbc','87 1','Glyph of Turn Evil-54931 (Update EffectImplicitTargetA2 )');

REPLACE INTO spell_patch VALUES (54680,'Spell.dbc','87 1','Monstrous Bite-54680 (Update EffectImplicitTargetA2 )');
REPLACE INTO spell_patch VALUES (55495,'Spell.dbc','87 1','Monstrous Bite-55495 (Update EffectImplicitTargetA2 )');
REPLACE INTO spell_patch VALUES (55496,'Spell.dbc','87 1','Monstrous Bite-55495 (Update EffectImplicitTargetA2 )');
REPLACE INTO spell_patch VALUES (55497,'Spell.dbc','87 1','Monstrous Bite-55495 (Update EffectImplicitTargetA2 )');
REPLACE INTO spell_patch VALUES (55498,'Spell.dbc','87 1','Monstrous Bite-55495 (Update EffectImplicitTargetA2 )');
REPLACE INTO spell_patch VALUES (55499,'Spell.dbc','87 1','Monstrous Bite-55495 (Update EffectImplicitTargetA2 )');

REPLACE INTO spell_patch VALUES (55684,'Spell.dbc','87 1','Glyph of Fade-55684 (Update EffectImplicitTargetA2 )');

REPLACE INTO spell_patch VALUES (58669,'Spell.dbc','87 1','Glyph of Rune Strike-58669 (Update EffectImplicitTargetA2 )');

REPLACE INTO spell_patch VALUES (58368,'Spell.dbc','87 1','Glyph of Mortal Strike-58368 (Update EffectImplicitTargetA2 )');

REPLACE INTO spell_patch VALUES (59327,'Spell.dbc','87 1','Glyph of Rune Tap-59327 (Update EffectImplicitTargetA2 )');

REPLACE INTO spell_patch VALUES (14063,'Spell.dbc','87 1','Camouflage-14063 (Update EffectImplicitTargetA2 )');

REPLACE INTO spell_patch VALUES (14910,'Spell.dbc','87 1','Mind Melt-14910 (Update EffectImplicitTargetA2 )');

REPLACE INTO spell_patch VALUES (15327,'Spell.dbc','87 1','Shadow Focus-15327 (Update EffectImplicitTargetA2 )');

REPLACE INTO spell_patch VALUES (28746,'Spell.dbc','87 1','Plagueheart-28746 (Update EffectImplicitTargetA2 )');

REPLACE INTO spell_patch VALUES (34462,'Spell.dbc','88 1','Catlike Reflexes-34462 (Update EffectImplicitTargetA3 )');
REPLACE INTO spell_patch VALUES (34464,'Spell.dbc','88 1','Catlike Reflexes-34464 (Update EffectImplicitTargetA3 )');
REPLACE INTO spell_patch VALUES (34465,'Spell.dbc','88 1','Catlike Reflexes-34465 (Update EffectImplicitTargetA3 )');

REPLACE INTO spell_patch VALUES (56812,'Spell.dbc','87 1','Glyph of Garrote-56812 (Update EffectImplicitTargetA2 )');

REPLACE INTO spell_patch VALUES (56814,'Spell.dbc','87 1 88 1','Glyph of Ghostly Strike-56814 (Update EffectImplicitTargetA2 EffectImplicitTargetA3 )');

REPLACE INTO spell_patch VALUES (61205,'Spell.dbc','87 1','Glyph of Frostfire-61205 (Update EffectImplicitTargetA2 )');

REPLACE INTO spell_patch VALUES (63329,'Spell.dbc','87 1','Glyph of Shield Wall-63329 (Update EffectImplicitTargetA2 )');

REPLACE INTO spell_patch VALUES (67164,'Spell.dbc','87 1','Item - Mage T9 2P Bonus-67164 (Update EffectImplicitTargetA2 )');

REPLACE INTO spell_patch VALUES (67186,'Spell.dbc','87 1','Item - Paladin T9 Tank 2P Bonus-67186 (Update EffectImplicitTargetA2 )');

REPLACE INTO spell_patch VALUES (67231,'Spell.dbc','87 1','Item - Warlock T9 4P Bonus-67231 (Update EffectImplicitTargetA2 )');

REPLACE INTO spell_patch VALUES (67234,'Spell.dbc','87 1','Item - Warrior T9 Melee 2P Bonus-67234 (Update EffectImplicitTargetA2 )');

REPLACE INTO spell_patch VALUES (49226,'Spell.dbc','87 1','Nerves of Cold Steel-49226 (Update EffectImplicitTargetA2 )');
REPLACE INTO spell_patch VALUES (50137,'Spell.dbc','87 1','Nerves of Cold Steel-50137 (Update EffectImplicitTargetA2 )');
REPLACE INTO spell_patch VALUES (50138,'Spell.dbc','87 1','Nerves of Cold Steel-50138 (Update EffectImplicitTargetA2 )');

REPLACE INTO spell_patch VALUES (46865,'Spell.dbc','88 1','Strength of Arms-46865 (Update EffectImplicitTargetA3 )');
REPLACE INTO spell_patch VALUES (46866,'Spell.dbc','88 1','Strength of Arms-46866 (Update EffectImplicitTargetA3 )');

REPLACE INTO spell_patch VALUES (65917,'Spell.dbc','71 0 72 0','Magic Rooster-65917 (Update Effect1 Effect2 )');
