-- Check the data tables
SELECT *
FROM employee_test;

SELECT *
FROM employee_perf;

----- DESCRIPTIVE: Employee Demography
--  How many employees do we have in the organisation and what is the maximum length of service?

SELECT COUNT ("employee_id"), MAX("length_of_service")
FROM employee_test;

SELECT ROUND(AVG("length_of_service"),2) AS avg_tenure FROM employee_test;

-- How many employees are there in each department

SELECT "department", COUNT("employee_id") AS "NumberofEmployee"
FROM employee_test
GROUP BY "department";

-- • What is the proportion of male to female employees?

SELECT "gender", COUNT("employee_id")
FROM employee_test
GROUP BY "gender";

-- • Group Employee age into 5 categories (20 – 29, 30 – 39, 40-49, 50-59, >60). What age group has 
--the highest and lowest employee?

SELECT
	CASE
		WHEN "age" BETWEEN 20 AND 29 THEN '20-29'
		WHEN "age" BETWEEN 30 AND 39 THEN '30-39'
		WHEN "age" BETWEEN 40 AND 49 THEN '40-49'
		WHEN "age" BETWEEN 50 AND 59 THEN '50-59'
		ELSE '>60'
	END AS "AgeBracket", COUNT("employee_id") AS "NumberofEmployee"
FROM employee_test
GROUP BY "AgeBracket"
ORDER BY "NumberofEmployee";

--• Which department has the most and the fewest employees?

SELECT "department", COUNT("employee_id") AS "NumberofEmployee"
FROM employee_test
GROUP BY "department"
ORDER BY "NumberofEmployee";


----- DIAGNOSTICS: Employee Performance
-- Who has the highest average training score among all employees?

SELECT MAX("avg_training_score")
FROM employee_test;

SELECT "employee_id", MAX("avg_training_score") AS "MaxScore"
FROM employee_test
GROUP BY "employee_id"
ORDER BY "MaxScore" DESC
LIMIT 2;

-- • What is the average training score of employees in each department

SELECT "department", ROUND(AVG("avg_training_score"), 1) AS "DeptAvgScore"
FROM employee_test
GROUP BY "department";

-- • What is the average previous year rating by department?

SELECT "department", ROUND(AVG("previous_year_rating"), 1) AS "AvgPreviousRating"
FROM employee_test
GROUP BY "department"
ORDER BY "AvgPreviousRating";

-- • What is the average training score of employees by education type?

SELECT COALESCE ("education", 'N/A'), ROUND(AVG("avg_training_score"), 1) AS "EduAvgTrainingScore"
FROM employee_test
GROUP BY "education";

-- • What is the average previous year rating by recruitment channel?

SELECT "recruitment_channel", ROUND(AVG("previous_year_rating"), 1) AS "AvgPrevRating"
FROM employee_test
GROUP BY "recruitment_channel";

-- Based on the age group created, what is the average rating of the previous year and the average training score?

SELECT
	CASE
		WHEN "age" BETWEEN 20 AND 29 THEN '20-29'
		WHEN "age" BETWEEN 30 AND 39 THEN '30-39'
		WHEN "age" BETWEEN 40 AND 49 THEN '40-49'
		WHEN "age" BETWEEN 50 AND 59 THEN '50-59'
		ELSE '>60'
	END AS "AgeBracket", ROUND(AVG("previous_year_rating"), 1) AS "AvgPrevRating", ROUND(AVG("avg_training_score"),1) AS "AvgTrainScore"
FROM employee_test
GROUP BY "AgeBracket"
ORDER BY "AgeBracket" ASC;

-- Group Average training Score into grades (A, B, C, D, E, F) and what grade had the highest and lowest number of employees

SELECT
	CASE
		WHEN "avg_training_score" BETWEEN 0 AND 39 THEN'F'
		WHEN "avg_training_score" BETWEEN 40 AND 44 THEN'E'
		WHEN "avg_training_score" BETWEEN 45 AND 49 THEN 'D'
		WHEN "avg_training_score" BETWEEN 50 AND 59 THEN 'C'
		WHEN "avg_training_score" BETWEEN 60 AND 69 THEN'B'
		ELSE 'A'
	END AS "Grade", COUNT ("employee_id") AS "NumberofEmployee"

FROM employee_test
GROUP BY "Grade"
ORDER BY "NumberofEmployee";

----- DIAGNOSTICS: Attrition Analysis
--What is the overall attrition rate in the company?

SELECT "attrition", COUNT(*)
FROM Employee_perf
GROUP BY "attrition";

