Use Biplab

CREATE TABLE studies (PNAME varchar(20), INSTITUTE varchar(20), COURSE varchar(20), COURSE_FEE int )

INSERT INTO studies values
('ANAND','SABHARI','PGDCA',4500 ),
('ALTAF','COIT','DCA',7200 ),
('JULIANA','BDPS','MCA',22000 ),
('KAMALA','PRAGATHI','DCA',5000 ),
('MARY','SABHARI','PGDCA ',4500 ),
('NELSON','PRAGATHI','DAP',6200 ),
('PATRICK','PRAGATHI','DCAP',5200 ),
('QADIR','APPLE','HDCA',14000 ),
('RAMESH','SABHARI','PGDCA',4500 ),
('REBECCA','BRILLIANT','DCAP',11000 ),
('REMITHA','BDPS','DCS',6000),
('REVATHI','SABHARI','DAP',5000 ),
('VIJAYA','BDPS','DCA',48000);

SELECT * FROM studies

CREATE TABLE software (PNAME varchar(20), TITLE varchar(20), DEVELOPIN varchar(20), SCOST decimal(10,2),  DCOST int, SOLD int)

INSERT INTO software values
('MARY','README','CPP',300, 1200, 84), 
('ANAND','PARACHUTES','BASIC',399.95, 6000, 43 ),
('ANAND','VIDEO TITLING','PASCAL',7500, 16000, 9 ),
('JULIANA','INVENTORY','COBOL',3000, 3500, 0 ),
('KAMALA','PAYROLL PKG.','DBASE',9000, 20000, 7),
('MARY','FINANCIAL ACCT.','ORACLE',18000, 85000, 4), 
('MARY','CODE GENERATOR','C',4500, 20000, 23),
('PATTRICK','README','CPP',300, 1200, 84),
('QADIR','BOMBS AWAY','ASSEMBLY',750, 3000, 11 ),
('QADIR','VACCINES','C',1900, 3100, 21 ),
('RAMESH','HOTEL MGMT.','DBASE',13000, 35000, 4),
('RAMESH','DEAD LEE','PASCAL',599.95, 4500, 73 ),
('REMITHA','PC UTILITIES','C',725, 5000, 51 ),
('REMITHA','TSR HELP PKG.','ASSEMBLY',2500, 6000, 7 ),
('REVATHI','HOSPITAL MGMT.','PASCAL',1100, 75000, 2 ),
('VIJAYA','TSR EDITOR','C',900, 700, 6);

SELECT * FROM software

CREATE TABLE programmer (PNAME varchar(20), DOB date, DOJ date, GENDER varchar(2), PROF1 varchar(20), PROF2 varchar(20), SALARY int)

INSERT INTO programmer values
('ANAND','12-Apr-66','21-Apr-92','M','PASCAL','BASIC',3200 ),
('ALTAF','02-Jul-64','13-Nov-90','M','CLIPPER','COBOL',2800 ),
('JULIANA','31-Jan-60','21-Apr-90','F','COBOL','DBASE',3000 ),
('KAMALA','30-Oct-68','02-Jan-92','F','C','DBASE',2900 ),
('MARY','24-Jun-70','01-Feb-91','F','CPP','ORACLE',4500 ),
('NELSON','11-Sep-85','11-Oct-89','M','COBOL','DBASE',2500 ),
('PATTRICK','10-Nov-65','21-Apr-90','M','PASCAL','CLIPPER',2800 ),
( 'QADIR','31-Aug-65','21-Apr-91','M','ASSEMBLY','C',3000 ),
('RAMESH','03-May-67','28-Feb-91','M','PASCAL','DBASE',3200 ),
('REBECCA','01-Jan-67','01-Dec-90','F','BASIC','COBOL',2500 ),
('REMITHA','19-Apr-70','20-Apr-93','F','C','ASSEMBLY',3600 ),
('REVATHI','02-Dec-69','02-Jan-92','F','PASCAL','BASIC',3700 ),
('VIJAYA','14-Dec-65','02-May-92','F','FOXPRO','C',3500);

