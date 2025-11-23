------------------------------------------------------------
-- 1. PESSOAS (Jogadores + Técnicos + Juízes)
------------------------------------------------------------
INSERT INTO Pessoa (cpf, nome, nacionalidade, data_nascimento) VALUES
-- Jogadores 1–10 (grupo 1 - Sport)
('91000000001','Jogador 1','Brasil','1998-01-05'),
('91000000002','Jogador 2','Brasil','1997-02-10'),
('91000000003','Jogador 3','Brasil','1996-03-15'),
('91000000004','Jogador 4','Brasil','1999-04-20'),
('91000000005','Jogador 5','Brasil','1998-05-25'),
('91000000006','Jogador 6','Brasil','1997-06-12'),
('91000000007','Jogador 7','Brasil','1996-07-22'),
('91000000008','Jogador 8','Brasil','1995-08-04'),
('91000000009','Jogador 9','Brasil','1998-09-18'),
('91000000010','Jogador 10','Brasil','1997-10-03'),

-- Jogadores 11–20 (grupo 2 - Náutico)
('91000000011','Jogador 11','Brasil','1998-01-05'),
('91000000012','Jogador 12','Brasil','1997-02-10'),
('91000000013','Jogador 13','Brasil','1996-03-15'),
('91000000014','Jogador 14','Brasil','1999-04-20'),
('91000000015','Jogador 15','Brasil','1998-05-25'),
('91000000016','Jogador 16','Brasil','1997-06-12'),
('91000000017','Jogador 17','Brasil','1996-07-22'),
('91000000018','Jogador 18','Brasil','1995-08-04'),
('91000000019','Jogador 19','Brasil','1998-09-18'),
('91000000020','Jogador 20','Brasil','1997-10-03'),

-- Jogadores 21–30 (grupo 3 - Santa Cruz)
('91000000021','Jogador 21','Brasil','1998-01-05'),
('91000000022','Jogador 22','Brasil','1997-02-10'),
('91000000023','Jogador 23','Brasil','1996-03-15'),
('91000000024','Jogador 24','Brasil','1999-04-20'),
('91000000025','Jogador 25','Brasil','1998-05-25'),
('91000000026','Jogador 26','Brasil','1997-06-12'),
('91000000027','Jogador 27','Brasil','1996-07-22'),
('91000000028','Jogador 28','Brasil','1995-08-04'),
('91000000029','Jogador 29','Brasil','1998-09-18'),
('91000000030','Jogador 30','Brasil','1997-10-03'),

-- Jogadores 31–40 (grupo 4 - Retrô)
('91000000031','Jogador 31','Brasil','1998-01-05'),
('91000000032','Jogador 32','Brasil','1997-02-10'),
('91000000033','Jogador 33','Brasil','1996-03-15'),
('91000000034','Jogador 34','Brasil','1999-04-20'),
('91000000035','Jogador 35','Brasil','1998-05-25'),
('91000000036','Jogador 36','Brasil','1997-06-12'),
('91000000037','Jogador 37','Brasil','1996-07-22'),
('91000000038','Jogador 38','Brasil','1995-08-04'),
('91000000039','Jogador 39','Brasil','1998-09-18'),
('91000000040','Jogador 40','Brasil','1997-10-03'),

-- Jogadores 41–50 (grupo 5 - Central)
('91000000041','Jogador 41','Brasil','1998-01-05'),
('91000000042','Jogador 42','Brasil','1997-02-10'),
('91000000043','Jogador 43','Brasil','1996-03-15'),
('91000000044','Jogador 44','Brasil','1999-04-20'),
('91000000045','Jogador 45','Brasil','1998-05-25'),
('91000000046','Jogador 46','Brasil','1997-06-12'),
('91000000047','Jogador 47','Brasil','1996-07-22'),
('91000000048','Jogador 48','Brasil','1995-08-04'),
('91000000049','Jogador 49','Brasil','1998-09-18'),
('91000000050','Jogador 50','Brasil','1997-10-03'),

