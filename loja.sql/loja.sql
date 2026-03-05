            -- CRIAR TABELAS
create table cliente (
id 	SERIAL primary key,
nome varchar(100),
email VARCHAR(100)
)

create table produtos (
id SERIAL primary key,
nome varchar(100),
preco decimal(10,2)
);

create table pedidos (
id SERIAL primary key,
cliente_id int FOREIGN KEY,
produto_id  int FOREIGN KEY,
quantidade int,
dia TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
            -- INSERIR DADOS

insert into cliente (nome, email) 
values ('RAPHAEL', 'raphael@email.com'),
('DANIEL', 'daniel@email.com'),
('PEDRO', 'pedro@email.com'),
('GUSTAVO', 'gustavo@email.com');

select nome, email from cliente;

insert into produtos (nome,preco)
values ('Mouse Gamer', 159.90),
('Teclado Mecânico', 320.00),
('Monitor 144hz', 899.50),
('Headset 7.1', 215.25),
('Mousepad XL', 55.00);

select nome, preco from produtos;

insert into pedidos (cliente_id, produto_id, quantidade)
values(1, 3, 1),
(2,1,2),
(3,2,1)

SELECT * FROM pedidos;

SELECT 
c.nome AS cliente,
p.nome AS produto,
pe.quantidade,
p.preco,
(pe.quantidade) AS total
FROM pedidos pe
JOIN cliente c ON pe.cliente_id = c.id
JOIN produtos p ON pe.produto_id = p.id;