SELECT 
    ROUND((SUM(CASE WHEN Attrition = 'Yes' THEN 1 
		ELSE 0 
	END)* 100.0)  / COUNT(*),2) AS attrition_rate
FROM Employee_perf;

-- What is the Average Attrition Rate
SELECT
	ROUND(AVG(CASE
		WHEN "attrition" ='Yes' THEN 1
		ELSE 0
	END),2) AS "AtrritionRate"
FROM employee_perf;

-- • Which regions have the highest rate of departures (employees who have left), and what are the corresponding departments?

SELECT "region",
	ROUND(AVG(CASE WHEN "attrition" ='Yes' THEN 1 ELSE 0
	END),2) AS "AvgAtrritionRate"
FROM employee_perf
LEFT JOIN employee_test ON employee_test.employee_id = employee_perf.employee_id
GROUP BY "region"
ORDER BY "AvgAtrritionRate" DESC;

-- Attrition Rate by Department

SELECT t.Department, 
       COUNT(e.Employee_id) AS total_employees, 
       SUM(CASE WHEN e.Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrited_employees,
       ROUND((SUM(CASE WHEN e.Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(e.Employee_id),2) AS attrition_rate
FROM Employee_perf e
JOIN Employee_test t ON e.Employee_id = t.Employee_id
GROUP BY t.Department
ORDER BY attrition_rate DESC;

SELECT "region",
	COUNT(CASE WHEN "attrition" ='Yes' THEN 1 ELSE 0
	END) AS "NoofAtrrition"
FROM employee_perf
LEFT JOIN employee_test ON employee_test.employee_id = employee_perf.employee_id
GROUP BY "region"
ORDER BY "NoofAtrrition" DESC;

-- Which Department has the highest average job satisfaction?

SELECT "department", ROUND(AVG("jobsatisfaction"),2) AS "AvgSatisfaction" 
FROM employee_perf
LEFT JOIN employee_test ON employee_test.employee_id = employee_perf.employee_id
GROUP BY "department"
ORDER BY "AvgSatisfaction" DESC;

--Does Low Job Satisfaction Lead to Higher Attrition?

SELECT e.JobSatisfaction, 
       COUNT(e.Employee_id) AS total_employees, 
       SUM(CASE WHEN e.Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrited_employees,
       ROUND((SUM(CASE WHEN e.Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(e.Employee_id),2) AS attrition_rate
FROM Employee_perf e
GROUP BY e.JobSatisfaction
ORDER BY attrition_rate DESC;

-- • Which region has the highest average job satisfaction and what is the rating

SELECT "region", ROUND(AVG("jobsatisfaction"),2) AS "AvgSatisfaction" 
FROM employee_perf
LEFT JOIN employee_test ON employee_test.employee_id = employee_perf.employee_id
GROUP BY "region"
ORDER BY "AvgSatisfaction" DESC;

-- Which departments have the highest rate of departures?

SELECT "department",
	COUNT(CASE WHEN "attrition" ='Yes' THEN 1 ELSE 0
	END) AS "NoOfAtrrition"
FROM employee_perf
LEFT JOIN employee_test ON employee_test.employee_id = employee_perf.employee_id
GROUP BY "department"
ORDER BY "NoOfAtrrition" DESC;

-- Find the department in Region18

SELECT "department",
	CASE WHEN "attrition" ='Yes' THEN 1 ELSE 0
	END AS "AtrritionRate"
FROM employee_perf
LEFT JOIN employee_test ON employee_test.employee_id = employee_perf.employee_id
WHERE "region" = 'region_18';

-- Attrition by Job Level

SELECT e.JobLevel, 
       COUNT(e.Employee_id) AS total_employees, 
       SUM(CASE WHEN e.Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrited_employees,
       ROUND((SUM(CASE WHEN e.Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(e.Employee_id),2) AS attrition_rate
FROM Employee_perf e
GROUP BY e.JobLevel
ORDER BY attrition_rate DESC;

 -- Employee Performance Analysis
 -- Average Performance Rating by Department
 
SELECT t.Department, 
       ROUND(AVG(e.PerformanceRating),2) AS avg_performance_rating
FROM Employee_perf e
JOIN Employee_test t ON e.Employee_id = t.Employee_id
GROUP BY t.Department
ORDER BY avg_performance_rating DESC;

-- Training & Development Analysis
-- Impact of Training on Performance Ratings

SELECT 
    t.no_of_trainings, 
    ROUND(AVG(e.PerformanceRating),2) AS avg_performance_rating
FROM Employee_perf e
JOIN Employee_test t ON e.Employee_id = t.Employee_id
GROUP BY t.no_of_trainings
ORDER BY t.no_of_trainings DESC;

--Low Performers Who Received No Training

SELECT e.Employee_id, t.Department, e.PerformanceRating, t.no_of_trainings
FROM Employee_perf e
JOIN Employee_test t ON e.Employee_id = t.Employee_id
WHERE e.PerformanceRating = 3 AND t.no_of_trainings = 1;


SELECT COUNT(*) FROM Employee_perf WHERE PerformanceRating <= 2;

SELECT "performancerating", COUNT(*)
FROM Employee_perf
GROUP BY "performancerating";

SELECT "no_of_trainings", COUNT(*)
FROM Employee_test
GROUP BY "no_of_trainings";

SELECT 
    t.Department, 
    COUNT(e.Employee_id) AS employee_count
FROM Employee_perf e
JOIN Employee_test t ON e.Employee_id = t.Employee_id
WHERE e.PerformanceRating = 3 
AND t.no_of_trainings = 1
GROUP BY t.Department
ORDER BY employee_count DESC;

-- Employees Who Improved Performance After Training

SELECT e.Employee_id, t.Department, t.no_of_trainings, 
       t.previous_year_rating, e.PerformanceRating,
       (e.PerformanceRating - t.previous_year_rating) AS performance_change
FROM Employee_perf e
JOIN Employee_test t ON e.Employee_id = t.Employee_id
WHERE e.PerformanceRating > t.previous_year_rating;

-- Improved Employees (Performance Increased)
SELECT e.Employee_id, t.Department, t.no_of_trainings, 
       t.previous_year_rating, e.PerformanceRating,
       (e.PerformanceRating - t.previous_year_rating) AS performance_change
FROM Employee_perf e
JOIN Employee_test t ON e.Employee_id = t.Employee_id
WHERE e.PerformanceRating > t.previous_year_rating;

-- Unimproved Employees (Performance Stayed the Same or Dropped)

SELECT e.Employee_id, t.Department, t.no_of_trainings, 
       t.previous_year_rating, e.PerformanceRating,
       (e.PerformanceRating - t.previous_year_rating) AS performance_change
FROM Employee_perf e
JOIN Employee_test t ON e.Employee_id = t.Employee_id
WHERE e.PerformanceRating <= t.previous_year_rating;

-- Under improved

SELECT e.Employee_id, t.Department, t.no_of_trainings, 
       t.previous_year_rating, e.PerformanceRating,
       (e.PerformanceRating - t.previous_year_rating) AS performance_change
FROM Employee_perf e
JOIN Employee_test t ON e.Employee_id = t.Employee_id
WHERE e.PerformanceRating < t.previous_year_rating;

--The same improvement
SELECT e.Employee_id, t.Department, t.no_of_trainings, 
       t.previous_year_rating, e.PerformanceRating,
       (e.PerformanceRating - t.previous_year_rating) AS performance_change
FROM Employee_perf e
JOIN Employee_test t ON e.Employee_id = t.Employee_id
WHERE e.PerformanceRating = t.previous_year_rating;

-- Count Improved vs. Stayed the same Employees vs. Dropped

SELECT 
    CASE 
        WHEN e.PerformanceRating > t.previous_year_rating THEN 'Improved'
		WHEN e.PerformanceRating = t.previous_year_rating THEN 'The Same'
        ELSE 'Dropped'
    END AS performance_status, 
    COUNT(e.Employee_id) AS employee_count
FROM Employee_perf e
JOIN Employee_test t ON e.Employee_id = t.Employee_id
GROUP BY performance_status;

--Count Improved & Unimproved Employees by Department

SELECT t.Department, 
       SUM(CASE WHEN e.PerformanceRating > t.previous_year_rating THEN 1 ELSE 0 END) AS improved_count,
       SUM(CASE WHEN e.PerformanceRating = t.previous_year_rating THEN 1 ELSE 0 END) AS The_Same_count,
	   SUM(CASE WHEN e.PerformanceRating < t.previous_year_rating THEN 1 ELSE 0 END) AS Dropped_count
FROM Employee_perf e
JOIN Employee_test t ON e.Employee_id = t.Employee_id
GROUP BY t.Department
ORDER BY improved_count DESC;

-- Compensation & Salary Insights
-- Average Salary by Job Level

SELECT e.JobLevel,
       ROUND(AVG(e.HourlyRate),2) AS avg_hourly_rate, 
       ROUND(AVG(e.MonthlyRate),2) AS avg_monthly_rate
FROM Employee_perf e
GROUP BY e.JobLevel
ORDER BY e.JobLevel;

-- Does a Higher Salary Correlate with Higher Performance?

SELECT e.PerformanceRating, 
       ROUND(AVG(e.MonthlyRate),2) AS avg_monthly_salary
FROM Employee_perf e
GROUP BY e.PerformanceRating
ORDER BY e.PerformanceRating DESC;

-- Diversity & Inclusion Insights
-- Gender Distribution Across Job Levels

SELECT t.Gender, e.JobLevel, COUNT(*) AS total_employees
FROM Employee_perf e
JOIN Employee_test t ON e.Employee_id = t.Employee_id
GROUP BY t.Gender, e.JobLevel
ORDER BY e.JobLevel, t.Gender;

--  Attrition by Recruitment Channel

SELECT t.recruitment_channel, 
       COUNT(e.Employee_id) AS total_employees, 
       SUM(CASE WHEN e.Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrited_employees,
       ROUND((SUM(CASE WHEN e.Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(e.Employee_id),2) AS attrition_rate
FROM Employee_perf e
JOIN Employee_test t ON e.Employee_id = t.Employee_id
GROUP BY t.recruitment_channel
ORDER BY attrition_rate DESC;

--Salary vs. Attrition

SELECT e.JobLevel, 
       ROUND(AVG(e.MonthlyRate),2) AS avg_monthly_salary, 
       COUNT(e.Employee_id) AS total_employees, 
       SUM(CASE WHEN e.Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrited_employees,
       ROUND((SUM(CASE WHEN e.Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(e.Employee_id),2) AS attrition_rate
FROM Employee_perf e
GROUP BY e.JobLevel
ORDER BY attrition_rate DESC;

--Performance vs. Job Satisfaction

SELECT e.PerformanceRating, 
       ROUND(AVG(e.JobSatisfaction),2) AS avg_satisfaction, 
       COUNT(e.Employee_id) AS total_employees
FROM Employee_perf e
GROUP BY e.PerformanceRating
ORDER BY e.PerformanceRating DESC;

--Regions with Higher Attrition

SELECT t.Region, 
       COUNT(e.Employee_id) AS total_employees, 
       SUM(CASE WHEN e.Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrited_employees,
       ROUND((SUM(CASE WHEN e.Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(e.Employee_id),2) AS attrition_rate
FROM Employee_perf e
JOIN Employee_test t ON e.Employee_id = t.Employee_id
GROUP BY t.Region
ORDER BY attrition_rate DESC;

--Region-Wise Job Satisfaction Analysis

SELECT t.Region, 
       ROUND(AVG(e.JobSatisfaction),2) AS avg_satisfaction
FROM Employee_perf e
JOIN Employee_test t ON e.Employee_id = t.Employee_id
GROUP BY t.Region
ORDER BY avg_satisfaction ASC;

-- Identifying the Highest and Lowest Paid Employees by Job Level
--Who are the top-paid and lowest-paid employees at each job level?

SELECT Employee_id, JobLevel, MonthlyRate, 
       RANK() OVER (PARTITION BY JobLevel ORDER BY MonthlyRate DESC) AS SalaryRank
FROM Employee_perf;

--Ranking Employees by Performance Within Each Department
-- Who are the top-performing employees in each department?

SELECT e.Employee_id, t.Department, e.PerformanceRating, 
       DENSE_RANK() OVER (PARTITION BY t.Department ORDER BY e.PerformanceRating DESC) AS PerformanceRank
FROM Employee_perf e
JOIN Employee_test t ON e.Employee_id = t.Employee_id;

--Assigning a Unique Row Number to Employees in Each Region Based on Training Score
-- How do employees rank in training performance within their region?

SELECT Employee_id, Region, avg_training_score, 
       ROW_NUMBER() OVER (PARTITION BY Region ORDER BY avg_training_score DESC) AS TrainingRank
FROM Employee_test;

--Ranking Employees Based on Length of Service
--Which employees have been with the company the longest in each department?

SELECT Employee_id, Department, length_of_service, 
       RANK() OVER (PARTITION BY Department ORDER BY length_of_service DESC) AS TenureRank
FROM Employee_test;

-- Identifying Employees Who Improved Performance the Most
-- Which employees have shown the highest improvement in performance over the past year?

SELECT e.Employee_id, t.Department, t.previous_year_rating, e.PerformanceRating, 
       (e.PerformanceRating - t.previous_year_rating) AS PerformanceChange,
       DENSE_RANK() OVER (PARTITION BY t.Department ORDER BY (e.PerformanceRating - t.previous_year_rating) DESC) AS ImprovementRank
FROM Employee_perf e
JOIN Employee_test t ON e.Employee_id = t.Employee_id;