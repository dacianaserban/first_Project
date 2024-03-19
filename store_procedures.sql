
CREATE PROCEDURE SelectAllPatients
AS
SELECT * FROM patients
GO;

EXEC SelectAllPatients;



CREATE PROCEDURE SelectAllHospitalizedPatients @date_of_admission date
AS
SELECT * FROM patients WHERE date_of_admission = @date_of_admission
GO;

EXEC SelectAllHospitalizedPatients WHERE @date_of_admission = '03/12/2024';



CREATE PROCEDURE CertainPatients @doctors_id integer, @wards_id integer
AS
SELECT * FROM patients WHERE doctors_id = @doctors_id AND wards_id = @wards_id
GO;

EXEC CertainPatients WHERE @doctors_id = '1100', @wards_id = '00001';
EXEC CertainPatients WHERE @doctors_id = '1300', @wards_id = '00003';



CREATE PROCEDURE SelectAllDischargedPatients @date_of_discharge date
AS
SELECT * FROM patients WHERE date_of_discharge = @date_of_discharge
GO;

EXEC SelectAllDischargedPatients WHERE @date_of_discharge IS NOT NULL;
EXEC SelectAllDischargedPatients WHERE @date_of_discharge BETWEEN '04/01/2024' AND '03/08/2024';



CREATE PROCEDURE SelectAllDoctors
AS
SELECT * FROM doctors
GO;

EXEC SelectAllDoctors;



CREATE PROCEDURE SelectCertainDoctors @gender character(1) CHECK (gender = 'M' OR gender = 'F')
AS
SELECT * FROM doctors WHERE gender = @gender
GO;

EXEC SelectCertainDoctors WHERE @gender = 'M';
EXEC SelectCertainDoctors WHERE @gender = 'F';



CREATE PROCEDURE SelectSeniorityDoctors @doctors_seniority_id integer
AS
SELECT * FROM doctors WHERE doctors_seniority_id = @doctors_seniority_id
GO;

EXEC SelectAttenPhysDoctors WHERE @doctors_seniority_id = 3;
EXEC SelectAttenPhysDoctors WHERE @doctors_seniority_id = 1; 




CREATE PROCEDURE SelectDoctorsOfWards @wards_id integer
AS 
SELECT * FROM doctors WHERE wards_id = @wards_id
GO;

EXEC SelectDoctorsOfWards WHERE @wards_id = '00004';
EXEC SelectDoctorsOfWards WHERE @wards_id = '00001';



CREATE PROCEDURE SelectAllNurses
AS
SELECT * FROM nurses
GO;

EXEC SelectAllNurses;



CREATE PROCEDURE CertainNurses @age integer, @gender character(1) CHECK (gender = 'M' OR gender = 'F')
AS
SELECT * FROM nurses WHERE age = @age AND gender = @gender
GO;

EXEC CertainNurses WHERE @age (BETWEEN 20 AND 50) AND @gender = 'F';
EXEC CertainNurses WHERE (@age > 24 AND @age < 50) AND @gender = 'M';



CREATE PROCEDURE SelectNursesSeniority @nurses_seniority_id integer
AS
SELECT * FROM nurses WHERE nurses_seniority_id = @nurses_seniority_id
GO;

EXEC SelectNursesSeniority WHERE @nurses_seniority_id = 1;
EXEC SelectNursesSeniority WHERE @nurses_seniority_id = 2;




CREATE PROCEDURE SelectAllStretcher_bearers
AS
SELECT * FROM stretcher_bearers
GO;

EXEC SelectAllStretcher_bearers;




CREATE PROCEDURE SelectAllStretcher_bearersNames @last_name varchar(60) NOT NULL
AS
SELECT first_name, last_name FROM stretcher_bearers 
WHERE last_name = @last_name
GO;

EXEC SelectAllStretcher_bearersNames WHERE @last_name LIKE 'a%';
EXEC SelectAllStretcher_bearersNames WHERE @last_name LIKE '%in';
EXEC SelectAllStretcher_bearersNames WHERE @last_name LIKE '%ri%';




CREATE PROCEDURE SelectTheBestDoctors @raiting varchar(2) NOT NULL
AS
SELECT * FROM doctors WHERE raiting = @raiting
GO;

EXEC SelectTheBestDoctors WHERE @raiting = '10';



CREATE PROCEDURE SelectAllEmployeesWithSalaryIncreases
@increase boolean CHECK (increase = 1 OR increase = 0)
AS
SELECT * FROM employees WHERE increase = @increase
GO;

EXEC SelectAllEmployeesWithSalaryIncreases WHERE @increase = '1';



CREATE PROCEDURE SelectAllCleaners
AS
SELECT * FROM cleaners
GO;

EXEC SelectAllCleaners;



CREATE PROCEDURE SelectCertainCleaners 
@gender character(1) CHECK (gender = 'M' OR gender = 'F'),
@wards_id integer
AS
SELECT * FROM cleaners WHERE gender = @gender AND wards_id = @wards_id
GO;

EXEC SelectCertainCleaners WHERE @gender LIKE 'M' 
AND (@wards_id = '00001' OR wards_id = '00003' OR wards_id = '00004');

EXEC SelectCertainCleaners WHERE @gender LIKE 'F'
AND (@wards_id = '00001' OR wards_id = '00002' wards_id = '00003' OR wards_id = '00004');











