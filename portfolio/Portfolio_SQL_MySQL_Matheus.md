# Documentação do meu aprendizado em SQL e MySQL

## Sobre este projeto

Este projeto faz parte do meu processo de aprendizado em **SQL e MySQL**.

Comecei o projeto acompanhando as aulas, explicações e exercícios da professora **Mrs. Data (@drlucienegomes)**. A partir desses conteúdos, fui praticando os comandos no MySQL, criando tabelas, fazendo consultas e tentando resolver os exercícios propostos.

Durante o aprendizado, também fui encontrando erros e dificuldades. Em vez de apenas corrigir o código, procurei entender o motivo de cada erro e como poderia resolver o problema.

Por isso, este projeto representa não somente os comandos que aprendi, mas também minha evolução durante os estudos.

---

## 1. Criação do banco e das tabelas

O projeto começou com a criação do banco:

```sql
CREATE DATABASE sql_tutorial;
USE sql_tutorial;
```

Depois comecei a criar as tabelas utilizadas nos exercícios, como:

* `employee`
* `employeesalary`
* `employeeaddress`
* `employeebrazil`
* `customers`

Nessa parte aprendi a utilizar comandos como:

```sql
CREATE TABLE
ALTER TABLE
INSERT INTO
SHOW TABLES
DESCRIBE
```

Também pratiquei alterações na estrutura das tabelas usando `ALTER TABLE`.

### Uma observação importante

As tabelas desse projeto foram criadas **sem PRIMARY KEY e FOREIGN KEY**.

Isso aconteceu porque o objetivo nessa etapa era acompanhar os exercícios do tutorial e aprender os comandos de SQL.

Hoje entendo que, em um banco de dados profissional, a definição de chaves e relacionamentos é muito importante. Porém, decidi manter o projeto dessa forma porque ele representa exatamente essa etapa do meu aprendizado.

---

## 2. SQL básico

Comecei pelos comandos mais básicos do SQL.

Pratiquei:

```sql
SELECT
WHERE
DISTINCT
LIMIT
ORDER BY
GROUP BY
```

Também aprendi a utilizar operadores como:

```sql
=
<>
<
>
<=
>=
```

e:

```sql
AND
OR
IN
LIKE
```

Nesse momento comecei a entender melhor como buscar somente as informações que realmente precisava dentro de uma tabela.

Também comecei a trabalhar com valores `NULL` utilizando:

```sql
IS NULL
IS NOT NULL
```

---

## 3. Funções de agregação

Depois comecei a trabalhar com funções para fazer cálculos nos dados:

```sql
COUNT()
MAX()
MIN()
AVG()
```

Um dos exercícios que fiz foi calcular a média salarial dos funcionários de acordo com o cargo:

```sql
SELECT JobTitle, AVG(Salary) AS mediasalary
FROM employee
LEFT JOIN employeesalary
ON employee.EmployeeID = employeesalary.EmployeeId
GROUP BY JobTitle;
```

Também aprendi a utilizar `ROUND()` para controlar as casas decimais dos resultados.

Essa parte começou a me mostrar como o SQL pode ser utilizado não somente para consultar dados, mas também para fazer análises.

---

## 4. JOINs

Os `JOINs` foram uma das partes que mais me ajudaram a entender como trabalhar com mais de uma tabela.

Pratiquei:

```sql
INNER JOIN
LEFT JOIN
RIGHT JOIN
```

Aprendi que cada tipo de `JOIN` pode trazer um resultado diferente dependendo de quais registros queremos manter na consulta.

### FULL JOIN

Durante os estudos, descobri que o MySQL não possui `FULL JOIN` diretamente.

Então aprendi que podemos utilizar uma combinação de:

```sql
LEFT JOIN
UNION
RIGHT JOIN
```

para chegar a um resultado semelhante.

Esse foi um dos momentos em que comecei a perceber que existem diferentes maneiras de resolver um mesmo problema em SQL.

---

## 5. UNION e UNION ALL

Também pratiquei:

```sql
UNION
UNION ALL
```

Aprendi que o `UNION` elimina registros duplicados, enquanto o `UNION ALL` mantém todos os registros.

Também entendi que as consultas precisam ter uma estrutura compatível para que os resultados possam ser unidos.

---

## 6. CASE

Depois comecei a utilizar `CASE` para criar classificações.

Por exemplo:

