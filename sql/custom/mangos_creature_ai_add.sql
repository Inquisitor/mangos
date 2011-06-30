-- Creature Ai Scripts Addition

DROP TABLE IF EXISTS creature_ai_scripts_addition;
CREATE TABLE creature_ai_scripts_addition (
    id int(10) unsigned NOT NULL default 0,
    event_requirement_type mediumint(8) unsigned NOT NULL default 0,
    event_requirement_value mediumint(8) unsigned NOT NULL default 0,
    PRIMARY KEY (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Creature Ai Scripts Addition';
