/*Queries that provide answers to the questions from all projects.*/

SELECT*FROM animals WHERE name LIKE '%mon%';
SELECT*FROM animals WHERE neutered=TRUE AND escape_attempts<3;
SELECT name,date_of_birth  FROM animals WHERE name='Agumon' OR name='Pikachu';
SELECT name,escape_attempts FROM animals WHERE weight_kg>10.5;
SELECT*FROM animals WHERE neutered=TRUE;