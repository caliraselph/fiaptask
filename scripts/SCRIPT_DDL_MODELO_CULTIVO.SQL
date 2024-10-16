-- Generado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   en:        2024-10-14 23:15:40 BRT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



DROP TABLE tb_agro_clima CASCADE CONSTRAINTS;

DROP TABLE tb_agro_cultivo CASCADE CONSTRAINTS;

DROP TABLE tb_agro_fertilizante CASCADE CONSTRAINTS;

DROP TABLE tb_agro_parcela CASCADE CONSTRAINTS;

DROP TABLE tb_agro_plaga CASCADE CONSTRAINTS;

DROP TABLE tb_agro_r_clima_cultivo CASCADE CONSTRAINTS;

DROP TABLE tb_agro_riego CASCADE CONSTRAINTS;

DROP TABLE tb_agro_suelo CASCADE CONSTRAINTS;

DROP TABLE tb_agro_tp_cultivo CASCADE CONSTRAINTS;

DROP TABLE tb_agro_tp_plaga CASCADE CONSTRAINTS;

DROP TABLE tb_agro_tp_suelo CASCADE CONSTRAINTS;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE tb_agro_clima (
    clima_id    NUMBER(10) NOT NULL,
    data        DATE NOT NULL,
    hora        DATE NOT NULL,
    temp_max    NUMBER(10, 2) NOT NULL,
    temp_min    NUMBER(10, 2) NOT NULL,
    precipita   NUMBER(10, 2) NOT NULL,
    umidade     NUMBER(10, 2) NOT NULL,
    rad_solar   NUMBER(10, 2) NOT NULL,
    veloc_vento NUMBER(10, 2) NOT NULL
);

ALTER TABLE tb_agro_clima ADD CONSTRAINT pk_tb_agro_clima PRIMARY KEY ( clima_id );

CREATE TABLE tb_agro_cultivo (
    cultivo_id     NUMBER(10) NOT NULL,
    tp_cultivo_id  NUMBER(10) NOT NULL,
    parcela_id     NUMBER(10) NOT NULL,
    data_semeadura DATE NOT NULL,
    data_colheita  DATE,
    rendimento     NUMBER(15, 2) NOT NULL
);

ALTER TABLE tb_agro_cultivo ADD CONSTRAINT pk_tb_agro_cultivo PRIMARY KEY ( cultivo_id );

CREATE TABLE tb_agro_fertilizante (
    fertilizante_id NUMBER(10) NOT NULL,
    descricao       CHAR(120) NOT NULL,
    compo_quimica   CHAR(500) NOT NULL,
    forma_fisica    CHAR(500) NOT NULL,
    data_fabrica    DATE NOT NULL,
    data_validade   DATE NOT NULL,
    sit             NUMBER(1) NOT NULL
);

ALTER TABLE tb_agro_fertilizante ADD CONSTRAINT pk_tb_agro_fertilizante PRIMARY KEY ( fertilizante_id );

CREATE TABLE tb_agro_parcela (
    parcela_id NUMBER(10) NOT NULL,
    ubicacao   CHAR(120) NOT NULL,
    cep        NUMBER(8) NOT NULL,
    latitude   NUMBER(10, 4) NOT NULL,
    longitude  NUMBER(10, 4) NOT NULL,
    sit        NUMBER(1) NOT NULL
);

ALTER TABLE tb_agro_parcela ADD CONSTRAINT pk_tb_agro_parcela PRIMARY KEY ( parcela_id );

CREATE TABLE tb_agro_plaga (
    plaga_id     NUMBER(10) NOT NULL,
    tp_plaga_id  NUMBER(10) NOT NULL,
    descricao    CHAR(120) NOT NULL,
    nome_cientif CHAR(120) NOT NULL,
    sit          NUMBER(1) NOT NULL
);

ALTER TABLE tb_agro_plaga ADD CONSTRAINT pk_tb_agro_plaga PRIMARY KEY ( plaga_id );

CREATE TABLE tb_agro_r_clima_cultivo (
    clima_id   NUMBER(10) NOT NULL,
    cultivo_id NUMBER(10) NOT NULL
);

