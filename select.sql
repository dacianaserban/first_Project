SELECT * FROM patients;

SELECT * FROM patients 
WHERE gender = 'M' AND wards_id = '00004'

SELECT * FROM patients
WHERE gender = "F" AND (age > 20 OR last_name LIKE 'a%');

SELECT * FROM patients
WHERE last_name LIKE '%cu';

SELECT * FROM patients 
WHERE first_name LIKE 'a%';

SELECT * FROM patients
WHERE doctors_id = '1100' AND gender = 'M';

SELECT * FROM patients 
WHERE date_of_discharge IS NULL;

SELECT * FROM patients
WHERE age BETWEEN 20 AND 57;

SELECT TOP 3 * FROM patients;

SELECT TOP 50 PERCENT * FROM patients;

SELECT * FROM patients
WHERE doctors_id IN ('1100', '1200');

SELECT * FROM patients
GROUP BY doctors_id;

SELECT first_name, last_name,
FROM patients
WHERE wards_id = '00001' AND date_of_discharge IS NOT NULL;

SELECT first_name, last_name, diagnostic, date_of_admission
FROM patients
WHERE doctors_id = '1100' AND  age > 50;





SELECT DISTINCT * FROM doctors;

SELECT * FROM doctors
WHERE age <> 27;

SELECT * FROM doctors 
ORDER BY age DESC;

SELECT * FROM doctors 
WHERE gender LIKE 'M';
ORDER BY last_name;

SELECT * FROM doctors 
WHERE gender LIKE 'F';
ORDER BY last_name;

SELECT last_name, first_name FROM doctors
WHERE last_name LIKE '%escu'
ORDER BY last_name;

SELECT last_name, first_name FROM doctors
WHERE last_name LIKE '%l%'
ORDER BY last_name;

SELECT last_name, first_name FROM doctors
WHERE last_name LIKE 's___%'
ORDER BY last_name;

SELECT last_name, first_name FROM doctors
WHERE last_name LIKE '[acd]%'
ORDER BY last_name DESC;

SELECT first_name, last_name, doctors_seniority
GROUP BY doctors_seniority;

SELECT last_name FROM doctors
WHERE last_name LIKE '[a-g]%'
ORDER BY last_name;

SELECT phone_number, wards_id
FROM patients
UNION
SELECT phone_number, wards_id
FROM doctors
ORDER BY wards_id;

SELECT first_name, last_name
FROM doctors
WHERE doctors_id = ANY
 (SELECT doctors_id FROM patients);

SELECT doctors.first_name AS fn_doctors, doctors.last_name AS ln_doctors,
doctors.wards_id, patients.first_name AS fn_patients, 
patients.last_name AS ln_patients
FROM doctors
INNER JOIN patients
ON doctors.wards_id = patients.wards_id;





SELECT * FROM hospital_wards;

SELECT * FROM hospital_wards
WHERE wards_name LIKE '%ology'
ORDER BY wards_name;





SELECT * FROM nurses;

SELECT * FROM nurses
WHERE nurses_seniority = 'Practical Nurse'
ORDER BY last_name;

SELECT * FROM nurses
WHERE nurses_seniority = 'Registered Nurse'
ORDER BY last_name;

SELECT * FROM nurses
GROUP BY gender
ORDER BY last_name;

SELECT * FROM nurses
WHERE gender LIKE 'M'
GROUP BY wards_id;
ORDER BY last_name DESC;

SELECT * FROM nurses
WHERE gender LIKE 'F' AND (age BETWEEN 25 AND 60)
ORDER BY age;

SELECT first_name, last_name, wards_id, nurses_seniority
FROM nurses
GROUP BY wards_id
ORDER BY last_name;

SELECT first_name, last_name, wards_id
FROM nurses
WHERE first_name LIKE '%a'
ORDER BY first_name DESC;




SELECT * FROM stretcher_bearers;

SELECT * FROM stretcher_bearers
WHERE gender LIKE 'F'
ORDER BY age;

