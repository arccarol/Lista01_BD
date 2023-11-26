CREATE DATABASE Ex02
GO 
USE Ex02

create table Cliente(
placa_carro   char(8) not null,
nome		varchar(200) NOT NULL,
logradouro   varchar(100) not null,
num    int  not null,
bairro   varchar(100) not null,
telefone varchar (9) not null
primary key (placa_carro)
foreign key(placa_carro) references Carro(placa_carro)
)
 
create table Carro(
placa_carro char(8) not null,
marca       char(10) not null,
mpdelo      char(10) not null,
cor         char (10) not null,
ano      int not null
primary key (placa_carro)
)
create table Peca(
cod    int Not null,
nome    varchar(100) not null,
valor   int not null
primary key ( cod)
)
create Table servico(
placa_carro   char(8) not null,
cod_peca      int not null,
quant         int not null,
valor         int   not null,
datavend      date ,
primary key (placa_carro,cod_peca),
foreign key (placa_carro) references Carro(placa_carro),
foreign key(cod_peca) references Peca(cod)
)
Insert into Cliente values 
('DXO9876','João Alves',	'R. Pereira Barreto',1258,	'Jd. Oliveiras',	'2154-9658'),
('LKM7380','Ana Maria',	'R. 7 de Setembro',	259,	'Centro',	'9658-8541'	),
('EGT4631','Clara Oliveira','	Av. Nações Unidas',	10254,	'Pinheiros',	'2458-9658'),
('BCD7521','José Simões',	'R. XV de Novembro',	36,	'Água Branca',	'7895-2459'	),
('AFT9087','Paula Rocha',	'R. Anhaia',	548,	'Barra Funda',	'6958-2548')
 
insert  into Carro values
('AFT9087','VW',	'Gol','	Preto',	2007),
('DXO9876',	'Ford',	'Ka','	Azul',	2000),
('EGT4631',	'Renault',	'Clio','	Verde',	2004),
('LKM7380',	'Fiat',	'Palio','	Prata',	1997),
('BCD7521',	'Ford','Fiesta','	Preto',	1999)
 
insert into peca values 
(1,'Vela',	70),
(2,	'Correia Dentada',	125),
(3,	'Trambulador',	90),
(4,	'Filtro de Ar',	30)
 
insert into servico values
('DXO9876',	1,	4,280,'01-08-2020'),
('DXO9876',	4,	1,30,'01-08-2020'),
('EGT4631',	3,	1,90,'02-08-2020'),
('DXO9876',	2,	1,125,'07-08-2020')

--Telefone do dono do carro Ka, Azul

SELECT CL.telefone
FROM Cliente CL
INNER JOIN Carro C ON C.placa_carro = CL.placa_carro
WHERE C.mpdelo = 'Ka'

--Endereço concatenado do cliente que fez o serviço do dia 2020-08-02

SELECT C.logradouro +' ' +cast( C.num as varchar(05)) + ' ' + C.bairro AS Endereco
FROM Cliente C
INNER JOIN servico S ON S.placa_carro = C.placa_carro
WHERE S.datavend = '2020-08-02'

--Placas dos carros de anos anteriores a 2001

SELECT placa_carro
FROM Carro
WHERE ano < '2001'

--Marca, modelo e cor, concatenado dos carros posteriores a 2005

SELECT marca + ' ' + mpdelo + ' ' + cor AS inf_carro
FROM Carro
WHERE ano > '2005'

--Código e nome das peças que custam menos de R$80,00

SELECT cod, nome
FROM Peca
WHERE valor < '80'




