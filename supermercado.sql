CREATE DATABASE supermercado;

USE supermercado;

CREATE TABLE tab_produto (
  id INT NOT NULL AUTO_INCREMENT,
  quantidade INT NOT NULL,
  validade DATE NOT NULL,
  fornecedores TEXT NULL,
  nome TEXT NULL,
  codigo_barra VARCHAR(20) NULL,
  preco_compra FLOAT NULL,
  preco_venda FLOAT NULL,
  PRIMARY KEY (id),
  UNIQUE INDEX cod_barra_UNIQUE (codigo_barra ASC)
) ENGINE = InnoDB;

CREATE TABLE tab_cliente (
  id INT NOT NULL AUTO_INCREMENT,
  nome TEXT NOT NULL,
  cpf VARCHAR(20) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE INDEX cpf_UNIQUE (cpf ASC)
) ENGINE = InnoDB;

CREATE TABLE tab_contato_cliente (
  id INT NOT NULL AUTO_INCREMENT,
  celular TEXT NULL,
  email TEXT NULL,
  id_cliente INT NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_tab_contato_cliente_tab_cliente_idx (id_cliente ASC),
  CONSTRAINT fk_tab_contato_cliente_tab_cliente
    FOREIGN KEY (id_cliente)
    REFERENCES tab_cliente (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

CREATE TABLE tab_endereco_cliente (
  id INT NOT NULL AUTO_INCREMENT,
  rua TEXT NOT NULL,
  bairro TEXT NOT NULL,
  cidade TEXT NOT NULL,
  id_cliente INT NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_tab_endereco_cliente_tab_cliente1_idx (id_cliente ASC),
  CONSTRAINT fk_tab_endereco_cliente_tab_cliente1
    FOREIGN KEY (id_cliente)
    REFERENCES tab_cliente (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

CREATE TABLE tab_vendas (
  id INT NOT NULL AUTO_INCREMENT,
  data_venda DATE NOT NULL,
  quantidade INT NOT NULL,
  nome TEXT NOT NULL,
  valor_unitario FLOAT NOT NULL,
  id_produto INT NOT NULL,
  id_cliente INT NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_tab_vendas_tab_produto1_idx (id_produto ASC),
  INDEX fk_tab_vendas_tab_cliente1_idx (id_cliente ASC),
  CONSTRAINT fk_tab_vendas_tab_produto1
    FOREIGN KEY (id_produto)
    REFERENCES tab_produto (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_tab_vendas_tab_cliente1
    FOREIGN KEY (id_cliente)
    REFERENCES tab_cliente (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

CREATE TABLE tab_colaborador (
  id INT NOT NULL AUTO_INCREMENT,
  nome TEXT NOT NULL,
  cpf VARCHAR(20) NOT NULL,
  cargo TEXT NOT NULL,
  idade INT NOT NULL,
  jornada_trabalho TEXT NOT NULL,
  nivel_acesso TEXT NOT NULL,
  PRIMARY KEY (id),
  UNIQUE INDEX cpf_UNIQUE (cpf ASC)
) ENGINE = InnoDB;

CREATE TABLE tab_contato_colaborador (
  id INT NOT NULL AUTO_INCREMENT,
  celular TEXT NULL,
  email TEXT NULL,
  id_colaborador INT NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_tab_contato_colaborador_tab_colaborador1_idx (id_colaborador ASC),
  CONSTRAINT fk_tab_contato_colaborador_tab_colaborador1
    FOREIGN KEY (id_colaborador)
    REFERENCES tab_colaborador (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

CREATE TABLE tab_endereco_colaborador (
  id INT NOT NULL AUTO_INCREMENT,
  rua TEXT NULL,
  cidade TEXT NULL,
  bairro TEXT NULL,
  id_colaborador INT NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_tab_endereco_colaborador_tab_colaborador1_idx (id_colaborador ASC),
  CONSTRAINT fk_tab_endereco_colaborador_tab_colaborador1
    FOREIGN KEY (id_colaborador)
    REFERENCES tab_colaborador (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;
