USE PUBS

-- Para testar

SELECT * FROM SALES

-- alinea a)
-- Todos os tuplos da tabela autores (authors);
SELECT * FROM authors


-- alinea b)
-- O primeiro nome, o último nome e o telefone dos autores;
SELECT AU_FNAME,AU_LNAME, PHONE 
FROM AUTHORS


-- alinea c)
-- Consulta definida em b) mas ordenada pelo primeiro nome (ascendente) e depois o 
-- último nome (ascendente);
SELECT AU_FNAME,AU_LNAME, PHONE 
FROM AUTHORS
ORDER BY AU_FNAME, AU_LNAME 
-- default é ASC se fosse DESC tinha de se meter AU_FNAME DESC, AU_LNAME DESC


-- alinea d)
-- Consulta definida em c) mas renomeando os atributos para (first_name, last_name, 
-- telephone); 
SELECT AU_FNAME first_name,AU_LNAME last_name , PHONE telephone
FROM AUTHORS
ORDER BY AU_FNAME, AU_LNAME 

-- alinea e)
-- Consulta definida em d) mas só os autores da Califórnia (CA) cujo último nome é 
-- diferente de ‘Ringer’;  
SELECT AU_FNAME AS first_name,AU_LNAME AS last_name , PHONE AS telephone
FROM AUTHORS 
WHERE state = 'CA' and AU_LNAME NOT IN ('Ringer')
ORDER BY AU_FNAME, AU_LNAME 
 

 -- alinea i)
 -- Número total de vendas de cada editora agrupado por título;
 SELECT PUB_NAME, TITLE, SUM(QTY) AS Total_Vendas
 FROM SALES S INNER JOIN TITLES T ON S.TITLE_ID = T.TITLE_ID INNER JOIN PUBLISHERS P ON P.PUB_ID = T.PUB_ID
 GROUP BY P.PUB_NAME,T.TITLE


-- alinea k)
-- Nome de autores que tenham publicações de tipos diferentes;

SELECT AU_FNAME, AU_LNAME
FROM AUTHORS A INNER JOIN TITLEAUTHOR TA ON A.AU_ID = TA.AU_ID INNER JOIN TITLES T ON TA.TITLE_ID = T.TITLE_ID
GROUP BY AU_FNAME, AU_LNAME, TYPE
HAVING COUNT(*) >= 2


-- alinea m)
-- Obter o(s) tipo(s) de título(s) para o(s) qual(is) o máximo de dinheiro “à cabeça” 
-- (advance) é uma vez e meia superior à média do grupo (tipo); 

SELECT TYPE
FROM TITLES
GROUP BY TYPE
HAVING MAX(ADVANCE) > 1.5* AVG(ADVANCE)



-- alinea o)
-- Obter uma lista que incluía o número de vendas de um título (ytd_sales), o seu nome, 
-- a faturação total, o valor da faturação relativa aos autores e o valor da faturação 
-- relativa à editora;
SELECT t.title, t.ytd_sales, (t.price * t.ytd_sales) AS faturacao_total,
       (t.price * t.ytd_sales) / COUNT(ta.au_id) AS faturacao_autores,
       (t.price * t.ytd_sales) * 0.30 AS faturacao_editora
FROM TITLES t
JOIN TITLEAUTHOR ta ON t.title_id = ta.title_id
GROUP BY t.title, t.ytd_sales, t.price;
