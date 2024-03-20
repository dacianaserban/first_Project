
SELECT MIN(age) AS f_minimum_age
FROM patients 
WHERE gender LIKE 'F';

SELECT MAX(age) AS m_maximum_age
FROM patients
WHERE gender LIKE 'M';

SELECT COUNT(*) AS number_of_patients
FROM patients;

SELECT COUNT(gender)
FROM patients
WHERE gender LIKE 'M';

SELECT COUNT(*) AS [Number of patients], wards_id
FROM patients
GROUP BY wards_id
HAVING age < 60;

SELECT SUM(age)/COUNT(*) AS avg_age
FROM patients;

SELECT * FROM patients
WHERE age > (SELECT AVG(age) FROM patients);

SELECT AVG(age) AS average_age, wards_id
FROM patients
GROUP BY wards_id;



SELECT MIN(age) AS d_minimum_age, wards_id
FROM doctors
GROUP BY wards_id;

SELECT MAX(age) AS d_maximum_age, wards_id
FROM doctors
GROUP BY wards_id;

SELECT COUNT(*) AS number_of_doctors
FROM doctors;

SELECT COUNT(gender)
FROM patients
WHERE gender LIKE 'F';

SELECT COUNT(last_name)
FROM doctors
WHERE age > 30 AND gender LIKE 'F';

SELECT COUNT(*) AS [Number of doctors], wards_id
FROM doctors
GROUP BY wards_id;

SELECT SUM(age)/COUNT(*) AS avg_age
FROM doctors;

SELECT AVG(age) AS average_age
FROM doctors 
WHERE gender LIKE 'M';



SELECT COUNT(*) AS number_of_nurses
FROM nurses;

SELECT COUNT(*) AS [Number of nurses], wards_id
FROM nurses
GROUP BY wards_id;

SELECT MIN(age) AS min_age
FROM nurses
WHERE nurses_seniority_id = 1;

SELECT MIN(age) AS min_age
FROM nurses
WHERE nurses_seniority_id = 2;

SELECT MAX(age) AS max_age
FROM nurses
WHERE nurses_seniority_id = 1;

SELECT MAX(age) AS max_age
FROM nurses
WHERE nurses_seniority_id = 2;

SELECT SUM(age)/COUNT(*) AS avg_age
FROM nurses;

SELECT AVG(age) AS average_age
FROM nurses
WHERE gender LIKE 'F';



SELECT MAX(age)
FROM stretcher_bearers
WHERE age < 50 AND gender LIKE 'M';

SELECT MIN(age)
FROM stretcher_bearers
WHERE age > 57 AND (wards_id = '00001' 0R wards_id = '00003' 0R wards_id = '00004');

SELECT MAX(age) AS max_age
FROM stretcher_bearers
WHERE wards_id = '00002' OR wards_id = '00003';

SELECT MIN(age) AS min_age
FROM stretcher_bearers
WHERE gender LIKE 'M';

SELECT COUNT(*) AS number_of_stretcher_bearers
FROM stretcher_bearers;

SELECT COUNT(DISTINCT age) 
FROM stretcher_bearers
WHERE age > 40;

SELECT COUNT(*) AS [Number of stretcher-bearers], wards_id
FROM stretcher_bearers
GROUP BY wards_id
HAVING gender LIKE 'F';

SELECT SUM(age)/COUNT(*) AS avg_age
FROM stretcher_bearers;

SELECT * FROM stretcher_bearers
WHERE age > (SELECT AVG(age) FROM stretcher_bearers);



SELECT MAX(age) AS max_age
FROM cleaners
WHERE gender LIKE 'F';

SELECT MIN(age) AS min_age
FROM cleaners
WHERE gender LIKE 'M;'

SELECT COUNT(*) AS number_of_cleaners
FROM cleaners;

SELECT COUNT(*) AS [Number of cleaners], wards_id
FROM cleaners
GROUP BY wards_id;

SELECT SUM(age)/COUNT(*) AS avg_age
FROM nurses;

SELECT AVG(age) AS avg_age,
COUNT(*) AS number_of_cleaners,
MIN(age) AS min_age, MAX(age) AS max_age,
SUM(age) AS total
FROM cleaners;













