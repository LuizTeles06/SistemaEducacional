-- criando a tabela alunos
Create Table alunos (
	cpf varchar (15) primary key, 
	nome varchar (100),
	idade varchar(50),
	rua text,
	numero varchar(50),
	bairro varchar(50),
	cidade varchar(50),
	pais varchar(20)	
)
alter table alunos alter column cpf type varchar (15) on delete cascade

drop table alunos
drop table telefones

create table telefones (
	cpf varchar (15),
	FOREIGN KEY (cpf) REFERENCES alunos (cpf),
	ddd int,
	telefone int
)

drop table emails
create table emails (
	cpf varchar (15),
	FOREIGN KEY (cpf) REFERENCES alunos (cpf),
	email varchar (100),
	dominio varchar (100)
)

drop table matriculas
create table matriculas (
	ra int primary key,
	cpf varchar (15),
	FOREIGN KEY (cpf) REFERENCES alunos (cpf),
	id_cursos int,
	FOREIGN KEY (id_cursos) REFERENCES cursos (id_cursos),
	status text
)

drop table cursos

create table cursos (
	id_cursos int primary key,
	nome_cursos text,
	id_departamento int,
	FOREIGN KEY (id_departamento) REFERENCES departamentos (id_departamento)
)

drop table departamentos 
create table departamentos (
	id_departamento int primary key,
	sigla_departamento varchar (100),
	nome_departamento text
) 

drop table disciplinas
create table disciplinas (
	id_disciplina int primary key,
	nome_disciplina text
)

drop table matricula_disciplina
create table matricula_disciplina (
	ra int,
	FOREIGN KEY (ra) REFERENCES matriculas (ra),
    id_disciplina int,
	FOREIGN KEY (id_disciplina) REFERENCES disciplinas (id_disciplina)
)

drop table curso_disciplinas
create table curso_disciplinas (
	id_disciplina int,
	FOREIGN KEY (id_disciplina) REFERENCES disciplinas (id_disciplina),
	id_cursos int,
	FOREIGN KEY (id_cursos) REFERENCES cursos (id_cursos)
)

INSERT INTO alunos (cpf, nome, idade, rua, numero, bairro, cidade, pais) VALUES
(12345678900, 'Ana Souza', '25', 'Rua das Flores', '123', 'Centro', 'São Paulo', 'Brasil'),
(23456789011, 'Pedro Santos', '28', 'Avenida Principal', '456', 'Jardim América', 'Rio de Janeiro', 'Brasil'),
(34567890122, 'Mariana Oliveira', '22', 'Rua das Palmeiras', '789', 'Bela Vista', 'Curitiba', 'Brasil'),
(45678901233, 'Carlos Silva', '30', 'Rua dos Girassóis', '1011', 'Barra Funda', 'Salvador', 'Brasil'),
(56789012344, 'Juliana Martins', '26', 'Avenida das Acácias', '1213', 'Boa Viagem', 'Recife', 'Brasil'),
(67890123455, 'Gustavo Pereira', '29', 'Rua das Orquídeas', '1415', 'Centro', 'Fortaleza', 'Brasil'),
(78901234566, 'Fernanda Lima', '24', 'Avenida das Hortênsias', '1617', 'Jardim Botânico', 'Porto Alegre', 'Brasil'),
(89012345677, 'Lucas Almeida', '27', 'Rua dos Cravos', '1819', 'Itaim Bibi', 'São Paulo', 'Brasil'),
(90123456788, 'Carolina Costa', '31', 'Rua das Margaridas', '2021', 'Centro', 'Belo Horizonte', 'Brasil'),
(01234567899, 'Gabriel Fernandes', '23', 'Avenida das Tulipas', '2223', 'Boa Vista', 'Brasília', 'Brasil')

INSERT INTO telefones (cpf, ddd, telefone) VALUES
('12345678900', 11, 99998888),
('23456789011', 11, 88887777),
('34567890122', 21, 77776666),
('45678901233', 21, 66665555),
('56789012344', 31, 55554444),
('67890123455', 31, 44443333),
('78901234566', 41, 33332222),
('89012345677', 41, 22221111),
('90123456788', 51, 11110000)

