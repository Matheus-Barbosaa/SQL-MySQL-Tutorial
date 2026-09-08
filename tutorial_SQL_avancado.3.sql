/* VIEWS

Uma VIEW é uma consulta SQL armazenada que funciona como uma tabela virtual.
Ela não armazena os dados da mesma forma que uma tabela. 
A VIEW armazena a consulta e mostra os dados quando  fazemos um SELECT nela.

-- IMPORTÂNCIA: 
- Facilita consultas complexas. 
- Evita repetir códigos SQL. 
- Pode organizar e simplificar os dados. 
- Permite reutilizar consultas com JOIN, WHERE, etc. 
- Pode ajudar no controle de acesso aos dados.

Estrutura básica: 
	create view nome_da_view as 
    select ... 
    from ...

- Para consultar: 
 select * 
 from nome_da_view; 

Resumindo: -- VIEW = consulta armazenada que pode ser reutilizada

*/


-- VIEW 1 — informações dos funcionários
-- Essa View junta employee com employeeaddress:
-- Essa View não terá acesso ao salário, pois não terá a tabela para tal.

create view vw_funcionarios as
select
    e.EmployeeID,
    e.FirstName,
    e.MiddleName,
    e.Lastname,
    e.Age,
    e.Gender,
    e.JobTitle,
    a.HouseNumber,
    a.PostCode
from employee e
left join employeeaddress a
    on e.EmployeeID = a.EmployeeID;

-- No MySQL, você pode alterar a View diretamente usando create or replace view.
-- Sem precisar Deletar

-- Tratando os valores Nulos
create or replace view vw_funcionarios as
select
    e.employeeid,
    e.firstname,
    coalesce(middlename, 'Não informado'),
    e.lastname,
    e.age,
    e.gender,
    e.jobtitle,
    coalesce(a.housenumber, 0) as housenumber,
    coalesce(a.postcode, 0) as postcode
from employee e
left join employeeaddress a
    on e.employeeid = a.employeeid;

select *
from vw_funcionarios;


-- VIEW 2 
-- funcionários + salário + bônus
-- Agora vamos juntar 3 tabelas:
-- employee, employeesalary, employeeaddress
-- E já vamos calcular o salário total.

create view vw_resumofuncionarios as
select
    e.employeeid,
    e.firstname,
    e.lastname,
    e.jobtitle,
    s.salary,
    s.bonus,
    coalesce(s.salary, 0) + coalesce(s.bonus, 0) as salariototal,
    a.housenumber,
    a.postcode
from employee e
left join employeesalary s
    on e.employeeid = s.employeeid
left join employeeaddress a
    on e.employeeid = a.employeeid;

select *
from vw_resumofuncionarios;

/*
-- FUNCTIONS (FUNÇÕES)  
-- Uma FUNCTION é um bloco de código SQL criado para  realizar uma tarefa e retornar um único valor. 
-- Ela pode receber parâmetros, consultar tabelas,  realizar cálculos e utilizar condições. 
 -- Estrutura básica: 
 DELIMITER //
	CREATE FUNCTION NomeDaFuncao(parametro TIPO) 
    RETURNS TIPO 
    BEGIN 
    comandos SQL 
    RETURN resultado; 
    END // 
DELIMITER ;
    Resumindo:  FUNCTION = recebe → processa → retorna um valor. É útil para reutilizar uma mesma lógica várias vezes.
*/

use sql_tutorial;

/*
-- IMPORTANTE
-- deterministic = para os mesmos parâmetros,
-- retorna sempre o mesmo resultado.

-- reads sql data = a function pode ler dados
-- das tabelas, mas não altera esses dados.
*/

-- Objetivo: receber o EmployeeID e retornar o nome completo.
DELIMITER //

create function NomeCompleto(id int)
returns varchar(150)
reads sql data
begin
    declare nome varchar(150);

    select concat(
        FirstName, ' ',
        coalesce(Middlename, ''), ' ',
        LastName
    )
    into nome
    from employee
    where EmployeeID = id;

    return trim(nome);         -- O trim() ajuda a limpar espaços no começo e no final.
end //

DELIMITER ;

select nomecompleto(1003) as NomeCompleto;

-- Objetivo: receber o EmployeeID e retornar Salário + Bônus.
DELIMITER $$

create function SalarioTotal(id int)
returns decimal(10,2)
reads sql data
begin
    declare salario_total decimal(10,2);

    select coalesce(salary, 0) + coalesce(bonus, 0)
    into salario_total
    from employeesalary
    where employeeid = id;

    return salario_total;
end $$

DELIMITER ;

select salariototal(1001) as SalarioTotal;

-- Agora vamos juntar employee + employeesalary e utilizar CASE.
-- A função vai receber o EmployeeID e classificar o salário:

DELIMITER //

create function classificasalario(id int)
returns varchar(50)
reads sql data
begin
    declare resultado varchar(50);

    select
        case
            when salary is null then 'salário não informado'
            when salary >= 60000 then 'alto salário'
            when salary >= 45000 then 'bom salário'
            else 'salário regular'
        end
    into resultado
    from employeesalary
    where employeeid = id;

    return resultado;
end //

DELIMITER ;

select 
    EmployeeID,
    FirstName,
    classificasalario(EmployeeID) as classificacao
from employee
where EmployeeID is not null;

select classificasalario(1001) as classificacao;

/* STORED PROCEDURE (SP) OU PROCEDIMENTO ARMAZENADO

-É um conjunto de instruções que podem ser executados de uma só vez.alter
Quando usar?
- Armazenar tarefas repetitivas, sem precisar modificar o código. Os usuários podem executar os procedimentos armazenados sem precisar acessar as tabelas do banco de dados.
- Mantém a segurança do banco de dados
- Permite a adição de parâmetros - (SP) vai atuar de acordo com o valor do parâmetro.

Sintaxe

DELIMITER //

CREATE PROCEDURE <<procedure_name>>
AS
	BEGIN
			<<sql_query>>
	END //

DELIMITER ;

*/

DELIMITER //
CREATE PROCEDURE listarClientes(in id_cliente int)    -- id() → os parênteses fazem parte da declaração da procedure, mesmo sem parâmetros.
BEGIN
		SELECT * 
        FROM CUSTOMERS
		where CustomerID = id_cliente;
END //
DELIMITER ;

CALL listarClientes(101);					-- Chamar a procedure

select *
from customers;

-- Objetivo: receber o customerid, buscar o valor do pedido do cliente, armazenar esse valor em uma variável e depois classificar o cliente.
DELIMITER //
create procedure analisarcliente(in id_cliente int)
begin
		declare valor_pedido decimal(10,2);
		declare classificacao varchar(30);
		
        select FinalOrderPrice
		into valor_pedido
		from customers
		where CustomerID = id_cliente;
        
		set classificacao =
        case
            when valor_pedido >= 1000 then 'cliente vip'
            when valor_pedido >= 500 then 'cliente regular'
            else 'cliente comum'
        end;
        
        
		select
        CustomerID,
        FirstName,
        LastName,
        FinalOrderPrice,
        classificacao as classificacao
    from customers
    where CustomerID = id_cliente;

end //
DELIMITER ;

call analisarcliente(104);
