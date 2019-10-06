select (select count(codLivro) from autores_livros where matriculaAutor=matricula) as 'Qtd_Livros' from autores where cpf=22222222222;

DELIMITER $$
create function ver_livros_cpf(cpfi char(11))
returns int deterministic
begin 
declare qtd_livros int;
select count(codLivro)into qtd_livros from autores_livros where matriculaAutor in(select matricula from autores where cpf=cpfi);
return cpfi;
end
$$
DELIMITER ;
drop function ver_livros_cpf;
select ver_livros_cpf('22222222222');
select count(codLivro)into @d from autores_livros where matriculaAutor in(select matricula from autores where cpf=22222222222);
select @d;