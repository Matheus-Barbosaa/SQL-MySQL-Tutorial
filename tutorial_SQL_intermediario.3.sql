/* Tutorial SQL intermediário | CASE Statement | USE CASES

CASE STATEMENT

sintaxe:

CASE
	WHEN condição1 THEN resultado1
    WHEN condição2 THEN resultado2
    WHEN condiçãoN then resultadoN
    ELSE resultado
END;

*/

use sql_tutorial;

select *
from employee;

select 
	FirstName,
    Age,
	CASE
		when Age = 35 then 'Joshua'
		when Age > 32 then 'old'
		else 'young'
	END as categoria
FROM employee
WHERE FirstName is not null;

SELECT
    FirstName,
    Age,
    CASE
        WHEN Age < 30 THEN 'Júnior'
        WHEN Age BETWEEN 30 AND 40 THEN 'Pleno'
        WHEN Age > 40 THEN 'Sênior'
        ELSE 'Não informado'
    END AS Nivel
FROM employee
WHERE FirstName is not null;

-- CASE COM JOIN

-- exercício
-- Qual a comissão para Salesman, Regional Manager e HR
select Firstname, JobTitle, Salary,
	case
		when JobTitle = 'Salesman' then Salary * 0.10
        when JobTitle = 'Regional Manager' then Salary *0.05
        when JobTitle = 'HR' then Salary * 0.0001
        else Salary * 0.03
	end as Comission
    from employee
    inner join employeesalary
		on employeesalary.EmployeeID = employee.EmployeeID;
        
/* ALTER, UPDATE e DELETE
ALTER : Ele é usado para modificar a estrutura de algo que já existe, como uma tabela.
UPDATE: altera uma linha pre-existente na tabela.
DELETE: remove linhas da tabela.alter
*/

-- ALTER

-- ADICIONANDO PRIMARY KEY (CHAVE PRIMÁRIA)
ALTER TABLE employee					-- Uma PRIMARY KEY não pode ter NULL.
ADD PRIMARY KEY (EmployeeID);      		-- Então, provavelmente existe pelo menos um funcionário na sua tabela

-- Além de não poder ser NULL, uma PRIMARY KEY também precisa ter valores únicos.
-- Verificando

SELECT EmployeeID, COUNT(*)
FROM employee
GROUP BY EmployeeID
HAVING COUNT(*) > 1;              -- Retornou valores duplicados além de null

-- SÓ CONSIGO ALTERAR PRA PRIMARY KEY EU TIRAR OS REGISTROS NULOS DE EmployeeID

-- UPDATE

-- ALTERANDO A LINHA SEM MECHER NA ESTRUTURA DA TABELA
-- CORREÇÃO
-- 1. Desativar o Safe Update Mode
-- 2. Desativar somente durante a sessão

SET SQL_SAFE_UPDATES = 0;

update employeesalary
set EmployeeID = 1013
where Bonus = 800;

update employee
set JobTitle = 'Salesman'
where EmployeeID = 1003;

-- DELETE
-- segredo de proteção : USE A DECLARAÇÃO SELECT ANTES DE USAR DELETE. ISSO TE AJUDA A VERIFICAR SE ESTÁ DELETANDO A COISA CERTA
delete from employee
where EmployeeID = 1009;

select * from employee
where EmployeeID = 1009;

-- Reativando o Safe Update Mode
SET SQL_SAFE_UPDATES = 1;

select *
from employeesalary;

select * 
from employee;

/* CONCLUSÃO
SE A CRIAÇÃO DAS TABELAS FOREM ADICIONADAS COM PRIMARY KEY, OS COMANDOS DE UPDATE, DELETE E ALTER funcionão normalmente.
como as tabelas foram criadas sem as chaves primárias tive que seguir esse tutorial acima.
*/