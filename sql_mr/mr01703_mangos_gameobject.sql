-- Eyes buffs on arenas must have 120 sec respawn
UPDATE gameobject SET spawntimesecs=120 WHERE map in (559, 572, 562, 617, 618) and id in (184664, 184663);