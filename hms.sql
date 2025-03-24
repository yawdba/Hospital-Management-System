CREATE TABLE Patients
(patient_id INT, patient_fname VARCHAR(25), patient_lname VARCHAR(25), date_of_birth DATE, 
gender VARCHAR(10), contact_number VARCHAR(10), patient_address VARCHAR(25), insurance_details VARCHAR(25))

INSERT INTO Patients (patient_id, patient_fname, patient_lname, date_of_birth, gender, contact_number, patient_address, insurance_details)
VALUES 
('110', 'John', 'Doe', '1985-07-15', 'Male', '555-1234', '123 Main St, Springfield', 'Aetna Health Insurance'),
('111', 'Jane', 'Smith', '1990-03-22', 'Female', '555-5678', '456 Elm St, Shelbyville', 'Blue Cross Blue Shield'),
('112', 'Alice', 'Johnson', '1978-11-05', 'Female', '555-8765', '789 Oak St, Capital City', 'Cigna Health Insurance'),
('113', 'Bob', 'Brown', '1982-09-30', 'Male', '555-4321', '321 Pine St, Ogdenville', 'UnitedHealthcare');



CREATE TABLE Doctor
(doctor_id INT, doc_fname VARCHAR(25), doc_lname VARCHAR(25), specialization VARCHAR(25), 
contact_number VARCHAR(10), email VARCHAR(25), doc_availability VARCHAR(25))

INSERT INTO Doctor (doctor_id, doc_fname, doc_lname, specialization, contact_number, email, doc_availability)
VALUES 
('220', 'Emily', 'Carter', 'Cardiologist', '555-1111', 'emily.carter@hospital.com', 'Mon-Fri, 9 AM - 5 PM'),
('221', 'Michael', 'Lee', 'Neurologist', '555-2222', 'michael.lee@hospital.com', 'Mon-Wed, 10 AM - 6 PM'),
('222', 'Sarah', 'Adams', 'Pediatrician', '555-3333	', 'sarah.adams@hospital.com', 'Tue-Thu, 8 AM - 4 PM'),
('223', 'David', 'Brown', 'Orthopedic Surgeon', '555-4444', 'david.brown@hospital.com', 'Mon-Fri, 11 AM - 7 PM');



CREATE TABLE Appointments 
(appointment_id INT, patient_id INT, doctor_id INT,
appointment_date DATE, appointment_time VARCHAR(10), app_status VARCHAR(15))

INSERT INTO Appointments (appointment_id, patient_id, doctor_id, appointment_date, appointment_time, app_status)
VALUES 
('520', '111', '220', '2023-10-15', '10:00 AM', 'Scheduled'),
('521', '113', '222', '2023-10-18', '09:30 AM', 'Canceled'),
('522', '110', '221', '2023-10-17', '02:00 PM', 'Scheduled'),
('523', '112', '223', '2023-10-16', '11:00 AM', 'Completed'),
('524', '111', '222', '2023-05-15', '10:00 AM', 'Scheduled'),
('525', '113', '220', '2023-08-18', '09:30 AM', 'Canceled'),
('526', '110', '223', '2023-11-15', '02:00 PM', 'Scheduled'),
('527', '112', '221', '2023-10-11', '11:00 AM', 'Completed');



CREATE TABLE Treatments 
(treatment_id INT, patient_id  INT, doctor_id INT,
diagnosis VARCHAR(40), treatment_details VARCHAR(50), treatment_date DATE)

INSERT INTO Treatments (treatment_id, patient_id, doctor_id, diagnosis, treatment_details, treatment_date)
VALUES 
('660', '111', '220', 'High Blood Pressure', 'Prescribed medication and diet plan', '2023-10-15'),
('661', '113', '222', 'Fractured Arm', 'Cast applied and painkillers prescribed', '2023-10-18'),
('662', '110', '221', 'Migraine', 'Prescribed painkillers and rest', '2023-10-17'),
('663', '112', '223', 'Common Cold', 'Prescribed cough syrup and rest', '2023-10-16');


