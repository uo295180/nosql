MATCH (n) DETACH DELETE n;

CREATE (DrPaco:Person:Doctor {name: 'Paco', surname: 'López', age: 55, bloodType: 'O+', gender: 'Male', height: 1.78, weight: 82}),
       (DrJavier:Person:Doctor {name: 'Javier', surname: 'Carrasco', age: 64, bloodType: 'A-', gender: 'Male', height: 1.75, weight: 80}),
       (DrJuana:Person:Doctor {name: 'Juana', surname: 'Juánez', age: 32, bloodType: 'B+', gender: 'Female', height: 1.68, weight: 62}),
       (DrCarmen:Person:Doctor {name: 'Carmen', surname: 'Vega', age: 45, bloodType: 'AB-', gender: 'Female', height: 1.70, weight: 68}),
       (DrRamon:Person:Doctor {name: 'Ramón', surname: 'Pérez', age: 39, bloodType: 'O+', gender: 'Male', height: 1.80, weight: 85}),

       (Pepe:Person:Patient {name: 'Pepe', surname: 'González', age: 34, bloodType: 'O+', gender: 'Male', height: 1.82, weight: 77, ssn: '678-90-1234'}),
       (Maria:Person:Patient {name: 'Maria', surname: 'Rodríguez', age: 27, bloodType: 'O-', gender: 'Female', height: 1.65, weight: 55, ssn: '789-01-2345'}),
       (Pelayo:Person:Patient {name: 'Pelayo', surname: 'Sierra', age: 20, bloodType: 'A-', gender: 'Male', height: 1.75, weight: 70, ssn: '890-12-3456'}),
       (Laura:Person:Patient {name: 'Laura', surname: 'Morales', age: 36, bloodType: 'A-', gender: 'Female', height: 1.68, weight: 63, ssn: '901-23-4567'}),
       (Mario:Person:Patient {name: 'Mario', surname: 'Orviz', age: 89, bloodType: 'AB+', gender: 'Male', height: 1.70, weight: 72, ssn: '012-34-5678'}),
       (Pedro:Person:Patient {name: 'Pedro', surname: 'Suárez', age: 45, bloodType: 'O+', gender: 'Male', height: 1.78, weight: 80, ssn: '123-45-6789'}),
       (Ana:Person:Patient {name: 'Ana', surname: 'García', age: 42, bloodType: 'B+', gender: 'Female', height: 1.60, weight: 58, ssn: '234-56-7890'}),
       (Carlos:Person:Patient {name: 'Carlos', surname: 'Fernández', age: 58, bloodType: 'B+', gender: 'Male', height: 1.75, weight: 85, ssn: '345-67-8901'}),
       (Sofia:Person:Patient {name: 'Sofia', surname: 'Martínez', age: 31, bloodType: 'B-', gender: 'Female', height: 1.63, weight: 50, ssn: '456-78-9012'}),
       (Lucas:Person:Patient {name: 'Lucas', surname: 'Díaz', age: 75, bloodType: 'A-', gender: 'Male', height: 1.72, weight: 68, ssn: '567-89-0123'}),
       (Miguel:Person:Patient {name: 'Miguel', surname: 'Torres', age: 50, bloodType: 'A+', gender: 'Male', height: 1.74, weight: 75, ssn: '999-88-7777'}),

       (Flu:Disease {scientific_name: 'Influenza', cause: 'Virus'}),
       (Diabetes:Disease {scientific_name: 'Diabetes Mellitus', cause: 'Insulin deficiency'}),
       (Asthma:Disease {scientific_name: 'Asthma', cause: 'Inflammation of airways'}),
       (Hypertension:Disease {scientific_name: 'Hypertension', cause: 'High blood pressure'}),
       (Tuberculosis:Disease {scientific_name: 'Mycobacterium tuberculosis', cause: 'Bacterial infection'}),
       (Malaria:Disease {scientific_name: 'Plasmodium', cause: 'Parasite infection'}),
       (Bronchitis:Disease {scientific_name: 'Bronchitis', cause: 'Inflammation of the bronchial tubes'}),
       (Pneumonia:Disease {scientific_name: 'Pneumonia', cause: 'Lung infection'}),

       (A1:Appointment {date: date("2024-12-28")}),
       (A2:Appointment {date: date("2024-12-29")}),
       (A3:Appointment {date: date("2025-01-05")}),
       (A4:Appointment {date: date("2024-12-30")}),
       (A5:Appointment {date: date("2025-01-10")}),
       (A6:Appointment {date: date("2024-12-28")}),
	(A7:Appointment {date: date("2025-01-15")}),
       (A8:Appointment {date: date("2025-01-20")}),
       (A9:Appointment {date: date("2025-01-25")}),
       (A10:Appointment {date: date("2025-02-01")}),
       (A11:Appointment {date: date("2024-12-30")}),
       (A12:Appointment {date: date("2025-01-07")}),
       (A13:Appointment {date: date("2025-01-30")}),
       (A14:Appointment {date: date("2025-02-05")}),
       
       (Antibiotics:Treatment {name: 'Antibiotics', type: 'Medication'}),
       (Inhaler:Treatment {name: 'Inhaler', type: 'Device'}),
       (Insulin:Treatment {name: 'Insulin', type: 'Medication'}),
       (Antihypertensives:Treatment {name: 'Antihypertensives', type: 'Medication'}),
       (Antimalarials:Treatment {name: 'Antimalarials', type: 'Medication'}),


       (Case1:Case {case_id: 'C001', status: 'Open', description: 'Hypertension management'}),
       (Case2:Case {case_id: 'C002', status: 'Open', description: 'Asthma treatment'}),
       (Case3:Case {case_id: 'C003', status: 'Open', description: 'Diabetes follow-up'}),
       (Case4:Case {case_id: 'C004', status: 'Open', description: 'Malaria diagnosis'}),
       (Case5:Case {case_id: 'C005', status: 'Open', description: 'Routine check-up'}),
	   (Case6:Case {case_id: 'C006', status: 'Open', description: 'Regular checkup'}),
       (Case7:Case {case_id: 'C007', status: 'Closed', description: 'Flu symptoms'}),
       (Case8:Case {case_id: 'C008', status: 'Open', description: 'Diabetes control'}),
       (Case9:Case {case_id: 'C009', status: 'Open', description: 'Asthma follow-up'}),
       (Case10:Case {case_id: 'C010', status: 'Pending', description: 'Hypertension check'}),
       (Case11:Case {case_id: 'C011', status: 'Open', description: 'Bronchitis treatment'}),
       (Case12:Case {case_id: 'C012', status: 'Open', description: 'Pneumonia follow-up'}),
	   
       (Pepe)-[:HAS_CASE]->(Case1),
       (Maria)-[:HAS_CASE]->(Case2),
       (Pelayo)-[:HAS_CASE]->(Case3),
       (Laura)-[:HAS_CASE]->(Case4),
       (Pedro)-[:HAS_CASE]->(Case5),
	(Ana)-[:HAS_CASE]->(Case6),
       (Carlos)-[:HAS_CASE]->(Case7),
       (Sofia)-[:HAS_CASE]->(Case8),
       (Lucas)-[:HAS_CASE]->(Case9),
       (Mario)-[:HAS_CASE]->(Case10),
       (Miguel)-[:HAS_CASE]->(Case11),
       (Miguel)-[:HAS_CASE]->(Case12),

       (Case1)-[:ASSIGNED_TO]->(DrPaco),
       (Case2)-[:ASSIGNED_TO]->(DrJuana),
       (Case3)-[:ASSIGNED_TO]->(DrJavier),
       (Case4)-[:ASSIGNED_TO]->(DrPaco),
       (Case5)-[:ASSIGNED_TO]->(DrJuana),
	(Case6)-[:ASSIGNED_TO]->(DrCarmen),
       (Case7)-[:ASSIGNED_TO]->(DrRamon),
       (Case8)-[:ASSIGNED_TO]->(DrPaco),
       (Case9)-[:ASSIGNED_TO]->(DrJuana),
       (Case10)-[:ASSIGNED_TO]->(DrJavier),
       (Case11)-[:ASSIGNED_TO]->(DrJuana),
       (Case12)-[:ASSIGNED_TO]->(DrJuana),

       (Case1)-[:HAS_APPOINTMENT]->(A1),
       (Case2)-[:HAS_APPOINTMENT]->(A3),
       (Case3)-[:HAS_APPOINTMENT]->(A4),
       (Case4)-[:HAS_APPOINTMENT]->(A5),
       (Case5)-[:HAS_APPOINTMENT]->(A2),
	(Case6)-[:HAS_APPOINTMENT]->(A7),
       (Case7)-[:HAS_APPOINTMENT]->(A8),
       (Case8)-[:HAS_APPOINTMENT]->(A9),
       (Case9)-[:HAS_APPOINTMENT]->(A10),
       (Case10)-[:HAS_APPOINTMENT]->(A11),
       (Case1)-[:HAS_APPOINTMENT]->(A12),
       (Case11)-[:HAS_APPOINTMENT]->(A13),
       (Case12)-[:HAS_APPOINTMENT]->(A14),

       (A1)-[:DIAGNOSED]->(Hypertension),
       (A1)-[:DIAGNOSED]->(Diabetes),
       (A3)-[:DIAGNOSED]->(Asthma),
       (A5)-[:DIAGNOSED]->(Malaria),
	   (A7)-[:DIAGNOSED]->(Diabetes),
       (A8)-[:DIAGNOSED]->(Flu),
       (A9)-[:DIAGNOSED]->(Diabetes),
       (A10)-[:DIAGNOSED]->(Asthma),
       (A11)-[:DIAGNOSED]->(Hypertension),
       (A12)-[:DIAGNOSED]->(Hypertension),
       (A13)-[:DIAGNOSED]->(Bronchitis),
       (A14)-[:DIAGNOSED]->(Pneumonia),


       (Case1)-[:REFERRED_TO {reason: 'Specialized hypertension treatment'}]->(DrJavier),
       (Case2)-[:REFERRED_TO {reason: 'Asthma diagnosis confirmation'}]->(DrPaco),
       (Case4)-[:REFERRED_TO {reason: 'Complicated malaria case'}]->(DrJuana),
	   (Case6)-[:REFERRED_TO {reason: 'Diabetes specialist needed'}]->(DrPaco),
       (Case7)-[:REFERRED_TO {reason: 'Flu complications'}]->(DrJuana),
       (Case8)-[:REFERRED_TO {reason: 'Complex diabetes case'}]->(DrJavier),
       (Case10)-[:REFERRED_TO {reason: 'Severe hypertension'}]->(DrCarmen),

       (Hypertension)-[:TREATED_WITH]->(Antihypertensives),
       (Diabetes)-[:TREATED_WITH]->(Insulin),
       (Asthma)-[:TREATED_WITH]->(Inhaler),
       (Tuberculosis)-[:TREATED_WITH]->(Antibiotics),
       (Malaria)-[:TREATED_WITH]->(Antimalarials),
       (Bronchitis)-[:TREATED_WITH]->(Antibiotics),
       (Pneumonia)-[:TREATED_WITH]->(Antibiotics),
       
       (A1)-[:USED_TREATMENT]->(Antihypertensives),
       (A1)-[:USED_TREATMENT]->(Insulin),
       (A3)-[:USED_TREATMENT]->(Inhaler),
       (A5)-[:USED_TREATMENT]->(Antimalarials),
	(A7)-[:USED_TREATMENT]->(Insulin),
       (A8)-[:USED_TREATMENT]->(Antibiotics),
       (A9)-[:USED_TREATMENT]->(Insulin),
       (A10)-[:USED_TREATMENT]->(Inhaler),
       (A11)-[:USED_TREATMENT]->(Antihypertensives),
       (A12)-[:USED_TREATMENT]->(Antihypertensives),
       (A13)-[:USED_TREATMENT]->(Antibiotics),
       (A14)-[:USED_TREATMENT]->(Antibiotics);


