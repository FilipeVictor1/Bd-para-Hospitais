-- PROJETO GRUPO A
create database bd_prj;
use bd_prj;

-- TABELA DE USUARIOS
create table tb_usuarios(
login varchar(50) NOT NULL,
senha varchar(50) NOT NULL);

-- TABELA DE PACIENTES
create table paciente(
id_paciente INT AUTO_INCREMENT PRIMARY KEY,
nome varchar(70) NOT NULL,
idade INT NOT NULL,
tp_sanguineo varchar(3) NOT NULL,
sexo char(1),
historico_pessoal varchar(100) NOT NULL,
medicamento varchar(100) NOT NULL,
alergias varchar(80) NOT NULL,
peso varchar (100) 	NOT NULL,
altura varchar (100) NOT NULL,
contato varchar(80) NOT NULL,
email varchar(80) NOT NULL);

-- TABELA DE ATENDIMENTOS
create table atendimento(
cod_atendimento INT AUTO_INCREMENT PRIMARY KEY,
nome_medico varchar(80) NOT NULL,
data_atendimento timestamp default current_timestamp,
descricao varchar(200) NOT NULL);

-- COLOCANDO F.K NO COD_ATENDIMENTO
ALTER table atendimento
ADD constraint FOREIGN KEY (cod_atendimento) references pacientes(id_paciente);

-- RENOMENADO COLUNA
ALTER table paciente
rename column cod to id_paciente;

SELECT 
paciente.nome,id_paciente,idade,tp_sanguineo,sexo,peso,altura,
atendimento.cod_atendimento,nome_medico,data_atendimento,descricao
FROM paciente
INNER JOIN atendimento
ON paciente.id_paciente = atendimento.cod_atendimento;
