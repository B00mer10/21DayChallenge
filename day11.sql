


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

SELECT service,
       count(patient_id) AS patient_count,
       ROUND(AVG(departure_date - arrival_date), 2) AS avg_stay_length
FROM patients
GROUP BY service
HAVING AVG(departure_date - arrival_date) > 7
ORDER BY avg_stay_length DESC;

select service, count(patients_admitted) as total_patients,
case
	when avg(patient_satisfaction) >=80  then 'excellent'
	
	when avg(patient_satisfaction) >=70  then 'Good'
	
	when avg(patient_satisfaction)>=60  then 'Fair'

	else 'Needs Improvement'
	end as satisfaction_level
	from services_weekly	
	group by service	
order by avg(patient_satisfaction )desc ;

SELECT
    DISTINCT service, event,
    COUNT(*) AS occurrence_count
FROM services_weekly
WHERE event IS NOT NULL
  AND event != 'none'
GROUP BY service, event
ORDER BY occurrence_count DESC;

