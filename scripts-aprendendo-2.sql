USE dbvideolocadora20221;

ALTER TABLE tblAtor
	ADD COLUMN qtdeOscar INT;
    
SELECT * FROM tblAtor;

UPDATE tblAtor SET qtdeOscar = 0 WHERE id = 4;

# Operadores de comparação
/*
	=			igualdade
    LIKE 		permite buscar por parte da informação
    <			Maior
    >			Menor
    <=			Menor ou igual
    >=			Maior ou igual
	<>, !=		Diferente
    IN			Busca uma qtde de valores, sem precisar do operador lógico (OBS: somente para substituir o operador OR)
*/

# Exemplo para buscar utilizar o maior ou igual
SELECT * FROM tblAtor WHERE qtdeOscar >= 1;

# Exemplo para buscar utilizar o menor ou igual
SELECT * FROM tblAtor WHERE qtdeOscar <= 3;

# Exemplo para buscar diferente
SELECT * FROM tblAtor WHERE qtdeOscar <> 3; 

# Exemplo para buscar atores com oscar maior ou igual a 5 ou menor ou igual a 2
SELECT * FROM tblAtor WHERE qtdeOscar >= 5 OR qtdeOscar <= 2;

# Exemplo para buscar atores com oscar maior a 2 e menor a 5
SELECT * FROM tblAtor WHERE qtdeOscar > 2 AND qtdeOscar < 5;

# Between - permite buscar através de um range de valores
SELECT * FROM tblAtor WHERE qtdeOscar BETWEEN 3 AND 4;

# Not Between - permite buscar as estremidades de um range de valores
SELECT * FROM tblAtor WHERE qtdeOscar NOT BETWEEN 3 AND 4;

# Exemplo (buscar atores que tenham 2, 5, 10, 13, 20)
SELECT * FROM tblAtor WHERE qtdeOscar = 2 OR
							qtdeOscar = 5 OR
                            qtdeOscar = 10 OR
                            qtdeOscar = 13 OR
                            qtdeOscar = 20;

# IN
SELECT * FROM tblAtor WHERE qtdeOscar IN(2, 5, 10, 13, 20);

# NOT IN
SELECT * FROM tblAtor WHERE qtdeOscar NOT IN(2, 5, 10, 13, 20);

# Cria-se uma tabela ficticia e temporária para poder mostrar a quatidade, você diz qual quera o nome dela ('qtdeAtores')
SELECT COUNT(*) AS qtdeAtores FROM tblAtor;

# COUNT() Permite contar nova quantidade de itens com base em um filme - não pode haver separamento dos parenteses nas funções
SELECT COUNT(*) AS qtdeAtores FROM tblAtor
				WHERE qtdeOscar NOT IN(2, 5, 10, 13, 20);

# MIN() / MAX() - retorna a qtdeOscar menor e a qtdeOscar maior de um atributo
SELECT MIN(qtdeOscar) AS qtdeOscar FROM tblAtor;


# MIN() / MAX() - retorna a qtdeOscar menor e a qtdeOscar maior de um atributo
SELECT MAX(qtdeOscar) AS qtdeOscar FROM tblAtor;

# Limit - permite especificar a qtde de itens que será exibido
SELECT * FROM tblAtor LIMIT 1;

# Realizando calculos matematicos
/*
	+, -, *, /
	SUM() Soma os valores da coluna
    AVG() retorna a media dos valores da coluna
*/
SELECT SUM(qtdeOscar) AS totalOscars FROM tblAtor;

SELECT AVG(qtdeOscar) AS mediaOscars FROM tblAtor;

SELECT SUM((qtdeOscar) / 100) AS totalOscars FROM tblAtor;

SELECT nome, dataNascimento, ((10*10)/100) + qtdeOscar AS total FROM tblAtor;

# Permite retonar/contar a quantidade de caracteres
SELECT LENGTH(nome) AS qtdeCaracter FROM tblAtor;

# Permite concatenar qualquer dado de uma coluna com algo que voce deseja inserir
SELECT CONCAT(biografia, '...< a href="leia.php?id="> Leia mais </a>') AS biografiaAtor FROM tblAtor;

# Permite concatenar qualquer dado de uma ou mais colunas com algo que voce deseja inserir
SELECT CONCAT_WS(' a biografia é: ', nome, biografia) AS biografiaAtor FROM tblAtor;

# Permite cortar uma sequencia de dados com base em posições (substr)
SELECT CONCAT(SUBSTR(biografia, 1, 30), '... Leia mais') AS biografiaAtor FROM tblAtor;