-- Técnicos (8 clubes)
('92000000001','Técnico Sport','Brasil','1975-01-01'),
('92000000002','Técnico Náutico','Brasil','1975-02-01'),
('92000000003','Técnico Santa Cruz','Brasil','1975-03-01'),
('92000000004','Técnico Retrô','Brasil','1975-04-01'),
('92000000005','Técnico Central','Brasil','1975-05-01'),
('92000000006','Técnico Bahia','Brasil','1975-06-01'),
('92000000007','Técnico Ceará','Brasil','1975-07-01'),
('92000000008','Técnico Fortaleza','Brasil','1975-08-01'),

-- Juízes (5)
('93000000001','Juiz 1','Brasil','1970-01-01'),
('93000000002','Juiz 2','Brasil','1970-01-02'),
('93000000003','Juiz 3','Brasil','1970-01-03'),
('93000000004','Juiz 4','Brasil','1970-01-04'),
('93000000005','Juiz 5','Brasil','1970-01-05');

------------------------------------------------------------
-- 2. PATROCINADOS (1–58)
------------------------------------------------------------
INSERT INTO Patrocinados (id_patrocinado) VALUES
(1),(2),(3),(4),(5),(6),(7),(8),
(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),
(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),
(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),
(39),(40),(41),(42),(43),(44),(45),(46),(47),(48),
(49),(50),(51),(52),(53),(54),(55),(56),(57),(58);

------------------------------------------------------------
-- 3. POSSIVEIS_CARTOES (1–58)
------------------------------------------------------------
INSERT INTO Possiveis_Cartoes (id_possiveis_cartoes) VALUES
(1),(2),(3),(4),(5),(6),(7),(8),(9),(10),
(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),
(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),
(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),
(41),(42),(43),(44),(45),(46),(47),(48),(49),(50),
(51),(52),(53),(54),(55),(56),(57),(58);

------------------------------------------------------------
-- 4. CLUBES (5 de PE + 3 de fora)
------------------------------------------------------------
INSERT INTO Clube (id_clube, id_patrocinado, nome, data_fundacao, cidade) VALUES
(1, 1, 'Sport Club do Recife',          '1905-05-13', 'Recife-PE'),
(2, 2, 'Clube Náutico Capibaribe',      '1901-04-07', 'Recife-PE'),
(3, 3, 'Santa Cruz Futebol Clube',      '1914-02-03', 'Recife-PE'),
(4, 4, 'Retrô Futebol Clube Brasil',    '2016-04-18', 'Camaragibe-PE'),
(5, 5, 'Central Sport Club',            '1919-06-15', 'Caruaru-PE'),
(6, 6, 'Esporte Clube Bahia',           '1931-01-01', 'Salvador-BA'),
(7, 7, 'Ceará Sporting Club',           '1914-06-02', 'Fortaleza-CE'),
(8, 8, 'Fortaleza Esporte Clube',       '1918-10-18', 'Fortaleza-CE');

------------------------------------------------------------
-- 5. JOGADORES (50) – conforme combinamos
-- cpf, id_possiveis_cartoes, id_patrocinado,
-- atacante, meio_campo, defensor, gols, assistencias, desarmes
------------------------------------------------------------

-- Grupo 1 – Sport (1–10)
INSERT INTO Jogador VALUES
('91000000001',1,  9, TRUE, FALSE, FALSE, 9,  NULL, NULL),
('91000000002',2, 10, TRUE, FALSE, FALSE, 7,  NULL, NULL),
('91000000003',3, 11, FALSE, TRUE, FALSE, NULL, 6,   NULL),
('91000000004',4, 12, FALSE, TRUE, FALSE, NULL, 4,   NULL),
('91000000005',5, 13, FALSE, FALSE, TRUE, NULL, NULL, 17),
('91000000006',6, 14, FALSE, FALSE, TRUE, NULL, NULL, 13),
('91000000007',7, 15, TRUE, TRUE,  FALSE, 6, 3, NULL),
('91000000008',8, 16, TRUE, TRUE,  FALSE, 4, 5, NULL),
('91000000009',9, 17, FALSE, TRUE, TRUE, NULL, 4, 12),
('91000000010',10,18,FALSE, TRUE, TRUE, NULL, 3, 14);

