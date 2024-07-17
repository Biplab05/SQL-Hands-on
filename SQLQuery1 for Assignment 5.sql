use Biplab;

Create table Orders(order_id int,order_date varchar(20),amount int,customer_id int)
insert into Orders Values
(1,'1st jan 2023',100,100),
(2,'7th jan 2023',109,103),
(3,'5th jan 2023',115,105),
(4,'2nd feb 2023',100,110),
(5,'4th Mar 2023',120,103);

Select * from Orders;

select * from Orders
order by amount DESC;

Create Table Employee_details1(Emp_id int, Emp_name varchar(20), Emp_salary int);
Insert into Employee_details1 Values
(1,'Subhasish Dutta', 35000),
(2,'Mousumi Parida', 31000),
(3,'Debasish Dutta',33000),
(4,'Sasmita Das',29000),
(5,'Shreyansh Dutta',27000);
(6,'Priyanka Sahu',25000);

Select * From Employee_details1

Create Table Employee_details2(Emp_id int, Emp_name varchar(20), Emp_salary int);
Insert into Employee_details2 Values
(1,'Biplab Parida',30000),
(2,'Subhasmita Mohanty',32000),
(3,'Kalyani Dey',28000),
(4,'Ramesh Ch Parida',33000),
(5,'Debiprasad Samal',31000);
(6,'Priyanka Sahu',25000);

Select * From Employee_details2

Select * From Employee_details1
UNION
Select * From Employee_details2

Select * From Employee_details1
INTERSECT
Select * From Employee_details2

Select * From Employee_details1
EXCEPT
Select * From Employee_details2

Select * From Employee_details2
EXCEPT
Select * From Employee_details1