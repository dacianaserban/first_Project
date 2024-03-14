
UPDATE patients
SET first_name = 'Angela Vanesa', age = '37'
WHERE id = 1;

UPDATE patients
SET diagnostic = 'Rheumatic heart'
WHERE id = 5;



UPDATE doctors
SET phone_number = '0256438290'
WHERE id = 4;

UPDATE doctors
SET age = '59'
WHERE id = 3;

UPDATE doctors
SET last_name = 'Cristescu Popescu'
WHERE id = 5;



UPDATE nurses
SET phone_number = '0256118945'
WHERE id = 8;

UPDATE nurses
SET age = '27'
WHERE id IN (5,6);

UPDATE nurses
SET last_name = 'Patcu Gavor'
WHERE id = 2;



UPDATE stretcher_bearers
SET last_name = 'Anghelescu'
WHERE id = 2;

UPDATE stretcher_bearers
SET phone_number = '0256778934'
WHERE id = 4;

UPDATE stretcher_bearers
SET age = '26'
WHERE id = 8 AND last_name = 'Petrescu';

UPDATE stretcher_bearers
SET first_name = 'Lorena Daiana'
WHERE id = 6 AND last_name = 'Dance';



UPDATE cleaners
SET phone_number = '0256442180'
WHERE id = 7 AND last_name = 'Ginc';

UPDATE cleaners
SET last_name = 'Anton Gavescu'
WHERE id = 4 AND wards_id = '00004';

UPDATE cleaners
SET age = '39'
WHERE id = 5 AND last_name = 'Stan';

UPDATE cleaners
SET first_name = 'Cosmina', last_name = 'Pascalau'
WHERE id = 1;