-- Grupo 2 – Náutico (11–20)
INSERT INTO Jogador VALUES
('91000000011',11,19, TRUE, FALSE, FALSE, 8, NULL, NULL),
('91000000012',12,20, TRUE, FALSE, FALSE, 5, NULL, NULL),
('91000000013',13,21, FALSE, TRUE, FALSE, NULL, 7, NULL),
('91000000014',14,22, FALSE, TRUE, FALSE, NULL, 5, NULL),
('91000000015',15,23, FALSE, FALSE, TRUE, NULL, NULL, 16),
('91000000016',16,24, FALSE, FALSE, TRUE, NULL, NULL, 11),
('91000000017',17,25, TRUE, TRUE, FALSE, 6, 4, NULL),
('91000000018',18,26, TRUE, TRUE, FALSE, 3, 6, NULL),
('91000000019',19,27, FALSE, TRUE, TRUE, NULL, 4, 13),
('91000000020',20,28, FALSE, TRUE, TRUE, NULL, 5, 11);

-- Grupo 3 – Santa Cruz (21–30)
INSERT INTO Jogador VALUES
('91000000021',21,29, TRUE, FALSE, FALSE, 10, NULL, NULL),
('91000000022',22,30, TRUE, FALSE, FALSE, 6,  NULL, NULL),
('91000000023',23,31, FALSE, TRUE, FALSE, NULL, 8, NULL),
('91000000024',24,32, FALSE, TRUE, FALSE, NULL, 3, NULL),
('91000000025',25,33, FALSE, FALSE, TRUE, NULL, NULL, 18),
('91000000026',26,34, FALSE, FALSE, TRUE, NULL, NULL, 14),
('91000000027',27,35, TRUE, TRUE, FALSE, 7, 4, NULL),
('91000000028',28,36, TRUE, TRUE, FALSE, 5, 3, NULL),
('91000000029',29,37, FALSE, TRUE, TRUE, NULL, 6, 11),
('91000000030',30,38, FALSE, TRUE, TRUE, NULL, 4, 15);

-- Grupo 4 – Retrô (31–40)
INSERT INTO Jogador VALUES
('91000000031',31,39, TRUE, FALSE, FALSE, 7,  NULL, NULL),
('91000000032',32,40, TRUE, FALSE, FALSE, 4,  NULL, NULL),
('91000000033',33,41, FALSE, TRUE, FALSE, NULL, 5, NULL),
('91000000034',34,42, FALSE, TRUE, FALSE, NULL, 3, NULL),
('91000000035',35,43, FALSE, FALSE, TRUE, NULL, NULL, 12),
('91000000036',36,44, FALSE, FALSE, TRUE, NULL, NULL, 10),
('91000000037',37,45, TRUE, TRUE, FALSE, 6, 2, NULL),
('91000000038',38,46, TRUE, TRUE, FALSE, 5, 4, NULL),
('91000000039',39,47, FALSE, TRUE, TRUE, NULL, 5, 13),
('91000000040',40,48, FALSE, TRUE, TRUE, NULL, 6, 10);

-- Grupo 5 – Central (41–50)
INSERT INTO Jogador VALUES
('91000000041',41,49, TRUE, FALSE, FALSE, 9, NULL, NULL),
('91000000042',42,50, TRUE, FALSE, FALSE, 6, NULL, NULL),
('91000000043',43,51, FALSE, TRUE, FALSE, NULL, 7, NULL),
('91000000044',44,52, FALSE, TRUE, FALSE, NULL, 6, NULL),
('91000000045',45,53, FALSE, FALSE, TRUE, NULL, NULL, 14),
('91000000046',46,54, FALSE, FALSE, TRUE, NULL, NULL, 12),
('91000000047',47,55, TRUE, TRUE, FALSE, 5, 3, NULL),
('91000000048',48,56, TRUE, TRUE, FALSE, 4, 4, NULL),
('91000000049',49,57, FALSE, TRUE, TRUE, NULL, 4, 16),
('91000000050',50,58, FALSE, TRUE, TRUE, NULL, 5, 11);

