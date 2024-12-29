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
RETURN p.name AS patient1name, 