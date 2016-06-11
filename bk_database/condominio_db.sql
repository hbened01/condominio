--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.4
-- Dumped by pg_dump version 9.4.0
-- Started on 2016-05-25 12:22:04

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 202 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2208 (class 0 OID 0)
-- Dependencies: 202
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 198 (class 1259 OID 133712)
-- Name: cd_aguas; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cd_aguas (
    cd_aguas_pk smallint NOT NULL,
    cod_apto character varying(3) NOT NULL,
    cod_conjunto smallint NOT NULL,
    cod_edificio smallint NOT NULL,
    lect_ant numeric NOT NULL,
    lect_post numeric NOT NULL
);


--
-- TOC entry 197 (class 1259 OID 133710)
-- Name: cd_aguas_cd_aguas_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cd_aguas_cd_aguas_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2209 (class 0 OID 0)
-- Dependencies: 197
-- Name: cd_aguas_cd_aguas_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cd_aguas_cd_aguas_pk_seq OWNED BY cd_aguas.cd_aguas_pk;


--
-- TOC entry 184 (class 1259 OID 133652)
-- Name: cd_aptos; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cd_aptos (
    cd_aptos_pk character varying(3) NOT NULL,
    cod_propietario smallint NOT NULL
);


--
-- TOC entry 196 (class 1259 OID 133704)
-- Name: cd_chequeras; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cd_chequeras (
    cd_chequeras_pk smallint NOT NULL,
    cod_conjunto smallint NOT NULL,
    cod_edificio smallint NOT NULL,
    nro_cuenta character varying(20) NOT NULL,
    monto numeric(10,4) NOT NULL,
    saldo numeric(10,4) NOT NULL
);


--
-- TOC entry 195 (class 1259 OID 133702)
-- Name: cd_chequeras_cd_chequeras_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cd_chequeras_cd_chequeras_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2210 (class 0 OID 0)
-- Dependencies: 195
-- Name: cd_chequeras_cd_chequeras_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cd_chequeras_cd_chequeras_pk_seq OWNED BY cd_chequeras.cd_chequeras_pk;


--
-- TOC entry 192 (class 1259 OID 133683)
-- Name: cd_conceptos; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cd_conceptos (
    cd_conceptos_pk smallint NOT NULL,
    descrip_concepto character varying(50) NOT NULL,
    tipo character varying(1) NOT NULL,
    frecuencia integer NOT NULL
);


--
-- TOC entry 191 (class 1259 OID 133681)
-- Name: cd_conceptos_cd_conceptos_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cd_conceptos_cd_conceptos_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2211 (class 0 OID 0)
-- Dependencies: 191
-- Name: cd_conceptos_cd_conceptos_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cd_conceptos_cd_conceptos_pk_seq OWNED BY cd_conceptos.cd_conceptos_pk;


--
-- TOC entry 179 (class 1259 OID 133619)
-- Name: cd_conjuntos; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cd_conjuntos (
    cd_conjuntos_pk smallint NOT NULL,
    nombre character varying(30) NOT NULL,
    direccion character varying(150) NOT NULL
);


--
-- TOC entry 178 (class 1259 OID 133617)
-- Name: cd_conjuntos_cd_conjuntos_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cd_conjuntos_cd_conjuntos_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2212 (class 0 OID 0)
-- Dependencies: 178
-- Name: cd_conjuntos_cd_conjuntos_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cd_conjuntos_cd_conjuntos_pk_seq OWNED BY cd_conjuntos.cd_conjuntos_pk;


--
-- TOC entry 186 (class 1259 OID 133659)
-- Name: cd_deudas; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cd_deudas (
    cd_deudas_pk smallint NOT NULL,
    cod_apto character varying(3) NOT NULL,
    cod_conjunto smallint NOT NULL,
    cod_edificio smallint NOT NULL,
    fecha_deuda date NOT NULL,
    fecha_cancelado date NOT NULL,
    monto numeric(10,4) NOT NULL,
    interes numeric(10,4) NOT NULL,
    nro_doc character varying(20) NOT NULL,
    nro_cheque character varying(20) NOT NULL
);


--
-- TOC entry 185 (class 1259 OID 133657)
-- Name: cd_deudas_cd_deudas_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cd_deudas_cd_deudas_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2213 (class 0 OID 0)
-- Dependencies: 185
-- Name: cd_deudas_cd_deudas_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cd_deudas_cd_deudas_pk_seq OWNED BY cd_deudas.cd_deudas_pk;


