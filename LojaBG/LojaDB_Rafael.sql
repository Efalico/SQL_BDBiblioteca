create database LojaDB

use LojaDB
go

create table Categoria(
CategoriaId int identity primary key,
Nome varchar(50) not null
);

create table Produtos(
ProdutoId int identity primary key,
nome varchar(100) not null,
Preco int not null,
QuantidadeEstoque int not null,
CategoriaId int,
foreign key (CategoriaId) references Categoria(CategoriaId)
);

create table Cliente(
ClienteId int identity primary key,
Nome varchar(255) not null,
Email varchar(255) not null,
Telefone Varchar(25)
);

create table Pedido (
    PedidoID int identity primary key,
    ClienteID int,
    DataPedido date NOT NULL,
    Status varchar(20) NOT NULL,
    foreign key (ClienteID) references Cliente(ClienteID)
);

create table ItemPedido(
ItemPedidoID int identity primary key,
    PedidoID int,
    ProdutoID int,
    Quantidade int not null,
    PrecoUnitario int not null,
    foreign key (PedidoID) references Pedido(PedidoID),
    foreign key (ProdutoID) references Produtos(ProdutoID)
);

insert into Categoria (Nome) values 
('Eletrônicos'), 
('Roupas'), 
('Livros');

insert into Produtos (Nome, Preco, QuantidadeEstoque, CategoriaId) values
('Smartphone', 1750.00, 60, 1), 
('Notebook', 2500.00, 23, 1), 
('Televisão4K', 2750.00, 10, 1),
('Blusa', 100.00, 80, 2), 
('Camiseta', 25.00, 100, 2), 
('Calças', 75.00, 100, 2),
('Dicionario', 27.00, 60, 3), 
('Livro de Programação', 250.00, 23, 3), 
('Livro de Ciencias', 75.00, 10, 3);

insert into Cliente (Nome, Email, Telefone)values 
('João Silva', 'joao.silva@email.com', '1234-5678'),
('Maria Souza', 'maria.souza@email.com', '9876-5432'),
('Carlos Pereira', 'carlos.pereira@email.com', '5647-0987');

insert into Pedido (ClienteID, DataPedido, Status) values 
(1, '2024-11-01', 'Enviado'),
(2, '2024-11-02', 'Pendente'),
(3, '2024-11-03', 'Cancelado');

insert into ItemPedido (PedidoId, ProdutoId, Quantidade, PrecoUnitario) values
(1, 1, 1, 1750.00),
(2, 8, 1, 250.00),
(3, 3, 1, 2750.00);

SELECT 
    p.PedidoID,
    c.Nome AS Cliente,
    pr.Nome AS Produto,
    ip.Quantidade,
    ip.PrecoUnitario,
    p.DataPedido,
    p.Status
FROM 
    Pedido p
JOIN 
    Cliente c ON p.ClienteID = c.ClienteID
JOIN 
    ItemPedido ip ON p.PedidoID = ip.PedidoID
JOIN 
    Produtos pr ON ip.ProdutoID = pr.ProdutoID;


select * from Categoria
select * from Produtos
select * from Cliente
select * from Pedido
select * from ItemPedido
