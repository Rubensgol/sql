
INSERT INTO editoras(nome) 
VALUES('Mirandela Editora'),('Editora Via-Norte'),('Editora Ilhas Tijucas'),('MJ Editora');

INSERT INTO assuntos(sigla, descricao) 
VALUES('B', 'Banco de Dados'),('P', 'ProgramaÃ§Ã£o'),('R', 'Redes'),('S', 'Sistemas Operacionais');

INSERT INTO livros(titulo, preco, lancamento, assunto, editora) 
VALUES('Banco de Dados para a Web', 131.2, '2015-01-10', 'B', 1),
('Programando em Linguagem C', 130, '2007-10-01', 'P', 1),
('Programando em Linguagem C++', 110.5, '2002-11-01', 'P', 3),
('Bancos de Dados na BioinformÃ¡tica', 90, null,'B', 2),
('Redes de Computadores', 72, '2011-03-07', 'R', 2);

INSERT INTO livros(titulo, preco, lancamento, assunto, editora) 
VALUES('Livronovo', 130.2, '2015-10-10', 'B', 2);

INSERT INTO autores(matricula, nome, CPF, endereco, dataNascimento, nacionalidade) 
VALUES(123, 'John Smith', '11111111111', 'Rua Brasil', '1963-04-03', 'Canadense'),
(456, 'Adam Silva', '22222222222', 'Rua CanadÃ¡', '1983-06-13', 'Brasileira'),
(789, 'Matias Rodriguez', '33333333333', 'Rua Argentina', '1976-08-06', 'Argentina');

INSERT INTO autores_livros(codLivro, matriculaAutor) 
VALUES(1, 456),(1, 789),(2, 123),(3, 123),(4, 456),(5, 789); 

INSERT INTO autores_livros(codLivro, matriculaAutor) 
values(6,456);

delete from autores_livros where codLivro=6;