// QUERIES

// -------------- Elemental queries ------------------

// Find all patients older than 60 together with their cases and description
MATCH (p:Patient)-[:HAS_CASE]->(c:Case)
WHERE p.age > 60
RETURN p.name AS name, p.age AS age, c.description AS description;

// Find the number of patients assigned to each doctor
MATCH (d:Doctor)<-[:ASSIGNED_TO]-(c:Case)<-[:HAS_CASE]-(p:Patient)
RETURN d.name AS doctor_name, COUNT(p) AS num_patients;

// ------------- Intermediate queries ----------------

// Obtain a list of doctors along with the diseases diagnosed
// in 'Open' cases assigned to them, as well as the total number 
// of open cases per doctor in the list.
MATCH (d:Doctor)<-[:ASSIGNED_TO]-(c:Case)-[:HAS_APPOINTMENT]->(appointment)-[:DIAGNOSED]->(dis:Disease)
WHERE c.status = 'Open'
RETURN d.name AS Doctor, 
       collect(DISTINCT dis.scientific_name) AS diseases_diagnosed,
       count(DISTINCT c) AS open_cases;

// Patients treated with the same medicament for different diseases
MATCH (d1:Disease)-[:TREATED_WITH]->(t:Treatment)<-[:TREATED_WITH]-(d2:Disease)
WHERE d1 <> d2
WITH t, collect(DISTINCT d1.scientific_name) AS diseases
MATCH (a:Appointment)-[:USED_TREATMENT]->(t)<-[:TREATED_WITH]-(d:Disease)
MATCH (p:Person:Patient)-[:HAS_CASE]->(:Case)-[:HAS_APPOINTMENT]->(a)
RETURN t.name AS Med, diseases AS Diseases, collect(DISTINCT p.name) AS Patients
ORDER BY Med;

// ------------ Advanced queries ---------------------

// Find all the doctors who have treated patients diagnosed with 
// the same disease as patients referred by Dr. Paco.
MATCH (drPaco:Doctor {name: 'Paco'})-[:REFERRED_TO]-(c:Case)-[:HAS_APPOINTMENT]->(a:Appointment)-[:DIAGNOSED]->(disease:Disease)
MATCH (c2:Case)-[:HAS_APPOINTMENT]->(a2:Appointment)-[:DIAGNOSED]->(disease)
MATCH (c2)-[:ASSIGNED_TO]->(otherDoctor:Doctor)
WHERE NOT otherDoctor = drPaco
RETURN DISTINCT otherDoctor.name AS doctor, disease.scientific_name AS disease

// Finds the minimum path between a patient and a doctor where he was referred,
// going through cases, apointments and diagnosis
MATCH path = shortestPath((p:Person:Patient)-[:HAS_CASE|HAS_APPOINTMENT|DIAGNOSED|REFERRED_TO*]-(d:Person:Doctor))
RETURN p.name AS Patient, d.name AS Doctor, length(path) AS Path_length, nodes(path) AS Nodes, relationships(path) AS Relationships
ORDER BY Path_length ASC LIMIT 5;
