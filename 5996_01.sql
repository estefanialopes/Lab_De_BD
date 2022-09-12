--3--
CREATE TABLE log_funcionario(
cpf_func VARCHAR(15),
novo_salario REAL,
Usuário VARCHAR(20),
data_hora TIMESTAMP
);

--4--
CREATE RULE rl_log_funcionario
AS ON UPDATE TO funcionario 
WHERE new.salario<>old.salario DO
INSERT INTO log_funcionario(cpf_func,novo_salario, Usuário, data_hora)VALUES 
(new.cpf, new.salario, current_user, current_timestamp);

--5--
SELECT FROM log_funcionario;
--6--
CREATE RULE no_delete_profdisc_rule AS ON DELETE TO professor_disciplina DO INSTEAD NOTHING;
DELETE FROM professor_disciplina;
--7--
CREATE TABLE professor_disciplina_auditoria(
codigo_disc INT,
cfp_func VARCHAR(15),
dt_exclusao DATE,
usuário VARCHAR(20)
);
--8--
CREATE RULE tg_delete_prof_disc
AS ON DELETE TO professor_disciplina 
INSERT INTO professor_disciplina_auditoria (codigo_disc,cpf_func,dt_exclusao,usuário)
VALUES(old.cpf, old.codigo_disc, current_user, current_date);
--9--
DELETE FROM professor_disciplina;
SELECT FROM professor_disciplina_auditoria;
