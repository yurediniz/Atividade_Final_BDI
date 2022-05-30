-- SELECIONANDO O BANDO DE DADOS
USE AULA_BDI_221
GO

-- INSERTS PARA CONCLUSÃO DO BANCO DE DADOS

--INSERT DOS ID_CLIENTE E ID_PET NA TABELA CLIENTE_PET
DELETE FROM DBO.CLIENTE_PET;
DBCC CHECKIDENT ('CLIENTE_PET', RESEED, 0);
GO

INSERT INTO DBO.CLIENTE_PET VALUES(1, 9);
INSERT INTO DBO.CLIENTE_PET VALUES(2, 1);
INSERT INTO DBO.CLIENTE_PET VALUES(4, 2);
INSERT INTO DBO.CLIENTE_PET VALUES(5, 3);
INSERT INTO DBO.CLIENTE_PET VALUES(7, 4);
INSERT INTO DBO.CLIENTE_PET VALUES(8, 5);
INSERT INTO DBO.CLIENTE_PET VALUES(10, 6);
INSERT INTO DBO.CLIENTE_PET VALUES(11, 7);
INSERT INTO DBO.CLIENTE_PET VALUES(13, 8);
GO

-- INSERT DE ALGUNS PRONTUÁRIOS NA TABELA PRONTUÁRIO
DELETE FROM DBO.PRONTUARIO;
DBCC CHECKIDENT ('PRONTUARIO', RESEED, 0);
GO

INSERT INTO DBO.PRONTUARIO VALUES 
('Insuficiência Renal', 39.8, 3.5),
('Otite', 38.8, 9.2),
('Dermatite Canina', 37.8, 5.5),
('Aerossaculite', 40.1, 0.4);
GO

-- REINSERT DOS DADOS DA TABELE PET, AGORA COM ID_PRONTUARIO EM ALGUNS PETS QUE ANTES NÃO POSSUÍAM
DELETE FROM PET;
DBCC CHECKIDENT ('PET', RESEED, 0);
GO

INSERT INTO DBO.PET VALUES
('Marley', 'Cachorro', 'M', NULL, 1),
('Dogão', 'Cachorro', 'P', NULL, NULL),
('Simba', 'Gato', 'M', NULL, NULL),
('Kira Maria', 'Gato', 'P', NULL, 0),
('Ligerinho', 'Jabuti', 'P', NULL, NULL),
('Toíco', 'Papagaio', 'M', NULL, 3),
('Judith Pereira', 'Gato', 'M', NULL, NULL),
('Nine', 'Cachorro', 'M', NULL, NULL),
('Teddy', 'Cachorro', 'P', NULL, 2);
GO