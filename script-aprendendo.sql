# Comandos basicos de CRUD (Insert, Update, Delete e Select)

#INSERT
	## Insert de apenas um valor por vez
	INSERT INTO tblSexo 
			(sigla, nome)
	VALUES  ('F', 'Feminino');
    
    ## Insert de multiplos valores
    INSERT INTO tblSexo
			(sigla, nome)
	VALUES  ('M', 'Masculino'),
			('O', 'Outros');
    
SELECT * FROM tblSexo;

	INSERT INTO tblAtor
			(nome, 
            nomeArtistico, 
            dataNascimento, 
            dataFalecimento, 
            biografia, 
            idSexo)
	VALUES  ('Marlon Brando', 
			null, 
			'1924-04-03', 
			'2004-07-01', 
			'- Trabalhou como ascensorista de elevador em uma loja por 4 dias, antes de se tornar famoso.- Possui uma ilha particular no oceano Pacífico, na Polinésia, desde 1966.- O Oscar que ganhou por "Sindicato dos Ladrões" foi roubado de sua casa, com o ator tendo solicitado à Academia de Artes e Ciências Cinematográficas a reposição da estatueta, em 1970.- Recusou o Oscar recebido por "O Poderoso Chefão", em protesto pelo modo como os Estados Unidos e, especialmente, Hollywood vinham discriminando os índios nativos do país. Brando não compareceu à cerimônia de entrega do Oscar e enviou em seu lugar a atriz Sacheen Littlefeather, que subiu ao palco para receber a estatueta do ator como se fosse uma índia verdadeira, divulgando seu protesto.- Em determinado momento das filmagens de "A Cartada Final", se recusava a estar no mesmo set que o diretor Frank Oz.- Possui uma estrela na ...,',
			2
			);
            
	INSERT INTO tblAtor
			(nome, 
            nomeArtistico, 
            dataNascimento, 
            dataFalecimento, 
            biografia, 
            idSexo)
	VALUES ('Alfredo James Pacino',
			'Al Pacino',
            '1940-04-25',
            null,
            '- É um grande fã de ópera;- É um dos poucos astros de Hollywood que nunca casou;- Foi preso em janeiro de 1961, acusado de carregar consigo uma arma escondida;- Recusou o personagem Han Solo, da trilogia original de "Star Wars";- Foi o primeiro na história do Oscar a ser indicado no mesmo ano nas categorias de melhor ator e melhor ator coadjuvante.',
            2
            ),
            ('James Edmund Caan',
            'James Caan',
            '1940-03-26',
            null,
            '- Conquistou a faixa preta de caratê quando jovem;- Possui uma estrela na Calçada da Fama, localizada em 6648 Hollywood Boulevard;- Pai do tambem ator Scott Caan.',
            2
            );
            
DESC tblAtor;

SELECT * FROM tblAtor;

#UPDATE - PERIGOSO (Prestar muita atenção)
	UPDATE tblSexo SET 
		nome = 'Masculino'
  WHERE id = 2;
        
# Pesquisar sobre RollBack
# rollback

# DELETE - PERIGOSO (Prestar muita atenção)

DELETE FROM tblSexo;

# SELECT
	# select - Campos que serão exibidos na busca
    # from   - Colocamos as tabelas e seus relacionamentos
    # where  - Critério das buscas
    
    ## Retorna todos os campos e todos os registros de uma tabela 
    ## (*) significa tudo
    SELECT * FROM tblSexo;
    
	## Retorna todos os campos e todos os registros de uma tabela 
	SELECT tblSexo. * FROM tblSexo;
    
    ## Retorna apenas as colunas especificadas
    SELECT id, nome FROM tblSexo;
    SELECT tblSexo.id, tblSexo.nome FROM tblSexo;
    
    ## Retorna apenas registros com base no critério de busca 
    SELECT * FROM tblSexo
		WHERE id = 2;
        
	SELECT * FROM tblSexo
		WHERE nome = 'Masculino';
        
	SELECT * FROM tblSexo
		WHERE sigla = 'M';
    
# Ordenando resultados
	## Ordena de forma crescente
	SELECT * FROM tblSexo ORDER BY nome ASC;
    ## Ordena de forma decrescente
    SELECT * FROM tblSexo ORDER BY nome DESC;
    SELECT * FROM tblSexo ORDER BY sigla, nome DESC;
	SELECT * FROM tblSexo ORDER BY sigla ASC, nome DESC;
    
# Like - permite buscar por um campo string sendo qualquer parte da escrita
	SELECT * FROM tblAtor
		WHERE nome = 'Marlon Brando';
        
	# Like '  %' - utilizando o caracter coringa (%) no final da escrita, buscamos por tudo que INICIA pelos caracteres digitados  
    # serve como se fosse o operador de igualdade (=)
	SELECT * FROM tblAtor
		WHERE nome LIKE 'Marlon%';
        
	# Like '%   ' - utilizando o caracter coringa (%) no final da escrita, buscamos por tudo que TERMINA pelos caracteres digitados  
    # serve como se fosse o operador de igualdade (=)
	SELECT * FROM tblAtor
		WHERE nome LIKE '%O';
        
	# Like '%   %' - utilizando o caracter coringa (%) no inicio e no final da escrita, buscamos por tudo que CONTENHA  em qualquer parte
    # dos caracteres digitados, serve como se fosse o operador de igualdade (=)
	SELECT * FROM tblAtor
		WHERE biografia LIKE '%grande%';
        
# OPeradores Lógicos
	# AND - É utilizado para somar ou atender a ambos os critérios
    # OR  - É utilizado para quando precisamos encontrar algo em um atributo ou outro
    # NOT - Faz a negação (inversão) da saída  
    
    SELECT nome, nomeArtistico, biografia FROM tblAtor
		WHERE nome NOT LIKE '%Pacino%' AND biografia NOT LIKE '%Pacino%';