# BD: Guião 6

## Problema 6.1

### *a)* Todos os tuplos da tabela autores (authors);

```
SELECT * FROM authors
```

### *b)* O primeiro nome, o último nome e o telefone dos autores;

```
SELECT AU_FNAME,AU_LNAME, PHONE 
FROM AUTHORS
```

### *c)* Consulta definida em b) mas ordenada pelo primeiro nome (ascendente) e depois o último nome (ascendente); 

```
SELECT AU_FNAME,AU_LNAME, PHONE 
FROM AUTHORS
ORDER BY AU_FNAME, AU_LNAME 
```

### *d)* Consulta definida em c) mas renomeando os atributos para (first_name, last_name, telephone); 

```
SELECT AU_FNAME first_name,AU_LNAME last_name , PHONE telephone
FROM AUTHORS
ORDER BY AU_FNAME, AU_LNAME 
```

### *e)* Consulta definida em d) mas só os autores da Califórnia (CA) cujo último nome é diferente de ‘Ringer’; 

```
SELECT AU_FNAME AS first_name,AU_LNAME AS last_name , PHONE AS telephone
FROM AUTHORS 
WHERE state = 'CA' and AU_LNAME NOT IN ('Ringer')
ORDER BY AU_FNAME, AU_LNAME 
```

### *f)* Todas as editoras (publishers) que tenham ‘Bo’ em qualquer parte do nome; 

```
SELECT pub_id, pub_name
FROM publishers
WHERE pub_name LIKE '%Bo%'
```

### *g)* Nome das editoras que têm pelo menos uma publicação do tipo ‘Business’; 

```
SELECT DISTINCT p.pub_name
FROM publishers AS p JOIN titles AS t ON p.pub_id = t.pub_id
WHERE t.type = 'Business';
```

### *h)* Número total de vendas de cada editora; 

```
SELECT p.pub_name, SUM(s.qty) AS total_vendas
FROM publishers as p JOIN titles AS t on p.pub_id = t.pub_id JOIN sales AS s on t.title_id = s.title_id
GROUP BY p.pub_name
```

### *i)* Número total de vendas de cada editora agrupado por título; 

```
SELECT PUB_NAME, TITLE, SUM(QTY) AS Total_Vendas
FROM SALES S INNER JOIN TITLES T ON S.TITLE_ID = T.TITLE_ID INNER JOIN PUBLISHERS P ON P.PUB_ID = T.PUB_ID
GROUP BY P.PUB_NAME,T.TITLE
```

### *j)* Nome dos títulos vendidos pela loja ‘Bookbeat’; 

```
SELECT t.title
FROM titles AS t
JOIN sales AS sa on t.title_id = sa.title_id
JOIN stores AS st on sa.stor_id = st.stor_id
WHERE stor_name='BookBeat'
```

### *k)* Nome de autores que tenham publicações de tipos diferentes; 

```
SELECT AU_FNAME, AU_LNAME
FROM AUTHORS A INNER JOIN TITLEAUTHOR TA ON A.AU_ID = TA.AU_ID INNER JOIN TITLES T ON TA.TITLE_ID = T.TITLE_ID
GROUP BY AU_FNAME, AU_LNAME, TYPE
HAVING COUNT(*) >= 2
```

### *l)* Para os títulos, obter o preço médio e o número total de vendas agrupado por tipo (type) e editora (pub_id);

```
SELECT type, pub_id, AVG(price) AS preco_medio, SUM(ytd_sales) as total_vendas
FROM titles
GROUP BY type, pub_id
```

### *m)* Obter o(s) tipo(s) de título(s) para o(s) qual(is) o máximo de dinheiro “à cabeça” (advance) é uma vez e meia superior à média do grupo (tipo);

```
SELECT TYPE
FROM TITLES
GROUP BY TYPE
HAVING MAX(ADVANCE) > 1.5* AVG(ADVANCE)
```

### *n)* Obter, para cada título, nome dos autores e valor arrecadado por estes com a sua venda;

```
SELECT t.title, a.au_fname, a.au_lname, t.ytd_sales * t.price AS valor_arrecadado
FROM titles AS t 
JOIN titleauthor AS ta on t.title_id = ta.title_id
JOIN authors as a on ta.au_id = a.au_id
```

### *o)* Obter uma lista que incluía o número de vendas de um título (ytd_sales), o seu nome, a faturação total, o valor da faturação relativa aos autores e o valor da faturação relativa à editora;

```
SELECT t.title, t.ytd_sales, (t.price * t.ytd_sales) AS faturacao_total,
       (t.price * t.ytd_sales) / COUNT(ta.au_id) AS faturacao_autores,
       (t.price * t.ytd_sales) * 0.30 AS faturacao_editora
FROM TITLES t
JOIN TITLEAUTHOR ta ON t.title_id = ta.title_id
GROUP BY t.title, t.ytd_sales, t.price;
```

