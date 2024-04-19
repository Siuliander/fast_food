create database if not exists db_fast_food;

use db_fast_food;

create table if not exists tb_sexo
(
	id_sexo int auto_increment not null primary key,
	sexo enum('masculino','femenino') not null unique,
	estado_sexo tinyint(1) not null default 1
);

create table if not exists tb_pessoa
(
	id_pessoa int auto_increment not null primary key,
	nome_pessoa varchar(255) not null,
	identidade_pessoa varchar(14) not null unique,
	nascimento_pessoa date null,
	email_pessoa varchar(255) not null unique
);

insert into tb_pessoa values 
	(1,'admin','admin',null,'admin@admin.admin');

create table if not exists tb_nivel
(
	id_nivel int auto_increment not null primary key,
	nivel enum('admin','vendedor') not null unique,
	estado_nivel tinyint(1) not null default 1
);

insert into tb_nivel(nivel) values('admin'),('vendedor');

create table if not exists tb_senha
(
	id_senha int auto_increment not null primary key,
	senha varchar(64) not null unique,
	data_senha datetime not null default now()
);


create table if not exists tb_vendedor
(
	id_vendedor int auto_increment not null primary key,
	
	id_pessoa int not null unique,
	foreign key(id_pessoa) references tb_pessoa(id_pessoa),
	
	id_nivel int not null,
	foreign key(id_nivel) references tb_nivel(id_nivel),
	
	id_senha int not null,
	foreign key(id_senha) references tb_senha(id_senha),
	
	data_vendedor datetime not null default now(),
	update_vendedor datetime not null default now(),
	estado_vendedor tinyint(1) not null default 1,
	bloqueado_vendedor tinyint(1) not null default 0
);

/*
insert into tb_vendedor values
	(1,1,1,1,default,default,default,default);
*/

create table if not exists tb_cliente 
(
	id_cliente int auto_increment not null primary key,
	
	id_pessoa int not null unique,
	foreign key(id_pessoa) references tb_pessoa(id_pessoa),
	
	id_senha int not null,
	foreign key(id_senha) references tb_senha(id_senha),
	
	bloqueado_cliente tinyint(1) not null default 0
);

create table if not exists tb_categoria 
(
	id_categoria int auto_increment not null primary key,
	categoria varchar(255) not null unique,
	data_categoria datetime not null default now(),
	bloqueado_categoria tinyint(1) not null default 0,
	estado_categoria tinyint(1) not null default 1
);

/*
insert into tb_categoria values
	(0,'refeição',default,default,default),
	(0,'bebida',default,default,default),
	(0,'kits',default,default,default);
*/

create table if not exists tb_produto 
(
	id_produto int auto_increment not null primary key,
	
	id_categoria int not null,
	foreign key(id_categoria) references tb_categoria(id_categoria),
	
	produto varchar(255) not null,
	descricao_produto text null,
	imagem_produto text null,
	data_produto datetime not null default now(),
	estado_categoria tinyint(1) not null default 1
);

create table if not exists tb_preco 
(
	id_preco int auto_increment not null primary key,
	preco decimal(8,2) not null unique
);

create table if not exists tb_preco_produto 
(
	id_preco_produto int auto_increment not null primary key,
	
	id_produto int not null,
	foreign key(id_produto) references tb_produto(id_produto),
	
	id_preco int not null,
	foreign key(id_preco) references tb_preco(id_preco),
	
	estado_preco_produto tinyint(1) not null default 1
);

create table if not exists tb_pedido 
(
	id_pedido int auto_increment not null primary key,
	
	id_vendedor int not null,
	foreign key(id_vendedor) references tb_vendedor(id_vendedor),
	
	id_cliente int null,
	foreign key(id_cliente) references tb_cliente(id_cliente),
	
	comprador_pedido varchar(255) null,
	
	data_pedido datetime not null default now(),
	update_pedido datetime not null default now(),
	pago_pedido tinyint(1) not null default 0,
	pendente_pedido tinyint(1) not null default 0,
	estado_pedido tinyint(1) not null default 1
);

create table if not exists tb_item_pedido
(
	id_item_pedido int auto_increment not null primary key,
	
	id_pedido int not null,
	foreign key(id_pedido) references tb_pedido(id_pedido),
	
	id_preco_produto int not null,
	foreign key(id_preco_produto) references tb_preco_produto(id_preco_produto),
	
	descricao_item_pedido text null,
	estado_item_pedido tinyint(1) not null default 1
);

/*
create table if not exists tb_publicidade 
(
	id_publicidade int auto_increment not null primary key,
	
	imagem_publicidade text null,
	promocao_publicidade tinyint(1) not null default 0,
	estado_publicidade tinyint(1) not null default 1,
);
*/