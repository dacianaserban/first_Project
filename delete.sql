
DELETE FROM patients
WHERE id = 11 OR phone_number = '0714578950';

DELETE FROM doctors
WHERE phone_number = '0734567891' AND id = 7;

DELETE FROM nurses
WHERE id = 11 OR phone_number = '0770456789';

DELETE FROM stretcher_bearers
WHERE last_name = 'Constantin' AND id = 11;

DELETE FROM cleaners 
WHERE gender = 'M' AND id = 9;

DELETE FROM disinfection_of_hospital_wards
WHERE cleaners_id = '40001' AND id = 9;