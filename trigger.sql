delimiter $$

create trigger testa_aumento
after update on livros for each row
begin 
 if(new.preco>1.2*old.preco) then
	insert into auditoria(codigo_livro, valor_antigo, valor_novo)
    values(new.codLivro, old.preco, new.preco);
    end if;
end

$$
create trigger atualiza_qtdLivros_add
after insert on autores_livros for each row
begin 
	update autores 
    set qtd_livros=qtd_livros+1
    where new.matriculaAutor=matricula;
end
$$

create trigger atualiza_qtdLivros_remove
after delete on autores_livros for each row
begin 
	update autores 
    set qtd_livros=qtd_livros-1
    where old.matriculaAutor=matricula;
end
$$

delimiter ;
drop trigger atualiza_qtdLivros_add;