```sql
CASE
    WHEN Age < 30 THEN 'Júnior'
    WHEN Age BETWEEN 30 AND 45 THEN 'Pleno'
    ELSE 'Sênior'
END
```

Com isso aprendi que podemos utilizar os dados existentes para criar novas classificações dentro de uma consulta.

Também utilizei `CASE` junto com `JOINs` em alguns exercícios.

---

## 7. GROUP BY e HAVING

Aprendi a utilizar `GROUP BY` para agrupar os resultados.

Também entendi melhor a diferença entre `WHERE` e `HAVING`.

De forma simples:

* `WHERE` filtra os registros antes do agrupamento;
* `HAVING` filtra os grupos depois da agregação.

Um exemplo que pratiquei foi:

```sql
GROUP BY JobTitle
HAVING COUNT(*) > 1;
```

Essa parte foi importante para começar a fazer consultas mais voltadas para análise.

---

## 8. Funções de janela

Depois comecei a estudar funções de janela.

Um exemplo foi:

```sql
AVG() OVER()
```

Nesse momento aprendi que podemos fazer cálculos sobre os dados sem necessariamente juntar todas as linhas em um único resultado.

Também comecei a entender a diferença entre `GROUP BY` e `PARTITION BY`.

---

## 9. CONCAT, TRIM e COALESCE

Também aprendi algumas funções para trabalhar melhor com os dados.

### CONCAT

Utilizei `CONCAT()` para juntar informações, como nome e sobrenome.

### TRIM

Aprendi que `TRIM()` pode ser utilizado para remover espaços desnecessários.

### COALESCE

Aprendi a utilizar `COALESCE()` para tratar valores `NULL` e definir uma alternativa quando determinado valor não estivesse disponível.

Esses conceitos apareceram novamente quando comecei a trabalhar com Views e Functions.

---

## 10. CTEs

Quando avancei para conteúdos mais complexos, comecei a trabalhar com **CTEs**.

A estrutura básica é:

```sql
WITH nome_cte AS (
    SELECT ...
)
SELECT *
FROM nome_cte;
```

Aprendi que uma CTE pode ajudar a deixar uma consulta complexa mais organizada, dividindo o problema em etapas.

Também utilizei CTEs com `JOIN`, `GROUP BY`, `AVG`, `MIN` e `MAX`.

---

## 11. Temporary Tables

Também aprendi a criar tabelas temporárias:

```sql
CREATE TEMPORARY TABLE
```

Entendi que elas podem ser utilizadas para guardar resultados intermediários durante uma sessão do banco.

Durante os estudos, comparei o funcionamento das Temporary Tables com as CTEs e comecei a entender a diferença entre as duas.

---

## 12. Subqueries

Outro conteúdo que estudei foram as **Subqueries**.

Pratiquei subconsultas dentro de:

```sql
WHERE
HAVING
SELECT
FROM
```

Também aprendi o conceito de **Derived Table**, quando utilizamos uma consulta dentro do `FROM`.

Essa parte me mostrou que existem várias maneiras de construir uma consulta SQL e que precisamos escolher a abordagem que melhor resolve cada situação.

---

## 13. Views

Depois comecei a trabalhar com Views.

Utilizei:

```sql
CREATE VIEW
CREATE OR REPLACE VIEW
```

Aprendi que uma View permite salvar uma consulta para que ela possa ser utilizada novamente.

Também utilizei Views com `JOINs`, cálculos e `COALESCE()`.

---

## 14. Functions

Uma das partes mais avançadas do projeto foi aprender a criar Functions.

Durante os estudos desenvolvi funções como:

```text
NomeCompleto()
SalarioTotal()
ClassificaSalario()
```

Nelas utilizei conceitos como:

```sql
CONCAT()
COALESCE()
TRIM()
CASE
RETURN
```

Também aprendi o significado e a utilização de:

```sql
RETURNS
DETERMINISTIC
READS SQL DATA
```

Além disso, aprendi a utilizar `DELIMITER` para conseguir criar funções com mais de uma instrução.

Essa foi uma etapa importante porque comecei a entender como podemos criar nossa própria lógica dentro do banco.

---

## 15. Stored Procedures

Também estudei **Stored Procedures**.

Pratiquei conceitos como:

```sql
CREATE PROCEDURE
CALL
IN
DECLARE
SELECT ... INTO
SET
CASE
```

Aprendi que uma Procedure pode guardar um conjunto de instruções que depois pode ser executado utilizando `CALL`.

