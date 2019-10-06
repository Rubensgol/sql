
drop database teste;
create database teste;
use teste;

create table funcionarios(
nome varchar(30),
sobrenome varchar(30),
cep varchar(20),
sexo char,
id int primary key not null);
#drop table funcionarios;

insert into funcionarios (nome,sobrenome,cep,sexo,id)
values ('cris', 'mano', '04704120','m',1),
('cris2', 'agronomica', '04718345', 'm', 2),
('carik','rj', '08792987', 'm',3),
('maria', 'prof', '89160', 'f',4),
('thomas', 'eu', '39028', 'm',5);

#Index sobre sexo e o cep para facilitar a pesquisa
create index idx_sexo on funcionarios(sexo);
create index idx_cep on funcionarios(cep);

explain select nome from funcionarios where sexo='f';

explain select sobrenome from funcionarios where sobrenome>'c';

explain select id from funcionarios where id>4;

explain update funcionarios set nome='criszinho' where nome='cris';

explain update funcionarios set cep='1512' where cep='39028';

explain update funcionarios set sexo='f' where nome='cris2';

create index idx_nome on funcionarios(nome);

drop index idx_sexo_cep on funcionarios;
show index 
from funcionarios;	



