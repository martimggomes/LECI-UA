# BD: Guião 5


## ​Problema 5.1
 
### *a)*

```
π Ssn, Fname, Minit, Lname, Pname (employee ⨝Ssn = Essn works_on ⨝ Pno= Pnumber project)


### *b)* 

```
σ Fname = 'Carlos' ∧ Minit = 'D'∧ Lname = 'Gomes' employee
-- tds os empregador supervisionados por ele
π employee.Fname, employee.Minit, employee.Lname (σ Super_ssn = 21312332 employee)
-- outra forma
π employee.Fname, employee.Minit, employee.Lname (employee ⨝ employee.Super_ssn=Super.Ssn (ρ Super (σ Fname='Carlos' ∧ Minit = 'D' ∧ Lname = 'Gomes' employee)))
```


### *c)* 

```
-- Apenas lista os nomes de cada projeto
π Pname project

-- agrega por Pno e dps faz o sum das horas de cada Pno (os q tiveram igual Pno soma as horas)
-- o resultado das somas vai se chamar TotalHoras
γ Pno; sum(Hours) -> TotalHoras works_on

-- buscar dados a mais q uma tabela -> usar join 
-- resolucao final ex c)
γ Pname; sum(Hours) -> TotalHoras (works_on ⨝Pno= Pnumber project)
```


### *d)* 

```
project
department
employee

-- Selecionar projeto Aveiro Digital
σ Pname = 'Aveiro Digital' project

-- Selecionar empregados do departamento nº 3
σ Dno = 3 employee

-- Fazer join employee + works_on + Project
-- mesmo q n fosse preciso as horas era preciso ir a works_on pq n ha ligaçao direta entre employee e project


-- Selecionar Projeto Que SeChama AveiroDigital
σ Pname = 'Aveiro Digital' project


-- EmpsAveiroDigital
employee ⨝ Ssn = Essn works_on ⨝ Pno = Pnumber (σ Pname = 'Aveiro Digital' project)


-- resposta final
σ Dno=3 ∧ Hours>20 (employee ⨝ Ssn=Essn works_on ⨝ Pno=Pnumber (σ Pname='Aveiro Digital' project))
```


### *e)* 

```
employee
works_on

π Fname (employee) - π Fname (employee ⨝ works_on)
```


### *f)* 

```
department ⨝ Dnumber = Dno employee

γ Dname; avg(Salary) -> SalMedioFunc (σ Sex = 'F' (department ⨝ Dnumber = Dno employee))
```


### *g)* 

```
employee
dependent

employee ⨝ Ssn = Essn dependent

γ Essn; count(Essn) -> countEssn (dependent)

(σ countEssn > 2 (γ Essn; count(Essn) -> countEssn (dependent)))

(σ countEssn > 2 (γ Essn; count(Essn) -> countEssn (dependent))) ⨝ Essn=Ssn employee
```


### *h)* 

```
-- Ssn dos que são gestores
π Ssn (department ⨝ Mgr_ssn=Ssn employee)

-- Ssn dos employee dos dependentes
π Essn (dependent)

-- Ssn dos que são gestores - os que tem dependentes
π Ssn (department ⨝ Mgr_ssn=Ssn employee) - (π Essn (dependent))
```


### *i)* 

```
project

 -- todos os funcionários que trabalham em, pelo menos, um projeto localizado em Aveiro
 π Ssn (employee ⨝ Ssn= Essn works_on ⨝ Pno = Pnumber (σ Plocation = 'Aveiro' project))
 
 
 -- o seu departamento não tem nenhuma localização em Aveiro.
 -- ...
 
 -- deps em aveiro
 π Dnumber (σ Dlocation = 'Aveiro' dept_location)
 
 -- funcs que o seu departamento tem localização em Aveiro
 department
 π Ssn (employee ⨝ Dno=Dnumber department ⨝ department.Dnumber=dept_location.Dnumber (σ Dlocation='Aveiro' (dept_location)))
 
 
 -- todos os funcionários que trabalham em, pelo menos, um projeto localizado em Aveiro - o seu departamento  tem localização em Aveiro.
 
 (π Ssn (employee ⨝ Ssn= Essn works_on ⨝ Pno = Pnumber (σ Plocation = 'Aveiro' project))) - ( π Ssn (employee ⨝ Dno=Dnumber department ⨝ department.Dnumber=dept_location.Dnumber (σ Dlocation='Aveiro' (dept_location))))
```


## ​Problema 5.2

### *a)*

```
 -- Lista dos fornecedores que nunca tiveram encomendas

-- todos os fornecedores
fornecedor
π nif (fornecedor)


-- fornecedores que ja tiveram encomendas
encomenda
π nif (fornecedor ⨝ nif=fornecedor encomenda)


-- Lista dos fornecedores que nunca tiveram encomendas -> todos os fornecedores - fornecedores que ja tiveram encomendas

(π nif (fornecedor)) - (π nif (fornecedor ⨝ nif=fornecedor encomenda))
```

### *b)* 

```
-- Número médio de unidades encomendadas para cada produto;


produto
item


produto ⨝ codigo = codProd item

γ nome ; avg(item.unidades) -> NumMedioUniEnco (produto ⨝ codigo = codProd item)

```


### *c)* 

```
γ ; avg(nProduto) -> mediaProdEncomenda (γ numEnc; count(codigo) -> nProduto (produto ⨝ codigo=codProd (item)))
```


### *d)* 

```
-- Lista de produtos (e quantidades) fornecidas por cada fornecedor;
fornecedor
encomenda

fornecedor ⨝ nif = fornecedor encomenda ⨝ numero = numEnc item ⨝ codProd = codigo produto

γ produto.nome; sum(item.unidades) -> ListaProdQuant (fornecedor ⨝ nif = fornecedor encomenda ⨝ numero = numEnc item ⨝ codProd = codigo produto)
```


## ​Problema 5.3

### *a)*

```
... Write here your answer ...
```

### *b)* 

```
... Write here your answer ...
```


### *c)* 

```
... Write here your answer ...
```


### *d)* 

```
... Write here your answer ...
```

### *e)* 

```
... Write here your answer ...
```

### *f)* 

```
... Write here your answer ...
```





























