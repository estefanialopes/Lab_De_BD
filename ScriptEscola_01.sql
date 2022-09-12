CREATE TABLE turma(
  codigo INTEGER,
  n_sala integer,
  serie character varying(30),
  PRIMARY KEY(codigo)
);

CREATE TABLE estudante (
  matricula INTEGER NOT NULL,
  cod_turma INTEGER,
  nome VARCHAR(100) NULL,
  rg VARCHAR(20) NULL,
  endereco VARCHAR(100) NULL,
  telefone VARCHAR(50) NULL,
  data_nasc DATE NULL,
  PRIMARY KEY(matricula),
  FOREIGN KEY(cod_turma) REFERENCES turma(codigo)
);

CREATE TABLE disciplina (
  codigo INTEGER NOT NULL,
  descricao VARCHAR(100) NULL,
  carga_horaria INTEGER NULL,
  PRIMARY KEY(codigo)
);

CREATE TABLE cursa (
  matricula_est INTEGER NOT NULL,
  cod_disc INTEGER NOT NULL,
  PRIMARY KEY(matricula_est, cod_disc),
  FOREIGN KEY(matricula_est) REFERENCES estudante(matricula),
  FOREIGN KEY(cod_disc) REFERENCES disciplina(codigo)
);

CREATE TABLE funcionario (
  cpf VARCHAR(15) NOT NULL,
  cargo VARCHAR(30) NULL,
  nome VARCHAR(50) NULL,
  endereco VARCHAR(100) NULL,
  telefone VARCHAR(30) NULL,
  data_nasc DATE NULL,
  data_admin DATE NULL,
  salario REAL NULL,
  PRIMARY KEY (cpf)
);

CREATE TABLE professor_disciplina (
  codigo_disc INTEGER NOT NULL REFERENCES DISCIPLINA(codigo),
  cpf_func VARCHAR(15) NOT NULL REFERENCES FUNCIONARIO(cpf),
  PRIMARY KEY(codigo_disc, cpf_func),
  FOREIGN KEY(codigo_disc) REFERENCES disciplina(codigo),
  FOREIGN KEY(cpf_func) REFERENCES funcionario(cpf)
);

CREATE TABLE dependente (
  nome VARCHAR(50) NOT NULL,
  cpf_func VARCHAR(15) NOT NULL,
  parentesco VARCHAR(20) NULL,
  PRIMARY KEY (nome)
);

INSERT INTO turma VALUES (1, 200, 'terceiro ano');
INSERT INTO turma VALUES (2, 300, 'segundo ano');
INSERT INTO turma VALUES (3, 400, 'primeiro ano');
INSERT INTO turma VALUES (4, 500, 'quinta serie');

INSERT INTO disciplina VALUES (1, 'Matematica', 10);
INSERT INTO disciplina VALUES (2, 'Portugues', 10);
INSERT INTO disciplina VALUES (4, 'Historia', 8);
INSERT INTO disciplina VALUES (3, 'Biologia', 8);
INSERT INTO disciplina VALUES (5, 'Geografia', 8);
INSERT INTO disciplina VALUES (6, 'Ingles', 6);
INSERT INTO disciplina VALUES (7, 'Fisica', 10);

INSERT INTO funcionario VALUES ('0987654321', 'Professor', 'Maria Jose Teixeira', 'Rua dos Ipes', '(12)3309-3456', '1980-09-06', '2009-06-07', 1500);
INSERT INTO funcionario VALUES ('12345678921', 'Professor', 'Antonio da Silva', 'Rua das Flores 12 Bairro Sao Paulo', '(12)3345-6789', '1978-11-11', '2008-02-02', 1000);
INSERT INTO funcionario VALUES ('09878967587', 'Professor', 'Vicente Carvalho', 'Rua Veneza 12 Bairro Sao Francisco', '(12) 3309-9999', '1977-02-05', '2006-06-05', 2000);
INSERT INTO funcionario VALUES ('34576890765', 'Bibliotecario', 'Fernanda de Paula', 'Rua Cinco 14 Bairro Veneza', '(12) 3345-8765', '1981-07-05', '2010-04-03', 1300);
INSERT INTO funcionario VALUES ('34562798534', 'Administrador', 'Ricardo Oliveira', 'Rua treze de maio 345 Bairro centro', '(12)3345-2345', '1977-06-02', '2007-06-01', 1600);
INSERT INTO funcionario VALUES ('929938848876', 'Professor', 'Joaquim Santana', 'Rua Visconde de Guarapuava 34 centro', '(12)3309-4567', '1981-06-04', '2010-08-05', 1000);


