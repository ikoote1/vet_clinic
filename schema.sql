/* Database schema to keep the structure of entire database. */

create database vet_clinic;
create table animals (id integer NOT NULL, name varchar NOT NULL, date_of_birth date NOT NULL, escape_attempts integer NOT NULL, neutered boolean NOT NULL, weight_kg decimal NOT NULL);
ALTER TABLE animals ADD COLUMN species varchar;
CREATE TABLE owners(id INT GENERATED ALWAYS AS IDENTITY, name varchar (45) NOT NULL,age INT NOT NULL, PRIMARY KEY(id));
CREATE TABLE species (id INT GENERATED ALWAYS AS IDENTITY, name VARCHAR(45) NOT NULL, PRIMARY KEY(id) );

