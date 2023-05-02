/*Queries that provide answers to the questions from all projects.*/

SELECT*FROM animals WHERE name LIKE '%mon%';
SELECT*FROM animals WHERE neutered=TRUE AND escape_attempts<3;