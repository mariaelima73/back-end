create database sistema_gestao;
use sistema_gestao;

-- desativando o modo safe updates
set sql_safe_updates = 0;

CREATE TABLE `clientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `data_nascimento` date NOT NULL,
  `estado_civil` varchar(10) NOT NULL,
  `sexo` varchar(10) NOT NULL,
  `idade` int NOT NULL,
  `cidade` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
);

insert into `clientes` values
(1, 'Ana Cláudia Santos', '86998987474', 19881102, 'solteiro', 'feminino', 36, 'Parnaíba'),
(2, 'Bernardo da Silva', '86965658484', 19980408, 'casado', 'masculino', 26, 'Parnaíba'),
(3, 'Flávia Lima Pereira', '31945484542', 19780102, 'casado', 'feminino', 46, 'Uberlândia'),
(4, 'Igor Azevedo Silva', '21985522558', 19790612, 'solteiro', 'masculino', 45, 'Rio de Janeiro'),
(5, 'Mário Constancio Júnior', '21974757671', 19631005, 'solteiro', 'masculino', 61, 'Rio de Janeiro'),
(6, 'Regis Nobreira Nobre', '11986858689', 19900102, 'solteiro', 'masculino', 34, 'São Paulo');

-- ---------------Normalização--------------------
CREATE TABLE clientes_3FN (
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(200)
);
CREATE TABLE informacoes_clientes (
cliente_id INT,
telefone VARCHAR(15),
data_nascimento DATE,
idade INT,
estado_civil VARCHAR(100),
sexo VARCHAR(10),
endereco VARCHAR(220),
cidade VARCHAR(100),
FOREIGN KEY (cliente_id) REFERENCES clientes_3FN(id)
);
INSERT INTO clientes_3FN (nome)
SELECT nome FROM clientes;

INSERT INTO informacoes_clientes (telefone, data_nascimento, idade, estado_civil, sexo, cidade)
SELECT telefone, data_nascimento, idade, estado_civil, sexo, cidade FROM clientes;

INSERT INTO informacoes_clientes (cliente_id)
SELECT id FROM clientes group by id;
-- -------------------------------------------------------
CREATE TABLE `sistema_gestao`.`produtos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `preço` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`id`));

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
  
  CREATE TABLE `sistema_gestao`.`estoque` (
  `produto_id` INT NOT NULL,
  `qntd_dispon` INT NOT NULL,
  INDEX `fk_estoque_produto_idx` (`produto_id` ASC) VISIBLE,
  CONSTRAINT `fk_estoque_produto`
    FOREIGN KEY (`produto_id`)
    REFERENCES `sistema_gestao`.`produtos` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT);

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

CREATE TABLE `sistema_gestao`.`pedidos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cliente_id` INT NOT NULL,
  `produto` VARCHAR(100) NOT NULL,
  `quant` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pedido_cliente_idx` (`cliente_id` ASC) VISIBLE,
  CONSTRAINT `fk_pedido_cliente`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `sistema_gestao`.`clientes` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT);

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
update produtos set preço = preço + (preço * 0.10);

select * from clientes where nome like 'A%' order by idade asc;
select * from produtos order by preço desc;
select * from estoque where qntd_dispon < 10;

alter table pedidos add column data_venda date;
update pedidos set data_venda = 20241201 where id = 2;
update pedidos set data_venda = 20241201 where id = 4;
update pedidos set data_venda = 20241101 where id = 5;

select * from pedidos where data_venda >= 20241201 and data_venda <= 20241230; -- linha 129 e 130 fazem a mesma coisa
select * from pedidos where data_venda between date(20241201) and date(20241231);

select count(*) as total_clientes from clientes;
select count(*) as 'soma total de vendas' from pedidos;
select avg(idade) as media_idades from clientes;
select min(idade) as 'idade mínima' from clientes;
select max(idade) as 'idade máxima' from clientes;
select count(distinct cidade) as qnt_cidades from clientes;