SELECT * FROM programmer

--1. Find out the selling cost AVG for packages developed in Pascal. 

SELECT AVG (SCOST) FROM SOFTWARE WHERE DEVELOPIN LIKE 'PASCAL';

--2. Display Names, Ages of all Programmers. 

Select PNAME as Name, year(getdate())-year(DOB) as Age from programmer

--3. Display the Names of those who have done the DAP Course.

Select PNAME, Course from studies where course='DAP'

--4. Display the Names and Date of Births of all Programmers Born in January. 

Select PName,DOB,DATENAME(Month,DOB)Month from Programmer where DATENAME(Month,DOB)='JANUARY'

--5. What is the Highest Number of copies sold by a Package?

Select max(Sold) from Software

--6. Display lowest course Fee.

Select Min(Course_fee) from studies

--7. How many programmers done the PGDCA Course? 

Select count(PName) from Studies where Course='PGDCA'

--8. How much revenue has been earned thru sales of Packages Developed in C.

Select sum(Sold*SCOST) as revnue from software where Developin='C'

--9. Display the Details of the Software Developed by Ramesh.

Select * from Software where PNAME='Ramesh'

--10. How many Programmers Studied at Sabhari? 

Select count(Pname) as 'No. of Programmer' from studies where Institute='Sabhari'

--11. Display details of Packages whose sales crossed the 2000 Mark. 

Select * from Software where(Sold * SCost)>2000

--12. Display the Details of Packages for which Development Cost have been recovered. 

Select * from Software where(Sold * SCost)> DCost

--13. What is the cost of the costliest software development in Basic?

Select max(SCost) As 'Costliest Software' from Software where DEVELOPIN='Basic'

--14. How many Packages Developed in DBASE?

Select Count(Title) from Software Where Developin = ' DABASE'

--15. How many programmers studied in Pragathi? 

Select Count(PName) As 'No. of Programmers' from Studies where INSTITUTE='Pragathi'

--16. How many Programmers Paid 5000 to 10000 for their course?

Select Count(PName) As 'No. of Programmers' from Studies where Course_Fee>=5000 and Course_Fee<=10000

--17. What is AVG Course Fee

select avg(course_fee) from studies;

--18. Display the details of the Programmers Knowing C.

select * from programmer where prof1 = 'c' or prof2 = 'c';

--19. How many Programmers know either COBOL or PASCAL.

select count(pname) as programmers from programmer where prof1 = 'cobol' or prof2 = 'pascal' or prof1 = 'pascal' or prof2 = 'cobol';

--20. How many Programmers Don’t know PASCAL and C

select count(pname) as programmers from programmer where prof1 != 'pascal' and prof2 != 'c' and prof1 != 'c' and prof2 != 'pascal';

--21. How old is the Oldest Male Programmer.

Select Max(year(getdate())-year(DOB)) As Age from Programmer where Gender='M'

--22. What is the AVG age of Female Programmers?

Select avg(year(getdate())-year(DOB)) As Age from Programmer where Gender='F'

--23. Calculate the Experience in Years for each Programmer and Display with their names in Descending order.

Select PName As Name,year(getdate())-year(DOJ)As'Exp'from Programmer Order by Name Desc

--24. Who are the Programmers who celebrate their Birthday’s During the Current Month?

Select PNAME from Programmer where Month(getdate())=Month(DOB)

--25. How many Female Programmers are there?

Select count(PName) as 'No.of Female Programmer' from Programmer where Gender='F'

--26. What are the Languages studied by Male Programmers.

Select Distinct Prof1 as 'Langauge' From Programmer where Gender='M' UNION Select Distinct Prof2 as'Langauge' From Programmer where Gender='M'

--27. What is the AVG Salary?

Select Avg(Salary) as 'Average Salary' from Programmer

--28. How many people draw salary 2000 to 4000?

Select Count(PName) from Programmer Where Salary Between 2000 and 4000