--
-- TOC entry 181 (class 1259 OID 133627)
-- Name: cd_edificios; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cd_edificios (
    cd_edificios_pk smallint NOT NULL,
    cod_conjunto smallint NOT NULL,
    nombre_edificio character varying(20) NOT NULL,
    nombre_concerje character varying(30) NOT NULL,
    telf_concerje numeric(11,0) DEFAULT 0 NOT NULL,
    porcentaje_nro1 numeric(10,4) NOT NULL,
    porcentaje_nro2 numeric(10,4) NOT NULL,
    agua numeric(10,4) NOT NULL,
    fondo_nro1 numeric DEFAULT 0 NOT NULL,
    fondo_nro2 numeric DEFAULT 0 NOT NULL,
    fondo_nro3 numeric NOT NULL,
    fondo_nro4 numeric DEFAULT 0 NOT NULL,
    fondo_nro5 numeric DEFAULT 0 NOT NULL,
    fondo_nro6 numeric DEFAULT 0 NOT NULL,
    fondo_nro7 numeric NOT NULL,
    fondo_nro8 numeric NOT NULL
);


--
-- TOC entry 180 (class 1259 OID 133625)
-- Name: cd_edificios_cd_edificios_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cd_edificios_cd_edificios_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2214 (class 0 OID 0)
-- Dependencies: 180
-- Name: cd_edificios_cd_edificios_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cd_edificios_cd_edificios_pk_seq OWNED BY cd_edificios.cd_edificios_pk;


--
-- TOC entry 188 (class 1259 OID 133667)
-- Name: cd_fondos; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cd_fondos (
    cd_fondos_pk smallint NOT NULL,
    cod_conjunto smallint NOT NULL,
    cod_edificio smallint NOT NULL,
    cod_concepto smallint NOT NULL,
    fecha_i date NOT NULL,
    fecha_f date NOT NULL,
    monto_g numeric(10,4) NOT NULL,
    nro_cuotas integer NOT NULL,
    cuota_m numeric(10,4) NOT NULL,
    gastos numeric(10,4) NOT NULL
);


--
-- TOC entry 187 (class 1259 OID 133665)
-- Name: cd_fondos_cd_fondos_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cd_fondos_cd_fondos_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2215 (class 0 OID 0)
-- Dependencies: 187
-- Name: cd_fondos_cd_fondos_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cd_fondos_cd_fondos_pk_seq OWNED BY cd_fondos.cd_fondos_pk;


--
-- TOC entry 190 (class 1259 OID 133675)
-- Name: cd_historicos; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cd_historicos (
    cd_historicos_pk integer NOT NULL,
    cod_observacion smallint NOT NULL,
    cod_deuda smallint NOT NULL,
    cod_apto character varying(3) NOT NULL,
    cod_conjunto smallint NOT NULL,
    cod_edificio smallint NOT NULL,
    fecha date NOT NULL,
    monto numeric(10,4) NOT NULL,
    apagar numeric(10,4) NOT NULL,
    recibo real NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 133673)
-- Name: cd_historicos_cd_historicos_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cd_historicos_cd_historicos_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2216 (class 0 OID 0)
-- Dependencies: 189
-- Name: cd_historicos_cd_historicos_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cd_historicos_cd_historicos_pk_seq OWNED BY cd_historicos.cd_historicos_pk;


--
-- TOC entry 177 (class 1259 OID 133611)
-- Name: cd_mantenimientos; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cd_mantenimientos (
    cd_mantenimientos_pk smallint NOT NULL,
    correlativo real NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 133609)
-- Name: cd_mantenimientos_cd_mantenimientos_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cd_mantenimientos_cd_mantenimientos_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2217 (class 0 OID 0)
-- Dependencies: 176
-- Name: cd_mantenimientos_cd_mantenimientos_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cd_mantenimientos_cd_mantenimientos_pk_seq OWNED BY cd_mantenimientos.cd_mantenimientos_pk;


--
-- TOC entry 194 (class 1259 OID 133694)
-- Name: cd_mov_chequeras; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cd_mov_chequeras (
    cd_mov_chequeras_pk smallint NOT NULL,
    cod_concepto smallint NOT NULL,
    cod_proveedor smallint NOT NULL,
    nro_cheque integer DEFAULT 0 NOT NULL,
    factura integer DEFAULT 0 NOT NULL,
    monto numeric(10,4) DEFAULT 0 NOT NULL,
    nro_cuenta character varying(20) NOT NULL,
    fecha date NOT NULL
);


