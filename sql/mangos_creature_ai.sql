ALTER TABLE creature_ai_scripts
    ADD COLUMN event_requirement_type mediumint(10) NOT NULL DEFAULT 0 AFTER event_chance;

ALTER TABLE creature_ai_scripts
    ADD COLUMN event_requirement_value mediumint(10) NOT NULL DEFAULT 0 AFTER event_requirement_type;