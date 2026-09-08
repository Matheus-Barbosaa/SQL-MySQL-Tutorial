/* Tutorial SQL Intermediário | Inner/Outer Joins | Use cases

INNER JOIN, FULL,LEFT/RIGHT/ OUTER JOINS

*/

use sql_tutorial;

-- Join: usado para juntar duas tabelas através de uma coluna comum entre ela.
select *
from employee;

select *
from employeesalary;

-- INNER JOIN OU APENAS JOIN: retorna os registros que são comum nas 2 tabelas
select *					-- Retorna todos os valores
from employee				-- Tabela A
inner join employeesalary	-- tabela B
	on employee.EmployeeID = employeesalary.EmployeeId;

select e.EmployeeID, e.FirstName, e.Age, sl.salary, sl.Bonus          -- retorna alguns valores e usando a boa prática do aliases
from employee e
inner join employeesalary sl
	on e.EmployeeID = sl.EmployeeId;

    
-- LEFT JOIN: Retorna todos os registros da tabela da esquerda(Tabela A) e os registros da tabela da direita(tabela B) que são comuns na tabela A
select *					-- Retorna todos os valores
from employee				-- Tabela A
left join employeesalary	-- tabela B
	on employee.EmployeeID = employeesalary.EmployeeId;
    
select e.EmployeeID, e.FirstName, e.Age, sl.salary, sl.Bonus          -- retorna alguns valores e usando a boa prática do aliases
from employee e
left join employeesalary sl
	on e.EmployeeID = sl.EmployeeId;
    
-- RIGHT JOIN: Retorna todos os registros da tabela da DIREITA(Tabela B) e os registros da tabela da ESQUERDA(tabela A) que são comuns na tabela b
select *					-- Retorna todos os valores
from employee				-- Tabela A
right join employeesalary	-- tabela B
	on employee.EmployeeID = employeesalary.EmployeeId;
    
select e.EmployeeID, e.FirstName, e.Age, sl.salary, sl.Bonus          -- retorna alguns valores e usando a boa prática do aliases
from employee e
right join employeesalary sl
	on e.EmployeeID = sl.EmployeeId;
    
/* FULL JOIN: Retorna todos os registros das tabelas A e B.
 
 No MySQL, não existe FULL JOIN / FULL OUTER JOIN diretamente.
 Para obter o mesmo resultado, você pode combinar um LEFT JOIN com um RIGHT JOIN usando UNION:
 
*/
SELECT *
FROM employee
LEFT JOIN employeesalary
    ON employee.EmployeeID = employeesalary.EmployeeId
    
UNION

SELECT *
FROM employee
RIGHT JOIN employeesalary
    ON employee.EmployeeID = employeesalary.EmployeeId;

-- -------------------------------------------------------


select e.EmployeeID, e.FirstName, e.Age, sl.salary, sl.Bonus          -- retorna alguns valores e usando a boa prática do aliases
from employee e
left join employeesalary sl
	on e.EmployeeID = sl.EmployeeId
    
 union
 
 select e.EmployeeID, e.FirstName, e.Age, sl.salary, sl.Bonus          -- retorna alguns valores e usando a boa prática do aliases
from employee e
right join employeesalary sl
	on e.EmployeeID = sl.EmployeeId;

-- EXERCICIO
-- Qual a média salarial dos vendedores (salesman)?

select JobTitle, avg(Salary) as mediasalary
from employee
left join employeesalary
	on employee.EmployeeID = employeesalary.EmployeeId
group by JobTitle;

-- Mostrando a média por vendedor 
-- Acréscimo da função 'OVER' 
-- você não precisa usar GROUP BY. A função OVER() já calcula a média mantendo cada vendedor na sua própria linha.

select FirstName, JobTitle, avg(Salary) over () as mediasalary
from employee
left join employeesalary
	on employee.EmployeeID = employeesalary.EmployeeId
    where JobTitle = 'Salesman';
    
    
