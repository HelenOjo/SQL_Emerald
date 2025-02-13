

https://www.loom.com/share/686a491328c548ad92e752219875f0f5?sid=8717715c-886b-4e30-a310-762e959c0146

### PROBLEM STATEMENT

#### Emerald Technologies faces employee attrition and performance management challenges, which may affect productivity. The lack of clear insights into turnover causes, promotion fairness, and training program effectiveness hampers talent retention and performance improvement.

### BUSINESS OBJECTIVES
##### This analysis aims to
##### 1.	Identify the main factors influencing employee attrition by examining demographic and job-related trends.
##### 2.	Assess employee performance trends and provide recommendations for targeted training programs to enhance skills and job satisfaction.
##### 3.	Evaluate performance trends to ensure that employees in need of support receive appropriate training and development opportunities.
##### 4.	Inform decision-making processes related to promotions, retention strategies, and employee growth initiatives.

### KEY ANALYSIS QUESTIONS 
##### •	Which departments have the highest attrition rates?
##### •	Does employee age or length of service impact attrition?
##### •	Are employees with low-performance ratings more likely to leave?
##### •	What is the impact of the previous year’s performance rating on current performance?
##### •	How does the hourly rate or monthly rate vary by job level?
##### •	Do employees with higher salaries have better performance ratings?
##### •	How does the number of training sessions attended affect performance ratings?
##### •	Do employees recruited through certain channels perform better or stay longer?
#### •	Do male and female employees have similar attrition rates and performance ratings?
#### •	Do employees in high-attrition regions have lower job satisfaction?

### TECHNIQUES FOR ANALYZING 
##### •	Restore Database
##### •	Data Cleaning and Handling missing values by replacing nulls in previous_year_rating with the average.
##### •	Use COUNT(), DISTINCT(), and DESCRIBE to understand the dataset structure.
##### •	use SQL aggregations (AVG(), MAX(), MIN()) to identify outlier
##### •	Use SQL Joins to merge Employee_perf and Employee_test tables.
##### •	 SQL Querying & Data Analysis to extract meaningful insights on attrition, performance, and training effectiveness
##### •	Filtering & Conditions: WHERE and CASE clause to specific condition
##### •	 Ranking & Window Functions Use RANK(), DENSE_RANK(), and ROW_NUMBER() to compare employees across departments or job levels.
##### •	Correlation Analysis: Use correlation coefficients to see relationships between salary, training, and performance.

Emerald_SQL Query - Watch Video



###  KEY FINDINGS
##### Employee Tenure & Workforce Structure
##### •	Average tenure is 5.9 years, indicating a moderate retention rate. The longest served is 31 years, showing stability in some positions.
##### •	The majority (749 employees, 50%) are aged 30-39 and Only 7 employees are aged 60+, indicating limited senior-level retention. 
##### Employee Attrition Analysis
##### •	16% (237 employees left out of 1,470). The Top 3 Departments are Finance (22.97%), Legal (20%) and Operations (18.9%) while the Lowest is HR (7.58%) 
##### Regional Attrition Trends
##### •	Highest attrition rates in Region_18 (50%), Region_20 (39%), and Region_19 (38%) and the Lowest attrition in Region_29 (4%), Region_12 (0%), and Region_24 (0%). 
##### Job Satisfaction & Attrition Relationship
##### •	Employees with the lowest job satisfaction (Rating = 1) had the highest attrition (22.84%) while the highest (Rating = 4) attrition (11.33%). HR with the highest (2.91), and R&D with the lowest (2.38).
##### Performance Trends
##### •	667 employees (45%) had a performance drop, 342 employees (23%) improved and 461 employees (31%) remained the same.
##### •	Sales & Marketing (142 improved employees) and Technology (52 improved employees)
##### Training Impact on Performance
##### •	Employees with 5 training sessions had the highest performance rating (3.5) while those with 7 had a lower rating (3.0), possibly indicating overtraining.
##### Salary & Compensation Trends
##### •	Job Level 1 has the highest attrition rate (26.34%) with an average monthly salary of $13,686.44 and Job Level 5 is the lower (7.25%), with $14,312.06
##### Recruitment & Gender Representation
##### •	Recruitment Channel with Highest Attrition: "Other" (16.84%), "Sourcing" (15.24%)and "Referred" have the lowest attrition (12.5%).
##### •	Gender Distribution: Males (1,069 employees) dominate the workforce, while females make up 27% (401 employees).

### KEY INSIGHTS
##### •	A mid-career-heavy workforce, with fewer senior employees, raising concerns about leadership succession planning.
##### •	Finance and Legal teams experience higher turnover, potentially due to work pressure, compensation concerns, or job dissatisfaction.
##### •	Job satisfaction is directly linked to attrition. Low job satisfaction in R&D suggests poor work culture, limited career growth, or compensation issues.
##### •	Over 45% of employees saw a decline in performance, signalling possible issues with training, workload, or management.
##### •	Moderate training (3-5 sessions) improves performance, but excessive training does not always lead to better results.
##### •	The salary structure is not directly tied to performance, which may cause demotivation among high performers.
##### •	 Referral-based hiring is more effective for employee retention, and gender diversity initiatives are needed to balance the workforce.
##### •	Lower job levels (Level 1) experience higher attrition rates, likely due to lower salaries and limited growth opportunities.
##### •	Higher job levels (Level 4-5) see lower attrition, which might be due to better compensation and more senior roles offering greater job satisfaction.
##### •	Regions with high attrition (Region_18, Region_20, Region_19) show low job satisfaction, indicating a link between dissatisfaction and attrition because Regions with the lowest attrition rates (Region_12 and Region_24) have higher job satisfaction scores.

###  RECOMMENDATIONS
##### •	To Conduct exit interviews to identify Finance & Legal attrition drivers.
##### •	Implement structured training schedules (3-5 sessions max).
##### •	Introduce post-training assessments to measure effectiveness.
##### •	Prioritize referral-based hiring for better retention.
##### •	Implement gender balance policies to encourage more female recruitment in leadership 
##### •	To Consider introducing incentives or bonuses to improve morale and reduce turnover.
##### •	Conduct employee engagement surveys to identify specific workplace issues (e.g., work-life balance, leadership, job fulfilment).
##### •	Investigate the root causes of high attrition in Region_18, Region_20, and Region_19.
##### •	Implement region-specific interventions such as leadership training, compensation adjustments, and team-building activities to improve job satisfaction and retention in these areas.
##### •	Replicate strategies from Region_3 (highest satisfaction) in regions with lower satisfaction.



