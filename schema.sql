/* Database schema to keep the structure of entire database. */

create database vet_clinic;

create table animals (id integer, name varchar, date_of_birth date, escape_attempts integer, neutered boolean, weight_kg decimal);
