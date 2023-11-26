create database Ex04
go 
use Ex04

create table Cliente(
cpf      char(12) not null,
nome    varchar(30) not null,
telefone char(9) not null
primary key (cpf)
)
GO
create table Fornecedor(
id_for   int not null,
nome    varchar(30) not null,
logradouro varchar(40) not null,
num   int   not null,
complemento   varchar(20) not null,
cidade         varchar(20) not null
primary key (id_for)
)
GO
create table Produto(
cod_pro   int not null,
decricao   varchar(100) not null,
id_for     int not null,
preco     decimal(8,2)not null
primary key(cod_pro)
foreign key(id_for) references Fornecedor(id_for)
)
GO
create table venda(
cod_ven   int not null,
cod_pro     int not null,
cpf_cli    char(12) not null,
quant       int not null,
valortotal    decimal(8,2) not null,
data_venda     date, 
primary key (cod_ven, cod_pro,cpf_cli),
foreign key (cod_pro) references Produto(cod_pro),
foreign key (cpf_cli) references Cliente(cpf)
)
insert into Cliente values
('345789092-90','Julio Cesar','8273-6541'),
('251865337-10','Maria Antonia','8765-2314'),
('876273154-16','Luiz Carlos',	'6128-9012'),
('791826398-00','Paulo Cesar',	'9076-5273')
 
insert into Fornecedor values
(1,	'LG',	'Rod. Bandeirantes',	70000,	'Km 70',	'Itapeva'),
(2,	'Asus',	'Av. Nações Unidas',	10206,	'Sala 225',	'São Paulo'),
(3,	'AMD',	'Av. Nações Unidas',	10206,	'Sala 1095',	'São Paulo'),
(4,	'Leadership',	'Av. Nações Unidas',	10206,	'Sala 87',	'São Paulo'),
(5,	'Inno',	'Av. Nações Unidas',	10206,	'Sala 34','São Paulo')
 
insert into Produto values
(1,	'Monitor 19 pol.',1,449.99),
(2,	'Netbook 1GB Ram 4 Gb HD',2,699.99),
(3,	'Gravador de DVD - Sata',1	,99.99),
(4,	'Leitor de CD',	1,49.99),
(5,	'Processador - Phenom X3 - 2.1GHz',	3,349.99),
(6,	'Mouse',4,19.99),
(7,	'Teclado',	4,25.99),
(8,	'Placa de Video - Nvidia 9800 GTX - 256MB/256 bits',	5,	599.99)
 
select * from venda
insert into venda values
(1,	1,'251865337-10',	1,	449.99,	'03/09/2009'),
(1,	4,'251865337-10',	1,	49.99,	'03/09/2009'),
(1,	5,'251865337-10',	1,	349.99,	'03/09/2009'),
(2,	6,'791826398-00',	4,	79.96,	'06/09/2009'),
(3,	8,'876273154-16',	1,	599.99,	'06/09/2009'),
(3,	3,'876273154-16',	1,	99.99,	'06/09/2009'),
(3,	7,'876273154-16',	1,	25.99,	'06/09/2009'),
(4,	2,'345789092-90',	2,	1399.98,'08/09/2009')
 

 (1,	'LG',	'Rod. Bandeirantes',	70000,	'Km 70',	'Itapeva'),
(2,	'Asus',	'Av. Nações Unidas',	10206,	'Sala 225',	'São Paulo'),
(3,	'AMD',	'Av. Nações Unidas',	10206,	'Sala 1095',	'São Paulo'),
(4,	'Leadership',	'Av. Nações Unidas',	10206,	'Sala 87',	'São Paulo'),
(5,	'Inno',	'Av. Nações Unidas',	10206,	'Sala 34','São Paulo')
 
insert into Produto values
(1,	'Monitor 19 pol.',1,449.99),
(2,	'Netbook 1GB Ram 4 Gb HD',2,699.99),
(3,	'Gravador de DVD - Sata',1	,99.99),
(4,	'Leitor de CD',	1,49.99),
(5,	'Processador - Phenom X3 - 2.1GHz',	3,349.99),
(6,	'Mouse',4,19.99),
(7,	'Teclado',	4,25.99),
(8,	'Placa de Video - Nvidia 9800 GTX - 256MB/256 bits',	5,	599.99)
 
select * from venda
insert into venda values
(1,	1,'251865337-10',	1,	449.99,	'03/09/2009'),
(1,	4,'251865337-10',	1,	49.99,	'03/09/2009'),
(1,	5,'251865337-10',	1,	349.99,	'03/09/2009'),
(2,	6,'791826398-00',	4,	79.96,	'06/09/2009'),
(3,	8,'876273154-16',	1,	599.99,	'06/09/2009'),
(3,	3,'876273154-16',	1,	99.99,	'06/09/2009'),
(3,	7,'876273154-16',	1,	25.99,	'06/09/2009'),
(4,	2,'345789092-90',	2,	1399.98,'08/09/2009')
 
 -- Consultar no formato dd/mm/aaaa:
select convert(char(10),data_venda,103) as Data_venda
from venda
where cod_ven=4
 
Alter table Fornecedor
add  telefone char(10) 
 

update Fornecedor
set telefone = '7216-5371'
where id_for =1
 
 
update Fornecedor
set telefone = '8715-3738'
where id_for =2
 
update Fornecedor
set telefone = '3654-6289'
where id_for =4
 
select *from Fornecedor
 
 --Consultar por ordem alfabética de nome, o nome, o enderço concatenado e o telefone dos fornecedores
select  nome +', '+ logradouro+', '+ cast(num as varchar(5))+' , '+ complemento+' , '+ cidade as Dados_fornecedor
from Fornecedor
order by nome

--Produto, quantidade e valor total do comprado por Julio Cesar
SELECT P.cod_pro, V.quant, V.valortotal
FROM venda V
INNER JOIN Produto P ON P.cod_pro = V.cod_pro
INNER JOIN Cliente C ON C.cpf = V.cpf_cli
WHERE C.nome = 'Julio Cesar'

--Data, no formato dd/mm/aaaa e valor total do produto comprado por  Paulo Cesar
SELECT CONVERT(char(10), V.data_venda, 103),
        V.valortotal
FROM venda V
INNER JOIN Cliente C ON C.cpf = V.cpf_cli
WHERE C.nome = 'Paulo Cesar'

--Consultar, em ordem decrescente, o nome e o preço de todos os produtos 
SELECT preco, decricao
FROM Produto
ORDER BY decricao DESC

 