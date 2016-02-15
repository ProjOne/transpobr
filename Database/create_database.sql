-- Database: transpobr

-- DROP DATABASE transpobr;

CREATE DATABASE transpobr
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'English_United Kingdom.1252'
       LC_CTYPE = 'English_United Kingdom.1252'
       CONNECTION LIMIT = -1;

COMMENT ON DATABASE transpobr
  IS 'Banco de Dados para aplica;áo de avaliação';



-- Table: public."Lancamento"

-- DROP TABLE public."Lancamento";

CREATE TABLE public."Lancamento"
(
  oid integer NOT NULL DEFAULT nextval('"Lancamento_oid_seq"'::regclass), -- Codigo do Lancamento
  dt_inicial date, -- Data de Inicio
  dt_final date, -- Data Final
  vl_total numeric(8,2), -- Valor Total do Lancamento
  observacao character varying(1000), -- Observacao do Lancamento
  CONSTRAINT "Lancamento_pkey" PRIMARY KEY (oid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public."Lancamento"
  OWNER TO postgres;
COMMENT ON TABLE public."Lancamento"
  IS 'Tabela de Lancamentos';
COMMENT ON COLUMN public."Lancamento".oid IS 'Codigo do Lancamento';
COMMENT ON COLUMN public."Lancamento".dt_inicial IS 'Data de Inicio';
COMMENT ON COLUMN public."Lancamento".dt_final IS 'Data Final';
COMMENT ON COLUMN public."Lancamento".vl_total IS 'Valor Total do Lancamento';
COMMENT ON COLUMN public."Lancamento".observacao IS 'Observacao do Lancamento';


-- Sequence: public."Lancamento_oid_seq"

-- DROP SEQUENCE public."Lancamento_oid_seq";

CREATE SEQUENCE public."Lancamento_oid_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE public."Lancamento_oid_seq"
  OWNER TO postgres;


-- Table: public."Item"

-- DROP TABLE public."Item";

CREATE TABLE public."Item"
(
  oid integer NOT NULL DEFAULT nextval('"Item_oid_seq"'::regclass), -- Codigo do Item
  descricao character varying(255), -- Descricao do Item
  valor numeric(8,2), -- Valor do Item
  CONSTRAINT "Item_pkey" PRIMARY KEY (oid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public."Item"
  OWNER TO postgres;
COMMENT ON TABLE public."Item"
  IS 'Tabela de Itens';
COMMENT ON COLUMN public."Item".oid IS 'Codigo do Item';
COMMENT ON COLUMN public."Item".descricao IS 'Descricao do Item';
COMMENT ON COLUMN public."Item".valor IS 'Valor do Item';


-- Sequence: public."Item_oid_seq"

-- DROP SEQUENCE public."Item_oid_seq";

CREATE SEQUENCE public."Item_oid_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE public."Item_oid_seq"
  OWNER TO postgres;


-- Table: public."LancamentoItem"

-- DROP TABLE public."LancamentoItem";

CREATE TABLE public."LancamentoItem"
(
  oid_lancamento integer,
  oid_item integer,
  CONSTRAINT rel1 FOREIGN KEY (oid_lancamento)
      REFERENCES public."Lancamento" (oid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT rel2 FOREIGN KEY (oid_item)
      REFERENCES public."Item" (oid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public."LancamentoItem"
  OWNER TO postgres;
COMMENT ON TABLE public."LancamentoItem"
  IS 'Tabela intermediaria de relacionamento';
