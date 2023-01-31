Create database smDB 
Create table Employees ( 
Id int Identity Primary Key ,
FullName nvarchar(100) Not NULL Check(LEN(FullName)>3),
Salary Money,
Email nvarchar(100) Not NULL UNIQUE) 
Alter table Employees add  DepartmentId int Not Null foreign key References Departments(Id)
--EMPLOYEES TABLE INSERT ETMEK OLMADI
Insert into Employees values 
(1,'Riad Babayev',2500,1,'Riad@gmail.com'),
(2, N'Dəniz Əlizadə',800,2,'Deniz@gmail.com'),
(3, N'Süleyman İskəndərov',500,1,'Suleyman@gmail.com'),
(4, N'Nazlı Mehdiyeva',650,1,'Nazli@gmail.com')
Create table Departments (
Id int Primary Key,
Name nvarchar(100) Check(LEN(Name)>2) Not NULL)
Insert into Departments values 
(1,'Marketing Department'),
(2,'Finance Department')

Create database ShopDB
Create table Brands(
Id int Primary Key,
Name nvarchar(100)
)
Create table NoteBooks(
Id int Primary Key,
Name nvarchar(100), 
Price decimal(6,2),
BrandId int Foreign Key References Brands(Id)
)
Create table Phones(
Id int Primary Key,
Name nvarchar(100), 
Price decimal(6,2),
BrandId int Foreign Key References Brands(Id)
)
insert into Brands 
Values
(1,'Samsung'),
(2,'Iphone'),
(3,'Huawei')

insert into NoteBooks 
Values
(1,'Notbuk Apple MacBook Pro 16',7299.99,2),
(2,'Notbuk Apple MacBook Pro 13',3469.99,2),
(3,'Notbuk HUAWEI MateBook 15',1894.99,3)

insert into Phones 
Values
(1,'IPhone 14 Pro',3209.99,2),
(2,'HUAWEI Nova Y70',499.99,3),
(3,'Samsung Galaxy S22 ',1799.99,1),
(4,'Samsung Galaxy A53',999.99,1)

Select (Notebooks.Name+' '+Brands.Name) as BrandName, NoteBooks.Price from NoteBooks Left  Join Brands on NoteBooks.BrandId=Brands.Id
Select (Phones.Name+' '+Brands.Name) as BrandName, Phones.Price from Phones Left  Join Brands on Phones.BrandId=Brands.Id
Select * From Notebooks where Notebooks.BrandId in (Select Id From Brands where Brands.Name Like '%s%')
Select * From Notebooks where (NoteBooks.Price Between 2000 and 5000) OR NoteBooks.Price>5000
Select * From Phones where (Phones.Price Between 1000 and 1500) OR Phones.Price>1500
--8,9
Select Brands.Name, COUNT(NoteBooks.Id) From Notebooks Left Join Brands on Brands.Id=Notebooks.BrandId
Select Brands.Name, COUNT(Phones.Id) From Phones Left Join Brands on Brands.Id=Phones.BrandId
--10
Select Name,(select COUNT(NoteBooks.Id) From NoteBooks 
Join Phones on Phones.BrandId=Brands.Id
where NoteBooks.BrandId=Brands.Id) From Brands 

Select * From Notebooks
Full Join Phones on Phones.BrandId=NoteBooks.Id 