--29. Display the details of those who don’t know Clipper, COBOL or PASCAL.

Select * from Programmer where Prof1 not in('Clipper','COBOL','PASCAL') and Prof2 not in('Clipper','COBOL','PASCAL')

--30. Display the Cost of Package Developed By each Programmer.

Select PName,sum(DCost * Sold)AS Total_Cost from Software Group by PName

--31. Display the sales values of the Packages Developed by the each Programmer.

Select PName,sum(SCost * Sold) As Total_sold from Software Group by PName

--32. Display the Number of Packages sold by Each Programmer.

Select PName,Count(Sold) as 'No.of Sold' from Software Group by PName

--33. Display the sales cost of the packages Developed by each Programmer Language wise.

Select Developin,sum(SCost) as 'Cost of Sales' from Software Group by Developin

--34. Display each language name with AVG Development Cost, AVG Selling Cost and AVG Price per Copy.

Select Developin,avg(DCost) as 'Avg DCOST',
avg(SCost) as 'Avg SCOST',
Avg(SCost) as 'Avg Price Per Copy'
from Software Group by Developin

--35. Display each programmer’s name, costliest and cheapest Packages Developed by him or her.

Select PName,max(DCost) as 'Costliest',
min(DCost) as 'Cheapest' from Software Group by PName

--36. Display each institute name with number of Courses, Average Cost per Course.

Select Institute as 'Institute Name', 
Count(Course) as 'No.of Courses',
avg(Course_Fee) as 'Cost per course' from Studies Group by INSTITUTE

--37. Display each institute Name with Number of Students.

Select Institute as 'Institute Name', count(PName) as 'No of Student' from studies group by institute

--38. Display Names of Male and Female Programmers. Gender also.

Select PName as 'Male & Female Programmer', Gender as 'Gender' from programmer order by GENDER

--39. Display the Name of Programmers and Their Packages.

Select Pname as 'Programmer', Salary as packages from programmer

--40. Display the Number of Packages in Each Language Except C and C++.

Select count(Title) as 'No of Packages' from Software where  Developin in ('C','C++')

--41. Display the Number of Packages in Each Language for which Development Cost is less than 1000.

Select Count(Title) as 'No of pack',
Developin as Language from Software
where DCost<1000 Group By Developin

--42. Display AVG Difference between SCOST, DCOST for Each Package.

Select Title as 'No of pack', avg(SCost-DCost) AVG from Software Group By Title

--43. Display the total SCOST, DCOST and amount to Be Recovered for each Programmer for Those Whose Cost has not yet been Recovered.

Select sum(SCost),Sum(DCost),sum(DCost-(SCost*DCost))from Software 
Group by PName Having sum(DCost)>sum(Sold*SCost)

--44. Display Highest, Lowest and Average Salaries for those earning more than 2000.

Select MAX(Salary) as Max, MIN(Salary) as Min, AVG(Salary) as Avg from Programmer where Salary>2000

--45. Who is the Highest Paid C Programmers?

Select * from Programmer where Salary =(Select max(Salary) from Programmer where Prof1 like 'C' or PROF2 like 'C')

--46. Who is the Highest Paid Female COBOL Programmer?

Select * from Programmer where Salary= (Select max(Salary) from Programmer where (Prof1='COBOL' or Prof2 ='COBOL')) and Gender='F'

--47. Display the names of the highest paid programmers for each Language.

Select MAX(Salary) As MaxSalary, Group_Concat(select PName Order By Salary DESC) as 'Highest Paid Programmer' from programmer group by Prof1,Prof2

--48. Who is the least experienced Programmer.

Select PName As Name, year(getdate())-year(DOJ) As Exp from Programmer Where year(getdate())-year(DOJ)=(Select min(year(getdate())-year(DOJ)) from Programmer)

--49. Who is the most experienced male programmer knowing PASCAL.

Select PName from programmer where gender ='M' and (Prof1 = 'Pascal' or Prof2 = 'Pascal') and doj =(Select min(doj) 
from programmer where gender = 'M' and  (Prof1 = 'Pascal' or Prof2 = 'Pascal'))

