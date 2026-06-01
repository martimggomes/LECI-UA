# BD: Guião 7


## ​7.2 
 
### *a)*

```
Está na 1º Fórmula Normal dado que falha na 2º e na 3º.
-> Falha na 2º por causa da dependência funcional: Nome_Autor -> Afiliacao_Autor
-> Falha na 3ª por causa das dependências funcionais: Tipo_Livro, NoPaginas -> Preco
                                                      Editor -> Endereco_Editor
```

### *b)* 

```
- Passagem para a 2º Forma Normal:

R1(Nome_Autor (PK), Afiliacao_Autor)
R2(Nome_Autor (PK), Titulo_Livro (PK), Tipo_Livro, Preco, NoPaginas, Editor, Endereco_Editor, Ano_Publicacao)

- Passagem para a 3º Forma Normal:

Autor(Nome_Autor (PK), Afiliacao_Autor)
Editora(Editor (PK), Endereco_Editor)
TabelaPrecos(Tipo_Livro (PK), NoPaginas (PK), Preco)
Livro(Nome_Autor (PK), Titulo_Livro (PK), Tipo_Livro, NoPaginas, Editor, Ano_Publicacao)

```

## ​7.3
 
### *a)*

```
AB nunca aparecem no lado direito logo vai ser preciso testar se (A, B) consegue determinar todos os outros atributos da relação 
AB -> AB
AB -> C logo ABC
A -> DE logo ABCDE
B -> F logo ABCDEF
F -> GH logo ABCDEFGH
D -> IJ logo ABCDEFGHIJ


A chave primária é {A,B}.


```

### *b)* 

```
A -> DE logo D e E dependem de parte da chave, neste caso só de A
B -> F logo F depende de parte da chave, neste caso só de B

para eliminar estas dependencias:
R1(A,B,C)
R2(A,D,E,I,J)
R3(B,F,G,H)
```

### *c)* 

```
D -> IJ
F -> GH

3FN:
R1(A,B,C)
R2(A,D,E)
R3(D,I,J)
R4(B,F)
R5(F,G,H)
```

## ​7.4          
 
### *a)*
```
2 chaves candidatas
- {A,B} : AB -> ABCDE
- {C,B} : C -> AC
          BC -> ABC
          BC -> ABCDE
```

### *b)* 

```
Já está na 2º Forma Normal. o único problema é D -> E, onde D não faz parte de nenhuma chave candidata
R1(D(PK),E)
R2(A(PK),B(PK),C,D)        
Também dava com a chave B,C
```

### *c)* 

```
Atributo não-chave determina um chave (C -> A)
R1(D(PK),E)
R3(C(PK),A)
R4(B(PK),C(PK),D)
```

## ​7.5                 

### *a)*

```
{A,B}
```

### *b)* 

```
Problema em A -> C
R1(A(PK),C,D)
R2(A(PK),B(PK),E)
```

### *c)* 

```
Problema em C -> D
R1A(C(PK),D)
R1B(A(PK),C)
R2(A(PK),B(PK),E)
```

### *d)* 

```
Já está na BCNF.
```
