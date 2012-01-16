-- npc on transport use transMap column (hack)
ALTER TABLE creature
    CHANGE `transActive` `transMap` mediumint(10) default '0' NOT NULL;