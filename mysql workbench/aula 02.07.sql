use db_aula_revisao;

select * from clientes where data_nascimento = 19880103;
select * from clientes where data_nascimento > 19900101;
select * from clientes where data_nascimento < 19951231;
select * from clientes where data_nascimento >= 19880101 and data_nascimento <= 19900101;
select * from clientes where data_nascimento like '%1988%';
select * from clientes where data_nascimento like '%1990%';

select * from clientes where estado_civil = 's' and sexo = 'm';
select * from clientes where estado_civil = 'c' and sexo = 'f';
select * from clientes where estado_civil = 's' and idade > 30;
select * from clientes where sexo = 'm' and data_nascimento > 19901231;
select * from clientes where sexo = 'f' and cidade = 'são paulo';

select * from clientes where estado_civil = 's' or estado_civil = 'c';
select * from clientes where sexo = 'm' or cidade = 'rio de janeiro';
select * from clientes where idade > 30 or data_nascimento < 19900101;
select * from clientes where sexo = 'f' or (data_nascimento >= 19880101 and data_nascimento < 19890101);
select * from clientes where estado_civil = 's' or cidade = 'salvador';

select count(*) as total_clientes from clientes;
select count(id) as não_nulos from clientes;
select count(distinct cidade) as qnt_cidades from clientes;
select count(estado_civil) as qnt_solteiros from clientes where estado_civil = 's';
select count(estado_civil) as qnt_sexo_m from clientes where sexo = 'm';

select count(estado_civil) from clientes where estado_civil = 's';
select count(estado_civil) from clientes where estado_civil = 'c';
select count(*) as casado from clientes where estado_civil = 'c';
select count(*) as solteiro from clientes where estado_civil = 's';
select count(*) as masculino from clientes where sexo = 'm';
select count(*) as feminino from clientes where sexo = 'f';

select sum(idade) as 'soma total das idades' from clientes;
select avg(idade) as 'média das idades' from clientes;
select min(idade) as 'idade mínima' from clientes;
select max(idade) as 'idade máxima' from clientes;
select sum(idade) as 'soma total das idades solteiros' from clientes where estado_civil = 's';

select cidade, count(*) as 'quant de clientes por cidade' from clientes group by cidade;
select estado_civil, count(*) as qnt_clientes_est_civil from clientes group by estado_civil;
select sexo, avg(idade) as media_idade_sexo from clientes group by sexo;
select data_nascimento, count(*) as 'qnt clientes por ano nasc' from clientes group by data_nascimento;
select cidade, sum(idade) as 'soma das idades por cidade' from clientes group by cidade;

-- select
-- sum(case when sexo = 'm' then 1 else 0)

select max(preco) as 'preço máximo' from produtos;
select min(preco) as 'preço mínimo' from produtos;
select marca, count(*) as 'marca dos produtos' from produtos group by marca;