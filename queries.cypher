// ------------- Get all cases and theis patients ------------- 
// Table form
MATCH (p:Patient)-[:HAS_CASE]->(c:Case)
RETURN c.case_id AS CaseID, c.description AS Description, p.name AS Patient;
// Graph form
MATCH r=(p:Patient)-[:HAS_CASE]->(c:Case)
RETURN r;


// ------------- Get doctor managing each case -------------
// Table form
MATCH (c:Case)-[:ASSIGNED_TO]->(d:Doctor)
RETURN c.case_id AS CaseID, c.description AS Description, d.name AS AssignedDoctor;
// Graph form 
MATCH r=(c:Case)-[:ASSIGNED_TO]->(d:Doctor)
RETURN r;

// ------------- List all cases with referrals -------------
// Table form
MATCH (c:Case)-[r:REFERRED_TO]->(d:Doctor)
RETURN c.case_id AS CaseID, r.reason AS Reason, d.name AS ReferredTo;
// Graph form
MATCH r=(c:Case)-[r:REFERRED_TO]->(d:Doctor)
RETURN r;

// ------------- List all treatments used in appointments for cases -------------
// Table form
MATCH (c:Case)-[:HAS_APPOINTMENT]->(a:Appointment)-[:USED_TREATMENT]->(t:Treatment)
RETURN c.case_id AS CaseID, a.date AS AppointmentDate, t.name AS Treatment;
// Graph form
MATCH r=(c:Case)-[:HAS_APPOINTMENT]->(a:Appointment)-[:USED_TREATMENT]->(t:Treatment)
RETURN r;

//  ------------- Find all doctors that have referred cases to other doctors -------------
// Table form
MATCH (d:Doctor)<-[:ASSIGNED_TO]-(c:Case)-[:REFERRED_TO]->(referral:Doctor)
RETURN d.name AS ReferringDoctor, referral.name AS ReferredDoctor, c.case_id AS CaseID;
// Graph form
MATCH r=(d:Doctor)<-[:ASSIGNED_TO]-(c:Case)-[:REFERRED_TO]->(referral:Doctor)
RETURN r;

// ------------- List all patients that share doctor -------------
MATCH (p:Patient)-[:HAS_CASE]->(c:Case)-[:ASSIGNED_TO|REFERRED_TO]->(d:Doctor)<-[:ASSIGNED_TO](p1:Patient)
RETURN p.name AS patient1name;


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

// ------------ Advanced queries ---------------------

// Find all the doctors who have treated patients diagnosed with 
// the same disease as patients referred by Dr. Paco.
MATCH (drPaco:Doctor {name: 'Paco'})-[:REFERRED_TO]-(c:Case)-[:HAS_APPOINTMENT]->(a:Appointment)-[:DIAGNOSED]->(disease:Disease)
MATCH (c2:Case)-[:HAS_APPOINTMENT]->(a2:Appointment)-[:DIAGNOSED]->(disease)
MATCH (c2)-[:ASSIGNED_TO]->(otherDoctor:Doctor)
WHERE NOT otherDoctor = drPaco
RETURN DISTINCT otherDoctor, disease
