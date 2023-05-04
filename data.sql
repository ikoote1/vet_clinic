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