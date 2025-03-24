# Hospital Management System

A comprehensive database solution for managing patient records, doctor appointments, medical treatments, and billing operations in healthcare facilities.

## About

This SQL-based hospital management system is designed to streamline healthcare administration processes. The system provides efficient management of:
- Patient registration and medical records
- Doctor schedules and specialties
- Medical treatments and diagnoses
- Billing and payment tracking

Built using a relational database system, it offers robust querying capabilities for various healthcare management needs.

## Database Structure

The system consists of the following core tables:

### Patients
- Stores patient demographics (name, date of birth, gender)
- Contact information (address, phone number)
- Insurance details

### Doctor
- Contains doctor profiles (name, contact information)
- Specialization details
- Availability information

### Appointments
- Tracks scheduled patient-doctor meetings
- Includes date, time, and status
- Links to both Patients and Doctor tables

### Treatments
- Records medical diagnoses
- Stores treatment details
- Maintains relationships with Patients and Doctor tables

### Billing
- Manages financial transactions
- Tracks payment status (paid, overdue)
- Links to patient records

## Features

### Patient Management
- Search patients by demographic criteria
- View complete patient histories
- Manage insurance information

### Appointment Scheduling
- Book new appointments
- View upcoming appointments
- Check appointment status
- Manage doctor schedules

### Medical Records
- Record diagnoses and treatments
- Track treatment history
- View patient medical summaries

### Billing System
- Generate invoices
- Track payment status
- Identify overdue accounts
- Financial reporting

## Getting Started

### Prerequisites
- MS SQL

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/hospital-management.git
