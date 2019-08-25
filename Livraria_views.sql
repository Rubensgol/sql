create view livro_editora_assunto 
as select titulo,preco, nome as editora, descricao as assunto
from livros L
inner join editoras E on editora = E.codEditora
inner join assuntos A on A.sigla=L.assunto;

select * from livro_editora_assunto;

select titulo,editora, assunto
from livro_editora_assunto
where preco>45
order by titulo;




#quando for necessario utilizar varios dados de diferentes tabelas organizados em uma em diferentes consultas para economizar consultas

create view v_contas_livros 
as select nome as 'Nome_Autor',(select count(codLivro) from autores_livros where matriculaAutor=matricula) as 'Qtd_Livros' from autores;

select * from v_contas_livros;

drop view v_contas_livros;

create view autores_dois_livros
as select Nome_Autor as 'Nome_Autor'
from v_contas_livros
where Qtd_Livros>=2 ;



create view nome_descricao_assunto_qtd 
as select A.nome ,descricao as 'Descricao',count(matriculaAutor) as 'Qtd_Livros'
from autores A 
inner join autores_livros L on L.matriculaAutor = A.matricula 
inner join livros I on I.codLivro = L.codLivro
inner join assuntos D on D.sigla=I.assunto
where I.lancamento is not null
group by A.matricula,D.descricao;


drop view nome_descricao_assunto_qtd;

select * from nome_descricao_assunto_qtd;

create view titulo_descri_edito
as select titulo,descricao as 'Assunto',nome as 'Editora'
from livros L
inner join assuntos A on A.sigla=L.assunto
inner join editoras E on E.codEditora=L.editora;

select *from  titulo_descri_edito; 
