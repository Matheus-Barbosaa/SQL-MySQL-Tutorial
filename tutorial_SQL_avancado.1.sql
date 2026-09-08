/* Tutorial SQL Avançado | CTE (Commom Table Expression)

CTE (Common Table Expression)
1.não recorrente (NON-RECURSIVE)
2.recorrente (RECURSIVE)

CTE - É uma tabela virtual - um resultado nomeado e temporario que você pode usar com SELECT, INSERT, UPDATE OU DELETE
	- Redução da compleixade. Consultas mais simples e façeis de ler.
    - Descontrução de consultas normalmente complexas em blocos simples a serem usados e reutilizados.
    -  LIMITAÇÃO : Limitado ao escopo de uma única execução. Se precisar faer mais de uma execução, precisa declarr CTE multipl
    -  existe somente durante aquela consulta
    whit <nome>
    as
    (
		<definir_resultado_SELECT_satement>
	)
		<faz_referencia_e_executa>
        
*/

use sql_tutorial;

-- 1. EXEMPLO: média salarial por cargo (JobTitle)
with cte_salary
as
(
select JobTitle, avg(Salary) as AVGsalary
from employee
join employeesalary
	on employee.EmployeeID = employeesalary.EmployeeID
group by JobTitle
)
select JobTitle, AVGSalary
from cte_salary;

-- 2.EXEMPLO: agregação multi níbel. Qual a média dos valores salariais mínimos e máximos?
with cte_salary
as
(
select JobTitle 
		,min(Salary) as MINsalary
        ,max(Salary) as MAXsalary
from employee
join employeesalary
	on employee.EmployeeID = employeesalary.EmployeeID
group by JobTitle
)
select 
		avg (MINsalary) as AVGMINSalary
        ,avg (MAXsalary) as AVGMAXSalary
from cte_salary;


/* TEMP TABLES - Tabelas temporárias

-- Tabelas temporárias são tabelas que existem temporiariamenre no Sql
-- As tabelas temporárias são úteis para armazenar os conjuntos de resultados imediatos que são acessados várias vezes.
-- Voçê cria uma tabela usando HASHTAG no SQL SERVER
--  No MySQL você não precisa usar # para criar uma Temporary Table.
-- Ela fica disponível durante a sua sessão/conexão e depois é removida automaticamente quando a sessão termina.

*/

-- Criação da TEMP TABLE (tabela temporária)
create temporary table TempSalary(
	EmployeeID 	int,
    Salary 		int,
    Bonus 		int
);

select * 
from TempSalary;

-- Inserindo dados na TEMP TABLE
insert into TempSalary values
	(1001, 4500, 1000);

-- Um jeito de otimizar o código é criar uma tabela temporária usando partes do código para otimizar.

-- Criação da TEMP TABLE (tabela temporária) mais complexa
create temporary table TempSalary2(
	JobTitle 			nvarchar(50),
    EmployeesPerJOb 	int,
    AVGAge 				int,
    AVGSalary		 	int
);

-- inserindo valores de partes dos dados das tabelas employee e employeesalary
insert into TempSalary2
select JobTitle, count(JobTitle), avg(Age), avg(Salary)
from employee emp
join employeesalary sal
	on emp.EmployeeID = sal.EmployeeId
where JobTitle is not null
group by JobTitle;

select *
from TempSalary2;




