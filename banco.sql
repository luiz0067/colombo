		DROP TABLE IF EXISTS empresa;
		CREATE TABLE  empresa (
		  id int(11) NOT NULL AUTO_INCREMENT,
		  empresa varchar(50) NOT NULL,
		  PRIMARY KEY (id)
		);
			DROP TABLE IF EXISTS usuario;
			CREATE TABLE  usuario (
			  codigo int(11) NOT NULL AUTO_INCREMENT,
			  usuario varchar(50) NOT NULL,
			  senha varchar(50) NOT NULL,
			  empresa int(11) NOT NULL,
			  PRIMARY KEY (codigo),
			  KEY FK_usuario_empresa (empresa) USING BTREE,
			  CONSTRAINT FK_usuario_produtos FOREIGN KEY (empresa) REFERENCES empresa (id)
			);
			DROP TABLE IF EXISTS categoria;
			CREATE TABLE  categoria (
			  codigo int(11) NOT NULL AUTO_INCREMENT,
			  nome varchar(50) NOT NULL,
			  empresa int(11) NOT NULL,
			  PRIMARY KEY (codigo),
			  KEY FK_categoria_empresa (empresa) USING BTREE,
			  CONSTRAINT FK_categoria_produtos FOREIGN KEY (empresa) REFERENCES empresa (id)
			);
				DROP TABLE IF EXISTS projetos;
				CREATE TABLE  projetos (
				  codigo int(11) NOT NULL AUTO_INCREMENT,
				  nome varchar(50) NOT NULL,
				  categoria int(11) NOT NULL,
				  descricao blob NOT NULL,
				  empresa int(11) NOT NULL,
				  PRIMARY KEY (codigo),
				  UNIQUE KEY FK_projetos_categoria (categoria) USING BTREE,
				  KEY FK_produtos_empresa (empresa),
				  CONSTRAINT FK_produtos_empresa FOREIGN KEY (empresa) REFERENCES empresa (id),
				  CONSTRAINT FK_projetos_categoria FOREIGN KEY (categoria) REFERENCES categoria (codigo)
				);
					DROP TABLE IF EXISTS fotos;
					CREATE TABLE  fotos (
					  codigo int(11) NOT NULL AUTO_INCREMENT,
					  projetos int(11) NOT NULL,
					  nome varchar(50) NOT NULL,
					  imagem varchar(50) NOT NULL,
					  link varchar(50) NOT NULL,
					  empresa int(11) NOT NULL,
					  PRIMARY KEY (codigo),
					  KEY FK_fotos_empresa (empresa),
					  KEY FK_fotos_projetos (projetos),
					  CONSTRAINT FK_fotos_empresa FOREIGN KEY (empresa) REFERENCES empresa (id),
					  CONSTRAINT FK_fotos_projetos FOREIGN KEY (projetos) REFERENCES projetos (codigo)
					);
			DROP TABLE IF EXISTS depoimento;
			CREATE TABLE  depoimento (
			  codigo int(11) NOT NULL AUTO_INCREMENT,
			  titulo blob NOT NULL,
			  descricao varchar(50) NOT NULL,
			  imagem varchar(50) DEFAULT NULL,
			  empresa int(11) NOT NULL,
			  PRIMARY KEY (codigo),
			  KEY FK_depoimento_empresa (empresa),
			  CONSTRAINT FK_depoimento_empresa FOREIGN KEY (empresa) REFERENCES empresa (id)
			);
				DROP TABLE IF EXISTS fotos_depoimento;
				CREATE TABLE  fotos_depoimento (
				  codigo int(11) NOT NULL AUTO_INCREMENT,
				  depoimento int(11) NOT NULL,
				  nome varchar(50) NOT NULL,
				  imagem varchar(50) NOT NULL,
				  link varchar(50) DEFAULT NULL,
				  empresa int(11) NOT NULL,
				  PRIMARY KEY (codigo),
				  KEY FK_fotos_depoimento_empresa (empresa),
				  KEY FK_fotos_depoimento_depoimento (depoimento),
				  CONSTRAINT FK_fotos_depoimento_depoimento FOREIGN KEY (depoimento) REFERENCES depoimento (codigo),
				  CONSTRAINT FK_fotos_depoimento_empresa FOREIGN KEY (empresa) REFERENCES empresa (id)
				);
			DROP TABLE IF EXISTS novidades;
			CREATE TABLE  novidades (
			  codigo int(11) NOT NULL AUTO_INCREMENT,
			  nome blob NOT NULL,
			  descricao varchar(50) DEFAULT NULL,
			  imagem varchar(50) NOT NULL,
			  empresa int(11) NOT NULL,
			  link varchar(45) DEFAULT NULL,
			  PRIMARY KEY (codigo),
			  KEY FK_novidades_empresa (empresa),
			  CONSTRAINT FK_novidades_empresa FOREIGN KEY (empresa) REFERENCES empresa (id)
			);
				DROP TABLE IF EXISTS fotos_novidades;
				CREATE TABLE  fotos_novidades (
				  codigo int(11) NOT NULL AUTO_INCREMENT,
				  novidades int(11) NOT NULL,
				  nome varchar(50) NOT NULL,
				  imagem varchar(50) NOT NULL,
				  link varchar(50) NOT NULL,
				  empresa int(11) NOT NULL,
				  PRIMARY KEY (codigo),
				  KEY FK_fotos_novidades_empresa (empresa),
				  KEY FK_fotos_novidades_novidades (novidades),
				  CONSTRAINT FK_fotos_novidades_empresa FOREIGN KEY (empresa) REFERENCES empresa (id),
				  CONSTRAINT FK_fotos_novidades_novidades FOREIGN KEY (novidades) REFERENCES novidades (codigo)
				);
			DROP TABLE IF EXISTS fotos_slide_show;
			CREATE TABLE  fotos_slide_show (
			  codigo int(11) NOT NULL AUTO_INCREMENT,
			  imagem varchar(50) NOT NULL,
			  empresa int(10) unsigned NOT NULL,
			  PRIMARY KEY (codigo)
			);