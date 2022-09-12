/*3*/
CREATE VIEW estudantes_portugues(nome,matricula) AS

SELECT nome,matricula 
FROM estudante JOIN cursa ON matricula = matricula_est 
JOIN disciplina ON cod_disc = codigo 
WHERE descricao = 'Portugues';
/*4*/
SELECT * FROM estudantes_portugues;
/*5*/
CREATE OR REPLACE VIEW estudantes_portugues(nome,matricula, rg)

AS SELECT nome,matricula,rg 
FROM estudante JOIN cursa ON matricula = matricula_est 
JOIN disciplina ON cod_disc = codigo
WHERE descricao = 'Portugues'; 
/*6*/
CREATE VIEW numero_estudante_turma (Serie,N_est)AS

SELECT serie, COUNT(*)
FROM turma, estudante 
WHERE cod_turma = codigo 
GROUP BY codigo;

/*7*/
SELECT * FROM numero_estudante_turma;
/*8*/
DROP VIEW numero_estudante_turma;
/*9*/
/*Crie uma view chamada admissao, que apresente o nome, endereço, telefone e data de admissão dos funcionarios que possuem salário maior que 1300, 
depois modifique a view para que apresente também o cargo dos funcionários, 
e por fim vizualise o conteúdo da view criada. */

CREATE VIEW admissao(nome,endereço, telefone,data_admin) AS

SELECT nome, salario, data_admin 
FROM funcionario
WHERE salario>1300;

CREATE OR REPLACE VIEW admissao(nome,endereço,telefone,data_admin,cargo) AS

SELECT nome, salario, data_admin,cargo 
FROM funcionario
WHERE salario>1300;

SELECT * FROM admissao;
 

