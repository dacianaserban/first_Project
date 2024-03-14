

INSERT INTO patients (first_name, last_name, age, gender, phone_number, doctors_id, wards_id, diagnostic, date_of_admission, date_of_discharge)
VALUES ('Angela', 'Popa', '57', 'F', '0772456783', '1100', '00001', 'Heart Attack', '03/12/2024'),
        ('John', 'Mars', '25', 'M', '0712389046', '1201', '00002', 'Epilepsy', '03/08/2024'),
        ('Helen', 'Hilton', '75', 'F', '07238786566', '1201', '00002', 'Stroke', '03/15/2024'),
        ('Bill', 'Wilson', '39', 'M', '0712330893', '1101', '00001', 'Poisoning', '03/12/2024'),
        ('Jackson', 'Smith', '50', 'M', '0777236790', '1300', '00003', 'Arhythmia', '03/06/2024', '03/08/2024'),
        ('Marina', 'Enescu', '89', 'F', '0771189056', '1300', '00003', 'Cardiomyopathy', '03/01/2024', '03/13/2024'),
        ('Bogdan', 'Lascu', '29', 'M', '0712557908', '1400', '00004', 'Hypothermia', '01/01/2024', '01/18/2024'),
        ('Andreea', 'Nicolaescu', '33', 'F', '0726880916', '1401', '00004', 'Sudden cardiac arrest', '01/05/2024', '02/02/2024' ),
        ('Martina', 'Lopez', '20', 'F', '0712907689', '1100', '00001', 'Trauma from road accident', '02/15/2024', '03/29/2024'),
        ('Anthony', 'Scarllet', '55', 'M', '0712678904', '1100', '00001', 'Allergic reaction', '03/10/2024', '04/01/2024');

INSERT INTO doctors (first_name, last_name, phone_number, gender, age, patients_id, wards_id, doctors_seniority_id) 
VALUES ('Cristian', 'Andreescu', '0761289027', 'M', '45', '010', '00001', 'Attending Physician'),
       ('Cristian', 'Andreescu', '0761289027', 'M', '45', '012', '00001', 'Attending Physician'),
       ('Cristian', 'Andreescu', '0761289027', 'M', '45', '013', '00001', 'Attending Physician'),
       ('Alin', 'Dinulescu', '0788904537', 'M', '27', '011', '00001', ' Resident'),
       ('Silviu', 'Galin', '0716782390', 'M','60', '020', '00002' 'Department Head'),
       ('Silviu', 'Galin', '0716782390', 'M','60', '021', '00002' 'Department Head'),
       ('Camil', 'Stoicescu', '0719056781', 'M', '63','030', '00003', 'Medical Director'),
       ('Camil', 'Stoicescu', '0719056781', 'M', '63','031', '00003', 'Medical Director'),
       ('Natacha', 'Cristescu', '0723245670', 'F', '35', '040', '00004', 'Fellow'),
       ('Amelia', 'Sorescu', '0720678230', 'F', '55', '041', '00004', 'Attending Physician');


INSERT INTO hospital_wards (wards_name)
VALUES ('Intensive Care Unit'),
        ('Neurology'),
        ('Cardiology'),
        ('Emergency');

INSERT INTO doctors_levels_of_seniority (doctors_seniority)
VALUES ('Resident'),
       ('Fellow'),
       ('Attending Physician'),
       ('Department Head'),
       ('Medical Director');

INSERT INTO nurses_levels_of_seniority (nurses_seniority)
VALUES ('Registered Nurse'),
        ('Practical Nurse'),

INSERT INTO nurses (first_name, last_name, phone_number, gender, age, wards_id, nurses_seniority_id)
VALUES ('Adela', 'Colcea', '0712678904', 'F', '42', '00001', 'Practical Nurse'),
       ('Simona', 'Patcu', '0728906789', 'F', '48', '00001', 'Practical Nurse'),
       ('Lucian', 'Gatcu', '0729906329', 'M', '24', '00001', 'Registered Nurse'),
       ('Carmina', 'Belc', '0738996735', 'F', '39', '00002', 'Registered Nurse'),
       ('Darian', 'Paulescu', '0725679074', 'M', '55', '00002', 'Registered Nurse'),
       ('Cosmin', 'Grusc', '0745678901', 'M', '25', '00003', 'Registered Nurse'),
       ('Ionel', 'Damsa', '0726547892', 'M', '53', '00003' 'Practical Nurse'),
       ('Ariana', 'Fando', '0789027866', 'F', '60', '00004', 'Practical Nurse'),
       ('Dariana', 'Tanes', '0719070821', 'F', '50', '00004', 'Practical Nurse'),
       ('Paul', 'Dancu', '0707852941', 'M', '30', '00004', 'Registered Nurse');