--
-- TOC entry 193 (class 1259 OID 133689)
-- Name: cd_mov_mes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cd_mov_mes (
    cd_mov_mes_pk smallint NOT NULL,
    cod_concepto smallint NOT NULL,
    cod_apto character varying(3) NOT NULL,
    cod_conjunto smallint NOT NULL,
    cod_edificio smallint NOT NULL,
    fecha date NOT NULL,
    monto numeric(10,4) NOT NULL
);


--
-- TOC entry 175 (class 1259 OID 133603)
-- Name: cd_observaciones; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cd_observaciones (
    cd_observaciones_pk smallint NOT NULL,
    descripcion character varying(300) NOT NULL
);


--
-- TOC entry 174 (class 1259 OID 133601)
-- Name: cd_observaciones_cd_observaciones_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cd_observaciones_cd_observaciones_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2218 (class 0 OID 0)
-- Dependencies: 174
-- Name: cd_observaciones_cd_observaciones_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cd_observaciones_cd_observaciones_pk_seq OWNED BY cd_observaciones.cd_observaciones_pk;


--
-- TOC entry 183 (class 1259 OID 133644)
-- Name: cd_propietarios; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cd_propietarios (
    cd_propietarios_pk smallint NOT NULL,
    cod_conjunto smallint NOT NULL,
    cod_edificio smallint NOT NULL,
    nro_piso smallint NOT NULL,
    nombre character varying(30) NOT NULL,
    apellido character varying(30) NOT NULL,
    telf_local numeric(11,0) DEFAULT 0 NOT NULL,
    telf_celular numeric(11,0) DEFAULT 0 NOT NULL,
    fax character varying(15) NOT NULL,
    alicuota numeric(10,4) NOT NULL,
    quien_vive character varying(1),
    direccion character varying(150) NOT NULL,
    direccion_cobro character varying(150) NOT NULL
);


--
-- TOC entry 182 (class 1259 OID 133642)
-- Name: cd_propietarios_cd_propietarios_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cd_propietarios_cd_propietarios_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2219 (class 0 OID 0)
-- Dependencies: 182
-- Name: cd_propietarios_cd_propietarios_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cd_propietarios_cd_propietarios_pk_seq OWNED BY cd_propietarios.cd_propietarios_pk;


--
-- TOC entry 173 (class 1259 OID 133595)
-- Name: cd_proveedores; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cd_proveedores (
    cd_proveedores_pk smallint NOT NULL,
    razon_social character varying(35) NOT NULL,
    beneficiario character varying(35) NOT NULL
);


--
-- TOC entry 172 (class 1259 OID 133593)
-- Name: cd_proveedores_cd_proveedores_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cd_proveedores_cd_proveedores_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2220 (class 0 OID 0)
-- Dependencies: 172
-- Name: cd_proveedores_cd_proveedores_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cd_proveedores_cd_proveedores_pk_seq OWNED BY cd_proveedores.cd_proveedores_pk;


--
-- TOC entry 199 (class 1259 OID 139905)
-- Name: migration; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE migration (
    version character varying(180) NOT NULL,
    apply_time integer
);


--
-- TOC entry 201 (class 1259 OID 139912)
-- Name: user; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE "user" (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    auth_key character varying(32) NOT NULL,
    password_hash character varying(255) NOT NULL,
    password_reset_token character varying(255),
    email character varying(255) NOT NULL,
    status smallint DEFAULT 10 NOT NULL,
    created_at integer NOT NULL,
    updated_at integer NOT NULL,
    role integer DEFAULT 1 NOT NULL
);


--
-- TOC entry 200 (class 1259 OID 139910)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2221 (class 0 OID 0)
-- Dependencies: 200
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE user_id_seq OWNED BY "user".id;


--
-- TOC entry 1994 (class 2604 OID 133715)
-- Name: cd_aguas_pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_aguas ALTER COLUMN cd_aguas_pk SET DEFAULT nextval('cd_aguas_cd_aguas_pk_seq'::regclass);


--
-- TOC entry 1993 (class 2604 OID 133707)
-- Name: cd_chequeras_pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_chequeras ALTER COLUMN cd_chequeras_pk SET DEFAULT nextval('cd_chequeras_cd_chequeras_pk_seq'::regclass);


--
-- TOC entry 1989 (class 2604 OID 133686)
-- Name: cd_conceptos_pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_conceptos ALTER COLUMN cd_conceptos_pk SET DEFAULT nextval('cd_conceptos_cd_conceptos_pk_seq'::regclass);


