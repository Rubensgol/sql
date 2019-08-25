drop database livraria;
CREATE DATABASE livraria;
USE livraria;

CREATE TABLE IF NOT EXISTS editoras (
codEditora int AUTO_INCREMENT PRIMARY KEY,
nome varchar(80));

CREATE TABLE IF NOT EXISTS assuntos (
sigla char PRIMARY KEY,
descricao varchar(50) NOT NULL);

CREATE TABLE IF NOT EXISTS autores(
matricula int PRIMARY KEY,
nome varchar(80) NOT NULL,    
CPF character(11) NOT NULL,
endereco varchar(100) NOT NULL,
dataNascimento date NOT NULL,
nacionalidade varchar(30) NOT NULL);

CREATE TABLE IF NOT EXISTS livros (
codLivro int AUTO_INCREMENT PRIMARY KEY,
titulo varchar(80) NOT NULL,
preco float,
lancamento date,
assunto char NOT NULL,
editora int NOT NULL,
FOREIGN KEY (assunto) REFERENCES assuntos(sigla),
FOREIGN KEY (editora) REFERENCES editoras(codEditora));

CREATE TABLE IF NOT EXISTS autores_livros (
codLivro int NOT NULL,
matriculaAutor int NOT NULL,
PRIMARY KEY (codLivro, matriculaAutor),
FOREIGN KEY (codLivro) REFERENCES livros(codLivro),
FOREIGN KEY (matriculaAutor) REFERENCES autores(matricula));

create table auditoria(codigo_livro int, valor_antigo float,valor_novo float);
select * from livros;
update livros set preco =159
where codLivro =1;
select * from auditoria;

alter table autores
add Qtd_livros int;