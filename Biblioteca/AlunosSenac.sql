--Criar Base de dados
create database BDTI46
go



use bdti46;
go 







--Entrar na base de dados

--Criando as Tabelas 

CREATE TABLE Alunos (
Id int identity primary key,
nome varchar(255) not null,
celular varchar(50) not null 
);




INSERT INTO Alunos VALUES ('Marcos','1234'),
						  ('Cadu','1234'),
						  ('Douglas','1234'),
						  ('Giovani','1234'),
						  ('Anderson','1234'),
						  ('Arieli','1234'),
						  ('Isabeli','1234'),
						  ('Leonardo','1234'),
						  ('Julio','1234'),
						  ('Felipe','1234'),
						  ('Eduardo','1234')



select*from Alunos






--Realizar backup da base de dados 
BACKUP DATABASE BDTI46
TO DISK = 'C:\temp\Cadastro.bak';

--Restaurar a base de dados 

RESTORE DATABASE BDTI46
FROM DISK = 'C:\temp\bdti46.bak';

-- Exclusao de Base de dados 
use master;
drop database BDTI46


