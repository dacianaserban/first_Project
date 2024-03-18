
ALTER TABLE employees
ADD increase_value integer, salary integer;

CREATE OR REPLACE TRIGGER display_updated_salary
BEFRORE DELETE OR INSERT OR UPDATE 
ON employees
FOR EACH ROW
WHEN (increase = '1')
DECLARE
   updated_salary integer;
BEGIN
   updated_salary := :increase_value + :OLD.salary;
   dbms_output.put_line('Old salary: ' || :OLD.salary); 
   dbms_output.put_line('Increase: ' || increase_value); 
   dbms_output.put_line('Updated salary: ' || updated_salary); 
END; 
/ 


UPDATE employees
SET salary = '8000'
WHERE doctors_id = '1100';

UPDATE employees
SET salary = '7000'
WHERE doctors_id = '1300';

UPDATE employees
SET salary = '9000'
WHERE doctors_id = '1400';

UPDATE employees
SET salary = '10000'
WHERE doctors_id = '1401';

UPDATE employees
SET increase_value = '500'
WHERE doctors_id = '1100' 
OR doctors_id = '1300' 
OR doctors_id = '1400' 
OR doctors_id ='1401';

INSERT INTO doctors (first_name, last_name, phone_number, gender, age, patients_id, wards_id, doctors_seniority_id) 
VALUES ('Irinel', 'Pancea', '0770926781', 'M', '65', '010', '00001', '3');

DELETE * FROM employees
WHERE doctors_id = 8;



