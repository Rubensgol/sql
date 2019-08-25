	create database Prova2;
use Prova2;
create table Bancos(
	Codigo int not null,
    Nome varchar(45),
    primary key(Codigo));
    
create table Pessoas(
		CPF varchar(11) not null,
        Nome varchar(45),
        primary key(CPF));

create table Conta_Corrente(
	Banco int not null,
    Pessoa varchar(11),
    numero int not null,
    primary key(Banco,Pessoa,numero),
	foreign key(Banco) references Bancos(Codigo),
    foreign key(Pessoa) references Pessoas(CPF));
    
   insert into Bancos(Codigo,Nome)
   values(001,'Banco do Brasil'),
   (033,'Santander'),
   (237,'Bradesco'),
   (341,'Itau');
   
   insert into Pessoas(CPF,Nome)
   values('86277635697','Jose da Silva'),
   ('88208811874','Manoel da Silva'),
   ('66516764743','Maria dos Santos');
   
   insert into Conta_Corrente(Banco,Pessoa,numero)
   values(033,'86277635697',98876788),
   (237,'86277635697',96645727),
   (341,'66516764743',9102947),
   (001,'88208811874',8120938);
   
   select Nome as B,Codigo from Bancos where Nome like 'B%';
   
   update Pessoas set Nome ='Manoel da Silva Ferreira' where CPF='88208811874';
   select * from Pessoas;
   
   select count(codigo) as 'Qtd Bancos' from Bancos;
   
   select nome from Pessoas right join conta_corrente on cpf=Pessoa where  numero=9102947; 
   
   select B.nome as 'Nome do banco' from Bancos B inner join Conta_Corrente C on B.codigo=C.Banco 
   inner join Pessoas P on C.Pessoa=P.Cpf where P.cpf='66516764743';

select nome, Cpf, count(Cpf) as 'QTde Contas' from Pessoas full join Conta_Corrente  on CPF=Pessoa group by cpf;
   