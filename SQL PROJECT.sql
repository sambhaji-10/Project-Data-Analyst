create database HR_DASHOARD;
select * from hr_1;
select *from hr_2;

# kips 1 
# Averege attrition rate for all department
SELECT Department,avg( CASE WHEN attrition="yes" THEN 1 else 0 end) AS average_attrition from hr_1
group by department;

# kips 2 
#Average Hourly rate of Male Research Scientist
select avg(HourlyRate) from hr_1
where Gender = "Male" and jobRole= "Research Scientist";

# kips 3 
#Attrition rate Vs Monthly income stats
select * from hr_1;
select * from hr_2;
select Attrition,sum(MonthlyIncome) from hr_1 left join hr_2 on
 hr_1.EmployeeNumber=hr_2 .Employee_ID group by Attrition;

#KPIs-4
#Average working years for each Department
select hr_1. department,avg(hr_2.TotalWorkingYears) as
 workingyears from hr_2
join hr_1 on hr_2.employee_id=hr_1.EmployeeNumber 
group by Department;

#KPIs-5
#Job Role Vs Work life balance

select hr_1.Jobrole,avg(hr_2.worklifebalance) as Avg_worklifebalance from hr_2
join hr_1 on hr_2.Employee_ID =hr_1.employeenumber group by jobrole;

#kips6
# Attrition rate Vs Year since last promotion relation
SELECT CASE 
        WHEN hr_2.yearssincelastpromotion BETWEEN 1 AND 10 THEN '1-10'
        WHEN hr_2.yearssincelastpromotion BETWEEN 11 AND 20 THEN '11-20'
        WHEN hr_2.yearssincelastpromotion BETWEEN 21 AND 30 THEN '21-30'
        WHEN hr_2.yearssincelastpromotion >= 40 THEN '40 Plus'
    END AS Year_Group, count(hr_1.attrition) AS Attrition_Rate FROM hr_1
Right JOIN hr_2 ON hr_2.employee_Id= hr_1.employeenumber
GROUP BY CASE 
        WHEN hr_2.yearssincelastpromotion BETWEEN 1 AND 10 THEN '1-10'
        WHEN hr_2.yearssincelastpromotion BETWEEN 11 AND 20 THEN '11-20'
        WHEN hr_2.yearssincelastpromotion BETWEEN 21 AND 30 THEN '21-30'
        WHEN hr_2.yearssincelastpromotion >= 40 THEN '40 Plus'
    END ;


