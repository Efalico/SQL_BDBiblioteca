--Entrar no Banco de dados

USE MASTER

--Criando a base de dadps 
CREATE DATABASE BibliotecaDB
GO

--Entrar na Base de Dados 

USE BibliotecaDB;
GO
--Criando Tabelas

CREATE TABLE Autores (
AutorID int identity primary key,
NomeCompleto varchar(255) not null,
PaisOrigem varchar(255) not null
);


CREATE TABLE Livros (
LivrosID  int identity primary key,
Titulo varchar(255) not null,
AnoPublicacao varchar(255) not null,
AutorID int not null,
FOREIGN KEY (AutorID) REFERENCES Autores(AutorID)
);

CREATE TABLE Emprestimos (
EmprestimoID  int identity primary key,
DataEmprestimo date not null,
DataDevolucao date not null,
LivroID int not null,
FOREIGN KEY (LivroID) REFERENCES Livros(LivrosID)
);


INSERT INTO Autores VALUES ('JK Rowling','Reino Unido')




INSERT INTO Livros VALUES ('Harry Potter Pedra Filosofal','1997',1),
						('Harry Potter e a Câmara Secreta','1998',1),
						('Harry Potter e o Prisioneiro de Azkaban','1999',1),
						  ('Harry Potter e o Cálice de Fogo','2000',1),	
						  ('Harry Potter e a Ordem da Fênix','2003',1),
						  ('Harry Potter e o Enigma do Príncipe','2005',1),
						  ('Harry Potter e as Relíquias da Morte','2007',1)
						  

INSERT INTO Emprestimos VALUES ('10/20/2024','10/30/2024',5),
								('10/20/2024','10/30/2024',7)


--Atualizar os dados inseridos


UPDATE Emprestimos
SET DataEmprestimo = '2024/10/20', DataDevolucao= '2024/10/30'
WHERE EmprestimoID=2;


--Deletar dados inserido 


DELETE FROM Emprestimos WHERE EmprestimoID=3;







--Selecionar os dados para visualizar

SELECT*FROM Autores
SELECT*FROM Livros
SELECT*FROM Emprestimos



INNER JOIN Livros L on L.LivrosID = E.LivroID

INNER JOIN Autores A on A.AutorID = L.AutorID
 



--Apagar Tabela 

DROP TABLE Emprestimos

BACKUP DATABASE BibliotecaDB 
TO DISK = 'C:\temp\BibliotecaBD.bak';



SELECT E.EmprestimoID as'ID do Empréstimo', A.NomeCompleto as 'Nome do Autor', L.LivrosID as 'ID do Livro', 
L.AnoPublicacao as 'Ano de Publicação', L.Titulo as 'Título do Livro' FROM Emprestimos E
INNER JOIN Livros L on L.LivrosID = E.LivroID
INNER JOIN Autores A on A.AutorID = L.AutorID


SELECT E.EmprestimoID as'ID do Empréstimo', A.NomeCompleto as 'Nome do Autor', L.LivrosID as 'ID do Livro', 
L.AnoPublicacao as 'Ano de Publicação', L.Titulo as 'Título do Livro' FROM Emprestimos E
INNER JOIN Livros L on L.LivrosID = E.LivroID
INNER JOIN Autores A on A.AutorID = L.AutorID


ALTER TABLE Emprestimos  
ADD FOREIGN KEY (LivroID) REFERENCES Livros(LivrosID);


ALTER TABLE Livros
ADD FOREIGN KEY (AutorID) REFERENCES Autores(AutorID);

