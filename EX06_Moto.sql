create database Ex06
go
use Ex06

create table Motorista(
cod_mot    int not null,
nome       varchar(30) not null,
data_nasc   date,
natura      varchar(20) not null
primary key(cod_mot)
)
create table Onibus(
placa   char(9) not null,
marca    char(12) not null,
ano     int not null,
descr   varchar(30) not null
primary key(placa)
)
create table Viagem(
cod_vi    int not null,
placa     char(9) not null,
cod_mot    int not null, 
hora_saida  time  not null,
hora_chegada time not null,
destino   varchar(20) not null,
primary key(cod_vi),
foreign key (placa) references Onibus(placa),
foreign key (cod_mot)references Motorista(cod_mot)
)
 
insert into Motorista values 
(12341,	'Julio Cesar','1978-04-18','São Paulo'),
(12342,	'Mario Carmo'	,'2002-07-29','	Americana'),
(12343,	'Lucio Castro'	,'1969-12-01','	Campinas'),
(12344,	'André Figueiredo','1999-05-14','São Paulo'),
(12345,	'Luiz Carlos','2001-01-09','São Paulo')
 
insert into Onibus values
('adf0965','Mercedes' ,  1999,'	Leito '),              
('bhg7654', 'Mercedes' ,2002	,'Sem Banheiro'),        
('dtr2093', 'Mercedes ' ,2001	,'Ar Condicionado'),     
('gui7625',	'Volvo',2001,	'Ar Condicionado')     
 
insert into Viagem values 
(101,'adf0965',12343,'10:00:00','12:00:00',	'Campinas'),
(102,'gui7625',12341,'7:00:00',	'12:00:00',	'Araraquara'),
(103,'bhg7654',12345,'14:00:00',	'22:00:00',	'Rio de Janeiro'),
(104,'dtr2093' ,12344,	'18:00:00',	'21:00:00','Sorocaba')

-- Consultar, da tabela viagem, todas as horas de chegada e saída, convertidas em formato HH:mm (108) e seus destinos

SELECT CONVERT(CHAR(05), hora_saida, 108) as hora_saida,
       CONVERT(CHAR(08), hora_chegada, 108) as hora_chegada
FROM Viagem

-- Consultar, com subquery, o nome do motorista que viaja para Sorocaba
SELECT M.nome
FROM Motorista M
INNER JOIN Viagem V ON V.cod_mot = M.cod_mot
WHERE V.destino = 'Sorocaba'

-- Consultar, com Subquery, a descrição, a marca e o ano do ônibus dirigido por Luiz Carlos

SELECT O.descr, O.ano
FROM Onibus O
INNER JOIN Viagem V ON V.placa = O.placa
INNER JOIN Motorista M ON M.cod_mot = V.cod_mot
WHERE M.nome = 'Luiz Carlos'

--Consultar o nome, a idade e a naturalidade dos motoristas com mais de 30 anos
SELECT nome, DATEDIFF(YEAR, data_nasc, GETDATE()) AS idade, natura
FROM Motorista


