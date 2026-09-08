-- Criação do banco de dados
create database sql_tutorial;

-- Especificando o BD(banco de dados)
use sql_tutorial;



-- Select * From Statements
-- Seleciona os dados do seu banco de dados e os dados retornados são armazenados numa tabela resultado.

select * from employee;

-- LIMIT : retorna as linhas que quisermos definir. Usada quando a tabela tem milhões de linhas.
select  * from 
employee limit 2;

-- DISTINCT : retorna valores únicos de uma coluna
select distinct(EmployeeID) 
from employee;

select distinct(Gender) 
from employee;

-- Funçoes Básicas

-- COUNT: retorna o número de linhas em uma tabela
select COUNT(*) 
from employee;

-- COUNT: retornando  número de linhas de uma coluna ele não retorna valores nulos (NULL)
select COUNT(Gender) 
from employee;

-- ALIASES: nomeia uma coluna
select COUNT(Gender) as CountGender
from employee;

-- MAX, MIN E AVG(média)

select * 
from employeesalary;

-- Retorna o maior valor dos sálarios
select max(Salary) as Maior_Salario
from employeesalary;

-- Retorna o menor valor dos salários
select min(Salary) as Menor_salario
from employeesalary;

-- Retorna a Média dos salários
select avg(Salary) as Media_salarios
from employeesalary;

/* WHERE STATEMENT (cláusula)

=, <>, <, >, IN, AND, OR, LIKE, NULL, NOT NULL

*/

-- WHERE: usado para limitar quantidade de dados e especificar qual dado voçê quer

-- Retorna os dados apenas do valor 'Kate'
select *
from employee
where Firstname = 'Kate';    

-- Retorna todos os dados diferente de 'Kate'
select *
from employee
where Firstname <> 'Kate';	

	-- Retorna os dados de quem tem a idade maior a 30
select *
from employee
where Age > 30;			

-- Retorna os dados de quem tem a idade maior ou igual a 30
select *					
from employee
where Age >= 30;			

-- Operador AND: ambos os critério devem ser corretos

-- Retorna os dados de quem tem a idade menor ou igual a 32 e o gênero masculino 'M'
select *					
from employee
where Age <= 32 and Gender = 'M';     

-- Operador OR: apenas um critério deve ser correto

select *					
from employee
where Age <= 32 or Gender = 'M'; 

-- Operador LIKE: usado para retornar informações de texto (as vezes para informações númericas)
-- Usar o % para procurar informaçoes 
select *
from employee
where Firstname like 's%n%';			

-- NULL
-- Retorna apenas as linhas que contém valores nulo
select *
from employee
where FirstName is null;				

-- Retorna  as linhas da coluna que não contém valores nulos
select *
from employee
where FirstName is not null;			

-- Operador IN: variações declarações iguais
-- Podendo selecionr vários dados
select *
from employee
where FirstName in ('Kate', 'Steven', 'Chris');

-- GROUP BY - Agrupa linhas baseado em semelhançãs entre elas
-- No GROUP BY não se adiciona coluna derivadas, apena colunas reais

select *
from employee;

select Gender
from employee
where Gender is not null
group by Gender;

select Gender, count(Gender) 
from employee
where Gender is not null
group by Gender;

select Gender, Age, count(Gender) 
from employee
where Gender is not null
group by Gender, Age;

-- ORDER BY - coloca em ordem os dados de uma coluna
-- ASC: Ascendente (Default)
-- DESC: Decrescente

select Gender, count(Gender) as countgender
from employee
where Gender is not null
group by Gender
order by countgender desc;

select * 
from employee
order by Age, gender;

select * 
from employee
order by Age desc, gender desc;

-- Usando números que correspondem as colunas pra fazer a consulta de cima
select * 
from employee
order by 4 desc, 5 desc;