--
-- TOC entry 1975 (class 2604 OID 133622)
-- Name: cd_conjuntos_pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_conjuntos ALTER COLUMN cd_conjuntos_pk SET DEFAULT nextval('cd_conjuntos_cd_conjuntos_pk_seq'::regclass);


--
-- TOC entry 1986 (class 2604 OID 133662)
-- Name: cd_deudas_pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_deudas ALTER COLUMN cd_deudas_pk SET DEFAULT nextval('cd_deudas_cd_deudas_pk_seq'::regclass);


--
-- TOC entry 1976 (class 2604 OID 133630)
-- Name: cd_edificios_pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_edificios ALTER COLUMN cd_edificios_pk SET DEFAULT nextval('cd_edificios_cd_edificios_pk_seq'::regclass);


--
-- TOC entry 1987 (class 2604 OID 133670)
-- Name: cd_fondos_pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_fondos ALTER COLUMN cd_fondos_pk SET DEFAULT nextval('cd_fondos_cd_fondos_pk_seq'::regclass);


--
-- TOC entry 1988 (class 2604 OID 133678)
-- Name: cd_historicos_pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_historicos ALTER COLUMN cd_historicos_pk SET DEFAULT nextval('cd_historicos_cd_historicos_pk_seq'::regclass);


--
-- TOC entry 1974 (class 2604 OID 133614)
-- Name: cd_mantenimientos_pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_mantenimientos ALTER COLUMN cd_mantenimientos_pk SET DEFAULT nextval('cd_mantenimientos_cd_mantenimientos_pk_seq'::regclass);


--
-- TOC entry 1973 (class 2604 OID 133606)
-- Name: cd_observaciones_pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_observaciones ALTER COLUMN cd_observaciones_pk SET DEFAULT nextval('cd_observaciones_cd_observaciones_pk_seq'::regclass);


--
-- TOC entry 1983 (class 2604 OID 133647)
-- Name: cd_propietarios_pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_propietarios ALTER COLUMN cd_propietarios_pk SET DEFAULT nextval('cd_propietarios_cd_propietarios_pk_seq'::regclass);


--
-- TOC entry 1972 (class 2604 OID 133598)
-- Name: cd_proveedores_pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_proveedores ALTER COLUMN cd_proveedores_pk SET DEFAULT nextval('cd_proveedores_cd_proveedores_pk_seq'::regclass);


--
-- TOC entry 1995 (class 2604 OID 139915)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "user" ALTER COLUMN id SET DEFAULT nextval('user_id_seq'::regclass);


--
-- TOC entry 2198 (class 0 OID 133712)
-- Dependencies: 198
-- Data for Name: cd_aguas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cd_aguas (cd_aguas_pk, cod_apto, cod_conjunto, cod_edificio, lect_ant, lect_post) FROM stdin;
\.


--
-- TOC entry 2222 (class 0 OID 0)
-- Dependencies: 197
-- Name: cd_aguas_cd_aguas_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cd_aguas_cd_aguas_pk_seq', 1, false);


--
-- TOC entry 2184 (class 0 OID 133652)
-- Dependencies: 184
-- Data for Name: cd_aptos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cd_aptos (cd_aptos_pk, cod_propietario) FROM stdin;
\.


--
-- TOC entry 2196 (class 0 OID 133704)
-- Dependencies: 196
-- Data for Name: cd_chequeras; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cd_chequeras (cd_chequeras_pk, cod_conjunto, cod_edificio, nro_cuenta, monto, saldo) FROM stdin;
\.


--
-- TOC entry 2223 (class 0 OID 0)
-- Dependencies: 195
-- Name: cd_chequeras_cd_chequeras_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cd_chequeras_cd_chequeras_pk_seq', 1, false);


--
-- TOC entry 2192 (class 0 OID 133683)
-- Dependencies: 192
-- Data for Name: cd_conceptos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cd_conceptos (cd_conceptos_pk, descrip_concepto, tipo, frecuencia) FROM stdin;
\.


--
-- TOC entry 2224 (class 0 OID 0)
-- Dependencies: 191
-- Name: cd_conceptos_cd_conceptos_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cd_conceptos_cd_conceptos_pk_seq', 1, false);


--
-- TOC entry 2179 (class 0 OID 133619)
-- Dependencies: 179
-- Data for Name: cd_conjuntos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cd_conjuntos (cd_conjuntos_pk, nombre, direccion) FROM stdin;
\.


--
-- TOC entry 2225 (class 0 OID 0)
-- Dependencies: 178
-- Name: cd_conjuntos_cd_conjuntos_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cd_conjuntos_cd_conjuntos_pk_seq', 1, false);


