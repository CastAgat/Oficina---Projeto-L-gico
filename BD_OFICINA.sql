-- BD OFICINA

create database oficina;
use oficina;

-- criar tabela clientes
create table cliente(
	id_cliente int primary key auto_increment,
    Fname varchar(20) NOT NULL,
    Lname varchar(20) NOT NULL,
    Estado varchar(20) NOT NULL,
    Cidade varchar(20) NOT NULL,
    Bairro varchar(20) NOT NULL,
    Rua varchar(20) NOT NULL,
    Num_casa int NOT NULL,
    Num_telefone char(13),
    CPF char(11),
    constraint unique_cpf_cliente unique(CPF) 
);

-- criar tabela mecanico
create table mecanico(
	id_mecanico int primary key auto_increment,
    Fname varchar(20) NOT NULL,
    Lname varchar(20) NOT NULL,
    Especialidade varchar(45) default 'Nenhuma',
    CPF CHAR(11) NOT NULL,
    Estado varchar(20) NOT NULL,
    Cidade varchar(20) NOT NULL,
    Bairro varchar(20) NOT NULL,
    Rua varchar(20) NOT NULL,
    Num_end int NOT NULL,
    Data_nasc Date NOT NULL,
    constraint unique_cpf_mec unique (CPF)
);

-- criar tabela equipe mec
create table equipe_mec(
	id_equipe_mec int primary key auto_increment
);
ALTER TABLE equipe_mec
add column turno enum('Manhã', 'Tarde', 'Noite')default ('Manhã');

alter table equipe_mec
add column nome_equipe varchar(20);

-- criar relação Mecanicos_em_Equipe
create table mecanicos_em_equipe(
	id_equipe_mec int,
    id_mecanico int, 
    primary key (id_equipe_mec, id_mecanico),
    FOREIGN KEY (id_equipe_mec) REFERENCES equipe_mec(id_equipe_mec),
    FOREIGN KEY (id_mecanico) REFERENCES mecanico(id_mecanico)
);


-- criar tabela veículo
create table veiculo(
	id_veiculo int primary key auto_increment,
    id_cliente int,
    id_equipe_mec int,
    id_mecanico int,
    Marca varchar(20) Not null,
    Placa char(7) NOT NULL,
    Modelo VARCHAR(20) NOT NULL,
    constraint unique_placa unique(Placa),
    constraint fk_cliente_veiculo foreign key (id_cliente) references cliente(id_cliente),
    constraint fk_equipe_veiculo foreign key (id_equipe_mec) references equipe_mec(id_equipe_mec),
    constraint fk_mecanico_veiculo foreign key (id_mecanico) references mecanico(id_mecanico)
);
alter table veiculo
drop constraint fk_mecanico_veiculo;

alter table veiculo drop column id_mecanico;
-- criar tabela Tabela Referencias

create table Tabela_Referencia(
	id_Tabela_Referencia int primary key auto_increment,
    valores_serviços float NOT NULL,
    valores_mao_de_obra Float NOT NULL
);
alter table Tabela_Referencia
change column `valores_mao_de_obra` serviço_desc varchar(40);

alter table Tabela_Referencia
change column `serviço_desc` serviço_desc varchar(100);
-- criar tabela estoque 
create table Estoque(
	id_estoque int primary key auto_increment,
    Estado varchar(20) NOT NULL,
    Cidade varchar(20) NOT NULL,
    Bairro varchar(20) NOT NULL,
    Rua varchar(20) NOT NULL,
    Num_end int NOT NULL,
    Contato varchar(20) NOT NULL
);


-- criar tabela peças
create table Pecas(
	id_pecas int primary key auto_increment,
    Valor Float NOT NULL
);
alter table Pecas
add column Nome_pecas varchar(40);
-- relação estoque e peças- Peças em estoque
create table Pecas_em_Estoque(
	id_pecas int,
    id_estoque int,
    quantidade int NOT NULL,
    constraint fk_id_pecas foreign key (id_pecas) references Pecas(id_pecas),
    constraint fk_id_estoque foreign key (id_estoque) references Estoque(id_estoque)
);

-- criar relacionamento Tabela OS e tabela referencia : sERVIÇOS EM OS
create table Serviços_em_OS(
	id_os int,
    id_Tabela_Referencia int,
    constraint fk_os_serviços2 foreign key(id_os) references OS(id_os),
    constraint fk_Tabela_Ref_Serviços foreign key(id_Tabela_Referencia) references Tabela_Referencia(id_Tabela_Referencia)
);
ALTER TABLE Serviços_em_OS
ADD COLUMN autorizacao_cliente BOOLEAN DEFAULT FALSE;
DESC Serviços_em_OS;
-- criar tabela OS
create table OS(
	id_os int primary key auto_increment,
    id_equipe_mec int,
    id_veiculo int,
    id_cliente int,
    id_tabela_referencias int,
    id_pecas int,
    id_estoque int,
    Servicos_nesc varchar(200) NOT NULL,
    Data_emissao DATE NOT NULL,
    Data_entrega_prev DATE NOT NULL,
    Status_os Enum('Aguardando aprovação', 'Em Andamento', 'Finalizado') default 'Aguardando aprovação',
    constraint fk_OS_equipe foreign key (id_equipe_mec) references equipe_mec(id_equipe_mec),
    constraint fk_OS_veiculo foreign key (id_veiculo) references veiculo(id_veiculo),
    constraint fk_OS_cliente foreign key (id_cliente) references cliente(id_cliente),
    constraint fk_OS_tabela foreign key (id_tabela_referencias) references Tabela_Referencia(id_Tabela_Referencia),
    constraint fk_OS_pecas foreign key (id_pecas) references Pecas(id_pecas),
    constraint fk_OSestoque foreign key (id_estoque) references estoque(id_estoque)
); 


desc OS;
alter table OS
drop constraint fk_OS_tabela;

ALTER TABLE OS
DROP COLUMN id_tabela_referencias;

ALTER TABLE OS
change column `Servicos_nesc` Observações varchar(300);

ALTER TABLE OS
DROP FOREIGN KEY fk_OS_pecas;

ALTER TABLE OS
DROP FOREIGN KEY fk_OSestoque;

ALTER TABLE OS
DROP COLUMN id_pecas;

ALTER TABLE OS
DROP COLUMN id_estoque;

-- criar tabela relacionamento entre peças e os 

CREATE TABLE Pecas_em_OS (
    id_os INT,
    id_pecas INT,
    id_estoque INT,
    quantidade_usada INT NOT NULL,
    PRIMARY KEY (id_os, id_pecas, id_estoque),
    FOREIGN KEY (id_os) REFERENCES OS(id_os),
    FOREIGN KEY (id_pecas) REFERENCES Pecas(id_pecas),
    FOREIGN KEY (id_estoque) REFERENCES Estoque(id_estoque)
);
-- criar tabela Serviços
create table servicos(
	id_servico int primary key auto_increment,
    autorizacao_cliente bool default false,
    id_os int,
    constraint fk_os_servicos foreign key (id_os) references OS(id_os)
);
DROP TABLE servicos;


show tables;