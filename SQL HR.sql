

#Q.1  
create table Avg_attrition_rate as
select department ,concat(avg((case when attrition='Yes' then 1 else 0 end )*100),'%') as avg_Attrition_rate from hr_11 group by department;

select * from avg_attrition_rate;

#Q.2
create table avg_hourly_rate_male as
select avg(hourlyrate) as avg_hourly_rate from hr_11 where gender = 'male' and  jobrole = 'research scientist';

select* from avg_hourly_rate_male; 

#Q.3
create table Attrn_rt_vs_mnthl_incm_stats as
select case
when monthlyincome <=5000 then '0-5K'
when monthlyincome between 5001 and 10000 then '5000-10000'
when monthlyincome between 10001 and 15000 then '10000-15000'
when monthlyincome between 15001 and 20000 then '15000-20000'
else '20000+' end as income_range,
count(*) as total_employees,sum(case when attrition ='yes' then 1 else 0 end) as total_attrition,
concat((sum(case when attrition = 'yes' then 1 else 0 end)/ count(*))*100,'%') as attrition_rate 
from hr_22 a join hr_11 b on a.employee_id=b.employeenumber
group by income_range;

select * from Attrn_rt_vs_mnthl_incm_stats;


#Q.4
create table avg_work_year_each_dep as
select department, avg(totalworkingyears)as avg_year_of_exp 
from hr_11 a join hr_22 b on a.employeenumber=b.employee_id 
group by department;

select * from avg_work_year_each_dep;

#Q.5
create table job_role_vs_work_life_blnc as
select jobrole,avg(worklifebalance) as work_life_balance
 from hr_11 a join hr_22 b on a.EmployeeNumber=b.employee_id 
 group by JobRole order by  work_life_balance desc;
 
 select* from job_role_vs_work_life_blnc;

 #Q.6
 create table attr_rate_vs_yr_snc_Lst_prom as
 select yearssincelastpromotion as Year_Since_Last_Promotion,count(*) as total_employees,
 sum(case when attrition='yes' then 1 else 0 end) as Num_attrited,
concat( (sum(case when attrition ='yes' then 1 else 0 end)/count(*))*100,'%') as Attrition_rate
 from hr_22 a join hr_11 b on a.Employee_ID=b.EmployeeNumber 
 group by YearsSinceLastPromotion order by YearsSinceLastPromotion asc;
 
 select * from attr_rate_vs_yr_snc_Lst_prom;