Também comecei a entender a diferença entre uma Function e uma Procedure.

---

## 16. Tratamento de NULL

O `NULL` apareceu várias vezes durante o projeto.

Aprendi a utilizar:

```sql
IS NULL
IS NOT NULL
COALESCE()
```

Também entendi que `NULL` não significa necessariamente zero ou uma string vazia.

Ele representa a ausência de um valor.

Esse conhecimento foi importante principalmente quando comecei a utilizar `COALESCE()` em consultas, Views e Functions.

---

## 17. Índices

Também comecei a estudar índices.

Pratiquei:

```sql
CREATE INDEX
```

Aprendi que os índices podem ajudar o banco de dados a encontrar informações com mais eficiência em determinadas consultas.

Também entendi que eles devem ser utilizados com cuidado, pois também possuem custos e podem afetar operações de alteração dos dados.

---

## 18. Erros que encontrei durante o aprendizado

Uma parte importante desse projeto foi aprender através dos erros.

### Error Code: 1136

Durante um `INSERT`, encontrei:

```text
Column count doesn't match value count
```

Nesse caso, a quantidade de valores que eu estava tentando inserir não correspondia à quantidade de colunas da tabela.

Isso aconteceu depois que adicionei a coluna `MiddleName`.

Foi uma situação que me ajudou a entender melhor a relação entre a estrutura da tabela e o comando `INSERT`.

### Error Code: 1175

Também encontrei o erro relacionado ao **Safe Update Mode** ao utilizar `UPDATE` e `DELETE`.

Isso me fez entender que o MySQL possui mecanismos para evitar alterações ou exclusões acidentais de registros.

### FULL JOIN

Também tive dificuldade quando tentei utilizar `FULL JOIN` e descobri que o MySQL não possui esse recurso diretamente.

Foi assim que aprendi a utilizar `UNION` com `LEFT JOIN` e `RIGHT JOIN` como alternativa.

Esses erros fizeram parte do meu aprendizado e foram importantes para que eu entendesse melhor o funcionamento do MySQL.

---

## 19. Minha evolução durante o projeto

Quando comecei, estava trabalhando principalmente com consultas simples.

Conforme fui avançando nas aulas e nos exercícios, comecei a utilizar recursos mais complexos:

```text
Criação de tabelas
       ↓
SELECT e filtros
       ↓
Funções de agregação
       ↓
GROUP BY / HAVING
       ↓
JOINs
       ↓
UNION / UNION ALL
       ↓
CASE
       ↓
Funções de janela
       ↓
CTEs
       ↓
Temporary Tables
       ↓
Subqueries
       ↓
Views
       ↓
Functions
       ↓
Stored Procedures
       ↓
Índices
```

Essa evolução mostra o caminho que percorri durante os estudos.

---

## 20. O que esse projeto me ensinou

O principal aprendizado não foi somente decorar comandos.

Durante o projeto, comecei a aprender a:

* entender um problema;
* pensar em como consultar os dados;
* combinar informações de diferentes tabelas;
* fazer cálculos;
* criar classificações;
* tratar valores ausentes;
* organizar consultas;
* identificar erros;
* pesquisar e testar soluções;
* comparar diferentes formas de resolver um problema.

Isso foi importante para desenvolver meu raciocínio utilizando SQL.

---

## 21. Por que utilizei nomes em inglês

Durante o projeto, escolhi utilizar nomes em inglês para as tabelas, colunas e códigos.

Alguns exemplos:

```text
employee
employeesalary
employeeaddress
EmployeeID
FirstName
LastName
JobTitle
Salary
```

Fiz essa escolha de propósito porque o inglês está muito presente na área de tecnologia, programação e bancos de dados.

Além de aprender SQL, também quero me acostumar com os termos técnicos em inglês que encontrarei no mercado de trabalho.

---

## 22. Próximos passos

Este projeto é uma das etapas da minha evolução na área de dados.

Depois de desenvolver meus conhecimentos em SQL e MySQL, pretendo continuar avançando para:

```text
SQL / MySQL
      ↓
Python
      ↓
Análise de Dados
      ↓
Power BI
      ↓
Dashboards
      ↓
Indicadores
      ↓
Conclusões de negócio
```

A ideia é continuar utilizando os conhecimentos adquiridos neste projeto para desenvolver projetos cada vez mais completos e voltados para análise de dados.
