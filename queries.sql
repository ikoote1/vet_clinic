SELECT*FROM animals WHERE name LIKE '%mon%';
SELECT* FROM animals WHERE date_of_birth between '2016-12-31' AND '2019-01-01';
SELECT*FROM animals WHERE neutered=TRUE AND escape_attempts<3;
SELECT name,date_of_birth  FROM animals WHERE name='Agumon' OR name='Pikachu';
SELECT name,escape_attempts FROM animals WHERE weight_kg>10.5;
SELECT*FROM animals WHERE neutered=TRUE;
SELECT*FROM animals WHERE name NOT IN ('Gabumon');
SELECT* FROM animals WHERE (weight_kg>10.4 OR weight_kg=10.4) AND (weight_kg=17.3 OR weight_kg<17.3);

-- Transaction and updated
UPDATE animals SET species = 'unspecified';
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon%';
UPDATE animals SET species = 'pokemon' WHERE species NOT IN ('digimon');
 DELETE FROM animals;
 DELETE FROM animals WHERE date_of_birth > '2022-01-01';
 SAVEPOINT SPP;
 UPDATE animals SET weight_kg = weight_kg-1;
 ROLLBACK TO SAVEPOINT SPP;
 UPDATE animals SET weight_kg = weight_kg*-1 WHERE weight_kg<0;