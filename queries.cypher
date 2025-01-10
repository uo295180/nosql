// -------------- Elemental queries ------------------

// Find all patients older than 60 together with their cases and description
MATCH (p:Patient)-[:HAS_CASE]->(c:Case)
WHERE p.age > 60
RETURN p.name, p.age, c.description;

// Find the number of patients assigned to each doctor
MATCH (d:Doctor)<-[:ASSIGNED_TO]-(c:Case)<-[:HAS_CASE]-(p:Patient)
RETURN d.name, COUNT(p) as num_patients;

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
RETURN DISTINCT otherDoctor, disease

// Finds the minimum path between a patient and a doctor where he was referred,
// going through cases, apointments and diagnosis
MATCH path = shortestPath((p:Person:Patient)-[:HAS_CASE|HAS_APPOINTMENT|DIAGNOSED|REFERRED_TO*]-(d:Person:Doctor))
RETURN p.name AS Patient, d.name AS Doctor, length(path) AS Path_length, nodes(path) AS Nodes, relationships(path) AS Relationships
ORDER BY Path_length ASC LIMIT 1;
