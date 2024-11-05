-- DATABASE

create database Store
use Store

-- delete
use master
drop database Store

-- TABLES

/*
   - Categoria: Armazena as categorias dos produtos. 

   - Produto: Armazena informações sobre os produtos, como nome, preço, quantidade em estoque e categoria. 

   - Cliente: Armazena os dados dos clientes que fazem pedidos. 

   - Pedido: Registra cada pedido realizado, a data e o status. 

   - ItemPedido: Armazena cada item presente em um pedido, associando um produto a uma quantidade específica e ao preço unitário. 
*/

-- Categorias: Id, Nome
create table Categorias(
	Id int identity primary key,
	Nome varchar(100) not null
);

-- Produtos: Id, Nome, Preco, Quantidade, CategoriaId
create table Produtos(
	Id int identity primary key,
	Nome varchar(100) not null,
	Preco decimal not null,
	Quantidade int not null,
	CategoriaId int not null,
	foreign key (CategoriaId) references Categorias (Id)
);

-- Clientes: Id, Nome, Email, Phone
create table Clientes(
	Id int identity primary key,
	Nome varchar(255) not null,
	Email varchar(100),
	Phone varchar(100)
);

-- Pedidos: Id, ClienteId, DataCompra, Status
create table Pedidos(
	Id int identity primary key,
	ClienteId int not null,
	DataCompra smalldatetime not null,
	Status varchar(100) not null,
	foreign key (ClienteId) references Clientes (Id)
);

-- ItensPedido: Id, PedidoId, ProdutoId, Quantidade
create table ItensPedido(
	Id int identity primary key,
	PedidoId int not null,
	ProdutoId int not null,
	Quantidade int not null,
	foreign key (PedidoId) references Pedidos (Id),
	foreign key (ProdutoId) references Produtos (Id)
);

-- delete
drop table ItensPedido
drop table Produtos
drop table Categorias
drop table Pedidos
drop table Clientes


-- POPULAÇÃO FEITA MANUALMENTE

insert into Categorias values ('Eletrônicos'), ('Vestuário');

insert into Produtos values ('Smartphone', 1999.00, 11, 1), ('Shorts Oxer evolution 6p', 90.5, 59, 2);

insert into Clientes (Nome) values ('Dona Lurdes');
insert into Clientes values ('Roberto Vigário', 'robertov@gmail.com', '11 939201-9349');

insert into Pedidos values (1, '2024-10-19 12:35:40', 'Entregue')
insert into Pedidos values (2, '2024-11-1 19:35:40', 'Em transporte')

insert into ItensPedido values (1, 1, 1)
insert into ItensPedido values (2, 2, 3)

-- delete
delete from ItensPedido
delete from Produtos
delete from Categorias
delete from Pedidos
delete from Clientes

-- POPULAÇÃO FEITA NO CHAT-GPT

INSERT INTO Categorias (Nome) VALUES ('Eletrônicos');
INSERT INTO Categorias (Nome) VALUES ('Roupas');
INSERT INTO Categorias (Nome) VALUES ('Alimentos');
INSERT INTO Categorias (Nome) VALUES ('Móveis');
INSERT INTO Categorias (Nome) VALUES ('Livros');
INSERT INTO Categorias (Nome) VALUES ('Beleza e Cuidados');
INSERT INTO Categorias (Nome) VALUES ('Brinquedos');
INSERT INTO Categorias (Nome) VALUES ('Esportes');
INSERT INTO Categorias (Nome) VALUES ('Jardinagem');
INSERT INTO Categorias (Nome) VALUES ('Automotivo');

INSERT INTO Produtos (Nome, Preco, Quantidade, CategoriaId) VALUES ('Smartphone', 1999.99, 50, 1);
INSERT INTO Produtos (Nome, Preco, Quantidade, CategoriaId) VALUES ('Camisa', 79.90, 100, 2);
INSERT INTO Produtos (Nome, Preco, Quantidade, CategoriaId) VALUES ('Cerveja', 5.50, 200, 3);
INSERT INTO Produtos (Nome, Preco, Quantidade, CategoriaId) VALUES ('Sofá', 1200.00, 20, 4);
INSERT INTO Produtos (Nome, Preco, Quantidade, CategoriaId) VALUES ('Livro de Programação', 45.00, 75, 5);
INSERT INTO Produtos (Nome, Preco, Quantidade, CategoriaId) VALUES ('Perfume', 150.00, 30, 6);
INSERT INTO Produtos (Nome, Preco, Quantidade, CategoriaId) VALUES ('Boneca', 89.90, 150, 7);
INSERT INTO Produtos (Nome, Preco, Quantidade, CategoriaId) VALUES ('Bola de Futebol', 49.90, 80, 8);
INSERT INTO Produtos (Nome, Preco, Quantidade, CategoriaId) VALUES ('Sementes de Flores', 10.00, 500, 9);
INSERT INTO Produtos (Nome, Preco, Quantidade, CategoriaId) VALUES ('Capa de Carro', 199.99, 25, 10);

