

-- Criando Tabela employee
-- OBS NÃO USEI PRIMARY KEY NEM AUTO INCREMENT

use sql_tutorial;

create table employee(    
EmployeeID 	int,
FirstName 	varchar(50),
MiddleName		varchar(50),
Lastname	varchar(50),
Age 		int,
Gender 		varchar(50),
JobTitle 	varchar(50)
);

-- Adicionando primare key (chave primária)


-- Adicionando uma coluna nova na tabela
ALTER TABLE employee
ADD MiddleName VARCHAR(50);

-- Colocando a nova coluna no lugar correto
ALTER TABLE employee
MODIFY COLUMN MiddleName VARCHAR(50) AFTER FirstName;

-- Mostra a Tabela
show tables;
-- Detalhes da Tabela
describe employee;

-- Adicionando dados para a tabela employee
insert into employee values
(1001, 'Adam', null, 'Green', 30, 'M', 'Salesman'),
(1002, 'Kate', NULL, 'Baker', 30, 'F', 'Receptionist'),
(1003, 'John', 'Bryan', 'Green', 29, 'M', NULL),
(1004, 'Chris', NULL, 'Patel', 31, 'M', 'Accountant'),
(1005, 'Steven', 'Eliot', 'Cook', 32, 'M', 'Salesman'),
(NULL, 'Joshua', NULL, 'Bennet', 35, 'M', 'HR'),
(1007, 'Rachel', 'Rose', 'Cook', 32, 'F', 'Regional Manager'),
(NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1009, 'John', 'Lee' ,NULL, 31, 'M', 'Buyer')
;

-- Criando tabela employeesalary
create table employeesalary(
EmployeeId	int,
Salary		int,
Bonus		int
);

-- Inserindo dados na tabela employeesalary
insert into employeesalary values
(1001, 45000, 2000),
(1002, 36000, 1000),
(1003, NULL, 500),
(1004, 47000, 1000),
(1005, 50000, 4000),
(1006, 65000, 500),
(1007, 41000, 1000),
(1008, NULL, 800),
(1009, 42000, 600),
(1010, NULL, 300),
(1011, 50000, NULL),
(1012, 45000, 1000),
(1013, NULL, 800)
;

use sql_tutorial;

-- Criando nova tabela employeebrazil

CREATE TABLE employeebrazil
(EmployeeID		int,
FirstName		varchar(50),
MiddleName		varchar(50),
LastName		varchar(50),
Age				int,
Gender			varchar(50),
JobTitle		varchar(50))
;

-- Inserindo dados para a tabela employeebrazil
INSERT INTO employeebrazil VALUES
(1010, 'Rafael', NULL, 'Silva', 30, 'M', 'Salesman'),
(1011, 'Maria', 'Clara', 'Ferreira', 30, 'F', 'Receptionist'),
(1012, 'Carlos', 'Alberto', 'Oliveira', 29, 'M', NULL),
(1013, 'Laura', NULL, 'Santos', 31, 'M', 'Accountant'),
(1013, 'Laura', NULL, 'Santos', 31, 'M', 'Accountant');

-- Criando nova tabela employeeaddress

CREATE TABLE employeeaddress
(EmployeeID		int,
HouseNumber		int,
PostCode		int);

INSERT INTO employeeaddress VALUES
(1001, 33, 563285),
(1002, 45, 458965),
(1003, 2, 258463),
(1004, 77, 259932),
(1005, 44, 254783),
(1006, 89, 258463),
(1007, 13, 235974),
(1008, 7, 254186),
(1009, NULL, 325964),
(1010, 8, 17965234),
(1011, 67, 2154896),
(1012, 91, 2154896),
(1013, NULL, 1796523);

select * 
from employeeaddress;

-- Criação da tabela CUSTOMERS
DROP TABLE IF EXISTS CUSTOMERS;

CREATE TABLE customers
(CustomerID				int,
FirstName				varchar(50),
LastName				varchar(50),
FinalOrderPrice			int)
;

-- Inserindo dados na tabela CUSTOMERS
INSERT INTO customers VALUES
(101, 'Rafael','Silva', 100),
(102, 'Maria', 'Ferreira', 200),
(103, 'Carlos', 'Oliveira', 150),
(104, 'Laura', 'Santos', 1000),
(105, 'Laura', 'Santos', 589)
;

select * 
from customers;