ALTER TABLE tb_agro_r_clima_cultivo ADD CONSTRAINT pk_afecta PRIMARY KEY ( clima_id,
                                                                           cultivo_id );

CREATE TABLE tb_agro_riego (
    riego_id      NUMBER(10) NOT NULL,
    cultivo_id    NUMBER(10) NOT NULL,
    data_irriga   DATE NOT NULL,
    hora_ini      DATE NOT NULL,
    hora_fin      DATE NOT NULL,
    quanti_agua   NUMBER(10, 2) NOT NULL,
    metodo_irriga NUMBER(1) NOT NULL
);

ALTER TABLE tb_agro_riego ADD CONSTRAINT pk_tb_agro_riego PRIMARY KEY ( riego_id );

CREATE TABLE tb_agro_suelo (
    suelo_id    NUMBER(10) NOT NULL,
    tp_suelo_id NUMBER(10) NOT NULL,
    cant_ph     NUMBER(15, 2) NOT NULL,
    cant_nutri  NUMBER(15, 2) NOT NULL
);

ALTER TABLE tb_agro_suelo ADD CONSTRAINT pk_tb_agro_suelo PRIMARY KEY ( suelo_id );

CREATE TABLE tb_agro_tp_cultivo (
    tp_cultivo_id NUMBER(10) NOT NULL,
    descricao     CHAR(120) NOT NULL,
    sit           NUMBER(1)
);

ALTER TABLE tb_agro_tp_cultivo ADD CONSTRAINT pk_tb_agro_tp_cultivo PRIMARY KEY ( tp_cultivo_id );

CREATE TABLE tb_agro_tp_plaga (
    tp_plaga_id NUMBER(10) NOT NULL,
    descricao   CHAR(120) NOT NULL,
    sit         NUMBER(1) NOT NULL
);

ALTER TABLE tb_agro_tp_plaga ADD CONSTRAINT pk_tb_agro_tp_plaga PRIMARY KEY ( tp_plaga_id );

CREATE TABLE tb_agro_tp_suelo (
    tp_suelo_id NUMBER(10) NOT NULL,
    descricao   CHAR(120) NOT NULL,
    sit         NUMBER(1) NOT NULL
);

ALTER TABLE tb_agro_tp_suelo ADD CONSTRAINT pk_tb_agro_tp_suelo PRIMARY KEY ( tp_suelo_id );

ALTER TABLE tb_agro_r_clima_cultivo
    ADD CONSTRAINT fk_afecta_tb_agro_clima FOREIGN KEY ( clima_id )
        REFERENCES tb_agro_clima ( clima_id );

ALTER TABLE tb_agro_r_clima_cultivo
    ADD CONSTRAINT fk_afecta_tb_agro_cultivo FOREIGN KEY ( cultivo_id )
        REFERENCES tb_agro_cultivo ( cultivo_id );

ALTER TABLE tb_agro_cultivo
    ADD CONSTRAINT fk_tb_agro_cultivo_parcela FOREIGN KEY ( parcela_id )
        REFERENCES tb_agro_parcela ( parcela_id );

ALTER TABLE tb_agro_cultivo
    ADD CONSTRAINT fk_tb_agro_cultivo_tp_cultivo FOREIGN KEY ( tp_cultivo_id )
        REFERENCES tb_agro_tp_cultivo ( tp_cultivo_id );

ALTER TABLE tb_agro_plaga
    ADD CONSTRAINT fk_tb_agro_plaga_tp_plaga FOREIGN KEY ( tp_plaga_id )
        REFERENCES tb_agro_tp_plaga ( tp_plaga_id );

ALTER TABLE tb_agro_riego
    ADD CONSTRAINT fk_tb_agro_riego_cultivo FOREIGN KEY ( cultivo_id )
        REFERENCES tb_agro_cultivo ( cultivo_id );

ALTER TABLE tb_agro_suelo
    ADD CONSTRAINT fk_tb_agro_suelo_tp_suelo FOREIGN KEY ( tp_suelo_id )
        REFERENCES tb_agro_tp_suelo ( tp_suelo_id );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            11
-- CREATE INDEX                             0
-- ALTER TABLE                             18
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
