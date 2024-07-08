create database sistema_gestao;
use sistema_gestao;

insert into `clientes` values
(1, 'Ana Cláudia Santos', '86998987474', 19881102, 'solteiro', 'feminino', 36, 'Parnaíba'),
(2, 'Bernardo da Silva', '86965658484', 19881102, 'casado', 'masculino', 36, 'Parnaíba'),
(3, 'Flávia Lima Pereira', '31945484542', 19881102, 'casado', 'feminino', 36, 'Uberlândia'),
(4, 'Igor Azevedo Silva', '21985522558', 19881102, 'solteiro', 'masculino', 36, 'Rio de Janeiro'),
(5, 'Mário Constancio Júnior', '21974757671', 19881102, 'solteiro', 'masculino', 36, 'Rio de Janeiro'),
(6, 'Regis Nobreira Nobre', '11986858689', 19881102, 'solteiro', 'masculino', 36, 'São Paulo');

insert into `produtos` values
(1, 'Case Redmi 11', 11.90),
(2, 'Case Redmi 12', 11.90),
(3, 'Case Redmi 13 Note', 11.90),
(4, 'Case iPhone 12', 14.90),
(5, 'Case iPhone 13', 14.90),
(6, 'Case iPhone 13 Pro', 14.90),
(7, 'Case Samsung S21 Ultra', 12.90),
(8, 'Case Samsung S23', 12.90),
(9, 'Case Samsung S23 Note', 12.90),
(10, 'Case Moto G54', 11.90);

insert into `estoque` values
(1, 20),
(2, 17),
(3, 18),
(4, 18),
(5, 11),
(6, 12),
(7, 20),
(8, 19),
(9, 17),
(10, 20);

insert into `pedidos` values
(1, 3, 'Case Redmi 13 Note', 1),
(2, 6, 'Case Samsung S23', 1),
(3, 3, 'Case Samsung S21 Ultra', 1),
(4, 2, 'Case iPhone 12', 1),
(5, 1, 'Case Redmi 13 Note', 2);

-- inserção
alter table clientes add column endereco varchar(255);
update clientes set endereco = 'Rua das Estrelas, 1234' where id = 1;
update clientes set endereco = 'Rua das Pimentas, 1235' where id = 2;
update clientes set endereco = 'Rua das Palmeiras, 1236' where id = 3;
update clientes set endereco = 'Rua dos Buracos, 1231' where id = 4;
update clientes set endereco = 'Rua das Flores, 1238' where id = 5;
update clientes set endereco = 'Rua dos Elefantes, 1234' where id = 6;

-- leitura
select * from clientes;
select * from pedidos;
select * from produtos;
select * from estoque;

-- atualização
update clientes set nome = 'Ana Cláudia dos Santos Silva' where id = 1;
update estoque set qntd_dispon = 18 where produto_id = 10;
update pedidos set quant = 2 where id = 2;
update produtos set preço = 10.9 where id = 10;

-- exclusão
-- delete from produtos where id = 9;
delete from clientes where id = 4;

select * from clientes where idade > 30;
update clientes set endereco = 'Rua das Embarcações' where id = 6;
select * from pedidos;
delete from pedidos where cliente_id = 3;
select * from pedidos;
update estoque set qntd_dispon = qntd_dispon + 5 where produto_id;
update produtos set preço = preço + (preço * 0.10) where preço;