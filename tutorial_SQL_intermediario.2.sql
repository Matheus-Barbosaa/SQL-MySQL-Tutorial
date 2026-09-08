/* SQL turorial intermediário | UNIONS

UNION and UNION ALL

*/
use sql_tutorial;

select *
from employee;

select * 
from employeebrazil;

-- UNION: união de tabelas que contenham o mesmo número de colunas e mesmo tipo de dados.Remove valores duplicados
select *
from employee
union
select * 
from employeebrazil;

-- UNION ALL: não remove valores duplicados.Mostra toda a informação.
select *
from employee
union all
select * 
from employeebrazil;

-- Selecionando colunas
-- 1. O número de colunas e o mesmo nas 2 tabelas
-- 2. os tipos de dados são os mesmos
-- CUIDADO AO USAR UNION!

-- ex: neste ex aqui as tabelas tem os dados diferentes
select *
from employeesalary
union
select * 
from employeeaddress;


