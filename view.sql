

CREATE VIEW [patients and their doctors] AS
SELECT patients.first_name, patients.last_name, 
patients.diagnostic, doctors.first_name, doctors.last_name
FROM patients AS p
INNER JOIN doctors AS d
ON p.wards_id = d.wards_id;

SELECT * FROM [patients and their doctors];

SELECT patients.last_name, diagnostic 
FROM [patients and their doctors]
ORDER BY patients.last_name;



CREATE VIEW icu_employees AS
SELECT hospital_wards.wards_name, doctors.first_name, 
doctors.last_name, doctors_levels_of_seniority.doctors_seniority AS dls,
FROM hospital_wards AS hw
INNER JOIN doctors AS d
ON hw.id = d.wards_id
INNER JOIN dls
ON d.doctors_seniority = dls.id
WHERE hw.wards_name = 'Intensive Care Unit';

SELECT * FROM icu_employees;


CREATE VIEW nurses_seniority_information AS
SELECT nurses.first_name, nurses.last_name AS n,
nurses_levels_of_seniority.nurses_seniority AS nls
FROM n
INNER JOIN nls
ON n.nurses_seniority_id = nls.id;

SELECT * FROM nurses_seniority_information;


CREATE VIEW patients_feedback AS
SELECT patients.first_name, patients.last_name AS p,
doctors_raiting_patients.raiting AS drp,
doctors.first_name, doctors.last_name AS d
FROM p
RIGHT JOIN drp
ON p.id = drp.patients_id
INNER JOIN d
ON drp.doctors_id = d.id;

SELECT * FROM patients_feedback;


CREATE VIEW disinfection_information AS
SELECT disinfection_of_hospital_wards.date_of_disinfection AS dhw,
cleaners.first_name AS c, c.last_name,
hospital_wards.wards_name AS hw
FROM dhw 
INNER JOIN c
ON dhw.cleaners_id = c.id
INNER JOIN hw
ON c.wards_id = hw.id
WHERE date_of_disinfection BETWEEN 'O2/01/2024' AND '03/20/2024'
ORDER BY date_of_disinfection DESC;


SELECT * FROM disinfection_information;

SELECT cleaners.last_name, hospital_wards.wards_name
FROM cleaners AS c
INNER JOIN hospital_wards AS hw
ON c.wards_id = hw.id;

CREATE VIEW disinfection_ck_info AS
SELECT evidence_of_disinfection.date_of_disinfection,
evidence_of_disinfection.disinfection_checking,
hospital_wards.wards_name, cleaners.first_name,
cleaners.last_name FROM evidence_of_disinfection AS ed 
INNER JOIN hospital_wards AS hw
ON ed.wards_id = hw.id
INNER JOIN cleaners AS c
ON hw.id = c.wards_id
ORDER BY date_of_disinfection DESC;

ALTER TABLE disinfection_ck_info
ADD dismissed varchar(10) CHECK(dismissed = 'Yes' OR dismissed = 'No');

UPDATE disinfection_ck_info
SET dismissed = 'No'
WHERE disinfection_checking = 'Wrong'
OR disinfection_checking = NULL;

SELECT first_name , last_name, evidence_of_disinfection,
dismissed FROM disinfection_ck_info
WHERE disinfection_checking = 'Wrong';









