select * from patients;

select * from services_weekly;

select distinct service from services_weekly;

select patient_id,name,age,satisfaction
from patients 
where service = 'surgery' AND satisfaction < 70;

select service, week ,patients_refused ,patients_request
from services_weekly
order by patients_refused desc
limit 5;

SELECT patient_id, name, service, satisfaction
FROM patients
ORDER BY satisfaction DESC
LIMIT 5 OFFSET 2;
