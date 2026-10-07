create database analytics_db;
use analytics_db;

create table employee_attrition(
 Age INT,
 Attrition VARCHAR(10),
 BusinessTravel VARCHAR(50),
 DailyRate int,
 Department varchar(50),
 DistanceFromHome int,
 Education INT,
 EducationField VARCHAR(50),
 EmployeeCount INT,
 EmployeeNumber INT PRIMARY KEY,
 EnvironmentSatisfaction INT,
 Gender VARCHAR(10),
 HourlyRate INT,
 JonInvolvement INT,
 JobLevel INT,
 JobRole VARCHAR(100),
 JobSatisfaction int,
 MaritalStatus VARCHAR(20),
 MonthlyIncome INT,
 MonthlyRate INT,
 NumCompaniesWorked INT,
 Over18 VARCHAR(5),
 OverTime VARCHAR(5),
 PercentSalaryHike INT,
 PerformanceRating INT,
 RelationshipSatisfaction INT,
 StandardHours INT,
 StockOptionLevel INT,
 TotalWorkingYears INT,
 TrainingTimesLastYear INT,
 WorkLifeBalance INT,
 YearsAtCompany INT,
 YearsInCurrentRole INT,
 YearsSinceLastPromotion INT,
 YearsWithCurrManager INT,
 Age_Group VARCHAR(20),
 Income_Band VARCHAR(20),
 Experience_Band VARCHAR(20),
 Attrition_Status VARCHAR(20)
); 
 
 
 /* TOTAL EMPLOYEES*/
 
 select count(*) as total_employees
 from employee_attrition;
 
 
 /*ATTRITION COUNT*/
 
 select attrition,count(*) as employees
 from employee_attrition
 group by attrition;
 
 
 /*ATTRITION RATE*/
 
 select 
 round(
 count(case when Attrition = 'yes' then 1 ELSE 0 end)
 *100.0/count(*),2
 )as attrition_rate
 FROM EMPLOYEE_ATTRITION;
 
 /* Average Monthly Income*/
 
 select round(avg(monthlyincome),2)as avg_income
 from employee_attrition;
 
 
 
 /* Employee by Department */
 
 select department,
 count(*) as employee_count
 from employee_attrition
 group by department
 order by employee_count desc;
 
 
 
 /* Employee by Job Role */
 
 select jobrole,
 count(*) as employee_count
 from employee_attrition
 group by jobrole
 order by  employee_count desc;
 
 
 
 /*Attrition by Department*/
 
 select department,
 count(*) as employee_left
 from employee_attrition
 where attrition = 'yes'
 group by department
 order by employee_left desc;
 
 
 
 /*Attrition by Job role*/
 
 Select jobrole,
 count(*) as employee_left
 from employee_attrition
 where attrition = 'yes'
 group by jobrole
 order by employee_left desc; 
 
 
 
 /* Average Income by jobrole*/
 
 select jobrole,
 round(avg(monthlyincome),2) as avg_income
 from employee_attrition
 group by jobrole
 order by avg_income desc;
 
 
 
 /*Attritiob by gender*/
 
 select gender,
 count(*) as employees_left
 from employee_attrition
 where attrition = 'yes'
 group by gender;
 
 
 
 /* Attrition by marital status */
 
 select maritalstatus,
 count(*) as employees_left
 from employee_attrition
 where attrition = 'yes'
 group by maritalstatus;
 
 
 
 /* Attrition by  age group*/
 
 select age_group,
 count(*) as employees_left 
 from employee_attrition
 where attrition = 'yes'
 group by age_group;
 
 
 
 /*Attrition by experience band */
 
 select experience_band,
 count(*) as employee_left
 from employee_attrition
 where attrition = 'yes'
 group by experience_band;
 
 
 
 /*Top 10 Highest paid employees*/
 
 select employeenumber,
 jobrole,
 monthlyincome
 from employee_attrition
 order by monthlyincome desc
 limit 10;
 
 /* Department  with Highest Attrition Rate*/
 
 Select Department,
 Round(
 sum(case when attrition = 'yes' then 1 else 0
 end)*100.0
 / count(*),2
 ) as attrition_rate
 from employee_attrition
 group by department
 order by attrition_rate desc;
 
 
 
 /* Rank job roles by attrition*/
 
 select jobrole,
 count(*) as attrition_count,
 rank() over(
 order by count(*) desc
 ) as attrition_rank
 from employee_attrition
 where attrition = 'yes'
 group by jobrole;
 
 /* Running total of employees by age*/
 
 select
 age,
 count(*) as employee_count,
 sum(count(*))
 over(order by age) as running_total
 from employee_attrition
 group by age;
 
 
 
 /* Employees earning above department average*/
 
select employeenumber,
department,monthlyincome
from employee_attrition
where monthlyincome>
(
select avg(monthlyincome)
from employee_attrition
);


 
 
 
 
 
 
 
 
 
 
 
 
 
 