--
-- TOC entry 2186 (class 0 OID 133659)
-- Dependencies: 186
-- Data for Name: cd_deudas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cd_deudas (cd_deudas_pk, cod_apto, cod_conjunto, cod_edificio, fecha_deuda, fecha_cancelado, monto, interes, nro_doc, nro_cheque) FROM stdin;
\.


--
-- TOC entry 2226 (class 0 OID 0)
-- Dependencies: 185
-- Name: cd_deudas_cd_deudas_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cd_deudas_cd_deudas_pk_seq', 1, false);


--
-- TOC entry 2181 (class 0 OID 133627)
-- Dependencies: 181
-- Data for Name: cd_edificios; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cd_edificios (cd_edificios_pk, cod_conjunto, nombre_edificio, nombre_concerje, telf_concerje, porcentaje_nro1, porcentaje_nro2, agua, fondo_nro1, fondo_nro2, fondo_nro3, fondo_nro4, fondo_nro5, fondo_nro6, fondo_nro7, fondo_nro8) FROM stdin;
\.


--
-- TOC entry 2227 (class 0 OID 0)
-- Dependencies: 180
-- Name: cd_edificios_cd_edificios_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cd_edificios_cd_edificios_pk_seq', 1, false);


--
-- TOC entry 2188 (class 0 OID 133667)
-- Dependencies: 188
-- Data for Name: cd_fondos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cd_fondos (cd_fondos_pk, cod_conjunto, cod_edificio, cod_concepto, fecha_i, fecha_f, monto_g, nro_cuotas, cuota_m, gastos) FROM stdin;
\.


--
-- TOC entry 2228 (class 0 OID 0)
-- Dependencies: 187
-- Name: cd_fondos_cd_fondos_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cd_fondos_cd_fondos_pk_seq', 1, false);


--
-- TOC entry 2190 (class 0 OID 133675)
-- Dependencies: 190
-- Data for Name: cd_historicos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cd_historicos (cd_historicos_pk, cod_observacion, cod_deuda, cod_apto, cod_conjunto, cod_edificio, fecha, monto, apagar, recibo) FROM stdin;
\.


--
-- TOC entry 2229 (class 0 OID 0)
-- Dependencies: 189
-- Name: cd_historicos_cd_historicos_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cd_historicos_cd_historicos_pk_seq', 1, false);


--
-- TOC entry 2177 (class 0 OID 133611)
-- Dependencies: 177
-- Data for Name: cd_mantenimientos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cd_mantenimientos (cd_mantenimientos_pk, correlativo) FROM stdin;
\.


--
-- TOC entry 2230 (class 0 OID 0)
-- Dependencies: 176
-- Name: cd_mantenimientos_cd_mantenimientos_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cd_mantenimientos_cd_mantenimientos_pk_seq', 1, false);


--
-- TOC entry 2194 (class 0 OID 133694)
-- Dependencies: 194
-- Data for Name: cd_mov_chequeras; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cd_mov_chequeras (cd_mov_chequeras_pk, cod_concepto, cod_proveedor, nro_cheque, factura, monto, nro_cuenta, fecha) FROM stdin;
\.


--
-- TOC entry 2193 (class 0 OID 133689)
-- Dependencies: 193
-- Data for Name: cd_mov_mes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cd_mov_mes (cd_mov_mes_pk, cod_concepto, cod_apto, cod_conjunto, cod_edificio, fecha, monto) FROM stdin;
\.


--
-- TOC entry 2175 (class 0 OID 133603)
-- Dependencies: 175
-- Data for Name: cd_observaciones; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cd_observaciones (cd_observaciones_pk, descripcion) FROM stdin;
\.


--
-- TOC entry 2231 (class 0 OID 0)
-- Dependencies: 174
-- Name: cd_observaciones_cd_observaciones_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cd_observaciones_cd_observaciones_pk_seq', 1, false);


--
-- TOC entry 2183 (class 0 OID 133644)
-- Dependencies: 183
-- Data for Name: cd_propietarios; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cd_propietarios (cd_propietarios_pk, cod_conjunto, cod_edificio, nro_piso, nombre, apellido, telf_local, telf_celular, fax, alicuota, quien_vive, direccion, direccion_cobro) FROM stdin;
\.


--
-- TOC entry 2232 (class 0 OID 0)
-- Dependencies: 182
-- Name: cd_propietarios_cd_propietarios_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cd_propietarios_cd_propietarios_pk_seq', 1, false);