INSERT INTO stretcher_bearers (first_name, last_name, gender, age, phone_number, wards_id)
VALUES ('Angel', 'Cristoiu', 'M', '29', '0723897657', '00001'),
       ('Narcisa', 'Adescu', 'F', '33', '0728679054', '00001'),
       ('Carmen', 'Mariescu', 'F', '56', '0727895631', '00001'),
       ('Eduard', 'Pap', 'M', '64', '0779098674', '00001'),
       ('Gianina', 'Tuts', 'F', '55', '0726890567', '00002'),
       ('Lorena', 'Dance', 'F', '25', '0782765904', '00002'),
       ('Claudiu', 'Damaschin', 'M', '56', '0726458902', '00003'),
       ('Robert', 'Petrescu', 'M', '46', '0723489515', '00003'),
       ('Clara', 'Aposta', 'F', '63', '0726458902', '00004'),
       ('Diana', 'Lenu', 'F', '41', '0753118790', '00004');

INSERT INTO doctors_rating_patients (patients_id, raiting, doctors_id)
VALUES ('010', '10', '1100'),
        ('011', '7', '1101'),
        ('020', '10', '1201'),
        ('021', '8', '1201'),
        ('030', '10','1300'),
        ('031', '9','1300'),
        ('040', '9','1400'),
        ('041', '10','1401');

INSERT INTO employees (doctors_id, compensation)
VALUES ('1100', '1'),
       ('1101', '0'),
       ('1201', '0'),
       ('1300', '1'),
       ('1400', '1'),
       ('1401', '1');

INSERT INTO employess (nurses_id, compensation)
VALUES ('10', '0'),
       ('11', '0'),
       ('12', '1'),
       ('20', '1'),
       ('21', '1'),
       ('30', '0'),
       ('31', '1'),
       ('40', '0'),
       ('41', '1'),
       ('42', '1');



 INSERT INTO employees (stretcher_bearers_id, compensation)
 VALUES ('1000', '1'),
        ('1001', '0'),
        ('1002', '1'),
        ('1003', '1'),
        ('2000', '0'),
        ('2001', '1'),
        ('3000', '0'),
        ('3001', '1'),
        ('4000', '1'),
        ('4001', '0');
 
 INSERT INTO employees (cleaners_id, compensation)
 VALUES ('10000', '1'),
        ('10001', '0'),
        ('20000', '1'),
        ('20001', '1'),
        ('30000', '0'),
        ('30001', '1'),
        ('40000', '0'),
        ('40001', '1');

 
INSERT INTO disinfection_of_hospital_wards (cleaners_id, wards_id, date_of_disinfection)
VALUES ('10000', '00001', '01/08/2024 08:00:00'),
       ('10001', '00001', '01/08/2024 20:00:00'),
       ('20000', '00002', '02/14/2024 08:00:00'),
       ('20001', '00002', '02/14/2024 20:00:00'),
       ('30000', '00003', '03/18/2024 08:00:00'),
       ('30001', '00003', '03/18/2024 20:00:00'),
       ('40000', '00004', '03/28/2024 08:00:00'),
       ('40001', '00004', '03/28/2024 20:00:00');

INSERT INTO cleaners (first_name, last_name, phone_number, gender, age, wards_id)
VALUES ('Claudia', 'Pasca', '0712456783', 'F', '45', '00001'),
       ('Mihai', 'Anghel', '07125789037', 'M', '25', '00001'),
       ('Florina', 'Enchea', '0711654834', 'F', '63', '00002'),
       ('Giulia', 'Anton', '0726458927', 'F', '56', '00002'),
       ('Simina', 'Stan', '0712567754', 'F', ' 29', '00003'),
       ('Liviu', 'Roman', '0723654980', 'M', '59', '00003'),
       ('Diana', 'Ginc', '0726547893', 'F', '63', '00004'),
       ('Luciana', 'Tutcan', '0714527649', 'F', '50', '00004');

INSERT INTO evidence_of_disinfection (disinfection_checking)
VALUES ('Correct'),
       (NULL),
       ('Correct'),
       ('Correct'),
       ('Wrong'),
       ('Correct'),
       ('Wrong'),
       ('Correct');





