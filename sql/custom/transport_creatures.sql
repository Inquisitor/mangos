ALTER TABLE creature
    ADD COLUMN transActive mediumint(10) NOT NULL DEFAULT 0 AFTER orientation;