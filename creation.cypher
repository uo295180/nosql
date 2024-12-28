MATCH (n) DETACH DELETE n;

CREATE (DrPaco:Person:Doctor {name: 'Paco', surname: 'López', age: 55}),
       (DrJavier:Person:Doctor {name: 'Javier', surname: 'Carrasco', age: 64}),
       (DrJuana:Person:Doctor {name: 'Juana', surname: 'Juánez', age: 32}),

       (Pepe:Person:Patient {name: 'Pepe', surname: 'González', age: 34}),
       (Maria:Person:Patient {name: 'Maria', surname: 'Rodríguez', age: 27}),
       (Pelayo:Person:Patient {name: 'Pelayo', surname: 'Sierra', age: 20}),
       (Laura:Person:Patient {name: 'Laura', surname: 'Morales', age: 36}),
       (Mario:Person:Patient {name: 'Mario', surname: 'Orviz', age: 89}),
       (Pedro:Person:Patient {name: 'Pedro', surname: 'Suárez', age: 45}),

       (Flu:Disease {scientific_name: 'Influenza', cause: 'Virus'}),
       (Diabetes:Disease {scientific_name: 'Diabetes Mellitus', cause: 'Insulin deficiency'}),
       (Asthma:Disease {scientific_name: 'Asthma', cause: 'Inflammation of airways'}),
       (Hypertension:Disease {scientific_name: 'Hypertension', cause: 'High blood pressure'}),
       (Tuberculosis:Disease {scientific_name: 'Mycobacterium tuberculosis', cause: 'Bacterial infection'}),
       (Malaria:Disease {scientific_name: 'Plasmodium', cause: 'Parasite infection'}),

       (A1:Appointment {date: date("2024-12-28")}),
       (A2:Appointment {date: date("2024-12-29")}),
       (A3:Appointment {date: date("2025-01-05")}),
       (A4:Appointment {date: date("2024-12-30")}),
       (A5:Appointment {date: date("2025-01-10")}),
       (A6:Appointment {date: date("2024-12-28")}),
       
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

       (Pepe)-[:HAS_CASE]->(Case1),
       (Maria)-[:HAS_CASE]->(Case2),
       (Pelayo)-[:HAS_CASE]->(Case3),
       (Laura)-[:HAS_CASE]->(Case4),
       (Pedro)-[:HAS_CASE]->(Case5),

       (Case1)-[:ASSIGNED_TO]->(DrPaco),
       (Case2)-[:ASSIGNED_TO]->(DrJuana),
       (Case3)-[:ASSIGNED_TO]->(DrJavier),
       (Case4)-[:ASSIGNED_TO]->(DrPaco),
       (Case5)-[:ASSIGNED_TO]->(DrJuana),

       (Case1)-[:HAS_APPOINTMENT]->(A1),
       (Case2)-[:HAS_APPOINTMENT]->(A3),
       (Case3)-[:HAS_APPOINTMENT]->(A4),
       (Case4)-[:HAS_APPOINTMENT]->(A5),
       (Case5)-[:HAS_APPOINTMENT]->(A2),

       (A1)-[:DIAGNOSED]->(Hypertension),
       (A1)-[:DIAGNOSED]->(Diabetes),
       (A3)-[:DIAGNOSED]->(Asthma),
       (A5)-[:DIAGNOSED]->(Malaria),

       (Case1)-[:REFERRED_TO {reason: 'Specialized hypertension treatment'}]->(DrJavier),
       (Case2)-[:REFERRED_TO {reason: 'Asthma diagnosis confirmation'}]->(DrPaco),
       (Case4)-[:REFERRED_TO {reason: 'Complicated malaria case'}]->(DrJuana),

       (Hypertension)-[:TREATED_WITH]->(Antihypertensives),
       (Diabetes)-[:TREATED_WITH]->(Insulin),
       (Asthma)-[:TREATED_WITH]->(Inhaler),
       (Tuberculosis)-[:TREATED_WITH]->(Antibiotics),
       (Malaria)-[:TREATED_WITH]->(Antimalarials),
       
       (A1)-[:USED_TREATMENT]->(Antihypertensives),
       (A1)-[:USED_TREATMENT]->(Insulin),
       (A3)-[:USED_TREATMENT]->(Inhaler),
       (A5)-[:USED_TREATMENT]->(Antimalarials);
