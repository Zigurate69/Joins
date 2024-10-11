CREATE DATABASE GER_JOIN;
use GER_JOIN;

CREATE TABLE funcionarios(
cod int PRIMARY KEY NOT NULL,
nome varchar(255) NOT NULL,
especialidade varchar(255) NOT NULL
);

CREATE TABLE dependentes(
cod int PRIMARY KEY NOT NULL,
nome varchar(255) NOT NULL,
cod_func int NOT NULL
);

INSERT INTO funcionarios(cod, nome, especialidade)
VALUES (1,"José","Engenheiro"),
	   (2,"João","Mestre de Obras"),
       (3,"Maria","Contabilista");
       
INSERT INTO dependentes(cod, nome, cod_func)
VALUES (1,"Pedro",1),
	   (2,"Alice",1),
       (3,"Luana",3);
       
SELECT funcionarios.nome nome_func, dependentes.nome nome_dep
FROM funcionarios
INNER JOIN dependentes
ON funcionarios.cod = dependentes.cod_func;

SELECT FUNC.nome nome_func, DEP.nome nome_dep
FROM funcionarios FUNC
LEFT JOIN dependentes DEP
ON FUNC.cod = DEP.cod_func;

SELECT FUNC.nome nome_func, DEP.nome nome_dep
FROM funcionarios FUNC
LEFT JOIN dependentes DEP
ON FUNC.cod = DEP.cod_func
WHERE DEP.nome IS NULL;

SELECT FUNC.nome nome_func, DEP.nome nome_dep
FROM funcionarios FUNC
RIGHT JOIN dependentes DEP
ON FUNC.cod = DEP.cod_func;

SELECT FUNC.nome nome_func, DEP.nome nome_dep
FROM funcionarios FUNC
RIGHT JOIN dependentes DEP
ON FUNC.cod = DEP.cod_func
WHERE FUNC.cod IS NULL;