### *p)* Obter uma lista que incluía o número de vendas de um título (ytd_sales), o seu nome, o nome de cada autor, o valor da faturação de cada autor e o valor da faturação relativa à editora;

```
SELECT t.title, a.au_fname, a.au_lname, (t.price * t.ytd_sales * t.royalty / 100.0 * ta.royaltyper / 100.0) AS auth_revenue, (t.price * t.ytd_sales * (100 - t.royalty) / 100.0) AS publisher_revenue
FROM titles AS t 
JOIN titleauthor AS ta on t.title_id = ta.title_id
JOIN authors as a on ta.au_id = a.au_id
```

### *q)* Lista de lojas que venderam pelo menos um exemplar de todos os livros;

```
SELECT s.stor_name
FROM stores s
JOIN sales sa ON s.stor_id = sa.stor_id
GROUP BY s.stor_id, s.stor_name
HAVING COUNT(DISTINCT sa.title_id) = (SELECT COUNT(*) FROM titles);
```

### *r)* Lista de lojas que venderam mais livros do que a média de todas as lojas;

```
SELECT st.stor_name
FROM stores AS st JOIN sales s on st.stor_id = s.stor_id
GROUP BY st.stor_id, st.stor_name
HAVING SUM(s.qty) > ( SELECT AVG(total_qty) 
FROM (SELECT SUM(qty) AS total_qty FROM sales GROUP BY stor_id) AS sub_media )
```

### *s)* Nome dos títulos que nunca foram vendidos na loja “Bookbeat”;

```
SELECT title
FROM titles
WHERE title_id NOT IN (
    SELECT sa.title_id
    FROM sales sa
    JOIN stores st ON sa.stor_id = st.stor_id
    WHERE st.stor_name = 'Bookbeat'
);
```

### *t)* Para cada editora, a lista de todas as lojas que nunca venderam títulos dessa editora; 

```
SELECT p.pub_name, st.stor_name
FROM publishers AS p, stores AS st
WHERE NOT EXISTS (
    SELECT *
    FROM sales s
    JOIN titles AS t ON s.title_id = t.title_id
    WHERE s.stor_id = st.stor_id AND t.pub_id = p.pub_id
)
```

## Problema 6.2

### ​5.1

#### a) SQL DDL Script
 
[a) SQL DDL File](ex_6_2_1_ddl.sql "SQLFileQuestion")

#### b) Data Insertion Script

[b) SQL Data Insertion File](ex_6_2_1_data.sql "SQLFileQuestion")

#### c) Queries

```
TESTEI AS ALINEAS NO SCRIPT ex_6_2_1_data.sql

```
##### *a)*

SELECT P.Pname, E.Ssn, E.Fname, E.Minit, E.Lname
FROM EMPRESA.PROJECT AS P INNER JOIN EMPRESA.WORKS_ON AS W ON P.Pnumber = W.Pno INNER JOIN EMPRESA.EMPLOYEE AS E ON W.Essn = E.Ssn;

##### *b)* 

SELECT E.Fname, E.Lname
FROM EMPRESA.EMPLOYEE AS E INNER JOIN EMPRESA.EMPLOYEE AS S ON E.Super_ssn = S.Ssn WHERE S.Fname = 'Carlos' AND S.Lname = 'Gomes';

##### *c)* 

SELECT Pname, SUM(Hours)
FROM EMPRESA.PROJECT, EMPRESA.WORKS_ON
WHERE Pnumber = Pno
GROUP BY Pname;

##### *d)* 

SELECT E.Fname, E.Lname
FROM EMPRESA.EMPLOYEE AS E INNER JOIN EMPRESA.WORKS_ON AS W ON E.Ssn = W.Essn INNER JOIN EMPRESA.PROJECT AS P ON W.Pno = P.Pnumber
WHERE E.Dno = 3 AND W.Hours > 20 AND P.Pname = 'Aveiro Digital';

##### *e)* 

SELECT Fname, Lname
FROM EMPRESA.EMPLOYEE
WHERE Ssn NOT IN (SELECT Essn FROM EMPRESA.WORKS_ON);

##### *f)* 

SELECT Dname, AVG(Salary)
FROM EMPRESA.DEPARTMENT, EMPRESA.EMPLOYEE
WHERE Dnumber = Dno AND Sex = 'F'
GROUP BY Dname;

##### *g)* 

SELECT E.Fname, E.Lname
FROM EMPRESA.EMPLOYEE AS E INNER JOIN EMPRESA.DEPENDENT AS D ON E.Ssn = D.Essn
GROUP BY E.Ssn, E.Fname, E.Lname
HAVING COUNT(D.Dependent_name) > 2;