--50. Which Language is known by only one Programmer?

Select Prof1 as 'Language' from Programmer group by Prof1 having Prof1 not in(Select Prof2 from Programmer) and count(Prof1)=1
union Select Prof2 from Programmer group by Prof2 having Prof2 not in (Select Prof1 from Programmer) and count(Prof2)=1;

--51. Who is the Above Programmer Referred in 50?

Select P.PName, P.Prof1
From programmer P
Join (
    Select Prof1, Count(*) as count
    From Programmer
    Group by prof1
    Having count = 1
) Sub
On P.Prof1 = sub.Prof1

--52. Who is the Youngest Programmer knowing DBASE?

Select year(getdate())-year(DOB)Age,PName,Prof1,Prof2 from Programmer 
where year(getdate())-year(DOB) = (Select min(year(getdate())-year(DOB))from Programmer 
where Prof1 like 'DBASE' or Prof2 like 'DBASE');

--53. Which Female Programmer earning more than 3000 does not know C, C++, ORACLE or DBASE?

Select * from Programmer where GENDER ='F' and Salary>3000 and (Prof1 not in('C','C++','ORACLE','DBASE') or Prof2 not in('C','C++','ORACLE','DBASE'));

--54. Which Institute has most number of Students?

Select Top 1 Institute,count(PName) 'No of Student' from Studies Group by Institute Order by count(PName)Desc

--55. What is the Costliest course?

Select Course from Studies where Course_Fee= (Select max(Course_Fee) from Studies)

--56. Which course has been done by the most of the Students?

Select Top 1 Course,count(PName) as 'No of Student' from Studies Group by Course Order by count(PName)Desc

--57. Which Institute conducts costliest course.

Select Institute, Course, Course_Fee from Studies where Course_Fee=(Select max(Course_Fee) from Studies)

--58. Display the name of the Institute and Course, which has below AVG course fee.

Select Institute as 'Institute',Course, Course_Fee from Studies where Course_Fee<(Select avg(Course_Fee) from Studies)

--59. Display the names of the courses whose fees are within 1000 (+ or -) of the Average Fee,

Select Institute as 'Institute',Course ,Course_Fee from Studies 
where Course_Fee<(Select avg(Course_Fee)+1000 from Studies) and Course_Fee>(Select avg(Course_Fee)-1000 from Studies)

--60. Which package has the Highest Development cost?

Select Developin, DCost from Software where DCost = (select max(DCost) from Software)

--61. Which course has below AVG number of Students?

Select Course, count(PName) as 'No of Student' from Studies Group by Course having count(PName)<(Select avg(count(PName)) from Studies Group by count(PName))

--62. Which Package has the lowest selling cost?

Select Title, SCost from Software where SCost=(Select min(SCost) from Software)

--63. Who Developed the Package that has sold the least number of copies?

Select PName, Sold from Software where Sold=(Select min(Sold) from Software)

--64. Which language has used to develop the package, which has the highest sales amount?

Select Developin, SCost from Software where SCost=(Select max(SCost)from Software)

--65. How many copies of package that has the least difference between development and selling cost where sold.

Select Title, Sold from Software where Title=(Select Title from Software Where(DCost-SCost)=(Select min(DCost-SCost) from Software))

--66. Which is the costliest package developed in PASCAL.

Select Title from Software where DCost=(select max(DCost) from Software where DEVELOPIN = 'PASCAL')

--67. Which language was used to develop the most number of Packages.

Select Developin from Software Group By Developin having max(Developin)=(select max(Developin) from Software)

--68. Which programmer has developed the highest number of Packages? 

Select PName from Software Group By PName having max(Sold)=(select max(Sold) from Software)

--69. Who is the Author of the Costliest Package?

Select PName, DCost from Software where DCost=(Select max(DCost) from Software)

--70. Display the names of the packages, which have sold less than the AVG number of copies.