------------------------------------------------------------
-- 6. TÉCNICOS (8) – com id_possiveis_cartoes 51–58
------------------------------------------------------------
INSERT INTO Tecnico (cpf, id_possiveis_cartoes, id_clube, licenca) VALUES
('92000000001', 51, 1, 'Licença PRO'),
('92000000002', 52, 2, 'Licença PRO'),
('92000000003', 53, 3, 'Licença PRO'),
('92000000004', 54, 4, 'Licença PRO'),
('92000000005', 55, 5, 'Licença PRO'),
('92000000006', 56, 6, 'Licença PRO'),
('92000000007', 57, 7, 'Licença PRO'),
('92000000008', 58, 8, 'Licença PRO');

------------------------------------------------------------
-- 7. JUÍZES (5)
------------------------------------------------------------
INSERT INTO Juiz (cpf, registro_federacao) VALUES
('93000000001', 'CBF-2024-01'),
('93000000002', 'CBF-2024-02'),
('93000000003', 'CBF-2024-03'),
('93000000004', 'CBF-2024-04'),
('93000000005', 'CBF-2024-05');

------------------------------------------------------------
-- 8. PATROCINADORES
------------------------------------------------------------
INSERT INTO Patrocinador (id_patrocinador, nome_patrocinador) VALUES
(1, 'PixBet'),
(2, 'BetNacional'),
(3, 'Caixa'),
(4, 'NeoEnergia'),
(5, 'Brahma');

------------------------------------------------------------
-- 9. CONTRATOS (20)
------------------------------------------------------------
INSERT INTO Contrato (id_contrato, data_inicio, data_fim) VALUES
(1, '2024-01-01','2025-01-01'),
(2, '2024-02-01','2025-02-01'),
(3, '2024-03-01','2025-03-01'),
(4, '2024-04-01','2025-04-01'),
(5, '2024-05-01','2025-05-01'),
(6, '2024-01-15','2026-01-15'),
(7, '2024-02-15','2026-02-15'),
(8, '2024-03-15','2026-03-15'),
(9, '2024-04-15','2026-04-15'),
(10,'2024-05-15','2026-05-15'),
(11,'2024-06-01','2025-06-01'),
(12,'2024-07-01','2025-07-01'),
(13,'2024-08-01','2025-08-01'),
(14,'2024-09-01','2025-09-01'),
(15,'2024-10-01','2025-10-01'),
(16,'2024-11-01','2025-11-01'),
(17,'2024-12-01','2025-12-01'),
(18,'2024-06-15','2026-06-15'),
(19,'2024-07-15','2026-07-15'),
(20,'2024-08-15','2026-08-15');

------------------------------------------------------------
-- 10. CONTRATO_JOGADOR (10 exemplos)
------------------------------------------------------------
INSERT INTO Contrato_Jogador (id_contrato, cpf_jogador, id_clube, salario) VALUES
(1,  '91000000001', 1, 55000),
(2,  '91000000002', 1, 52000),
(3,  '91000000011', 2, 53000),
(4,  '91000000012', 2, 51000),
(5,  '91000000021', 3, 54000),
(6,  '91000000022', 3, 50000),
(7,  '91000000031', 4, 49000),
(8,  '91000000032', 4, 47000),
(9,  '91000000041', 5, 48000),
(10, '91000000042', 5, 46000);

------------------------------------------------------------
-- 11. CONTRATO_PATROCINIO
-- 5 clubes + 5 jogadores patrocinados
------------------------------------------------------------
INSERT INTO Contrato_Patrocinio (id_contrato, id_patrocinado, id_patrocinador, valor) VALUES
-- Clubes 1–5
(11, 1, 1, 1200000),
(12, 2, 2, 950000),
(13, 3, 3, 800000),
(14, 4, 4, 750000),
(15, 5, 5, 600000),

-- Jogadores (id_patrocinado 9–13)
(16, 9,  1, 150000),
(17, 10, 2, 120000),
(18, 11, 3, 100000),
(19, 12, 4,  90000),
(20, 13, 5,  85000);

