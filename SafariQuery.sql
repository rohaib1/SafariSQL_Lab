-- TASK 1 // Query to find The names of the animals in a given enclosure

SELECT name FROM animals WHERE enclosure_id = 2;

-- TASK 2 // Query to find The names of the staff working in a given enclosure

SELECT staffs.name FROM staffs

INNER JOIN assignments ON staffs.id = assignments.employeeId

WHERE enclosureId = 1;