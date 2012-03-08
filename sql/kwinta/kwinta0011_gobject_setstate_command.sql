DELETE FROM `command` WHERE `name` IN ('gobject setstate');
INSERT INTO `command`(`name`, `security`, `help`)
VALUES ('gobject setstate', '2', 'Syntax: .gobject setstate #go_guid #state [#time_to_restore]\n\nSet state of gameobject. Can be 0, 1 or 2. Time to restore back to state 0 can be set for states 1 or 2 (in seconds), otherwise default restore time will be used.');
