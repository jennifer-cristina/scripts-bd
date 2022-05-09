
## Comandos para manipular databases

# Permite criar um database no Banco de dados
CREATE DATABASE dbvideolocadora20221;

# Permite mostrar todos os databases existentes no banco de dados
SHOW DATABASES;

# Permite apagar um database existente
DROP DATABASE dbvideolocadora20221;

# Usar a database
USE dbvideolocadora20221;

## Comandos para manipular tables

### Tabela de sexo
CREATE TABLE tblSexo(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(25) NOT NULL,
    sigla VARCHAR(1) NOT NULL,
    UNIQUE INDEX(id)
);

# Permite visualizar as tabelas existentes em um database
SHOW TABLES;

### Tabela de genero
CREATE TABLE tblGenero(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    UNIQUE INDEX(id)
);

# Permite visualizar a estrutura de uma tabela(tipo de dados, pk, fk, etc)
DESC tblSexo;
DESCRIBE tblSexo;

### Tabela de Streaming
CREATE TABLE tblStreaming(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    UNIQUE INDEX(id)
);

### Tabela de Nacionalidade
CREATE TABLE tblNacionalidade(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
);

DESC tblNacionalidade;

# Comandos de alteração de uma table

# Permite alterar uma tabela adicionando novos elementos
ALTER TABLE tblNacionalidade
	ADD COLUMN nome VARCHAR(45) NOT NULL,
    ADD UNIQUE INDEX(id);

# Permite alterar uma tabela removendo um elemento
ALTER TABLE tblNacionalidade
	DROP COLUMN nome;
    
# Remover o unique index da tabela
ALTER TABLE tblNacionalidade
	DROP INDEX id;
    
ALTER TABLE tblNacionalidade
	ADD COLUMN nome varchar(45);
    
# Permite alterar uma tabela modificando a estrutura de uma coluna
ALTER TABLE tblNacionalidade
	MODIFY COLUMN nome VARCHAR(45) NOT NULL;
    
# Permite alterar uma tabela renomeando um atributo e alterando a sua estrutura se necessário
ALTER TABLE tblNacionalidade
	CHANGE nomeNacionalidade nome VARCHAR(45) NOT NULL;
    
### Tabela de Ator
CREATE TABLE tblAtor(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(80) NOT NULL,
    nomeArtistico VARCHAR(80),
    dataNascimento DATE NOT NULL,
    dataFalecimento DATE,
    biografia TEXT,
    idSexo INT NOT NULL,
    CONSTRAINT FK_Sexo_Ator # Cria um nome representativo para a relação
    FOREIGN KEY(idSexo) # Estabelece quem será a fk nesta tabela
    REFERENCES tblSexo(id), # Especifica de onde virá a fk (tabela de origem PK)
    UNIQUE INDEX(id)
);