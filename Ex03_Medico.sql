Create database Ex03
go 
use Ex03

create table Paciente(
cpf    char (11)not null,
nome varchar(100) not null,
rua  varchar(100)not null,
num    int not null,
bairro varchar(50) not null,
telefone   char(8),
data_nasc  date not null
primary key (cpf)
)
create table Medico(
cod_med   int not null,
nome      varchar(50) not null,
esecialidade varchar(40) not null
primary key(cod_med)
)
create table Prontuario(
Data_cons    date not null,
cpf_pac      char(11) not null,
cod_med     int  not null,
diagnostico   varchar(40)not null,
medicamento   varchar(100) not null,
primary key (Data_cons,cpf_pac,cod_med),
foreign key (cpf_pac) references Paciente(cpf),
foreign key (cod_med) references Medico(cod_med)
)
insert into Paciente values
('35454562890','José Rubens','Campos Salles',	2750,'Centro','21450998','	1954-10-18'),
('29865439810','Ana Claudia	','Sete de Setembro',	178,'Centro','97382764','1960-05-29'),
('82176534800','Marcos Aurélio','Timóteo Penteado',	236	,'Vila Galvão','68172651',	'1980-09-24'),
('12386758770','Maria Rita','Castello Branco',7765,'Vila Rosália',	'NULL','1975-03-30'),
('92173458910','Joana de Souza','XV de Novembro',298,'Centro','21276578','1944-04-24')
 
insert into Medico values
(1,	'Wilson Cesar',	'Pediatra'),
(2,	'Marcia Matos',	'Geriatra'),
(3,	'Carolina Oliveira','Ortopedista'),
(4,	'Vinicius Araujo','Clínico Geral')
 
insert into Prontuario values
('2020-09-10','35454562890',2,	'Reumatismo',	'Celebra'),
('2020-09-10','92173458910',2,	'Renite Alérgica',	'Allegra'),
('2020-09-12','29865439810',1,	'Inflamação de garganta',	'Nimesulida'),
('2020-09-13','35454562890',2,	'H1N1',	'Tamiflu'),
('2020-09-15','82176534800',4,	'Gripe',	'Resprin'),
('2020-09-15','12386758770',3,	'Braço Quebrado','Dorflex + Gesso')


--Nome e Endereço (concatenado) dos pacientes com mais de 50 anos
SELECT rua + ' ' +cast(num as varchar(05)) + ' ' + bairro AS endereco, nome
FROM Paciente
WHERE DATEDIFF(YEAR, data_nasc, GETDATE()) > '50'

--Qual a especialidade de Carolina Oliveira
SELECT esecialidade
FROM Medico
WHERE nome = 'Carolina Oliveira'

--Qual medicamento receitado para reumatismo

SELECT medicamento
FROM Prontuario
WHERE diagnostico = 'Reumatismo'

--Diagnóstico e Medicamento do paciente José Rubens em suas consultas
SELECT PR.diagnostico, PR.medicamento
FROM Prontuario PR
INNER JOIN Paciente P ON P.cpf = PR.cpf_pac
WHERE P.nome = 'José Rubens'

-- CPF (Com a máscara XXX.XXX.XXX-XX), Nome, Endereço completo (Rua, nº - Bairro), Telefone (Caso nulo, mostrar um traço (-)) dos pacientes do médico Vinicius
SELECT 
    P.nome,
    CONCAT(SUBSTRING(cpf, 1, 3), '.', SUBSTRING(cpf, 4, 3), '.', SUBSTRING(cpf, 7, 3), '-', SUBSTRING(cpf, 10, 2)) AS CPF_mascara,
	rua, + ' ', + cast(num as varchar(05)) + ' - ', bairro AS endereco_completo,
	COALESCE(P.Telefone, '-') AS Telefone
FROM Paciente P
INNER JOIN Prontuario PO ON PO.cpf_pac = P.cpf
INNER JOIN Medico M ON m.cod_med = PO.cod_med
WHERE m.nome LIKE 'Vinicius%'

--Quantos dias fazem da consulta de Maria Rita até hoje
SELECT DATEDIFF(DAY, P.Data_cons, GETDATE())
FROM Prontuario P
INNER JOIN Paciente PA ON PA.cpf = P.cpf_pac
WHERE PA.nome LIKE 'Maria Rita%'

UPDATE Paciente
 set telefone = '98345621'
 where nome ='Maria Rita'
 
UPDATE Paciente
 set rua = 'Voluntários da Pátria', num = 1980, bairro=' Jd.Areoporto'
 where nome = 'Joana de Souza'
 
 select* from Paciente