INSERT INTO Clientes (Nome, Email, Phone) VALUES ('João Silva', 'joao.silva@email.com', '11987654321');
INSERT INTO Clientes (Nome, Email, Phone) VALUES ('Maria Oliveira', 'maria.oliveira@email.com', '11876543210');
INSERT INTO Clientes (Nome, Email, Phone) VALUES ('Carlos Souza', 'carlos.souza@email.com', '11765432109');
INSERT INTO Clientes (Nome, Email, Phone) VALUES ('Ana Santos', 'ana.santos@email.com', '11654321098');
INSERT INTO Clientes (Nome, Email, Phone) VALUES ('Fernanda Lima', 'fernanda.lima@email.com', '11543210987');
INSERT INTO Clientes (Nome, Email, Phone) VALUES ('Ricardo Pereira', 'ricardo.pereira@email.com', '11432109876');
INSERT INTO Clientes (Nome, Email, Phone) VALUES ('Tatiane Costa', 'tatiane.costa@email.com', '11321098765');
INSERT INTO Clientes (Nome, Email, Phone) VALUES ('Felipe Almeida', 'felipe.almeida@email.com', '11210987654');
INSERT INTO Clientes (Nome, Email, Phone) VALUES ('Juliana Martins', 'juliana.martins@email.com', '11109876543');
INSERT INTO Clientes (Nome, Email, Phone) VALUES ('Lucas Ferreira', 'lucas.ferreira@email.com', '11098765432');

INSERT INTO Pedidos (ClienteId, DataCompra, Status) VALUES (1, '2024-11-01 10:00', 'Concluído');
INSERT INTO Pedidos (ClienteId, DataCompra, Status) VALUES (2, '2024-11-01 11:30', 'Pendente');
INSERT INTO Pedidos (ClienteId, DataCompra, Status) VALUES (3, '2024-11-01 12:45', 'Cancelado');
INSERT INTO Pedidos (ClienteId, DataCompra, Status) VALUES (4, '2024-11-01 14:15', 'Concluído');
INSERT INTO Pedidos (ClienteId, DataCompra, Status) VALUES (5, '2024-11-02 09:00', 'Concluído');
INSERT INTO Pedidos (ClienteId, DataCompra, Status) VALUES (6, '2024-11-02 10:30', 'Pendente');
INSERT INTO Pedidos (ClienteId, DataCompra, Status) VALUES (7, '2024-11-02 11:00', 'Concluído');
INSERT INTO Pedidos (ClienteId, DataCompra, Status) VALUES (8, '2024-11-02 12:30', 'Cancelado');
INSERT INTO Pedidos (ClienteId, DataCompra, Status) VALUES (9, '2024-11-03 13:15', 'Concluído');
INSERT INTO Pedidos (ClienteId, DataCompra, Status) VALUES (10, '2024-11-03 14:00', 'Pendente');

INSERT INTO ItensPedido (PedidoId, ProdutoId, Quantidade) VALUES (1, 1, 1);  -- João comprou 1 Smartphone
INSERT INTO ItensPedido (PedidoId, ProdutoId, Quantidade) VALUES (1, 3, 6);  -- João comprou 6 Cervejas
INSERT INTO ItensPedido (PedidoId, ProdutoId, Quantidade) VALUES (2, 2, 2);  -- Maria comprou 2 Camisas
INSERT INTO ItensPedido (PedidoId, ProdutoId, Quantidade) VALUES (3, 4, 1);  -- Carlos comprou 1 Sofá
INSERT INTO ItensPedido (PedidoId, ProdutoId, Quantidade) VALUES (4, 5, 3);  -- Ana comprou 3 Livros de Programação
INSERT INTO ItensPedido (PedidoId, ProdutoId, Quantidade) VALUES (5, 6, 1);  -- Fernanda comprou 1 Perfume
INSERT INTO ItensPedido (PedidoId, ProdutoId, Quantidade) VALUES (6, 7, 2);  -- Ricardo comprou 2 Bonecas
INSERT INTO ItensPedido (PedidoId, ProdutoId, Quantidade) VALUES (7, 8, 1);  -- Tatiane comprou 1 Bola de Futebol
INSERT INTO ItensPedido (PedidoId, ProdutoId, Quantidade) VALUES (8, 9, 5);  -- Felipe comprou 5 Sementes de Flores
INSERT INTO ItensPedido (PedidoId, ProdutoId, Quantidade) VALUES (9, 10, 1); -- Juliana comprou 1 Capa de Carro
INSERT INTO ItensPedido (PedidoId, ProdutoId, Quantidade) VALUES (10, 1, 2); -- Lucas comprou 2 Smartphones


-- delete
delete from ItensPedido
delete from Produtos
delete from Categorias
delete from Pedidos
delete from Clientes

-- SEARCH

-- TODOS
select * from clientes
select * from Categorias
select * from Produtos
select * from Pedidos
select * from ItensPedido

-- BUSCAR PEDIDOS DE UM CLIENTE
select C.Nome as NomeCliente, P.Id as PedidoId, P.Status as PedidoStatus, P.DataCompra
from Pedidos P
inner join Clientes C on P.ClienteId = C.Id

--where C.Nome = '' --INSIRA O NOME
--where C.Email = '' --INSIRA O EMAIL
--where C.Phone = '' -- INSIRA O TELEFONE

-- BUSCAR PRODUTOS DE UM PEDIDO
select P.Nome, P.Id as ProdutoId, I.Quantidade, C.Nome as Cliente
from Produtos P
inner join ItensPedido I on I.ProdutoId = P.Id
inner join Pedidos Pe on I.PedidoId = Pe.Id
inner join Clientes C on C.Id = Pe.ClienteId

where Pe.Id = 8 --INSIRA O ID DO PEDIDO
