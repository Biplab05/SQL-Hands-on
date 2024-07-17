Use Biplab

Create Table Employee_Table (Employee_ID int Primary key, First_Name varchar(20), Last_Name varchar(20), Salary int, Joining_date smalldatetime, Department varchar(10));

Insert into Employee_Table values
(1,'Anika','Arora',100000,'14-feb-2020 09:00','HR'),
(2,'Veena','Verma',80000,'15-june-2011 09:00','Admin'),
(3,'Visal','Singal',300000,'16-feb-2020 09:00','HR'),
(4,'Sushanth','Singh',500000,'17-feb-2020 09:00','Admin'),
(5,'Bhupal','Bhati',500000,'18-june-2011 09:00','Admin'),
(6,'Dheeraj','Diwan',200000,'19-june-2011 09:00','Account'),
(7,'Karan','Kumar',75000,'14-jan-2020 09:00','Account'),
(8,'Chandrika','Chauhan',90000,'15-April-2011 09:00','Admin');

Select * from Employee_Table

Create Table Employee_Bonus_Table (Employee_ref_id int foreign key references Employee_Table(Employee_ID), Bonus_Amount int, Bonus_Date smalldatetime);

Insert into Employee_Bonus_Table values
(1,5000,'16-feb-2020'),
(2,3000,'16-june-2011'),
(3,4000,'16-feb-2020'),
(1,4500,'16-feb-2020'),
(2,3500,'16-june-2011');

Select * from Employee_Bonus_Table;

Create Table Employee_Title_Table (Employee_ref_id int foreign key references Employee_Table(Employee_ID), Employee_title varchar(20), Affective_Date smalldatetime);

insert into Employee_Title_Table values
(1,'Manager','20-feb-2016'),
(2,'Executive','11-jun-2016'),
(8,'Executive','11-jun-2016'),
(5,'Manager','11-jun-2016'),
(4,'Asst. Manager','11-jun-2016'),
(7,'Executive','11-jun-2016'),
(6,'Lead','11-jun-2016'),
(3,'Lead','11-jun-2016');

Select * from Employee_Title_Table

--1. Display the “FIRST_NAME” from Employee table using the alias name as Employee_name.

Select First_Name"Employee_name" from Employee_Table 

--2. Display “LAST_NAME” from Employee table in upper case.

Select upper(Last_Name) from Employee_Table

--3. Display unique values of DEPARTMENT from EMPLOYEE table.

Select Distinct Department from Employee_Table

--4. Display the first three characters of LAST_NAME from EMPLOYEE table.

Select substring(Last_Name,1,3) from Employee_Table

--5. Display the unique values of DEPARTMENT from EMPLOYEE table and prints its length.

Select distinct len(Department) from Employee_Table

--6. Display the FIRST_NAME and LAST_NAME from EMPLOYEE table into a single column AS FULL_NAME.

select concat(First_Name,' ',Last_Name) AS FullName from Employee_Table;

--7. DISPLAY all EMPLOYEE details from the employee table order by FIRST_NAME Ascending.

Select * from Employee_Table order by First_Name asc

--8. Display all EMPLOYEE details order by FIRST_NAME Ascending and DEPARTMENT Descending.

Select * from Employee_Table order by First_Name asc,Department desc

--9. Display details for EMPLOYEE with the first name as “VEENA” and “KARAN” from EMPLOYEE table.

Select * from Employee_Table where First_Name in('Veena','Karan')

--10. Display details of EMPLOYEE with DEPARTMENT name as “Admin”.

Select * from Employee_Table where Department='Admin'

--11. DISPLAY details of the EMPLOYEES whose FIRST_NAME contains ‘V’

Select * from Employee_Table where First_name like 'V%'

--12. DISPLAY details of the EMPLOYEES whose SALARY lies between 100000 and 500000.

Select * from Employee_Table where Salary between 100000 and 500000 

--13. Display details of the employees who have joined in Feb-2020.

Select * from Employee_Table where year(Joining_date)=2020 and month(Joining_date)=2;

--14. Display employee names with salaries >= 50000 and <= 100000.

Select concat(First_Name,' ',Last_Name) as Employee_Name, Salary from Employee_Table where Salary between 50000 and 100000

--16. DISPLAY details of the EMPLOYEES who are also Managers.

Select Distinct *, Employee_title
from Employee_table First_Name
Inner Join
Employee_Title_Table Employee_title
on First_Name.Employee_ID =Employee_title.Employee_ref_id
and Employee_title.Employee_title in ('Manager')

--17. DISPLAY duplicate records having matching data in some fields of a table.

SELECT Employee_title, Affective_Date, COUNT(*)
FROM Employee_Title_Table
GROUP BY Employee_title, Affective_Date
HAVING COUNT(*) > 1;

--18. Display only odd rows from a table.

Select * from Employee_Table where Employee_ID %2<>0

--19. Clone a new table from EMPLOYEE table.

Select * into Employee_TableClone from Employee_Table

Select * from Employee_TableClone

--20. DISPLAY the TOP 2 highest salary from a table.

SELECT *
FROM Employee_Table
WHERE 
(
  salary IN 
  (
    SELECT TOP (2) salary
    FROM Employee_Table as table1
    GROUP BY salary
    ORDER BY salary DESC
  )
)

--OR--

SELECT TOP 2 * FROM Employee_Table ORDER BY Salary DESC;

--21. DISPLAY the list of employees with the same salary.

select * from Employee_Table where salary in (select salary from Employee_Table group by salary having count(*)>1)

--22. Display the second highest salary from a table.

Select max(Salary) from Employee_Table 
where Salary not in (Select max(Salary) from Employee_Table);

--23. Display the first 50% records from a table.

Select * from Employee_Table
Where Employee_ID <=(Select count(Employee_ID)/2 from Employee_Table)

--24. Display the departments that have less than 4 people in it.

SELECT Department, COUNT(Employee_ID) as 'Number of Employees' FROM Employee_Table GROUP BY Department HAVING COUNT(Employee_ID)< 4;

--25. Display all departments along with the number of people in there.

Select Department, Count(Employee_ID) as 'Numberof Employees' from Employee_Table Group by Department

--26. Display the name of employees having the highest salary in each department.

SELECT T.Department,T.First_Name,T.Salary from(SELECT max(Salary) as TotalSalary,Department from Employee_Table group by Department) as TempNew 
Inner Join Employee_Table T on TempNew.Department=T.Department 
 and TempNew.TotalSalary=Salary;

--27. Display the names of employees who earn the highest salary.

 Select concat(First_Name,' ',Last_Name) as Employee_Name, Salary from Employee_Table Where Salary=(Select max(Salary) from Employee_Table)

--28. Diplay the average salaries for each department.

Select Department,Avg(Salary) as Average_Salary from Employee_Table group by Department

--29. Display the name of the employee who has got maximum bonus

select top 1 concat(First_Name,' ',Last_Name) as Employee_Name from Employee_Table e
inner join (select Employee_ref_id, sum(Bonus_Amount) Bonus from Employee_Bonus_Table group by Employee_ref_id) a
on e.Employee_id = a.Employee_ref_id 
order by a.Bonus desc

--30. Display the first name and title of all the employees

Select First_Name, Employee_title from Employee_Table A
Inner join
Employee_Title_Table B on A.Employee_ID=B.Employee_ref_id

