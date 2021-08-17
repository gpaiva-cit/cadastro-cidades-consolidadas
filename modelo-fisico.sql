USE `Cidades_Consolidadas`;

CREATE TABLE CIDADE (
	cidade_uf VARCHAR(55),
	cidade VARCHAR(50),
	uf VARCHAR(5),
	micro_regiao VARCHAR(55),
	cidade_ddd_principal VARCHAR(50),
	area_territorial DECIMAL(9,2),
	PRIMARY KEY(cidade_uf)
);


CREATE TABLE POPULACAO (
	fk_cidade VARCHAR(55),
	cod_cidade_ibge VARCHAR(10),
	populacao_estimada BIGINT,
	pib_per_capita DECIMAL(15,2),
	densidade_demografica DECIMAL(9,2),
	teledensidade DECIMAL(9,2),
	idhm DECIMAL(5,4),
	escolarizacao DECIMAL(5,2),
	mortalidade_infantil DECIMAL(6,2),
	ranking_populacao DECIMAL(8,2),
	ranking_atratividade_market DECIMAL(8,2),
	ranking_digitalizacao_teledensidade DECIMAL(8,2),
	ranking_oportunidade_logistica_prazo DECIMAL(8,2),
	ranking_pib_per_capita DECIMAL(8,2),
	PRIMARY KEY(fk_cidade)
);

ALTER TABLE `POPULACAO` ADD CONSTRAINT `fk_cidade_populacao`
	FOREIGN KEY (`fk_cidade`) REFERENCES `CIDADE` (`cidade_uf`);

	
CREATE TABLE ECONOMIA (
	fk_cidade VARCHAR(55),
	numero_shoppings SMALLINT,
	numero_shoppings_com_centauro SMALLINT,
	presenca_centauro_shoppings_cidade DECIMAL(20,19),
	presenca_magalu INTEGER,
	presenca_americanas INTEGER,
	taxa_delivery_online INTEGER,
	PRIMARY KEY(fk_cidade)
);

ALTER TABLE `ECONOMIA` ADD CONSTRAINT `fk_cidade_economia`
	FOREIGN KEY (`fk_cidade`) REFERENCES `CIDADE` (`cidade_uf`);

	
CREATE TABLE CENTAURO (
	fk_cidade VARCHAR(55),
	ranking_centauro_receita_online_per_capita DECIMAL(8,2),
	centauro_market_share DECIMAL(20,19),
	centauro_atratividade_market DECIMAL(20,19),
	consumo_total_tenis_artigos_esportivos DECIMAL(15,2),
	centauro_receita_online_per_capita DECIMAL(22,17),
	centauro_receita_total_online_lj_fisicas DECIMAL(18,2),
	centauro_receita_lj_fisicas DECIMAL(18,2),
	centauro_receita_online_2019 DECIMAL(18,2),
	centauro_receita_online_2020 DECIMAL(18,2),
	percentual_crescimento_digital DECIMAL(15,12),
	centauro_pedido_online INTEGER,
	centauro_pedidos_lj_fisicas INTEGER,
	centauro_ticket_medio DECIMAL(22,17),
	max_prazo_realizado INTEGER,
	min_prazo_realizado INTEGER,
	q2_prazo_realizado DECIMAL(8,3),
	q3_prazo_realizado DECIMAL(8,3),
	avg_prazo_realizado DECIMAL(13,8),
	max_frete_pago DECIMAL(7,2),
	min_frete_pago DECIMAL(7,2),
	q2_frete_pago DECIMAL(13,8),
	q3_frete_pago DECIMAL(13,8),
	avg_frete_pago DECIMAL(13,8),
	PRIMARY KEY(fk_cidade)
);

ALTER TABLE `CENTAURO` ADD CONSTRAINT `fk_cidade_centauro`
	FOREIGN KEY (`fk_cidade`) REFERENCES `CIDADE` (`cidade_uf`);
