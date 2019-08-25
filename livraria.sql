
DELIMITER $$
create procedure  preco_livros()
begin 
	select titulo,preco from livros;
end
$$
create procedure seleciona_livros  (in quantidade int)
begin 
	select * from livros 
    limit quantidade;
end $$
create procedure verificar_qtd_livros(out quantidade int)
begin
	select count(*)into quantidade
    from livros;
end $$

create procedure precomedio(in numero_livro int, out preco_medio float)
begin 
	declare valor_total float;
    declare preco_livro float;
    
    declare finished int default 0;
   
   declare livro_cursor
   cursor for select preco from livros;
	declare continue handler 
    for not found set finished =1;
    
    open livro_cursor;
    
    set valor_total=0;
    set preco_medio=0;
    
    get_preco:loop
		fetch livro_cursor into preco_livro;
     
		if finished =1 then 
			leave get_preco;
		end if;
    
		set valor_total=valor_total+preco_livro;
	end loop;
    close livro_cursor;
    set preco_medio=valor_total/numero_livro;
end $$
create function hello(s char(20))
returns char(50) deterministic 
	return concat('Hello',s,'!1!');
$$
create function qtd_livros()
returns float deterministic
begin 
	declare quantidade int;
    select count(*) into quantidade from livros;
    return quantidade;
end$$

create procedure qtd_livros(out qtd float)
begin 
	declare totl float;
    declare livro_p float;
    declare finished int default 0;
    declare livro_cursor cursor for select preco from livros;
    
    declare continue handler 
    for not found set finished =1;
    
    open livro_cursor;
	 set totl =0;
     get_tot:loop
		fetch livro_cursor into livro_p;
     
		if finished =1 then 
			leave get_tot;
		end if;
    
		set totl=totl+livro_p;
	end loop;
    set qtd=totl;
	close livro_cursor;
    
 end$$   

create function ver_livros_cpf(cpf int)
returns int deterministic
begin 
declare qtd_livros int;
  select count(matricula) into qtd_livros from autores
    
    where matricula in(select matriculaAutor from autores_Livros group by matriculaAutor);
return qtd_livros;
end$$

create procedure insere_assunto(in sigla char(1),in descricao varchar(50))
	begin 
    insert into assuntos
    values(sigla,descricao);
    end$$
  
 
 create procedure muda_data(in cod int, in data_lance date)
	begin 
		update livros 
        set lancamento=data_lance
        where codLivro=cod;
end$$    
create procedure atualiza_assunto(in sigla char(1), in dscricao varchar(50))
	begin 
		update assuntos
		set descricao =dscricao
        where sigla=sigla;
        end$$
    
 
delimiter ;
call exclui_assunto('x');
select *from  v_contas_livros;
select * from autores;
select ver_livros_cpf(22222222222);
drop function ver_livros;
select * from livros;
call muda_data(2,'2010-10-01');
drop procedure qtd_livros;
drop procedure precomedio;

call insere_assunto('x','Revista');
call qtd_livros(@totl);
select @totl;
call preco_livros();
call seleciona_livros(2);
call verificar_qtd_livros(@total);
select @total;

call precomedio(@total,@preco);
select @preco;
select hello('rubens');
select qtd_livros();