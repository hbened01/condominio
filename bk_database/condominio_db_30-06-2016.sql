--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.4
-- Dumped by pg_dump version 9.4.0
-- Started on 2016-06-30 11:19:44

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 210 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2242 (class 0 OID 0)
-- Dependencies: 210
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 194 (class 1259 OID 133712)
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
-- TOC entry 193 (class 1259 OID 133710)
-- Name: cd_aguas_cd_aguas_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cd_aguas_cd_aguas_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2243 (class 0 OID 0)
-- Dependencies: 193
-- Name: cd_aguas_cd_aguas_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cd_aguas_cd_aguas_pk_seq OWNED BY cd_aguas.cd_aguas_pk;


--
-- TOC entry 180 (class 1259 OID 133652)
-- Name: cd_aptos; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cd_aptos (
    cd_aptos_pk character varying(3) NOT NULL,
    cod_propietario smallint NOT NULL,
    cod_edificio smallint NOT NULL
);


--
-- TOC entry 192 (class 1259 OID 133704)
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
-- TOC entry 191 (class 1259 OID 133702)
-- Name: cd_chequeras_cd_chequeras_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cd_chequeras_cd_chequeras_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2244 (class 0 OID 0)
-- Dependencies: 191
-- Name: cd_chequeras_cd_chequeras_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cd_chequeras_cd_chequeras_pk_seq OWNED BY cd_chequeras.cd_chequeras_pk;


--
-- TOC entry 188 (class 1259 OID 133683)
-- Name: cd_conceptos; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cd_conceptos (
    cd_conceptos_pk smallint NOT NULL,
    descrip_concepto character varying(50) NOT NULL,
    tipo character varying(1) NOT NULL,
    frecuencia integer NOT NULL
);


--
-- TOC entry 187 (class 1259 OID 133681)
-- Name: cd_conceptos_cd_conceptos_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cd_conceptos_cd_conceptos_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2245 (class 0 OID 0)
-- Dependencies: 187
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
-- TOC entry 2246 (class 0 OID 0)
-- Dependencies: 178
-- Name: cd_conjuntos_cd_conjuntos_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cd_conjuntos_cd_conjuntos_pk_seq OWNED BY cd_conjuntos.cd_conjuntos_pk;


--
-- TOC entry 182 (class 1259 OID 133659)
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
-- TOC entry 181 (class 1259 OID 133657)
-- Name: cd_deudas_cd_deudas_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cd_deudas_cd_deudas_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2247 (class 0 OID 0)
-- Dependencies: 181
-- Name: cd_deudas_cd_deudas_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cd_deudas_cd_deudas_pk_seq OWNED BY cd_deudas.cd_deudas_pk;


