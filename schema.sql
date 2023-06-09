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
CREATE TABLE specializations (vets_id BIGINT REFERENCES vets(id), species_id BIGINT REFERENCES species(id));
CREATE TABLE visits(animals_id BIGINT REFERENCES animals(id), vets_id BIGINT REFERENCES vets(id), date_of_visit DATE NOT NULL);

-- Nomalization and indexes
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

/* Add ndex for tables */
CREATE INDEX idx_animals_id ON visits (animals_id);
CREATE INDEX idx_vets_id ON visits (vets_id);
CREATE INDEX idx_owner_id ON animals (owner_id);
CREATE INDEX idx_species_id ON animals (species_id);
CREATE INDEX idx_vets_id ON specializations (vets_id);
CREATE INDEX idx_species_id ON specializations (species_id);
CREATE INDEX idx_name ON owners (name);
CREATE INDEX idx_emails ON owners (email);