INSERT INTO emails (email, dominio) VALUES
('ana.souza@example.com', 'example.com'),
('ana.souza@gmail.com', 'gmail.com'),
('pedro.santos@example.com', 'example.com'),
('pedro.santos@yahoo.com', 'yahoo.com'),
('mariana.oliveira@example.com', 'example.com'),
('mariana.oliveira@outlook.com', 'outlook.com'),
('carlos.silva@example.com', 'example.com'),
('carlos.silva@hotmail.com', 'hotmail.com'),
('juliana.martins@example.com', 'example.com'),
('juliana.martins@live.com', 'live.com')

INSERT INTO matriculas (ra, status) VALUES
(123456, 'Ativa'),
(234567, 'Ativa'),
(345678, 'Inativa'),
(456789, 'Ativa'),
(567890, 'Inativa'),
(678901, 'Ativa'),
(789012, 'Inativa'),
(890123, 'Ativa'),
(901234, 'Inativa'),
(012345, 'Ativa')

INSERT INTO cursos (id_cursos) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10);

INSERT INTO departamentos (id_departamento, sigla_departamento, nome_departamento) VALUES
(11, 'DPT01', 'Departamento de Ciência da Computação'),
(22, 'DPT02', 'Departamento de Engenharia Elétrica'),
(33, 'DPT03', 'Departamento de Matemática'),
(44, 'DPT04', 'Departamento de Física'),
(55, 'DPT05', 'Departamento de Química'),
(66, 'DPT06', 'Departamento de Biologia'),
(77, 'DPT07', 'Departamento de Artes'),
(88, 'DPT08', 'Departamento de Línguas Estrangeiras'),
(99, 'DPT09', 'Departamento de História'),
(100, 'DPT10', 'Departamento de Economia')

INSERT INTO disciplinas (id_disciplina, nome_disciplina) VALUES
(111, 'Introdução à Programação'),
(21, 'Estruturas de Dados'),
(31, 'Algoritmos e Complexidade'),
(41, 'Banco de Dados'),
(51, 'Redes de Computadores'),
(61, 'Sistemas Operacionais'),
(71, 'Inteligência Artificial'),
(81, 'Desenvolvimento Web'),
(91, 'Segurança da Informação'),
(101, 'Engenharia de Software');


--Exercicio 01
SELECT *
FROM alunos
WHERE nome = 'Ana Souza';

--Exercicio 02
SELECT nome_curso
FROM cursos
JOIN departamentos ON cursos.id_departamento = departamentos.id_departamento
WHERE departamentos.nome_departamento = 'Departamento de Ciência da Computação';

--Exercicio 03
SELECT id_curso
FROM cursos
JOIN disciplinas ON cursos.id_curso = disciplinas.id_curso
WHERE disciplinas.nome_disciplina = 'Banco de Dados';

--exercicio 04
Select nome_disciplina
FROM disciplinas
INNER JOIN  aluno ON Aluno.cpf = disciplinas.nome_disciplina
WHERE cpf = '34567890122';

--exercicio 05
SELECT nome
FROM alunos
INNER JOIN cursos on aluno.nome =curso.id_curso
WHERE  id_curso = '1';

--exercicio 06
SELECT nome.*
FROM alunos
JOIN matricula_disciplina ON alunos.ra = matricula_disciplina.ra
JOIN disciplinas ON matricula_disciplina.id_disciplina = disciplinas.id_disciplina
WHERE disciplinas.nome_disciplina = 'Banco de Dados';

--exercicio 07 
SELECT *
FROM alunos
WHERE nome.ra IN (SELECT ra FROM matriculas WHERE status = 'ativo');

--exercicio 08
SELECT *
FROM alunos
WHERE ra IN (SELECT ra FROM matriculas WHERE status = 'Ativa');

--exercicio 09
SELECT c.nome_curso,
       (SELECT COUNT(*)
        FROM matriculas m
        WHERE m.id_curso = c.id_curso
          AND m.status = 'Ativa') AS quantidade_alunos_ativos
FROM cursos c;

--exercicio 10
SELECT d.nome_disciplina,
       (SELECT COUNT(*)
        FROM matricula_disciplina md
        JOIN matriculas m ON md.ra = m.ra
        WHERE md.id_disciplina = d.id_disciplina
          AND m.status = 'Ativa') AS quantidade_alunos_ativos
FROM disciplinas d;