Select Title from Software where Sold<(Select avg(Sold) from Software)

--71. Who are the authors of the Packages, which have recovered more than double the Development cost?

Select PName from Software where Sold * SCost>2 * DCost

--72. Display the programmer Name and the cheapest packages developed by them in each language.

Select PName, Title from Software where DCost in (Select min(DCost) from Software Group by Developin)

--73. Display the language used by each programmer to develop the Highest Selling and Lowest-selling package.

Select PName, Developin from Software 
where Sold in (Select max(Sold) from Software Group by PName)
Union
Select PName, Developin from Software where 
Sold in (Select min(Sold) from Software Group by PName)

--74. Who is the youngest male Programmer born in 1965?

Select PName from Programmer where DOB=(Select max(DOB) from Programmer where year(DOB) like '1965')

--75. Who is the oldest Female Programmer who joined in 1992?

Select PName from Programmer where DOJ=(Select min(DOJ) from Programmer where year(DOJ) like '1992' and Gender='F')

--76. In which year was the most number of Programmers born.

Select Distinct year(DOB) from Programmer where year(DOJ)=(Select min(year(DOJ)) from Programmer)

--77. In which month did most number of programmers join?

Select Distinct DATENAME(Month,DOJ) Month from Programmer where DATENAME(Month, DOJ)=(Select Min(DATENAME(Month, DOJ)) from Programmer)

--78. In which language are most of the programmer’s proficient.

select prof1,prof2,count(pname) as count from programmer group by prof1,prof2 order by count desc limit 2;

--79. Who are the male programmers earning below the AVG salary of Female Programmers?

Select PName from Programmer where Gender='M' and Salary< (Select(avg(Salary)) from Programmer where Gender='F')

--80. Who are the Female Programmers earning more than the Highest Paid?

Select PName from Programmer where Gender like 'F' AND Salary>(Select(max(Salary)) from Programmer where Gender like 'M')

--81. Which language has been stated as the proficiency by most of the Programmers?

Select Prof1 from Programmer Group by Prof1 having Prof1 = (Select max(Prof1)from Programmer)
Union
Select Prof2 from Programmer Group by Prof2 having Prof2 = (Select max(Prof2)from Programmer)

--82. Display the details of those who are drawing the same salary.

Select PName, Salary from Programmer where Salary = any(select Salary from Programmer Group by Salary having Salary = Salary and count(*)>1)

--83. Display the details of the Software Developed by the Male Programmers Earning More than 3000/-.

Select s. * from Programmer p, Software s where p.PName=s.PName and Salary>3000 and Gender='M'

--84. Display the details of the packages developed in Pascal by the Female Programmers.

Select s. * from Programmer p, Software s where p.PName=s.PName and Gender='F'and Developin='Pascal'

--85. Display the details of the Programmers who joined before 1990.

Select * from Programmer where year(DOJ)<1990

--86. Display the details of the Software Developed in C By female programmers of Pragathi.

Select s. * from Software s, Studies st, Programmer p where s.PNAME = st.PName and p.PNAME = s.PName and Gender='F'and Institute='Pragathi'

--87. Display the number of packages, No. of Copies Sold and sales value of each programmer institute wise.

Select st.Institute, count(s.Developin) 'Packages',count(s.Sold) 'Sold',sum(s.Sold * s.SCost) 'Sale_value' from software s,studies st 
where s.PName=st.PName Group by st.Institute

--88. Display the details of the software developed in DBASE by Male Programmers, who belong to the institute in which most number of Programmers studied.

Create Table INST( Ins Varchar(20), CNT INT);
Insert into INST
Select Institute, Count(PName) from studies Group by Institute;
Select distinct SW. * from Software as SW, programmer as PG, studies as ST, INST
Where Developin='DBASE' and Gender = 'M' and SW.PName = PG.PName
and Institute = INS and CNT = (Select Max(CNT) from INST);

--89. Display the details of the software Developed by the male programmers Born before 1965 and female programmers born after 1975.

