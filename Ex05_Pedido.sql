create database Ex05
go 
use Ex05
 
create table Fornecedor(
cod_for     int not null,
nome       varchar(20) not null,
atividdade  varchar(50) not null,
telefone   char(8) not null
primary key (cod_for)
)
GO
create table Cliente(
cod_cli      int not null,
nome        varchar(50) not null,
logradouro   varchar(30) not null,
numm      int not null,
telefone    char(8) not null,
data_nasc    date
primary key (cod_cli)
)
GO
create table Produto(
cod_pro    int not null,
nome     varchar(50) not null,
valor_uni   decimal(6,2) not null,
quant_est     int  not null,
decr      varchar(60) not null,
cod_for   int not null
primary key(cod_pro)
foreign key (cod_for) references Fornecedor(cod_for)
)
GO
create table Pedido(
cod_ped   int not null,
cod_cli   int not null,
cod_pro   int not  null,
quant    int not null,
dat_entr   date,
primary key(cod_ped, cod_cli, cod_pro),
foreign key (cod_cli) references Cliente (cod_cli),
foreign key (cod_pro) references Produto(cod_pro)
)
 
insert into Fornecedor values
(1001,	'Estrela','Brinquedo','41525898'),
(1002,	'Lacta'	,'Chocolate','42698596'),
(1003,	'Asus'	,'Informática','52014596'),
(1004,	'Tramontina','Utensílios Domésticos','50563985'),
(1005,	'Grow','Brinquedos','47896325'),
(1006,	'Mattel','Bonecos','59865898')
 
insert into Cliente Values
(33601	,'Maria Clara',	'R. 1° de Abril',	870,'96325874','2000-08-15'),
(33602	,'Alberto Souza','R. XV de Novembro',	987,'95873625','1985-02-02'),
(33603	,'Sonia Silva',	'R. Voluntários da Pátria',	1151,'75418596','1957-08-23'),
(33604	,'José Sobrinho','Av. Paulista',	250,	'85236547',	'1986-12-09'),
(33605	,'Carlos Camargo','Av. Tiquatira',	9652,	'75896325',	'1971-03-25')
 
insert into Produto values 
(1,	'Banco Imobiliário',	65.00,	15,'Versão Super Luxo'	,1001),
(2,'Puzzle 5000 peças',	50.00,	5,	'Mapas Mundo'	,1005),
(3,	'Faqueiro',	350.00,	0,	'120 peças',	1004),
(4,	'Jogo para churrasco',	75.00	,3,'	7 peças',	1004),
(5,	'Tablet',	750.00,	29,	'Tablet	',1003),
(6,	'Detetive',	49.00,	0,	'Nova Versão do Jogo',	1001),
(7,	'Chocolate com Paçoquinha',	6.00,	0	,'Barra',	1002),
(8,	'Galak',	5.00,	65,	'Barra',	1002)
 
insert into Pedido values
(99001,	33601,	1,	1,	'2012-06-07'),
(99001,	33601,	2,	1,	'2012-06-07'),
(99001,	33601,	8,	3,	'2012-06-07'),
(99002,	33602,	2,	1,	'2012-06-09'),
(99002,	33602,	4,	3,	'2012-06-09'),
(99003,	33605,	5,	1,	'2012-06-15')

--Consultar a quantidade, valor total e valor total com desconto (25%) dos itens comprados par Maria Clara.
SELECT P.quant, 
       PR.valor_uni * P.quant As Valor_total,
	   CAST((PR.valor_uni * P.quant)*0.75 AS decimal(4,2)) as Valor_desconto
FROM Pedido P
INNER JOIN Produto PR ON PR.cod_pro = P.cod_pro
INNER JOIN Cliente C ON C.cod_cli = P.cod_cli
WHERE C.nome = 'Maria Clara'

--Verificar quais brinquedos não tem itens em estoque.
SELECT nome
FROM Produto
WHERE quant_est =0

--Alterar para reduzir em 10% o valor das barras de chocolate.
UPDATE Produto 
SET valor_uni = valor_uni*0.9
WHERE nome like 'Chocolate%'

SELECT * from Produto

--Alterar a quantidade em estoque do faqueiro para 10 peças.
UPDATE Produto
SET quant_est =10
WHERE nome like 'Faqueiro%'


--Consultar quantos clientes tem mais de 40 anos.
SELECT COUNT(nome) as Quant
FROM Cliente
WHERE DATEDIFF(year,data_nasc, GETDATE())>40

--Consultar Nome e telefone dos fornecedores de Brinquedos e Chocolate.
SELECT nome, telefone
FROM Fornecedor 
WHERE atividdade like 'Chocolate%' or atividdade like 'Brinquedos%'

--Consultar nome e desconto de 25% no preço dos produtos que custam menos de R$50,00
SELECT P.nome, CAST((P.valor_uni * 0.25) as DECIMAL(4,2)) AS V_desconto
FROM Produto P
WHERE P.valor_uni < '50'

--Consultar nome e aumento de 10% no preço dos produtos que custam mais de R$100,00
SELECT nome, cast((valor_uni*1.1) as DECIMAL(7,2)) AS valor_aumento
FROM Produto
WHERE valor_uni > '100'

--Consultar desconto de 15% no valor total de cada produto da venda 99001.
SELECT (P.valor_uni * PE.quant) * 0.85 AS valor_desconto
FROM Produto P
INNER JOIN Pedido PE ON PE.cod_pro = P.cod_pro
WHERE PE.cod_ped = '99001'

--faz 100 menos o desconto

--Consultar Código do pedido, nome do cliente e idade atual do cliente
SELECT P.cod_ped, DATEDIFF(YEAR, C.data_nasc, GETDATE()) AS idade_cli
FROM Pedido P
INNER JOIN Cliente C ON C.cod_cli = P.cod_cli




