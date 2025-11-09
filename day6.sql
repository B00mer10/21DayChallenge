
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

SELECT 
    service,
    SUM(patients_admitted) AS total_patients_admitted,
    SUM(patients_refused) AS total_patients_refused,
    (SUM(patients_admitted) * 100.0 / 
     (SUM(patients_admitted) + SUM(patients_refused))) AS admission_rate
FROM services_weekly
GROUP BY service
ORDER BY admission_rate DESC;
