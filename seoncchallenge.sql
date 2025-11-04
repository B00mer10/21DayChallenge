select * from patients;

select * from services_weekly;

select distinct service from services_weekly;

select patient_id,name,age,satisfaction
from patients 
where service = 'surgery' AND satisfaction < 70;