------------------------------------------------------------
-- 12. CAMPEONATOS
------------------------------------------------------------
INSERT INTO Campeonato (id_campeonato, nome, temporada, regulamento) VALUES
(1, 'Campeonato Pernambucano', '2024', 'Turno único com 5 clubes de Pernambuco.'),
(2, 'Copa do Nordeste',        '2024', 'Turno único com 5 clubes (2 de PE e 3 de fora).');

------------------------------------------------------------
-- 13. PARTICIPA (5 clubes por campeonato)
------------------------------------------------------------
-- Pernambucano (Sport, Náutico, Santa, Retrô, Central)
INSERT INTO Participa (id_clube, id_campeonato) VALUES
(1,1),(2,1),(3,1),(4,1),(5,1);

-- Copa do Nordeste (Sport, Náutico, Bahia, Ceará, Fortaleza)
INSERT INTO Participa (id_clube, id_campeonato) VALUES
(1,2),(2,2),(6,2),(7,2),(8,2);

------------------------------------------------------------
-- 14. RODADAS (5 por campeonato)
------------------------------------------------------------
INSERT INTO Rodada (numero_rodada, id_campeonato) VALUES
(1,1),(2,1),(3,1),(4,1),(5,1),
(1,2),(2,2),(3,2),(4,2),(5,2);

------------------------------------------------------------
-- 15. ESTÁDIOS
------------------------------------------------------------
INSERT INTO Estadio (id_estadio, nome, cidade, capacidade) VALUES
(1, 'Arena de Pernambuco', 'São Lourenço da Mata-PE', 46000),
(2, 'Ilha do Retiro',      'Recife-PE',               32000),
(3, 'Estádio dos Aflitos', 'Recife-PE',               19000),
(4, 'Estádio do Arruda',   'Recife-PE',               60000),
(5, 'Lacerdão',            'Caruaru-PE',              18000);

------------------------------------------------------------
-- 16. PARTIDAS + GOLS + CARTÕES
-- 16.1 CAMPEONATO PERNAMBUCANO (id_campeonato = 1)
-- Times: 1(Sport),2(Náutico),3(Santa),4(Retrô),5(Central)
-- 10 jogos 
------------------------------------------------------------

---------------- RODADA 1 ----------------
-- Partida 1: Sport 2 x 0 Náutico
INSERT INTO Partida VALUES
(1, 1, 1, 1, 2, '93000000001', 2, '2024-01-10','16:00', 2, 0);
-- gols
INSERT INTO Gol VALUES (1,'91000000001',12);
INSERT INTO Gol VALUES (1,'91000000007',55);
-- cartão
INSERT INTO Cartao VALUES (1,11,'amarelo',30);

-- Partida 2: Santa Cruz 1 x 1 Retrô
INSERT INTO Partida VALUES
(2, 1, 1, 3, 4, '93000000002', 4, '2024-01-11','18:00', 1, 1);
INSERT INTO Gol VALUES (2,'91000000023',40);
INSERT INTO Gol VALUES (2,'91000000037',70);
INSERT INTO Cartao VALUES (2,23,'amarelo',55);

---------------- RODADA 2 ----------------
-- Partida 3: Central 0 x 3 Sport
INSERT INTO Partida VALUES
(3, 1, 2, 5, 1, '93000000003', 5, '2024-01-17','19:00', 0, 3);
INSERT INTO Gol VALUES (3,'91000000001',10);
INSERT INTO Gol VALUES (3,'91000000002',28);
INSERT INTO Gol VALUES (3,'91000000007',60);
INSERT INTO Cartao VALUES (3,35,'amarelo',22);

-- Partida 4: Náutico 2 x 2 Santa Cruz
INSERT INTO Partida VALUES
(4, 1, 2, 2, 3, '93000000004', 3, '2024-01-18','19:00', 2, 2);
INSERT INTO Gol VALUES (4,'91000000011',22);
INSERT INTO Gol VALUES (4,'91000000012',50);
INSERT INTO Gol VALUES (4,'91000000023',66);
INSERT INTO Gol VALUES (4,'91000000024',74);
INSERT INTO Cartao VALUES (4,14,'vermelho',80);

