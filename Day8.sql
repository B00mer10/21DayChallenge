


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

SELECT service, 
 SUM(patients_refused) AS Total_Refused,
 ROUND(AVG(patient_satisfaction), 2) AS Average_Satisfaction
FROM services_weekly
GROUP BY service
HAVING SUM(patients_refused) > 100 
 AND AVG(patient_satisfaction) < 80;

SELECT 
    patient_id,
    UPPER(name) AS upper_case_name,
    LOWER(service) AS service_in_lower_case,
    LENGTH(name) AS name_length,
    age,
    CASE
        WHEN age >= 65 THEN 'Senior'
        WHEN age >= 18 THEN 'Adult'
        ELSE 'Minor'
    END AS age_category
FROM patients
WHERE LENGTH(name) > 10
ORDER BY upper_case_name, service_in_lower_case;