INSERT INTO estudante VALUES (1, 1, 'Renato da Silveira', '11333876', 'Rua Andre de Barros', '(12)3309-0987', '1993-11-07');
INSERT INTO estudante VALUES (2, 1, 'Rodrigo Pereira', '43432543', 'Rua Joao Itibere 345', '(12)3309-2345', '2004-09-09');
INSERT INTO estudante VALUES (3, 1, 'Amanda Silva', '09987321', 'Rua Visconde de Guarapuava 33', '(12)3309-6543', '2003-03-04');
INSERT INTO estudante VALUES (4, 2, 'Renata Borges', '98387283', 'Rua Senador Armando 45', '(12)3309-4534', '2004-03-02');
INSERT INTO estudante VALUES (5, 2, 'Gabriel Moraes', '43235987', 'Rua Mariano Torres 989', '(12)3309-3333', '2005-02-02');
INSERT INTO estudante VALUES (6, 3, 'Thaisa Rafael', '45345333', 'Rua Dr Hugo de Barros 98', '(12)3309-3211', '2004-03-06');
INSERT INTO estudante VALUES (7, 4, 'Daniel Miranda', '45234098', 'Rua das Flores', '(12)3309-8888', '2002-03-04');

INSERT INTO cursa VALUES (1, 1);
INSERT INTO cursa VALUES (1, 2);
INSERT INTO cursa VALUES (1, 3);
INSERT INTO cursa VALUES (1, 4);
INSERT INTO cursa VALUES (1, 5);
INSERT INTO cursa VALUES (1, 6);
INSERT INTO cursa VALUES (1, 7);
INSERT INTO cursa VALUES (2, 1);
INSERT INTO cursa VALUES (2, 2);
INSERT INTO cursa VALUES (3, 1);
INSERT INTO cursa VALUES (3, 2);
INSERT INTO cursa VALUES (4, 1);
INSERT INTO cursa VALUES (4, 2);
INSERT INTO cursa VALUES (4, 3);
INSERT INTO cursa VALUES (4, 5);
INSERT INTO cursa VALUES (4, 6);
INSERT INTO cursa VALUES (4, 7);
INSERT INTO cursa VALUES (5, 4);
INSERT INTO cursa VALUES (5, 5);
INSERT INTO cursa VALUES (6, 6);
INSERT INTO cursa VALUES (7, 1);
INSERT INTO cursa VALUES (7, 7);

INSERT INTO dependente VALUES ('Reinaldo Teixeira', '0987654321', 'conjuge');
INSERT INTO dependente VALUES ('Mariana Teixeira', '0987654321', 'filha');
INSERT INTO dependente VALUES ('Doroteia da Silva', '12345678921', 'conjuge');
INSERT INTO dependente VALUES ('Mariana de Carvalho', '09878967587', 'conjuge');
INSERT INTO dependente VALUES ('Maria Eduarda de Carvalho', '09878967587', 'filha');
INSERT INTO dependente VALUES ('Eduardo de Paula', '34562798534', 'conjuge');
INSERT INTO dependente VALUES ('Emiliando de Paula', '34562798534', 'filho');

INSERT INTO professor_disciplina VALUES (1, '0987654321');
INSERT INTO professor_disciplina VALUES (7, '0987654321');
INSERT INTO professor_disciplina VALUES (2, '12345678921');
INSERT INTO professor_disciplina VALUES (6, '12345678921');
INSERT INTO professor_disciplina VALUES (3, '09878967587');
INSERT INTO professor_disciplina VALUES (4, '929938848876');
INSERT INTO professor_disciplina VALUES (5, '929938848876');
