DROP TABLE IF EXISTS assignments;
DROP TABLE IF EXISTS staffs;
DROP TABLE IF EXISTS animals;
DROP TABLE IF EXISTS enclosures;

CREATE TABLE enclosures (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    capacity INT,
    closedForMaintenance BOOLEAN
);

CREATE TABLE animals (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    type VARCHAR(255),
    age INT,
    enclosure_id INT REFERENCES enclosures(id)
);

CREATE TABLE staffs (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    employeeNumber INT
);

CREATE TABLE assignments (
    id SERIAL PRIMARY KEY,
    employeeId INT REFERENCES staffs(id),
    enclosureId INT REFERENCES enclosures(id),
    day VARCHAR 
);

INSERT INTO enclosures (name, capacity, closedForMaintenance) VALUES ('Lions lair', 20, true);
INSERT INTO enclosures (name, capacity, closedForMaintenance) VALUES ('Pond', 20, false);
INSERT INTO enclosures (name, capacity, closedForMaintenance) VALUES ('Bird hideout', 20, false);

INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Tony', 'Tiger', 26, 1);
INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Leo', 'Lion', 25, 1);

INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Fred', 'Goldfish', 22, 2);
INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Nemo', 'Clownfish', 22, 2);

INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Barry', 'Parrot', 59, 3);
INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Callum', 'Crow', 12, 3);

INSERT INTO staffs (name, employeeNumber) VALUES ('Captain Rik', 12345);
INSERT INTO staffs (name, employeeNumber) VALUES ('Captain Jack', 12344);
INSERT INTO staffs (name, employeeNumber) VALUES ('Captain Sparrow', 12340);

INSERT INTO assignments (employeeId, enclosureId, day) VALUES (1, 1, 'Tuesday');
INSERT INTO assignments (employeeId, enclosureId, day) VALUES (2, 2, 'Tuesday');
INSERT INTO assignments (employeeId, enclosureId, day) VALUES (3, 3, 'Tuesday');

INSERT INTO assignments (employeeId, enclosureId, day) VALUES (1, 2, 'Wednesday');
INSERT INTO assignments (employeeId, enclosureId, day) VALUES (2, 2, 'Tuesday');
INSERT INTO assignments (employeeId, enclosureId, day) VALUES (3, 1, 'Tuesday');