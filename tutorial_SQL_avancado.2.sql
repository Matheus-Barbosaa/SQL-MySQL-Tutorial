/* Tutorial SQL Avançado

SUB QUERY - SUB CONSULTA 

-- IMPORTANTE !!! USAR SUBCONSULTA APENAS EM CONSULTAS MENORES, GRANDES VOLUMES DE DADOS USAR JOINS.
-- CUIDADO, SUBCONSULTAS EM CLÁUSULAS DO TIPO SELECT, DIFICEIS DE LER E SÃO EXECUTADAS LENTAMENTE, POIS É FEITO VARREDURAS CONSUMINDO MAIS RECURSOS DENTRO DA APLICAÇÃO.
-- JOIN É MAIS EFICIENTES QUANDO SE JUNTAR MUITAS COLUNAS E MAIS TABELAS.
 
Consulta dentro de outra consulta, a subquery é executada primeiro e os resultados gerados por ela serão utilizados pela consulta principal.alter

SUB QUERY COMO FILTRO com a cláusula WHERE
SUB QUERY COMO FILTRO com a cláusula HAVING
SUB QUERY COMO COLUNA usando o SELECT
SUB QUERY COMO FONTE DE DADOS(tebela) usando o FROM

*/

use sql_tutorial;

/* SUB QUERY COMO FILTRO com a cláusula WHERE
-- Voçê pode confiar no resultado da subconsulta
-- Garante que os resultados serão atualizados
*/

select EmployeeID
from employeesalary
where Salary > 45000;

select EmployeeID, FirstName, Lastname
from employee
where EmployeeID in (select EmployeeID
					from employeesalary
					where Salary >= 45000)
;

select *
from employeesalary;

/* SUB QUERY COMO FILTRO com a cláusula HAVING
-- Voçê pode confiar no resultado da subconsulta
-- Garante que os resultados serão atualizados
*/

select * 
from customers;

select round(avg(FinalOrderprice),2)
from customers;

select CustomerID, 
		round(avg(FinalOrderPrice),2) as média
from customers
group by CustomerID
		having avg(FinalOrderPrice) > (
        select avg(FinalOrderprice)
		from customers
);

/* SUB QUERY COMO COLUNA usando o SELECT
-- Subquery no SELECT STATEMENT se comporta como uma coluna
*/

-- CUIDADO !!! SUBCONSULTAS EM CLÁUSULAS DO TIPO SELECT, DIFICEIS DE LER E MAIS CUSTOSAS PRA PERFORMANCE
select EmployeeID,
		FirstName, 
        (select PostCode from employeeaddress 
        where employee.EmployeeID = employeeaddress.EmployeeID) as PostCode,
		(select HouseNumber from employeeaddress
        where employee.EmployeeID = employeeaddress.EmployeeID)	as HouseNumber				
from employee;

-- MESMA CONSULTA ÁCIMA USANDO JOIN. Boa Prática
-- JOIN É MAIS EFICIENTES QUANDO SE JUNTAR MUITAS COLUnAS E MAIS TABELAS

select  emp.EmployeeID, 
		emp.FirstName,
        dres.PostCode as PostCode,
        dres.HouseNumber
from employee emp
left join employeeaddress dres
	on emp.EmployeeID = dres.EmployeeID;

/* 
SUB QUERY COMO FONTE DE DADOS(tebela) usando o FROM
A consulta interna retorna dados que serão empregados pela consulta principal
Subquery no FROM produz fonte de dados, DATABASE
*/

select PostCode, Salary
from 
	(select employee.EmployeeID, 
			employee.FirstName, 
            employee.LastName, 
            employeesalary.Salary, 
            employeeaddress.PostCode
	from employee
	left join employeesalary
		on employee.EmployeeID = employeesalary.EmployeeID
	left join employeeaddress
		on employee.EmployeeID = employeeaddress.EmployeeID)
 as DTB
where Salary > 45000;

select *
from employee;

select *
from employeesalary;

select * 
from employeeaddress;
