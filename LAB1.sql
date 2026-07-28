CREATE DATABASE panchayat;
USE panchayat;
CREATE TABLE citizen(citizen_id INT PRIMARY KEY,full_name VARCHAR(100) NOT NULL , date_of_birth DATE NOT NULL,gender VARCHAR(10) NOT NULL,mobile_number VARCHAR(25) UNIQUE ,occupation VARCHAR(50) NOT NULL,village_name VARCHAR(500) NOT NULL,is_active BOOLEAN NOT NULL);
INSERT INTO citizen values(101 Ravi Kumar 1995-06-15 Male 9876500001 Farmer Ramapuram TRUE,102 Lakshmi Devi 1988-11-22 Female 9876500002 Tailor Ramapuram TRUE,103 Suresh Babu 1992-03-10 Male 9876500003 Shopkeeper Seethampeta TRUE);