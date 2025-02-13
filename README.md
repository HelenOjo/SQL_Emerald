## PROBLEM STATEMENT

#### Emerald Technologies faces employee attrition and performance management challenges, which may affect productivity. The lack of clear insights into turnover causes, promotion fairness, and training program effectiveness hampers talent retention and performance improvement.

## BUSINESS OBJECTIVE
#### This analysis aims to
#### 1.	Identify the main factors influencing employee attrition by examining demographic and job-related trends.
#### 2.	Assess employee performance trends and provide recommendations for targeted training programs to enhance skills and job satisfaction.
#### 3.	Evaluate performance trends to ensure that employees in need of support receive appropriate training and development opportunities.
#### 4.	Inform decision-making processes related to promotions, retention strategies, and employee growth initiatives.

## KEY ANALYSIS QUESTIONS 
#### •	Which departments have the highest attrition rates?
#### •	Does employee age or length of service impact attrition?
#### •	Are employees with low-performance ratings more likely to leave?
#### •	What is the impact of the previous year’s performance rating on current performance?
#### •	How does the hourly rate or monthly rate vary by job level?
#### •	Do employees with higher salaries have better performance ratings?
#### •	How does the number of training sessions attended affect performance ratings?
#### •	Do employees recruited through certain channels perform better or stay longer?
#### •	Do male and female employees have similar attrition rates and performance ratings?
#### •	Do employees in high-attrition regions have lower job satisfaction?

## TECHNIQUES FOR ANALYZING 
#### •	Restore Database
#### •	Data Cleaning and Handling missing values by replacing nulls in previous_year_rating with the average.
#### •	Use COUNT(), DISTINCT(), and DESCRIBE to understand the dataset structure.
#### •	use SQL aggregations (AVG(), MAX(), MIN()) to identify outlier
#### •	Use SQL Joins to merge Employee_perf and Employee_test tables.
#### •	 SQL Querying & Data Analysis to extract meaningful insights on attrition, performance, and training effectiveness
#### •	Filtering & Conditions: WHERE and CASE clause to specific condition
#### •	 Ranking & Window Functions Use RANK(), DENSE_RANK(), and ROW_NUMBER() to compare employees across departments or job levels.
#### •	Correlation Analysis: Use correlation coefficients to see relationships between salary, training, and performance.


