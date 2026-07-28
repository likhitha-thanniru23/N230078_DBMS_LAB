CREATE DATABASE gram_panchayath_db;
USE gram_panchayath_db;
CREATE TABLE citizen (
  citizen_id INT PRIMARY KEY,
  full_name VARCHAR(100) NOT NULL,
  date_of_birth DATE NOT NULL,
  gender VARCHAR(10) NOT NULL,
  phone_number VARCHAR(15) UNIQUE NOT NULL,
  occupation VARCHAR(50),
  village_name VARCHAR(50) NOT NULL,
  is_active BOOLEAN NOT NULL
);

INSERT INTO citizen (citizen_id, full_name, date_of_birth, gender, phone_number, occupation, village_name, is_active)
VALUES
  (101, 'ravi kumar', '1995-06-23', 'male', '8885376200', 'farmer', 'addanki', TRUE),
  (102, 'KRISHNA', '1987-06-09', 'MALE', '976987398', 'TEACHER', 'HYD', TRUE),
  (103, 'SURYA', '1998-09-28', 'MALE', '798987899', 'farmer', 'addanki', TRUE),
  (104, 'LIKHITHA', '2007-11-23', 'Female', '7901257027', 'student', 'HYD', TRUE),
  (105, 'SHARATH CHANDRA', '2004-03-08', 'Male', '6301927678', 'Student', 'HYD', TRUE),
  (107, 'LAKSHMI', '2008-08-30', 'Female', '809809323', 'student', 'HYD', TRUE);


CREATE TABLE Certificate_Type (
    certificate_type_id INT PRIMARY KEY,
    certificate_name VARCHAR(100) NOT NULL UNIQUE,
    description VARCHAR(200) NOT NULL,
    processing_days INT NOT NULL,
    application_fee DECIMAL(8,2) NOT NULL,
    is_available BOOLEAN NOT NULL
);
INSERT INTO Certificate_Type
(certificate_type_id, certificate_name, description, processing_days, application_fee, is_available)
VALUES
(1, 'Residence Certificate',
 'Certifies the declared place of residence',
 7, 30.00, TRUE),

(2, 'Birth Record Request',
 'Request for a locally maintained birth record',
 5, 20.00, TRUE),

(3, 'Death Record Request',
 'Request for a locally maintained death record',
 5, 20.00, TRUE),

(4, 'Family Member Certificate',
 'Records declared family-member information',
 10, 40.00, TRUE),

(5, 'Property Certificate',
 'Certificate related to locally maintained property records',
 15, 50.00, TRUE),

(6, 'No-Dues Certificate',
 'Indicates applicable local dues status',
 7, 25.00, FALSE);



CREATE TABLE Application (
    application_id INT PRIMARY KEY,
    citizen_id INT NOT NULL,
    certificate_name VARCHAR(100) NOT NULL,
    application_date DATE NOT NULL,
    purpose VARCHAR(200) NOT NULL,
    application_status VARCHAR(30) NOT NULL,
    fee_paid DECIMAL(8,2) NOT NULL,
    reference_number VARCHAR(30) NOT NULL UNIQUE
);
INSERT INTO Application
(application_id, citizen_id, certificate_name, application_date, purpose, application_status, fee_paid, reference_number)
VALUES
(1001, 101, 'Residence Certificate', '2026-07-01', 'Bank account documentation', 'Submitted', 30.00, 'GP20260001'),

(1002, 102, 'Family Member Certificate', '2026-07-02', 'Welfare scheme application', 'Under Review', 40.00, 'GP20260002'),

(1003, 103, 'Property Certificate', '2026-07-03', 'Property documentation', 'Submitted', 50.00, 'GP20260003'),

(1004, 104, 'Residence Certificate', '2026-07-04', 'College admission', 'Approved', 30.00, 'GP20260004'),

(1005, 105, 'No-Dues Certificate', '2026-07-05', 'Local service requirement', 'Under Review', 25.00, 'GP20260005'),

(1006, 106, 'Birth Record Request', '2026-07-06', 'Personal documentation', 'Rejected', 20.00, 'GP20260006');


CREATE TABLE gram_panchayat_office (
    office_id INT PRIMARY KEY,
    office_name VARCHAR(100) NOT NULL,
    village_name VARCHAR(50) NOT NULL,
    pincode VARCHAR(6) NOT NULL,
    contact_number VARCHAR(15) UNIQUE,
    office_email VARCHAR(100) UNIQUE,
    opening_time TIME NOT NULL,
    is_operational BOOLEAN NOT NULL
);
INSERT INTO gram_panchayat_office
(office_id, office_name, village_name, pincode, contact_number, office_email, opening_time, is_operational)
VALUES
(1, 'Ramapuram Gram Panchayat', 'Ramapuram', '521101', '0866000001', 'ramapuram@gp.example', '09:00:00', TRUE),

(2, 'Seethampeta Gram Panchayat', 'Seethampeta', '521102', '0866000002', 'seethampeta@gp.example', '09:30:00', TRUE),

(3, 'Lakshmipuram Gram Panchayat', 'Lakshmipuram', '521103', '0866000003', 'lakshmipuram@gp.example', '09:00:00', TRUE),

(4, 'Krishnapuram Gram Panchayat', 'Krishnapuram', '521104', '0866000004', 'krishnapuram@gp.example', '10:00:00', TRUE),

(5, 'Venkatapuram Gram Panchayat', 'Venkatapuram', '521105', '0866000005', 'venkatapuram@gp.example', '09:30:00', TRUE),

(6, 'Gopalapuram Gram Panchayat', 'Gopalapuram', '521106', '0866000006', 'gopalapuram@gp.example', '09:00:00', FALSE);

INSERT INTO Citizen
(citizen_id, full_name,date_of_birth, gender, occupation,village_name, phone_number,is_active)
VALUES
(110, 'Rahul Kumar','1979-3-4', 'Male', 'Teacher','hyd', '9876543210',TRUE);
INSERT INTO Certificate_Type
(certificate_type_id, certificate_name, description, processing_days, application_fee, is_available)
VALUES
(10, 'No-Due Certificate',
 'Indicates applicable local dues status',
 7, 25.00, FALSE);
UPDATE Application
SET  application_status = 'Under Review'
WHERE application_id = 1001;
UPDATE Application
SET  application_status = 'Approved'
WHERE application_id = 1002;
UPDATE Citizen
SET occupation = 'Electrical Technician'
WHERE citizen_id = 105;
UPDATE Certificate_Type
SET processing_days = 12
WHERE certificate_name = 'Property Certificate';
UPDATE Certificate_Type
SET is_available = TRUE
WHERE certificate_name = 'No-Dues Certificate';
DELETE FROM Citizen
WHERE citizen_id = 107;
ALTER TABLE Citizen
ADD address VARCHAR(255);

ALTER TABLE Application
ADD issued_date DATE;
ALTER TABLE Application
MODIFY purpose VARCHAR(500);
ALTER TABLE gram_panchayat_Office 
ADD closing_time TIME;
SELECT * FROM citizen;
SELECT * FROM Certificate_Type;
SELECT * FROM Application;
 