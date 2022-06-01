-- O BANCO DE DADOS AULA_BDI_221, FOI CONSTRUIDO UTILIZANDO OS ARQUIVOS DISPONIBILIZADOS PELO
-- PROFESSOR MESSIAS EM SEU GITHUB(https://github.com/mrafaelbatista/uniesp_banco_de_dados_I/)
-- E AJUSTADO COM INSERTS NO ARQUIVO INSERTS_FINAIS.sql

-- SELECIONANDO O BANCO DE DADOS
USE AULA_BDI_221;
GO

-- 1) NOME E VALOR DOS PRODUTOS DO TIPO PRODUTO COM VALOR ABAIXO DE 100 REAIS, 
-- ORDENADOS EM ORDEM DECRESCENTE
SELECT NOME, VALOR FROM PRODUTO
WHERE TIPO = 'P'
GROUP BY NOME, VALOR
HAVING VALOR < 100
ORDER BY VALOR DESC
GO

-- 2) QUANTIDADE DE CACHORROS DE PEQUENO PORTE E GATOS DE PORTE MÉDIO
SELECT COUNT(ID) AS QUANTIDADE, ESPECIE, PORTE FROM PET
WHERE ESPECIE = 'GATO' AND PORTE = 'M' OR ESPECIE = 'CACHORRO' AND PORTE = 'P'
GROUP BY ESPECIE, PORTE
GO

-- 3) TODOS OS CLIENTES QUE JÁ COMPRARAM NO PETSHOP E O VALOR TOTAL DE COMPRAS DE CADA UM
SELECT C.NOME AS NOME_CLIENTE, SUM(P.VALOR) AS VALOR_TOTAL_COMPRAS FROM PRODUTO AS P
INNER JOIN PRODUTO_VENDA AS PV
	ON P.ID = PV.ID_PRODUTO
INNER JOIN VENDA AS V
	ON PV.ID_VENDA = V.ID
INNER JOIN CLIENTE AS C
	ON V.ID_CLIENTE = C.ID
GROUP BY C.NOME
GO

-- 4) NOME DOS CLIENTES QUE POSSUEM PET, NOME DOS PETS E SUA ESPECIE
SELECT C.NOME AS NOME_CLIENTE, P.NOME AS NOME_PET, P.ESPECIE AS ESPECIE_PET FROM CLIENTE AS C
INNER JOIN CLIENTE_PET AS CP
	ON CP.ID_CLIENTE = C.ID
INNER JOIN PET AS P
	ON P.ID = CP.ID_PET
GO

--4.1) NOME, ESPÉCIE E PORTE DOS PETS QUE POSSUEM PRONTUÁRIO E OS DADOS DO PRONTUÁRIO
SELECT P.NOME AS NOME_PET, P.ESPECIE AS ESPECIE_PET,P.PORTE AS PORTE_PET, 
PT.DESCRICAO AS DIAGNOSTICO_PET, PT.TEMPERATURA AS TEMPERATURA_PET, PT.PESO AS PESO_PET 
FROM PRONTUARIO AS PT
INNER JOIN PET AS P
	ON P.ID_PRONTUARIO = PT.ID
ORDER BY P.ID
GO

-- 5) ID E NOME DOS CLIENTES QUE REALIZARAM PAGAMENTO COM PICPAY
SELECT C.ID AS ID_CLIENTE, C.NOME AS NOME_CLIENTE FROM VENDA AS V
INNER JOIN CLIENTE AS C
    ON V.ID_CLIENTE = C.ID
INNER JOIN FORMA_PAGAMENTO AS FP
    ON FP.ID = V.ID_FORMA_PAGAMENTO
WHERE FP.DESCRICAO = 'PICPAY'
GO

-- 6) ID, NOME E VALOR DO PRODUTO, NOME DOS FUNCIONÁRIOS QUE VEDERAM, NOME DOS 
-- CLIENTES QUE COMPRARAM E A FORMA DE PAGAMENTO DOS PRODUTOS COM ID DE 4 ATÉ 7
-- ORDENADO PELO ID DO PRODUTO EM ORDEM CRESCENTE
SELECT P.ID AS ID_PRODUTO, P.NOME AS NOME_PRODUTO, P.VALOR AS VALOR_PRODUTO, 
F.NOME AS NOME_FUNCIONARIO, C.NOME AS NOME_CLIENTE, FP.DESCRICAO AS FORMA_PAGAMENTO 
FROM PRODUTO AS P
INNER JOIN PRODUTO_VENDA AS PV
	ON P.ID = PV.ID_PRODUTO
INNER JOIN VENDA AS V
	ON PV.ID_VENDA = V.ID
INNER JOIN FUNCIONARIO AS F
	ON V.ID_FUNCIONARIO = F.ID
INNER JOIN CLIENTE AS C
    ON V.ID_CLIENTE = C.ID
INNER JOIN FORMA_PAGAMENTO AS FP
    ON V.ID_FORMA_PAGAMENTO = FP.ID
WHERE P.ID BETWEEN 4 AND 7
ORDER BY P.ID
GO
