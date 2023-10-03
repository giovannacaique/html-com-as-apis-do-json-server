-- Aqui estamos prestes a criar um novo schema/usuário chamado "escala_digital".
-- CREATE DATABASE escala_digital;

-- Entramos no schema/usuário "escala_digital".
-- USE escala_digital;

-- É como se estivéssemos abrindo um cofre mágico. Alteramos a senha do guardião "root" para que seja mais amigável com o Node.js.
-- ALTER USER 'root'@'localhost' IDENTIFIED WITH 'mysql_native_password' BY '';

-- Agora estamos criando uma tabela chamada "empresa" dentro do nosso schema/usuário.
CREATE TABLE empresa (
-- Aqui, criamos um identificador único para cada empresa, que se auto-incrementa(cria automaticamente).
id_empresa INT AUTO_INCREMENT PRIMARY KEY,
-- A tabela tem um nome, e não pode estar vazia.
nome_empresa VARCHAR(40) NOT NULL,
-- Ela tem um número de registro, que é único e não pode estar vazio.
cnpj_cpf BIGINT UNSIGNED UNIQUE NOT NULL,
-- Às vezes, a empresa tem uma razão social(nome juríduco).
razao_social VARCHAR(50),
-- E também precisa saber quantos funcionários existem nela.
quantidade_funcionarios INT NOT NULL,
-- Ela tem uma caixa de correio eletrônico, que não pode estar vazia.
email VARCHAR(50) NOT NULL,
-- E uma senha para proteger seus segredos.
senha VARCHAR(12) NOT NULL
);

-- Agora estamos construindo uma tabela, chamada "funcionario".
CREATE TABLE funcionario (
-- Cada funcionário tem um número de identificação que é criado automaticamente.
cod_func INT AUTO_INCREMENT PRIMARY KEY,
-- Eles têm nomes, que são obrigatórios.
nome VARCHAR(50) NOT NULL,
-- Também têm um status que é representado de forma simples, como 0 ou 1.
-- Para saber se o funcionário estar ou não contratado.
func_status TINYINT NOT NULL,
-- Eles trabalham em um turno.
turno VARCHAR(5) NOT NULL,
-- Eles carimbam a data e a hora quando são registrados na tabela.
datatime_registro DATETIME NOT NULL,
-- Cada um tem um número de identificação, que é único e importante.
cpf BIGINT UNSIGNED UNIQUE NOT NULL,
-- Eles têm RG também.
rg INT NOT NULL,
-- Eles precisam mostrar sua carteira de trabalho quando necessário.
cart_trabalho INT NOT NULL,
-- A data de admissão(quando foram contratados) deles é importante.
data_admissao DATE NOT NULL,
-- Eles têm uma carga horária para cumprir.
car_horaria INT NOT NULL,
-- Às vezes, eles têm um gênero, que pode ser longo ou curto.
sexo VARCHAR(30),
-- Cada funcionário pertence a uma empresa, representada por um número.
id_empresa INT,
-- Estamos conectando à tabela funcionario à tabela empresa onde eles trabalham.
FOREIGN KEY (id_empresa) REFERENCES empresa (id_empresa),
-- Eles podem ter uma descrição, que é breve e descritiva.
descricao VARCHAR(30)
);
select * from empresa;
select * from funcionario;
USE escala_digital;

--                                        NÃO CRIAMOS!!!!!!
-- Criamos um mural de status para nossos habitantes.
CREATE TABLE func_status (
    -- Cada status tem um código que aumenta automaticamente.
    codigo INT AUTO_INCREMENT PRIMARY KEY,
    -- E eles têm descrições para explicar o que significam.
    descricao VARCHAR(30)
);