--
-- TOC entry 2173 (class 0 OID 133595)
-- Dependencies: 173
-- Data for Name: cd_proveedores; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cd_proveedores (cd_proveedores_pk, razon_social, beneficiario) FROM stdin;
\.


--
-- TOC entry 2233 (class 0 OID 0)
-- Dependencies: 172
-- Name: cd_proveedores_cd_proveedores_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cd_proveedores_cd_proveedores_pk_seq', 1, false);


--
-- TOC entry 2199 (class 0 OID 139905)
-- Dependencies: 199
-- Data for Name: migration; Type: TABLE DATA; Schema: public; Owner: -
--

COPY migration (version, apply_time) FROM stdin;
m000000_000000_base	1462978982
m130524_201442_init	1462978985
\.


--
-- TOC entry 2201 (class 0 OID 139912)
-- Dependencies: 201
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "user" (id, username, auth_key, password_hash, password_reset_token, email, status, created_at, updated_at, role) FROM stdin;
2	root	zkQ2nsjPEtKD8y_a3D5HobL2xpWf3hmD	$2y$13$c2CKmeKhck3diFWM4df/COAJCbUr57AeTok5CxTNHts9N.k.B7rzC	\N	root@root.com	10	1463057796	1463057796	1
1	admin	LbC8MvmRAC35vz4ka9znjbHbJPELKJZa	$2y$13$klmqr54mIpbKA6.Bfp.TLehdiceh4./4jReDWGjO5pTdwmjqTvLOe	\N	admin@admin.com	10	1463057653	1463057653	1
\.


--
-- TOC entry 2234 (class 0 OID 0)
-- Dependencies: 200
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('user_id_seq', 2, true);


--
-- TOC entry 2027 (class 2606 OID 133720)
-- Name: cd_aguas_pk; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cd_aguas
    ADD CONSTRAINT cd_aguas_pk PRIMARY KEY (cd_aguas_pk);


--
-- TOC entry 2011 (class 2606 OID 133656)
-- Name: cd_aptos_pk; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cd_aptos
    ADD CONSTRAINT cd_aptos_pk PRIMARY KEY (cd_aptos_pk);


--
-- TOC entry 2025 (class 2606 OID 133709)
-- Name: cd_chequeras_pk; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cd_chequeras
    ADD CONSTRAINT cd_chequeras_pk PRIMARY KEY (cd_chequeras_pk);


--
-- TOC entry 2019 (class 2606 OID 133688)
-- Name: cd_conceptos_pk; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cd_conceptos
    ADD CONSTRAINT cd_conceptos_pk PRIMARY KEY (cd_conceptos_pk);


--
-- TOC entry 2005 (class 2606 OID 133624)
-- Name: cd_conjuntos_pk; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cd_conjuntos
    ADD CONSTRAINT cd_conjuntos_pk PRIMARY KEY (cd_conjuntos_pk);


--
-- TOC entry 2013 (class 2606 OID 133664)
-- Name: cd_deudas_pk; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cd_deudas
    ADD CONSTRAINT cd_deudas_pk PRIMARY KEY (cd_deudas_pk);


--
-- TOC entry 2007 (class 2606 OID 133641)
-- Name: cd_edificios_pk; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cd_edificios
    ADD CONSTRAINT cd_edificios_pk PRIMARY KEY (cd_edificios_pk);


--
-- TOC entry 2015 (class 2606 OID 133672)
-- Name: cd_fondos_pk; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cd_fondos
    ADD CONSTRAINT cd_fondos_pk PRIMARY KEY (cd_fondos_pk);


--
-- TOC entry 2017 (class 2606 OID 133680)
-- Name: cd_historicos_pk; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cd_historicos
    ADD CONSTRAINT cd_historicos_pk PRIMARY KEY (cd_historicos_pk);


--
-- TOC entry 2003 (class 2606 OID 133616)
-- Name: cd_mantenimientos_pk; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cd_mantenimientos
    ADD CONSTRAINT cd_mantenimientos_pk PRIMARY KEY (cd_mantenimientos_pk);


--
-- TOC entry 2023 (class 2606 OID 133701)
-- Name: cd_mov_chequeras_pk; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cd_mov_chequeras
    ADD CONSTRAINT cd_mov_chequeras_pk PRIMARY KEY (cd_mov_chequeras_pk);


--
-- TOC entry 2021 (class 2606 OID 133693)
-- Name: cd_mov_mes_pk; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cd_mov_mes
    ADD CONSTRAINT cd_mov_mes_pk PRIMARY KEY (cd_mov_mes_pk);