--
-- TOC entry 209 (class 1259 OID 230043)
-- Name: cd_edificios; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cd_edificios (
    cd_edificios_pk smallint NOT NULL,
    cod_conjunto smallint NOT NULL,
    nombre_edificio character varying(20) NOT NULL,
    nombre_concerje character varying(30) NOT NULL,
    telf_concerje numeric(11,0) DEFAULT 0 NOT NULL,
    porcentaje_nro1 numeric(10,4) NOT NULL,
    email character varying(256),
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
-- TOC entry 208 (class 1259 OID 230041)
-- Name: cd_edificios_cd_edificios_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cd_edificios_cd_edificios_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2248 (class 0 OID 0)
-- Dependencies: 208
-- Name: cd_edificios_cd_edificios_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cd_edificios_cd_edificios_pk_seq OWNED BY cd_edificios.cd_edificios_pk;


--
-- TOC entry 184 (class 1259 OID 133667)
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
-- TOC entry 183 (class 1259 OID 133665)
-- Name: cd_fondos_cd_fondos_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cd_fondos_cd_fondos_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2249 (class 0 OID 0)
-- Dependencies: 183
-- Name: cd_fondos_cd_fondos_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cd_fondos_cd_fondos_pk_seq OWNED BY cd_fondos.cd_fondos_pk;


--
-- TOC entry 186 (class 1259 OID 133675)
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
-- TOC entry 185 (class 1259 OID 133673)
-- Name: cd_historicos_cd_historicos_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cd_historicos_cd_historicos_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2250 (class 0 OID 0)
-- Dependencies: 185
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
-- TOC entry 2251 (class 0 OID 0)
-- Dependencies: 176
-- Name: cd_mantenimientos_cd_mantenimientos_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cd_mantenimientos_cd_mantenimientos_pk_seq OWNED BY cd_mantenimientos.cd_mantenimientos_pk;


--
-- TOC entry 190 (class 1259 OID 133694)
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
-- TOC entry 189 (class 1259 OID 133689)
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
-- TOC entry 2252 (class 0 OID 0)
-- Dependencies: 174
-- Name: cd_observaciones_cd_observaciones_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cd_observaciones_cd_observaciones_pk_seq OWNED BY cd_observaciones.cd_observaciones_pk;


--
-- TOC entry 207 (class 1259 OID 230031)
-- Name: cd_propietarios; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cd_propietarios (
    cd_propietarios_pk smallint NOT NULL,
    cod_user smallint NOT NULL,
    nro_piso smallint NOT NULL,
    nombre character varying(30) NOT NULL,
    apellido character varying(30) NOT NULL,
    nro_cedula numeric(10,0) DEFAULT 0 NOT NULL,
    telf_local numeric(11,0) DEFAULT 0 NOT NULL,
    telf_celular numeric(11,0) DEFAULT 0 NOT NULL,
    fax character varying(15) NOT NULL,
    alicuota numeric(10,4) NOT NULL,
    quien_vive character varying(1),
    direccion character varying(150) NOT NULL,
    direccion_cobro character varying(150) NOT NULL
);


--
-- TOC entry 205 (class 1259 OID 230027)
-- Name: cd_propietarios_cd_propietarios_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cd_propietarios_cd_propietarios_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2253 (class 0 OID 0)
-- Dependencies: 205
-- Name: cd_propietarios_cd_propietarios_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cd_propietarios_cd_propietarios_pk_seq OWNED BY cd_propietarios.cd_propietarios_pk;


--
-- TOC entry 206 (class 1259 OID 230029)
-- Name: cd_propietarios_cod_user_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cd_propietarios_cod_user_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2254 (class 0 OID 0)
-- Dependencies: 206
-- Name: cd_propietarios_cod_user_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cd_propietarios_cod_user_seq OWNED BY cd_propietarios.cod_user;


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
-- TOC entry 2255 (class 0 OID 0)
-- Dependencies: 172
-- Name: cd_proveedores_cd_proveedores_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cd_proveedores_cd_proveedores_pk_seq OWNED BY cd_proveedores.cd_proveedores_pk;


--
-- TOC entry 199 (class 1259 OID 205445)
-- Name: menu; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE menu (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    parent integer,
    route character varying(255),
    "order" integer,
    data bytea
);


--
-- TOC entry 198 (class 1259 OID 205443)
-- Name: menu_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2256 (class 0 OID 0)
-- Dependencies: 198
-- Name: menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE menu_id_seq OWNED BY menu.id;


--
-- TOC entry 195 (class 1259 OID 139905)
-- Name: migration; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE migration (
    version character varying(180) NOT NULL,
    apply_time integer
);


--
-- TOC entry 203 (class 1259 OID 213643)
-- Name: operaciones; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE operaciones (
    id integer NOT NULL,
    nombre character varying(64) NOT NULL
);


--
-- TOC entry 202 (class 1259 OID 213641)
-- Name: operaciones_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE operaciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2257 (class 0 OID 0)
-- Dependencies: 202
-- Name: operaciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE operaciones_id_seq OWNED BY operaciones.id;


--
-- TOC entry 201 (class 1259 OID 213635)
-- Name: roles; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE roles (
    id integer NOT NULL,
    nombre character varying(32) NOT NULL
);


--
-- TOC entry 200 (class 1259 OID 213633)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2258 (class 0 OID 0)
-- Dependencies: 200
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- TOC entry 204 (class 1259 OID 213654)
-- Name: roles_operaciones; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE roles_operaciones (
    rol_id integer NOT NULL,
    operacion_id integer NOT NULL
);


--
-- TOC entry 197 (class 1259 OID 189075)
-- Name: user; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE "user" (
    id integer NOT NULL,
    username character varying(32) NOT NULL,
    auth_key character varying(32) NOT NULL,
    password_hash character varying(256) NOT NULL,
    password_reset_token character varying(256),
    email character varying(256) NOT NULL,
    status integer DEFAULT 10 NOT NULL,
    created_at integer NOT NULL,
    updated_at integer NOT NULL,
    rol_id integer
);


--
-- TOC entry 196 (class 1259 OID 189073)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2259 (class 0 OID 0)
-- Dependencies: 196
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE user_id_seq OWNED BY "user".id;


--
-- TOC entry 2009 (class 2604 OID 133715)
-- Name: cd_aguas_pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_aguas ALTER COLUMN cd_aguas_pk SET DEFAULT nextval('cd_aguas_cd_aguas_pk_seq'::regclass);


--
-- TOC entry 2008 (class 2604 OID 133707)
-- Name: cd_chequeras_pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_chequeras ALTER COLUMN cd_chequeras_pk SET DEFAULT nextval('cd_chequeras_cd_chequeras_pk_seq'::regclass);


--
-- TOC entry 2004 (class 2604 OID 133686)
-- Name: cd_conceptos_pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_conceptos ALTER COLUMN cd_conceptos_pk SET DEFAULT nextval('cd_conceptos_cd_conceptos_pk_seq'::regclass);


--
-- TOC entry 2000 (class 2604 OID 133622)
-- Name: cd_conjuntos_pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_conjuntos ALTER COLUMN cd_conjuntos_pk SET DEFAULT nextval('cd_conjuntos_cd_conjuntos_pk_seq'::regclass);


--
-- TOC entry 2001 (class 2604 OID 133662)
-- Name: cd_deudas_pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_deudas ALTER COLUMN cd_deudas_pk SET DEFAULT nextval('cd_deudas_cd_deudas_pk_seq'::regclass);


--
-- TOC entry 2020 (class 2604 OID 230046)
-- Name: cd_edificios_pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_edificios ALTER COLUMN cd_edificios_pk SET DEFAULT nextval('cd_edificios_cd_edificios_pk_seq'::regclass);


--
-- TOC entry 2002 (class 2604 OID 133670)
-- Name: cd_fondos_pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_fondos ALTER COLUMN cd_fondos_pk SET DEFAULT nextval('cd_fondos_cd_fondos_pk_seq'::regclass);


--
-- TOC entry 2003 (class 2604 OID 133678)
-- Name: cd_historicos_pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_historicos ALTER COLUMN cd_historicos_pk SET DEFAULT nextval('cd_historicos_cd_historicos_pk_seq'::regclass);


--
-- TOC entry 1999 (class 2604 OID 133614)
-- Name: cd_mantenimientos_pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_mantenimientos ALTER COLUMN cd_mantenimientos_pk SET DEFAULT nextval('cd_mantenimientos_cd_mantenimientos_pk_seq'::regclass);


--
-- TOC entry 1998 (class 2604 OID 133606)
-- Name: cd_observaciones_pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_observaciones ALTER COLUMN cd_observaciones_pk SET DEFAULT nextval('cd_observaciones_cd_observaciones_pk_seq'::regclass);


--
-- TOC entry 2015 (class 2604 OID 230034)
-- Name: cd_propietarios_pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_propietarios ALTER COLUMN cd_propietarios_pk SET DEFAULT nextval('cd_propietarios_cd_propietarios_pk_seq'::regclass);


--
-- TOC entry 2016 (class 2604 OID 230035)
-- Name: cod_user; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_propietarios ALTER COLUMN cod_user SET DEFAULT nextval('cd_propietarios_cod_user_seq'::regclass);


--
-- TOC entry 1997 (class 2604 OID 133598)
-- Name: cd_proveedores_pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_proveedores ALTER COLUMN cd_proveedores_pk SET DEFAULT nextval('cd_proveedores_cd_proveedores_pk_seq'::regclass);


--
-- TOC entry 2012 (class 2604 OID 205448)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY menu ALTER COLUMN id SET DEFAULT nextval('menu_id_seq'::regclass);


--
-- TOC entry 2014 (class 2604 OID 213646)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY operaciones ALTER COLUMN id SET DEFAULT nextval('operaciones_id_seq'::regclass);


--
-- TOC entry 2013 (class 2604 OID 213638)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- TOC entry 2010 (class 2604 OID 189078)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "user" ALTER COLUMN id SET DEFAULT nextval('user_id_seq'::regclass);


--
-- TOC entry 2220 (class 0 OID 133712)
-- Dependencies: 194
-- Data for Name: cd_aguas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cd_aguas (cd_aguas_pk, cod_apto, cod_conjunto, cod_edificio, lect_ant, lect_post) FROM stdin;
\.


--
-- TOC entry 2260 (class 0 OID 0)
-- Dependencies: 193
-- Name: cd_aguas_cd_aguas_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cd_aguas_cd_aguas_pk_seq', 1, false);


--
-- TOC entry 2206 (class 0 OID 133652)
-- Dependencies: 180
-- Data for Name: cd_aptos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cd_aptos (cd_aptos_pk, cod_propietario, cod_edificio) FROM stdin;
\.


--
-- TOC entry 2218 (class 0 OID 133704)
-- Dependencies: 192
-- Data for Name: cd_chequeras; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cd_chequeras (cd_chequeras_pk, cod_conjunto, cod_edificio, nro_cuenta, monto, saldo) FROM stdin;
\.


--
-- TOC entry 2261 (class 0 OID 0)
-- Dependencies: 191
-- Name: cd_chequeras_cd_chequeras_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cd_chequeras_cd_chequeras_pk_seq', 1, false);


--
-- TOC entry 2214 (class 0 OID 133683)
-- Dependencies: 188
-- Data for Name: cd_conceptos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cd_conceptos (cd_conceptos_pk, descrip_concepto, tipo, frecuencia) FROM stdin;
\.


--
-- TOC entry 2262 (class 0 OID 0)
-- Dependencies: 187
-- Name: cd_conceptos_cd_conceptos_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cd_conceptos_cd_conceptos_pk_seq', 1, false);


--
-- TOC entry 2205 (class 0 OID 133619)
-- Dependencies: 179
-- Data for Name: cd_conjuntos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cd_conjuntos (cd_conjuntos_pk, nombre, direccion) FROM stdin;
\.


--
-- TOC entry 2263 (class 0 OID 0)
-- Dependencies: 178
-- Name: cd_conjuntos_cd_conjuntos_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cd_conjuntos_cd_conjuntos_pk_seq', 1, false);


--
-- TOC entry 2208 (class 0 OID 133659)
-- Dependencies: 182
-- Data for Name: cd_deudas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cd_deudas (cd_deudas_pk, cod_apto, cod_conjunto, cod_edificio, fecha_deuda, fecha_cancelado, monto, interes, nro_doc, nro_cheque) FROM stdin;
\.


--
-- TOC entry 2264 (class 0 OID 0)
-- Dependencies: 181
-- Name: cd_deudas_cd_deudas_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cd_deudas_cd_deudas_pk_seq', 1, false);


--
-- TOC entry 2235 (class 0 OID 230043)
-- Dependencies: 209
-- Data for Name: cd_edificios; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cd_edificios (cd_edificios_pk, cod_conjunto, nombre_edificio, nombre_concerje, telf_concerje, porcentaje_nro1, email, porcentaje_nro2, agua, fondo_nro1, fondo_nro2, fondo_nro3, fondo_nro4, fondo_nro5, fondo_nro6, fondo_nro7, fondo_nro8) FROM stdin;
\.


--
-- TOC entry 2265 (class 0 OID 0)
-- Dependencies: 208
-- Name: cd_edificios_cd_edificios_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cd_edificios_cd_edificios_pk_seq', 1, false);


--
-- TOC entry 2210 (class 0 OID 133667)
-- Dependencies: 184
-- Data for Name: cd_fondos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cd_fondos (cd_fondos_pk, cod_conjunto, cod_edificio, cod_concepto, fecha_i, fecha_f, monto_g, nro_cuotas, cuota_m, gastos) FROM stdin;
\.


--
-- TOC entry 2266 (class 0 OID 0)
-- Dependencies: 183
-- Name: cd_fondos_cd_fondos_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cd_fondos_cd_fondos_pk_seq', 1, false);


--
-- TOC entry 2212 (class 0 OID 133675)
-- Dependencies: 186
-- Data for Name: cd_historicos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cd_historicos (cd_historicos_pk, cod_observacion, cod_deuda, cod_apto, cod_conjunto, cod_edificio, fecha, monto, apagar, recibo) FROM stdin;
\.


--
-- TOC entry 2267 (class 0 OID 0)
-- Dependencies: 185
-- Name: cd_historicos_cd_historicos_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cd_historicos_cd_historicos_pk_seq', 1, false);


--
-- TOC entry 2203 (class 0 OID 133611)
-- Dependencies: 177
-- Data for Name: cd_mantenimientos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cd_mantenimientos (cd_mantenimientos_pk, correlativo) FROM stdin;
\.


--
-- TOC entry 2268 (class 0 OID 0)
-- Dependencies: 176
-- Name: cd_mantenimientos_cd_mantenimientos_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cd_mantenimientos_cd_mantenimientos_pk_seq', 1, false);


--
-- TOC entry 2216 (class 0 OID 133694)
-- Dependencies: 190
-- Data for Name: cd_mov_chequeras; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cd_mov_chequeras (cd_mov_chequeras_pk, cod_concepto, cod_proveedor, nro_cheque, factura, monto, nro_cuenta, fecha) FROM stdin;
\.


--
-- TOC entry 2215 (class 0 OID 133689)
-- Dependencies: 189
-- Data for Name: cd_mov_mes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cd_mov_mes (cd_mov_mes_pk, cod_concepto, cod_apto, cod_conjunto, cod_edificio, fecha, monto) FROM stdin;
\.


--
-- TOC entry 2201 (class 0 OID 133603)
-- Dependencies: 175
-- Data for Name: cd_observaciones; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cd_observaciones (cd_observaciones_pk, descripcion) FROM stdin;
\.


--
-- TOC entry 2269 (class 0 OID 0)
-- Dependencies: 174
-- Name: cd_observaciones_cd_observaciones_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cd_observaciones_cd_observaciones_pk_seq', 1, false);


--
-- TOC entry 2233 (class 0 OID 230031)
-- Dependencies: 207
-- Data for Name: cd_propietarios; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cd_propietarios (cd_propietarios_pk, cod_user, nro_piso, nombre, apellido, nro_cedula, telf_local, telf_celular, fax, alicuota, quien_vive, direccion, direccion_cobro) FROM stdin;
\.


--
-- TOC entry 2270 (class 0 OID 0)
-- Dependencies: 205
-- Name: cd_propietarios_cd_propietarios_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cd_propietarios_cd_propietarios_pk_seq', 1, false);


--
-- TOC entry 2271 (class 0 OID 0)
-- Dependencies: 206
-- Name: cd_propietarios_cod_user_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cd_propietarios_cod_user_seq', 1, false);


--
-- TOC entry 2199 (class 0 OID 133595)
-- Dependencies: 173
-- Data for Name: cd_proveedores; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cd_proveedores (cd_proveedores_pk, razon_social, beneficiario) FROM stdin;
\.


--
-- TOC entry 2272 (class 0 OID 0)
-- Dependencies: 172
-- Name: cd_proveedores_cd_proveedores_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cd_proveedores_cd_proveedores_pk_seq', 1, false);


--
-- TOC entry 2225 (class 0 OID 205445)
-- Dependencies: 199
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: -
--

COPY menu (id, name, parent, route, "order", data) FROM stdin;
\.


--
-- TOC entry 2273 (class 0 OID 0)
-- Dependencies: 198
-- Name: menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('menu_id_seq', 1, false);


--
-- TOC entry 2221 (class 0 OID 139905)
-- Dependencies: 195
-- Data for Name: migration; Type: TABLE DATA; Schema: public; Owner: -
--

COPY migration (version, apply_time) FROM stdin;
m000000_000000_base	1462978982
m130524_201442_init	1462978985
m140506_102106_rbac_init	1464693687
m140602_111327_create_menu_table	1464871526
m160312_050000_create_user	1464871526
\.


--
-- TOC entry 2229 (class 0 OID 213643)
-- Dependencies: 203
-- Data for Name: operaciones; Type: TABLE DATA; Schema: public; Owner: -
--

COPY operaciones (id, nombre) FROM stdin;
1	cd-conjuntos-index
2	cd-conjuntos-create
3	cd-conjuntos-update
4	cd-conjuntos-delete
5	cd-conjuntos-view
6	cd-conceptos-index
7	cd-conceptos-view
8	cd-conceptos-create
9	cd-conceptos-update
10	cd-conceptos-delete
11	operaciones-index
12	operaciones-view
13	operaciones-create
14	operaciones-update
15	operaciones-delete
16	roles-index
17	roles-view
18	roles-create
19	roles-update
20	roles-delete
21	user-index
22	user-view
23	user-create
24	user-update
25	user-delete
26	user-set-password
\.


--
-- TOC entry 2274 (class 0 OID 0)
-- Dependencies: 202
-- Name: operaciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('operaciones_id_seq', 26, true);


--
-- TOC entry 2227 (class 0 OID 213635)
-- Dependencies: 201
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY roles (id, nombre) FROM stdin;
2	Administrador
3	Usuario Estandar
1	Super Usuario
\.


--
-- TOC entry 2275 (class 0 OID 0)
-- Dependencies: 200
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('roles_id_seq', 7, true);


--
-- TOC entry 2230 (class 0 OID 213654)
-- Dependencies: 204
-- Data for Name: roles_operaciones; Type: TABLE DATA; Schema: public; Owner: -
--

COPY roles_operaciones (rol_id, operacion_id) FROM stdin;
1	1
1	2
1	3
1	4
1	5
1	6
1	7
1	8
1	9
1	10
1	11
1	12
1	13
1	14
1	15
1	16
1	17
1	18
1	19
1	20
1	21
1	22
1	23
1	24
1	25
1	26
2	1
2	2
2	3
2	4
2	5
2	6
2	7
2	8
2	9
2	10
2	11
2	12
2	16
2	17
2	21
2	22
2	23
2	24
2	25
\.


--
-- TOC entry 2223 (class 0 OID 189075)
-- Dependencies: 197
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "user" (id, username, auth_key, password_hash, password_reset_token, email, status, created_at, updated_at, rol_id) FROM stdin;
1	admin	moFHYdX57cwdFURVeuNNxTj_W7TY0JmZ	$2y$13$SpEZ/v4NgBRmemu8.IZWC.AHVbSeAePwa1Dr3Dvy9iGNKXVVl205W	\N	admin@admin.com	1	1464620742	1467294206	1
2	Humberto Benedito	YNpx8aveIJnohs2qt4gf-UJwLvcpjPam	$2y$13$F2Urt6u9zeZXi8WC6NXhxeR0Swaeqx5.OlennesqM6KjpuIh1Rs0C	\N	humbertobenedito@gmail.com	1	1464703400	1467295621	2
3	user	ZpJJl7YktH_qzVSi56hWYoo5FniU_sDO	$2y$13$Vwgx6bfhqcXDU9WjLoggm.OxR54JHAp5wmPTo8niaXxIio9u5cgli	\N	user@gmail.com	1	1467293736	1467293736	3
\.


--
-- TOC entry 2276 (class 0 OID 0)
-- Dependencies: 196
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('user_id_seq', 3, true);


--
-- TOC entry 2052 (class 2606 OID 133720)
-- Name: cd_aguas_pk; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cd_aguas
    ADD CONSTRAINT cd_aguas_pk PRIMARY KEY (cd_aguas_pk);


--
-- TOC entry 2036 (class 2606 OID 133656)
-- Name: cd_aptos_pk; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cd_aptos
    ADD CONSTRAINT cd_aptos_pk PRIMARY KEY (cd_aptos_pk);


--
-- TOC entry 2050 (class 2606 OID 133709)
-- Name: cd_chequeras_pk; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cd_chequeras
    ADD CONSTRAINT cd_chequeras_pk PRIMARY KEY (cd_chequeras_pk);


--
-- TOC entry 2044 (class 2606 OID 133688)
-- Name: cd_conceptos_pk; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cd_conceptos
    ADD CONSTRAINT cd_conceptos_pk PRIMARY KEY (cd_conceptos_pk);


--
-- TOC entry 2034 (class 2606 OID 133624)
-- Name: cd_conjuntos_pk; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cd_conjuntos
    ADD CONSTRAINT cd_conjuntos_pk PRIMARY KEY (cd_conjuntos_pk);


--
-- TOC entry 2038 (class 2606 OID 133664)
-- Name: cd_deudas_pk; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cd_deudas
    ADD CONSTRAINT cd_deudas_pk PRIMARY KEY (cd_deudas_pk);


--
-- TOC entry 2068 (class 2606 OID 230057)
-- Name: cd_edificios_pk; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cd_edificios
    ADD CONSTRAINT cd_edificios_pk PRIMARY KEY (cd_edificios_pk);


--
-- TOC entry 2040 (class 2606 OID 133672)
-- Name: cd_fondos_pk; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cd_fondos
    ADD CONSTRAINT cd_fondos_pk PRIMARY KEY (cd_fondos_pk);


--
-- TOC entry 2042 (class 2606 OID 133680)
-- Name: cd_historicos_pk; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cd_historicos
    ADD CONSTRAINT cd_historicos_pk PRIMARY KEY (cd_historicos_pk);


--
-- TOC entry 2032 (class 2606 OID 133616)
-- Name: cd_mantenimientos_pk; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cd_mantenimientos
    ADD CONSTRAINT cd_mantenimientos_pk PRIMARY KEY (cd_mantenimientos_pk);


--
-- TOC entry 2048 (class 2606 OID 133701)
-- Name: cd_mov_chequeras_pk; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cd_mov_chequeras
    ADD CONSTRAINT cd_mov_chequeras_pk PRIMARY KEY (cd_mov_chequeras_pk);


--
-- TOC entry 2046 (class 2606 OID 133693)
-- Name: cd_mov_mes_pk; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cd_mov_mes
    ADD CONSTRAINT cd_mov_mes_pk PRIMARY KEY (cd_mov_mes_pk);


--
-- TOC entry 2030 (class 2606 OID 133608)
-- Name: cd_observaciones_pk; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cd_observaciones
    ADD CONSTRAINT cd_observaciones_pk PRIMARY KEY (cd_observaciones_pk);


--
-- TOC entry 2066 (class 2606 OID 230040)
-- Name: cd_propietarios_pk; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cd_propietarios
    ADD CONSTRAINT cd_propietarios_pk PRIMARY KEY (cd_propietarios_pk);


--
-- TOC entry 2028 (class 2606 OID 133600)
-- Name: cd_proveedores_pk; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cd_proveedores
    ADD CONSTRAINT cd_proveedores_pk PRIMARY KEY (cd_proveedores_pk);


--
-- TOC entry 2058 (class 2606 OID 205453)
-- Name: menu_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (id);


--
-- TOC entry 2054 (class 2606 OID 139909)
-- Name: migration_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY migration
    ADD CONSTRAINT migration_pkey PRIMARY KEY (version);


--
-- TOC entry 2062 (class 2606 OID 213648)
-- Name: operaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY operaciones
    ADD CONSTRAINT operaciones_pkey PRIMARY KEY (id);


--
-- TOC entry 2064 (class 2606 OID 213658)
-- Name: roles_operaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY roles_operaciones
    ADD CONSTRAINT roles_operaciones_pkey PRIMARY KEY (rol_id, operacion_id);


--
-- TOC entry 2060 (class 2606 OID 213640)
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 2056 (class 2606 OID 189084)
-- Name: user_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 2083 (class 2606 OID 133826)
-- Name: cd_aptos_cd_aguas_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_aguas
    ADD CONSTRAINT cd_aptos_cd_aguas_fk FOREIGN KEY (cod_apto) REFERENCES cd_aptos(cd_aptos_pk);


--
-- TOC entry 2070 (class 2606 OID 133811)
-- Name: cd_aptos_cd_deudas_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_deudas
    ADD CONSTRAINT cd_aptos_cd_deudas_fk FOREIGN KEY (cod_apto) REFERENCES cd_aptos(cd_aptos_pk);


--
-- TOC entry 2074 (class 2606 OID 133821)
-- Name: cd_aptos_cd_historicos_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_historicos
    ADD CONSTRAINT cd_aptos_cd_historicos_fk FOREIGN KEY (cod_apto) REFERENCES cd_aptos(cd_aptos_pk);


--
-- TOC entry 2077 (class 2606 OID 133816)
-- Name: cd_aptos_cd_mov_mes_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_mov_mes
    ADD CONSTRAINT cd_aptos_cd_mov_mes_fk FOREIGN KEY (cod_apto) REFERENCES cd_aptos(cd_aptos_pk);


--
-- TOC entry 2080 (class 2606 OID 133836)
-- Name: cd_conceptos_cd_mov_chequeras_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_mov_chequeras
    ADD CONSTRAINT cd_conceptos_cd_mov_chequeras_fk FOREIGN KEY (cod_concepto) REFERENCES cd_conceptos(cd_conceptos_pk);


--
-- TOC entry 2078 (class 2606 OID 133841)
-- Name: cd_conceptos_cd_mov_mes_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_mov_mes
    ADD CONSTRAINT cd_conceptos_cd_mov_mes_fk FOREIGN KEY (cod_concepto) REFERENCES cd_conceptos(cd_conceptos_pk);


--
-- TOC entry 2082 (class 2606 OID 133761)
-- Name: cd_conjuntos_cd_aguas_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_aguas
    ADD CONSTRAINT cd_conjuntos_cd_aguas_fk FOREIGN KEY (cod_conjunto) REFERENCES cd_conjuntos(cd_conjuntos_pk) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2081 (class 2606 OID 133741)
-- Name: cd_conjuntos_cd_chequeras_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_chequeras
    ADD CONSTRAINT cd_conjuntos_cd_chequeras_fk FOREIGN KEY (cod_conjunto) REFERENCES cd_conjuntos(cd_conjuntos_pk) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2069 (class 2606 OID 133756)
-- Name: cd_conjuntos_cd_deudas_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_deudas
    ADD CONSTRAINT cd_conjuntos_cd_deudas_fk FOREIGN KEY (cod_conjunto) REFERENCES cd_conjuntos(cd_conjuntos_pk) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2088 (class 2606 OID 230058)
-- Name: cd_conjuntos_cd_edificios_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_edificios
    ADD CONSTRAINT cd_conjuntos_cd_edificios_fk FOREIGN KEY (cod_conjunto) REFERENCES cd_conjuntos(cd_conjuntos_pk) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2071 (class 2606 OID 133746)
-- Name: cd_conjuntos_cd_fondos_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_fondos
    ADD CONSTRAINT cd_conjuntos_cd_fondos_fk FOREIGN KEY (cod_conjunto) REFERENCES cd_conjuntos(cd_conjuntos_pk) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2073 (class 2606 OID 133766)
-- Name: cd_conjuntos_cd_historicos_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_historicos
    ADD CONSTRAINT cd_conjuntos_cd_historicos_fk FOREIGN KEY (cod_conjunto) REFERENCES cd_conjuntos(cd_conjuntos_pk) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2076 (class 2606 OID 133736)
-- Name: cd_conjuntos_cd_mov_mes_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_mov_mes
    ADD CONSTRAINT cd_conjuntos_cd_mov_mes_fk FOREIGN KEY (cod_conjunto) REFERENCES cd_conjuntos(cd_conjuntos_pk);


--
-- TOC entry 2075 (class 2606 OID 133831)
-- Name: cd_deudas_cd_historicos_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_historicos
    ADD CONSTRAINT cd_deudas_cd_historicos_fk FOREIGN KEY (cod_deuda) REFERENCES cd_deudas(cd_deudas_pk);


--
-- TOC entry 2072 (class 2606 OID 133726)
-- Name: cd_observaciones_cd_historicos_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_historicos
    ADD CONSTRAINT cd_observaciones_cd_historicos_fk FOREIGN KEY (cod_observacion) REFERENCES cd_observaciones(cd_observaciones_pk);


--
-- TOC entry 2079 (class 2606 OID 133721)
-- Name: cd_proveedores_cd_mov_chequeras_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_mov_chequeras
    ADD CONSTRAINT cd_proveedores_cd_mov_chequeras_fk FOREIGN KEY (cod_proveedor) REFERENCES cd_proveedores(cd_proveedores_pk);


--
-- TOC entry 2085 (class 2606 OID 205454)
-- Name: menu_parent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY menu
    ADD CONSTRAINT menu_parent_fkey FOREIGN KEY (parent) REFERENCES menu(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 2087 (class 2606 OID 221830)
-- Name: roles_operaciones_operaciones_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY roles_operaciones
    ADD CONSTRAINT roles_operaciones_operaciones_fkey FOREIGN KEY (operacion_id) REFERENCES operaciones(id) ON DELETE CASCADE;


--
-- TOC entry 2086 (class 2606 OID 221825)
-- Name: roles_operaciones_roles_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY roles_operaciones
    ADD CONSTRAINT roles_operaciones_roles_fkey FOREIGN KEY (rol_id) REFERENCES roles(id) ON DELETE CASCADE;


--
-- TOC entry 2084 (class 2606 OID 213669)
-- Name: roles_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT roles_user_fkey FOREIGN KEY (rol_id) REFERENCES roles(id);


-- Completed on 2016-06-30 11:19:45

--
-- PostgreSQL database dump complete
--

