DELETE FROM achievement_criteria_requirement WHERE criteria_id IN (
    5601, 5603, 7408, 7412, 7415, 7418
);
INSERT INTO achievement_criteria_requirement VALUES 
    (7408, 21, 45, 0)
   ,(7412, 21, 42, 0)
   ,(7415, 21, 43, 0)
   ,(7418, 21, 44, 0)
   ,(5601, 5, 23333, 0)
   ,(5603, 5, 23335, 0)
;