##### *h)* 

SELECT E.Fname, E.Lname
FROM EMPRESA.EMPLOYEE AS E INNER JOIN EMPRESA.DEPARTMENT AS D ON E.Ssn = D.Mgr_ssn
WHERE E.Ssn NOT IN (SELECT Essn FROM EMPRESA.DEPENDENT);

##### *i)* 

SELECT DISTINCT Fname, Address
FROM EMPRESA.EMPLOYEE, EMPRESA.WORKS_ON, EMPRESA.PROJECT
WHERE Ssn = Essn AND Pno = Pnumber AND Plocation = 'Aveiro'AND Dno NOT IN (SELECT Dnumber FROM EMPRESA.DEPT_LOCATIONS WHERE Dlocation = 'Aveiro');

### 5.2

#### a) SQL DDL Script
 
[a) SQL DDL File](ex_6_2_2_ddl.sql "SQLFileQuestion")

#### b) Data Insertion Script

[b) SQL Data Insertion File](ex_6_2_2_data.sql "SQLFileQuestion")

#### c) Queries

```
TESTEI AS ALINEAS NO SCRIPT ex_6_2_2_data.sql

```

##### *a)*

SELECT Nome
FROM GESTAO_STOCKS.FORNECEDOR F LEFT JOIN GESTAO_STOCKS.ENCOMENDA E ON F NIF = E.Nif_Forn
WHERE E.Num_Enc IS NULL;

##### *b)* 

SELECT Cod_Prod, AVG(Quantidade) AS Media
FROM GESTAO_STOCKS.CONTEM
GROUP BY Cod_Prod;


##### *c)* 

SELECT SUM(1.0) / COUNT(DISTINCT Num_Enc) 
FROM GESTAO_STOCKS.CONTEM;


##### *d)* 

SELECT F.Nome, C.Cod_Prod, SUM(C.Quantidade) AS Total
FROM GESTAO_STOCKS.FORNECEDOR F INNER JOIN GESTAO_STOCKS.ENCOMENDA E ON F.NIF = E.Nif_Forn INNER JOIN GESTAO_STOCKS.CONTEM C ON E.Num_Enc = C.Num_Enc
GROUP BY F.Nome, C.Cod_Prod;

### 5.3

#### a) SQL DDL Script
 
[a) SQL DDL File](ex_6_2_3_ddl.sql "SQLFileQuestion")

#### b) Data Insertion Script

[b) SQL Data Insertion File](ex_6_2_3_data.sql "SQLFileQuestion")

#### c) Queries
```
TESTEI AS ALINEAS NO SCRIPT ex_6_2_3_data.sql

```

##### *a)*

```
SELECT Nome
FROM EX6_2.Paciente
WHERE Num_Utente NOT IN (SELECT Num_Utente
                         FROM EX6_2.Prescricao);
```

##### *b)* 

```
SELECT m.Especialidade, COUNT(p.Num_Prescricao) AS Total_Prescricoes
FROM EX6_2.Medico AS m
JOIN EX6_2.Prescricao p ON m.Num_Id_Sns = p.Num_Id_Sns
GROUP BY m.Especialidade;
```


##### *c)* 

```
SELECT f.Nome, COUNT(p.Num_Prescricao) AS Total_Processadas
FROM EX6_2.Farmacia AS f
JOIN EX6_2.Prescricao p ON f.NIF = p.Nif_Farmacia
GROUP BY f.NIF, f.Nome; 
```


##### *d)* 

```
SELECT Nome
FROM EX6_2.Farmaco
WHERE Num_Registo = 906 AND Formula NOT IN ( SELECT Formula
                                             FROM EX6_2.Contem 
```

##### *e)* 

```
SELECT far.Nome AS Nome_Farmacia, fa.Nome AS Nome_Farmaceutica, COUNT(c.Formula) AS Qtd_Vendida
FROM EX6_2.Farmacia AS far
JOIN EX6_2.Prescricao p ON far.NIF = p.Nif_Farmacia
JOIN EX6_2.Contem c ON p.Num_Prescricao = c.Num_Prescricao
JOIN EX6_2.Farmaco f ON c.Formula = f.Formula
JOIN EX6_2.Farmaceutica fa ON f.Num_Registo = fa.Num_Registo
GROUP BY far.NIF, far.Nome, fa.Num_Registo, fa.Nome;
```

##### *f)* 

```
SELECT pa.Nome
FROM EX6_2.Paciente AS pa
JOIN EX6_2.Prescricao pr ON pa.Num_Utente = pr.Num_Utente
GROUP BY pa.Num_Utente, pa.Nome
HAVING COUNT(DISTINCT pr.Num_Id_Sns) > 1;
```
