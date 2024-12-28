// Get all cases and theis patients
MATCH (p:Patient)-[:HAS_CASE]->(c:Case)
RETURN c.case_id AS CaseID, c.description AS Description, p.name AS Patient;

// Get doctor managing each case
MATCH (c:Case)-[:ASSIGNED_TO]->(d:Doctor)
RETURN c.case_id AS CaseID, c.description AS Description, d.name AS AssignedDoctor;

// List all cases with referrals
MATCH (c:Case)-[r:REFERRED_TO]->(d:Doctor)
RETURN c.case_id AS CaseID, r.reason AS Reason, d.name AS ReferredTo;

// List all treatments used in appointments for cases
MATCH (c:Case)-[:HAS_APPOINTMENT]->(a:Appointment)-[:USED_TREATMENT]->(t:Treatment)
RETURN c.case_id AS CaseID, a.date AS AppointmentDate, t.name AS Treatment;

// Find all doctors that have referred cases to other doctors
MATCH (d:Doctor)-[:REFERRED_TO]->(referral:Doctor)<-[:ASSIGNED_TO]-(c:Case)
RETURN d.name AS ReferringDoctor, referral.name AS ReferredDoctor, c.case_id AS CaseID, referral.name AS RefereeDoctor, 
       referral.name AS ReferredTo, referral.name AS ReferralReason;
