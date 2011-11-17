-- Spell bonus data
-- Lifebloom
UPDATE `spell_bonus_data` SET `direct_bonus`= 0.8 WHERE `entry`= 33763;

DELETE FROM `spell_bonus_data` WHERE entry IN (30451, 51963, 52042, 52752, 54158, 56161, 58621, 64844, 64085);
INSERT INTO `spell_bonus_data`
    (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`)
VALUES
    -- Gargoyle Strike
    (51963, 0, 0, 0.33, 0,'Gargoyle Strike'),
    -- Healing Stream Totem
    (52042, 0, 0, 0, 0,'Healing Stream Totem'),
    -- Ancestral Awakening
    (52752, 0, 0, 0, 0,'Ancestral Awakening'),
    -- Judgement
    (54158, 0, 0, 0, 0,'Judgement'),
    -- Glyph of  Prayer of Healing
    (56161, 0, 0, 0, 0,'Glyph of Prayer of Healing'),
    -- Glyph of Chains of Ice (it's correct, but bonus value is simple)
    (58621, 0, 0, 0.08, 0, 'Glyph of Chains of Ice'),
    -- Priest - Divine Hymn
    (64844, 0.564, 0, 0, 0, 'Priest - Divine Hymn'),
	-- Priest - Vampiric Touch Dispel
    (64085, 2.4, 0, 0, 0, 'Priest - Vampiric Touch Dispel');

-- by Inquisitor
INSERT INTO `spell_bonus_data`(`entry`,`direct_bonus`,`dot_bonus`,`ap_bonus`,`ap_dot_bonus`,`comments`) VALUES
    -- Item 12632 (Storm Gauntlets), proc aura 16615 (Add Lightning Dam - Weap 03), procced spell 16614 (Lightning Strike)
    ( '16614','0','0','0','0','Item - Storm Gauntlets - Lightning Strike')
;

-- by Warlord
DELETE FROM `spell_bonus_data` WHERE entry IN (7294,467);
INSERT INTO `spell_bonus_data`(`entry`,`direct_bonus`,`dot_bonus`,`ap_bonus`,`ap_dot_bonus`,`comments`) VALUES 
(467, 0.033, 0, 0, 0,'Druid - Thorns'),
(7294, 0.033, 0, 0, 0,'Paladin - Retribution Aura');

REPLACE INTO spell_bonus_data(entry, direct_bonus, dot_bonus, ap_bonus, ap_dot_bonus, comments) VALUES
(2947, 0.033, 0, 0, 0, 'Warlock - Fire Shield (Imp)'),
(16614, 0, 0, 0, 0, 'Item - Storm Gauntlets - Lightning Strike'),
(16827, 0, 0, 0.3, 0, 'Claw (Rank 1)-Hunter pet hack'),
(17253, 0, 0, 0.3, 0, 'Bite (Rank 1)-Hunter pet hack'),
(35290, 0, 0, 0.3, 0, 'Gore (Rank 1)-Hunter pet hack'),
(45055, 0, 0, 0, 0, 'Item - Timbal''s Focusing Crystal'),
(49966, 0, 0, 0.3, 0, 'Smack(Rank 1)-Hunter pet hack'),
(50256, 0, 0, 0.3, 0, 'Swipe(Rank 1)-Hunter pet hack'),
(50271, 0, 0, 0.3, 0, 'Tendon Rip(Rank 1)-Hunter pet hack'),
(50518, 0, 0, 0.3, 0, 'Ravage (Rank 1)-Hunter pet hack'),
(50541, 0, 0, 0.3, 0, 'Snatch (Rank 1))-Hunter pet hack'),
(54680, 0, 0, 0.3, 0, 'Monstrous Bite-Hunter pet hack'),
(56626, 0, 0, 0.3, 0, 'Sting-Hunter pet hack'),
(57386, 0, 0, 0.3, 0, 'Stampede (Rank 1)-Hunter pet hack'),
(59881, 0, 0, 0.3, 0, 'Rake (Rank 1)-Hunter pet hack'),
(60488, 0, 0, 0, 0, 'Item - Extract of Necromatic Power');
