DELETE FROM `command` WHERE `name` IN ('instance getdata', 'instance setdata');
INSERT INTO `command`(`name`, `security`, `help`)
VALUES ('instance getdata', '3', 'Syntax: .instance getdata #data_type_id\r\n\r\nDisplay instance save data with ID specified.');
INSERT INTO `command`(`name`, `security`, `help`)
VALUES ('instance setdata', '3', 'Syntax: .instance setdata #data_type_id #value\r\n\r\Set value of instance save data with ID specified.');
