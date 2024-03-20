

CREATE TABLE IF NOT EXISTS patients(
    id int NOT NULL PRIMARY KEY,
    first_name varchar(60) NOT NULL,
    last_name varchar(60) NOT NULL,
    age integer NOT NULL, 
    gender character(1) CHECK (gender = 'M' OR gender = 'F'),
    phone_number varchar NOT NULL UNIQUE,
    doctors_id integer FOREIGN KEY REFERENCES doctors(id),
    wards_id integer FOREIGN KEY REFERENCES hospital_wards(id),
    diagnostic varchar(60) NOT NULL,
    date_of_admission date NOT NULL,
    date_of_discharge date
);

CREATE TABLE IF NOT EXISTS doctors(
    id int NOT NULL PRIMARY KEY,
    first_name varchar(60) NOT NULL,
    last_name varchar(60) NOT NULL,
    phone_number varchar(17) NOT NULL,
    gender character(1) CHECK (gender = 'M' OR gender = 'F'),
    age integer NOT NULL,
    patients_id integer FOREIGN KEY REFERENCES patients(id),
    wards_id integer FOREIGN KEY REFERENCES hospital_wards(id),
    doctors_seniority_id integer FOREIGN KEY REFERENCES doctors_levels_of_seniority(id)
);

CREATE TABLE IF NOT EXISTS hospital_wards(
    id int NOT NULL PRIMARY KEY,
    wards_name varchar(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS doctors_levels_of_seniority(
    id int NOT NULL PRIMARY KEY,
    doctors_seniority varchar(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS nurses_levels_of_seniority(
    id int NOT NULL PRIMARY KEY,
    nurses_seniority varchar(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS nurses(
    id int NOT NULL PRIMARY KEY,
    first_name varchar(60) NOT NULL,
    last_name varchar(60) NOT NULL,
    phone_number varchar(17) NOT NULL UNIQUE,
    gender character(1) CHECK (gender = 'M' OR gender = 'F'),
    age integer NOT NULL,
    wards_id integer FOREIGN KEY REFERENCES hospital_wards(id),
    nurses_seniority_id integer FOREIGN KEY REFERENCES nurses_levels_of_seniority(id)
);

CREATE TABLE IF NOT EXISTS stretcher_bearers(
    id int NOT NULL PRIMARY KEY,
    first_name varchar(60) NOT NULL,
    last_name varchar(60) NOT NULL,
    gender character(1) CHECK (gender = 'M' OR gender = 'F'),
    age integer NOT NULL,
    phone_number varchar(17) NOT NULL UNIQUE,
    wards_id integer FOREIGN KEY REFERENCES hospital_wards(id)
);

CREATE TABLE IF NOT EXISTS doctors_rating_patients(
    id int NOT NULL PRIMARY KEY,
    patients_id integer FOREIGN KEY REFERENCES patients(id),
    raiting varchar(2) NOT NULL,
    doctors_id integer FOREIGN KEY REFERENCES doctors(id)
);

CREATE TABLE IF NOT EXISTS employees(
    id int NOT NULL PRIMARY KEY,
    doctors_id integer FOREIGN KEY REFERENCES doctors(id),
    nurses_id integer FOREIGN KEY REFERENCES nurses(id),
    stretcher_bearers_id integer FOREIGN KEY REFERENCES stretcher_bearers(id),
    cleaners_id integer FOREIGN KEY REFERENCES cleaners(id),
    increase boolean CHECK (increase = 1 OR increase = 0)
);

CREATE TABLE IF NOT EXISTS disinfection_of_hospital_wards(
    id int NOT NULL PRIMARY KEY,
    cleaners_id integer FOREIGN KEY REFERENCES cleaners(id),
    wards_id integer FOREIGN KEY REFERENCES hospital_wards(id),
    date_of_disinfection datetime NOT NULL
);

CREATE TABLE IF NOT EXISTS cleaners(
    id int NOT NULL PRIMARY KEY,
    first_name varchar(60) NOT NULL,
    last_name varchar(60) NOT NULL,
    phone_number varchar(17) NOT NULL UNIQUE,
    gender character(1) CHECK (gender = 'M' OR gender = 'F'),
    age integer NOT NULL,
    wards_id integer FOREIGN KEY REFERENCES hospital_wards(id)
);



CREATE TABLE patients_of_doctors AS
SELECT id AS doctors_id, id AS patients_ID
FROM doctors
INNER JOIN patients
ON doctors.wards_id = patients.wards_id
GROUP BY doctors_id;

CREATE TABLE doctors_raiting AS
SELECT raiting AS rtng_doctors, doctors_id AS id
FROM doctors_raiting_patients
GROUP BY rtng_doctors
ORDER BY rtng_doctors DESC;

CREATE TABLE evidence_of_disinfection AS
SELECT wards_id AS wards, date_of_disinfection 
FROM disinfection_of_hospital_wards
ORDER BY date_of_disinfection DESC;

CREATE TABLE doctors_increases AS
SELECT doctors_id, increase
FROM employees
ORDER BY increase DESC;

CREATE TABLE nurses_increases AS
SELECT nurses_id, increase
FROM employees
ORDER BY increase DESC;

CREATE TABLE stretcher_bearers_increases AS
SELECT stretcher_bearers_id, increase
FROM employees
ORDER BY increase DESC;

CREATE TABLE cleaners_compensations AS
SELECT cleaners_id, increase
FROM employees
ORDER BY increase DESC;

ALTER TABLE evidence_of_disinfection
ADD disinfection_checking varchar(10) CHECK (disinfection_checking = "Correct" OR disinfection_checking = "Wrong" OR disinfection_checking = NULL);

CREATE TABLE hospitalized_patients AS
SELECT first_name, last_name, wards_id
FROM patients
WHERE date_of_discharge IS NULL
GROUP BY wards_id
ORDER BY last_name;


CREATE TABLE discharged_patients AS
SELECT first_name, last_name, wards_id
FROM patients
WHERE date_of_discharge IS NOT NULL
GROUP BY wards_id
ORDER BY last_name;



