use Biplab;
Create table Customer(customer_id int,first_name varchar(20),last_name varchar(20),email varchar(30),address varchar(40),city varchar(15),state varchar(20),Zip int);
Select * from Customer;

Insert into Customer values
(100,'Padmini','Solanki','padminisolanki@test.co','dakuta','pune','madhya pradesh',760546);
Insert into Customer values
(101,'Garima','Chaurasia','garimachaurasia@test.com','hariad','San Jose','Maharastra',7564456),
(102,'Sagar','Wavhal','sagarwavhal@test.com','kasida','Mumbai','Maharastra',756442),
(103,'Gorav','Karan','gouravkaran@test.com','chapla','San jose','Odisha',756056),
(104,'Geeta','Sonawane','geetasonawane@test.com','chakan','Pune','Maharastra',756195);

Create table Orders(order_id int,order_date varchar(20),amount int,customer_id int)
insert into Orders Values
(1,'1st jan 2023',100,100),
(2,'7th jan 2023',109,103),
(3,'5th jan 2023',115,105),
(4,'2nd feb 2023',100,110),
(5,'4th Mar 2023',120,103);

Select * from Customer;
Select * from Orders;

Select * from Customer c inner join Orders o on c.customer_id=o.customer_id;

Select * from Customer c
left join Orders o
on c.customer_id=o.customer_id;

Select * from Customer c
Right join Orders o
on c.customer_id=o.customer_id;

Update Orders
set amount=100
where customer_id=103;

--i have been upadte customer_id 103, as i have created from 100 to 104.