UPDATE achievement_criteria_requirement set value1=3277 where criteria_id=3880 AND type =6;

DELETE FROM achievement_criteria_requirement where criteria_id=1824;
UPDATE achievement_criteria_requirement set type=5 where value1 in (23333, 23335);

DELETE FROM achievement_criteria_requirement where criteria_id in (7625, 7628);
INSERT INTO achievement_criteria_requirement (criteria_id, type, value1, value2) VALUES
(7629, 5, 52418, 0),
(7625, 1, 28781, 0),
(7628, 1, 28781, 0);

INSERT INTO creature_loot_template (entry, item, ChanceOrQuestChance, mincountOrRef, maxcount) VALUES
(22690, 18228, 2, 1, 1),
(22665, 18228, 2, 1, 1),
(22674, 18228, 2, 1, 1),
(22666, 18228, 2, 1, 1),
(22735, 18228, 2, 1, 1),
(32091, 18228, 2, 1, 1),
(31983, 18228, 2, 1, 1),
(31981, 18228, 2, 1, 1),
(32094, 18228, 2, 1, 1),
(31960, 18228, 2, 1, 1),
(37412, 18228, 2, 1, 1),
(37302, 18228, 2, 1, 1),
(37300, 18228, 2, 1, 1),
(37415, 18228, 2, 1, 1),
(37278, 18228, 2, 1, 1);
