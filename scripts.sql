
## Comandos para manipular databases

# Permite criar um database no Banco de dados
CREATE DATABASE dbvideolocadora20221;

# Permite mostrar todos os databases existentes no banco de dados
SHOW DATABASES;

# Permite apagar um database existente
DROP DATABASE dbvideolocadora20221;

# Usar a database
USE dbvideolocadora20221;

########################### Tabela Sexo #############################

CREATE TABLE tblSexo(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(25) NOT NULL,
    sigla VARCHAR(1) NOT NULL,
    UNIQUE INDEX(id)
);

SELECT * FROM tblSexo;

########################### Tabela Genero ############################# 

CREATE TABLE tblGenero(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    UNIQUE INDEX(id)
);

# Permite visualizar a estrutura de uma tabela(tipo de dados, pk, fk, etc)
DESC tblSexo;
DESCRIBE tblSexo;

SELECT * FROM tblGenero;

########################### Tabela Streaming #############################

CREATE TABLE tblStreaming(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    UNIQUE INDEX(id)
);

SELECT * FROM tblStreaming;

########################### Tabela Nacionalidade #############################

CREATE TABLE tblNacionalidade(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
);

INSERT INTO tblNacionalidade(nome)
			 VALUES ('Americano');

SELECT * FROM tblNacionalidade;

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
    
########################### Tabela AtorNacionalidade #############################

# O id da chave estrangeira deve possuir as mesmas opções da chave primaria 
CREATE TABLE tblAtor(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(80) NOT NULL,
    nomeArtistico VARCHAR(80),
    dataNascimento DATE NOT NULL,
    dataFalecimento DATE,
    biografia TEXT,
    idSexo INT UNSIGNED NOT NULL,
    CONSTRAINT FK_Sexo_Ator # Cria um nome representativo para a relação
    FOREIGN KEY(idSexo) # Estabelece quem será a fk nesta tabela
    REFERENCES tblSexo(id), # Especifica de onde virá a fk (tabela de origem PK)
    UNIQUE INDEX(id)
);

SELECT * FROM tblAtor;
             

########################### Tabela AtorNacionalidade #############################

CREATE TABLE tblAtorNacionalidade(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    idAtor INT UNSIGNED NOT NULL,
    idNacionalidade INT UNSIGNED NOT NULL,
    # Relacionamento com a tabela de ator
    CONSTRAINT FK_ATOR_AtorNacionalidae
    FOREIGN KEY (idAtor)
    REFERENCES tblAtor (id),
    UNIQUE INDEX (id)
);

INSERT INTO tblAtorNacionalidade(idAtor, idNacionalidade)
			 VALUES (2,1),
					(3,1),
                    (4,1);

SELECT * FROM tblAtorNacionalidade;

SHOW TABLES;

## Caso queira apagar uma coluna de certa tabela e ela tiver uma chave estrangeira, precisa-se apagar primeiro a constraint (chave estrangeira)
## dando um drop Constraint, depois disso pode-se apagar a coluna!

ALTER TABLE tblAtorNacionalidade
	ADD COLUMN idNacionalidade INT UNSIGNED NOT NULL,
	ADD CONSTRAINT FK_Nacionalidade_AtorNacionalidade
    FOREIGN KEY (idNacionalidade)
    REFERENCES tblNacionalidade (id);
    
ALTER TABLE tblAtorNacionalidade
	DROP FOREIGN KEY FK_Nacionalidade_AtorNacionalidade;
    
ALTER TABLE tblAtorNacionalidade
	DROP COLUMN idNacionalidade;

## OBS: Para conseguir apagar uma coluna que é foreign key, é necessário primeiro apagar a constrain conforme fizemos acima

########################### Tabela Filme #############################

CREATE TABLE tblFilme(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(80) NOT NULL,
    duracao TIME NOT NULL,
    dataLancamento DATE NOT NULL,
    dataRelancamento DATE,
    sinopse TEXT,
    nomeOriginal VARCHAR(80)
);

SELECT * FROM tblFilme;

