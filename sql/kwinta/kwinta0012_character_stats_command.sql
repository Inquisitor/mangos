DELETE FROM `command` WHERE `name` IN ('character stats');
INSERT INTO `command` (`name`, `security`, `help`)
VALUES ('character stats', '2', 'Syntax: .character stats\n\nDisplay targeted character\'s current stats. If no character is selected, then display your current stats.');