--
-- TOC entry 2001 (class 2606 OID 133608)
-- Name: cd_observaciones_pk; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cd_observaciones
    ADD CONSTRAINT cd_observaciones_pk PRIMARY KEY (cd_observaciones_pk);


--
-- TOC entry 2009 (class 2606 OID 133651)
-- Name: cd_propietarios_pk; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cd_propietarios
    ADD CONSTRAINT cd_propietarios_pk PRIMARY KEY (cd_propietarios_pk);


--
-- TOC entry 1999 (class 2606 OID 133600)
-- Name: cd_proveedores_pk; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cd_proveedores
    ADD CONSTRAINT cd_proveedores_pk PRIMARY KEY (cd_proveedores_pk);


--
-- TOC entry 2029 (class 2606 OID 139909)
-- Name: migration_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY migration
    ADD CONSTRAINT migration_pkey PRIMARY KEY (version);


--
-- TOC entry 2031 (class 2606 OID 139927)
-- Name: user_email_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_email_key UNIQUE (email);


--
-- TOC entry 2033 (class 2606 OID 139925)
-- Name: user_password_reset_token_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_password_reset_token_key UNIQUE (password_reset_token);


--
-- TOC entry 2035 (class 2606 OID 139921)
-- Name: user_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 2037 (class 2606 OID 139923)
-- Name: user_username_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_username_key UNIQUE (username);


--
-- TOC entry 2062 (class 2606 OID 133826)
-- Name: cd_aptos_cd_aguas_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_aguas
    ADD CONSTRAINT cd_aptos_cd_aguas_fk FOREIGN KEY (cod_apto) REFERENCES cd_aptos(cd_aptos_pk);


--
-- TOC entry 2044 (class 2606 OID 133811)
-- Name: cd_aptos_cd_deudas_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_deudas
    ADD CONSTRAINT cd_aptos_cd_deudas_fk FOREIGN KEY (cod_apto) REFERENCES cd_aptos(cd_aptos_pk);


--
-- TOC entry 2050 (class 2606 OID 133821)
-- Name: cd_aptos_cd_historicos_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_historicos
    ADD CONSTRAINT cd_aptos_cd_historicos_fk FOREIGN KEY (cod_apto) REFERENCES cd_aptos(cd_aptos_pk);


--
-- TOC entry 2054 (class 2606 OID 133816)
-- Name: cd_aptos_cd_mov_mes_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_mov_mes
    ADD CONSTRAINT cd_aptos_cd_mov_mes_fk FOREIGN KEY (cod_apto) REFERENCES cd_aptos(cd_aptos_pk);


--
-- TOC entry 2057 (class 2606 OID 133836)
-- Name: cd_conceptos_cd_mov_chequeras_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_mov_chequeras
    ADD CONSTRAINT cd_conceptos_cd_mov_chequeras_fk FOREIGN KEY (cod_concepto) REFERENCES cd_conceptos(cd_conceptos_pk);


--
-- TOC entry 2055 (class 2606 OID 133841)
-- Name: cd_conceptos_cd_mov_mes_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_mov_mes
    ADD CONSTRAINT cd_conceptos_cd_mov_mes_fk FOREIGN KEY (cod_concepto) REFERENCES cd_conceptos(cd_conceptos_pk);


--
-- TOC entry 2060 (class 2606 OID 133761)
-- Name: cd_conjuntos_cd_aguas_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_aguas
    ADD CONSTRAINT cd_conjuntos_cd_aguas_fk FOREIGN KEY (cod_conjunto) REFERENCES cd_conjuntos(cd_conjuntos_pk) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2058 (class 2606 OID 133741)
-- Name: cd_conjuntos_cd_chequeras_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_chequeras
    ADD CONSTRAINT cd_conjuntos_cd_chequeras_fk FOREIGN KEY (cod_conjunto) REFERENCES cd_conjuntos(cd_conjuntos_pk) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2042 (class 2606 OID 133756)
-- Name: cd_conjuntos_cd_deudas_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_deudas
    ADD CONSTRAINT cd_conjuntos_cd_deudas_fk FOREIGN KEY (cod_conjunto) REFERENCES cd_conjuntos(cd_conjuntos_pk) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2038 (class 2606 OID 133731)
-- Name: cd_conjuntos_cd_edificios_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_edificios
    ADD CONSTRAINT cd_conjuntos_cd_edificios_fk FOREIGN KEY (cod_conjunto) REFERENCES cd_conjuntos(cd_conjuntos_pk) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2045 (class 2606 OID 133746)
