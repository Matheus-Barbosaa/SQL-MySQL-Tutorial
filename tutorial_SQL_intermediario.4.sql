/* Tutorial SQL intermediário | Aliasing

ALIASING AS

- Muda temporariamente o nome da coluna ou tabela no seu código
- Não afeta seu resultado
- É útil para a legibilidade do seu código

*/
use sql_tutorial;

select FirstName as FN
from employee;

-- Concatenar
SELECT CONCAT(FirstName, ' ', LastName) as Fullname
FROM employee;

-- Usada em funções de agregações
select avg(Age) as AVGage
from employee;

-- Muda nome de uma tabela. É importante quando trabalhando com JOINS
select avg(Age)
from employee as emp;

select emp.EmployeeID, sal.salary
from employee emp
join employeesalary sal
	on emp.EmployeeID = sal.EmployeeId;

-- Código mais organizado

/* PARTITION BY E GROUP BY

COMMENTS:
-Group By Statement reduzirá o número de linhas da tabela, acumulando-as e calculando as somas ou médias por grupo.

-Partition By divide o conjunto de resultados em partiçoes e altera a forma como a função do windows é calculada.
-Não reduz o número de linhas retornadas em sua saída.
*/

select *
from employee;

select *
from employeesalary;

-- Demonstrandp GROUP BY usando a coluna Gender. Quantida de empregados por gênero.alter
select gender, count(Gender)  -- Coluna derivada, com uma coluna real
from employee
where Gender is not null
group by Gender;

-- Número de linhas não é reduzido
-- PARTITION BY pegará o resultado dessa query e coloca-lo em todas as linhas da tabela
select FirstName, LastName, Gender, count(Gender) over (partition by gender)
as TotalGender
from employee
where Gender is not null;
-- Toda resultado da agregação estará em apenas uma coluna e não vai alterar o número d elinhas de uma tabela.

/* HAVING CLAUSE

A cláusula HAVING  foi adicionada ao SQL porque a cláusula WHERE não pode ser usada para filtrar resultados de funções de agregação.

Funções de agregação: MIN(), MAX(), SUM(), AVG() E COUNT()

*/

-- Group By é usado em conjunto com funções de agregação para agrupar linhas de acordo com  ou mais colunas.
select JobTitle, count(JobTitle)
from employee
group by jobTitle
having count(JobTitle) > 1;

-- Join
select e.JobTitle, avg(Salary)
from employee e
join employeesalary sl
	on e.EmployeeID = sl.EmployeeID
group by jobTitle
having avg(Salary) > 45000;

-- ObS:  usando AVG(Salary), o MySQL está retornando mais casas decimais do que o desejado.
-- usar ROUND() para deixar o resultado com 2 casas decimais:
select e.JobTitle, round(avg(Salary),2)
from employee e
join employeesalary sl
	on e.EmployeeID = sl.EmployeeID
group by jobTitle
having avg(Salary) > 45000;




