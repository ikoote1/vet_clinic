/* Populate database with sample data.a*/

INSERT INTO animals VALUES (1,'Agumon','2020/02/03',0,TRUE,10.23),(2,'Gabumon','2018/11/15',2,TRUE,8),(3,'Pikachu','2021/01/07',1,FALSE,15.04),(4,'Devimon','2017/05/12',5,TRUE,11);
INSERT INTO animals VALUES (5,'Charmander','2020/08/02',0,FALSE,-11),(6,'Plantmon','2021/11/15',2,TRUE,-5.7),(7,'Squitle','1993/04/02',3,FALSE,-12.13),(8,'Angemon','2005/06/12',1,TRUE,-45),(9,'Boarmon','2005/06/07',7,TRUE,20.4),(10,'Blossom','1998/10/13',3,TRUE,17),(11,'Ditto','2022/05/14',4,TRUE,22);

-- foreign key and JOIN
INSERT INTO owners (name,age) VALUES ('Sam Smith',34),('Jennifer Orwell',19),('Bob',45),('Melody Pond',77),('Dean Winchester',14),('Jodie Whittaker',38);
 INSERT INTO species (name) VALUES ('Pokemon'),('Digimon');
UPDATE animals SET species_id = 2 WHERE name LIKE '%mon%';
 UPDATE animals SET owner_id = 1 WHERE name='Agumon';
UPDATE animals SET owner_id = 2 WHERE (name='Gabumon') OR (name='Pikachu')
 UPDATE animals SET owner_id=3 WHERE (name='Devimon') OR (name='Plantmon');
 UPDATE animals SET owner_id = 4 WHERE (name='Charmander') OR (name='Squitle') OR (name='Blossom');
 UPDATE animals SET owner_id = 5 WHERE (name='Angemon') OR (name='Boarmon');

--  RELATIONSHIPS
INSERT INTO vets (name,age,date_of_graduation) VALUES ('William Tatcher',45,'2000/04/23'),('Maisy Smith',26,'2019/01/17'),('Stephanie Mendez',64,'1981/05/04'),('Jack Harkness',38,'2008/01/08');

-- Insert the following data for the vets
INSERT INTO vets(name,age,date_of_graduation)
VALUES('William Tatcher', 45, '2000-04-23') 
,('Maisy Smith', 26,  '2019-01-17'),
('Stephanie Mendez', 64,  '1981-05-04'),
('Jack Harkness', 38,  '2008-06-08');


-- Insert data for the specializations
INSERT INTO specializations(vets_id,species_id) VALUES ('1', '1'),('3', '1'),('3', '2'),('4', '2');

-- Insert the following data for visits

INSERT INTO visits(animals_id, vets_id, date_of_visit)
VALUES
	('20', '1', date '2020-05-24'),
	('20', '3', date '2020-07-22'),
	('21', '4', date '2021-02-02'),
	('22', '2', date '2020-01-05'),
	('22', '2', date '2020-03-08'),
	('22', '2', date '2020-05-14'),
	('23', '3', date '2021-05-04'),
	('24', '4', date '2021-02-24'),
	('25', '2', date '2019-12-21'),
	('25', '1', date '2020-08-10'),
	('25', '2', date '2021-04-07'),
	('26', '3', date '2019-09-29'),
	('27', '4', date '2020-10-03'),
	('27', '4', date '2020-11-04'),
	('28', '2', date '2019-01-24'),
	('28', '2', date '2019-05-15'),
	('28', '2', date '2020-02-27'),
	('28', '2', date '2020-08-03'),
	('29', '3', date '2020-05-24'),
	('29', '1', date '2021-01-11');