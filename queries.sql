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

--  calculations
SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts =0;
SELECT AVG(weight_kg) FROM animals;
SELECT MAX(escape_attempts),neutered FROM animals GROUP BY neutered;
SELECT MAX(weight_kg),MIN(weight_kg) FROM animals;
SELECT AVG(escape_attempts) FROM animals WHERE date_of_birth between '1990-12-31' AND '2000-01-01';

-- foreign key and JOIN
 SELECT animals.name,date_of_birth,weight_kg FROM animals JOIN owners ON owners.id = animals.owner_id WHERE owners.name ='Melody Pond';
 SELECT animals.name,date_of_birth,weight_kg,species.name FROM animals JOIN species ON species.id = animals.species_id WHERE species.name ='Pokemon';
 SELECT * FROM animals FULL JOIN owners ON owners.id = animals.owner_id;
  SELECT animals.name, date_of_birth, owner_id,owners.name,species_id,species.name FROM animals JOIN owners ON owners.id=animals.owner_id JOIN species ON species.id = animals.species_id WHERE (species.name = 'Digimon') AND (owners.name = 'Jennifer Orwell');
  
