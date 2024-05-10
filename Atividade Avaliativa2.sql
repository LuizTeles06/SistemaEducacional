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


create table curso_disciplinas (
	id_disciplina int,
	FOREIGN KEY (id_disciplina) REFERENCES disciplinas (id_disciplina),
	id_cursos int,
	FOREIGN KEY (id_cursos) REFERENCES cursos (id_cursos)
)


create table matriculas (
	ra int primary key,
	cpf varchar (15),
	CONSTRAINT fk_cpf FOREIGN KEY (cpf) REFERENCES alunos (cpf),
	id_cursos int,
	CONSTRAINT fk_id_cursos FOREIGN KEY(id_cursos) REFERENCES cursos (id_cursos),
	status text,
	situacao text
)

create table matricula_disciplina (
	ra int,
	FOREIGN KEY (ra) REFERENCES matriculas (ra),
    id_disciplina int,
	FOREIGN KEY (id_disciplina) REFERENCES disciplinas (id_disciplina)
)

drop table matricula_disciplina
drop table matriculas
drop table departamentos
drop table cursos
drop table curso_disciplinas

INSERT INTO cursos (id_cursos, nome_cursos) VALUES
(343, 'Ciência da Computação'),
(32, 'Engenharia Elétrica'),
(34, 'Administração de Empresas'),
(43, 'Psicologia'),
(53, 'Medicina'),
(63, 'Direito'),
(73, 'Biologia'),
(83, 'Arquitetura'),
(93, 'Economia'),
(109, 'Ciências da Terra')

INSERT INTO departamentos (id_departamento, sigla_departamento, nome_departamento) VALUES
(1, 'CC', 'Departamento de Ciência da Computação'),
(2, 'EE', 'Departamento de Engenharia Elétrica'),
(3, 'ADM', 'Departamento de Administração'),
(4, 'PSI', 'Departamento de Psicologia'),
(5, 'MED', 'Departamento de Medicina'),
(6, 'DIR', 'Departamento de Direito'),
(7, 'BIO', 'Departamento de Biologia'),
(8, 'ARQ', 'Departamento de Arquitetura'),
(9, 'ECO', 'Departamento de Economia'),
(10, 'CIE', 'Departamento de Ciências da Terra')


INSERT INTO matriculas (ra, status, situacao) VALUES
(123456, 'Ativa', 'formado'),
(234567, 'Ativa', 'formado'),
(345678, 'Inativa', 'formado'),
(456789, 'Ativa', 'formado'),
(567890, 'Inativa', 'formado'),
(678901, 'Ativa', 'nao formado'),
(789012, 'Inativa', 'nao formado'),
(890123, 'Ativa', 'nao formado'),
(901234, 'Ativa', 'nao formado'),
(123045, 'Inativa', 'nao formado')


--Exercicio 01
SELECT *
FROM alunos
WHERE nome = 'Ana Souza';

--Exercicio 02
SELECT nome_cursos, nome_departamento
FROM cursos
INNER JOIN departamentos ON nome_departamento = 'Departamento de Ciência da Computação';


--Exercicio 03
SELECT * from curso_disciplinas
INNER JOIN disciplinas ON nome_disciplina = 'Sistemas Operacionais';


--Exercicio 04
Select cpf, nome_disciplina
From disciplinas
INNER JOIN alunos ON cpf = '12345678900';

--Exercício 05
SELECT * FROM alunos
SELECT * FROM matriculas
select nome, id_cursos
from alunos
Inner join matriculas ON id_cursos='34'


--Exercicio 06
SELECT * FROM matricula_disciplina
SELECT * FROM matricula_disciplina
Where id_disciplina = '111'

--Exercicio 07
select nome, situacao
from alunos
Inner join matriculas ON situacao='formado'


--Exercicio 08
select nome, status
from alunos
Inner join matriculas ON status='Ativa'

--Exercicio 09
SELECT cursos.nome_cursos, COUNT(*) AS quantidade_alunos_ativos
FROM cursos
JOIN matriculas ON cursos.id_cursos = matriculas.id_cursos
WHERE matriculas.status = 'Ativa'
GROUP BY cursos.nome_cursos;

--Exercicio 10
SELECT d.nome_disciplina,
       (SELECT COUNT(*)
        FROM matricula_disciplina md
        JOIN matriculas m ON md.ra = m.ra
        WHERE md.id_disciplina = d.id_disciplina
          AND m.status = 'Ativa') AS quantidade_alunos_ativos
FROM disciplinas d;