CREATE TABLE Prescriptions 
(prescription_id INT, patient_id INT, doctor_id INT, medication_name VARCHAR(30),
dosage VARCHAR(30), refills VARCHAR(30), date_prescribed DATE)

INSERT INTO Prescriptions (prescription_id, patient_id, doctor_id, medication_name, dosage, refills, date_prescribed)
VALUES 
('760', '111', '220', 'Lisinopril', '10mg', '2', '2023-10-15'),
('761', '113', '222', 'Ibuprofen', '400mg', '1', '2023-10-18'),
('762', '110', '221', '	Dextromethorphan', '15mg', '1', '2023-10-17'),
('763', '112', '223', 'Acetaminophen', '500mg', '3', '2023-10-16');



CREATE TABLE Billing 
(bill_id INT, patient_id INT, total_amount DECIMAL, 
payment_status VARCHAR(15), date_issued DATE)

INSERT INTO Billing (bill_id, patient_id, total_amount, payment_status, date_issued)
VALUES 
('880', '111', '150.00', 'Paid', '2023-10-15'),
('881', '113', '300.00', 'Overdue', '2023-10-18'),
('882', '110', '200.00', 'Pending', '2023-10-17'),
('883', '112', '75.00', 'Paid',  '2023-10-16');



CREATE TABLE Inventory 
(item_id INT, item_name VARCHAR(30), quantity INT,
exp_date DATE, supplier_details VARCHAR(40))

INSERT INTO Inventory (item_id, item_name, quantity, exp_date, supplier_details)
VALUES 
('909', 'Ibuprofen', '100', '2024-12-31', 'PharmaSupplies Inc.'),
('919', 'Lisinopril', '50', '2025-06-30', 'MedCorp Ltd.'),
('929', 'Acetaminophen', '200', '2024-10-15', 'HealthPlus Distributors'),
('939', 'Dextromethorphan', '75', '2024-08-20',  'PharmaSupplies Inc.');



--Which female patients live at '456 Elm St, Shelbyville'?
SELECT patient_id, patient_fname, patient_lname, date_of_birth, gender, contact_number, patient_address, insurance_details
FROM Patients 
WHERE gender = 'female' and patient_address = '456 Elm St, Shelbyville';


--Which appointments are currently scheduled, showing both patient and doctor information?
SELECT Patients.patient_id, patient_fname, patient_lname, Doctor.doctor_id, doc_fname, doc_lname, appointment_date, appointment_time, app_status
FROM Patients, Doctor, Appointments
WHERE Doctor.doctor_id = Appointments.doctor_id 
and Patients.patient_id = Appointments.patient_id
and app_status = 'Scheduled'


--Which doctors specialize in cardiology?
SELECT doctor_id, doc_fname, doc_lname, specialization, contact_number, email
from Doctor
where specialization = 'Cardiologist';


--How many appointments does each doctor have?
SELECT count(appointment_id) as total_appointments, Doctor.doctor_id, doc_fname, doc_lname
from Doctor, Appointments
where Appointments.doctor_id = Doctor.doctor_id
group by Doctor.doctor_id, doc_fname, doc_lname


--Which patients have appointments with Dr. Carter?
SELECT Patients.patient_id, patient_fname, patient_lname, Doctor.doctor_id, doc_fname, doc_lname, appointment_id, appointment_date, appointment_time
from Patients, Doctor, Appointments
where Appointments.doctor_id = Doctor.doctor_id 
and Patients.patient_id = Appointments.patient_id
and doc_lname = 'Carter'


--What treatments have been administered to patients, including both patient and doctor information?
SELECT treatment_id, Patients.patient_id, patient_fname, patient_lname, Doctor.doctor_id, doc_fname, doc_lname, diagnosis, treatment_details, treatment_date
from Patients, Doctor, Treatments
where Patients.patient_id = Treatments.patient_id
and Doctor.doctor_id = Treatments.doctor_id


--Which patients have overdue bills?
SELECT Patients.patient_id, patient_fname, patient_lname, date_of_birth, gender, contact_number, patient_address, insurance_details, 
bill_id, total_amount, payment_status, date_issued
from Patients, Billing
where Patients.patient_id = Billing.patient_id
and payment_status = 'Overdue'