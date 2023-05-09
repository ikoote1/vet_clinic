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
  SELECT COUNT(*),species.name FROM animals FULL JOIN species ON species.id=animals.species_id GROUP BY species.name;
  SELECT animals.name, date_of_birth, owner_id,owners.name,species_id,species.name FROM animals JOIN owners ON owners.id=animals.owner_id JOIN species ON species.id = animals.species_id WHERE (species.name = 'Digimon') AND (owners.name = 'Jennifer Orwell');
  SELECT animals.name, date_of_birth,escape_attempts, owner_id,owners.name FROM animals JOIN owners ON owners.id=animals.owner_id WHERE (animals.escape_attempts = 0) AND (owners.name = 'Dean Winchester');
   SELECT COUNT(*),owners.name FROM animals JOIN owners ON owners.id=animals.owner_id GROUP BY owners.name;


-- RELATIONSHIPS

SELECT animals.name FROM animals INNER JOIN visits ON animals.id=visits.animals_id WHERE vets_id =1 ORDER BY visits.date_of_visit DESC limit 1;
SELECT COUNT(*) FROM animals JOIN visits ON visits.animals_id=animals.id WHERE vets_id=3;
 SELECT * FROM vets FULL JOIN specializations ON vets.id = specializations.vets_id JOIN species ON species.id = specializations.species_id ORDER BY vets.id;
SELECT * FROM animals JOIN visits ON visits.animals_id = animals.id WHERE vets_id=3 AND visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

-- What animal has the most visits to vets?-- 
SELECT animals.name,COUNT(animals_id)
 FROM animals INNER JOIN visits ON animals.id=visits.animals_id 
 GROUP BY animals.name 
 ORDER BY COUNT(animals_id)  DESC 
 limit 1;

-- Who was Maisy Smith's first visit?
SELECT * FROM animals JOIN visits ON visits.animals_id = animals.id WHERE vets_id=2 ORDER BY visits.date_of_visit ASC limit 1;

-- Details for most recent visit: animal information, vet information, and date of visit.
 FROM animals,vets,species,visits WHERE animals.id = visits.animals_id AND 
 animals.species_id=species.id AND vets.id = visits.vets_id ORDER BY visits.date_of_visit DESC limit 1;

-- How many visits were with a vet that did not specialize in that animal's species?
SELECT vets.name, COUNT(visits.animals_id) 
FROM visits JOIN vets ON vets.id = visits.vets_id 
WHERE vets_id = 2 
GROUP BY vets.name;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT species.name, COUNT(animals.species_id) 
FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vets_id JOIN species ON species.id = animals.species_id
 WHERE vets.name = 'Maisy Smith' 
 GROUP BY species.name 
 ORDER BY COUNT(animals.species_id) DESC
 LIMIT 1;


-- normalization and index
SELECT COUNT(*) FROM visits where animal_id = 4;
SELECT * FROM visits where vet_id = 2;
SELECT * FROM owners where email = 'owner_18327@mail.com';