SELECT * FROM stretcher_bearers
WHERE gender LIKE 'M'
ORDER BY last_name;

SELECT * FROM stretcher_bearers
GROUP BY wards_id
ORDER BY last_name DESC;

SELECT ALL last_name 
FROM stretcher_bearers
WHERE age > 40
ORDER BY age;

SELECT first_name, last_name, wards_id
FROM stretcher_bearers
WHERE gender LIKE 'F' AND ( age BETWEEN 20 AND 60)
GROUP BY wards_id
ORDER BY age DESC;

SELECT first_name, last_name, wards_id
FROM stretcher_bearers
WHERE gender LIKE 'M' AND (wards_id = '00001' OR wards_id = '00004')
GROUP BY wards_id
ORDER BY last_name;

SELECT first_name, last_name, age
FROM stretcher_bearers
WHERE first_name LIKE '%a'
GROUP BY age;





SELECT * FROM doctors_raiting_patients;

SELECT raiting, doctors_id
FROM doctors_raiting_patients
GROUP BY doctors_id
ORDER BY raiting DESC;

SELECT patients_id, doctors_id
FROM doctors_raiting_patients
WHERE raiting LIKE '10'
ORDER BY patients_id;

SELECT doctors.first_name, doctors.last_name
FROM doctors
INNER JOIN doctors_raiting_patients AS drp
ON doctors.patients_id = drp.patients_id;

SELECT patients.first_name, patients.last_name
FROM patients
INNER JOIN doctors_raiting_patients AS dp
ON patients.patients_id = dp.patients_id;

SELECT raiting, doctors_id
FROM doctors_raiting_patients
WHERE raiting BETWEEN 7 AND 9
GROUP BY doctors_id
ORDER BY raiting DESC;






SELECT * FROM employees;

SELECT * FROM employees
WHERE compensation NOT LIKE '1';

SELECT doctors_id 
FROM employees
WHERE compensation = '1';
ORDER BY doctors_id DESC;

SELECT nurses_id 
FROM employees
WHERE compensation = '1';
ORDER BY nurses_id DESC;

SELECT stretcher_bearers_id 
FROM employees
WHERE compensation = '1';
ORDER BY stretcher_bearers DESC;

SELECT cleaners_id 
FROM employees
WHERE compensation = '1';
ORDER BY cleaners_id DESC;





SELECT * FROM disinfection_of_hospital_wards;

SELECT * FROM disinfection_of_hospital_wards
ORDER BY date_of_disinfection DESC;

SELECT date_of_disinfection
FROM disinfection_of_hospital_wards
WHERE wards_id LIKE '00003';

SELECT wards_id, date_of_disinfection
FROM disinfection_of_hospital_wards
WHERE cleaners_id LIKE '40000';

SELECT cleaners_id, wards_id
FROM disinfection_of_hospital_wards
WHERE date_of_disinfection BETWEEN '02/14/2024' AND '03/16/2024'
ORDER BY wards_id DESC;

SELECT cleaners.first_name, cleaners.last_name
FROM cleaners
INNER JOIN disinfection_of_hospital_wards AS dhw
ON cleaners.wards_id = dhw.wards_id
ORDER BY cleaners.last_name;






SELECT * FROM cleaners;

SELECT first_name, last_name, wards_id
FROM cleaners
WHERE gender LIKE 'F'
GROUP BY wards_id
ORDER BY last_name DESC;

SELECT first_name, last_name
FROM cleaners
WHERE first_name LIKE '%a%'
ORDER BY last_name DESC;

SELECT first_name, last_name, age, wards_id
WHERE gender LIKE 'F' AND (age BETWEEN 26 AND 66)
GROUP BY wards_id
ORDER BY age;s






SELECT * FROM evidence_of_disinfection;

SELECT wards_id, date_of_disinfection
FROM evidence_of_disinfection
WHERE disinfection_checking LIKE 'Wrong';
ORDER BY date_of_disinfection DESC;

SELECT wards_id
FROM evidence_of_disinfection
WHERE disinfection_checking LIKE 'Correct';





