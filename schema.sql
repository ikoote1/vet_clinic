/* Database schema to keep the structure of entire database. */

create database vet_clinic;
create table animals (id integer NOT NULL, name varchar NOT NULL, date_of_birth date NOT NULL, escape_attempts integer NOT NULL, neutered boolean NOT NULL, weight_kg decimal NOT NULL);
ALTER TABLE animals ADD COLUMN species varchar;

-- keys and JOIN
CREATE TABLE owners(id INT GENERATED ALWAYS AS IDENTITY, name varchar (45) NOT NULL,age INT NOT NULL, PRIMARY KEY(id));
CREATE TABLE species (id INT GENERATED ALWAYS AS IDENTITY, name VARCHAR(45) NOT NULL, PRIMARY KEY(id) );
 ALTER TABLE animals DROP COLUMN id;
 ALTER TABLE animals ADD COLUMN id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY;
 ALTER TABLE animals DROP COLUMN species;
  ALTER TABLE animals ADD COLUMN species_id INT, ADD CONSTRAINT fk_species_id FOREIGN KEY(species_id) REFERENCES species(id);
   ALTER TABLE animals ADD COLUMN owner_id INT, ADD CONSTRAINT fk_owner_id FOREIGN KEY(owner_id) REFERENCES owners(id);

--    JOIN and RELATIONSHIPS
CREATE TABLE vets (ID int GENERATED ALWAYS AS INDENITY, name VARCHAR NOT NULL, age INT NOT NULL, date_of_graduation date NOT NULL, PRIMARY KEY(id) );
-- Created table called specializations with many to many relationship with vets and species -- 
CREATE TABLE specializations (
vets_id BIGINT REFERENCES vets (id),
species_id BIGINT REFERENCES species (id)
);

-- Created table called visits with many to many relationship with animals, vets and date of visits--
CREATE TABLE visits (
vets_id BIGINT REFERENCES vets (id),
animals_id BIGINT REFERENCES animals (id),
date_of_visit DATE NOT NULL
);