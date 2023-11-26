Create database Ex01
go
use Ex01
go
create Table Aluno(
ra      int  not null,
nome_aluno varchar(12) not null,
sobrenome varchar(20) not null,
rua       varchar(30) not null,
num    varchar(05)  not null,
bairro   varchar(20)not null,
cep   char(7) not null,
telefone char(12) 
primary key (ra)
)
create table Cursos(
codigo   int not null,
nome_curso   varchar(20) not null,
cargah    int  not null,
turno       varchar(10)not null
primary key (codigo)
)
create Table Disciplinas(
codigo_dis   int not null,
nome_dis   varchar (20) not null,
cargah    int not null,
turno     varchar(10) not null,
semestre    int not null
primary key (codigo_dis)
)
 
insert into Aluno values
(12345,'José',	'Silva','Almirante Noronha',	236,	'Jardim São Paulo',	'1589000',	'69875287'),
(12346,'Ana','Maria Bastos','Anhaia',	1568,'	Barra Funda',	'3569000',	'25698526'),
(12347,'Mario','Santos',	'XV de Novembro',	1841,	'Centro',	'1020030',null)	,
(12348,'Marcia','Neves',	'Voluntários da Patria',	225	,'Santana',	'2785090','78964152')
 
insert into Cursos values
(1,	'Informática',	2800,'	Tarde'),
(2,	'Informática',	2800,'	Noite'),
(3,	'Logística',	2650,'	Tarde'),
(4,	'Logística',	2650,'	Noite'),
(5,	'Plásticos',	2500,'	Tarde'),
(6,	'Plásticos',	2500,'	Noite')
 
insert into Disciplinas values
(1,'Informática',	4,	'Tarde'	,1),
(2,	'Informática',	4,	'Noite'	,1),
(3,	'Quimica',	4,	'Tarde'	,1),
(4,	'Quimica',	4,	'Noite'	,1),
(5,	'Banco de Dados I',	2,	'Tarde',3),
(6,	'Banco de Dados I',	2,	'Noite'	,3),
(7,	'Estrutura de Dados',	4,	'Tarde',4),
(8,	'Estrutura de Dados',	4,	'Noite',4)
 
select nome_aluno +' '+ sobrenome As nome_completo
from Aluno
 
select rua +' '+ num + ' ' + bairro+',cep:'+ cep
from Aluno
where telefone is null
 
select telefone
from Aluno
where ra = '12348'
 
select nome_curso,turno
from Cursos
where cargah=2800
 
select semestre
from Disciplinas
where nome_dis = 'Banco de Dados I'
and  turno = 'Noite'