-- Name: cd_conjuntos_cd_fondos_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_fondos
    ADD CONSTRAINT cd_conjuntos_cd_fondos_fk FOREIGN KEY (cod_conjunto) REFERENCES cd_conjuntos(cd_conjuntos_pk) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2048 (class 2606 OID 133766)
-- Name: cd_conjuntos_cd_historicos_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_historicos
    ADD CONSTRAINT cd_conjuntos_cd_historicos_fk FOREIGN KEY (cod_conjunto) REFERENCES cd_conjuntos(cd_conjuntos_pk) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2052 (class 2606 OID 133736)
-- Name: cd_conjuntos_cd_mov_mes_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_mov_mes
    ADD CONSTRAINT cd_conjuntos_cd_mov_mes_fk FOREIGN KEY (cod_conjunto) REFERENCES cd_conjuntos(cd_conjuntos_pk);


--
-- TOC entry 2039 (class 2606 OID 133751)
-- Name: cd_conjuntos_cd_propietarios_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_propietarios
    ADD CONSTRAINT cd_conjuntos_cd_propietarios_fk FOREIGN KEY (cod_conjunto) REFERENCES cd_conjuntos(cd_conjuntos_pk) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2051 (class 2606 OID 133831)
-- Name: cd_deudas_cd_historicos_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_historicos
    ADD CONSTRAINT cd_deudas_cd_historicos_fk FOREIGN KEY (cod_deuda) REFERENCES cd_deudas(cd_deudas_pk);


--
-- TOC entry 2061 (class 2606 OID 133771)
-- Name: cd_edificios_cd_aguas_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_aguas
    ADD CONSTRAINT cd_edificios_cd_aguas_fk FOREIGN KEY (cod_edificio) REFERENCES cd_edificios(cd_edificios_pk) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2059 (class 2606 OID 133776)
-- Name: cd_edificios_cd_chequeras_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_chequeras
    ADD CONSTRAINT cd_edificios_cd_chequeras_fk FOREIGN KEY (cod_edificio) REFERENCES cd_edificios(cd_edificios_pk) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2043 (class 2606 OID 133801)
-- Name: cd_edificios_cd_deudas_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_deudas
    ADD CONSTRAINT cd_edificios_cd_deudas_fk FOREIGN KEY (cod_edificio) REFERENCES cd_edificios(cd_edificios_pk) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2046 (class 2606 OID 133786)
-- Name: cd_edificios_cd_fondos_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_fondos
    ADD CONSTRAINT cd_edificios_cd_fondos_fk FOREIGN KEY (cod_edificio) REFERENCES cd_edificios(cd_edificios_pk) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2049 (class 2606 OID 133781)
-- Name: cd_edificios_cd_historicos_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_historicos
    ADD CONSTRAINT cd_edificios_cd_historicos_fk FOREIGN KEY (cod_edificio) REFERENCES cd_edificios(cd_edificios_pk) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2053 (class 2606 OID 133796)
-- Name: cd_edificios_cd_mov_mes_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_mov_mes
    ADD CONSTRAINT cd_edificios_cd_mov_mes_fk FOREIGN KEY (cod_edificio) REFERENCES cd_edificios(cd_edificios_pk) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2040 (class 2606 OID 133791)
-- Name: cd_edificios_cd_propietarios_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_propietarios
    ADD CONSTRAINT cd_edificios_cd_propietarios_fk FOREIGN KEY (cod_edificio) REFERENCES cd_edificios(cd_edificios_pk) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2047 (class 2606 OID 133726)
-- Name: cd_observaciones_cd_historicos_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_historicos
    ADD CONSTRAINT cd_observaciones_cd_historicos_fk FOREIGN KEY (cod_observacion) REFERENCES cd_observaciones(cd_observaciones_pk);


--
-- TOC entry 2041 (class 2606 OID 133806)
-- Name: cd_propietarios_cd_aptos_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_aptos
    ADD CONSTRAINT cd_propietarios_cd_aptos_fk FOREIGN KEY (cod_propietario) REFERENCES cd_propietarios(cd_propietarios_pk);


--
-- TOC entry 2056 (class 2606 OID 133721)
-- Name: cd_proveedores_cd_mov_chequeras_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_mov_chequeras
    ADD CONSTRAINT cd_proveedores_cd_mov_chequeras_fk FOREIGN KEY (cod_proveedor) REFERENCES cd_proveedores(cd_proveedores_pk);


-- Completed on 2016-05-25 12:22:05

--
-- PostgreSQL database dump complete
--