---------------- RODADA 3 ----------------
-- Partida 5: Retrô 0 x 1 Sport
INSERT INTO Partida VALUES
(5, 1, 3, 4, 1, '93000000005', 1, '2024-01-24','20:00', 0, 1);
INSERT INTO Gol VALUES (5,'91000000001',33);
INSERT INTO Cartao VALUES (5,44,'amarelo',55);

-- Partida 6: Central 1 x 1 Náutico
INSERT INTO Partida VALUES
(6, 1, 3, 5, 2, '93000000001', 5, '2024-01-25','18:00', 1, 1);
INSERT INTO Gol VALUES (6,'91000000035',60);
INSERT INTO Gol VALUES (6,'91000000012',10);
INSERT INTO Cartao VALUES (6,32,'amarelo',70);

---------------- RODADA 4 ----------------
-- Partida 7: Sport 3 x 1 Santa Cruz
INSERT INTO Partida VALUES
(7, 1, 4, 1, 3, '93000000003', 2, '2024-01-31','19:30', 3, 1);
INSERT INTO Gol VALUES (7,'91000000001',15);
INSERT INTO Gol VALUES (7,'91000000007',62);
INSERT INTO Gol VALUES (7,'91000000002',80);
INSERT INTO Gol VALUES (7,'91000000023',33);
INSERT INTO Cartao VALUES (7,23,'vermelho',88);

-- Partida 8: Retrô 2 x 0 Central
INSERT INTO Partida VALUES
(8, 1, 4, 4, 5, '93000000004', 1, '2024-02-01','20:00', 2, 0);
INSERT INTO Gol VALUES (8,'91000000037',20);
INSERT INTO Gol VALUES (8,'91000000038',66);
INSERT INTO Cartao VALUES (8,39,'amarelo',45);

---------------- RODADA 5 ----------------
-- Partida 9: Náutico 1 x 1 Retrô
INSERT INTO Partida VALUES
(9, 1, 5, 2, 4, '93000000005', 3, '2024-02-07','18:00', 1, 1);
INSERT INTO Gol VALUES (9,'91000000012',22);
INSERT INTO Gol VALUES (9,'91000000037',55);
INSERT INTO Cartao VALUES (9,18,'amarelo',77);

-- Partida 10: Santa Cruz 2 x 2 Central
INSERT INTO Partida VALUES
(10, 1, 5, 3, 5, '93000000002', 4, '2024-02-10','16:00', 2, 2);
INSERT INTO Gol VALUES (10,'91000000023',18);
INSERT INTO Gol VALUES (10,'91000000027',59);
INSERT INTO Gol VALUES (10,'91000000035',45);
INSERT INTO Gol VALUES (10,'91000000041',72);
INSERT INTO Cartao VALUES (10,29,'amarelo',63);

------------------------------------------------------------
-- 16.2 COPA DO NORDESTE (id_campeonato = 2)
-- Times: 1(Sport),2(Náutico),6(Bahia),7(Ceará),8(Fortaleza)
-- 10 jogos
------------------------------------------------------------

---------------- RODADA 1 ----------------
-- Partida 21: Sport 3 x 1 Náutico
INSERT INTO Partida VALUES
(21, 2, 1, 1, 2, '93000000001', 2, '2024-03-01','16:00', 3, 1);
INSERT INTO Gol VALUES (21,'91000000001',10);
INSERT INTO Gol VALUES (21,'91000000002',20);
INSERT INTO Gol VALUES (21,'91000000007',75);
INSERT INTO Gol VALUES (21,'91000000011',60);
INSERT INTO Cartao VALUES (21,12,'amarelo',45);

-- Partida 22: Bahia 1 x 1 Ceará
INSERT INTO Partida VALUES
(22, 2, 1, 6, 7, '93000000002', 4, '2024-03-02','18:00', 1, 1);
INSERT INTO Gol VALUES (22,'91000000041',35);
INSERT INTO Gol VALUES (22,'91000000037',70);
INSERT INTO Cartao VALUES (22,47,'amarelo',22);

