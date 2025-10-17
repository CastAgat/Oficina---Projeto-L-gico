-- Persistencias de dados e queries

-- cliente( id_cliente, Fname, Lname, Estado, Cidade, Bairro, Rua, Num_casa, Num_telefone char(13), CPF char(11)
insert into cliente(Fname, Lname, Estado, Cidade, Bairro, Rua, Num_casa, Num_telefone, CPF)
	values ('Carlos', 'Buarque', 'São Paulo', 'Indaiatuba', 'Moreira', 'Rua Montes', 651, '15 25248-5894', '15489632545'),
		   ('Maiara','Santos', 'São Paulo', 'Hortolândia', 'Jd. Amanda', 'Rua Florinda', 457, '25 42575-8569', '12661484652'),
           ('Miranda', 'Cesario', 'São Paulo', 'Monte Mor', 'Paulista', 'Rua Princesa Venus', 23, '19 54143-5897', '98558794856'),
           ('Marcos', 'Albuquerque', 'Rio de Janeio', 'Castanharis', 'Monter Rio', 'Rua Gato Preto', 455, '23 69875-5642', '25498635417'),
           ('Joana', 'Alves', 'São Paulo', 'Monte Mor', 'Alvorada', 'Rua Guilanda', 598, '26 89547-9654', '15654686541'),
           ('Carla', 'Carvalho', 'São Paulo', 'Hortolândia', 'Morantes', 'Rua 55', 234, '17 98098-4567', '12656314556'),
           ('Thiago', 'Fagundes', 'São Paulo', 'Monte Mor', 'Colina', 'Rua Joaquin Fagundes', 113, '15 56452-5986', '15652654968');


-- mecanico(id_mecanico, Fname, Lname, Especialidade default 'Nenhuma', CPF CHAR(11), 
-- Estado, Cidade, Bairro, Rua, Num_end , Data_nasc Date,
select * from mecanico;
insert into mecanico(Fname, Lname, Especialidade, CPF, Estado, Cidade, Bairro, Rua, Num_end, Data_nasc)
	values('Joaquin', 'Remandes', 'Injeção eletrônica', '15656454115', 'São Paulo', 'Indaiatuba', 'São Carlos', 'Rua Florinda', 225, '2000-08-12'),
		  ('Alexandre', 'Fagundes', 'Freios', '45541665454', 'São Paulo', 'Jacarezinho', 'Tominda','Rua 88', 454, '1999-05-06'),
          ('Fernando', 'Alcantra', default, '48775458656', 'São Paulo', 'Hortolândia', 'Jd. Amanda', 'Rua 88', 89, '1999-03-29'),
		  ('Carlos', 'Menezes', 'Suspensão', '12345678901', 'São Paulo', 'Campinas', 'Cambui', 'Rua das Flores', 101, '1985-07-22'),
		  ('Mariana', 'Silva', 'Motor', '98765432100', 'São Paulo', 'Sorocaba', 'Vila Nova', 'Rua das Palmeiras', 202, '1992-11-15'),
		  ('Roberto', 'Oliveira', 'Alinhamento', '45678912345', 'São Paulo', 'Piracicaba', 'Jardim Europa', 'Rua Azul', 303, '1988-04-10'),
		  ('Juliano', 'Costa', default , '32165498700', 'São Paulo', 'Jundiaí', 'Vila Real', 'Rua Verde', 404, '2000-09-05'),
		  ('Eduardo', 'Santos', 'Elétrica', '78912345678', 'São Paulo', 'Itu', 'Campo Rosa', 'Rua Amarela', 505, '1990-12-30'),     
		  ('Patric', 'Lima', default, '85296374100', 'São Paulo', 'Americana', 'Jardim São Paulo', 'Rua das Acácias', 606, '2000-02-18'),
		  ('Thiago', 'Ferraz', default, '74125896311', 'São Paulo', 'Valinhos', 'Vila Santana', 'Rua dos Cravos', 707, '2000-06-25'),
          ('Felipe', 'Barros', default, '36985214722', 'São Paulo', 'Paulínia', 'Jardim Planalto', 'Rua das Rosas', 808, '1991-10-03');

select * from equipe_mec;

-- equipe_mec(id_equipe_mec, turno enum('Manhã', 'Tarde', 'Noite')default ('Manhã'), ome_equipe varchar(20);
insert into equipe_mec(turno, nome_equipe)
	values ('Manhã', 'Verde'),
		   ('Manhã', 'Amarelo'),
           ('Tarde', 'Vermelho'),
           ('Tarde', 'Azul'),
           ('Noite', 'Roxa');

-- mecanicos_em_equipe(id_equipe_mec int,id_mecanico int, 
insert into mecanicos_em_equipe(id_equipe_mec, id_mecanico)
 values(1 , 1),
       (1, 4),
       (1, 6),
       (2, 8),
       (3, 11),
       (3, 9),
       (5, 10),
       (5, 3),
       (5, 5);

-- veiculo(id_veiculo, id_cliente int FK, id_equipe_mec int FK, id_mecanico int FK,
-- Marca, Placa char(7), Modelo 
insert into veiculo(id_cliente, id_equipe_mec, Marca, Placa, Modelo)
values ( 2, 1, 'Toyota', '458DF96', 'Corolla'),
	   ( 4, 1, 'Volkswagen', 'ABC1234', 'Gol'),
       ( 6, 2, 'Fiat', 'DEF5678', 'Uno'),
       ( 7, 3, 'Chevrolet', 'GHI9012', 'Onix'),
       ( 3, 5, 'Toyota', 'JKL3456', 'Corolla'),
       ( 5, 3, 'Honda', 'MNO7890', 'Civic'),
       ( 1, 1, 'Renault', 'PQR2345', 'Sandero');
	

-- Tabela_Referencia(Id_Tabela_Referencia, valores_serviços, valores_mao_de_obra
insert into Tabela_Referencia(valores_serviços, serviço_desc)
	values (60.20, 'Troca de mangueira'),
           (250.00, 'Alinhamento e balanceamento'),
           (180.50, 'Troca de óleo e filtro'),
           (320.00, 'Revisão completa'),
           (90.00, 'Troca de lâmpada do farol'),
           (150.75, 'Substituição de pastilhas de freio'),
           (210.00, 'Troca de correia dentada'),
           (85.00, 'Diagnóstico eletrônico'),
           (400.00, 'Serviço de suspensão'),
           (60.00, 'Calibragem e inspeção de pneus'),
           (275.00, 'Troca de amortecedores dianteiros');

    
-- Estoque(id_estoque, Estado, Cidade, Bairro, Rua, Num_end, Contato 
insert into Estoque(Estado, Cidade, Bairro, Rua, Num_end, Contato)
	values ('SP', 'Hortolândia', 'Jardim Amanda', 'Rua das Oficinas', 123, '(19) 99999-8888'),
		   ('SP', 'Campinas', 'Taquaral', 'Av. dos Mecânicos', 456, '(19) 98888-7777'),
           ('SP', 'Sumaré', 'Centro', 'Rua do Motor', 789, '(19) 97777-6666');

-- Pecas(Id_pecas, Valor, Nome_pecas)
insert into Pecas(Valor, Nome_pecas)
	value (85.90, 'Filtro de óleo'),
          (120.50, 'Pastilha de freio'),
          (350.00, 'Amortecedor dianteiro'),
          (45.00, 'Lâmpada H7'),
          (220.00, 'Bateria 60Ah'),
          (75.00, 'Correia dentada'),
          (180.00, 'Sensor de temperatura'),
          (95.00, 'Filtro de ar'),
          (130.00, 'Jogo de velas'),
          (60.00, 'Reservatório de água do radiador');

-- Pecas_em_Estoque(id_pecas int FK, id_estoque int FK, quantidade 
insert into Pecas_em_Estoque(id_pecas, id_estoque, quantidade)
	values (1, 2, 30),
		   (2, 2, 45),
           (3, 2, 20),
           (4, 1, 15),
           (5, 1, 55),
           (6, 3, 5),
           (7, 2, 100),
           (8, 3, 4),
           (9, 1, 10),
           (10, 2, 40);


-- OS( id_os, id_equipe_mec FK, id_veiculo FK, id_cliente FK,,
-- id_pecas FK, id_estoque FK, Observações , Data_emissao DATE , Data_entrega_prev DATE ,
-- Status_os Enum('Aguardando aprovação', 'Em Andamento', 'Finalizado') default 'Aguardando aprovação',
insert into OS(id_equipe_mec, id_veiculo, id_cliente, Observações, Data_emissao, Data_entrega_prev, Status_os)
	values ( 1, 1, 2, '', '2025-04-25', '2025-05-04', 'Finalizado'),
		   ( 1, 2, 4, '', '2025-10-01', '2025-11-14', 'Em Andamento'),
           ( 1, 7, 1, 'Verificar com Jonas', '2025-09-27', '2025-10-10', 'Finalizado'),
           ( 2, 3, 6, 'Esperando resposta estoque', '2025-10-16', '2025-11-01', 'Aguardando aprovação'),
           ( 3, 4, 7, '', '2025-09-20', '2025-09-30', 'Finalizado'),
           ( 3, 6, 5, '', '2025-05-05', '2025-05-10', 'Finalizado'),
           ( 5, 5, 3, '', '2025-07-20', '2025-07-24', 'Finalizado');
	
-- serviços_em_OS(id_os int, id_Tabela_Referencia int, autorizacao_cliente BOOLEAN DEFAULT FALSE
INSERT INTO serviços_em_OS(id_os, id_Tabela_Referencia, autorizacao_cliente)
	values( 14, 5, True),
		  ( 14, 3, False),
          ( 8, 1, True),
          ( 8, 4, True),
          ( 9, 2, True),
          ( 10, 11, False),
          ( 10, 9, True),
          ( 11, 7, True),
          ( 11, 6, True),
          ( 12, 10, True),
          ( 12, 3, False),
          ( 13, 1, True);


select * from Pecas_em_Estoque;

-- Pecas_em_OS (id_os INT FK, id_pecas INT FK, id_estoque INT FK, quantidade_usada INT NOT NULL,
insert into Pecas_em_OS(id_os, Id_pecas, id_estoque, quantidade_usada)
	values ( 8, 1, 2, 1),
		   ( 8, 2, 2, 1),
           ( 9, 8, 3, 2),
           ( 10, 8, 3, 1),
           ( 11, 9, 1, 1),
           ( 11, 5, 1, 3),
           (12, 3, 2, 1),
           (13, 2, 2, 2),
           (14, 2, 2, 1);


-- junção de mecanicos com equipe
SELECT
    m.id_mecanico, CONCAT(m.Fname, ' ', m.Lname) AS nome_mecanico,
    e.id_equipe_mec,
    e.nome_equipe,
    e.turno
FROM mecanicos_em_equipe mee
JOIN mecanico m ON mee.id_mecanico = m.id_mecanico
JOIN equipe_mec e ON mee.id_equipe_mec = e.id_equipe_mec;
    
-- querie para saber qual equipe está associada a um veiculo e cliente
SELECT
    v.id_veiculo,
    v.id_cliente,
    v.Marca,
    v.Modelo,
    v.Placa,
    em.nome_equipe,
    em.id_equipe_mec,
    em.turno
FROM veiculo v JOIN equipe_mec em ON v.id_equipe_mec = em.id_equipe_mec;

-- mesma queria de cima mas com o where para conaeguirmos escolher um veiculo
-- baseado no seu id
SELECT
    v.id_veiculo,
    v.id_cliente,
    v.Marca,
    v.Modelo,
    v.Placa,
    em.nome_equipe,
    em.id_equipe_mec,
    em.turno
FROM veiculo v JOIN equipe_mec em ON v.id_equipe_mec = em.id_equipe_mec
WHERE v.id_veiculo = 1; 
    
    
-- recuperações simples com SELECT Statement;
-- Recupera dados importantes de cliente 
SELECT Fname, Lname, Num_telefone FROM cliente;

-- Filtros com WHERE Statement;
-- Recupera todos os veiculos de uma determinada marca
SELECT * FROM veiculo WHERE Marca = 'Toyota';

-- Crie expressões para gerar atributos derivados;
-- Recupera nome e sobrenome do mecanico e conta sua idade
SELECT  concat(Fname, ' ', Lname) as Mecanico, 
    YEAR(CURDATE()) - YEAR(Data_nasc) AS idade
	FROM mecanico;

-- Defina ordenações dos dados com ORDER BY;
-- Recupera OS, ordenando pela data de emissão
SELECT * FROM OS ORDER BY Data_emissao DESC;

-- Condições de filtros aos grupos – HAVING Statement;
SELECT 
    p.Nome_pecas,
    p.id_pecas,
    SUM(pe.quantidade) AS total_estoque
FROM Pecas_em_Estoque pe
JOIN Pecas p ON pe.id_pecas = p.id_pecas
GROUP BY p.id_pecas, p.Nome_pecas
HAVING SUM(pe.quantidade) > 30;

-- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados;
-- Recupera cliente, dados do carro e da equipe responsável
SELECT
    c.Fname AS Cliente,
    v.Placa,
    v.Modelo,
    em.nome_equipe AS Equipe
FROM veiculo v
JOIN cliente c ON v.id_cliente = c.id_cliente
JOIN equipe_mec em ON v.id_equipe_mec = em.id_equipe_mec;