INSERT INTO tblFilme(nome, duracao, dataLancamento, dataRelancamento, sinopse, nomeOriginal)
			 VALUES ('O Poderoso Chefão',
					 '02:55:00',
					 '1972-03-24',
					 '2022-02-24',
					 'Don Vito Corleone (Marlon Brando) é o chefe de uma "família" de Nova York que está feliz, pois Connie (Talia Shire), sua filha, se casou com Carlo (Gianni Russo)...',
                     'The Godfather'
             );
             

########################### Tabela Diretor #############################

CREATE TABLE tblDiretor(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(80) NOT NULL,
    nomeArtistico VARCHAR(80),
    dataNascimento DATE NOT NULL,
    dataFalecimento DATE,
    biografia TEXT,
    idSexo INT UNSIGNED NOT NULL,
    CONSTRAINT FK_Sexo_Diretor # Cria um nome representativo para a relação
    FOREIGN KEY(idSexo) # Estabelece quem será a fk nesta tabela
    REFERENCES tblSexo(id), # Especifica de onde virá a fk (tabela de origem PK)
    UNIQUE INDEX(id)
    );

########################### Tabela FilmeStreaming #############################

CREATE TABLE tblFilmeStreaming(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    idFilme INT UNSIGNED NOT NULL,
    idStreaming INT UNSIGNED NOT NULL,
    ## Chave estrangeira filme
    CONSTRAINT FK_Filme_FilmeStreaming
    FOREIGN KEY(idFilme)
    REFERENCES tblFilme(id),
    ## Chave estrangeira Streaming
    CONSTRAINT FK_Streaming_FilmeStreaming
    FOREIGN KEY(idStreaming)
    REFERENCES tblStreaming(id),
    UNIQUE INDEX(id)
);

########################### Tabela FilmeAtor #############################

CREATE TABLE tblFilmeAtor(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    idFilme INT UNSIGNED NOT NULL,
    idAtor INT UNSIGNED NOT NULL,
    ## Chave estrangeira filme
	CONSTRAINT FK_Filme_FilmeAtor
    FOREIGN KEY(idFilme)
    REFERENCES tblFilme(id),
    ## Chave estrangeira Ator
    CONSTRAINT FK_Ator_FilmeAtor
    FOREIGN KEY(idAtor)
    REFERENCES tblAtor(id),
    UNIQUE INDEX(id)
);

SELECT * FROM tblFilmeAtor;

INSERT INTO tblFilmeAtor(idFilme, idAtor)
			 VALUES (1, 2),
					(1, 3),
                    (1, 4);

########################### Tabela FilmeAtor #############################

CREATE TABLE tblFilmeDiretor(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    idFilme INT UNSIGNED NOT NULL,
    idDiretor INT UNSIGNED NOT NULL,
    ## Chave estrangeira filme
	CONSTRAINT FK_Filme_FilmeDiretor
    FOREIGN KEY(idFilme)
    REFERENCES tblFilme(id),
    ## Chave estrangeira Diretor
    CONSTRAINT FK_Diretor_FilmeDiretor
    FOREIGN KEY(idDiretor)
    REFERENCES tblDiretor(id),
    UNIQUE INDEX(id)
);

########################### Tabela FilmeAtor #############################

CREATE TABLE tblFilmeGenero(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    idFilme INT UNSIGNED NOT NULL,
    idGenero INT UNSIGNED NOT NULL,
	## Chave estrangeira filme
	CONSTRAINT FK_Filme_FilmeGenero
    FOREIGN KEY(idFilme)
    REFERENCES tblFilme(id),
    ## Chave estrangeira Genero
	CONSTRAINT FK_Genero_FilmeGenero
    FOREIGN KEY(idGenero)
    REFERENCES tblGenero(id),
    UNIQUE INDEX(id)
);

########################### Tabela FilmeAtor #############################

CREATE TABLE tblDiretorNacionalidade(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    idDiretor INT UNSIGNED NOT NULL,
    idNacionalidade INT UNSIGNED NOT NULL,
	## Chave estrangeira Diretor
    CONSTRAINT FK_Diretor_FilmeNacionalidade
    FOREIGN KEY(idDiretor)
    REFERENCES tblDiretor(id),
    ## Chave estrangeira Nacionalidade
	CONSTRAINT FK_Nacionalidade_FilmeDiretor
    FOREIGN KEY(idNacionalidade)
    REFERENCES tblNacionalidade(id),
    UNIQUE INDEX(id)
);

SHOW TABLES;