---------------- RODADA 2 ----------------
-- Partida 23: Fortaleza 0 x 2 Sport
INSERT INTO Partida VALUES
(23, 2, 2, 8, 1, '93000000003', 1, '2024-03-05','20:00', 0, 2);
INSERT INTO Gol VALUES (23,'91000000001',15);
INSERT INTO Gol VALUES (23,'91000000008',55);
INSERT INTO Cartao VALUES (23,48,'amarelo',33);

-- Partida 24: Náutico 1 x 0 Bahia
INSERT INTO Partida VALUES
(24, 2, 2, 2, 6, '93000000004', 3, '2024-03-06','18:00', 1, 0);
INSERT INTO Gol VALUES (24,'91000000012',12);
INSERT INTO Cartao VALUES (24,16,'amarelo',77);

---------------- RODADA 3 ----------------
-- Partida 25: Sport 2 x 1 Ceará
INSERT INTO Partida VALUES
(25, 2, 3, 1, 7, '93000000005', 2, '2024-03-10','16:00', 2, 1);
INSERT INTO Gol VALUES (25,'91000000001',22);
INSERT INTO Gol VALUES (25,'91000000007',60);
INSERT INTO Gol VALUES (25,'91000000037',80);
INSERT INTO Cartao VALUES (25,7,'amarelo',35);

-- Partida 26: Bahia 0 x 2 Fortaleza
INSERT INTO Partida VALUES
(26, 2, 3, 6, 8, '93000000003', 5, '2024-03-11','19:00', 0, 2);
INSERT INTO Gol VALUES (26,'91000000047',55);
INSERT INTO Gol VALUES (26,'91000000048',77);
INSERT INTO Cartao VALUES (26,50,'amarelo',20);

---------------- RODADA 4 ----------------
-- Partida 27: Ceará 1 x 3 Sport
INSERT INTO Partida VALUES
(27, 2, 4, 7, 1, '93000000004', 4, '2024-03-15','20:00', 1, 3);
INSERT INTO Gol VALUES (27,'91000000037',25);
INSERT INTO Gol VALUES (27,'91000000001',12);
INSERT INTO Gol VALUES (27,'91000000002',40);
INSERT INTO Gol VALUES (27,'91000000007',88);
INSERT INTO Cartao VALUES (27,34,'amarelo',66);

-- Partida 28: Fortaleza 2 x 2 Náutico
INSERT INTO Partida VALUES
(28, 2, 4, 8, 2, '93000000001', 1, '2024-03-16','18:00', 2, 2);
INSERT INTO Gol VALUES (28,'91000000047',14);
INSERT INTO Gol VALUES (28,'91000000048',60);
INSERT INTO Gol VALUES (28,'91000000011',22);
INSERT INTO Gol VALUES (28,'91000000012',50);
INSERT INTO Cartao VALUES (28,18,'amarelo',77);

---------------- RODADA 5 ----------------
-- Partida 29: Sport 4 x 0 Bahia
INSERT INTO Partida VALUES
(29, 2, 5, 1, 6, '93000000002', 2, '2024-03-20','20:00', 4, 0);
INSERT INTO Gol VALUES (29,'91000000001',10);
INSERT INTO Gol VALUES (29,'91000000002',21);
INSERT INTO Gol VALUES (29,'91000000007',44);
INSERT INTO Gol VALUES (29,'91000000008',80);
INSERT INTO Cartao VALUES (29,41,'amarelo',32);

-- Partida 30: Náutico 2 x 1 Ceará
INSERT INTO Partida VALUES
(30, 2, 5, 2, 7, '93000000003', 3, '2024-03-21','18:00', 2, 1);
INSERT INTO Gol VALUES (30,'91000000011',10);
INSERT INTO Gol VALUES (30,'91000000017',55);
INSERT INTO Gol VALUES (30,'91000000037',61);
INSERT INTO Cartao VALUES (30,25,'vermelho',90);
