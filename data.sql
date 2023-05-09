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
INSERT INTO specializations (vets_id,species_id) VALUES (1,1),(3,1),(3,2),(4,2);
INSERT INTO visits(animals_id, vets_id, date_of_visit) VALUES 
(5,1,'2020/05/24'),(5,3,'2020/07/22'),(6,4,'2021/02/02'),(9,2,'2020/01/05'),(9,2,'2020/03/08'),
(9,2,'2020/05/14'),(7,3,'2021/05/04'),(3,4,'2021/02/24'),(1,2,'2019/12/21'),(1,1,'2020/08/10'),
(1,2,'2021/04/07'),(4,3,'2019/09/29'),(2,4,'2020/10/03'),(2,4,'2020/11/04'),(8,2,'2019/01/24'),
(8,2,'2019/05/15'),(8,2,'2020/02/27'),(8,2,'2020/08/03'),(10,3,'2020/05/24'),(10, 1,'2021/01/11');


-- practice
CREATE TABLE Projects( ID INT PRIMARY KEY IDENTITY,Name VARCHAR(100),Value DECIMAL(5,2),StartDate DATE,EndDate DATE)

CREATE TABLE Employees(ID INT PRIMARY KEY IDENTITY,FirstName VARCHAR(50),LastName VARCHAR(50),HourlyWage DECIMAL(5,2),HireDate DATE)
CREATE TABLE ProjectEmployees(ID INT PRIMARY KEY IDENTITY,ProjectID INT,EmployeeID INT,Hours DECIMAL(5,2),CONSTRAINT FK_ProjectEmployees_Projects FOREIGN KEY(ProjectID) REFERENCES  Projects(ID),CONSTRAINT FK_ProjectEmployees_Employees FOREIGN KEY(EmployeeID) REFERENCES  Employees(ID))

CREATE TABLE JobOrders(ID INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,EmployeeID INT,ProjectID INT,Description TEXT,OrderDateTime DATETIME,Quantity INT,Price DECIMAL(5,2),CONSTRAINT FK_JobOrders_Projects FOREIGN KEY(ProjectID) REFERENCES Projects(ID),CONSTRAINT F_JobOrders_Employees FOREIGN KEY(EmployeeID) REFERENCES Employees(ID))
CREATE TABLE Customers (Name VARCHAR(100),Industry VARCHAR(100),Project1_ID INT,Project1_Feedback TEXT,Project2_ID INT,Project2_Feedback TEXT,ContactPersonID INT,ContactPersonAndRole VARCHAR(255),PhoneNumber VARCHAR(12),Address VARCHAR(255),City VARCHAR(255),Zip VARCHAR(5))
ALTER TABLE Customers DROP COLUMN Project1_ID, COLUMN Project1_Feedback;
ALTER TABLE Customers DROP COLUMN Project2_ID
ALTER TABLE Customers DROP COLUMN project2_feedback

CREATE TABLE ProjectFeedback(ID INT PRIMARY KEY IDENTITY,ProjectID INT,CustomerID INT,Feedback TEXT,CONSTRAINT FK_ProjectFeedbacks_Projects FOREIGN KEY (ProjectID) REFERENCES  Projects(ID),CONSTRAINT FK_ProjectFeedbacks_Customers FOREIGN KEY (CustomerID) REFERENCES  Customers(ID))

-- normalization
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

insert into owners (name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';