Select s. * from Programmer p, Software s where s.PName=p.PName and Gender='M' and year(DOB)<1964 or Gender='F'and year(DOB)>1975

--90. Display the details of the software that has developed in the language which is neither the first nor the second proficiency of the programmers.

Select s. * from Programmer p, Software s where s.Pname=p.Pname and(Developin<>Prof1 and Developin<>Prof2)

--91. Display the details of the software developed by the male students of Sabhari.

Select s. * from Programmer p, Software s, Studies st where p.PName=s.PName and s.PNAME = st.PName and Gender='M' and Institute='Sabhari'

--92. Display the names of the programmers who have not developed any packages.

Select PName from Programmer where PName not in(select PName from Software)

--93. What is the total cost of the Software developed by the programmers of Apple?

Select sum(SCost) from Software s, Studies st where s.PName=st.PName and Institute='Apple'

--94. Who are the programmers who joined on the same day?

select p1.PName,p1.DOJ from Programmer p1,Programmer P2 where p1.DOJ=p2.DOJ and p1.Pname<>p2.Pname

--95. Who are the programmers who have the same Prof2?

Select PName from Programmer where Prof2= any(Select Prof2 from Programmer
Group by Prof2 having count(*) >1)

--96. Display the total sales value of the software, institute wise.

select st.Institute, sum(s.Sold * s.SCost) 'Sale_Value' from software s, studies st where st.Pname=s.Pname group by st.Institute

--97. In which institute does the person who developed the costliest package studied.

Select Institute from Software st, Studies s where s.Pname=st.Pname 
group by Institute, DCost having max(DCost) = (select max(DCost) from Software)

--98. Which language listed in prof1, prof2 has not been used to develop any package.

Select Prof1 from Programmer where Prof1 not in(select Developin from software)
UNION 
Select Prof2 from Programmer where Prof2 not in(select Developin from software)

--99. How much does the person who developed the highest selling package earn and what course did HE/SHE undergo. 

select p.Salary, st.Course from Programmer p, Software s, Studies st 
where p.Pname=s.Pname and s.Pname=st.Pname and SCost=(select max(SCost) from Software)

--100. What is the AVG salary for those whose software sales is more than 50,000/-.

Select avg(Salary) from Programmer p,Software s where p.PName=s.PName and Sold * SCost>50000

--101. How many packages were developed by students, who studied in institute that charge the lowest course fee?

select count(s.Pname) as 'Packages' from Software s, Studies st 
where s.Pname=st.Pname Group by s.Pname, Course_Fee having min(Course_Fee)=(select min(Course_Fee) from Studies)

--102. How many packages were developed by the person who developed the cheapest package, where did HE/SHE study?

Select count(*)from Programmer p,Software s where s.Pname=p.Pname Group by Developin having min(DCost)=(select min(DCost) from software)

--103. How many packages were developed by the female programmers earning more than the highest paid male programmer?

select count(Developin) from programmer p,software s 
where s.Pname=p.Pname and Gender='F'and salary>(select max(salary) 
from programmer p,software s where s.Pname=p.Pname and Gender='M')

--104. How many packages are developed by the most experienced programmer form BDPS.

select count(*) from Software s,Programmer p where p.Pname=s.Pname 
group by DOJ having max(DOJ)=(select max(DOJ) from Studies st, Programmer p,Software s 
where p.Pname=s.Pname and st.Pname=p.Pname and (Institute='BDPS'))

--105. List the programmers (form the software table) and the institutes they studied.

select PName, Institute from Studies where PName not in(select PName from Software)

--106. List each PROF with the number of Programmers having that PROF and the number of the packages in that PROF.

Select count(*),sum (SCost * Sold - DCost) as 'PROFIT' 
from Software where Developin in (select Prof1 from Programmer)Group by Developin

--107. List the programmer names (from the programmer table) and No. Of Packages each has developed. 

Select s.pname, count(Developin) from Programmer p, Software s where p.Pname=s.Pname Group by s.Pname








