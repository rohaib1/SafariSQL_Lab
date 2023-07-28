--MVP
-- TASK 1 // Query to find The names of the animals in a given enclosure

SELECT name FROM animals WHERE enclosure_id = 2;

    -- OR SELECTING BY NAME

SELECT animals.name FROM animals 
INNER JOIN enclosures 
ON animals.enclosure_id = enclosures.id 
WHERE enclosures.name = 'Pond';

-- TASK 2 // Query to find The names of the staff working in a given enclosure

SELECT staffs.name FROM staffs
INNER JOIN assignments 
ON staffs.id = assignments.employeeId
WHERE enclosureId = 1;

-- EXTENSION TASKS 
-- Task 3 - The names of staff working in enclosures which are closed for maintenance
SELECT DISTINCT staffs.name FROM staffs
INNER JOIN assignments 
ON staffs.id = assignments.employeeId
INNER JOIN enclosures
ON enclosures.id = assignments.enclosureId
WHERE enclosures.closedForMaintenance = 't';

CHECK THIS ONE!!!!!!!!!



-- TASK 4 - The name of the enclosure where the oldest animal lives. If there are two animals who are the same age choose the first one alphabetically.
SELECT * FROM enclosures 
INNER JOIN animals
ON animals.enclosure_id = enclosures.id
ORDER BY animals.age DESC, animals.name ASC 
LIMIT 1;

name of enclosure = Bird hideout

--TASK 5 - The number of different animal types a given keeper has been assigned to work with.
SELECT COUNT(DISTINCT animals.type) FROM animals
INNER JOIN enclosures 
ON enclosures.id = animals.enclosure_id
INNER JOIN assignments
ON assignments.enclosureId = enclosures.id
INNER JOIN staffs
ON staffs.id = assignments.employeeId
WHERE staffs.id = 1;

answer = Captian Rik works with 4 different types of animals:

--TASK 6 - The number of different keepers who have been assigned to work in a given enclosure
SELECT COUNT(DISTINCT staffs.name) FROM staffs
INNER JOIN assignments
ON staffs.id = assignments.employeeId
WHERE assignments.enclosureId = 1;

answer = 2
    -- Captain Rik and Captain Sparrow have been assigned to work in The Lion's lair)

--TASK 7 - The names of the other animals sharing an enclosure with a given animal (eg. find the names of all the animals sharing the big cat field with Tony)
SELECT roommates.name FROM animals
INNER JOIN enclosures 
ON animals.enclosure_id = enclosures.id
INNER JOIN animals AS roommates
ON enclosures.id = roommates.enclosure_id
WHERE animals.id = 1
AND roommates.id != 1;

gives back Leo 
    --Leo shares the catfield with Tony.
