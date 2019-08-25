select * from livros;
select * from autores;

select nome,(select count(matricula) from autores where matricula in
(select matriculaAutor from autores_livros where codLivro in(
select codLivro from livros where editora=codEditora)) ) as 'Qtd Autores' from editoras;

select nome, (select max(preco) from livros where codLivro in (select codLivro from autores_livros where matriculaAutor=matricula )) as 'Maior_Preco' from autores;

select nome as 'Nome_autor',(select count(codLivro) from autores_livros where matriculaAutor=matricula  ) as 'Livros_Publicados' from autores;

select nome from autores where matricula in (select matriculaAutor from autores_livros where codLivro in(select codLivro from livros where preco in (select max(preco) from livros))); 

select nome from editoras  where codEditora in (select editora from livros where lancamento is null);

select descricao as 'Assuntos',(select avg(preco) from livros where assunto=sigla) as 'Preco_Medio' from assuntos;

select nome from editoras 
where codEditora 
in(select editora from livros where assunto 
in (select sigla from assuntos where descricao='Banco de dados'));

select nome
from editoras where codEditora 
not in (select editora from livros where lancamento is not null);

select nome from autores where datanascimento in (select max(datanascimento) from autores);


select titulo, descricao
from livros inner join assuntos on assunto=sigla
where lancamento is not null;

select titulo,nome,descricao
from livros inner join editoras E on editora = E.codEditora inner join assuntos on assunto =sigla;

select nome,titulo
from editoras E inner join livros on editora=E.codEditora
where lancamento is not null order by nome,titulo;



select titulo, nome
from editoras E left outer join livros on editora=E.codEditora
order by nome,titulo;

select descricao, titulo
from assuntos left outer join livros on sigla = assunto
order by descricao;

select descricao, titul
from livros right outer join assuntos on sigla = assunto order by descricao;

select titulo,nome
from livros full join editoras on editoras.codEditora=editora
order by titulo;

select titulo,nome
from livros, editoras;

select titulo,preco,nome 
from livros full join editoras on editoras.codEditora=editora where preco<=100;

select nome,titulo
from autores_livros E inner join autores on autores.matricula=E.matriculaAutor inner join livros on livros.codLivro= E.codLivro order by nome ;

select count(nome)
from autores_livros E inner join autores on autores.matricula=E.matriculaAutor
inner join livros on livros.codLivro= E.codLivro
where autores.nome like'%Smith' order by nome ;

select * from autores_livros;