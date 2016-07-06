--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.3
-- Dumped by pg_dump version 9.5.3

-- Started on 2016-07-04 19:15:27 VET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12433)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2436 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 79258)
-- Name: cd_aguas; Type: TABLE; Schema: public; Owner: -
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
-- TOC entry 182 (class 1259 OID 79264)
-- Name: cd_aguas_cd_aguas_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cd_aguas_cd_aguas_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2437 (class 0 OID 0)
-- Dependencies: 182
-- Name: cd_aguas_cd_aguas_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cd_aguas_cd_aguas_pk_seq OWNED BY cd_aguas.cd_aguas_pk;


--
-- TOC entry 183 (class 1259 OID 79266)
-- Name: cd_aptos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cd_aptos (
    cd_aptos_pk character varying(3) NOT NULL,
    cod_propietario smallint NOT NULL,
    cod_edificio smallint NOT NULL
);


--
-- TOC entry 184 (class 1259 OID 79269)
-- Name: cd_chequeras; Type: TABLE; Schema: public; Owner: -
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
-- TOC entry 185 (class 1259 OID 79272)
-- Name: cd_chequeras_cd_chequeras_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cd_chequeras_cd_chequeras_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2438 (class 0 OID 0)
-- Dependencies: 185
-- Name: cd_chequeras_cd_chequeras_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cd_chequeras_cd_chequeras_pk_seq OWNED BY cd_chequeras.cd_chequeras_pk;


--
-- TOC entry 186 (class 1259 OID 79274)
-- Name: cd_conceptos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cd_conceptos (
    cd_conceptos_pk smallint NOT NULL,
    descrip_concepto character varying(100) NOT NULL,
    tipo character varying(1) NOT NULL,
    frecuencia integer NOT NULL
);


--
-- TOC entry 187 (class 1259 OID 79277)
-- Name: cd_conceptos_cd_conceptos_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cd_conceptos_cd_conceptos_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2439 (class 0 OID 0)
-- Dependencies: 187
-- Name: cd_conceptos_cd_conceptos_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cd_conceptos_cd_conceptos_pk_seq OWNED BY cd_conceptos.cd_conceptos_pk;


--
-- TOC entry 188 (class 1259 OID 79279)
-- Name: cd_conjuntos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cd_conjuntos (
    cd_conjuntos_pk smallint NOT NULL,
    nombre character varying(50) NOT NULL,
    direccion character varying(150) NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 79282)
-- Name: cd_conjuntos_cd_conjuntos_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cd_conjuntos_cd_conjuntos_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2440 (class 0 OID 0)
-- Dependencies: 189
-- Name: cd_conjuntos_cd_conjuntos_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cd_conjuntos_cd_conjuntos_pk_seq OWNED BY cd_conjuntos.cd_conjuntos_pk;


--
-- TOC entry 190 (class 1259 OID 79284)
-- Name: cd_deudas; Type: TABLE; Schema: public; Owner: -
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
-- TOC entry 191 (class 1259 OID 79287)
-- Name: cd_deudas_cd_deudas_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cd_deudas_cd_deudas_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2441 (class 0 OID 0)
-- Dependencies: 191
-- Name: cd_deudas_cd_deudas_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cd_deudas_cd_deudas_pk_seq OWNED BY cd_deudas.cd_deudas_pk;


--
-- TOC entry 192 (class 1259 OID 79289)
-- Name: cd_edificios; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cd_edificios (
    cd_edificios_pk smallint NOT NULL,
    cod_conjunto smallint NOT NULL,
    nombre_edificio character varying(20) DEFAULT 'N/A'::character varying NOT NULL,
    nombre_concerje character varying(30) DEFAULT 'N/A'::character varying NOT NULL,
    telf_concerje numeric(11,0) DEFAULT 0 NOT NULL,
    porcentaje_nro1 numeric(10,4) DEFAULT 0 NOT NULL,
    email character varying(256) DEFAULT 'N/A'::character varying,
    porcentaje_nro2 numeric(10,4) DEFAULT 0 NOT NULL,
    agua numeric(10,4) DEFAULT 0,
    fondo_nro1 numeric DEFAULT 0 NOT NULL,
    fondo_nro2 numeric DEFAULT 0 NOT NULL,
    fondo_nro3 numeric DEFAULT 0 NOT NULL,
    fondo_nro4 numeric DEFAULT 0 NOT NULL,
    fondo_nro5 numeric DEFAULT 0 NOT NULL,
    fondo_nro6 numeric DEFAULT 0 NOT NULL,
    fondo_nro7 numeric DEFAULT 0 NOT NULL,
    fondo_nro8 numeric DEFAULT 0 NOT NULL
);


--
-- TOC entry 193 (class 1259 OID 79301)
-- Name: cd_edificios_cd_edificios_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cd_edificios_cd_edificios_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2442 (class 0 OID 0)
-- Dependencies: 193
-- Name: cd_edificios_cd_edificios_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cd_edificios_cd_edificios_pk_seq OWNED BY cd_edificios.cd_edificios_pk;


--
-- TOC entry 194 (class 1259 OID 79303)
-- Name: cd_fondos; Type: TABLE; Schema: public; Owner: -
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
-- TOC entry 195 (class 1259 OID 79306)
-- Name: cd_fondos_cd_fondos_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cd_fondos_cd_fondos_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2443 (class 0 OID 0)
-- Dependencies: 195
-- Name: cd_fondos_cd_fondos_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cd_fondos_cd_fondos_pk_seq OWNED BY cd_fondos.cd_fondos_pk;


--
-- TOC entry 196 (class 1259 OID 79308)
-- Name: cd_historicos; Type: TABLE; Schema: public; Owner: -
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
-- TOC entry 197 (class 1259 OID 79311)
-- Name: cd_historicos_cd_historicos_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cd_historicos_cd_historicos_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2444 (class 0 OID 0)
-- Dependencies: 197
-- Name: cd_historicos_cd_historicos_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cd_historicos_cd_historicos_pk_seq OWNED BY cd_historicos.cd_historicos_pk;


--
-- TOC entry 198 (class 1259 OID 79313)
-- Name: cd_mantenimientos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cd_mantenimientos (
    cd_mantenimientos_pk smallint NOT NULL,
    correlativo real NOT NULL
);


--
-- TOC entry 199 (class 1259 OID 79316)
-- Name: cd_mantenimientos_cd_mantenimientos_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cd_mantenimientos_cd_mantenimientos_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2445 (class 0 OID 0)
-- Dependencies: 199
-- Name: cd_mantenimientos_cd_mantenimientos_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cd_mantenimientos_cd_mantenimientos_pk_seq OWNED BY cd_mantenimientos.cd_mantenimientos_pk;


--
-- TOC entry 200 (class 1259 OID 79318)
-- Name: cd_mov_chequeras; Type: TABLE; Schema: public; Owner: -
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
-- TOC entry 201 (class 1259 OID 79324)
-- Name: cd_mov_mes; Type: TABLE; Schema: public; Owner: -
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
-- TOC entry 202 (class 1259 OID 79327)
-- Name: cd_observaciones; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cd_observaciones (
    cd_observaciones_pk smallint NOT NULL,
    descripcion character varying(300) NOT NULL
);


--
-- TOC entry 203 (class 1259 OID 79330)
-- Name: cd_observaciones_cd_observaciones_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cd_observaciones_cd_observaciones_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2446 (class 0 OID 0)
-- Dependencies: 203
-- Name: cd_observaciones_cd_observaciones_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cd_observaciones_cd_observaciones_pk_seq OWNED BY cd_observaciones.cd_observaciones_pk;


--
-- TOC entry 217 (class 1259 OID 79648)
-- Name: cd_propietarios; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cd_propietarios (
    cd_propietarios_pk smallint NOT NULL,
    cod_user smallint DEFAULT 0,
    nro_piso character varying(5) DEFAULT 'N/A'::character varying NOT NULL,
    nombre character varying(30) DEFAULT 'N/A'::character varying,
    apellido character varying(30) DEFAULT 'N/A'::character varying,
    nro_cedula numeric(10,0) DEFAULT 0 NOT NULL,
    telf_local character varying(50) DEFAULT 'N/A'::character varying,
    telf_celular character varying(50) DEFAULT 'N/A'::character varying,
    fax character varying(15) DEFAULT 'N/A'::character varying,
    alicuota numeric(10,4) DEFAULT 0,
    quien_vive character varying(25) DEFAULT 'N/A'::character varying,
    direccion character varying(150) DEFAULT 'N/A'::character varying,
    direccion_cobro character varying(150) DEFAULT 'N/A'::character varying
);


--
-- TOC entry 216 (class 1259 OID 79646)
-- Name: cd_propietarios_cd_propietarios_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cd_propietarios_cd_propietarios_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2447 (class 0 OID 0)
-- Dependencies: 216
-- Name: cd_propietarios_cd_propietarios_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cd_propietarios_cd_propietarios_pk_seq OWNED BY cd_propietarios.cd_propietarios_pk;


--
-- TOC entry 204 (class 1259 OID 79342)
-- Name: cd_proveedores; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cd_proveedores (
    cd_proveedores_pk smallint NOT NULL,
    razon_social character varying(35) NOT NULL,
    beneficiario character varying(35) NOT NULL
);


--
-- TOC entry 205 (class 1259 OID 79345)
-- Name: cd_proveedores_cd_proveedores_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cd_proveedores_cd_proveedores_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2448 (class 0 OID 0)
-- Dependencies: 205
-- Name: cd_proveedores_cd_proveedores_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cd_proveedores_cd_proveedores_pk_seq OWNED BY cd_proveedores.cd_proveedores_pk;


--
-- TOC entry 206 (class 1259 OID 79347)
-- Name: menu; Type: TABLE; Schema: public; Owner: -
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
-- TOC entry 207 (class 1259 OID 79353)
-- Name: menu_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2449 (class 0 OID 0)
-- Dependencies: 207
-- Name: menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE menu_id_seq OWNED BY menu.id;


--
-- TOC entry 208 (class 1259 OID 79355)
-- Name: migration; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migration (
    version character varying(180) NOT NULL,
    apply_time integer
);


--
-- TOC entry 209 (class 1259 OID 79358)
-- Name: operaciones; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE operaciones (
    id integer NOT NULL,
    nombre character varying(64) NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 79361)
-- Name: operaciones_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE operaciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2450 (class 0 OID 0)
-- Dependencies: 210
-- Name: operaciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE operaciones_id_seq OWNED BY operaciones.id;


--
-- TOC entry 211 (class 1259 OID 79363)
-- Name: roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE roles (
    id integer NOT NULL,
    nombre character varying(32) NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 79366)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2451 (class 0 OID 0)
-- Dependencies: 212
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- TOC entry 213 (class 1259 OID 79368)
-- Name: roles_operaciones; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE roles_operaciones (
    rol_id integer NOT NULL,
    operacion_id integer NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 79371)
-- Name: user; Type: TABLE; Schema: public; Owner: -
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
-- TOC entry 215 (class 1259 OID 79378)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2452 (class 0 OID 0)
-- Dependencies: 215
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE user_id_seq OWNED BY "user".id;


--
-- TOC entry 2174 (class 2604 OID 79380)
-- Name: cd_aguas_pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_aguas ALTER COLUMN cd_aguas_pk SET DEFAULT nextval('cd_aguas_cd_aguas_pk_seq'::regclass);


--
-- TOC entry 2175 (class 2604 OID 79381)
-- Name: cd_chequeras_pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_chequeras ALTER COLUMN cd_chequeras_pk SET DEFAULT nextval('cd_chequeras_cd_chequeras_pk_seq'::regclass);


--
-- TOC entry 2176 (class 2604 OID 79382)
-- Name: cd_conceptos_pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_conceptos ALTER COLUMN cd_conceptos_pk SET DEFAULT nextval('cd_conceptos_cd_conceptos_pk_seq'::regclass);


--
-- TOC entry 2177 (class 2604 OID 79383)
-- Name: cd_conjuntos_pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_conjuntos ALTER COLUMN cd_conjuntos_pk SET DEFAULT nextval('cd_conjuntos_cd_conjuntos_pk_seq'::regclass);


--
-- TOC entry 2178 (class 2604 OID 79384)
-- Name: cd_deudas_pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_deudas ALTER COLUMN cd_deudas_pk SET DEFAULT nextval('cd_deudas_cd_deudas_pk_seq'::regclass);


--
-- TOC entry 2185 (class 2604 OID 79385)
-- Name: cd_edificios_pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_edificios ALTER COLUMN cd_edificios_pk SET DEFAULT nextval('cd_edificios_cd_edificios_pk_seq'::regclass);


--
-- TOC entry 2195 (class 2604 OID 79386)
-- Name: cd_fondos_pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_fondos ALTER COLUMN cd_fondos_pk SET DEFAULT nextval('cd_fondos_cd_fondos_pk_seq'::regclass);


--
-- TOC entry 2196 (class 2604 OID 79387)
-- Name: cd_historicos_pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_historicos ALTER COLUMN cd_historicos_pk SET DEFAULT nextval('cd_historicos_cd_historicos_pk_seq'::regclass);


--
-- TOC entry 2197 (class 2604 OID 79388)
-- Name: cd_mantenimientos_pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_mantenimientos ALTER COLUMN cd_mantenimientos_pk SET DEFAULT nextval('cd_mantenimientos_cd_mantenimientos_pk_seq'::regclass);


--
-- TOC entry 2201 (class 2604 OID 79389)
-- Name: cd_observaciones_pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_observaciones ALTER COLUMN cd_observaciones_pk SET DEFAULT nextval('cd_observaciones_cd_observaciones_pk_seq'::regclass);


--
-- TOC entry 2208 (class 2604 OID 79651)
-- Name: cd_propietarios_pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_propietarios ALTER COLUMN cd_propietarios_pk SET DEFAULT nextval('cd_propietarios_cd_propietarios_pk_seq'::regclass);


--
-- TOC entry 2202 (class 2604 OID 79392)
-- Name: cd_proveedores_pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_proveedores ALTER COLUMN cd_proveedores_pk SET DEFAULT nextval('cd_proveedores_cd_proveedores_pk_seq'::regclass);


--
-- TOC entry 2203 (class 2604 OID 79393)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY menu ALTER COLUMN id SET DEFAULT nextval('menu_id_seq'::regclass);


--
-- TOC entry 2204 (class 2604 OID 79394)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY operaciones ALTER COLUMN id SET DEFAULT nextval('operaciones_id_seq'::regclass);


--
-- TOC entry 2205 (class 2604 OID 79395)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- TOC entry 2207 (class 2604 OID 79396)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "user" ALTER COLUMN id SET DEFAULT nextval('user_id_seq'::regclass);


--
-- TOC entry 2393 (class 0 OID 79258)
-- Dependencies: 181
-- Data for Name: cd_aguas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cd_aguas (cd_aguas_pk, cod_apto, cod_conjunto, cod_edificio, lect_ant, lect_post) FROM stdin;
\.


--
-- TOC entry 2453 (class 0 OID 0)
-- Dependencies: 182
-- Name: cd_aguas_cd_aguas_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cd_aguas_cd_aguas_pk_seq', 1, false);


--
-- TOC entry 2395 (class 0 OID 79266)
-- Dependencies: 183
-- Data for Name: cd_aptos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cd_aptos (cd_aptos_pk, cod_propietario, cod_edificio) FROM stdin;
141	7	1
092	8	1
158	16	1
123	31	1
063	33	1
097	38	1
133	41	1
052	42	1
096	60	1
087	62	1
157	63	1
035	65	1
131	67	1
105	71	1
073	72	1
127	73	1
057	74	1
031	81	1
033	100	1
117	112	1
022	113	1
062	114	1
103	128	1
088	130	1
167	143	1
045	160	1
113	170	1
024	179	1
015	180	1
154	212	1
094	218	1
114	264	1
137	276	1
038	278	1
037	288	1
056	318	1
044	414	1
012	425	1
016	429	1
054	439	1
011	457	1
144	458	1
086	463	1
046	489	1
168	496	1
155	511	1
067	527	1
084	541	1
162	545	1
036	547	1
083	549	1
164	550	1
081	554	1
145	565	1
142	575	1
118	581	1
017	591	1
074	623	1
151	628	1
041	629	1
124	635	1
095	643	1
018	661	1
047	662	1
013	684	1
161	692	1
042	710	1
116	711	1
106	714	1
085	715	1
163	719	1
098	721	1
071	725	1
072	742	1
093	749	1
061	766	1
021	780	1
053	787	1
102	794	1
PH	795	1
165	803	1
148	813	1
112	826	1
108	837	1
091	839	1
134	857	1
078	867	1
132	868	1
125	878	1
055	890	1
122	907	1
076	911	1
077	927	1
043	948	1
026	951	1
027	996	1
066	998	1
028	1000	1
068	1003	1
146	1004	1
115	1006	1
025	1020	1
107	1043	1
104	1051	1
152	1075	1
034	1143	1
128	1152	1
153	1156	1
064	1180	1
121	1224	1
156	1232	1
048	1279	1
143	1282	1
058	1307	1
111	1309	1
138	1333	1
101	1365	1
136	1370	1
147	1372	1
075	1408	1
023	1431	1
166	1478	1
065	1496	1
126	1500	1
014	1520	1
135	1528	1
082	1531	1
051	1541	1
032	1547	1
104	14	2
136	43	2
066	50	2
075	57	2
017	69	2
135	103	2
022	105	2
085	135	2
067	140	2
023	150	2
013	152	2
078	176	2
054	177	2
156	185	2
086	204	2
127	209	2
152	215	2
128	260	2
137	261	2
087	265	2
094	268	2
102	274	2
051	280	2
024	289	2
033	290	2
162	295	2
147	299	2
083	321	2
014	363	2
018	383	2
158	408	2
084	415	2
143	421	2
105	431	2
163	440	2
098	453	2
164	454	2
042	465	2
161	466	2
035	471	2
154	493	2
064	524	2
052	529	2
122	530	2
151	531	2
057	538	2
167	540	2
043	566	2
PH	573	2
032	582	2
138	589	2
106	590	2
073	606	2
055	615	2
114	637	2
068	638	2
134	686	2
166	697	2
065	707	2
036	712	2
145	713	2
015	729	2
123	734	2
045	735	2
124	752	2
125	762	2
091	784	2
118	790	2
092	800	2
034	801	2
168	869	2
116	885	2
117	886	2
101	892	2
011	893	2
076	904	2
058	905	2
115	937	2
031	940	2
044	941	2
112	950	2
016	966	2
121	985	2
148	987	2
093	995	2
103	997	2
037	1001	2
048	1005	2
063	1018	2
133	1022	2
056	1047	2
038	1049	2
028	1053	2
132	1092	2
082	1098	2
074	1102	2
141	1131	2
153	1136	2
144	1150	2
165	1151	2
097	1177	2
155	1207	2
072	1210	2
088	1221	2
111	1240	2
046	1261	2
142	1276	2
047	1292	2
012	1298	2
107	1300	2
126	1302	2
146	1310	2
021	1316	2
027	1340	2
053	1362	2
081	1369	2
096	1384	2
026	1421	2
131	1433	2
077	1450	2
108	1472	2
095	1477	2
071	1480	2
062	1491	2
113	1492	2
157	1514	2
025	1517	2
041	1537	2
061	1542	2
P21	2	3
P06	24	3
M1	75	3
B01	76	3
B02	77	3
P13	78	3
P03	79	3
P04	80	3
P26	144	3
P27	174	3
P10	175	3
B05	184	3
B03	187	3
B04	188	3
412	266	3
P09	357	3
P29	360	3
P31	361	3
M7	432	3
404	434	3
402	464	3
403	495	3
411	508	3
P32	532	3
P28	585	3
P23	656	3
N25	672	3
DEF	673	3
N21	674	3
N22	675	3
N23	676	3
N24	677	3
N26	678	3
O1	679	3
P20	693	3
P07	694	3
P33	698	3
P38	699	3
P39	700	3
P42	701	3
P43	702	3
P44	703	3
P35	704	3
M6	705	3
P24	709	3
P16	716	3
P18	717	3
P22	732	3
P14	738	3
P41	802	3
407	859	3
P37	883	3
405	903	3
M3	912	3
P05	938	3
406	946	3
EST	984	3
413	992	3
401	999	3
P36	1002	3
P02	1081	3
P12	1139	3
M4	1163	3
M5	1164	3
N27	1165	3
N28	1166	3
M2	1208	3
P19	1231	3
408	1237	3
P08	1283	3
409	1294	3
P15	1296	3
P17	1299	3
P11	1336	3
410	1378	3
P30	1391	3
P45	1463	3
P25	1467	3
P40	1470	3
P34	1471	3
P01	1473	3
06C	23	6
PB1	29	6
09C	46	6
15C	66	6
16D	98	6
14D	102	6
02B	104	6
07B	111	6
06D	123	6
12A	124	6
01B	132	6
18A	138	6
04C	164	6
15D	172	6
03C	173	6
13C	270	6
06A	271	6
09A	272	6
14A	291	6
09D	296	6
16B	355	6
10B	377	6
03B	380	6
08D	451	6
05A	481	6
10D	490	6
11B	501	6
18C	546	6
07A	548	6
05B	568	6
01C	583	6
08B	587	6
01D	588	6
04A	688	6
14C	736	6
15A	757	6
15B	761	6
16C	769	6
03A	782	6
04B	796	6
18D	804	6
06B	830	6
09B	831	6
05C	833	6
07D	847	6
01A	849	6
12D	860	6
05D	884	6
08C	900	6
10C	915	6
02C	947	6
16A	974	6
02A	994	6
17A	1088	6
07C	1091	6
12B	1132	6
13D	1133	6
17D	1134	6
08A	1137	6
04D	1159	6
03D	1160	6
11D	1170	6
02D	1209	6
17B	1326	6
11C	1330	6
13A	1386	6
10A	1400	6
12C	1404	6
11A	1413	6
18B	1475	6
14B	1493	6
13B	1501	6
17C	1526	6
031	367	7
032	473	7
061	514	7
022	517	7
PH	592	7
072	648	7
051	718	7
071	730	7
042	733	7
012	850	7
011	872	7
021	957	7
041	1073	7
052	1396	7
062	1507	7
3C	1	8
1B	51	8
2A	326	8
4C	369	8
2C	690	8
3A	799	8
4A	841	8
3B	852	8
5B	935	8
4B	990	8
PH	1227	8
5A	1229	8
1C	1241	8
MEZ	1250	8
2B	1303	8
5C	1339	8
1A	1513	8
14A	6	9
14B	13	9
12B	92	9
15A	211	9
32A	262	9
13A	263	9
11A	292	9
33B	356	9
34B	364	9
32B	513	9
35B	609	9
11B	644	9
2PH	668	9
17A	731	9
37A	744	9
33A	765	9
22B	778	9
3PH	783	9
16B	864	9
31B	910	9
15B	921	9
24B	934	9
25B	949	9
1PH	956	9
36A	1016	9
26A	1026	9
25A	1032	9
31A	1076	9
36B	1146	9
13B	1147	9
27B	1173	9
23A	1215	9
23B	1235	9
21A	1249	9
16A	1277	9
26B	1306	9
27A	1341	9
34A	1355	9
12A	1364	9
17B	1375	9
22A	1377	9
35A	1490	9
37B	1524	9
24A	1536	9
21B	1548	9
10	95	10
11	96	10
16	120	10
12	232	10
13	233	10
03	273	10
05	381	10
14	422	10
17	433	10
02	436	10
22	539	10
08	671	10
21	846	10
09	895	10
24	936	10
15	976	10
06	1149	10
01	1162	10
18	1202	10
23	1274	10
20	1356	10
04	1379	10
19	1428	10
07	1437	10
PB	119	11
4B	223	11
4A	286	11
6B	384	11
2B	639	11
PH	669	11
3A	754	11
1B	811	11
2A	944	11
6A	1089	11
5A	1140	11
5B	1167	11
1A	1172	11
3B	1222	11
1A	121	12
1B	214	12
8A	277	12
3A	358	12
PH	370	12
5B	509	12
7B	663	12
9B	724	12
8B	737	12
2B	879	12
5A	1030	12
4A	1041	12
6B	1066	12
9A	1176	12
3B	1325	12
6A	1389	12
2A	1439	12
4B	1469	12
7A	1487	12
C-5	116	13
D-5	166	13
C-2	519	13
B-3	666	13
D-3	682	13
D-1	746	13
B-1	788	13
A-4	929	13
A-1	955	13
B-2	1023	13
A-2	1038	13
A-3	1039	13
C-4	1040	13
D-2	1093	13
C-3	1094	13
B-4	1200	13
D-4	1423	13
C-1	1438	13
PHA	126	14
2B	137	14
4B	169	14
PHB	298	14
PB	607	14
1A	624	14
3B	626	14
3A	708	14
1B	882	14
2A	1029	14
4A	1142	14
1A	109	15
3A	477	15
1B	569	15
5B	689	15
2B	820	15
2A	942	15
4A	1031	15
4B	1062	15
PH	1269	15
PB	1271	15
3B	1527	15
23	10	17
41	68	17
93	225	17
22	375	17
51	393	17
32	397	17
61	398	17
43	399	17
103	401	17
91	424	17
42	577	17
73	667	17
72	968	17
101	1057	17
11	1071	17
53	1074	17
102	1077	17
13	1154	17
33	1186	17
63	1187	17
62	1253	17
31	1273	17
21	1321	17
82	1344	17
83	1358	17
71	1360	17
81	1443	17
52	1482	17
92	1484	17
12	1516	17
PH	1535	17
101	11	18
071	134	18
PH	181	18
032	190	18
011	213	18
051	221	18
091	226	18
021	228	18
012	255	18
061	320	18
072	347	18
052	390	18
041	392	18
LOC	410	18
042	512	18
102	520	18
081	1084	18
022	1141	18
031	1182	18
092	1189	18
082	1267	18
062	1415	18
03	312	19
02	616	19
01	1194	19
04	1432	19
101	47	20
11	90	20
62	118	20
81	122	20
12	469	20
102	516	20
112	536	20
71	555	20
41	747	20
21	755	20
111	758	20
PH	810	20
82	816	20
32	819	20
92	959	20
22	969	20
LCA	1061	20
42	1130	20
91	1144	20
51	1258	20
72	1268	20
31	1311	20
52	1522	20
61	1533	20
LCB	91	21
44	136	21
34	159	21
SOT	171	21
24	254	21
23	435	21
13	456	21
14	461	21
74	608	21
43	720	21
63	805	21
84	925	21
93	983	21
103	1024	21
94	1027	21
73	1054	21
64	1099	21
83	1171	21
104	1313	21
54	1407	21
33	1461	21
53	1476	21
1-N	18	22
4-N	34	22
3-L	35	22
1-B	44	22
2-I	127	22
2-L	131	22
PBD	245	22
2-D	303	22
2-N	306	22
3-A	382	22
4-F	385	22
2-C	409	22
1-F	418	22
1-G	428	22
1-C	444	22
1-D	445	22
1-E	446	22
1-H	447	22
PBB	448	22
PBC	449	22
PBE	450	22
2-E	452	22
2-H	502	22
2MT	503	22
3MT	504	22
4-A	571	22
4-B	572	22
2-F	579	22
2-B	584	22
3-B	660	22
6MT	695	22
7MT	696	22
1-L	727	22
4-C	739	22
4-D	740	22
5MT	741	22
PHB	753	22
1-A	779	22
1-I	807	22
3-C	823	22
PBF	851	22
2-G	855	22
PHA	917	22
3-G	954	22
3-I	965	22
3-N	980	22
PBA	1015	22
3-H	1058	22
3-E	1184	22
2-A	1251	22
3-F	1275	22
1-M	1291	22
3-D	1343	22
3-M	1380	22
4MT	1385	22
4-E	1392	22
4-G	1427	22
1MT	1509	22
2-M	1518	22
4-H	1543	22
4-I	1544	22
4-L	1545	22
4-M	1546	22
428	15	23
435	19	23
440	21	23
115	49	23
413	53	23
325	55	23
112	64	23
04A	84	23
103	110	23
430	117	23
320	202	23
437	230	23
403	283	23
205	285	23
218	297	23
201	302	23
108	304	23
102	348	23
421	350	23
422	351	23
301	352	23
203	379	23
109	406	23
202	437	23
215	460	23
318	474	23
220	476	23
436	479	23
111	480	23
105	484	23
116	515	23
433	518	23
322	534	23
113	542	23
412	612	23
204	614	23
213	619	23
410	625	23
216	632	23
206	642	23
404	654	23
414	726	23
212	728	23
305	751	23
302	756	23
411	772	23
310	776	23
416	786	23
316	806	23
210	808	23
315	824	23
208	856	23
307	898	23
101	902	23
417	924	23
401	939	23
423	960	23
306	964	23
438	978	23
313	982	23
303	986	23
420	988	23
317	1010	23
419	1017	23
424	1019	23
439	1034	23
311	1050	23
326	1052	23
219	1056	23
110	1096	23
114	1100	23
214	1129	23
104	1178	23
409	1183	23
431	1223	23
426	1245	23
207	1247	23
415	1248	23
312	1266	23
402	1281	23
321	1289	23
309	1297	23
107	1315	23
217	1329	23
429	1338	23
434	1347	23
211	1352	23
418	1353	23
03A	1363	23
324	1405	23
209	1425	23
323	1429	23
319	1430	23
405	1445	23
406	1446	23
407	1447	23
408	1448	23
106	1474	23
304	1489	23
308	1503	23
427	1505	23
425	1506	23
314	1521	23
432	1534	23
1B	157	24
4B	196	24
5B	219	24
7C	284	24
7A	294	24
8C	319	24
6B	368	24
6C	478	24
5A	500	24
4A	620	24
1A	815	24
2B	834	24
3A	835	24
2A	844	24
8B	889	24
4C	909	24
2C	933	24
5C	971	24
8A	1065	24
3B	1111	24
3C	1112	24
6A	1206	24
1C	1244	24
7B	1260	24
222	5	25
352	22	25
215	26	25
254	32	25
244	54	25
223	56	25
255	61	25
124	85	25
131	86	25
261	87	25
521	93	25
331	147	25
311	153	25
213	158	25
523	192	25
461	222	25
561	241	25
231	252	25
134	267	25
241	281	25
262	300	25
442	307	25
232	310	25
21	311	25
133	313	25
522	340	25
135	359	25
153	366	25
152	373	25
143	388	25
221	389	25
234	391	25
462	394	25
233	404	25
154	412	25
245	423	25
112	427	25
253	459	25
243	543	25
142	551	25
264	558	25
361	563	25
553	596	25
543	599	25
224	601	25
341	603	25
164	618	25
472	646	25
121	651	25
562	743	25
251	768	25
214	887	25
155	899	25
512	962	25
225	963	25
115	1012	25
23	1021	25
125	1083	25
113	1105	25
252	1110	25
242	1126	25
572	1148	25
114	1179	25
531	1191	25
532	1192	25
542	1217	25
122	1254	25
513	1256	25
533	1257	25
11	1263	25
12	1272	25
144	1280	25
563	1284	25
351	1286	25
123	1288	25
132	1327	25
22	1337	25
165	1354	25
312	1376	25
235	1411	25
212	1420	25
332	1465	25
111	1466	25
211	1481	25
141	1486	25
451	1495	25
541	1523	25
161	1525	25
145	1530	25
162	1539	25
3	250	26
7	349	26
12	417	26
22	475	26
LA	526	26
6	528	26
21	535	26
16	789	26
9	792	26
14	798	26
15	809	26
LC	854	26
19	896	26
10	958	26
18	975	26
2	989	26
20	1028	26
11	1037	26
5	1045	26
8	1135	26
13	1199	26
17	1262	26
4	1351	26
LB	1395	26
LD	1452	26
A4A	217	27
A2B	246	27
A4B	309	27
A3B	371	27
PBA	559	27
A1B	664	27
A6B	683	27
A5B	838	27
A2A	930	27
A3A	1216	27
A5A	1317	27
A1A	1442	27
A6A	1460	27
B6A	129	28
B6B	154	28
B5A	207	28
B2B	234	28
PHB	374	28
B4B	386	28
B1A	420	28
PBB	497	28
B3B	523	28
B3A	576	28
B1B	828	28
B4A	1203	28
B2A	1424	28
B5B	1441	28
C3A	45	29
C5A	108	29
C5B	186	29
C6B	229	29
C6A	395	29
C1A	411	29
PBC	610	29
PHC	1044	29
C1B	1195	29
C2B	1320	29
C3B	1334	29
C4B	1382	29
C4A	1456	29
C2A	1488	29
D1B	189	30
D6B	216	30
D1A	242	30
D2A	372	30
D4A	595	30
D3A	600	30
D4B	866	30
PHD	931	30
D3B	1107	30
D6A	1128	30
D2B	1218	30
D5A	1226	30
D5B	1387	30
PBD	1402	30
E02	649	31
E01	1119	31
M02	650	32
M01	1120	32
042	83	33
021	203	33
082	220	33
011	314	33
052	376	33
072	387	33
062	403	33
051	617	33
031	647	33
092	880	33
022	923	33
091	967	33
112	1060	33
APH	1127	33
102	1155	33
101	1319	33
041	1322	33
081	1361	33
071	1383	33
032	1417	33
061	1453	33
111	1455	33
012	1512	33
12A	70	34
08B	82	34
11A	89	34
09B	182	34
12B	191	34
09A	194	34
PHB	227	34
11B	485	34
02B	602	34
06B	814	34
PHA	827	34
07B	865	34
07A	1063	34
03A	1072	34
10A	1106	34
01B	1125	34
05B	1188	34
05A	1225	34
06A	1264	34
04A	1346	34
03B	1366	34
01A	1374	34
02A	1418	34
10B	1485	34
08A	1508	34
04B	1519	34
092	162	35
051	200	35
111	248	35
042	305	35
021	365	35
BPH	400	35
102	482	35
011	521	35
082	645	35
052	922	35
091	1059	35
032	1116	35
081	1123	35
072	1157	35
101	1252	35
022	1305	35
031	1328	35
062	1332	35
061	1357	35
012	1401	35
041	1414	35
112	1449	35
071	1511	35
6	30	36
PH	101	36
4	492	36
9	564	36
1	655	36
3	770	36
8	781	36
2	861	36
7	1124	36
5	1479	36
P-H	9	37
094	12	37
101	99	37
143	155	37
041	205	37
073	206	37
033	208	37
142	224	37
012	249	37
063	251	37
011	257	37
111	301	37
102	316	37
L-3	323	37
L-4	324	37
L-5	325	37
051	396	37
052	402	37
103	405	37
034	443	37
071	510	37
042	557	37
053	562	37
082	604	37
113	630	37
062	640	37
081	641	37
133	767	37
134	845	37
112	888	37
044	916	37
021	972	37
132	981	37
031	1067	37
013	1070	37
022	1078	37
023	1079	37
024	1080	37
014	1101	37
123	1108	37
084	1115	37
144	1174	37
083	1190	37
121	1214	37
L-6	1219	37
L-7	1220	37
124	1228	37
064	1230	37
104	1236	37
032	1287	37
114	1301	37
054	1381	37
074	1388	37
122	1394	37
091	1397	37
093	1403	37
072	1454	37
061	1457	37
043	1483	37
092	1510	37
131	1529	37
141	1538	37
062	27	38
081	88	38
052	125	38
092	156	38
111	167	38
091	168	38
123	193	38
113	247	38
P-H	253	38
011	256	38
102	308	38
083	327	38
021	426	38
144	441	38
101	499	38
042	506	38
014	525	38
033	561	38
104	570	38
043	578	38
082	597	38
132	598	38
032	613	38
054	631	38
142	652	38
031	722	38
L-1	873	38
L-2	874	38
112	881	38
073	894	38
041	919	38
034	953	38
044	973	38
053	1064	38
131	1068	38
013	1069	38
134	1085	38
072	1113	38
012	1117	38
063	1121	38
022	1158	38
122	1175	38
143	1255	38
023	1265	38
133	1285	38
061	1318	38
051	1323	38
141	1324	38
103	1335	38
121	1342	38
124	1367	38
093	1412	38
114	1419	38
064	1440	38
071	1444	38
084	1458	38
094	1459	38
024	1464	38
074	1549	38
431	3	39
322	328	39
321	329	39
421	330	39
13	331	39
163	332	39
265	333	39
342	334	39
362	335	39
372	336	39
441	337	39
471	338	39
511	339	39
551	341	39
552	342	39
571	343	39
573	344	39
PE	345	39
MA	346	39
263	863	39
371	871	39
422	1082	39
151	1118	39
452	1368	39
432	1416	39
7	36	40
6	37	40
8	416	40
4	483	40
9	505	40
3	556	40
1	773	40
2	775	40
PH	1011	40
10	1198	40
12	1201	40
11	1348	40
5	1436	40
3B	59	41
2C	198	41
5A	231	41
L1	258	41
L2	259	41
L6	322	41
2B	522	41
3A	560	41
5C	594	41
4C	605	41
L3	680	41
L5	681	41
1A	774	41
1B	875	41
L4	877	41
3C	1145	41
2A	1153	41
4A	1196	41
4B	1197	41
5B	1233	41
PH	1390	41
1C	1398	41
12C	20	42
23B	148	42
13E	165	42
11A	235	42
13D	236	42
21E	237	42
31B	238	42
31D	239	42
PE	240	42
PE1	244	42
11D	269	42
31A	354	42
13B	552	42
13C	553	42
11C	586	42
22A	627	42
32B	670	42
13A	691	42
11B	706	42
22B	777	42
31C	817	42
12A	818	42
23C	891	42
12B	970	42
21B	1055	42
23E	1095	42
23D	1097	42
23A	1185	42
33C	1193	42
33B	1234	42
21A	1238	42
21C	1290	42
32A	1308	42
33A	1373	42
11E	1410	42
21D	1451	42
33D	1462	42
22C	1515	42
22	17	43
74	28	43
23	52	43
54	115	43
14	142	43
92	195	43
123	199	43
104	201	43
112	279	43
122	287	43
64	293	43
94	407	43
72	430	43
73	455	43
24	467	43
41	468	43
61	472	43
81	486	43
33	491	43
31	537	43
12	611	43
103	622	43
43	636	43
102	658	43
83	659	43
51	750	43
13	763	43
11	821	43
21	822	43
52	829	43
111	836	43
113	843	43
44	897	43
42	901	43
62	952	43
124	1025	43
34	1033	43
114	1042	43
63	1103	43
101	1104	43
91	1109	43
71	1138	43
93	1314	43
121	1331	43
53	1406	43
82	1494	43
84	1497	43
32	1499	43
114	4	44
104	39	44
113	48	44
111	58	44
74	97	44
43	107	44
41	210	44
L4	243	44
101	275	44
31	315	44
92	317	44
122	353	44
103	378	44
44	413	44
72	419	44
124	470	44
12	574	44
84	653	44
121	685	44
64	745	44
94	759	44
34	791	44
L5	812	44
51	832	44
93	862	44
13	870	44
82	906	44
62	908	44
11	913	44
23	914	44
14	918	44
81	961	44
54	977	44
91	1009	44
83	1014	44
32	1046	44
42	1168	44
53	1169	44
63	1213	44
24	1246	44
L2	1270	44
33	1278	44
71	1345	44
52	1349	44
L3	1359	44
22	1393	44
123	1399	44
102	1409	44
112	1422	44
61	1498	44
21	1502	44
L1	1504	44
73	1532	44
\.


--
-- TOC entry 2396 (class 0 OID 79269)
-- Dependencies: 184
-- Data for Name: cd_chequeras; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cd_chequeras (cd_chequeras_pk, cod_conjunto, cod_edificio, nro_cuenta, monto, saldo) FROM stdin;
\.


--
-- TOC entry 2454 (class 0 OID 0)
-- Dependencies: 185
-- Name: cd_chequeras_cd_chequeras_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cd_chequeras_cd_chequeras_pk_seq', 1, false);


--
-- TOC entry 2398 (class 0 OID 79274)
-- Dependencies: 186
-- Data for Name: cd_conceptos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cd_conceptos (cd_conceptos_pk, descrip_concepto, tipo, frecuencia) FROM stdin;
1	% FINAL RECORTE DE GUAYAS DE 8 ASCENSORES	F	1
2	% INICIAL TRAB. DE ELECT. A. COMUNES Y CONSERJERIA  2 DE 2	F	1
3	% INICIAL TRAB. ELECT. TABLERO SALON DE FIESTA  2 DE 2	F	1
4	% MAT. + M. DE O + TRANSP.. DE LA BOMBA	F	1
5	% SUM-COL  TRANSF DEL ASCENSOR  + CABLEADO DEL MISMO  2  DE 2	F	1
6	4 CISTERNAS AGUA POTABLE Bs.10,000 CADA UNO ** CONTINGENCIA **	F	1
7	400 BOLSAS DE BASURA  3 DE 3	F	1
8	50% FINAL DOS PUERTAS  BASURERO ENTRADA ESTAC. 2  DE 2	F	1
9	50% INICIAL DEL ESTUDIO DEL TERRENO  4-5 DE 6	F	1
10	50% INICIAL PARA LA COLOCACION DE CAMARAS. 1 DE 2	F	1
11	500 BOLSAS DE BASURA  3 DE 3	F	1
12	60% SUM-COL CONTROL ACCESO ASCENSORES Y PUERTAS 3 DE 3	F	1
13	ABONO AL RECIBO NO EJECUTADO	V	2
14	ACACIAS	F	1
15	ACHIQUE DE AGUA DE FOSO DE ASCENSORES OCT-15 2 DE 2	F	1
16	ADELANTO DE TRABAJOS EN AREAS COMUES SOT-3	F	1
17	ADELANTO REP. ELECTRICAS EN EL EDIFICIO 3 DE 3	F	1
18	ADELANTO REPARACION DE ASCENSOR No. 2   2 DE 2	F	1
19	ADMINISTRADORA SERDECO	F	1
20	ADORNOS DE NAVIDAD	F	1
21	ADORNOS DE NAVIDAD Y LUCES DEL ARBOLITO DIC-2012	F	1
22	ADORNOS DE NAVIDAD Y MATAS DIC-2015 2 DE 2	F	1
23	ADORNOS NAVIDAD	F	1
24	ADQUISICION  CENTRAL DE INCENDIOS	F	1
25	AGUA BOTELLON ENERO - DIC. 2015 + 5 TARJ. RECARGA DE TELEF.	F	1
26	AGUA DE BOTELLON ENERO-MARZO-2016	F	1
27	AGUA DE LAS AREAS COMUNES	F	1
28	AGUINALDO ASEO URBANO	F	1
29	AGUINALDO ASEO URBANO  Y JARDINERO  DIC-2012	F	1
30	AGUINALDO ASEO URBANO, GAS Y CARTERO	F	1
31	AGUINALDO DEL CARTERO Y ASEO URBANO	F	1
32	AGUINALDO DEL CARTERO Y EL ASEO	F	1
33	AJUSTE AL FONDO DE RESERVA	F	1
35	ALFOMBRAS PARA ASCENSORES FEB-2016  2 DE 2	F	1
36	ALQ, DE PUESTO DE ESTAC. AREAS COMUNES  FEB-2016	V	2
37	ALQ, DE PUESTO DE ESTAC. AREAS COMUNES JUL-2015	V	2
38	ALQ. PUESTO ESTAC. AREAS COMUNES NOVBRE-2015	V	2
39	ALQ. PUESTO ESTAC.ADICIONAL AREAS COMUNES JUL-AGO 2012	V	2
40	ALQ. PUESTO ESTAC.ADICIONAL AREAS COMUNES MAY-JUN 2012	V	2
41	ALQ. SILLAS ASAMBLEA + COMPRA DE BANDERA Y ASTA	F	1
42	ALQ.PUESTO ESTAC. AREAS COMUNES  NOVIEMBRE-2015	V	2
43	ALQUILER DE MALETERO JULIO. 2010 - SEPT. 2010   3 DE 3	V	2
44	ALQUILER DE MALETERO JUN-2009 - ABRIL-2010	F	1
45	ALQUILER DE MALETEROS	V	1
46	ALQUILER DE MALETEROS NOVBRE-2015	V	2
47	ALQUILER DE MINICHOVER	F	1
48	ALQUILER DE PUESTO  ESTAC. 8 U.T.ABRIL-2016	V	2
49	ALQUILER DE PUESTO  ESTAC. 8 U.T.MARZO-2016	V	2
50	ALQUILER DE PUESTO DE ESTAC. A.COMUNES CARGADO POR ERROR	V	2
51	ALQUILER DE PUESTO DE ESTAC. ABRIL 2016	V	2
52	ALQUILER DE PUESTO DE ESTAC. FEBRERO 2016	V	2
53	ALQUILER DE PUESTO DE ESTAC. MAR-AGO-2015	V	2
54	ALQUILER DE PUESTO DE ESTAC. MES DE AGOSTO 2014	V	2
55	ALQUILER DE PUESTO DE ESTACIONAMIENTO AGO-SEPT.2008	V	2
56	ALQUILER DEL AREA DEL PARQUE  PARA REUNION INFANTIL	V	2
57	ALQUILER PUESTO DE ESTAC.  ABRIL-2016	V	2
58	ALQUILER PUESTO ESTAC. AREAS COM. MAY-JUNIO 2013	V	2
59	ALQUILER PUESTO ESTAC. AREAS COMUNES	V	1
60	ALQUILER PUESTO ESTAC. AREAS COMUNES 4UT= 177*4=708/2=354	V	1
61	APORTE AHORRO HABITACIONAL	F	1
62	APORTE ASOC. VEC. LLTH PARA VIGILANCIA Y JARD.ABRIL-16	F	1
63	APORTE EDIF. CANTV CONSERJ. ABRIL 2016	F	1
64	APORTE LEY DE POLITICA HABIT. TRAB. RES. ABRIL-2016	F	1
65	APORTE LEY POLITICA HABITACIONAL   04/2016	F	1
66	APORTE PARA LIMPIEZA DEL TANQUE DE LA URBANIZACION	F	1
67	APORTE PATRONAL IVSS	F	1
68	APORTE PATRONAL IVSS JUL-OCT 2011	F	1
69	APORTE VOLUNTARIO PARA  ASOALHA	V	2
70	ARCHIVADOR 1/2	F	1
71	ARCHIVADOR 2/2	F	1
80	ARREGLO DE LA PUERTA DEL CUARTO DE BASURA	F	1
81	ARTICULOS DE OFICINA	F	1
82	ARTICULOS DE OFICINA Y CAJA CHICA	F	1
83	ASOC. VEC. DE VALLE ALTO  BONIF. DE FIN DE A�O DIC-2008	F	1
84	ASOC.VEC VALLE ALTO AGOSTO  2013	F	1
85	AUTOMATIZACION ENCENDIDO Y APAGADO LUCES DE ESTAC	F	1
86	AVILEM	F	1
87	AVISO DE COBRANZA	V	2
88	B	F	1
89	BANAVIH 04/16	F	1
90	BOLSAS DE BASURA NOV-2015  3 DE 3	F	1
91	BOLSAS DE BASURA Y BOMBILLOS	F	1
92	BOMB REFLECT.+5 TRANSFORMADORES Y 30 DICRODIOS  2 DE 2	F	1
93	BOMBILLOS  (CCH)	F	1
94	BOMBILLOS Y LAMPARAS	F	1
95	BOMBILLOS Y MATERIAL ELECTRICO  MAR-15	F	1
72	ARREGLO BAÑO CONSERJERIA  PROP. 1  1 DE 7	V	2
73	ARREGLO BAÑO CONSERJERIA PROP. 1    1 DE 8	V	2
74	ARREGLO BAÑO DE LA CONSERJERIA  CUOTAS 10  DE 10	V	2
75	ARREGLO BAÑO DE LA CONSERJERIA  CUOTAS 10  DE 11	V	2
77	ARREGLO BAÑO DE LA CONSERJERIA  CUOTAS 6  DE 6	V	2
76	ARREGLO BAÑO DE LA CONSERJERIA  CUOTAS 10  DE 12	V	2
78	ARREGLO BAÑO DE LA CONSERJERIA  CUOTAS 7  DE 7	V	2
79	ARREGLO BAÑO DE LA CONSERJERIA  CUOTAS 8  DE 8	V	2
96	BONIF. FIN DE AÑO 2015 TRAB. RES. TORRES  2  Y  2	F	1
97	BONIFICACION DE FIN ADE AÑO 2015	F	1
99	BONIFICACION DE FIN DE AÑO 2010 2 DE 2	F	1
98	BONIFICACION DE FIN DE AÑO 2007	F	1
100	BONIFICACION DE FIN DE AÑO 2014	F	1
102	BONIFICACION DE FIN DE AÑO 2015   2 DE 2	F	1
101	BONIFICACION DE FIN DE AÑO 2015	F	1
103	BONIFICACION DE FIN DE AÑO 2015  2 DE 2	F	1
104	BONIFICACION DE FIN DE AÑO 2015  3 DE 3	F	1
105	BONIFICACION DE FIN DE AÑO 2016	F	1
108	BONIFICACION ESPECIAL 2015  2 DE 2	F	1
109	BONIFICACION ESPECIAL Y AGUINALDO 2015	F	1
113	BONO DE ALIMENTACION	F	1
114	BONO DE ALIMENTACION  04/2016	F	1
115	BONO DE ALIMENTACION 04/2016	F	1
116	BONO DE ALIMENTACION ABRIL 2016	F	1
117	BONO DE ALIMENTACION ABRIL-2016	F	1
121	BONO UTILES ESCOLARES	F	1
122	BONO VAC. DE LA TRAB. RESIDENCIAL  2013-2014  2 DE 2	F	1
123	BONO VAC. PERSONAL DE VIGILANCIA	F	1
124	BONO VACACIONAL	F	1
125	BONO VACACIONAL 2013-14  Y 2014-15 2 DE 2	F	1
126	BONO VACACIONAL 2014 - 2015	F	1
127	BONO VACACIONAL 2014-2015	F	1
128	BONO VACACIONAL DE LA CONSERJE 2010-2011	F	1
129	BONO VACACIONAL DE LA TRAB RES. 2014/2015	F	1
130	BONO VACACIONAL DE LA TRAB. RES. PERIODO 2011-2012	F	1
131	BONO VACACIONAL PERSONAL VIGILANCIA  2 DE 2	F	1
132	BONO VACACIONAL PORTERO 2015-2016	F	1
133	BONO VACACIONAL TRAB. RES. TORRE 3  2013-2014	F	1
134	BOTE DE BASURA DE TRASTES DE COPROPIETARIOS NO IDENTIFICADOS	F	1
135	BOTE DE BASURA SAB. Y FERIADOS  ABRIL 2016	F	1
136	BOTE DE BASURA SABADOS MAY-JUL-2014	F	1
137	BOTE DE ESCOMBROS	F	1
138	BOTE DE ESCOMBROS APTO.  11-D, 15-D Y 16-C	V	2
139	BOTE ESCOMBROS  AREA NORTE	F	1
140	BOTELLON DE AGUA,BOTE DE BASURA Y COD. LLAVE	F	1
141	BOTES DE BASURA Y OTROS  15/3/16 A 04/04/16 (CCH)	F	1
142	C.EXTRA APROB. ASAMBLEA TRAB. ESPECIALES  1 DE 2	V	2
143	CABLEADO DE LAS BOMBAS DESDE EL TABLERO 2 DE 2	F	1
144	CABLEADO TELEFONICO PUNTO MINITIENDA AREAS COMUNES	F	1
145	CAJA CHICA	F	1
146	CAJA CHICA  HASTA  FEBRERO 2016	F	1
147	CAJA CHICA ( ELECT GARITA/ PINT. ROJA/BOMBILLO/COPIA LLAVE)	F	1
148	CAJA CHICA - 50 BOLSAS DE BASURA	F	1
149	CAJA CHICA - ACHIQUE DE LA FOSA DEL ASCENSOR	F	1
150	CAJA CHICA - AGUINALDO ASEO CAMION Y LA CALLE	F	1
151	CAJA CHICA - COMPRA DE BOMBILLOS  Y SOCATES	F	1
152	CAJA CHICA - COMPRA DE LAMPARAS Y BOMBILLOS PB DIC-15	F	1
153	CAJA CHICA - FOTOCOPIAS	F	1
154	CAJA CHICA - LIMPIEZA DE LA PARTE TRASERA DEL JARDIN	F	1
155	CAJA CHICA - M. DE O. COL DE SOCATE Y BOMBILLO Y LAMPARAS	F	1
156	CAJA CHICA - MANT DE HIDRONEUMATICO  ABRIL 2016	F	1
157	CAJA CHICA - OCHO PLAFONES DE PORCELANA	F	1
158	CAJA CHICA .11/2015	F	1
159	CAJA CHICA 07/11	F	1
160	CAJA CHICA HASTA ENERO-2016	F	1
161	CAMBIO DE BOMBILLOS Y REP DE LAMPARAS	F	1
162	CAMBIO DE LLAVE, FLOTANTE MECANICO Y BOYA  EN TANQUE DE AGUA	F	1
163	CANALIZACION DE AGUAS DE LLUVIA AREA PISCINA IVA	F	1
164	CANTV DE LA HAB. DE LA TRAB. RESIDENCIAL	F	1
165	CANTV DEL EDIFICIO ABRIL 2016	F	1
166	CARATEO DE LA ESCALERA DE LA ENTRADA PRINCIPAL	F	1
167	CARGA EXTINTORES 1/2	F	1
168	CARGA EXTINTORES 2/2	F	1
169	CARGO ADMINIST. B. ALIM. NOV-DIC 2015 + TARJETA	F	1
170	CARGO ADMINISTRATIVO DE CESTATICKET ABRIL 2016	F	1
171	CARGO POR DESGLOSE DE LA CUENTA INDIVIDUAL DE GAS BSF. 600,00 C/U	V	2
172	CARGO POR DIFERENCIA EN EMISION DE RECIBOS  2008-2009	F	1
173	CARRO AZUL ESTACIONADO EN AREA COMUN NOPERMTIDA 8 HORAS	V	2
174	CARTA DEPARTAMENTO LEGAL	V	2
175	CARTA POR GESTION DE COBRO DEL DEPARTAMENTO LEGAL	V	2
176	CESTATICKET  + CARGO ADMINISTRATIVO ABRIL 2016	F	1
177	CESTATICKET  + CARGO ADMINISTRATIVO ENERO 2016	F	1
178	CESTATICKET + CARGO ADMINISTATIVO  ABRIL 2016	F	1
179	CESTATICKET ABRIL 2016	F	1
180	CESTATICKET CARMEN MORALES MAYO-2014	F	1
181	CESTATICKET DE  FEBRERO 2016	F	1
182	CESTATICKET DE LA TRAB. RESIDENCIAL  11/2015	F	1
183	CESTATICKET DEL SUPL. DE LA TRAB. RESIDENCIAL	F	1
184	CESTATICKET MARZO 2016	F	1
185	CESTATICKET PERS. MANT Y VIG. AGOSTO 2013	F	1
186	CESTATICKET SEPTIEMBRE 2012 + CARGO ADMINISTRATIVO	F	1
187	CESTATICKET TRAB. RES.  ABRIL2016	F	1
188	CESTATICKET TRAB. RES. 04/16	F	1
189	CESTATICKET TRAB. RES.MAR-16 +  C.ADM	F	1
190	CESTATICKET TRAB. RESIDENCIAL ABRIL 2016	F	1
191	CHEQUE DEVUELTO	V	2
192	CIMA	F	1
193	CISTERNAS DE AGUA	F	1
194	CISTERNAS DE AGUA  MARZO-2016	F	1
195	COCINA VIGILANTES	F	1
196	COLOC. DE TUB DE GAS CONSERJERIA 1 DE 10	F	1
197	COLOCACION DE PISOS 1/2	F	1
198	COLOCACION PISOS 2/2	F	1
199	COMISION POR CHEQUE DEVUELTO	V	1
200	COMISIONES BANCARIAS	F	1
201	COMISIONES BANCARIAS 2008 -2012	F	1
202	COMPRA  DE  MATERIAL ELECT, FACTURA  2271	F	1
203	COMPRA 1BOL.CAL,4GAL DESINFESTANTE,1GAL CLORO	F	1
204	COMPRA 42 BOMBILLOS AHORRADORES DE 13WATTS  2 DE 2	F	1
205	COMPRA ARENA Y CEMENTO, REP. PICO DE MANGUERA  MAR-2011	F	1
206	COMPRA BOLSAS BASURA	F	1
207	COMPRA BOMBILLOS	F	1
208	COMPRA CAMIONES CISTERNAS AGUA POTABLE ABRIL-2014  2 DE 2	F	1
209	COMPRA CARTUCHOS DE TONER  FACT 0162	F	1
210	COMPRA DE 100 BOMBILLOS  3 DE 3	F	1
211	COMPRA DE 1200 BOLSAS DE BASURA F-67887 MAY-2012 3 DE 3	F	1
212	COMPRA DE 15 BOMBILLOS MAR-2016  2 DE 2	F	1
213	COMPRA DE 18 BOMBILLOS OCT-15 2 DE 3	F	1
1092	REPARACION PUERTA 1/2	F	1
107	BONIFICACION ESPECIAL  AÑO 2015  2 DE 2	F	1
110	BONIFICACION FIN DE AÑO 1/3	F	1
112	BONIFICACION FIN DE AÑO 3/3	F	1
111	BONIFICACION FIN DE AÑO 2/3	F	1
118	BONO FIN DE AÑO 1/3	F	1
120	BONO FIN DE AÑO 3/3	F	1
119	BONO FIN DE AÑO 2/3	F	1
214	COMPRA DE 20 BOMBILLOS AHORRADORES PARA PASILLOS	F	1
215	COMPRA DE 300 BOLSAS DE BASURA 2 DE 2	F	1
216	COMPRA DE 4 CARRITOS DE MERCADO + TRANSPORTE  1  DE 2	F	1
217	COMPRA DE 4 CONTROLES REMOTOS ABR-2013	V	2
218	COMPRA DE 42 BOMBILLOS AHORRADORES  2 DE 2	F	1
219	COMPRA DE 500 BOLSAS DE BASURA  2 DE 2	F	1
220	COMPRA DE 500 BOLSAS DE BASURA  JUN-2014  5  DE  5	F	1
221	COMPRA DE 500 BOLSAS DE BASURA F-127 MAYO-2012  4 DE 4	F	1
222	COMPRA DE 7 BATERIAS PARA LAMP. DE EMERGENCIA  4 Y 5  DE  6	F	1
223	COMPRA DE ADORNOS DE NAVIDAD  3 DE 5	F	1
224	COMPRA DE ADORNOS DE NAVIDAD DE ENTRADA	F	1
225	COMPRA DE ARBOLITO DE NAVIDAD Y ADORNOS	F	1
227	COMPRA DE BANDERA	F	1
228	COMPRA DE BOLSAS DE BASURA Y CLORO ABRIL-2011	F	1
229	COMPRA DE BOMB. Y MAT. ELECT  2 DE 4	F	1
230	COMPRA DE BOMBILLOS	F	1
231	COMPRA DE BOMBILLOS 4 DE 4	F	1
232	COMPRA DE BOMBILLOS ABR-16	F	1
233	COMPRA DE BOMBILLOS ABR-2016	F	1
234	COMPRA DE BOMBILLOS AHORRADORES OCT-2013  2 DE 2	F	1
235	COMPRA DE BOMBILLOS AREAS COMUNES  2 DE 2  SANTROPEZ	F	1
236	COMPRA DE BOMBILLOS DIC-2014	F	1
237	COMPRA DE BOMBILLOS DIC-2015 1 DE 2	F	1
238	COMPRA DE BOMBILLOS F-61434 + F-62059  MAR-ABR-2014	F	1
239	COMPRA DE BOMBILLOS FAROS DE LA GARITA	F	1
240	COMPRA DE BOMBILLOS FEB. Y MAR-2016  2 DE 2	F	1
241	COMPRA DE BOMBILLOS MAR-2013	F	1
242	COMPRA DE BOMBILLOS SEPTIEMBRE 2015  2 DE 2	F	1
243	COMPRA DE BOTELLONES DE AGUA	F	1
244	COMPRA DE CANDADO Y COPIA DE 14 LLAVES  1 DE 2	F	1
245	COMPRA DE CINCO ESTANTES NOV-2012	F	1
246	COMPRA DE CONOS	F	1
247	COMPRA DE CONTROL REMOTO	V	2
248	COMPRA DE CONTROLES A BS 200,00 C/U	V	2
249	COMPRA DE CUATRO CISTERNAS DE AGUA	F	1
250	COMPRA DE IMPERCOAT  AGO-2015	F	1
251	COMPRA DE MAT. REP. VARIAS F-79499-822021 FEB-MAR 2011	F	1
252	COMPRA DE PISTOLA DE RIEGO	F	1
253	COMPRA DE PRODUCTOS DE LIMPIEZA F-88617 FEB-2010	F	1
254	COMPRA DE PULIDORA SEPT-2015   3  DE 3  SANTROPEZ	F	1
255	COMPRA DE REFLECTORES PARA EL JARDIN	F	1
256	COMPRA DE UNIFORME TRAB. RESIDENCIAL	F	1
257	COMPRA E INSTALACION  BOMBA DE AGUA	F	1
258	COMPRA MATERIAL ELECT F-1011-16 OCT-2010  3  DE 3	F	1
259	COMPRAS MATERIAL ELECTRICO FACTURA 2400	F	1
260	COMPRAS MENORES DE ELECT. CERRADURAS, LAMP  Y BOMBILLOS	F	1
261	CONDOMINIO ASOAVILEM A.C. ABRIL-2016	V	2
262	CONDOMINIO ASOAVILEM A.C. MAR-2015  CORRECTO	V	2
263	CONSUMO DE AGUA INDIVIDUAL   01/04/2016 AL 31/04/2016	V	2
264	CONSUMO DE AGUA INDIVIDUAL ABRIL 2016	V	2
265	CONSUMO DE AGUA INDIVIDUAL FEBRERO 2016	V	2
266	CONSUMO DE AGUA INDIVIDUAL PERIODO 01/08/2013 AL  31/08/2013	V	2
267	CONSUMO INDIVIDUAL DE AGUA PERIODO 14/01/2015  AL 13/02/2015	V	2
268	CONTROL REMOTO DE LA PUERTA DE ESTAC. A BSF. 140,00 C/U	V	2
269	CONVOCATORIA DE ASAMBLEA	F	1
270	COPIA CERTIFICADA DOCUMENTO CONDOMINIO	F	1
271	COPIAS DE LLAVES  (CCH)	F	1
272	COSTO DEL CESTATICKET ABRIL 2016	F	1
273	CTA TRAB. APROB.  ASAMBLEA  COPROP. 6  DE 6	F	1
274	CUOTA  CONST. CAMINERIA APROBADA CARTA CONSULTA	F	1
275	CUOTA  REP ASC. 2, 3 Y 4  APROBADA EN ASAMBLEA  3 DE 3	V	2
276	CUOTA 2/2 SUM-COL TAPA TANQUILLA TANQUE	F	1
277	CUOTA APROB. ASAMBLEA GUAYAS, POLEAS, ROLONES Y CABINAS  5 DE 5	V	2
278	CUOTA DE INSTALACION DE PARABOLICA  2 DE  6	V	1
279	CUOTA ELABORACION DE POLICIAS ACOSTADOS	F	1
280	CUOTA EXTRA  PINTURA INTERNA DEL EDIFICIO  3 DE 3	V	2
281	CUOTA EXTRA ADECUACION DE LA SEGURIDAD DEL EDIFICIO  4  DE 4	F	1
282	CUOTA EXTRA APROBADA ASAMBLEA TAB. ELECT.	V	2
283	CUOTA EXTRA PARA REPARACIONES 04/2016	V	2
284	CUOTA EXTRA PARA REPARACIONES APROBADAS EN ASAMBLEA	F	1
285	CUOTA EXTRA REPARACION DEL ASCENSOR   2  DE  2	F	1
286	CUOTA EXTRAORDINARIA 6 ARREGLO TALUD	F	1
287	CUOTA INSTALACION DEL SISTEMA SEGURICEL	V	2
288	CUOTA REP ASC. T- 3  APROB ASAMBLEA  18/6/2015  1 DE 3	V	2
289	CUOTA REP ASC. T- 3  APROB ASAMBLEA  18/6/2015  2 DE 3	V	2
290	CUOTA REP.TUB.JAJI Y PLANT. TRAT.FILTRO Y POZO	F	1
292	DESCUENTO INADECUADO DEL MONTO DEL CONDOMINIO  MAR-10	V	2
293	DESMALEZAMIENTO DE LA AREA VERDES 08/2012	F	1
294	DESMONTAJE Y COLOC DE CERRADURA MAYO-2012	F	1
295	DEST. DE TUB. AGUAS DE LLUVIA Y TANQUILLAS F-715 ABR-2010	F	1
296	DEST. TANQUILLA INT. PLOMERIA Y LIMP. TANQ. A. RESIDUALES  2 DE 2	F	1
297	DESTAPADO CENTRO PISO  BASURERO TORRE 2	F	1
298	DESTAPADO DE CENTRO PISO EN LA CONSERJERIA MAYO-2012	F	1
299	DESTAPADO DE CLOACA PRINCIPAL EN TERRAZA 3	F	1
300	DESTAPADO DE LOS BAJANTES DE AGUA  8 DE 8	F	1
301	DESTAPADO DE TUB DE 2",3"  Y 4" EN AREA COMUN	F	1
302	DESTAPADO DE TUB. DE AGUAS SERVIDAS  4 DE 4	F	1
303	DESTAPADO DE TUBERIA DE AGUAS NEGRAS F.-127	F	2
304	DESTAPADO DE TUBERIA DIC-15  3 DE 3	F	1
305	DESTAPADO DE TUBERIA PRINCIPAL	F	1
306	DESTAPADO DE TUBERIAS 2 DE 2	V	2
307	DESTAPADO DE TUBERIAS DE AREAS COMUNES	F	1
308	DESTAPADO DE TUBERIAS EN TORRES 1 Y 3	F	1
310	DESTAPADO INTERNO DE TUB. DE AGUAS SERVIDAS  6 DE 6	V	2
311	DESTAPADO TUB INUNDACION APTO 52-B  2 DE 3	V	2
312	DESTAPADO TUB. LINEA 8 PISO 6 Y 1 + SUM. FAJA 8 PULG   1 DE 2	F	1
313	DEUDA DEL APARTAMENTO 157	F	1
314	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA   MAR - 2013	V	2
1093	REPARACION PUERTA 2/2	F	1
226	COMPRA DE AVISOS DE SEÑALIZACION	F	1
309	DESTAPADO DEL BAÑO DE LA CONSERJERIA	F	1
315	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA  ABR-16	V	2
316	DIF ASOC DE VECINOS VALLE ALTO MAY-2013 A JUL-2013	F	1
317	DIF ELECTRICIDAD NOV 2006	F	1
318	DIF EN CARGO ESTAC. ASOAVILEN OCT-2014	V	2
319	DIF FONDO REP. ASC. APROB. EN ASAMBLEA	V	2
320	DIF HON. DE ADMINISTRACION NOV-2014 A ENE-2015  3 DE  3	V	2
321	DIF HON. DE ADMINISTRACION NOV-2015  SANTROPEZ	F	1
322	DIF JARDINERIA MARZO-2016	F	1
323	DIF MANT DE ASCENSORES ENE-FEB-2014	F	1
324	DIF MANT DE PUERTA ESTAC. ENE-FEB-MAR-2016	F	1
325	DIF MANT JARDIN Y FUMIGACION AGO-2015	F	1
326	DIF MANT. HIDRONEUMATICO OCT-DIC-2014 +ENE-MAR-2015	F	1
327	DIF REP DEL ASCENSOR F-845909 Y 847109 MAYO 2009	F	1
328	DIF SERVICIO DE LIMPIEZA DE MARZO-2016	F	1
329	DIF. ACTUALIZACION DEL REGISTRO DE LLAVES	F	1
330	DIF. CESTATICKET DIC-2015	F	1
331	DIF. CUOTA MANT DE LA URBANIZACION NOV-2015 A FEB-2016	F	1
332	DIF. EMISION DE RECIBOS AL 31/12/2012	F	1
333	DIF. FONDO COLOC CERCO ELECTRICO 4 DE 4	F	1
334	DIF. H. ADM. MAY-14 - ABR-15  4 DE 4	F	1
335	DIF. H.DE ADMINISTRACION FEB-2014  2 DE 2	F	1
336	DIF. LIQUIDACION VIGILANTE	F	1
337	DIF. MANT DE ASCENSORES MARZO-2016	F	1
338	DIF. MANT DE ASCENSORES NOV-DIC-15 Y ENE-FEB-16 2 DE 2	F	1
339	DIF. MANT DE HIDRONEUMATICO MARZO-2016	F	1
340	DIF. MANT DE PUERTA ESTAC. NOV-2015 A MAR-2016	F	1
341	DIF. MANT DE PUERTA ESTAC.ABR-MAY-JUN-JUL-2015	F	1
342	DIF. MANT HIDRONEUMATICO OCT-DIC-2015	F	1
343	DIF. MANT JARDIN JUL-AGO-2015	F	1
344	DIF. MANT. DE ASCENSORES AGO-2014	F	1
345	DIF. MANT. DE ASCENSORES FEB-MAR-2016	F	1
346	DIF. MANT. HIDRONEUMATICO FEB-MAR-2016	F	1
347	DIF. MANT. PUERTA DE ESTAC.  ENE-2015	F	1
348	DIF. MAT DE INTERCOMUNICADOR  1 DE  3	F	1
349	DIF. PINTURA,BOMBILLOS Y MANTO IMPERMEABILIZANTE	F	1
350	DIF. SERV. VIG.Y MANT. AREAS COMUNES NOV-15 A ENE-16	F	1
351	DIF. SERVICIO DE SEGURICEL ENE-MAR-2016	F	1
352	DIF. SERVICIO DE VIGILANCIA DIC-2014	F	1
353	DIF. SERVICIO DE VIGILANCIA MARZO 2016	F	1
354	DIF. SUM Y COL DEL SIST DE CONTROL DE ACCESO	F	1
355	DIF. SUPLENCIA TRAB. RESIDENCIAL VAC 2014/15	F	1
356	DIF.ACHIQUE TANQ. SOT-2 Y TANQ RESIDUAL EMERGENCIA	F	1
357	DIF.ALQUILER DE PUESTO DE ESTAC. SEP-14 A FEB-15	V	2
358	DIF.DESTAPADO DE TUBERIAS POR ERROR	V	2
359	DIFERENCIA DE VIG. PRIVADA  MARZO 2014	V	2
360	DIFERENCIA EN ELECTRICIDAD	F	1
361	DIFERENCIA EN PAGO	V	2
362	DIFERENCIA EN PAGO  2009  VER CUADRO IMPRESO EN RECIBO	V	2
363	DIFERENCIA EN PAGO DE RECIBOS	V	2
364	DIFERENCIA EN PAGO MES AGOSTO 2013	V	2
365	DIFERENCIA EN PAGO MESES ANTERIORES	V	2
366	DIFERENCIA RECIBO DE CONDOMINIO.ANTERIOR	V	2
367	ELAB. TANQUILLA AREA PISCINA Y DESTAPADO 3 DE 3	F	1
368	ELABORACION CONTRATO ARRENDAMIENTO MINITIENDA A.COMUN	F	2
369	ELECT. AREAS COMUNES 10/10/2015 AL 09/11/2015	F	1
370	ELECTRICIDAD	F	1
371	ELECTRICIDAD   AREAS  COMUNES  10/02/2016 AL 09/03/2016	F	1
372	ELECTRICIDAD  ( 21/03/2016 al 21/04/2016 )	F	1
373	ELECTRICIDAD  04/2016	F	1
374	ELECTRICIDAD  13/03/2016 AL  13/04/2016	F	1
375	ELECTRICIDAD  ABRIL 2016	F	1
376	ELECTRICIDAD  DEL  EDIFICIO 10/02/2016 AL 09/03/2016	F	1
377	ELECTRICIDAD  DICIEMBRE  2015	F	1
378	ELECTRICIDAD  MES ABR-2016	F	1
379	ELECTRICIDAD 01/2012	F	1
380	ELECTRICIDAD 01/2013	F	1
381	ELECTRICIDAD 02/2012	F	1
382	ELECTRICIDAD 02/2013	F	1
383	ELECTRICIDAD 03/2012	F	1
384	ELECTRICIDAD 03/2013	F	1
385	ELECTRICIDAD 03/2016	F	1
386	ELECTRICIDAD 04/16	F	1
387	ELECTRICIDAD 04/2012	F	1
388	ELECTRICIDAD 04/2013	F	1
389	ELECTRICIDAD 04/2016	F	1
390	ELECTRICIDAD 05/2012	F	1
391	ELECTRICIDAD 06/2011	F	1
392	ELECTRICIDAD 06/2012	F	1
393	ELECTRICIDAD 07/2011	F	1
394	ELECTRICIDAD 07/2012	F	1
395	ELECTRICIDAD 08/2011	F	1
396	ELECTRICIDAD 08/2012	F	1
397	ELECTRICIDAD 09/2011	F	1
398	ELECTRICIDAD 09/2012	F	1
399	ELECTRICIDAD 10/07/2013 AL 09/08/2013	F	1
400	ELECTRICIDAD 10/2011	F	1
401	ELECTRICIDAD 10/2012	F	1
402	ELECTRICIDAD 11/2011	F	1
403	ELECTRICIDAD 11/2012	F	1
404	ELECTRICIDAD 12/2011	F	1
405	ELECTRICIDAD 12/2012	F	1
406	ELECTRICIDAD 15/01/2016 AL 16/02/2016	F	1
407	ELECTRICIDAD 23/03/2016  A  22/04/2016	F	1
408	ELECTRICIDAD 26/03/2016 AL 25/04/2016	F	1
409	ELECTRICIDAD ABRIL 2016	F	1
410	ELECTRICIDAD ABRIL-2016	F	1
411	ELECTRICIDAD AREAS  COMUNES 12/2007	F	1
412	ELECTRICIDAD CENTRO COMERCIAL 12/2007	F	1
413	ELECTRICIDAD DE LA CONSERJERIA 04/2016	F	1
414	ELECTRICIDAD DEL EDIFICIO 10/10/2015  AL 09/11/2015	F	1
415	ELECTRICIDAD MARZO 2016	F	1
416	ELECTRICIDAD PERIODO 10/05/2012 AL  11/06/2012	F	1
417	ELECTRICIDAD SEPTIEMBRE 2012	F	1
418	ELECTRIDAD	F	1
419	EMINENCE	F	1
420	EXAMEN MEDICO PRE-POST VAC. DE LA TRAB. RESIDENCIAL	F	1
421	EXPLORACION FILTRACION Y ALQ. MARTILLO SABADO OCT-2010	F	1
422	F. DE RESERVA + U. TRIBUTARIA + F. TRAB. ESP.	F	1
423	F.PREST.SOC. CORTE DE CUENTA   ABRIL 2016	F	1
424	FAROS AREA DEL ESTAC. (61293-27680 FONDO ESTAC.)	F	1
425	FINIQUITO DE SUM-COL Y PINTURA DE REJAS SEGUNDA PARTE	F	1
426	FINIQUITO DEL TRABAJO DE PLOMERIA	F	1
427	FINIQUITO PINTURA INTERNA DEL EDIFICIO  2  DE 2	V	2
428	FINIQUITO REP. DE LA BOMBA DE AGUA	F	1
429	FONDO  DE  PRESTACIONES  SOCIALES	F	1
430	FONDO AGUINALDO PERSONAL DE VIG. Y MANT. 2012  6  DE  10	F	1
431	FONDO ALQ, DE PUESTO ESTAC. AREAS COMUNES	V	2
432	FONDO ALQUILER  SALON DE FIESTAS	F	1
433	FONDO BONIF. ESPECIAL Y AGUINALDO 2016  4 DE 12	F	1
434	FONDO CAMBIO DE CUADRO DE MANDO DE ASCENSORES  6 DE 6	F	1
435	FONDO CAMBIO DE TUBERIA AGUAS BLANCAS  TORRE A	F	1
436	FONDO COMPRA DE BAT. LAMP. DE EMERGENCIA 1 DE 2	F	1
437	FONDO DE ALQ. PTO ESTAC. Y MALETEROS A. COMUN	V	2
438	FONDO DE ALQUILER DE DEPOSITO	F	1
439	FONDO DE ARRANQUE 2 DE 2	F	1
440	FONDO DE CONTINGENCIA APROB. ASAMBLEA  6  DE  6	F	1
441	FONDO DE GESTION DE COBRANZA	V	2
442	FONDO DE HIDROCAPITAL	F	1
443	FONDO DE INTERESES DE MORA	V	2
444	FONDO DE PREST.  SOCIALES DE  JULIO 2015	F	1
445	FONDO DE PRESTACIONES SOCIALES	F	1
446	FONDO DE PRESTACIONES SOCIALES AGOSTO  2013	F	1
447	FONDO DE RECUPERACION DE AREAS COMUNES	F	1
448	FONDO DE REPARACION DE FACHADA	V	2
449	FONDO DE REPARACION DE FACHADA DIF. JULIO 2008	V	2
450	FONDO DE RESERVA	F	1
451	FONDO DE RESERVA  GENERAL	F	1
452	FONDO DE RESERVA CONDOMINIO GENERAL	F	1
453	FONDO DE RESERVA CUOTA 181	F	1
454	FONDO DE TRABAJO	F	1
455	FONDO DE TRABAJO. DE MANT. Y REPARACION	F	1
456	FONDO DE TRABAJOS MEJORAS DEL EDIFICIO 04/2016	F	1
457	FONDO DESTAPE  DE  TUBERIAS  CONDOMINIO GENERAL	F	1
458	FONDO DESTAPE CONDOMINIO GENERAL	F	1
459	FONDO INTERESES MORATORIOS	F	1
460	FONDO MEJORAS DE ESTACIONAMIENTO	V	2
461	FONDO MEJORAS PARQUE/SALON DE REUNIONES	V	2
462	FONDO MODERNIZACION ASCENSORES	F	1
463	FONDO OTRAS RESERVAS	F	1
464	FONDO PROYECTOS DE CAMINERIA 2014	F	1
465	FONDO RECUPERACION DE AREAS COMUNES	F	1
466	FONDO REP.  ESCAL. MECANICA ( 10.288.519) 5/5	V	2
467	FONDO REPARACION DEL ASCENSOR  5 DE 5	F	1
468	FONDO REPARACION DEL ASCENSOR 1 DE 5	F	1
469	FONDO REPARACIONES VARIAS	F	1
470	FONDO RESERVAS ESPECIALES	F	1
471	FONDO SALON DE FIESTA	F	1
472	FONDO SEG. TRABAJADOR RESIDENCIAL	F	1
473	FONDO TRAB. ESPEC. APROB. ASAMBLEA JUL-2012 6/6	F	1
474	FONDO TRAB. ESPECIALES ASCENSORES	F	1
475	FONDO TRABAJOS ESPECIALES  ASAMBLEA JUN-2011	V	2
476	FUMIGACION 1/2	F	1
477	FUMIGACION DE LAS AREAS COMUNES DEL EDIFICIO	F	1
478	FUMIGACION DE LAS AREAS COMUNES OCTUBRE 2013	F	1
479	GAS DE LA CONSERJERIA  ABRIL 2016 + DIF ENE-FEB-2016	F	1
480	GASTOS AREAS COMUNES ELECT MED-06470 AL 09/02/2015	F	1
481	GASTOS AREAS COMUNES ELECT.MED-60923  AL 09/02/2015	F	1
482	GASTOS AREAS COMUNES ELECT.MED-60952  AL 09/02/2015	F	1
483	GASTOS AREAS COMUNES HIDROCAPITAL  MED-30912 AL 13/02/2015	F	1
484	GASTOS AREAS COMUNES HIDROCAPITAL  MED-30913  AL 10/02/2015	F	1
485	GASTOS AREAS COMUNES MANT. Y REP. PTA. ESTAC. A MAY-2014	F	1
486	GASTOS AREAS COMUNES REPARACION DEL PORTON LADO CARONI	F	1
487	GASTOS AREAS COMUNES SERVICIO DE VIGILANCIA  02/2015	F	1
488	GASTOS AREAS COMUNES TRAMITES IVSS	F	1
489	GASTOS BANCARIOS	F	1
490	GASTOS BANCARIOS  FEBRERO 2016	F	1
491	GASTOS BANCARIOS 01/2012	F	1
492	GASTOS BANCARIOS 01/2012 Y 02/2012	F	1
493	GASTOS BANCARIOS 01/2013	F	1
494	GASTOS BANCARIOS 03/2012	F	1
495	GASTOS BANCARIOS 04/16	F	1
496	GASTOS BANCARIOS 04/2012	F	1
497	GASTOS BANCARIOS 05/2012	F	1
498	GASTOS BANCARIOS 06/2012	F	1
499	GASTOS BANCARIOS 07/2011	F	1
500	GASTOS BANCARIOS 07/2012	F	1
501	GASTOS BANCARIOS 08/2011	F	1
502	GASTOS BANCARIOS 08/2012	F	1
503	GASTOS BANCARIOS 09/2011	F	1
504	GASTOS BANCARIOS 09/2012	F	1
505	GASTOS BANCARIOS 10/2011	F	1
506	GASTOS BANCARIOS 10/2012	F	1
507	GASTOS BANCARIOS 11/2011	F	1
508	GASTOS BANCARIOS 11/2012	F	1
509	GASTOS BANCARIOS 12/2011	F	1
510	GASTOS BANCARIOS 12/2012	F	1
511	GASTOS BANCARIOS ABRIL  2016	F	1
512	GASTOS BANCARIOS HASTA MAYO 2011 MERCANTIL	F	1
513	GASTOS CAJA CHICA	F	1
514	GASTOS DE ADMINISTRACION	V	2
515	GASTOS DE ADMINISTRACION  ABRIL 2016	V	2
516	GASTOS DE ADMINISTRACION  ABRIL-2016	F	1
517	GASTOS DE ADMINISTRACION  AGOSTO  2013	F	1
518	GASTOS DE ADMINISTRACION  DICIEMBRE 2015	F	1
519	GASTOS DE ADMINISTRACION 04/2016	F	1
520	GASTOS DE CAJA CHICA  JUNIO-2015	F	1
521	GASTOS DE CAJA CHICA  MAR-AGO-2014	F	1
522	GASTOS DE CAJA CHICA ABR-2016	F	1
523	GASTOS DE CAJA CHICA ABRIL-2016	F	1
524	GASTOS DE CERRAJERIA	F	1
525	GASTOS DE CERRAJERIA CUARTO DE BOMBAS JUL-10	F	1
526	GASTOS DE CERRAJERIA EN MALETERO  2 DE 3	V	2
527	GASTOS DE CERRAJERIA OCT-015	F	1
528	GASTOS DE CERRAJERIA PTA.PPAL. F-27997 OCT-2010	F	1
529	GASTOS DE COBRANZA	V	2
530	GASTOS DE FERRETERIA	F	1
531	GASTOS DE FERRETERIA ENE-2016	F	1
532	GASTOS DE FERRETERIA F-4344-272271-17028	F	1
533	GASTOS DE FERRETERIA MAYO-2012	F	1
534	GASTOS DE FLORISTERIA	V	2
535	GASTOS DE LA CASETA DE VIGILANCIA SEPTIEMBRE 2012	V	2
536	GASTOS DE REGISTRO DE ASAMBLEA SEPT. 2007	F	1
537	GASTOS DE SOLVENCIA DE HIDROCAPITAL	V	2
538	GASTOS DEL PERSONAL DE MANT. AGOSTO 2013	F	1
539	GASTOS PERSONAL. VIGILANCIA. AGOSTO  2013	F	1
540	GASTOS VARIOS	F	1
541	GESTION DE COBRANZA	V	2
542	GESTION DE COBRANZA 1%	V	2
545	HASTA AQUI ALBARREGAS	F	1
551	HERRERIA AREAS COMUNES Y REJAS DE ESTAC. 2 DE 3	F	1
552	HERRERIA PUERTA PEINCIPAL	F	1
553	HERRERIA REJAS DE ENTRADA ESTAC. EN VIGILANCIA ABR-2010	F	1
554	HIDROCAPITAL	F	1
555	HIDROCAPITAL  01/08/2013  AL 31/08/2013   AREAS COMUNES	F	1
556	HIDROCAPITAL  02/03/2016 A 04/04/2016	F	1
557	HIDROCAPITAL  04/03/2016 AL 04/04/2016	F	1
558	HIDROCAPITAL  04/2016	F	1
559	HIDROCAPITAL  12/2007	F	1
560	HIDROCAPITAL  ABR-2016	F	1
561	HIDROCAPITAL  ABRIL 2016	F	1
562	HIDROCAPITAL  MAYO-2012	F	1
563	HIDROCAPITAL ( 23/02/2016 al 22/04/2016 )	F	1
564	HIDROCAPITAL 01/12	F	1
565	HIDROCAPITAL 01/13	F	1
566	HIDROCAPITAL 02/12	F	1
567	HIDROCAPITAL 02/13	F	1
568	HIDROCAPITAL 03/12	F	1
569	HIDROCAPITAL 03/13	F	1
570	HIDROCAPITAL 03/2016	F	1
571	HIDROCAPITAL 04/12	F	1
572	HIDROCAPITAL 04/13	F	1
573	HIDROCAPITAL 04/16	F	1
574	HIDROCAPITAL 05/12	F	1
575	HIDROCAPITAL 06/11	F	1
576	HIDROCAPITAL 06/12	F	1
577	HIDROCAPITAL 07/02/2016  AL 07/03/2016	F	1
578	HIDROCAPITAL 07/10/2015 AL 06/11/2015	F	1
579	HIDROCAPITAL 07/11	F	1
580	HIDROCAPITAL 07/12	F	1
581	HIDROCAPITAL 08/03/2016 AL  09/04/2016 AREAS COMUNES	F	1
582	HIDROCAPITAL 08/11	F	1
583	HIDROCAPITAL 08/12	F	1
584	HIDROCAPITAL 09/11	F	1
585	HIDROCAPITAL 09/12	F	1
586	HIDROCAPITAL 10/11	F	1
587	HIDROCAPITAL 10/12	F	1
588	HIDROCAPITAL 11/03/2016 AL 10/04/2016	F	1
589	HIDROCAPITAL 11/11	F	1
590	HIDROCAPITAL 11/12	F	1
591	HIDROCAPITAL 12/01/2016 AL 14/02/2016	F	1
592	HIDROCAPITAL 12/11	F	1
593	HIDROCAPITAL 12/12	F	1
594	HIDROCAPITAL 19/03/2016  AL 18/04/2016	F	1
595	HIDROCAPITAL 25/03/2016  A  24/04/2016	F	1
596	HIDROCAPITAL ABRIL 2016	F	1
597	HIDROCAPITAL AREA COMUN  MAYO  2011	F	1
598	HIDROCAPITAL DE JULIO 2014  2 DE 2	F	1
599	HIDROCAPITAL MARZO 2016	F	1
600	HIDROCAPITAL SEPTIEMBRE 2012	F	1
601	HON DE ADMINISTRACION  MARZO 2016	F	1
602	HON. DE ADMINISTRACION  FEBRERO 2016	F	1
603	HON. DE ADMINISTRACION ABRIL  2016	F	1
604	HON. PROF. GERENTE OPERATIVO ABR-16	F	1
605	HONORARIOS ADMINISTRACION AJUSTE POR CARGO INDEBIDO	F	1
606	HONORARIOS COBRANZA EXTRAJUDICIAL	V	2
607	HONORARIOS DE  ABOGADOS	V	2
608	HONORARIOS DE ABOGADO	V	2
609	HONORARIOS DE ABOGADO HASTA DIC-2014	V	2
610	HONORARIOS DE ADMINIST. ABRIL 2016	F	1
611	HONORARIOS DE ADMINISTRACION	F	1
612	HONORARIOS DE ADMINISTRACION   04/2016	V	2
613	HONORARIOS DE ADMINISTRACION  ( ABRIL 2016 )	F	1
614	HONORARIOS DE ADMINISTRACION  03/2016	F	1
615	HONORARIOS DE ADMINISTRACION  11/2015	F	1
616	HONORARIOS DE ADMINISTRACION  ABRIL 2016	F	1
617	HONORARIOS DE ADMINISTRACION  MAYO-2012	F	1
618	HONORARIOS DE ADMINISTRACION 04/16	F	1
619	HONORARIOS DE ADMINISTRACION 04/2016	F	1
620	HONORARIOS DE ADMINISTRACION 05/2011	F	1
621	HONORARIOS DE ADMINISTRACION 12/2007	F	1
622	HONORARIOS DE ADMINISTRACION ABRIL 2016	F	1
623	HONORARIOS DE ADMINISTRACION MES ABR-2016	F	1
624	HONORARIOS DE ADMINISTRACION SEPTIEMBRE 2012	F	1
625	HONORARIOS PROFESIONALES	F	1
626	HONORARIOS PROFESIONALES REMODELACION DEL C.C.P.I.	F	1
627	HONORARIOS.  DE  ADMINISTRACION.  03/2016	F	1
628	HORAS EXTRAS PENDIENTES VIGILANTES 1/3	F	1
629	HORAS EXTRAS PENDIENTES VIGILANTES 2/3	F	1
630	I.V.S.S.  DEL TRAB. RESIDENCIAL  04/2016	F	1
631	IMPERM. JARDINERAS PB Y TECHO DE VIGILANCIA	F	1
632	IMPERMEABILIZACION PARCIAL DEL TECHO  1 DE 4 (VER NOTA)	F	1
633	INICIAL PARA OBRAS CIVILES DE BIOMETRICA	F	1
634	INSPECCION PANTALLA ATIRANTADA	F	1
635	INSTALACION DE PAPEL AHUMADO EN LA GARITA 2 DE 2	F	1
636	INSTALACION DE SISTEMA LLAVE CONTACTO PTA. PPAL	F	1
637	INSTALACION TUBERIAS GALVANIZADAS 1/4	F	1
638	INSTALACION TUBERIAS GALVANIZADAS 2/4	F	1
639	INSTALACION TUBERIAS GALVANIZADAS 3/4	F	1
640	INSTALACION TUBERIAS GALVANIZADAS 4/4	F	1
641	INTERESES DE MORA	V	1
642	INTERESES DE MORA 2005-2006	F	1
643	ITF Y COMISIONES BANCARIAS 11 Y 12/2007	F	1
644	IVA DE SERVICIO DE ADMINISTRACION 02/2015	F	1
645	IVSS	F	1
646	IVSS APORTE PATRONAL	F	1
647	IVSS APORTE PATRONAL (DIC-11 A MAR-12)	F	1
648	IVSS APORTE PATRONAL ABRIL 2016	F	1
649	IVSS JULIO 2012	F	1
650	J	F	1
651	JARDINERIA	F	1
652	JARDINES TORRES D Y B	F	1
653	L.P.H. CONSERJE APORTE PATRONAL 05/2011	F	1
654	LAMP Y BOMBILLOS PARA ESTAC. Y BOMB.PARA EL EDIF.3 DE 3  SANTROPEZ	F	1
655	LEANDRO	F	1
656	LECTURA DE AGUA INDIVIDUAL MAYO- 2011	V	2
657	LECTURA DE MEDIDORES	F	1
658	LECTURA DE MEDIDORES ABRIL 2016	F	1
544	HASTA  AQUI MONTERIA	F	1
546	HASTA AQUI ARIES	F	1
547	HASTA AQUI CHANTILLY	F	1
549	HASTA AQUI GUARICHAL	F	1
548	HASTA AQUI GUARACARUMBO	F	1
550	HASTA AQUI MARCONI	F	1
659	LECTURA DE MEDIDORES AGUA AREA COMUN  MAYO 2011	F	1
660	LECTURA DE MEDIDORES DE AGUA	F	1
661	LETRAS DE ACERO INOXIDABLE  2 DE 2	F	1
662	LEVANTAMIENTO  TOPOGRAFICO QUINTA EL LINDERO	F	1
663	LEY DE POLITICA  HAB.  Y  SSO  ABRIL 2016	F	1
664	LEY DE POLITICA HABITACIONAL	F	1
665	LEY DE POLITICA HABITACIONAL  ABRIL-2016	F	1
666	LEY DE POLITICA HABITACIONAL ABRIL 2016	F	1
667	LEY DE POLITICA HABITACIONAL DE LA CONSERJE	F	1
668	LEY DE POLITICA HABITACIONAL DE LA TRAB. RESIDENCIAL	F	1
669	LEY DE POLITICA HABITACIONAL SEPTIEMBRE 2012	F	1
670	LEY DE POLITICA HABITACIONAL Y SEGURO SOCIAL 04/2016	F	1
671	LEY POLITICA HABITACIONAL	F	1
672	LEY POLITICA HABITACIONAL TRAB. RESIDENCIAL	F	1
673	LIMP VIDRIOS, LAMP. Y MADERA EN PASILLO	F	1
674	LIMP. TALUD CONT. APROB. EN ASAMBLEA ABRIL-2016	F	1
675	LIMP. VENT. DE S. DE F. + PASILLOS Y LAMP. DE PASILLO	F	1
676	LIMPIEZA DE LAS TORRES 1  Y  2   ABRIL 2016	F	1
677	LIMPIEZA DE TANQUILLAS	F	1
678	LIMPIEZA DEL LINDERO DEL EDIFICIO 2 DE 2	F	1
679	LIMPIEZA TANQUE	F	1
680	LIMPIEZA TANQUE DE PISCINA  2 DE 2	F	1
681	LIQ. DE SUPLENTE POR REPOSO DE LA TRAB. RES.	F	1
682	LIQUIDACION PERSONAL MANTENIMIENTO MARZO 2007  1   DE 2	F	1
683	LIQUIDACION PRESTACIONES SOC PERSONAL ELECTRICIDAD	F	1
684	LLAVE DE LA PTA. TEMPLEX BS. 30,00 C/U	V	2
685	LLAVE DE LA REJA	V	2
686	LLAVE DE PASO CUARTO DE BOMBAS 2 DE 2	F	1
687	LLTH	F	1
688	LOMA	F	1
689	LOMALINDA	F	1
690	LOS ROBLES	F	1
691	LPH APORTE PATRONAL ABRIL 2016	F	1
692	LUZ ELECTRICA	F	1
693	M. DE O. CAMBIO DE FLOTANTE MECANICO EN TANQUE DE AGUA	F	1
694	M. DE O. COL DE LLAVE DE PASO CUARTO DE BOMBAS 1 DE 2	F	1
695	M. DE O. INPERMEABILIZACION DEL TECHO  2 Y 3 DE 6	F	1
696	M. DE O. INST.  LAMP. DE EMERG. Y BATERIAS  DIC-14  3 DE 3	F	1
697	M. DE O. PINTURA DE FACHADA EN ESTACIONAMIENTO	F	1
698	M. DE O. TERCERA REP DE TUB AGUAS BLANCAS 4 DE 5	F	1
699	M. DE O. Y MAT PARA TRAB DE ELECTRICIDAD	F	1
700	M. DE O..IMPERM. DEL TECHO DEL CUARTO DEL ASCENSOR 2 DE 2	F	1
701	M. DE O.PINTURA DE TRAFICO  AREAS COMUNES	F	1
702	M. DE O.TRAB. DE ELECT. EN EL EDIFICIO	F	1
703	M. DE OBRA PINTURA TECHO DEL AREA DE LA PISCINA	F	1
704	MAN DE ASCENSORES 03/2016	F	1
705	MANO DE O. DE INSTALACION DE LAMPARAS Y SUM. DE BOMBILLOS	F	1
706	MANO DE OBRA FILT. PARED EXTERNA CONSERJERIA	F	1
707	MANO DE OBRA REP. VARIAS EN EL EDIFICIO 1 DE 2	F	1
708	MANT DE JARDIN MAR-2016+ DIF. DE DIC-2015 Y FEB-016	F	1
709	MANT DE JARDINERAS,PARQUE  Y PODA DE ARBOL ABR-16	F	1
710	MANT DE PUERTA ESTAC. ABRIL-2016	F	1
711	MANT.  DE ASCENSORES  ABRIL 2016	F	1
712	MANT.  HIDRONEUMATICO	F	1
713	MANT.  PUERTA. ELECTRICA. AGOSTO 2012	F	1
714	MANT.  REP DEL SISTEMA DE CAMARAS	F	1
715	MANT. AREAS COMUNES 03/2016	F	1
716	MANT. ASCENSORES 01/2012	F	1
717	MANT. ASCENSORES 01/2013	F	1
718	MANT. ASCENSORES 02/2012	F	1
719	MANT. ASCENSORES 02/2013	F	1
720	MANT. ASCENSORES 03/2012	F	1
721	MANT. ASCENSORES 03/2013	F	1
722	MANT. ASCENSORES 04/16	F	1
723	MANT. ASCENSORES 04/2012	F	1
724	MANT. ASCENSORES 04/2013	F	1
725	MANT. ASCENSORES 05/2012	F	1
726	MANT. ASCENSORES 06/2011	F	1
727	MANT. ASCENSORES 06/2012	F	1
728	MANT. ASCENSORES 07/2011	F	1
729	MANT. ASCENSORES 07/2012	F	1
730	MANT. ASCENSORES 08/2011	F	1
731	MANT. ASCENSORES 08/2012	F	1
732	MANT. ASCENSORES 09/2011	F	1
733	MANT. ASCENSORES 09/2012	F	1
734	MANT. ASCENSORES 10/2011	F	1
735	MANT. ASCENSORES 10/2012	F	1
736	MANT. ASCENSORES 11/2011	F	1
737	MANT. ASCENSORES 11/2012	F	1
738	MANT. ASCENSORES 12/2011	F	1
739	MANT. ASCENSORES 12/2012	F	1
740	MANT. BOMBA E HIDRONEUMATICO ABRIL-2016	F	1
741	MANT. DE  ASCENSORES  04/2016	F	1
742	MANT. DE ANTENA PARABOLICA JULIO 2011	V	1
743	MANT. DE AREA VERDE Y ALCANTARILLADO MAYO-2012	F	1
744	MANT. DE ASCENSOR  ABRIL-2016 + DIF MARZO-2015 A JUN-2015	F	1
745	MANT. DE ASCENSOR  ABRILO 2016	F	1
746	MANT. DE ASCENSORES  11-2015	F	1
747	MANT. DE ASCENSORES  ABRIL 2016	F	1
748	MANT. DE ASCENSORES  ABRIL- 2016	F	1
749	MANT. DE ASCENSORES 04/2016 + DIF ENE-FEB-2016	F	1
750	MANT. DE ASCENSORES 05/2011	F	1
751	MANT. DE ASCENSORES 08/2013 A 01/2014	F	1
752	MANT. DE ASCENSORES ABRIL 2016	F	1
753	MANT. DE ASCENSORES FEBRERO 2016	F	1
754	MANT. DE ASCENSORES MES MAY-2016+DIF. MAR-ABR-16	F	1
755	MANT. DE EQUIPO DE BOMBEO ABRIL 2016	F	1
756	MANT. DE HIDRONEUMATICO  ABRIL 2016	F	1
757	MANT. DE JARDIN  ABRIL 2016	F	1
758	MANT. DE JARDIN  ABRIL-16	F	1
759	MANT. DE JARDIN 03/2016	F	1
760	MANT. DE JARDIN JUNIO-JULIO 2013 MENOS DIF-DIC-2002	F	1
761	MANT. DE JARDIN Y PODA DE ARBOLES	F	1
762	MANT. DE JARDINERAS + SUM Y COL DE PLANTAS 1 DE 2	F	1
763	MANT. DE LA PUERTA DE ESTAC. -2015	F	1
764	MANT. DE PARQUES Y JARDINES	F	1
765	MANT. DE PISCINA 03/2016	F	1
766	MANT. DE PTA DE ESTACIONAMIENTO  ABRIL 2016	F	1
767	MANT. DE PTA DE ESTACIONAMIENTO MAR-2016	F	1
768	MANT. DE PUERTA DE ESTAC 03/2016	F	1
769	MANT. DE PUERTA DE ESTAC. 04/2016	F	1
770	MANT. DE PUERTA DE ESTAC. 05/2011	F	1
771	MANT. DE PUERTA DE ESTACIONAMIENTO  04/2016	F	1
772	MANT. DE PUERTAS DE ESTACIONAMIENTO	F	1
773	MANT. DE REJA DE ESTAC. FEBRERO 2016	F	1
774	MANT. DE SISTEMA HIDRONEUMATICO 03/2016	F	1
775	MANT. DE SISTEMA HIDRONEUMATICO MES ABR-2016	F	1
776	MANT. ELECTRICO 11/2015	F	1
777	MANT. ELECTRICO CON SUM DE MATERIALES NOV-2015	F	1
778	MANT. FILTRO DEL TANQUE DE AGUA NOV-2014  10, 11  Y  12 DE 12	F	1
779	MANT. HIDRONEUMATICO  04/2016	F	1
780	MANT. HIDRONEUMATICO 01/2012	F	1
781	MANT. HIDRONEUMATICO 01/2013	F	1
782	MANT. HIDRONEUMATICO 02/2012	F	1
783	MANT. HIDRONEUMATICO 02/2013	F	1
784	MANT. HIDRONEUMATICO 03/2012	F	1
785	MANT. HIDRONEUMATICO 03/2013	F	1
786	MANT. HIDRONEUMATICO 04/16	F	1
787	MANT. HIDRONEUMATICO 04/2012	F	1
788	MANT. HIDRONEUMATICO 04/2013	F	1
789	MANT. HIDRONEUMATICO 05/2012	F	1
790	MANT. HIDRONEUMATICO 06/2011	F	1
791	MANT. HIDRONEUMATICO 06/2012	F	1
792	MANT. HIDRONEUMATICO 07/2011	F	1
793	MANT. HIDRONEUMATICO 07/2012	F	1
794	MANT. HIDRONEUMATICO 08/2011	F	1
795	MANT. HIDRONEUMATICO 08/2012	F	1
796	MANT. HIDRONEUMATICO 09/2011	F	1
797	MANT. HIDRONEUMATICO 09/2012	F	1
798	MANT. HIDRONEUMATICO 10/2011	F	1
799	MANT. HIDRONEUMATICO 10/2012	F	1
800	MANT. HIDRONEUMATICO 11/2011	F	1
801	MANT. HIDRONEUMATICO 11/2012	F	1
802	MANT. HIDRONEUMATICO 12/2011	F	1
803	MANT. HIDRONEUMATICO 12/2012	F	1
804	MANT. HIDRONEUMATICO.  FEBRERO 2016	F	1
805	MANT. JARDIN + FUMIGACION + TRAB. EXTRAS MARZO-2014  2  DE 2	F	1
806	MANT. JARDIN PODA Y FUMIGACION  ABRIL 2016	F	1
807	MANT. LIMP. DEL EDIFICIO ABRIL 2016	F	1
808	MANT. MOTOR PTA. ESTAC. ABR-2016+DIF.ENE-FEB-MAR-16	F	1
809	MANT. PTA ESTAC. ABRIL-16	F	1
810	MANT. PUERTA DE ESTAC  ABRIL 2016	F	1
811	MANT. PUERTA DE ESTAC. ABRIL 2016	F	1
812	MANT. PUERTA DE ESTACIONAMIENTO ( ABRIL 2016)	F	1
813	MANT. PUERTA ESTACIONAMIENTO.04/16	F	1
814	MANT. PUERTA ESTACIONAMIETO 01/2012	F	1
815	MANT. PUERTA ESTACIONAMIETO 01/2013	F	1
816	MANT. PUERTA ESTACIONAMIETO 02/2012	F	1
817	MANT. PUERTA ESTACIONAMIETO 02/2013	F	1
818	MANT. PUERTA ESTACIONAMIETO 03/2012	F	1
819	MANT. PUERTA ESTACIONAMIETO 03/2013	F	1
820	MANT. PUERTA ESTACIONAMIETO 04/2012	F	1
821	MANT. PUERTA ESTACIONAMIETO 04/2013	F	1
822	MANT. PUERTA ESTACIONAMIETO 05/2012 MAS DIF. ABRIL	F	1
823	MANT. PUERTA ESTACIONAMIETO 06/2011	F	1
824	MANT. PUERTA ESTACIONAMIETO 06/2012	F	1
825	MANT. PUERTA ESTACIONAMIETO 07/2011	F	1
826	MANT. PUERTA ESTACIONAMIETO 07/2012	F	1
827	MANT. PUERTA ESTACIONAMIETO 08/2011	F	1
828	MANT. PUERTA ESTACIONAMIETO 08/2012	F	1
829	MANT. PUERTA ESTACIONAMIETO 09/2011	F	1
830	MANT. PUERTA ESTACIONAMIETO 09/2012	F	1
831	MANT. PUERTA ESTACIONAMIETO 10/2011	F	1
832	MANT. PUERTA ESTACIONAMIETO 10/2012	F	1
833	MANT. PUERTA ESTACIONAMIETO 11/2011	F	1
834	MANT. PUERTA ESTACIONAMIETO 11/2012	F	1
835	MANT. PUERTA ESTACIONAMIETO 12/2011	F	1
836	MANT. PUERTA ESTACIONAMIETO 12/2012	F	1
837	MANT. PUERTA GARAJE ABRIL 2016	F	1
838	MANT. TIERRA Y ABONO  DE JARDIN HASTA FEBRERO 2016	F	1
839	MANT. Y FUMIGACION DE JARDINES ( ABRIL 016 )	F	1
840	MANT.. DE ASCENSORES  ( ABRIL 2016 )	F	1
841	MANT.. EQUIPO DE BOMBEO ( ABRIL 2016)	F	1
842	MANT.HIDRONEUMATICO NOV-2012	F	1
843	MANT.JARDIN,PODA Y SIEMBRA DE MATAS	F	1
844	MANTENIMIENTO  DE  ASCENSORES. 03/2016	F	1
845	MANTENIMIENTO  ELECTRICO  03/2016	F	1
846	MANTENIMIENTO ASCENSORES MARZO 2016	F	1
847	MANTENIMIENTO DE  ASCENSORES AGOSTO 2013	F	1
848	MANTENIMIENTO DE . JARDIN MAYO -2013	F	1
849	MANTENIMIENTO DE AIRE ACONDICIONADO 12/2007	F	1
850	MANTENIMIENTO DE ALARMA SEGUVIDA  MAYO-2012	F	1
851	MANTENIMIENTO DE AREAS COMUNES 12/ 2007	F	1
852	MANTENIMIENTO DE AREAS COMUNES ABRIL 2016	F	1
853	MANTENIMIENTO DE AREAS VERDES OCT-NOV-DIC-15+ENE-16	F	1
854	MANTENIMIENTO DE ASCENSORES	F	1
855	MANTENIMIENTO DE ASCENSORES  ABRIL 2016	F	1
856	MANTENIMIENTO DE ASCENSORES 02/2015	F	1
857	MANTENIMIENTO DE ASCENSORES 04/2016	F	1
858	MANTENIMIENTO DE ASCENSORES SEPTIEMBRE-2012	F	1
859	MANTENIMIENTO DE BOMBAS   02/2015	F	1
860	MANTENIMIENTO DE BOMBAS  04/2016	F	1
861	MANTENIMIENTO DE BOMBAS  ABRIL  2016	F	1
862	MANTENIMIENTO DE HIDRONEUMATICO  04/2016	F	1
863	MANTENIMIENTO DE HIDRONEUMATICO  DICIEMBRE 2012	F	1
864	MANTENIMIENTO DE HIDRONEUMATICO 12/2007	F	1
865	MANTENIMIENTO DE HIDRONEUMATICO ABRIL 2016	F	1
866	MANTENIMIENTO DE HIDRONEUMATICO SEPTIEMBRE  2012	F	1
867	MANTENIMIENTO DE JARDIN  04/2016	F	1
868	MANTENIMIENTO DE JARDIN ABR-2016	F	1
869	MANTENIMIENTO DE JARDIN ENE-DIC-2014	F	1
870	MANTENIMIENTO DE JARDIN NOV-DIC-15 2 DE 2	F	1
871	MANTENIMIENTO DE JARDIN SEPT-2015	F	1
872	MANTENIMIENTO DE JARDIN SEPTIEMBRE 2012	F	1
873	MANTENIMIENTO DE JARDINERIA 04/2016	F	1
874	MANTENIMIENTO DE LIMPIEZA JUNIO-2012	F	1
875	MANTENIMIENTO DE PISCINA   AGOSTO 2013	F	1
876	MANTENIMIENTO DE PUERTA ESTAC. SEPTIEMBRE 2012	F	1
877	MANTENIMIENTO DE PUERTAS 04/2016	F	1
878	MANTENIMIENTO DEL SISTEMA HIDRONEUMATICO	F	1
879	MANTENIMIENTO ELECTRICO	F	1
880	MANTENIMIENTO ELECTRICO SEPT-2014 Y MAR-2015	F	1
881	MANTENIMIENTO ELECTRICO Y TRAB ESPECIALES	F	1
882	MANTENIMIENTO ESCALERAS ELECTRICAS 12/ 2007	F	1
883	MANTENIMIENTO HIDRONEUMATICO  ABRIL-2012	F	1
884	MANTENIMIENTO PARQU Y JRDINES	F	1
885	MANTENIMIENTO PARQUE Y JARDINES	F	1
886	MANTENIMIENTO PARQUES Y JARDINES	F	1
887	MANTENIMIENTO PUERTA AUTOMATICA	F	1
888	MANTENIMIENTO PUERTA ELECTRICA  MARZO 2016	F	1
889	MANTENIMIENTO REJA DE ESTAC   03/2016	F	1
890	MANTENIMIENTO SIST. DE BOMBAS  03/2016	F	1
891	MANTENIMIENTO SIST. DE BOMBAS 07/2015	F	1
892	MANTENIMIENTO SIST. HIDRONEUMATICO  MARZO 2016	F	1
893	MANTENIMIENTOS PARQUES Y JARDINES	F	1
894	MAT DE IMPERMEABILIZACION  TECHO DEL EDIF.  3 DE 3	F	1
895	MAT Y M. DE O.PINTURA  DE LOS PATIOS 1 DE 3	F	1
896	MAT. DE PINTURA REJAS MAR-2015 2 DE 2	F	1
897	MAT. PARA REP DE INTERCOMUNICADORES  3 DE 3	F	1
898	MAT. Y M. DE O. REP DEL ASCENSOR 2 DE 2	F	1
899	MAT. Y M. DE O. REP DEL WC DE LA CONSERJERIA  2  DE  2	F	1
900	MAT. Y M. DE O. REPARACION TECHO POR FILTRACION	F	1
901	MATERIAL DE LIMPIEZA	F	1
902	MATERIAL DE LIMPIEZA 1/2	F	1
903	MATERIAL DE LIMPIEZA 1/4	F	1
904	MATERIAL DE LIMPIEZA 2/2	F	1
905	MATERIAL DE LIMPIEZA 2/5	F	1
906	MATERIAL DE LIMPIEZA 3/5	F	1
907	MATERIAL DE LIMPIEZA 4/5	F	1
908	MATERIAL DE LIMPIEZA 5/5	F	1
909	MATERIAL DE PINTURA PARA EL EDIFICIO	F	1
910	MATERIALES DE LIMPIEZA 1/5	F	1
911	MATERIALES DE LIMPIEZA 1/6	F	1
912	MATERIALES DE LIMPIEZA 2/4	F	1
913	MATERIALES DE LIMPIEZA 2/6	F	1
914	MATERIALES DE LIMPIEZA 3/4	F	1
915	MATERIALES DE LIMPIEZA 3/6	F	1
916	MATERIALES DE LIMPIEZA 4/4	F	1
917	MATERIALES DE LIMPIEZA 4/6	F	1
918	MATERIALES DE PINTURA F-5566 MARZO 2011	F	1
919	MATERIALES ELECTRICOS	F	1
920	MATERIALES ELECTRICOS Y DE FERRETERIA	F	1
921	MATERIALES OPTIMIZACION DE ENTRADA DE AGUA AL TANQUE	F	1
922	MATERIALES Y PEGA PISO DE LOS ASCENSORES 3 DE 3	F	1
923	MATRIAL DE LIMPIEZA	F	1
924	MEDICION PARA EL POZO DE AGUA	F	1
925	MILY	F	1
926	MONTO  DESCONTADO EN  TRANSFERENCIA BANCARIA	V	2
927	MULTA ESTACIONAR ZONA NO PERMITIDA	V	2
928	MULTA POR ESTAC. EN AREA COMUN O EN PUESTOS DE COPROP.	V	2
929	MULTA POR ESTACIONAR EN AREA NO PERMITIDA	V	1
930	MURALTA	F	1
931	OPER.PLANTA DE TRAT.+ ELECT.	F	1
932	OTROS FONDOS (ESTAC, S. DE FIESTA, INT.)	F	1
933	OTROS GASTOS DE LA CONSERJERIA	F	1
934	PAGO ADELANTADO REP ASC. T- 3  APROB ASAMBLEA  18/6/2015  3 DE 3	V	2
935	PAGO CESTATICKET  ABRIL-2016	F	1
936	PAGO DE 1 CISTERNA	V	2
937	PAGO DE 2 CISTERNAS	V	2
938	PAGO DE CESTATICKET  ABRIL  2016	F	1
939	PAGO DE CESTATICKET ABRIL-2016	F	1
940	PAGO DE DOS VIDRIOS ROTOS DE TORRE B 2009	V	2
941	PAGO DE FACTURAS VARIAS DE FERRETERIA	F	1
942	PAGO DE SUSCRIPCION ANUAL 2009/2010 2 DE 2	V	2
943	PAGO POR ANULACION TRABAJO ESTUDIO DE SUELO	F	1
944	PAGO POR USO DEL SALON DE FIESTA	V	2
945	PAGO S.S.O. PARO FORZOZO	F	1
946	PAISAJISMO NOMBRE DE LA URBANIZACION	F	1
947	PICO Y CONEXIONES DE MANGUERA (CCH)	F	1
948	PINTURA (REP. CUARTO ASEO Y BOMBAS	F	1
949	PINTURA CON COMPRESOR DE LAS REJAS INSTALADAS DE LOS SOTANOS	F	1
950	PINTURA PARA LAS AREAS COMUNES F-9640 NOV-2011 2 DE 2	F	1
951	PLANO DE ESTACION DE REBOMBEO DE HIDROCAPITAL	F	1
952	PLOMERIA AREA DE VIGILANCIA JULIO 2009	F	1
953	PLOMERIA DE TUBERIA DE LA BOMBA  MAYO-2015	F	1
955	PLOMERIA EN MEDIDOR DE LA ENTRADA	F	1
956	PLOMERIA MENOR EN GARITA, CONSERJERIA Y GARITA	F	1
957	PLOMERIA SISTEMA DE BOMBAS	F	1
958	PODA DE ARBOL Y LIMP. DEL AREA MAR-16	F	1
959	POLITICA HABITACIONAL	F	1
960	POLITICA HABITACIONAL DEL TRABAJADOR RESIDENCIAL	F	1
961	POLIZA FUMIGACION, DEST. DE TUB. LIMP. DE TANQUE 6 Y 7 DE 7	F	1
962	PRIMA SEGURO RESPONSABILIDAD EMPRESARIAL Y PATRONAL 2  DE 2	F	1
963	PROD. DE LIMP. F-24164 NOV-2014  4 DE 4	F	1
964	PROD. DE LIMPIEZA  SEPT-2014	F	1
965	PROD. DE LIMPIEZA  Y BOLSAS DE BASURA  MAR-2016   2 DE 2	F	1
966	PROD. DE LIMPIEZA F-48443  JULIO-2012	F	1
967	PROD. DE LIMPIEZA Y BOLSAS DE BAS. F-47129 Y  110203	F	1
968	PROD. DE LIMPIEZA Y BOLSAS DE BASURA F-47129	F	1
969	PROD. DE LIMPIEZA Y BOLSS DE BASURA ABR-2016  1 DE 2	F	1
970	PROD. LIMP. + JABON EN POLVO + 300 BOL. BASURA MAY-15  4 DE 4	F	1
971	PRODUCTOS DE LIMP. Y BOLSAS DE BASURA MAR-16	F	1
972	PRODUCTOS DE LIMPIEZA	F	1
973	PRODUCTOS DE LIMPIEZA  JULIO 2014  2 DE 2	F	1
974	PRODUCTOS DE LIMPIEZA  NOV-2014 Y FEB-2015 2 DE 2	F	1
975	PRODUCTOS DE LIMPIEZA (CCH)	F	1
976	PRODUCTOS DE LIMPIEZA ABRIL 2016	F	1
977	PRODUCTOS DE LIMPIEZA ABRIL-2012	F	1
978	PRODUCTOS DE LIMPIEZA DE MARZO 2013 F-51751	F	1
979	PRODUCTOS DE LIMPIEZA DIC-2015	F	1
980	PRODUCTOS DE LIMPIEZA ENE-FEB-2016	F	1
981	PRODUCTOS DE LIMPIEZA F-48443  JUL-2012	F	1
982	PRODUCTOS DE LIMPIEZA FEB-2016	F	1
983	PRODUCTOS DE LIMPIEZA NOV-2015  2  DE 2	F	1
984	PRODUCTOS DE LIMPIEZA PARA LA GARITA	F	1
985	PRODUCTOS DE LIMPIEZA SEPT-014	F	1
986	PRODUCTOS DE LIMPIEZA Y 300 BOLSAS DE BASURA	F	1
987	PRODUCTOS DE LIMPIEZA Y BOLSAS DE BASURA ENE-FEB-2016	F	1
988	PRODUCTOS DE LIMPIEZA Y COMPRA DE LIMAS	F	1
989	PRODUCTOS QUIMICOS MANT. PISCINA  07/2012	F	1
990	PROVISION TUB DE AGUAS SERVIDAS DEL TALUD 1 DE 2	F	1
991	PRUEBA NEUMATICA DEL SISTEMA DE GAS	F	1
992	QUIMICOS PARA LA PISCINA JUNIO 2013	F	1
993	RECARGA ANUAL DE EXTINTORES F-4194  NOV-2009	F	1
994	RECARGA DE 18 EXTINTORES ABC DE 10 LIBRAS	F	1
995	RECARGA DE EXTINTORES	F	1
996	RECARGA DE EXTINTORES OCT-14  CARONI	F	1
997	RECARGA DE GAS DEL AIRE ACONDICIONADO F.=7761 20/07/2006	F	1
998	RECARGA EXTINTORES 1/4	F	1
999	RECARGA EXTINTORES 2/4	F	1
1000	RECARGA EXTINTORES 3/4	F	1
1001	RECARGA EXTINTORES 4/4	F	1
1002	RECARGA Y COMPRA DE UN EXTINTOR 2 DE 2	F	1
1003	RECARGO POR ESTACIONAR EN AREA NO AUTORIZADA	V	2
1004	REDACCION DE NORMAS DE CONVIVENCIA JUNIO-2010	F	1
1005	REINTEGRO ALQUILER DE PUESTO DE ESTAC. ABRIL-MAYO 2012	V	2
1006	REINTEGRO ALQUILER PUESTO  ESTAC. 8 U.T.MARZO-2016	V	2
1007	REINTEGRO ALQUILER PUESTO DE ESTAC.  MARZO-2016	V	2
1010	REINTEGRO CAMBIO CERRAD. ENTRADA DEL EDIFICIO	F	1
1011	REINTEGRO CONDOMINIO ASOAVILEM A.C. MAR-2015	V	2
1012	REINTEGRO DE CONSUMO DE AGUA INDIVIDUAL 02/2015	F	1
1013	REINTEGRO DE INETRESES DE MORA NOV-DIC-2015	V	2
1014	REINTEGRO DEPOSITO SALON DE FIESTAS + INT.	V	2
1015	REINTEGRO DIF. SUM-COLOC. DE HEMBRILLA ELECTRICA PTA. PPAL	F	1
1016	REINTEGRO DIF.EN COBRO DE ALQ. PUESTO ESTAC.FEB-2012	V	2
1017	REINTEGRO EXPLORACION DE FILTRACION ESTAC..DIA SABADO	F	1
1018	REINTEGRO FIESTA DE NAVIDAD 2015	F	1
1019	REINTEGRO GASTOS DE CERRAJERIA DIC-2015	F	1
1020	REINTEGRO INT. + G. COBRANZA JUL-2015	V	2
1021	REINTEGRO MES DE OCTUBRE 2010	V	2
1022	REINTEGRO POR AJUSTE DE ALQUILER DE MALETERO	V	2
1023	REINTEGRO POR DIFERENCIA EN PAGO ABR-2011	V	2
1024	REINTEGRO POR ERROR EN LA EMISION DE FEBRERO 2009	V	2
1025	REINTEGRO SUPLENCIA PERSONAL DE MANT POR VACACIONES	F	1
1026	REINTEGRO SUPLENCIA TRAB. RESIDENCIAL POR VAC 2013-2014	F	1
1027	REINTGRO ALQUILER DE ESTAC.OCT-NOV.-DIC- 2008	V	2
1028	RENOVACION DEL RIF DEL EDIFICIO	F	1
1029	REP  TABL CONTROL/COMPRESOR  BOMBA AGUA 30% FACT 2166	F	1
1030	REP ASC. TORRE 3  APROB ASAMBLEA  18/6/2015  3 DE 3	V	2
1031	REP DE BOMBA PISCINA FLOT. ELECT Y LAVADO DE TANQUE  2 DE 3	F	1
1032	REP DE FILTRACION TUB.PPAL DE A. BLANCAS DE LOS PISOS	F	1
1033	REP DE HERRERIA REJA DE ESTAC. SEPT-2011 F-251 Y F-2405	F	1
1034	REP DE LAMP. Y ARREGLO DE SWITCHES Y BASURERO ABRIL-2012	F	1
1035	REP DE TARJETAS PORTONES DE ESTACIONAMIENTO	F	1
1036	REP PTAS DE VIDRIO TEMPLEX TA,TB Y S. REUNIONES	F	1
1037	REP PUERTA VIDRIO ESTAC.+SUM-COL DE HEMBRILLA ELECTRICA	F	1
1038	REP TUB ADUCION  2 PULG. TANQUE RESERVA MAR-2016	F	1
1039	REP. CAJA CHICA (CUADERNO/FORRO CARRITO/ BOMBILLOS PB)	F	1
1040	REP. DE ASCENSOR BOTON DE PB TORRE B	F	1
1041	REP. DE DOS LAMP. SUM-COL DE 11 LAMP..EN AREAS COMUNES MAR-2011	F	1
1042	REP. DE PUERTA DE ESTACIONAMIENTO	F	1
1043	REP. DE PUERTA DE GARAJE  2 DE 2	F	1
1044	REP. DEL ASCENSOR BOTONES DE LLAMADA	F	1
1045	REP. ELECT. GARITA DE VIGILANCIA	F	1
1046	REP. ELECTRICAS Y BOTE DE ESCOMBROS	F	1
1047	REP. SIST DE LLAVES  PTA PPAL. BAT-12V  3 DE 3	F	1
1048	REP. Y BAL SIST ELECT. CUARTO BOMBAS/FOTOCELULA  2 DE 2	F	1
1049	REP.DEL SISTEMA DE BOMBAS  NOV-2011	F	1
1050	REP.HERRERIA DE PORTONES REJA PTA, PPAL. ESTAC. MAYO-2010	F	1
1051	REP.SISTEMA HIDRONEUMATICO Y PLOMERA F-3216 FEB-2012  2 DE 2	F	1
1052	REPARACION ASCENSOR	F	1
1059	REPARACION CUARTO DE BASURA PLANTA PRINCIPAL	F	1
1060	REPARACION DE  REJA DE ENTRADA Y PUERTA DE VIDRIO	F	1
1061	REPARACION DE BOMBA DE AGUA  2 Y 3  DE 3	F	1
1062	REPARACION DE BOMBA QUEMADA 2 DE 2	F	1
1063	REPARACION DE FILTRACION EN TUBERIA PRINCIPAL	F	1
1064	REPARACION DE INTERCOMUNICADORES	F	1
1065	REPARACION DE LA PUERTA DE ESTACIONAMENTO 5 DE 5	F	1
1066	REPARACION DE LA PUERTA DE ESTACIONAMIENTO	F	1
1067	REPARACION DE LA TUBERIA DE GAS  3 DE 3	F	1
1068	REPARACION DE MICROSUICHE DE LA PUERTA	F	1
1069	REPARACION DE MOTOBOMBA F-72290  ABR-2011	F	1
1070	REPARACION DE REJA DE ESTAC. CHOCADA FACT. 0092 10/07/2009	V	1
1071	REPARACION DE TRES CERRADURAS DEL EDIFICIO MAYO-2012	F	1
1072	REPARACION DE TUBERIA  3 DE 3	F	1
1073	REPARACION DE TUBERIA PPAL DE AGUA BLANCAS  2 DE 2	F	1
1074	REPARACION DE TUBERIA PRINCIPAL DEL EDIFICIO  3  DE  3	F	1
1075	REPARACION DEL ASCENSOR	F	1
1076	REPARACION DEL ASCENSOR  1 DE 3	V	2
1077	REPARACION DEL ASCENSOR IZQUIERDO  ( 4 DE 4 )	F	1
1078	REPARACION DEL ASCENSOR PAR 2 DE 2	F	1
1080	REPARACION DEL HIDRONEUMAICO	F	1
1081	REPARACION DEL INTERCOMUNICADOR F-0050 JUL-2013  4  DE 4	F	1
1082	REPARACION DEL PORTON DE ESTACIONAMIENTO 2 DE 2	F	1
1083	REPARACION DEL PORTON PRINCIPAL DEL EDIFICIO	F	1
1084	REPARACION DEL SISTEMA HIDRONEUMATICO	F	1
1085	REPARACION DEL TECHO DEL LOBBY TORRE A	F	1
1086	REPARACION INTERCOMUNICADOR	F	1
1087	REPARACION INTERCOMUNICADOR 1/2	F	1
1088	REPARACION INTERCOMUNICADOR 2/2	F	1
1089	REPARACION LAMPARAS PISO 6 Y 9	F	1
1090	REPARACION PERTA	F	1
1091	REPARACION PUERTA	F	1
1057	REPARACION BAÑOS 5/6	F	1
1056	REPARACION BAÑOS 4/6	F	1
1055	REPARACION BAÑOS 3/6	F	1
1054	REPARACION BAÑOS 2/6	F	1
1008	REINTEGRO ARREGLO BAÑO DE LA CONSERJERIA  CUOTAS  4  DE  4	V	2
1009	REINTEGRO ARREGLO BAÑO DE LA CONSERJERIA  CUOTAS  5  DE  5	V	2
1079	REPARACION DEL BAÑO DE LA GARITA	F	1
1094	REPARACION PUERTA SALON DE FIESTA	F	1
1095	REPARACION Y MANTENIMIENTO CERCADO ELECTRICO	F	1
1096	REPARACION Y MANTENIMIENTO PARQUE Y JARDINES	F	1
1097	REPARACION Y SOLDADURA DEL DUCTO DE BASURA	F	1
1098	REPARACIONES EN EL CUARTO DE BASURA	F	1
1099	REPARAION PUERTA	F	1
1100	REPARCION DEL TABLERO ELECTRONICO DEL PORTON	V	2
1101	REPOSICION  DE CAJA CHICA  2015	F	1
1102	REPOSICION DE CAJA CHICA	F	1
1103	REPOSICION DE CAJA CHICA ABRIL 2016	F	1
1104	REPOSICION DE CAJA CHICA FEB-MAR-2016	F	1
1105	REPOSICION DE CAJA CHICA MAR-2016	F	1
1106	REPOSICION DE CAJA CHICA MAR-ABR-2015	F	1
1107	REPOSICION DE CUOTA INICIAL COMPRA PLANTA ELECTRICA	F	1
1108	REPOSICION FONDO DE CAJA CHICA	F	1
1109	REPOSICION VIDRIOS	F	1
1110	RETENCIONES SSO, P. FORZOZO, POL. HABIT. 02/2015	F	1
1111	REV Y REP CORTO CIRCUITO CON SUM DE CABLE PUNTO DE 220V	F	1
1112	REV.,AJUSTE Y PUESTA A FUNCIONAR REJA ESTAC.(CCH)	F	1
1113	REVERSO ALQ.PUESTO ESTAC. DIC-2009	V	2
1114	REVESTIMIENTO  COLUMNA PP FACTURA  0207	F	1
1115	REVISION DEL CERCO ELECTRICO	F	1
1116	RIF Y LIBRO DE ACTA	F	1
1117	ROBLES	F	1
1118	ROTACION DE TABLERO ELCTRICO EN LA CONSERJERIA DIC-2011	F	1
1119	S. S. O. Y PARO FORZOSO DE LA CONSERJE HASTA MARZO 2010	F	1
1120	S.O.O. DEL TRABAJADOR RESIDENCIAL	F	1
1121	S.S.0. Y PARO FORZOSO DE LA TRAB. RESIDENCIAL	F	1
1122	S.S.O. CONSERJE 05/2011 + DIF PAGO HASTA ABRIL 2011 1 DE 4	F	1
1123	S.S.O. DE LA TRAB. RESIDENCIAL ABRIL 2016	F	1
1124	S.S.O. MES DE ABRIL 2016	F	1
1125	S.S.O. Y PARO FORZOSO DE  LA TRAB. RESIDENCIAL	F	1
1126	S.S.O. Y PARO FORZOZO DE LA CONSERJE NOVIEMBRE 2009	F	1
1127	S.S.O.ABRIL-2016	F	1
1128	SACADO DE AGUA EN EL FOSO DEL ASCENSOR	F	1
1129	SACADO DE BASURA	F	1
1130	SALDO HORAS EXTRAS PENDIENTES VIGILANTES 3/3	F	1
1131	SEGUNDA COMPRA DE TUB. AGUAS BLANCAS Y SERVIDAS 4 DE 4	V	2
1132	SEGURIDAD Y VIGILANCIA  03/2016	F	1
1133	SEGURO SOCIAL  Y PARO FORZOSO  04/2016	F	1
1134	SEGURO SOCIAL 04/06	F	1
1135	SEGURO SOCIAL DE LA CONSERJE	F	1
1136	SEGURO SOCIAL OBLIGATORIO (APORTE PATRONAL  ABRIL-2016 )	F	1
1137	SEGURO SOCIAL PATRONO EST. ABRIL-2016	F	1
1138	SEGURO SOCIAL SEPTIEMBRE 2012	F	1
1139	SEGURO SOCIAL Y PARO FORZOZO	F	1
1140	SERV. VIG. EXTERNA ( ABRIL 2016)	F	1
1141	SERV. VIGILANCIA PUERTA TORRE C NIVEL C-3 11/2015	F	1
1142	SERVICIO  DE  VIGILANCIA PERIODO DEL 01 AL 30/12/2007	F	1
1143	SERVICIO DE ADMINIST. 02/2015	F	1
1144	SERVICIO DE CAMIONES DE AGUA	F	1
1145	SERVICIO DE GAS	F	1
1146	SERVICIO DE LIMPIEZA DEL EDIFICIO  ABR-2016 + DIF MAR-16	F	1
1147	SERVICIO DE MANTENIMIENTO DE SEGURICEL 04/2016	F	1
1148	SERVICIO DE VIGILANCIA	F	1
1149	SERVICIO DE VIGILANCIA  ABRIL 2016	F	1
1150	SERVICIO DE VIGILANCIA  ASOPASOLHA  MES  ABR-2016	F	1
1151	SERVICIO DE VIGILANCIA 03/2016	F	1
1152	SERVICIO DE VIGILANCIA ENTRADA TORRE B EN EL NIVEL C-3	V	2
1153	SERVICIO DE VIGILANCIA INTERNA  MES ABR-2016	F	1
1154	SERVICIO DE. VIIGILANCIA   11/2015	F	1
1155	SERVICIO DEVIGILANCIA 01 AL 31/05/2007 VIGILANCIA SALIENTE	F	1
1156	SERVICIO EXTERNO DE VIGILANCIA	F	1
1157	SERVICIO LIMPIEZA. INTERNA  ( ABRIL 2016 )	F	1
1158	SERVICIO PRIMARIO RESCARVEN OCT-15 A FEB-2016	F	1
1159	SERVICIO TECNICO DEL SISTEMA DE CAMARAS	F	1
1160	SERVICIO TELEFONICO 7538577  12/2007	F	1
1161	SERVICIOS DE ASESORIA ADMINISTRATIVA 04/2016	F	1
1162	SERVICIOS DE VIGILANCIA 04/2016	F	1
1163	SERVICONDOMINIOS	F	1
1164	SERVICONDOMINIOS 04/2016	F	1
1165	SILLA. FILTRO Y COCINA PERS. VIGILANCIA Y LIMPIEZA  3 DE 3	F	1
1166	SILLAS VIGILANCIA	F	1
1167	SUELDO DE LA  TRAB. RESIDENCIAL  03/2016	F	1
1168	SUELDO DE LA CONSERJE 05/2011	F	1
1169	SUELDO DE LA TRAB . RESIDENCIAL 4/16	F	1
1170	SUELDO DE LA TRAB. RESIDENCIAL	F	1
1171	SUELDO DE LA TRAB. RESIDENCIAL  ABRIL 2016	F	1
1172	SUELDO DE LA TRAB. RESIDENCIAL  ABRIL-2016	F	1
1173	SUELDO DE LA TRAB. RESIDENCIAL ABRIL 2016	F	1
1174	SUELDO DE LA TRAB. RESIDENCIAL ABRIL-2016	F	1
1175	SUELDO DE LA TRAB. RESIDENCIAL FEBRERO-2016	F	1
1176	SUELDO DE LA TRABAJADORA RESIDENCIAL  04/2016	F	1
1177	SUELDO DE LA TRABAJADORA RESIDENCIAL  NOV-15	F	1
1178	SUELDO DE LA TRABAJADORA RESIDENCIAL 04/2016	F	1
1179	SUELDO DEL PERSONAL DE LIMPIEZA. 04/2016	F	1
1180	SUELDO DEL PORTERO 04/2016	F	1
1181	SUELDO DEL SUPERVISOR  INTERNO 12/2007	F	1
1182	SUELDO DEL TRABAJADOR RESIDENCIAL	F	1
1183	SUELDO PERSONAL DE MANT. ELECT. AREAS COMUNES 12/2007	F	1
1184	SUELDO PERSONAL VIGILANCIA ABRIL 2016	F	1
1185	SUELDO TRAB-RES. TORRE 1  Y  3   ABRIL 2016	F	1
1186	SUELDO TRAB. RESIDENCIAL 04/2016	F	1
1187	SUELDO TRABAJADORA RESIDENCIAL ABRIL 2016	F	1
1188	SUELDO Y ASIGNACIONES DE VIG. 04/2016	F	1
1189	SUELDO Y BONOS VIGILANCIA 01/2012	F	1
1190	SUELDO Y BONOS VIGILANCIA 01/2013	F	1
1191	SUELDO Y BONOS VIGILANCIA 02/2012	F	1
1192	SUELDO Y BONOS VIGILANCIA 02/2013	F	1
1193	SUELDO Y BONOS VIGILANCIA 03/2012	F	1
1194	SUELDO Y BONOS VIGILANCIA 03/2013	F	1
1195	SUELDO Y BONOS VIGILANCIA 04/2012	F	1
1196	SUELDO Y BONOS VIGILANCIA 04/2013	F	1
1197	SUELDO Y BONOS VIGILANCIA 05/2012	F	1
1198	SUELDO Y BONOS VIGILANCIA 06/2011	F	1
1199	SUELDO Y BONOS VIGILANCIA 06/2012	F	1
1200	SUELDO Y BONOS VIGILANCIA 07/2011	F	1
1201	SUELDO Y BONOS VIGILANCIA 07/2012	F	1
1202	SUELDO Y BONOS VIGILANCIA 08/2011	F	1
1203	SUELDO Y BONOS VIGILANCIA 08/2012	F	1
1204	SUELDO Y BONOS VIGILANCIA 09/2011	F	1
1205	SUELDO Y BONOS VIGILANCIA 09/2012	F	1
1206	SUELDO Y BONOS VIGILANCIA 10/2011	F	1
1207	SUELDO Y BONOS VIGILANCIA 10/2012	F	1
1208	SUELDO Y BONOS VIGILANCIA 11/2011	F	1
1209	SUELDO Y BONOS VIGILANCIA 11/2012	F	1
1210	SUELDO Y BONOS VIGILANCIA 12/2011	F	1
1211	SUELDO Y BONOS VIGILANCIA 12/2012	F	1
1212	SUELDOS Y BONO CONSERJE 01/2012	F	1
1213	SUELDOS Y BONO CONSERJE 01/2013	F	1
1214	SUELDOS Y BONO CONSERJE 02/2012	F	1
1215	SUELDOS Y BONO CONSERJE 02/2013	F	1
1216	SUELDOS Y BONO CONSERJE 03/2012	F	1
1217	SUELDOS Y BONO CONSERJE 03/2013	F	1
1218	SUELDOS Y BONO CONSERJE 04/2012	F	1
1219	SUELDOS Y BONO CONSERJE 04/2013	F	1
1220	SUELDOS Y BONO CONSERJE 05/2012	F	1
1221	SUELDOS Y BONO CONSERJE 06/2011	F	1
1222	SUELDOS Y BONO CONSERJE 06/2012	F	1
1223	SUELDOS Y BONO CONSERJE 07/2011	F	1
1224	SUELDOS Y BONO CONSERJE 07/2012	F	1
1225	SUELDOS Y BONO CONSERJE 08/2011	F	1
1226	SUELDOS Y BONO CONSERJE 08/2012	F	1
1227	SUELDOS Y BONO CONSERJE 09/2011	F	1
1228	SUELDOS Y BONO CONSERJE 09/2012	F	1
1229	SUELDOS Y BONO CONSERJE 10/2011	F	1
1230	SUELDOS Y BONO CONSERJE 10/2012	F	1
1231	SUELDOS Y BONO CONSERJE 11/2011	F	1
1232	SUELDOS Y BONO CONSERJE 11/2012	F	1
1233	SUELDOS Y BONO CONSERJE 12/2011	F	1
1234	SUELDOS Y BONO CONSERJE 12/2012	F	1
1235	SUM DE  CONTROLES REMOTOS NUEVOS A BS. 70,00 CADA UNO	V	2
1236	SUM DE 4 CISTERNAS DE AGUA ABR-2016  1 DE 2	F	1
1237	SUM DE 6 CISTERNAS DE AGUA MAR-2016  1 DE 2	F	1
1238	SUM E  INST PLAFONES  TECHOS Y COLUMNAS CULMINACION PP 2/2	F	1
1239	SUM Y COL DE 8 ACRILICOS PARA TECHO ASCENSORES	F	1
1240	SUM Y COL DE PLANTA DE OZONO	F	1
1241	SUM Y COLOC DE PUENTE RECTIFICADOR  DEL  ASCENSOR	F	1
1242	SUM Y COLOC. ARRANCADOR Y  BOBINA  DE CONTACTOR JUL-09	F	1
1243	SUM Y COLOC. DE RELOJ EN TABLERO DE LAS BOMBAS	F	1
1244	SUM-COL 17 BAT. LAMP. EMERG. + 2 LAMP. NUEVAS  5 DE 5	F	1
1245	SUM-COL BOTONERA Y LLAVE DE CONTACTO TRR B Y D MAR-2016	F	1
1246	SUM-COL BRAZO HIDRAULICO PISO PTA DE VIDRIO ENT. PPAL  2  DE  2	F	1
1247	SUM-COL CIRCUITO INTEGRADO DEL  INTERC. JUL-2010	F	1
1248	SUM-COL CONTACTOR TABLERO. TANQ. RESIDUAL MAR -2012 2 DE 2	F	1
1249	SUM-COL CONTACTOR Y RELE TERMICO BOMBA DE ACHIQUE 2 DE 2	F	1
1250	SUM-COL DE 3 BRAZOS PARA CIERRE DE PUERTA 2 DE 2	F	1
1251	SUM-COL DE 4 BOTONERAS SMART DE PISO	F	1
1252	SUM-COL DE 4 CERRADURAS S.FIESTAS PUERTAS DE VIDRIO	F	1
1253	SUM-COL DE BASE EN PIPOTE DE BASURA	F	1
1254	SUM-COL DE BOMBA PARA EL TANQUE RESIDUAL 4 DE 4	F	1
1255	SUM-COL DE BOYA DE FLOTANTE F-4445 ENE-2011	F	1
1256	SUM-COL DE CABLEADO Y FLOTANTE ELECTRICO	F	1
1257	SUM-COL DE CONTACTOR 35AMP.220W TAB. DE BOMBAS TRR 3	F	1
1258	SUM-COL DE FAJA DE 4 PULGADAS	F	1
1259	SUM-COL DE FLOTANTE MECANICO 1 1/2 PULG  MAYO-2015	F	1
1260	SUM-COL DE GRIFERIA DE FREGADERO DE LA TRAB. RES.  3 DE 3	F	1
1261	SUM-COL DE IDENTIF. ACRILICOS A. COMUNES FEB-2012  2 DE 2	F	1
1262	SUM-COL DE MARACA Y REP DE FUGA DE AIRE	F	1
1263	SUM-COL DE RECEPTOR UNIX PUERTA DE ESTACIONAMIENTO  3 DE 3	F	1
1264	SUM-COL DE TUB COBRE COMP.Y MANT. PULMON FEB-2012 1 DE 2	F	1
1265	SUM-COL DE UN MAGNETO TERMICO	F	1
1266	SUM-COL DE VALVULA CHECK 3 DE 3	F	1
1267	SUM-COL DE VALVULA CHECK DE 1/2 PULG. FEB-16	F	1
1268	SUM-COL DE VIDRIOS Y TRANCADORES EN SF  3 DE 3	F	1
1269	SUM-COL DOS JUEGOS DE CONTACTO DELASCENSOR	F	1
1270	SUM-COL LISTON DE APERTURA DE PUERTAS ABR-2013	F	1
1271	SUM-COL. DE 6 LLAVES  DE PASO  DEL TANQUE AEREO  6  DE 6	F	1
1272	SUM-COL. DE BRAZO PUERTA  NIVEL SALON DE F.   2 DE 2	F	1
1273	SUM-COL. GRUPO FREGADERO CONSERJ. F-23077 Y 78 SEPT-09  2 DE 2	F	1
1274	SUM-COL.HEMBRILLA Y REP SIST. PUERTA C-3 F-2798 OCT-2010 1 DE 2	F	1
1275	SUM-COLOC DE 18 BOMBILLOS PASILLOS FEB-2011	F	1
1276	SUM-COLOC DE CERRADURA PTA DE VIDRIO N-SF Y CIL DEP N-SF	F	1
1277	SUM-COLOC DE CHICHARRA PARA INTERCOMUNICADOR	V	2
1278	SUM-COLOC DE TB. 4 PUNTOS JARDIN AREA SOCIAL 2 DE 2	F	1
1279	SUM-INST FLOT. ELECT. TANQUE  TECHO TORRE 1	F	1
1280	SUM-INST. DE ACEITERAS DEL SISTEMA DE CONTRAPESO	F	1
1281	SUM-INST. DE CONTACTOR DE POTENCIA TORRE 5	F	1
1282	SUM. HEMBRILLA ELECT. PTA. PPAL DEL EDIF.  2  DE 2	F	1
1283	SUM. Y COL DE CORREA COMPRESOR SISTEMA DE BOMBEO ENE-14	F	1
1284	SUM. Y COL. DE TAB. ELECT. ENCENDIDO LUCES ESTAC. JUN-09	F	1
1285	SUM. Y COLOC DE DOS ROLINERAS DEL REDUCTOR F-61621 FEB-2011	F	1
1286	SUM. Y COLOC. DE FAROS DE LUZ ENT. PRINCIPALES F.-150750 3 DE 5	F	1
1287	SUM. Y COLOC. DE LAMINAS DE METAL EN PASILLOS 7 Y 8	F	1
1288	SUM. Y COLOC. DE TUB. DE 2" 4 DE 4	F	1
1290	SUM. Y COLOC.DE GOMA DE ACOPLE PTA BATIENTE NIVEL SEIS	F	1
1291	SUM.- COL. FLOT. MECANICO C/BOYA DE BRONCE 2 DE 2	F	1
1292	SUM.- COLOC. DE PULMON SIST. BOMBAS APROB. EN ASABLEA 3 DE 3	V	2
1293	SUMINISTRO DE UNA CISTERNA DE AGUA	V	2
1294	SUPL DE LA TRAB. RESIDENCIAL VAC. 2014-2015  2 DE 2	F	1
1295	SUPL. DE LA SRA LORENA OSPINO VAC-2013-2014 2 DE 2	F	1
1296	SUPL. DE LA TRAB. RESIDENCIAL POR VAC. 2013-2014  1 DE 2	F	1
1297	SUPLENCIA DE LA TRAB RES. POR VACACIONES 2 DE 2	F	1
1298	SUPLENCIA DE LA TRAB RESIDENCIAL DIAS PEND. VAC.	F	1
1299	SUPLENCIA DE LA TRAB. RESIDENCIAL	F	1
1300	SUPLENCIA DE LA TRAB. RESIDENCIAL 2014-2015 1 DE 2	F	1
1301	SUPLENCIA DE LA TRAB. RESIDENCIAL POR VACACIONES	F	1
1302	SUPLENCIA DE LA TRAB. RESIDENCIAL VAC  2014-2015	F	1
1303	SUPLENCIA DE VIG. C. MARQUEZ 2 DE 2	F	1
1304	SUPLENCIA DEL SR.JAIRO POR VACACIONES	F	1
1305	SUPLENCIA PERSONAL DE VIG.POR VACACIONES	F	1
1306	SUPLENCIA POR VAC DE LA TRAB RESIDENCIAL  2 DE 2	F	1
1307	SUPLENCIA POR VAC. 2014-2015 DE LA TRAB. RESIDENCIAL	F	1
1308	SUPLENCIA POR VAC. SR. JAIRO	F	1
1309	SUPLENCIA POR VACACIONES	F	1
1310	SUPLENCIA POR VACACIONES DE LA TRAB. RESIDENCIAL  2 DE 3	F	1
1311	SUPLENCIA TRAB. RESIDENCIAL POR VAC. 2013 - 2014	F	1
1312	SUPLENCIA TRAB.RESIDENCIAL  VAC-2014-2015	F	1
1313	SUPLENCIA VACACIONES	F	1
1314	SUPLENCIA VIGILANTE	F	1
1315	TC	F	1
1316	TELEFONO   ABRIL 2016	F	1
1317	TELEFONO CONSERJERIA	F	1
1318	TELEFONO CONSERJERIA Y CAMARAS INTERNET ( ABRIL 2016)	F	1
1319	TELEFONO DE LA CONSERJERIA   04/2016	F	1
1320	TELEFONO DE LA CONSERJERIA  04/2016	F	1
1321	TELEFONO DE LA CONSERJERIA 05/2011	F	1
1322	TELEFONO DE LA CONSERJERIA JUL A OCT 2015	F	1
1323	TELEFONO DE LA CONSERJERIA SEPTIEMBRE 2012	F	1
1324	TELEFONO RES. TRAB. RESIDENCIAL ABRIL-2016	F	1
1325	TELEFONO TRABAJADOR RESIDENCIAL	F	1
1326	TIERRA ABONADA Y SUMINISTRO DE PLANTAS	F	1
1327	TRAB DE ELECT. EN TERR 4 CON SUM DE MATERIALES	F	1
1328	TRAB DE REP EN LA TANQUILLA DEL GAS DEL EDIFICIO	F	1
1329	TRAB ELECT. AUTOM. ENCEND. LUCES  ESTAC. MAY-09 2/2	F	1
1331	TRAB. DE PLOMERIA EN EL PISO 1  2 DE 2	F	1
1332	TRAB.ESTABILIZACION DE TALUD EN TERRAZA CUATRO  3 DE 3	F	1
1333	TRABAJO ALCANTARILLADO	F	1
1334	TRABAJO DE ALCANTARILLADO Y PINTURA	F	1
1335	TRABAJO DE CERRAJERIA	F	1
1336	TRABAJO DE ELECTRICIDAD	F	1
1337	TRABAJO DE ELECTRICIDAD 1/3	F	1
1338	TRABAJO DE ELECTRICIDAD 2/3	F	1
1339	TRABAJO DE ELECTRICIDAD 3/3	F	1
1340	TRABAJO DE IMPERMEABILIZACION	F	1
1341	TRABAJO DE IMPERMEABILIZACION CUOTA 1/6	F	1
1342	TRABAJO DE IMPERMEABILIZACION CUOTA 2/6	F	1
1343	TRABAJO DE JARDINERIA	F	1
1344	TRABAJO DE LIMPIEZA 1/2	F	1
1345	TRABAJO DE LIMPIEZA 2/2	F	1
1346	TRABAJO DE PINTURA EN EL TECHO DEL ASCENSOR	F	1
1347	TRABAJO DE PLOMERIA	F	1
1348	TRABAJO DE PLOMERIA 1/2	F	1
1349	TRABAJO DE PLOMERIA 2/2	F	1
1350	TRABAJO DE PLOMERIA EN AREA COMUN PISO 1	F	1
1351	TRABAJO DE PLOMERIA TORRE  A  2 DE 2	F	1
1352	TRABAJOS ADICIONALES DE ELECTRICIDAD 2/2	F	1
1355	TRABAJOS ALCANTARILLADOS	F	1
1356	TRABAJOS ANEXOS A LA REMOCION DE TIERRA	F	1
1357	TRABAJOS DE ALCANTRILLADO	F	1
1358	TRABAJOS DE ELECTRICIDAD	F	1
1359	TRABAJOS DE ELECTRICIDAD 1/3	F	1
1360	TRABAJOS DE ELECTRICIDAD 1/4	F	1
1361	TRABAJOS DE ELECTRICIDAD 1/6	F	1
1362	TRABAJOS DE ELECTRICIDAD 2/3	F	1
1363	TRABAJOS DE ELECTRICIDAD 2/4	F	1
1364	TRABAJOS DE ELECTRICIDAD 2/6	F	1
1365	TRABAJOS DE ELECTRICIDAD 3/3	F	1
1366	TRABAJOS DE ELECTRICIDAD 3/4	F	1
1367	TRABAJOS DE ELECTRICIDAD 3/6	F	1
1368	TRABAJOS DE ELECTRICIDAD 4/4	F	1
1369	TRABAJOS DE ELECTRICIDAD 4/6	F	1
1370	TRABAJOS DE ELECTRICIDAD 5/6	F	1
1371	TRABAJOS DE ELECTRICIDAD 6/6	F	1
1372	TRABAJOS DE PLOMERIA	F	1
1373	TRABAJOS DE PLOMERIA 1/2	F	1
1374	TRABAJOS DE PLOMERIA 2/2	F	1
1375	TRABAJOS EN ESTACIONAMIENTO 1/2	F	1
1376	TRABAJOS EN ESTACIONAMIENTO 2/2	F	1
1378	TRAMITES DIVERSOS	F	1
1379	TRANFERENCIA NO EFECTIVA	V	2
1380	TRANSFERENCIA  NO PASO REC. SEPT-14 A FEB-15	V	2
1381	TRANSP. REVIS. LIMP.Y DESTAP BOMBA SUMERGIBLE EMERG. 2 DE 2	F	1
1382	UNIDAD TRIBUTARIA  F. RESERVA APROBADA EN ASAMBLEA DIC-15	V	2
1383	UNIDAD TRIBUTARIA  F. RESERVA APROBADA EN ASAMBLEA FEB-16	V	2
1384	UNIFORMES	F	1
1385	UNIFORMES PERSONAL DE VIGILANCIA	F	1
1386	UNIFORMES VIGILANTES	F	1
1387	USO DE ESPACIO COMUN NO PERMITIDO PARA FIESTA	V	2
1388	UTENSILIOS DE JARDINERIA	F	1
1389	UTILES ESCOLARES	F	1
1390	UTILES ESCOLARES 1/4	F	1
1391	UTILES ESCOLARES 2/4	F	1
1392	UTILES ESCOLARES 3/4	F	1
1393	UTILES ESCOLARES 4/4	F	1
1394	V	F	1
1395	VACACIONES	F	1
1396	VACACIONES CONSERJE	F	1
1397	VACACIONES DE LA TRAB RESIDENCIA 2014-15  1 DE 2	F	1
1398	VACACIONES DE LA TRABAJADORA RESIDENCIAL	F	1
1399	VACACIONES PERSONAL DE LIMPIEZA 2014/2015  4 DE 4	F	1
1400	VACACIONES PERSONAL DE LIMPIEZA WUILMER MANZO	F	2
1401	VACACIONES VIGILANTE	F	1
1402	VACACIONES VIGILANTES 1/2	F	1
1403	VACACIONES VIGILANTES 2/2	F	1
1404	VARIOS (CCH)	F	1
1405	VENENO PARA RATAS FEBRERO 2010	F	1
1406	VIG. Y ASORAMAL EQUIPOS DE SEG. 2015/2016 3 DE 3	V	2
1407	VIGILANCIA ASORAMAL ABRIL 2016	V	2
1408	VIGILANCIA PRIVADA ABRIL 2016	F	1
1409	VIGILANCIA PRIVADA MARZO 2016	F	1
1410	�	F	1
34	ALBAÑIL. Y PINT. PARED DUCTO VENT. COCINA LINEA 4 Y 2-3   1 DE 2	F	1
1411	HASTA AQUI CENTRO POLO I TORRE C	F	1
1353	TRABAJOS ALBAÑILERIA	F	1
1354	TRABAJOS ALBAÑILERIA, PLOMERIA	F	1
1377	TRABAJOS VARIOS EN EL EDIFICIO AÑO 2015	F	1
1289	SUM. Y COLOC. PUERTA MET. CON MARCO BAÑO VIGILANCIA	F	1
1330	TRAB. DE ALBAÑILERIA EN REP. DE FILTRACION TUB. PPAL.	F	1
1058	REPARACION BAÑOS 6/6	F	1
1053	REPARACION BAÑOS 1/6	F	1
291	DAÑO DEL ASCENSOR POR SOBREPESO 2 DE 2	V	2
106	BONIFICACION DE FIN DE AÑO DE LA CONSERJE  2009 2 DE  2	F	1
543	HASTA  AQUI GAVIOTAS	F	1
954	PLOMERIA EN LOS PISOS 9 Y 11 Y BAÑO DEL SF	F	1
\.


--
-- TOC entry 2455 (class 0 OID 0)
-- Dependencies: 187
-- Name: cd_conceptos_cd_conceptos_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cd_conceptos_cd_conceptos_pk_seq', 1411, true);


--
-- TOC entry 2400 (class 0 OID 79279)
-- Dependencies: 188
-- Data for Name: cd_conjuntos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cd_conjuntos (cd_conjuntos_pk, nombre, direccion) FROM stdin;
1	CENTRO POLO I	CALLE CHAMA CON GARCILAZO, COLINAS DE BELLO MONTE, CARACAS EDO. MIRANDA
2	CONDOMINIO	AV. SANZ EL MARQUEZ
3	CONDOMINIO	AV. LAS ACACIAS
4	CONDOMINIO	EL ROSAL
5	RES. LAS GAVIOTAS	COLINAS DE BELLO MONTE
6	CONDOMINIO	AV. LAS PALMAS
7	EDIFICIO	CALLE INTERVECINAL
8	RESIDENCIAS	EL CAFETAL
9	CONJ. RESIDENCIAL	SANTE FE, CALLE VALLE ALTO
10	RESIDENCIAS	CUMBRES DE CURUMO
11	CONJUNTOS	CUMBRES DE CURUMO
12	RESIDENCIAS	LA GUAIRITA
13	RESIDENCIAS	PARQUE COLINA "A"
14	RESIDENCIAS	SANTA MONICA
15	RESIDENCIAS AVILEM	LA CANDELARIA
16	RESIDENCIAS	CALLE CARONI
17	CONJ. RES.	LOMA LINDA
18	RESIDENCIAS	COLINAS DE BELLO MONTE
19	RESIDENCIAS	LOMAS DEL SOL
20	EDIFICIO	CHACAO
21	RESIDENCIAS	EL HATILLO
22	RESIDENCIAS	COLINAS DE BELLO MONTE
23	CONDOMINIO	CALLE LA UNION VISTA EL VALLE
24	RESIDENCIAS	ACACIAS PLAZA
25	COND. EDIF.	GRAN AVENIDA DE SABANA GRANDE
26	EDIFICIO	SABANA GRANDE
27	RESIDENCIAS	SAINT TROPEZ
28	TERRAZAS	FIN DEL MUNDO
29	EDIFICIO	AV. PRINCIPAL DE LA IRBINA
30	EDIFICIO	AV. PRINCIPAL DE LA URBINA
\.


--
-- TOC entry 2456 (class 0 OID 0)
-- Dependencies: 189
-- Name: cd_conjuntos_cd_conjuntos_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cd_conjuntos_cd_conjuntos_pk_seq', 30, true);


--
-- TOC entry 2402 (class 0 OID 79284)
-- Dependencies: 190
-- Data for Name: cd_deudas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cd_deudas (cd_deudas_pk, cod_apto, cod_conjunto, cod_edificio, fecha_deuda, fecha_cancelado, monto, interes, nro_doc, nro_cheque) FROM stdin;
\.


--
-- TOC entry 2457 (class 0 OID 0)
-- Dependencies: 191
-- Name: cd_deudas_cd_deudas_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cd_deudas_cd_deudas_pk_seq', 1, false);


--
-- TOC entry 2404 (class 0 OID 79289)
-- Dependencies: 192
-- Data for Name: cd_edificios; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cd_edificios (cd_edificios_pk, cod_conjunto, nombre_edificio, nombre_concerje, telf_concerje, porcentaje_nro1, email, porcentaje_nro2, agua, fondo_nro1, fondo_nro2, fondo_nro3, fondo_nro4, fondo_nro5, fondo_nro6, fondo_nro7, fondo_nro8) FROM stdin;
3	1	A	CENTRO COMERCIAL	234	5.0000	N/A	5.0000	0.0000	360	370	448	0	0	0	0	0
5	1	NO TIENE	TORRE A	4444444	10.0000	N/A	0.0000	0.0000	360	150	0	0	0	0	0	0
6	2	HELENA	RESIDENCIAS ARIES	2	10.0000	N/A	0.0000	0.0000	360	150	778	779	682	0	0	0
7	3	YANELIS	RES. ALBARREGAS	0	40.0000	N/A	0.0000	0.0000	360	150	419	0	0	0	0	0
9	5	CARMEN	TORRES  1-2 Y 3	7540909	10.0000	N/A	0.0000	0.0000	360	150	875	0	0	0	0	0
10	6	NO HAY	RESIDENCIAS  MARCONI	9999998	10.0000	N/A	0.0000	0.0000	360	150	689	685	651	0	0	0
11	7	NOHAY	MONTERIA	9879874	10.0000	N/A	0.0000	0.0000	360	150	0	0	0	0	0	0
12	8	NOHAY	GUARICHAL	4569712	10.0000	N/A	0.0000	0.0000	714	150	731	0	0	0	0	0
13	9	0	0	0	10.0000	N/A	0.0000	0.0000	360	604	603	0	0	0	0	0
14	10	CARMEN	GUARACARUMBO	9784225	14.0000	N/A	0.0000	0.0000	360	977	1004	0	0	0	0	0
15	11	0	0	0	25.0000	N/A	0.0000	0.0000	360	150	0	0	0	0	0	0
19	14	0	0	0	20.0000	N/A	0.0000	0.0000	360	0	0	0	0	0	0	0
20	15	NO HAY	" A "	6662222	10.0000	N/A	0.0000	0.0000	360	150	0	0	0	0	0	0
21	15	NO HAY	" B "	7773333	10.0000	N/A	0.0000	0.0000	360	150	0	0	0	0	0	0
22	16	NO HAY	EMINENCE PALACE	8884444	15.0000	N/A	0.0000	0.0000	360	150	1203	1222	0	0	0	0
23	17	NO HAY	LOMA LINDA TOWN HOUSES	9991111	10.0000	N/A	0.0000	0.0000	360	1250	1243	0	0	0	0	0
24	18	0	0	0	10.0000	N/A	0.0000	0.0000	360	1251	0	0	0	0	0	0
25	19	NO HAY	CIMA AVILA	42142142	10.0000	N/A	0.0000	0.0000	360	0	0	0	0	0	0	0
26	20	NO HAY	LEANDRO	123456789	10.0000	N/A	0.0000	0.0000	360	150	1298	0	0	0	0	0
27	21	MMMMMM	MURALTA TORRE A	99999999	15.0000	N/A	0.0000	0.0000	360	0	1335	1342	0	0	0	0
28	21	MMMMMM	MURALTA TORRE B	9999999999	15.0000	N/A	0.0000	0.0000	360	0	1335	1342	0	0	0	0
29	21	MMMMMM	MURALTA TORRE C	9999999	15.0000	N/A	0.0000	0.0000	360	0	1335	1342	0	0	0	0
30	21	MMMMMM	MURALTA TORRE D	9999999	15.0000	N/A	0.0000	0.0000	360	0	1335	1342	0	0	0	0
31	21	MMMMMM	MURALTA ESTACIONAMIENTO	9999999	15.0000	N/A	0.0000	0.0000	360	0	1335	1342	0	0	0	0
32	21	MMMMMM	MURALTA MALETEROS	9999999	15.0000	N/A	0.0000	0.0000	360	0	1335	1342	0	0	0	0
33	22	XXXXX	MILY TORRE  A	2127530000	10.0000	N/A	0.0000	0.0000	360	150	1393	0	0	0	0	0
34	23	EDGAR	RESIDENCIAS JAJI	2129530000	10.0000	N/A	0.0000	0.0000	360	150	0	0	0	1353	0	0
35	22	XXXXX	MILY TORRE  B	2127530000	10.0000	N/A	0.0000	0.0000	360	150	1393	0	0	0	0	0
36	24	DORIS	ACACIAS PLAZA	432432432	10.0000	N/A	0.0000	0.0000	360	150	0	0	0	0	0	0
37	25	NO HAY	RES. CARONI	666666433	10.0000	N/A	0.0000	0.0000	360	1491	150	419	0	0	0	0
38	25	NO HAY	RES. ARAUCA	666666434	10.0000	N/A	0.0000	0.0000	360	1491	150	419	0	0	0	0
39	19	NO HAY	CIMA AVILA	521521521	10.0000	N/A	0.0000	0.0000	360	0	0	0	0	0	0	0
40	26	NO HAY	LOS CERRITOS	316264777	10.0000	N/A	0.0000	0.0000	360	0	0	0	0	0	0	0
41	27	NO HAY	SAINT TROPEZ	529529529	20.0000	N/A	0.0000	0.0000	360	150	0	0	0	0	0	0
42	28	NO HAY	DE ALTO HATILLO	530530530	10.0000	N/A	0.0000	0.0000	360	1596	0	0	0	0	0	0
43	30	NO HAY	LOS ROBLES A	530530530	10.0000	N/A	0.0000	0.0000	360	150	1679	1680	1681	1682	1683	1684
44	30	NO HAY	LOS ROBLES B	530530530	10.0000	N/A	0.0000	0.0000	360	150	1679	1680	1681	1682	1683	1684
1	1	N/A	N/A	0	5.0000	N/A	5.0000	0.0000	360	370	409	150	429	594	407	451
2	1	N/A	N/A	0	5.0000	N/A	5.0000	0.0000	360	370	409	150	0	594	407	451
8	4	N/A	N/A	0	15.0000	N/A	0.0000	0.0000	360	150	0	0	0	0	0	0
17	12	N/A	N/A	0	10.0000	N/A	0.0000	0.0000	1085	150	1172	0	0	0	0	0
4	1	N/A	N/A	0	5.0000	N/A	5.0000	0.0000	360	370	409	150	429	0	0	0
18	13	N/A	N/A	0	15.0000	N/A	0.0000	0.0000	360	150	1127	0	0	0	0	0
\.


--
-- TOC entry 2458 (class 0 OID 0)
-- Dependencies: 193
-- Name: cd_edificios_cd_edificios_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cd_edificios_cd_edificios_pk_seq', 44, true);


--
-- TOC entry 2406 (class 0 OID 79303)
-- Dependencies: 194
-- Data for Name: cd_fondos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cd_fondos (cd_fondos_pk, cod_conjunto, cod_edificio, cod_concepto, fecha_i, fecha_f, monto_g, nro_cuotas, cuota_m, gastos) FROM stdin;
\.


--
-- TOC entry 2459 (class 0 OID 0)
-- Dependencies: 195
-- Name: cd_fondos_cd_fondos_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cd_fondos_cd_fondos_pk_seq', 1, false);


--
-- TOC entry 2408 (class 0 OID 79308)
-- Dependencies: 196
-- Data for Name: cd_historicos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cd_historicos (cd_historicos_pk, cod_observacion, cod_deuda, cod_apto, cod_conjunto, cod_edificio, fecha, monto, apagar, recibo) FROM stdin;
\.


--
-- TOC entry 2460 (class 0 OID 0)
-- Dependencies: 197
-- Name: cd_historicos_cd_historicos_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cd_historicos_cd_historicos_pk_seq', 1, false);


--
-- TOC entry 2410 (class 0 OID 79313)
-- Dependencies: 198
-- Data for Name: cd_mantenimientos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cd_mantenimientos (cd_mantenimientos_pk, correlativo) FROM stdin;
\.


--
-- TOC entry 2461 (class 0 OID 0)
-- Dependencies: 199
-- Name: cd_mantenimientos_cd_mantenimientos_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cd_mantenimientos_cd_mantenimientos_pk_seq', 1, false);


--
-- TOC entry 2412 (class 0 OID 79318)
-- Dependencies: 200
-- Data for Name: cd_mov_chequeras; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cd_mov_chequeras (cd_mov_chequeras_pk, cod_concepto, cod_proveedor, nro_cheque, factura, monto, nro_cuenta, fecha) FROM stdin;
\.


--
-- TOC entry 2413 (class 0 OID 79324)
-- Dependencies: 201
-- Data for Name: cd_mov_mes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cd_mov_mes (cd_mov_mes_pk, cod_concepto, cod_apto, cod_conjunto, cod_edificio, fecha, monto) FROM stdin;
\.


--
-- TOC entry 2414 (class 0 OID 79327)
-- Dependencies: 202
-- Data for Name: cd_observaciones; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cd_observaciones (cd_observaciones_pk, descripcion) FROM stdin;
\.


--
-- TOC entry 2462 (class 0 OID 0)
-- Dependencies: 203
-- Name: cd_observaciones_cd_observaciones_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cd_observaciones_cd_observaciones_pk_seq', 1, false);


--
-- TOC entry 2429 (class 0 OID 79648)
-- Dependencies: 217
-- Data for Name: cd_propietarios; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cd_propietarios (cd_propietarios_pk, cod_user, nro_piso, nombre, apellido, nro_cedula, telf_local, telf_celular, fax, alicuota, quien_vive, direccion, direccion_cobro) FROM stdin;
1512	0	1	Y SRA.	LEON AMELINCKX	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A
82	0	8	ALMOGUERA	LUIS	0	N/A	N/A	N/A	0.0366	N/A	N/A	N/A
191	0	12	BARRETO	OSCAR	0	N/A	N/A	N/A	0.0366	N/A	N/A	N/A
1063	0	7	MARTINEZ	ALEJANDRO	0	N/A	N/A	N/A	0.0366	N/A	N/A	N/A
1346	0	4	ROSALES	ALBERTO	0	N/A	N/A	N/A	0.0366	N/A	N/A	N/A
305	0	4	CARRASCO	ADELA	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A
365	0	2	COVA	ALEJANDRO	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A
521	0	1	FIGUEIRA	CARLOS	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A
645	0	8	HERNANDEZ	FERNANDO	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A
1305	0	2	ROBAYO L.	CARLOS A.	0	N/A	N/A	N/A	0.0220	N/A	N/A	N/A
1332	0	6	ROMERO	FRANCISCO A.	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A
253	0	PH	CAMPO PALMA	YANETH DEL CARMEN	0	N/A	N/A	N/A	0.0294	N/A	N/A	N/A
322	0	PB	CHACIN MARTINEZ	ALBERTO	0	N/A	N/A	N/A	0.0423	N/A	N/A	N/A
560	0	3	GARCIA DIAZ	VIRGINIA	0	N/A	N/A	N/A	0.0421	N/A	N/A	N/A
875	0	1	LANDAETA	ROLANDO	0	N/A	N/A	N/A	0.0421	N/A	N/A	N/A
877	0	PB	LAUGHLIN	GEORGE	0	N/A	N/A	N/A	0.0393	N/A	N/A	N/A
1390	0	PH	SEQUERA	GELVIS	0	N/A	N/A	N/A	0.0570	N/A	N/A	N/A
1398	0	1	SIERRALTA	JESUS	0	N/A	N/A	N/A	0.0421	N/A	N/A	N/A
244	0	P	C.A.	TELE CUATRO,	0	N/A	N/A	N/A	0.0048	N/A	N/A	N/A
287	0	12	CARMEN	OJEDA	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
750	0	5	JAVIER H.	CASTILLO MONCADA	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
74	0	5	ALFREDO	MARANDO  FALCIGLIA	0	7515142	N/A	N/A	0.0089	N/A	N/A	N/A
31	0	12	AILID DEYANIRA	BARRIOS GOLDING	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A
65	0	3	ALEXIS	FLORES	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A
71	0	10	ALFREDO	MARANDO   FALCIGLIA	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A
81	0	3	ALFREDO	SEVER  MENDEZ	0	N/A	N/A	N/A	0.0066	N/A	N/A	N/A
1198	0	3	PASQUALE	DELL'AQUILA	0	N/A	N/A	N/A	0.1059	N/A	N/A	N/A
114	0	6	ANDRE	KHAYAN  BABIKIAN	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A
1492	0	11	VOLCA	C. A.	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A
36	0	2	ALBERTO	FERNANDEZ	0	N/A	N/A	N/A	0.1059	N/A	N/A	N/A
37	0	1	ALBERTO	GURREIRO	0	N/A	N/A	N/A	0.0843	N/A	N/A	N/A
416	0	2	DOLORES	PABON	0	N/A	N/A	N/A	0.0442	N/A	N/A	N/A
483	0	1	ESPERANZA	GIL	0	N/A	N/A	N/A	0.1059	N/A	N/A	N/A
505	0	2	FEDERICO	ROJAS	0	N/A	N/A	N/A	0.0843	N/A	N/A	N/A
556	0	PB	GAETANO	BIUNDO	0	N/A	N/A	N/A	0.0923	N/A	N/A	N/A
773	0	PB	JOEL	MUJICA	0	N/A	N/A	N/A	0.0843	N/A	N/A	N/A
775	0	PB	JONATHAN	BARRERO	0	N/A	N/A	N/A	0.0442	N/A	N/A	N/A
1419	0	11	SUAREZ CEDE�O	CRUZ MARIA	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
1440	0	6	TOMASELLO MINEO	ANTONIO	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
1444	0	7	TOVAR LUENGA	MARIA MILAGRO	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
100	0	3	AMERICA DEL CARMEN	JIMENEZ	0	632-8757	N/A	N/A	0.0090	N/A	N/A	N/A
112	0	11	ANAEM  M.	CARO MONTES DE OCA	0	753-8592;  979-6973	N/A	N/A	0.0089	N/A	N/A	N/A
1458	0	8	VALLEJO	CORINA	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
366	0	5	CRESPILLO	MONIKA	0	1	N/A	N/A	0.0067	N/A	N/A	N/A
1502	0	2	WILMA	PUCHE	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
1464	0	2	VEGLIANTE G.  Y SRA	MICHELE	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
1549	0	7	ZULEIMA DE CASTILLO	LUBIN CASTILLO	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
1201	0	3	PAULA	RASTELLI	0	N/A	N/A	N/A	0.0843	N/A	N/A	N/A
1348	0	3	ROSANGELA	NATERA	0	N/A	N/A	N/A	0.0442	N/A	N/A	N/A
1436	0	1	THARIK	ESCALONA	0	N/A	N/A	N/A	0.0442	N/A	N/A	N/A
1011	0	PH	MARIA ANTONIETA	PACIELLO	0	N/A	N/A	N/A	0.0762	N/A	N/A	N/A
3	0	3	090663 C.A.	CORPORACION	0	83	N/A	N/A	0.0085	N/A	N/A	N/A
328	0	2	CIMA 0411 C.A.	INVERSIONES	0	70	N/A	N/A	0.0085	N/A	N/A	N/A
329	0	2	CIMA 1302 C.A.	INVERSIONES	0	69	N/A	N/A	0.0085	N/A	N/A	N/A
330	0	2	CIMA 2805, C. A.	INVERSIONES	0	81	N/A	N/A	0.0085	N/A	N/A	N/A
331	0	PB	CIMA AVILA 23, C.A.	INVERSIONES	0	2	N/A	N/A	0.0094	N/A	N/A	N/A
332	0	6	CIMA AVILA 23, C.A.	INVERSIONES	0	2	N/A	N/A	0.0098	N/A	N/A	N/A
333	0	6	CIMA AVILA 23, C.A.	INVERSIONES	0	66	N/A	N/A	0.0098	N/A	N/A	N/A
334	0	4	CIMA AVILA 23, C.A.	INVERSIONES	0	74	N/A	N/A	0.0085	N/A	N/A	N/A
335	0	6	CIMA AVILA 23, C.A.	INVERSIONES	0	78	N/A	N/A	0.0085	N/A	N/A	N/A
336	0	7	CIMA AVILA 23, C.A.	INVERSIONES	0	80	N/A	N/A	0.0148	N/A	N/A	N/A
337	0	4	CIMA AVILA 23, C.A.	INVERSIONES	0	85	N/A	N/A	0.0085	N/A	N/A	N/A
338	0	7	CIMA AVILA 23, C.A.	INVERSIONES	0	91	N/A	N/A	0.0148	N/A	N/A	N/A
339	0	PB	CIMA AVILA 23, C.A.	INVERSIONES	0	93	N/A	N/A	0.0089	N/A	N/A	N/A
341	0	5	CIMA AVILA 23, C.A.	INVERSIONES	0	105	N/A	N/A	0.0089	N/A	N/A	N/A
342	0	5	CIMA AVILA 23, C.A.	INVERSIONES	0	106	N/A	N/A	0.0086	N/A	N/A	N/A
343	0	7	CIMA AVILA 23, C.A.	INVERSIONES	0	111	N/A	N/A	0.0183	N/A	N/A	N/A
344	0	7	CIMA AVILA 23, C.A.	INVERSIONES	0	113	N/A	N/A	0.0225	N/A	N/A	N/A
1496	0	6	WENDY	ESTRELLA YANNARELLA	0	731-2632;  081-651548	014-2651442	N/A	0.0063	P	N/A	N/A
741	0	5	J.M. 52,  C.A.	DESARROLLOS	0	N/A	N/A	N/A	0.0019	N/A	N/A	N/A
1015	0	PB	MARIA CONCEPCION	BLANCO	0	N/A	N/A	N/A	0.0098	N/A	N/A	N/A
1509	0	1	Y S. CHAVEZ	ALBERTO BURRAJO	0	N/A	N/A	N/A	0.0019	N/A	N/A	N/A
55	0	3	ALEJANDRO	SIERRA	0	N/A	N/A	N/A	0.0094	N/A	N/A	N/A
1224	0	12	PILAR  C.	VAZ  MACEIRA	0	N/A	N/A	N/A	0.0066	N/A	N/A	N/A
1520	0	1	YELVIS MARINA	LEON CASTRO	0	N/A	N/A	N/A	0.0062	N/A	N/A	N/A
1547	0	3	ZULAY JOSEFINA	RIDRIGUEZ FIGUERA	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A
591	0	1	GLORIA	NAVARRO	0	N/A	N/A	N/A	0.0087	N/A	N/A	N/A
1093	0	2	MIGUEL	OTAOLA	0	N/A	N/A	N/A	0.0505	N/A	N/A	N/A
6	0	3	ABDALLAH KHABBAZE Y	NORMA DE KHABBAZE	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A
13	0	4	ADALBERTO	GABALDON	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A
92	0	2	ALVARO RUIZ  Y	MIRIAM PEREZ C.	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A
211	0	4	BERNARDO	RATMIROFF  Y  SRA.	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A
262	0	2	CARLOS	ALVARADO  G.	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A
263	0	7	CARLOS	BARROETA	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A
356	0	3	COMUNICACION	ACD	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A
364	0	4	CORINA  ALEJANDRA	MORIN  CEDE�O	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A
513	0	2	FERNANDO	ALBA HERNANDEZ	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A
609	0	5	GRACIELA T.	MORANDIN ZAMOLO	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A
644	0	1	HERNAN  F.	HERNANDEZ	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A
668	0	PH	IGLESIAS	JOSE  REY	0	N/A	N/A	N/A	0.0368	N/A	N/A	N/A
731	0	6	ITALO	PIMENTEL	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A
744	0	7	JAIME	GOMEZ  CASTRO	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A
765	0	3	JESUS  ORANGEL	PEREIRA  V.	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A
778	0	2	JORGE	URDANETA  GALVE	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A
783	0	PH	JOSE	CARMONA	0	N/A	N/A	N/A	0.0368	N/A	N/A	N/A
864	0	1	JUVENCIO  PULGAR	TROCONIS	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A
623	0	7	GUMERSINDO	MENDEZ MORENO	0	N/A	N/A	N/A	0.0064	N/A	N/A	N/A
910	0	1	LINDA	GARCIA  R.	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A
809	0	1	JOSE ANGEL	PAZ	0	N/A	N/A	N/A	0.0470	N/A	N/A	N/A
309	0	4	CASADALBE, C.A.	INVERSIONES	0	N/A	N/A	N/A	0.0186	N/A	N/A	N/A
683	0	6	INCERTO SILVESTRI	ANTONIO	0	N/A	N/A	N/A	0.0201	N/A	N/A	N/A
129	0	6	ANGULO	MARDIN	0	N/A	N/A	N/A	0.0185	N/A	N/A	N/A
576	0	3	GILIB	JUAN LUIS CASTELLANOS	0	N/A	N/A	N/A	0.0185	N/A	N/A	N/A
108	0	5	ANA K.H., C.A.	INVERSIONES	0	N/A	N/A	N/A	0.0150	N/A	N/A	N/A
229	0	6	BRACHO	VICTOR	0	N/A	N/A	N/A	0.0185	N/A	N/A	N/A
610	0	PB	GREAT HOMES	INVERSIONES	0	N/A	N/A	N/A	0.0188	N/A	N/A	N/A
1044	0	PH	MARILYN T.	CARLOS RONDON /	0	N/A	N/A	N/A	0.0198	N/A	N/A	N/A
1195	0	1	PARTNERCA,C.A.	INVERSIONES	0	N/A	N/A	N/A	0.0186	N/A	N/A	N/A
1320	0	2	RODRIGUEZ	JUAN CARLOS	0	N/A	N/A	N/A	0.0186	N/A	N/A	N/A
1107	0	3	MOLINA	EUGENIO	0	N/A	N/A	N/A	0.0152	N/A	N/A	N/A
649	0	E	HILLOCK	INVERSIONES	0	N/A	N/A	N/A	0.0004	N/A	N/A	N/A
1119	0	E	MURALTA	DESARROLLOS	0	N/A	N/A	N/A	0.0002	N/A	N/A	N/A
650	0	M	HILLOCK	INVERSIONES	0	N/A	N/A	N/A	0.0007	N/A	N/A	N/A
1120	0	M	MURALTA	DESARROLLOS	0	N/A	N/A	N/A	0.0014	N/A	N/A	N/A
203	0	2	BELLOMO	TRIFONE	0	N/A	N/A	N/A	0.0218	N/A	N/A	N/A
387	0	7	DE  HENRIQUEZ	FILOMENA G	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A
647	0	3	HERNANDEZ	OSWALDO J.	0	N/A	N/A	N/A	0.0217	N/A	N/A	N/A
1453	0	6	URDANETA	GUSTAVO	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A
23	0	06	ADRIANO	SIERRA  ESCARRAGA	0	271	N/A	N/A	0.0132	N/A	N/A	N/A
29	0	PB	AGUSTIN	GONCALVES	0	271	N/A	N/A	0.0416	N/A	N/A	N/A
46	0	09	ALCIDES	FARIAS	0	271	N/A	N/A	0.0132	N/A	N/A	N/A
66	0	15	ALEXIS	HERNANDEZ	0	271	N/A	N/A	0.0132	N/A	N/A	N/A
98	0	16	AMAYA	MAGUREGUI	0	271	N/A	N/A	0.0132	N/A	N/A	N/A
102	0	14	AMPARO	MARI	0	271	N/A	N/A	0.0132	N/A	N/A	N/A
104	0	02	ANA	VILLARROEL	0	271	N/A	N/A	0.0134	N/A	N/A	N/A
111	0	07	ANA TERESA	SANOJA PERDOMO	0	271	N/A	N/A	0.0134	N/A	N/A	N/A
123	0	06	ANGEL	LOPEZ	0	271	N/A	N/A	0.0132	N/A	N/A	N/A
124	0	12	ANGEL IRAN	APARICIO PERNIA	0	271	N/A	N/A	0.0134	N/A	N/A	N/A
921	0	7	LORENZO	SEIJAS  LOPEZ	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A
934	0	4	LUIGI	PACILLI	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A
1271	0	PB	RAUL	RAMIREZ	0	N/A	N/A	N/A	0.0975	N/A	N/A	N/A
949	0	5	LUIS  CARLOS	SILVA  SAGASETA	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A
956	0	PH	LUIS MANUEL	SALAMANCA PEREZ	0	N/A	N/A	N/A	0.0368	N/A	N/A	N/A
1016	0	6	MARIA DEL CARMEN	GARCIA  B.	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A
1026	0	6	MARIA LUISA	ARIAS MORAIS	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A
1032	0	5	MARIA TERESA  SAGASETA	DE  SILVA	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A
1076	0	1	MEDARDO	MEDINA  PUIG	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A
91	0	M	ALVARO	RUIZ LUNA	0	N/A	N/A	N/A	0.0418	N/A	N/A	N/A
136	0	04	ANTONIO	ANATO	0	N/A	N/A	N/A	0.0151	N/A	N/A	N/A
159	0	03	ARGENIS HERNAN	CASTRO LUCENA	0	N/A	N/A	N/A	0.0151	N/A	N/A	N/A
171	0	SO	ASOAVILEM	A.C.	0	N/A	N/A	N/A	0.1024	N/A	N/A	N/A
254	0	02	CANDELARIA SOTO /	LINO TOMEI	0	N/A	N/A	N/A	0.0151	N/A	N/A	N/A
435	0	02	EDOCONSTRUR	C.A.	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A
456	0	01	ELISA	CABANA DE NEVADO	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A
461	0	01	ELIZABETH	RUIZ LUNA	0	N/A	N/A	N/A	0.0151	N/A	N/A	N/A
608	0	07	GONZALO DIAZ Y	DIXIE PERDOMO	0	N/A	N/A	N/A	0.0151	N/A	N/A	N/A
162	0	9	ARIAS	AIDA	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A
200	0	5	BELISA LLANOS	A. GABRIELA/	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A
248	0	11	CALELLO	LUCIANO	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A
400	0	PH	DE PEREDA	EUDOXIA LECUNA	0	N/A	N/A	N/A	0.0356	N/A	N/A	N/A
482	0	10	ESCOBAR	CECILIA	0	N/A	N/A	N/A	0.0216	N/A	N/A	N/A
922	0	5	LORETO	ANDREA	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A
1146	0	6	NILA	CASANOVA	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A
1147	0	3	NINA  ELENA	ESTE SALAS	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A
1173	0	7	ORLANDO  VICENTE	RODRIGUEZ	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A
1215	0	2	PEREGRINA	RIVERA  PEREZ	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A
1235	0	3	PURA  F.	DE  FERMIN	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A
1249	0	2	RAIMOND J. HAMONI  Y	TUBRESA  HAMAO	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A
1277	0	5	REINA	REYES  JIMENEZ	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A
1306	0	6	ROBERT	BLANKENSHIP	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A
1341	0	7	ROSA  S.	CAMMARDELLA  S.	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A
1355	0	4	RUDI	MAGDALENIC CARRIO	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A
1364	0	2	SACHA ROHAN	FERNANDEZ CABRERA	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A
1375	0	6	SANDRA B. GINER	JOSE R. DE NOBREA SUAREZ	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A
1377	0	2	SANTIAGO	PENA  RICO	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A
1490	0	5	VIVIANA  DE  M.	ROBERTO  MORENO  Y	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A
1524	0	7	YEPEZ COLMENARES	GERMAN E.	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A
1536	0	4	ZAIRA	ATIQUE  CRUZ	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A
1548	0	1	ZULAY VERA	DURAND	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A
95	0	6	AMANCIO	LOPEZ	0	N/A	N/A	N/A	0.0404	N/A	N/A	N/A
96	0	6	AMANCIO	LOPEZ	0	N/A	N/A	N/A	0.0404	N/A	N/A	N/A
120	0	9	ANDRES	MOURELOS	0	N/A	N/A	N/A	0.0404	N/A	N/A	N/A
232	0	7	BRUNA	PACE	0	N/A	N/A	N/A	0.0404	N/A	N/A	N/A
233	0	7	BRUNA	PACE	0	N/A	N/A	N/A	0.0404	N/A	N/A	N/A
273	0	2	CARLOS  A.	MENDOZA	0	N/A	N/A	N/A	0.0404	N/A	N/A	N/A
381	0	3	DANIEL	REQUEIJO	0	N/A	N/A	N/A	0.0404	N/A	N/A	N/A
422	0	8	DORIS ANGELICA	VALERO ARANGURE	0	N/A	N/A	N/A	0.0404	N/A	N/A	N/A
433	0	9	EDITH	OROZCO  RAMIREZ	0	N/A	N/A	N/A	0.0404	N/A	N/A	N/A
436	0	1	EDUAR A.	BELTRAN CEDE�O	0	N/A	N/A	N/A	0.0404	N/A	N/A	N/A
539	0	12	FRANCISCO J.	COBO	0	N/A	N/A	N/A	0.0404	N/A	N/A	N/A
671	0	5	ILEANA MORELBA	RIVAS QUINTERO	0	N/A	N/A	N/A	0.0404	N/A	N/A	N/A
846	0	11	JUAN M.	WEISSHAAR	0	N/A	N/A	N/A	0.0404	N/A	N/A	N/A
895	0	5	LEONEL	HERNANDEZ	0	N/A	N/A	N/A	0.0404	N/A	N/A	N/A
936	0	13	LUIS	CAPRILES	0	N/A	N/A	N/A	0.0720	N/A	N/A	N/A
976	0	8	MANUEL	GONZALEZ	0	N/A	N/A	N/A	0.0404	N/A	N/A	N/A
1149	0	4	NOHELYS JUDITH	PERDOMO C.	0	N/A	N/A	N/A	0.0404	N/A	N/A	N/A
1162	0	1	OLGA	PERAZA	0	N/A	N/A	N/A	0.0404	N/A	N/A	N/A
1202	0	10	PAULINA ISABEL	TORRES	0	N/A	N/A	N/A	0.0404	N/A	N/A	N/A
1274	0	12	REBECA	DE SANTIS	0	N/A	N/A	N/A	0.0404	N/A	N/A	N/A
1356	0	11	RUFINA	LOPEZ	0	N/A	N/A	N/A	0.0404	N/A	N/A	N/A
1379	0	3	SANTIAGO ANTONIO	SALAZAR BORGES	0	N/A	N/A	N/A	0.0404	N/A	N/A	N/A
1428	0	10	TATIANA	KOCHANOSKY	0	N/A	N/A	N/A	0.0404	N/A	N/A	N/A
1437	0	4	THOMAS	GIBBS	0	N/A	N/A	N/A	0.0404	N/A	N/A	N/A
119	0	PB	ANDRES	GARCIA	0	N/A	N/A	N/A	0.0918	N/A	N/A	N/A
223	0	4	BODO	BITTKAN	0	N/A	N/A	N/A	0.0676	N/A	N/A	N/A
286	0	4	CARMEN	LOPEZ N.	0	N/A	N/A	N/A	0.0676	N/A	N/A	N/A
384	0	6	DANIELCOELLO	MARSINYACH	0	N/A	N/A	N/A	0.0676	N/A	N/A	N/A
639	0	2	HELENA	MENDEZ DE BELDA	0	N/A	N/A	N/A	0.0676	N/A	N/A	N/A
138	0	18	ANTONIO	ARIAS	0	271	N/A	N/A	0.0134	N/A	N/A	N/A
669	0	PH	IGNACIO L.	RIVERO	0	N/A	N/A	N/A	0.0966	N/A	N/A	N/A
754	0	3	JESUS	ALFARO	0	N/A	N/A	N/A	0.0676	N/A	N/A	N/A
811	0	1	JOSE CARLOS	DE GOUVEIA	0	N/A	N/A	N/A	0.0676	N/A	N/A	N/A
944	0	2	LUIS	PASTORI APONTE	0	N/A	N/A	N/A	0.0676	N/A	N/A	N/A
1089	0	6	MERCEDEZ	HERNANDEZ	0	N/A	N/A	N/A	0.0676	N/A	N/A	N/A
1140	0	5	NEUGIN BEATRIZ	PASTORI	0	N/A	N/A	N/A	0.0676	N/A	N/A	N/A
1167	0	5	OLIVIO	DA SILVA VIERA	0	N/A	N/A	N/A	0.0676	N/A	N/A	N/A
164	0	04	ARLENE T	SANCHEZ  B.	0	271	N/A	N/A	0.0132	N/A	N/A	N/A
172	0	15	ASTRID	HOLMQUIST	0	271	N/A	N/A	0.0132	N/A	N/A	N/A
173	0	03	ASTRID	MARIN	0	271	N/A	N/A	0.0132	N/A	N/A	N/A
270	0	13	CARLOS	GONCALVES	0	271	N/A	N/A	0.0132	N/A	N/A	N/A
271	0	06	CARLOS	ROJAS	0	271	N/A	N/A	0.0134	N/A	N/A	N/A
272	0	09	CARLOS	VILLARROEL	0	271	N/A	N/A	0.0134	N/A	N/A	N/A
291	0	14	CARMEN  MARIA	SUAREZ	0	271	N/A	N/A	0.0134	N/A	N/A	N/A
296	0	09	CARMEN MARIA	SUAREZ	0	271	N/A	N/A	0.0132	N/A	N/A	N/A
355	0	16	COLMAN	GARCIA	0	271	N/A	N/A	0.0134	N/A	N/A	N/A
377	0	10	DALIA	MORALES	0	271	N/A	N/A	0.0134	N/A	N/A	N/A
1172	0	1	OMAR	MAZEI	0	N/A	N/A	N/A	0.0676	N/A	N/A	N/A
1222	0	3	PIETRO	TRISTAMO	0	N/A	N/A	N/A	0.0676	N/A	N/A	N/A
121	0	1	ANDRES	RODRIGUEZ	0	N/A	N/A	N/A	0.0506	N/A	N/A	N/A
214	0	1	BETSABE DE U./	LEANDRO USECHE	0	N/A	N/A	N/A	0.0506	N/A	N/A	N/A
277	0	8	CARLOS E.	BALDERRAMA	0	N/A	N/A	N/A	0.0506	N/A	N/A	N/A
358	0	3	CONST.	ALASIA	0	N/A	N/A	N/A	0.0506	N/A	N/A	N/A
370	0	PH	D.	ALASIA	0	N/A	N/A	N/A	0.0892	N/A	N/A	N/A
509	0	5	FELIX	TEJERO	0	N/A	N/A	N/A	0.0506	N/A	N/A	N/A
663	0	7	I.	SCHILLANI	0	N/A	N/A	N/A	0.0506	N/A	N/A	N/A
724	0	9	IRENE	COLMENARES	0	N/A	N/A	N/A	0.0506	N/A	N/A	N/A
444	0	1	EINNA, C.A.	CONSTRUCTORA	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A
737	0	8	J.	DE BALDERRAMA	0	N/A	N/A	N/A	0.0506	N/A	N/A	N/A
879	0	2	LAURA DE	BENSHIMOL	0	N/A	N/A	N/A	0.0506	N/A	N/A	N/A
1030	0	5	MARIA T. DE	DIAZ	0	N/A	N/A	N/A	0.0506	N/A	N/A	N/A
445	0	1	EINNA, C.A.	CONSTRUCTORA	0	N/A	N/A	N/A	0.0214	N/A	N/A	N/A
446	0	1	EINNA, C.A.	CONSTRUCTORA	0	N/A	N/A	N/A	0.0152	N/A	N/A	N/A
1041	0	4	MARIELA DE	LUGO	0	N/A	N/A	N/A	0.0506	N/A	N/A	N/A
447	0	1	EINNA, C.A.	CONSTRUCTORA	0	N/A	N/A	N/A	0.0149	N/A	N/A	N/A
1066	0	6	MARY JOSEFINA	FLORES ALFONSO	0	N/A	N/A	N/A	0.0506	N/A	N/A	N/A
448	0	PB	EINNA, C.A.	CONSTRUCTORA	0	N/A	N/A	N/A	0.0214	N/A	N/A	N/A
1176	0	9	OSCAR	MENDOZA RINCONES	0	N/A	N/A	N/A	0.0506	N/A	N/A	N/A
1325	0	3	RODRIGUEZ VILLAR	CAROLINA	0	N/A	N/A	N/A	0.0506	N/A	N/A	N/A
1389	0	6	SEHIDY	TORRES	0	N/A	N/A	N/A	0.0506	N/A	N/A	N/A
1439	0	2	TOMAS	ANDONEGNI	0	N/A	N/A	N/A	0.0506	N/A	N/A	N/A
449	0	PB	EINNA, C.A.	CONSTRUCTORA	0	N/A	N/A	N/A	0.0197	N/A	N/A	N/A
1469	0	4	VICENTE	ALEMAN	0	N/A	N/A	N/A	0.0506	N/A	N/A	N/A
450	0	PB	EINNA, C.A.	CONSTRUCTORA	0	N/A	N/A	N/A	0.0146	N/A	N/A	N/A
1487	0	7	VINCENZO	FUSCO	0	N/A	N/A	N/A	0.0506	N/A	N/A	N/A
116	0	5	ANDRES	AMELINCKX	0	N/A	N/A	N/A	0.0756	N/A	N/A	N/A
166	0	5	ARMINDO	OLIVEIRA	0	N/A	N/A	N/A	0.0759	N/A	N/A	N/A
519	0	2	FERNANDO	RENTERIA	0	N/A	N/A	N/A	0.0490	N/A	N/A	N/A
666	0	3	IBRAHIN ALBERTO	ARTEAGA	0	N/A	N/A	N/A	0.0490	N/A	N/A	N/A
682	0	3	INARCLE, C.A.	INMOBILIARIA	0	N/A	N/A	N/A	0.0505	N/A	N/A	N/A
746	0	1	JAIME	ROSS	0	N/A	N/A	N/A	0.0505	N/A	N/A	N/A
788	0	1	JOSE	FERNANDEZ	0	N/A	N/A	N/A	0.0490	N/A	N/A	N/A
929	0	4	LOURDES HAYEK	DE CHACAL	0	N/A	N/A	N/A	0.0759	N/A	N/A	N/A
955	0	1	LUIS G.	DUARTE	0	N/A	N/A	N/A	0.0505	N/A	N/A	N/A
1023	0	2	MARIA ISABELLA	CIRIGLIANO	0	N/A	N/A	N/A	0.0490	N/A	N/A	N/A
1038	0	2	MARICARMEN	GOMEZ	0	N/A	N/A	N/A	0.0505	N/A	N/A	N/A
1039	0	3	MARICARMEN	GOMEZ	0	N/A	N/A	N/A	0.0505	N/A	N/A	N/A
1517	0	2	YARITZA	SILVA	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A
1040	0	4	MARICARMEN	GOMEZ	0	N/A	N/A	N/A	0.0490	N/A	N/A	N/A
1094	0	3	MIGUEL	TRUNFIO TUDISCO	0	N/A	N/A	N/A	0.0490	N/A	N/A	N/A
1200	0	4	PATRICIA	VEGAS	0	N/A	N/A	N/A	0.0756	N/A	N/A	N/A
1423	0	4	TALINA	TAWID	0	N/A	N/A	N/A	0.0505	N/A	N/A	N/A
1438	0	1	TIZIANO	BURGONI	0	N/A	N/A	N/A	0.0490	N/A	N/A	N/A
126	0	5	ANGELA	DE CATANESE	0	N/A	N/A	N/A	0.0902	N/A	N/A	N/A
137	0	2	ANTONIO	ANTOR	0	N/A	N/A	N/A	0.0877	N/A	N/A	N/A
169	0	4	ARTURO	PUENTE	0	N/A	N/A	N/A	0.0877	N/A	N/A	N/A
298	0	5	CARMEN S. DE LAYA Y	JOSE LAYA	0	N/A	N/A	N/A	0.0902	N/A	N/A	N/A
607	0	PB	GONZALO	SANTANA LOPEZ	0	N/A	N/A	N/A	0.1182	N/A	N/A	N/A
624	0	1	GUSTAVO	LOZADA V.	0	N/A	N/A	N/A	0.0877	N/A	N/A	N/A
626	0	3	GUSTAVO	ORTIZ	0	N/A	N/A	N/A	0.0877	N/A	N/A	N/A
708	0	3	INVERSIONES	GUARAVIVI, C.A.	0	N/A	N/A	N/A	0.0877	N/A	N/A	N/A
882	0	1	LEIVA ZABALETA	ARMANDI LOZADA	0	N/A	N/A	N/A	0.0877	N/A	N/A	N/A
1029	0	2	MARIA SINESI	RICHARD YARJOUR	0	N/A	N/A	N/A	0.0877	N/A	N/A	N/A
1142	0	4	NICOLA	MORETTI	0	N/A	N/A	N/A	0.0877	N/A	N/A	N/A
109	0	1	ANA KATINA	PINZON	0	N/A	N/A	N/A	0.0940	N/A	N/A	N/A
477	0	3	ENRIQUE	LIBERATORE	0	N/A	N/A	N/A	0.0919	N/A	N/A	N/A
569	0	1	GERARDO	CHACON	0	N/A	N/A	N/A	0.0905	N/A	N/A	N/A
689	0	5	INGRID ORIHUELA	DE GONZALEZ	0	N/A	N/A	N/A	0.0870	N/A	N/A	N/A
820	0	2	JOSE M. MONIZ	DE ABREU	0	N/A	N/A	N/A	0.0870	N/A	N/A	N/A
942	0	2	LUIS	MAZZEI	0	N/A	N/A	N/A	0.0919	N/A	N/A	N/A
1031	0	4	MARIA TERESA	VILLER DE TORRES	0	N/A	N/A	N/A	0.0919	N/A	N/A	N/A
1062	0	4	MARTIN	RONDON	0	N/A	N/A	N/A	0.0870	N/A	N/A	N/A
1269	0	PH	RAUL	HERNANDEZ	0	N/A	N/A	N/A	0.0940	N/A	N/A	N/A
1527	0	3	YOLANDA	DE CONDERO	0	N/A	N/A	N/A	0.0870	N/A	N/A	N/A
10	0	2	ACEVEDO	GUIOMAR	0	N/A	N/A	N/A	0.0324	N/A	N/A	N/A
68	0	4	ALEXIS SANCHEZ Y	LUISA E. SANCHEZ	0	N/A	N/A	N/A	0.0324	N/A	N/A	N/A
225	0	9	BORGES	ALBERTO	0	N/A	N/A	N/A	0.0324	N/A	N/A	N/A
375	0	2	DA SILVA REIS	JOSE	0	N/A	N/A	N/A	0.0300	N/A	N/A	N/A
393	0	5	DE CARMONA	CRISTINA	0	N/A	N/A	N/A	0.0324	N/A	N/A	N/A
397	0	3	DE JORGES	LUISA	0	N/A	N/A	N/A	0.0300	N/A	N/A	N/A
398	0	6	DE MALAVE	MARIA	0	N/A	N/A	N/A	0.0324	N/A	N/A	N/A
399	0	4	DE OLIVEIRA	QUINTINO	0	N/A	N/A	N/A	0.0324	N/A	N/A	N/A
401	0	10	DE RODERO	DORITA	0	N/A	N/A	N/A	0.0324	N/A	N/A	N/A
424	0	9	DUGARTE	OLGA	0	N/A	N/A	N/A	0.0324	N/A	N/A	N/A
577	0	4	GIMENEZ	CLIFFORD A.	0	N/A	N/A	N/A	0.0300	N/A	N/A	N/A
667	0	7	IGLESIAS	JESUS	0	N/A	N/A	N/A	0.0324	N/A	N/A	N/A
968	0	7	MADRIZ	GASTON	0	N/A	N/A	N/A	0.0300	N/A	N/A	N/A
1057	0	10	MARQUEZ	CARLOS	0	N/A	N/A	N/A	0.0324	N/A	N/A	N/A
1071	0	1	MATOS	ILSE	0	N/A	N/A	N/A	0.0324	N/A	N/A	N/A
1074	0	5	MAURERA	JOSE	0	N/A	N/A	N/A	0.0324	N/A	N/A	N/A
1077	0	10	MEDINA	EFRAIN	0	N/A	N/A	N/A	0.0300	N/A	N/A	N/A
1154	0	1	NU�EZ	MARIA	0	N/A	N/A	N/A	0.0324	N/A	N/A	N/A
1186	0	3	PACHANO	JOSE	0	N/A	N/A	N/A	0.0324	N/A	N/A	N/A
1187	0	6	PACHECO	JUAN	0	N/A	N/A	N/A	0.0324	N/A	N/A	N/A
1253	0	6	RAMIREZ	JAVIER	0	N/A	N/A	N/A	0.0300	N/A	N/A	N/A
1273	0	3	REAL	WERNER SAUL	0	N/A	N/A	N/A	0.0324	N/A	N/A	N/A
1321	0	2	RODRIGUEZ	MANUEL	0	N/A	N/A	N/A	0.0324	N/A	N/A	N/A
1344	0	8	ROSA YOLANDA	URBANO PIRRONGELLI	0	N/A	N/A	N/A	0.0300	N/A	N/A	N/A
479	0	4	ENZO	TROMBETTA	0	N/A	N/A	N/A	0.0085	N/A	N/A	N/A
480	0	1	ERIC J. PINT M./	ANGELA M. DAZA V.	0	N/A	N/A	N/A	0.0082	N/A	N/A	N/A
484	0	1	ESPERANZA	GONZALEZ J.	0	N/A	N/A	N/A	0.0082	N/A	N/A	N/A
1358	0	8	RUSSICA	SEBASTIAN	0	N/A	N/A	N/A	0.0324	N/A	N/A	N/A
1360	0	7	SAAVEDRA	JUAN DOMINGO	0	N/A	N/A	N/A	0.0324	N/A	N/A	N/A
1443	0	8	TORRES	MARLENE	0	N/A	N/A	N/A	0.0324	N/A	N/A	N/A
1482	0	5	VIERA	JULIO	0	N/A	N/A	N/A	0.0300	N/A	N/A	N/A
1484	0	9	VILLAFA�E	MIRTHA	0	N/A	N/A	N/A	0.0300	N/A	N/A	N/A
1516	0	1	YANI ALEXANDRA	SALTAPIDAS	0	N/A	N/A	N/A	0.0300	N/A	N/A	N/A
1535	0	PH	ZAILETH	DIAZ	0	N/A	N/A	N/A	0.0575	N/A	N/A	N/A
11	0	10	ACHS	GERARDO A.	0	N/A	N/A	N/A	0.0455	N/A	N/A	N/A
134	0	7	ANTONELLA	GENOVESI	0	N/A	N/A	N/A	0.0455	N/A	N/A	N/A
181	0	PH	BALASONE	ANTONIO	0	N/A	N/A	N/A	0.0816	N/A	N/A	N/A
190	0	3	BARRAL Y SRA.	JAIME LOPEZ	0	N/A	N/A	N/A	0.0455	N/A	N/A	N/A
213	0	1	BETANCOURT	FERNANDO	0	N/A	N/A	N/A	0.0455	N/A	N/A	N/A
221	0	5	BLANCO GALINDEZ	ROSAURA ELISIA	0	N/A	N/A	N/A	0.0455	N/A	N/A	N/A
226	0	9	BORGES	JORGE	0	N/A	N/A	N/A	0.0455	N/A	N/A	N/A
228	0	2	BRACHO	LAURA	0	N/A	N/A	N/A	0.0455	N/A	N/A	N/A
255	0	1	CANDIA CASTRO	RUBEN	0	N/A	N/A	N/A	0.0455	N/A	N/A	N/A
320	0	6	CENTENO	CARMEN JULIETA	0	N/A	N/A	N/A	0.0455	N/A	N/A	N/A
347	0	7	CIMARRO	ISAIAS B.	0	N/A	N/A	N/A	0.0455	N/A	N/A	N/A
390	0	5	DE ACOSTA	ROSA G.	0	N/A	N/A	N/A	0.0455	N/A	N/A	N/A
392	0	4	DE BOLIVAR	NANCY	0	N/A	N/A	N/A	0.0455	N/A	N/A	N/A
410	0	PB	DEPOSITO	LOCAL	0	N/A	N/A	N/A	0.0080	N/A	N/A	N/A
132	0	01	ANNIE  CAROLINA	RODRIGUEZ	0	N/A	N/A	N/A	0.0134	N/A	N/A	N/A
747	0	04	JAIME	SERFATY	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A
755	0	02	JESUS	BUSTAMANTE	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A
758	0	11	JESUS	LIRA	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A
810	0	PH	JOSE ANTONIO	PEREZ ALVAREZ	0	N/A	N/A	N/A	0.0342	N/A	N/A	N/A
816	0	08	JOSE GILBERTO	HERNANDEZ BERNAL	0	N/A	N/A	N/A	0.0151	N/A	N/A	N/A
819	0	03	JOSE LUIS	PEREIRA ROJAS	0	N/A	N/A	N/A	0.0151	N/A	N/A	N/A
959	0	09	LUISA	RIVERO	0	N/A	N/A	N/A	0.0151	N/A	N/A	N/A
969	0	02	MAGDA DE JESUS	RAMIREZ G.	0	N/A	N/A	N/A	0.0151	N/A	N/A	N/A
1061	0	M	MARTIN	PEREZ PINAL	0	N/A	N/A	N/A	0.0568	N/A	N/A	N/A
1130	0	04	NELLY	BERRIOS PEREZ	0	N/A	N/A	N/A	0.0151	N/A	N/A	N/A
1144	0	09	NIDIA BEATRIZ	LAMEDA	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A
1258	0	05	RAMIRO	RONDON	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A
1268	0	07	RAUL	CHANDUVI	0	N/A	N/A	N/A	0.0151	N/A	N/A	N/A
1311	0	03	ROBERTO IVAN	BOLA�OS	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A
1522	0	05	YENIFFER DEL CARMEN	VILLEGAS L.	0	N/A	N/A	N/A	0.0151	N/A	N/A	N/A
1533	0	06	YURIMA JOSEFINA	PEREZ R.	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A
720	0	04	INVERSORA	SAMARTAN S.R.L.	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A
642	0	2	HERBERT	JORDAN	0	N/A	N/A	N/A	0.0085	N/A	N/A	N/A
805	0	06	JOSE A. NOGUEIRAS	Y MANUELA N.	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A
925	0	08	LOURDES	MONTANO	0	N/A	N/A	N/A	0.0151	N/A	N/A	N/A
983	0	09	MARCEL PAZ	DUQUE LLOID	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A
1024	0	10	MARIA JOSE	PEREZ SARMIENTO	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A
1027	0	09	MARIA LUISA	PRIETO TORRES	0	N/A	N/A	N/A	0.0151	N/A	N/A	N/A
1054	0	07	MARITZA	MARTINEZ D.	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A
1099	0	06	MILKA SUAREZ /	DANIEL MORALES	0	N/A	N/A	N/A	0.0151	N/A	N/A	N/A
1171	0	08	OMAR	LEIRA	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A
1313	0	10	RODOLFO	RODRIGUEZ	0	N/A	N/A	N/A	0.0151	N/A	N/A	N/A
1329	0	2	ROMAN	GONZALEZ	0	N/A	N/A	N/A	0.0086	N/A	N/A	N/A
1407	0	05	SONIA	CORREA	0	N/A	N/A	N/A	0.0151	N/A	N/A	N/A
1461	0	03	VANESSA CELLA /	IVAN DIAZ P.	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A
1476	0	05	VICTOR	LOPEZ	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A
18	0	1	ADRIAN JOSE	SANCHEZ PARRA	0	N/A	N/A	N/A	0.0114	N/A	N/A	N/A
35	0	3	ALBERTO	BARADAT	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A
44	0	1	ALBERTO J.	MARTINEZ JIMENEZ	0	N/A	N/A	N/A	0.0146	N/A	N/A	N/A
127	0	2	ANGELA	FLORES DARIA	0	N/A	N/A	N/A	0.0214	N/A	N/A	N/A
131	0	2	ANNA PAOLA	VASRELLI	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A
245	0	PB	C.A.	VENGASEOSAS	0	N/A	N/A	N/A	0.0124	N/A	N/A	N/A
303	0	2	CAROLINA ROMERO Y	JULIAN LASSER	0	N/A	N/A	N/A	0.0214	N/A	N/A	N/A
306	0	2	CARRERO	RAFAEL	0	N/A	N/A	N/A	0.0114	N/A	N/A	N/A
382	0	3	DANIEL	SALCEDO	0	N/A	N/A	N/A	0.0117	N/A	N/A	N/A
385	0	4	DANILOR 2000, C.A.	INVERSIONES	0	N/A	N/A	N/A	0.0121	N/A	N/A	N/A
452	0	2	ELEAZAR	YOUSEFF DIAZ	0	N/A	N/A	N/A	0.0146	N/A	N/A	N/A
502	0	2	FANNY	LUCKERT B.	0	N/A	N/A	N/A	0.0146	N/A	N/A	N/A
503	0	2	FEDERICO	MASSIMO	0	N/A	N/A	N/A	0.0017	N/A	N/A	N/A
504	0	3	FEDERICO	MASSIMO	0	N/A	N/A	N/A	0.0015	N/A	N/A	N/A
571	0	4	GERMAN	SPINOSI	0	N/A	N/A	N/A	0.0114	N/A	N/A	N/A
572	0	4	GERMAN	SPINOSI	0	N/A	N/A	N/A	0.0146	N/A	N/A	N/A
579	0	2	GIOVANNI	CAMELI	0	N/A	N/A	N/A	0.0121	N/A	N/A	N/A
660	0	3	HUGO MIGUEL	CONCALVES	0	N/A	N/A	N/A	0.0146	N/A	N/A	N/A
695	0	6	INV. LORENAVILA, C.A.	ANA M. LOZANO/	0	N/A	N/A	N/A	0.0012	N/A	N/A	N/A
696	0	7	INV. LORENAVILA, C.A.	ANA M. LOZANO/	0	N/A	N/A	N/A	0.0012	N/A	N/A	N/A
727	0	1	IRLY DE LOZANO	DARIO LOZANO/	0	N/A	N/A	N/A	0.0214	N/A	N/A	N/A
753	0	PH	JESUC. DE S.U.D.	A.V. IGLESIA DE	0	N/A	N/A	N/A	0.0627	N/A	N/A	N/A
779	0	1	JORGE LUIS	MANRIQUE CASTRO	0	N/A	N/A	N/A	0.0114	N/A	N/A	N/A
807	0	1	JOSE ALBERTO	MELIAN TRUJILLO	0	N/A	N/A	N/A	0.0214	N/A	N/A	N/A
823	0	3	JOSE PERFETTI	RHAIZA RON/	0	N/A	N/A	N/A	0.0214	N/A	N/A	N/A
851	0	PB	JUHANA MANZANO	CHIC & WILD/	0	N/A	N/A	N/A	0.0214	N/A	N/A	N/A
855	0	2	JULIAN LASSER	CAROLINA ROMERO/	0	N/A	N/A	N/A	0.0121	N/A	N/A	N/A
917	0	PH	LORANAVILA, C.A.	INVERSIONES	0	N/A	N/A	N/A	0.0621	N/A	N/A	N/A
954	0	3	LUIS ERNESTO	ALVARAY GONZALEZ	0	N/A	N/A	N/A	0.0121	N/A	N/A	N/A
965	0	3	LUZ PAULINA	IBA�EZ MAIRA	0	N/A	N/A	N/A	0.0214	N/A	N/A	N/A
980	0	3	MANUEL MORENO	DARIO MORENO/	0	N/A	N/A	N/A	0.0114	N/A	N/A	N/A
1058	0	3	MARTHA CORINA	FAZZINO BARBIERI	0	N/A	N/A	N/A	0.0149	N/A	N/A	N/A
1184	0	3	PABLO	CHIROUZE	0	N/A	N/A	N/A	0.0146	N/A	N/A	N/A
1251	0	2	RAIZA ELOISA	GARCIA YANEZ	0	N/A	N/A	N/A	0.0114	N/A	N/A	N/A
1275	0	3	REBECA	FARIAS CASANOVA	0	N/A	N/A	N/A	0.0127	N/A	N/A	N/A
1291	0	1	RICARDO	AZPURUA HENRIQUEZ	0	N/A	N/A	N/A	0.0146	N/A	N/A	N/A
1343	0	3	ROSA DEL VALLE	MEZA ROMERO	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A
1380	0	3	SARA FAJARDO DE	GUZMAN	0	N/A	N/A	N/A	0.0146	N/A	N/A	N/A
1385	0	4	SAUL	CUEVAS	0	N/A	N/A	N/A	0.0019	N/A	N/A	N/A
1392	0	4	SERGIO	SOLARINO	0	N/A	N/A	N/A	0.0149	N/A	N/A	N/A
1427	0	4	TANIBO, C.A.	INVERSIONES	0	N/A	N/A	N/A	0.0124	N/A	N/A	N/A
1518	0	2	YASMELI	MORENO	0	N/A	N/A	N/A	0.0146	N/A	N/A	N/A
1543	0	4	ZUCORT 1995, C.A.	INVERSIONES	0	N/A	N/A	N/A	0.0146	N/A	N/A	N/A
1544	0	4	ZUCORT 1995, C.A.	INVERSIONES	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A
1545	0	4	ZUCORT 1995, C.A.	INVERSIONES	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A
1546	0	4	ZUCORT 1995, C.A.	INVERSIONES	0	N/A	N/A	N/A	0.0146	N/A	N/A	N/A
15	0	4	ADELINO	FIGUEIRA	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
19	0	4	ADRIANA	AYALA	0	N/A	N/A	N/A	0.0083	N/A	N/A	N/A
21	0	4	ADRIANA	DE SOLA	0	N/A	N/A	N/A	0.0096	N/A	N/A	N/A
49	0	1	ALDRI	FRANCO	0	N/A	N/A	N/A	0.0087	N/A	N/A	N/A
53	0	4	ALEJANDRO	AYALA	0	N/A	N/A	N/A	0.0149	N/A	N/A	N/A
64	0	1	ALEXANDRO	BROCCO	0	N/A	N/A	N/A	0.0082	N/A	N/A	N/A
84	0	3	ALONSO GARCIA	DE BLANES	0	N/A	N/A	N/A	0.0083	N/A	N/A	N/A
110	0	1	ANA MARIA	RODRIGUEZ	0	N/A	N/A	N/A	0.0082	N/A	N/A	N/A
117	0	4	ANDRES	CANELA	0	N/A	N/A	N/A	0.0161	N/A	N/A	N/A
202	0	3	BELKYS PRIETO	ALEXANDER CORDERO Y	0	N/A	N/A	N/A	0.0083	N/A	N/A	N/A
230	0	4	BRICCIA	ALVARADO	0	N/A	N/A	N/A	0.0096	N/A	N/A	N/A
283	0	4	CARMELINA	VARANESE	0	N/A	N/A	N/A	0.0096	N/A	N/A	N/A
285	0	2	CARMEN	CHANG	0	N/A	N/A	N/A	0.0082	N/A	N/A	N/A
297	0	2	CARMEN ROSA	SILVA	0	N/A	N/A	N/A	0.0086	N/A	N/A	N/A
302	0	2	CAROLINA	SANTANA	0	N/A	N/A	N/A	0.0102	N/A	N/A	N/A
304	0	1	CAROLL E.	BAPTISTA R	0	N/A	N/A	N/A	0.0082	N/A	N/A	N/A
348	0	1	CLAUDIA	BERTOU	0	N/A	N/A	N/A	0.0093	N/A	N/A	N/A
350	0	4	CLAUDIA	MAIONE	0	N/A	N/A	N/A	0.0085	N/A	N/A	N/A
351	0	4	CLAUDIA	MAIONE	0	N/A	N/A	N/A	0.0083	N/A	N/A	N/A
352	0	3	CLAUDIA	REBECCHI	0	N/A	N/A	N/A	0.0096	N/A	N/A	N/A
379	0	2	DALMIRO	GARDIE	0	N/A	N/A	N/A	0.0085	N/A	N/A	N/A
406	0	1	DELIA	PEREZ	0	N/A	N/A	N/A	0.0081	N/A	N/A	N/A
437	0	2	EDUARDO	BRICE�O	0	N/A	N/A	N/A	0.0106	N/A	N/A	N/A
460	0	2	ELIZABETH	PROCOPIO	0	N/A	N/A	N/A	0.0086	N/A	N/A	N/A
474	0	3	ENRIQUE	FLORES	0	N/A	N/A	N/A	0.0149	N/A	N/A	N/A
476	0	2	ENRIQUE	LA ROSA	0	N/A	N/A	N/A	0.0097	N/A	N/A	N/A
1050	0	3	MARIO ALEJANDRO	ELIAS	0	N/A	N/A	N/A	0.0083	N/A	N/A	N/A
1052	0	3	MARISOL	SANCHEZ	0	N/A	N/A	N/A	0.0094	N/A	N/A	N/A
1056	0	2	MARLEN	FERNANDEZ	0	N/A	N/A	N/A	0.0096	N/A	N/A	N/A
1096	0	1	MILAGROS	NEGRON	0	N/A	N/A	N/A	0.0081	N/A	N/A	N/A
1100	0	1	MIMI	BUSTAMANTE	0	N/A	N/A	N/A	0.0085	N/A	N/A	N/A
1129	0	2	NEILA	PEREZ	0	N/A	N/A	N/A	0.0086	N/A	N/A	N/A
1178	0	1	OSMAN	VILORIA	0	N/A	N/A	N/A	0.0082	N/A	N/A	N/A
1183	0	4	OTTO	LUDEWIG	0	N/A	N/A	N/A	0.0085	N/A	N/A	N/A
1223	0	4	PILAR	GURDIAL	0	N/A	N/A	N/A	0.0083	N/A	N/A	N/A
1245	0	4	RAFAEL JOSE	PACHECO MIRABAL	0	N/A	N/A	N/A	0.0085	N/A	N/A	N/A
1247	0	2	RAFAEL Y ZULEIDA	RODRIGUEZ	0	N/A	N/A	N/A	0.0086	N/A	N/A	N/A
1248	0	4	RAFAELLE	DE LEONARDIS	0	N/A	N/A	N/A	0.0085	N/A	N/A	N/A
1266	0	3	RAQUEL	OVIEDO	0	N/A	N/A	N/A	0.0084	N/A	N/A	N/A
1281	0	4	RENE	DIAZ	0	N/A	N/A	N/A	0.0096	N/A	N/A	N/A
1289	0	3	RHANDY	PI�ERO	0	N/A	N/A	N/A	0.0083	N/A	N/A	N/A
1297	0	3	RICARDO	MELENDES	0	N/A	N/A	N/A	0.0084	N/A	N/A	N/A
1315	0	1	RODRIGO	TRONCOSO	0	N/A	N/A	N/A	0.0083	N/A	N/A	N/A
1352	0	2	ROYSBELL	ANTUNES	0	N/A	N/A	N/A	0.0086	N/A	N/A	N/A
1353	0	4	RUBEN	ASOREY	0	N/A	N/A	N/A	0.0085	N/A	N/A	N/A
1363	0	3	SABRINA MUSSO	DE RON	0	N/A	N/A	N/A	0.0083	N/A	N/A	N/A
1405	0	3	SOLGEMY ARENCIBIA	DE VILLORIA	0	N/A	N/A	N/A	0.0083	N/A	N/A	N/A
1425	0	2	TAMARA	NOVIKOW	0	N/A	N/A	N/A	0.0085	N/A	N/A	N/A
1429	0	3	TAYLOR Y NANCY	PEREZ	0	N/A	N/A	N/A	0.0083	N/A	N/A	N/A
1430	0	3	TAYNE	GAMBOA	0	N/A	N/A	N/A	0.0161	N/A	N/A	N/A
1445	0	4	TOWN HOUSE, C.A.	LOMA LINDA	0	N/A	N/A	N/A	0.0168	N/A	N/A	N/A
1446	0	4	TOWN HOUSE, C.A.	LOMA LINDA	0	N/A	N/A	N/A	0.0168	N/A	N/A	N/A
1447	0	4	TOWN HOUSE, C.A.	LOMA LINDA	0	N/A	N/A	N/A	0.0168	N/A	N/A	N/A
1448	0	4	TOWN HOUSE, C.A.	LOMA LINDA	0	N/A	N/A	N/A	0.0168	N/A	N/A	N/A
1474	0	1	VICTOR	ALVAREZ	0	N/A	N/A	N/A	0.0082	N/A	N/A	N/A
1489	0	3	VITO	FUMAI	0	N/A	N/A	N/A	0.0084	N/A	N/A	N/A
1150	0	14	NORELIS	ALCALA	0	N/A	N/A	N/A	0.0064	N/A	N/A	N/A
992	0	41	MARIA	CAMACHO	0	N/A	N/A	N/A	0.0011	N/A	N/A	N/A
999	0	40	MARIA	SULLY  BEAUJON	0	N/A	N/A	N/A	0.0003	N/A	N/A	N/A
1002	0	P3	MARIA  AUGUSTA	DA  SILVA	0	N/A	N/A	N/A	0.0187	N/A	N/A	N/A
1081	0	P0	MEKEL	ONAY	0	N/A	N/A	N/A	0.0100	N/A	N/A	N/A
1139	0	P1	NETWORK 3000,C.A.	INVERSIONES	0	N/A	N/A	N/A	0.0120	N/A	N/A	N/A
1163	0	M	OLGA	VILLNI  DE  CASTELLI	0	N/A	N/A	N/A	0.0125	N/A	N/A	N/A
1164	0	M	OLGA	VILLNI  DE  CASTELLI	0	N/A	N/A	N/A	0.0117	N/A	N/A	N/A
1165	0	N2	OLGA	VILLNI  DE  CASTELLI	0	N/A	N/A	N/A	0.0018	N/A	N/A	N/A
1166	0	N2	OLGA	VILLNI  DE  CASTELLI	0	N/A	N/A	N/A	0.0030	N/A	N/A	N/A
1208	0	M	PEDRO	UROSA  LOUD	0	N/A	N/A	N/A	0.0097	N/A	N/A	N/A
1231	0	P1	PRIMO	DESIDERI  DE  GREGORIO	0	N/A	N/A	N/A	0.0082	N/A	N/A	N/A
719	0	16	INVERSORA	GUINIMA	0	576-6842	N/A	N/A	0.0090	N/A	N/A	N/A
1382	0	4	SARMIENTO	MARIANELA	0	N/A	N/A	N/A	0.0185	N/A	N/A	N/A
1488	0	2	VINISIMO DE OLIM	MANUEL	0	N/A	N/A	N/A	0.0150	N/A	N/A	N/A
189	0	1	BARAZARTE	REINALDO	0	N/A	N/A	N/A	0.0150	N/A	N/A	N/A
216	0	6	BIDROS	TERSIAN	0	N/A	N/A	N/A	0.0198	N/A	N/A	N/A
242	0	1	C.A.	AP23,	0	N/A	N/A	N/A	0.0186	N/A	N/A	N/A
372	0	2	DA SILVA DE A.	HORACIO PEDRO	0	N/A	N/A	N/A	0.0185	N/A	N/A	N/A
595	0	4	GOMEZ	ANTONIO RAFAEL	0	N/A	N/A	N/A	0.0186	N/A	N/A	N/A
600	0	3	GONCALVES	DENNY	0	N/A	N/A	N/A	0.0185	N/A	N/A	N/A
866	0	4	KARAM	HARRAKA	0	N/A	N/A	N/A	0.0150	N/A	N/A	N/A
931	0	PH	LUCERO BIGOTT	TOMAS DARIO	0	N/A	N/A	N/A	0.0198	N/A	N/A	N/A
1128	0	6	NAZARET A.	FEDERICO ANTONIO	0	N/A	N/A	N/A	0.0185	N/A	N/A	N/A
1218	0	2	PEZZOLI	FABRICIO	0	N/A	N/A	N/A	0.0151	N/A	N/A	N/A
916	0	4	LOPEZ RAMIREZ	TULIO	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
1226	0	5	PITA CABRAL	JESUS ANTONIO	0	N/A	N/A	N/A	0.0186	N/A	N/A	N/A
1503	0	3	WILMER O.	ANDUEZA MENDOZA	0	N/A	N/A	N/A	0.0084	N/A	N/A	N/A
1505	0	4	Y JACQUELINE ALVES	WINSTON UJUETA	0	N/A	N/A	N/A	0.0096	N/A	N/A	N/A
1506	0	4	Y LUIS BRICE�O	TATIANA PE�A A.	0	N/A	N/A	N/A	0.0085	N/A	N/A	N/A
1521	0	3	YENIAN	VELASQUEZ	0	N/A	N/A	N/A	0.0083	N/A	N/A	N/A
1534	0	4	YUSMARY	RODRIGUEZ	0	N/A	N/A	N/A	0.0085	N/A	N/A	N/A
157	0	1	ARELIS	ROJAS	0	N/A	N/A	N/A	0.0299	N/A	N/A	N/A
196	0	4	BEATRIZ	GIMENEZ	0	N/A	N/A	N/A	0.0299	N/A	N/A	N/A
219	0	5	BLANCA	SILVA	0	N/A	N/A	N/A	0.0299	N/A	N/A	N/A
284	0	7	CARMELO	BOLIVAR	0	N/A	N/A	N/A	0.0475	N/A	N/A	N/A
294	0	7	CARMEN LEONOR	MATOS	0	N/A	N/A	N/A	0.0475	N/A	N/A	N/A
319	0	8	CELESTINO	MURIEL LOPEZ	0	N/A	N/A	N/A	0.0475	N/A	N/A	N/A
368	0	6	CRISTOBAL	BASTIDAS	0	N/A	N/A	N/A	0.0299	N/A	N/A	N/A
478	0	6	ENRIQUE R.	ROJAS BASTARDO	0	N/A	N/A	N/A	0.0475	N/A	N/A	N/A
500	0	5	FANNY	CHACON	0	N/A	N/A	N/A	0.0475	N/A	N/A	N/A
620	0	4	GUILLERMO	HEILBOCK	0	N/A	N/A	N/A	0.0475	N/A	N/A	N/A
815	0	1	JOSE G.	OTOLINO	0	N/A	N/A	N/A	0.0475	N/A	N/A	N/A
834	0	2	JUAN	PASTOR MALAVE	0	N/A	N/A	N/A	0.0299	N/A	N/A	N/A
835	0	3	JUAN	PASTOR MALAVE	0	N/A	N/A	N/A	0.0475	N/A	N/A	N/A
844	0	2	JUAN CARLOS	SANCHEZ	0	N/A	N/A	N/A	0.0475	N/A	N/A	N/A
889	0	8	LEONARDO	ALVAREZ TOLEDO	0	N/A	N/A	N/A	0.0299	N/A	N/A	N/A
909	0	4	LILIANA V.	MANCHEGO ORTEGA	0	N/A	N/A	N/A	0.0475	N/A	N/A	N/A
933	0	2	LUDIS DAYANA	PINO LUNA	0	N/A	N/A	N/A	0.0475	N/A	N/A	N/A
692	0	16	INMOBILIARIA	TIDAN, C.A.	0	751-2447	N/A	N/A	0.0066	N/A	N/A	N/A
710	0	4	INVERSIONES	NAR  307,  C.  A.	0	751-6979	N/A	N/A	0.0090	N/A	N/A	N/A
711	0	11	INVERSIONES	PIGME	0	751-7520	N/A	N/A	0.0089	N/A	N/A	N/A
721	0	9	INVERSORA  THAEL	B.B.M., C. A.	0	751-8738	N/A	N/A	0.0065	N/A	N/A	N/A
766	0	6	JESUS A.	MORENO D.	0	753-4856	N/A	N/A	0.0066	N/A	N/A	N/A
780	0	2	JORGE VALL Y	DAYSY DE VALL	0	242-0164; 242-0029	N/A	N/A	0.0063	N/A	N/A	N/A
794	0	10	JOSE	REGUEIRA  REY	0	751-0301	N/A	N/A	0.0090	N/A	N/A	N/A
837	0	10	JUAN	TRULLAS	0	751-0610	N/A	N/A	0.0065	N/A	N/A	N/A
857	0	13	JULIO	MONAGAS	0	751-9839	N/A	N/A	0.0064	N/A	N/A	N/A
867	0	7	KARIN  HAGGARD  Y	CRISTINA  HAGGARD	0	751-9450; 9032466	N/A	N/A	0.0065	N/A	N/A	N/A
907	0	12	LILIAN	GUANCHEZ	0	751-7083 - 6392;  794-1617 - 0792	N/A	N/A	0.0090	N/A	N/A	N/A
948	0	4	LUIS  BELTRAN	FARIAS	0	753-7663	N/A	N/A	0.0090	N/A	N/A	N/A
998	0	6	MARIA	RIVERA  NOVO	0	753-9761;  753-1126	N/A	N/A	0.0089	N/A	N/A	N/A
1020	0	2	MARIA EUGENIA	SILVA PAZ	0	754-0354	N/A	N/A	0.0062	N/A	N/A	N/A
1051	0	10	MARISELA  J.	ISEA  DELGADO	0	753-2781	N/A	N/A	0.0064	N/A	N/A	N/A
1152	0	12	NUVIA	QUINTANA	0	267-9103; 7876	N/A	N/A	0.0065	N/A	N/A	N/A
34	0	4	ALBERTINA	AGUILERA	0	N/A	N/A	N/A	0.0114	N/A	N/A	N/A
1365	0	10	SADAY	FELIBERT  GUTIERREZ	0	751-2637; 283-2015	N/A	N/A	0.0066	N/A	N/A	N/A
1431	0	2	TECNO  ALINEACI�N	NORIEGA	0	751-9396	N/A	N/A	0.0088	N/A	N/A	N/A
1478	0	16	VICTOR  DAMASO  Y	ALICIA  DE	0	753-1126	N/A	N/A	0.0089	N/A	N/A	N/A
584	0	2	GISELA ORTEGA	PILAR O. DE ORTEGA	0	N/A	N/A	N/A	0.0146	N/A	N/A	N/A
1528	0	13	YOLANDA	FERMIN	0	751-6352; 751-2590; 975-6071	N/A	N/A	0.0063	N/A	N/A	N/A
739	0	4	J.M. 52,  C.A.	DESARROLLOS	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A
740	0	4	J.M. 52,  C.A.	DESARROLLOS	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A
1170	0	11	OMAR	CORTINA	0	271	N/A	N/A	0.0132	N/A	N/A	N/A
1209	0	02	PEDRO	VILLAROEL	0	271	N/A	N/A	0.0132	N/A	N/A	N/A
1326	0	17	ROGELIO	DE  LA  NUEZ	0	271	N/A	N/A	0.0134	N/A	N/A	N/A
1330	0	11	ROMAN EDUARDO	APITZ	0	271	N/A	N/A	0.0132	N/A	N/A	N/A
1386	0	13	SCARLET HERNANDEZ	VICTORIA CONTRERAS	0	271	N/A	N/A	0.0134	N/A	N/A	N/A
1400	0	10	SIMON	REYES	0	271	N/A	N/A	0.0134	N/A	N/A	N/A
1404	0	12	SOBEIDA  COROMOTO	GARCIA  PEREIRA	0	271	N/A	N/A	0.0132	N/A	N/A	N/A
1413	0	11	SOTERO	SEVILLANO	0	271	N/A	N/A	0.0134	N/A	N/A	N/A
1475	0	18	VICTOR	DE  SANTIAGO	0	271	N/A	N/A	0.0134	N/A	N/A	N/A
1493	0	14	WALDO	QUINTERO	0	271	N/A	N/A	0.0134	N/A	N/A	N/A
1501	0	13	WILLIAN	FIFFE  Y  SRA.	0	271	N/A	N/A	0.0134	N/A	N/A	N/A
1526	0	17	YMA	CARDONE	0	271	N/A	N/A	0.0132	N/A	N/A	N/A
1236	0	10	QUEVEDO	RAUL	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
836	0	11	JUAN	SAMPABLO ANDRES	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
843	0	11	JUAN CARLOS	BENCOMO ARMAS	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
897	0	4	LEONOR	ANDRADE RODRI	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
67	0	13	ALEXIS JOSE	GONZALEZ	0	N/A	N/A	N/A	0.0066	N/A	N/A	N/A
971	0	5	MAIGUALIDA	BARRERA	0	N/A	N/A	N/A	0.0475	N/A	N/A	N/A
1065	0	8	MARY ANIURKA	FARIAS DIAZ	0	N/A	N/A	N/A	0.0475	N/A	N/A	N/A
1111	0	3	MONTA�O	GONZALEZ	0	N/A	N/A	N/A	0.0299	N/A	N/A	N/A
1112	0	3	MONTA�O	GONZALEZ	0	N/A	N/A	N/A	0.0475	N/A	N/A	N/A
1206	0	6	PEDRO	RODRIGUEZ	0	N/A	N/A	N/A	0.0475	N/A	N/A	N/A
1244	0	1	RAFAEL GONZALEZ Y	CLEMENTINA CAPRILES	0	N/A	N/A	N/A	0.0475	N/A	N/A	N/A
1260	0	7	RAMON	PINO	0	N/A	N/A	N/A	0.0299	N/A	N/A	N/A
475	0	1	ENRIQUE	GARCIA	0	N/A	N/A	N/A	0.0394	N/A	N/A	N/A
526	0	1	FORTUNATO	BENACERRAF S.	0	N/A	N/A	N/A	0.0677	N/A	N/A	N/A
535	0	1	FRANCISCO	JIMENEZ	0	N/A	N/A	N/A	0.0470	N/A	N/A	N/A
789	0	1	JOSE	GONCALVES	0	N/A	N/A	N/A	0.0394	N/A	N/A	N/A
854	0	1	JULIA MIREYA	SAIAS E.	0	N/A	N/A	N/A	0.0744	N/A	N/A	N/A
896	0	1	LEONEL	ROJAS MORALES	0	N/A	N/A	N/A	0.0367	N/A	N/A	N/A
975	0	1	MANUEL	FERNANDEZ	0	N/A	N/A	N/A	0.0331	N/A	N/A	N/A
1028	0	1	MARIA M.	ROMERO	0	N/A	N/A	N/A	0.0276	N/A	N/A	N/A
1262	0	1	RAMON RAMIREZ	GLORIA SUAREZ Y	0	N/A	N/A	N/A	0.0244	N/A	N/A	N/A
1395	0	1	SETE C.	BENACERRAF S.	0	N/A	N/A	N/A	0.0744	N/A	N/A	N/A
1452	0	1	UNIFORMES	VIRGEN DE FATIMA	0	N/A	N/A	N/A	0.0617	N/A	N/A	N/A
314	0	1	CASULO	ADOLFO	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A
880	0	9	LAYAS	JOSE MANUEL	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A
967	0	9	MACHADO	CONNY	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A
1060	0	11	MARTIN	FABIOLA	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A
1127	0	PH	NATALE	DANIEL	0	N/A	N/A	N/A	0.0361	N/A	N/A	N/A
1155	0	10	NU�EZ	SERGIO CONESA	0	N/A	N/A	N/A	0.0228	N/A	N/A	N/A
1319	0	10	RODRIGUEZ	ENMA	0	N/A	N/A	N/A	0.0216	N/A	N/A	N/A
1455	0	11	USECHE	JOSE	0	N/A	N/A	N/A	0.0222	N/A	N/A	N/A
1059	0	9	MARTIN	DASELYS	0	N/A	N/A	N/A	0.0216	N/A	N/A	N/A
1116	0	3	MORENO	LUIS MARTINEZ	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A
1123	0	8	NAHMENS	ANTONIO A.	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A
1157	0	7	OCHOA	PEDRO M	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A
1252	0	10	RAMIREZ	CRISTINA	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A
1328	0	3	ROJAS	MARIA TERESA	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A
1357	0	6	RUSSIAN	MARIA EUGENIS	0	N/A	N/A	N/A	0.0239	N/A	N/A	N/A
583	0	01	GISELA	BOCCO	0	N/A	N/A	N/A	0.0132	N/A	N/A	N/A
1401	0	1	SIMOSA ROSALES	ISAURA	0	N/A	N/A	N/A	0.0216	N/A	N/A	N/A
1414	0	4	SOTO	RAFAEL GARRIDO	0	N/A	N/A	N/A	0.0233	N/A	N/A	N/A
1449	0	11	TREZZA Y SRA.	PASQUALE A.	0	N/A	N/A	N/A	0.0220	N/A	N/A	N/A
1511	0	7	Y SRA.	JORGE FLRES	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A
30	0	6	AGUZZI DURAN	FABIOLA Y.	0	N/A	N/A	N/A	0.0952	N/A	N/A	N/A
101	0	PH	AMOR	CARLOS	0	N/A	N/A	N/A	0.1428	N/A	N/A	N/A
1043	0	10	MARILYN	DE SANTIAGO	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
1075	0	15	MAURIZIO MARIO	MARCINO PREATO	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A
1156	0	15	OBANDO	GUTIERREZ  PENSO	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A
1180	0	6	OSWALDO	CARPIO	0	N/A	N/A	N/A	0.0064	N/A	N/A	N/A
1279	0	4	RENATO	DE  CECCO	0	N/A	N/A	N/A	0.0065	N/A	N/A	N/A
1282	0	14	REPRESENTACIONES	RUDY	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A
1307	0	5	ROBERTO	MONTI  Y  SRA.	0	N/A	N/A	N/A	0.0065	N/A	N/A	N/A
1309	0	11	ROBERTO	RODRIGUEZ	0	N/A	N/A	N/A	0.0066	N/A	N/A	N/A
1333	0	13	ROMERO GUILLERMINA	VELASQUEZ LUIS	0	N/A	N/A	N/A	0.0065	N/A	N/A	N/A
1370	0	13	SALVADOR	CUPELLO  OSORIO	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
1541	0	5	ZOGHBI CARLES	BARBARA YOLANDA	0	N/A	N/A	N/A	0.0066	N/A	N/A	N/A
14	0	10	ADELA.	PERDOMO VIZQUEL	0	N/A	N/A	N/A	0.0064	N/A	N/A	N/A
43	0	13	ALBERTO CARLOS	CASTILLO	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
50	0	6	ALEJANDRA	CORREA   DORTA	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
57	0	7	ALEJANDRO BOADA	CAROLINA PAREDES	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A
69	0	1	ALFONSO	ROBERTSA	0	N/A	N/A	N/A	0.0087	N/A	N/A	N/A
103	0	13	ANA	MOLINA  PERALTA	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A
105	0	2	ANA  CLAUDIA	TEIXEIRA  MATIZ	0	N/A	N/A	N/A	0.0088	N/A	N/A	N/A
135	0	8	ANTONINA	MARRA	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A
140	0	6	ANTONIO	CHONG  LAI	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
150	0	2	ANTONIO  ENCARNACAO  DE	SA	0	N/A	N/A	N/A	0.0088	N/A	N/A	N/A
264	0	11	CARLOS	CAPUTO	0	N/A	N/A	N/A	0.0064	N/A	N/A	N/A
152	0	1	ANTONIO JOSE	CORTI SOSA	0	N/A	N/A	N/A	0.0088	N/A	N/A	N/A
176	0	7	ATILIO D. VILLEGAS	JOHANA M.ARAQUE	0	N/A	N/A	N/A	0.0065	N/A	N/A	N/A
177	0	5	AUGUSTO  MACARIO	CONTRERAS  MORENO	0	N/A	N/A	N/A	0.0064	N/A	N/A	N/A
185	0	15	BANDA	BOCCNI  DE  PASCAZIO	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
204	0	8	BELMIRO	DA COSTA	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
209	0	12	BERNARD	CROSS	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
215	0	15	BIBIANA A.	FENANDEZ CANELONES	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A
260	0	12	CARLA	LUNA	0	N/A	N/A	N/A	0.0065	N/A	N/A	N/A
261	0	13	CARLENA	MACHUCA OLIVO	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
265	0	8	CARLOS	CARDENAS	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
268	0	9	CARLOS	DUARTE	0	N/A	N/A	N/A	0.0064	N/A	N/A	N/A
274	0	10	CARLOS  ROBERTO	ISAMIT  G.	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A
280	0	5	CARLOS JULIO	VALBUENA GOMEZ	0	N/A	N/A	N/A	0.0066	N/A	N/A	N/A
289	0	2	CARMEN  BEATRIZ	PEREZ  MARGOY	0	N/A	N/A	N/A	0.0062	N/A	N/A	N/A
290	0	3	CARMEN  JASMIN	ZAVALA FIGUEROA	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A
295	0	16	CARMEN LUISA	CALDERA	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A
299	0	14	CARMEN SILVIA	CALDERON	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
321	0	8	CESAR	ANDRADES	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A
363	0	1	CORA	CHACON  DE  CONTRERAS	0	N/A	N/A	N/A	0.0062	N/A	N/A	N/A
383	0	1	DANIEL  DAVID	GASPARRI  REY	0	N/A	N/A	N/A	0.0062	N/A	N/A	N/A
408	0	15	DELIHANA  R.	CARRERO BURGOS	0	N/A	N/A	N/A	0.0065	N/A	N/A	N/A
415	0	8	DIOCELINA	MONTILLA  VILLALOBOS	0	N/A	N/A	N/A	0.0064	N/A	N/A	N/A
421	0	14	DORIS  INES	BLANCO	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A
431	0	10	EDITA	OSORIO	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A
440	0	16	EDUARDO   Y  EVE  DE	VALENZUELA	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A
453	0	9	ELENA	VALERA	0	N/A	N/A	N/A	0.0065	N/A	N/A	N/A
454	0	16	ELIANA INES	PEROZA VERGARA	0	N/A	N/A	N/A	0.0064	N/A	N/A	N/A
465	0	4	ELSA ELISA	CICCONE D ANNUNZIO	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A
466	0	16	EMIGDIO	GARCIA   ALFARO	0	N/A	N/A	N/A	0.0066	N/A	N/A	N/A
471	0	3	ENDER	FALCON	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A
493	0	15	EVE  DE	VALENZUELA	0	N/A	N/A	N/A	0.0064	N/A	N/A	N/A
524	0	6	FLORINDA	AMAYA  S.	0	N/A	N/A	N/A	0.0064	N/A	N/A	N/A
529	0	5	FRANCIA  JOSEFINA	TOVAR	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A
530	0	12	FRANCIS C. ROSETE R.	ENRIQUE REINA L.	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A
531	0	15	FRANCISCO	AROCHA	0	N/A	N/A	N/A	0.0066	N/A	N/A	N/A
538	0	5	FRANCISCO  JOSE	HERNANDEZ	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
540	0	16	FRANCISCO JOSE	SOLORZANO ARASME	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
566	0	4	GENOVEVA	DE  CAJIAS	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A
573	0	P	GERMAN  AVELINO	TORREALBA	0	N/A	N/A	N/A	0.0178	N/A	N/A	N/A
582	0	3	GIRALUNA M.	RONDON N.	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A
589	0	13	GLORIA	BONETT	0	N/A	N/A	N/A	0.0065	N/A	N/A	N/A
590	0	10	GLORIA	CASTILLO	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
512	0	4	FERNANDEZ MORENO	IMELDA YURAIMA	0	N/A	N/A	N/A	0.0455	N/A	N/A	N/A
520	0	10	FIGLIULO A.	PASQUALE	0	N/A	N/A	N/A	0.0455	N/A	N/A	N/A
1084	0	8	MENDEZ	CARLOS A.	0	N/A	N/A	N/A	0.0455	N/A	N/A	N/A
1141	0	2	NICHOLS	MARIA	0	N/A	N/A	N/A	0.0455	N/A	N/A	N/A
1182	0	3	OTERO	ZOILO	0	N/A	N/A	N/A	0.0455	N/A	N/A	N/A
1189	0	9	PALMA P.	NORMAN A.	0	N/A	N/A	N/A	0.0455	N/A	N/A	N/A
1267	0	8	RAQUEL DE M.	MANUEL MOREIRA  Y	0	N/A	N/A	N/A	0.0455	N/A	N/A	N/A
1415	0	6	SOULAVY	OTTO K.	0	N/A	N/A	N/A	0.0455	N/A	N/A	N/A
312	0	02	CASTILLO MORIN	MARY	0	N/A	N/A	N/A	0.2500	N/A	N/A	N/A
616	0	01	GUARAPO RODRIGUEZ	ESMIRNA	0	N/A	N/A	N/A	0.2500	N/A	N/A	N/A
1194	0	01	PARILLI	FERNANDO	0	N/A	N/A	N/A	0.2500	N/A	N/A	N/A
1432	0	02	TELLEZ	LEONARDO Y ROXANA	0	N/A	N/A	N/A	0.2500	N/A	N/A	N/A
47	0	10	ALCIRA	RAMIREZ ZAMBRANO	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A
90	0	01	ALVARO	RUIZ	0	N/A	N/A	N/A	0.0262	N/A	N/A	N/A
118	0	06	ANDRES	FERNANDEZ	0	N/A	N/A	N/A	0.0151	N/A	N/A	N/A
122	0	08	ANGEL	CID BOUZAS	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A
469	0	01	EMIRO	PEREZ	0	N/A	N/A	N/A	0.0151	N/A	N/A	N/A
516	0	10	FERNANDO	DOS SANTOS	0	N/A	N/A	N/A	0.0151	N/A	N/A	N/A
536	0	11	FRANCISCO	VELAZQUEZ	0	N/A	N/A	N/A	0.0151	N/A	N/A	N/A
555	0	07	GABRIELA O.	MATHEUS C.	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A
409	0	2	DENIZA ELENA	GOTTO	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A
418	0	1	DOLORES Z DE DORTA	SILFREDO DORTA /	0	N/A	N/A	N/A	0.0124	N/A	N/A	N/A
428	0	1	EDGAR	VIVAS	0	N/A	N/A	N/A	0.0124	N/A	N/A	N/A
515	0	1	FERNANDO	DA COSTA	0	N/A	N/A	N/A	0.0086	N/A	N/A	N/A
518	0	4	FERNANDO	GIL	0	N/A	N/A	N/A	0.0085	N/A	N/A	N/A
534	0	3	FRANCISCO	GONZALEZ	0	N/A	N/A	N/A	0.0083	N/A	N/A	N/A
542	0	1	FRANCO	CAPRILI	0	N/A	N/A	N/A	0.0085	N/A	N/A	N/A
612	0	4	GRIDELIDIA	HIDALGO Y.	0	N/A	N/A	N/A	0.0096	N/A	N/A	N/A
632	0	2	HECTOR	ANGARITA	0	N/A	N/A	N/A	0.0086	N/A	N/A	N/A
726	0	4	IRIS COROMOTO	DELGADO	0	N/A	N/A	N/A	0.0146	N/A	N/A	N/A
806	0	3	JOSE ABREU Y	LUCY DE ABREU	0	N/A	N/A	N/A	0.0154	N/A	N/A	N/A
614	0	2	GUADALUPE	MARQUEZ	0	N/A	N/A	N/A	0.0082	N/A	N/A	N/A
619	0	2	GUILLERMO	BEATRIZ	0	N/A	N/A	N/A	0.0087	N/A	N/A	N/A
625	0	4	GUSTAVO	MARTINEZ	0	N/A	N/A	N/A	0.0085	N/A	N/A	N/A
654	0	4	HORACIO	DE ABREU	0	N/A	N/A	N/A	0.0096	N/A	N/A	N/A
728	0	2	ISAIAS Y ADRIANA	MARCANO	0	N/A	N/A	N/A	0.0087	N/A	N/A	N/A
751	0	3	JEAN JACK	SIMON	0	N/A	N/A	N/A	0.0084	N/A	N/A	N/A
756	0	3	JESUS	FRANCHESCI	0	N/A	N/A	N/A	0.0095	N/A	N/A	N/A
772	0	4	JOEL	GASCON	0	N/A	N/A	N/A	0.0096	N/A	N/A	N/A
776	0	3	JORGE	BORGES	0	N/A	N/A	N/A	0.0083	N/A	N/A	N/A
786	0	4	JOSE	DE FREITAS	0	N/A	N/A	N/A	0.0085	N/A	N/A	N/A
808	0	2	JOSE ALBERTO	RODRIGUEZ	0	N/A	N/A	N/A	0.0086	N/A	N/A	N/A
824	0	3	JOSE ROURA	FLORENTINA SECONDULFO	0	N/A	N/A	N/A	0.0083	N/A	N/A	N/A
856	0	2	JULIO	BORREGALES	0	N/A	N/A	N/A	0.0085	N/A	N/A	N/A
898	0	3	LEOPOLDO	JIMENEZ	0	N/A	N/A	N/A	0.0083	N/A	N/A	N/A
902	0	1	LEYDA ROJAS	DE RIOS	0	N/A	N/A	N/A	0.0093	N/A	N/A	N/A
924	0	4	LOURDES	DIEZ	0	N/A	N/A	N/A	0.0085	N/A	N/A	N/A
939	0	4	LUIS	GONCALVES	0	N/A	N/A	N/A	0.0096	N/A	N/A	N/A
960	0	4	LUISA ELENA	RIANII ARMAS	0	N/A	N/A	N/A	0.0083	N/A	N/A	N/A
964	0	3	LUZ	BOTERO	0	N/A	N/A	N/A	0.0083	N/A	N/A	N/A
978	0	4	MANUEL	RODRIGUEZ PITA	0	N/A	N/A	N/A	0.0096	N/A	N/A	N/A
982	0	3	MARBIOLIS RORAIMA	PEREZ	0	N/A	N/A	N/A	0.0084	N/A	N/A	N/A
986	0	3	MARCOS	GORDON	0	N/A	N/A	N/A	0.0084	N/A	N/A	N/A
988	0	4	MARGARITA	GARCIA	0	N/A	N/A	N/A	0.0096	N/A	N/A	N/A
1010	0	3	MARIA ANTONIETA	FERRARI	0	N/A	N/A	N/A	0.0156	N/A	N/A	N/A
1017	0	4	MARIA DEL CARMEN	SANCHEZ	0	N/A	N/A	N/A	0.0096	N/A	N/A	N/A
1019	0	4	MARIA ELENA	IZAGUIRRE	0	N/A	N/A	N/A	0.0085	N/A	N/A	N/A
1034	0	4	MARIANELLA	TOZZI	0	N/A	N/A	N/A	0.0096	N/A	N/A	N/A
1338	0	4	ROOSEVELT	VELASQUEZ	0	N/A	N/A	N/A	0.0165	N/A	N/A	N/A
1347	0	4	ROSANELLA	PIOVESAN	0	N/A	N/A	N/A	0.0083	N/A	N/A	N/A
492	0	4	EVA, C.A.	CORPORACION	0	N/A	N/A	N/A	0.0952	N/A	N/A	N/A
826	0	11	JOSEPH	CHEHWARO	0	039-255113	N/A	N/A	0.0090	N/A	N/A	N/A
564	0	9	GASIOLA	INVERSIONES	0	N/A	N/A	N/A	0.0952	N/A	N/A	N/A
655	0	1	HORTENCIA	GUERRERO	0	N/A	N/A	N/A	0.0952	N/A	N/A	N/A
770	0	3	JOCARSOI 157, C.A.	INVERSIONES	0	N/A	N/A	N/A	0.0952	N/A	N/A	N/A
781	0	8	JOSE	ALMOSNY	0	N/A	N/A	N/A	0.0952	N/A	N/A	N/A
318	0	5	CELESTE A.	YANNARELLA  G.	0	753-7973;  563-2847	N/A	N/A	0.0089	N/A	N/A	N/A
861	0	2	JULIO CESAR	DIAZ G.	0	N/A	N/A	N/A	0.0952	N/A	N/A	N/A
414	0	4	DILIA MARIA	MARQUEZ  ALVARAY	0	751-5840	N/A	N/A	0.0064	N/A	N/A	N/A
1124	0	7	NAHON	JOS	0	N/A	N/A	N/A	0.0952	N/A	N/A	N/A
457	0	1	ELISA TERESA	CEDE�O D'"MARCO	0	242-9919**	N/A	N/A	0.0063	N/A	N/A	N/A
1479	0	5	VIDEOACUARIO.COM	VENTAS@	0	N/A	N/A	N/A	0.0952	N/A	N/A	N/A
458	0	14	ELIZABETH	DE BOZIK LOPEZ	0	751-8639	N/A	N/A	0.0064	N/A	N/A	N/A
257	0	1	CARDENAS	SUCESION	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
489	0	4	EUCARIO	CONTRERAS	0	945-1106	N/A	N/A	0.0089	N/A	N/A	N/A
511	0	15	FERMIN  RAMILO	CARBALLIDO	0	761-3602;  762-6476	N/A	N/A	0.0063	N/A	N/A	N/A
541	0	8	FRANCISCO MORENO Y	NATALIA SCORZA	0	263-5673	N/A	N/A	0.0064	N/A	N/A	N/A
684	0	1	INES	GRANADO	0	962-1331	016-6-078980	N/A	0.0088	N/A	N/A	N/A
662	0	4	HUMBERTO  GIONNI	ARMILLEI	0	753-0342;  086-7582121	N/A	N/A	0.0089	N/A	N/A	N/A
714	0	10	INVERSIONES	ROMELA	0	575-0713	N/A	N/A	0.0089	N/A	N/A	N/A
256	0	1	CAPRILES PE�ALOZA	RAUL	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
629	0	4	GUSTAVO ADOLFO	RODRIGUEZ	0	N/A	N/A	N/A	0.0066	N/A	N/A	N/A
130	0	8	ANKE	VON  ROSENBERG	0	N/A	N/A	N/A	0.0065	N/A	N/A	N/A
547	0	3	FREDDY	DE  LA  TORRE	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
635	0	12	HECTOR	LUCENA	0	N/A	N/A	N/A	0.0064	N/A	N/A	N/A
643	0	9	HERMAN  A.	RODRIGUEZ	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A
661	0	1	HUGO Y MADALY	SATURNO	0	N/A	N/A	N/A	0.0062	N/A	N/A	N/A
606	0	7	GONZALO	GONZALEZ	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A
615	0	5	GUADALUPE	PEREIRA	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A
637	0	11	HEIDY MERCEDES	GHERSI F.	0	N/A	N/A	N/A	0.0064	N/A	N/A	N/A
638	0	6	HEIDY VIRGINIA	TOUSSAINT  MARCANO	0	N/A	N/A	N/A	0.0065	N/A	N/A	N/A
686	0	13	INGRID	MONTERO  .	0	N/A	N/A	N/A	0.0064	N/A	N/A	N/A
697	0	16	INVERSIONES	26,03,96, C.A.	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
707	0	6	INVERSIONES	GINIMA	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A
712	0	3	INVERSIONES	RAFELLI,  C.  A.	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
713	0	14	INVERSIONES	RAPHORO	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A
729	0	1	ISIDRO	ZEA  THOMPSON	0	N/A	N/A	N/A	0.0062	N/A	N/A	N/A
734	0	12	IVAN	PRADO	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A
735	0	4	IVAN  OCTAVIO	MARQUEZ	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A
752	0	12	JENNY	BELIZ	0	N/A	N/A	N/A	0.0064	N/A	N/A	N/A
762	0	12	JESUS	SULBARAN	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A
784	0	9	JOSE	CASTI�EIRA	0	N/A	N/A	N/A	0.0066	N/A	N/A	N/A
790	0	11	JOSE	MARCANO	0	N/A	N/A	N/A	0.0065	N/A	N/A	N/A
800	0	9	JOSE  ANGEL	CARRASCO  VALLES	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A
801	0	3	JOSE  ENRIQUE	GONZALEZ  DIAZ	0	N/A	N/A	N/A	0.0064	N/A	N/A	N/A
742	0	7	J0SMAR	GUTIERREZ  REYES	0	751-7658;  751-8753; 751-3742	0142068780	N/A	0.0090	N/A	N/A	N/A
869	0	16	KARINA ROSSMIL	PEREIRA SANZ	0	N/A	N/A	N/A	0.0065	N/A	N/A	N/A
886	0	11	LEON	AMELINCKX	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
892	0	10	LEONARDO	RAMOS ROJAS	0	N/A	N/A	N/A	0.0066	N/A	N/A	N/A
893	0	1	LEONARDO  JOSE	NU�EZ	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A
904	0	7	LIBERATA  DE	VAN  DOORN	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
868	0	13	KARINA	HEIGH	0	753-0730	014-9-174625	N/A	0.0090	N/A	N/A	N/A
905	0	5	LIGIA  DEL  R.	ROVIRA  FERREIRA	0	N/A	N/A	N/A	0.0065	N/A	N/A	N/A
937	0	11	LUIS	COLMENARES	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A
940	0	3	LUIS	HERNANDEZ	0	N/A	N/A	N/A	0.0066	N/A	N/A	N/A
941	0	4	LUIS	MALAVE	0	N/A	N/A	N/A	0.0064	N/A	N/A	N/A
950	0	11	LUIS  F.	MATURANA GONZALEZ	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A
966	0	1	LYLIAN  I.	CAICEDO	0	N/A	N/A	N/A	0.0087	N/A	N/A	N/A
985	0	12	MARCELINO	MARTINEZ  REY	0	N/A	N/A	N/A	0.0066	N/A	N/A	N/A
987	0	14	MARCOS	ZAIDMAN	0	N/A	N/A	N/A	0.0065	N/A	N/A	N/A
995	0	9	MARIA	FUENMAYOR	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A
997	0	10	MARIA	MOREJON	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A
1001	0	3	MARIA  ANTONIETA	D' ARMATA	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
1005	0	4	MARIA  ESPERANZA	CORREA  R.	0	N/A	N/A	N/A	0.0065	N/A	N/A	N/A
1018	0	6	MARIA DEL PILAR	SANCHEZ R.	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A
1022	0	13	MARIA GABRIELA	ARANGUREN  MONZON	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A
1047	0	5	MARIO	GUARIGLIA PACE	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
1049	0	3	MARIO	RINALDI	0	N/A	N/A	N/A	0.0065	N/A	N/A	N/A
1053	0	2	MARITZA	ESCALONA	0	N/A	N/A	N/A	0.0062	N/A	N/A	N/A
1092	0	13	MIGUEL	CONTRERAS	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A
1098	0	8	MILENA	LAJUSTICIA  LEPIANI	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A
1102	0	7	MIREYA	LOPEZ	0	N/A	N/A	N/A	0.0064	N/A	N/A	N/A
715	0	8	INVERSIONES	YANONI,  C. A.	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A
1131	0	14	NELLY	DARIAS  DE  TORRES	0	N/A	N/A	N/A	0.0066	N/A	N/A	N/A
1136	0	15	NELSON JESUS	REQUIS SAYAGO	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A
1151	0	16	NORMA	SANDERS	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A
1177	0	9	OSIRIS	AGUILERA	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
1207	0	15	PEDRO	SANCHEZ	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A
1210	0	7	PEDRO  A. MATIAS Y	HAIDEE C. DE MATIAS	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A
1221	0	8	PIETRO	IMBRENDA	0	N/A	N/A	N/A	0.0065	N/A	N/A	N/A
1240	0	11	RAFAEL	SILVA	0	N/A	N/A	N/A	0.0066	N/A	N/A	N/A
1261	0	4	RAMON	VEGA	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
1276	0	14	REINA	BENZADON	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A
1292	0	4	RICARDO	BOSIO	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
1298	0	1	RICARDO	RODRIGUEZ	0	N/A	N/A	N/A	0.0088	N/A	N/A	N/A
1300	0	10	RICARDO ALBERTO	ALEZONES	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
1302	0	12	RICHARD	GONZALEZ	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
1310	0	14	ROBERTO	VERGARA  MARQUEZ	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
1316	0	2	RODRIGO G. BELISARIO P.	DANAYI G. FIGUERA P. Y	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A
1340	0	2	ROSA  MARY	BUERGO  SUAREZ	0	N/A	N/A	N/A	0.0087	N/A	N/A	N/A
1362	0	5	SABRINA CADETTO I	ELSA DE CADETTO	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A
1369	0	8	SALVADOR	CONSTANZA	0	N/A	N/A	N/A	0.0066	N/A	N/A	N/A
1384	0	9	SASKIA	SANCHEZ	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
1421	0	2	SUSANA	HERRERA	0	N/A	N/A	N/A	0.0087	N/A	N/A	N/A
1433	0	13	TENERIA	DOS  LEONES  C. A.	0	N/A	N/A	N/A	0.0066	N/A	N/A	N/A
1450	0	7	TRINA  F.	OSORIO U.	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
1472	0	10	VICENTE   JULIO	VERA  MU�OZ	0	N/A	N/A	N/A	0.0065	N/A	N/A	N/A
1477	0	9	VICTOR	RODRIGUEZ  A.	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A
1480	0	7	VIDRIS	RODRIGUEZ	0	N/A	N/A	N/A	0.0066	N/A	N/A	N/A
32	0	5	ALBA NANCO	VERONICA	0	60	N/A	N/A	0.0046	N/A	N/A	N/A
56	0	2	ALEJANDRO ABA	JOSE CRISTIAN	0	1	N/A	N/A	0.0067	N/A	N/A	N/A
86	0	3	ALVARADO	ANA	0	1	N/A	N/A	0.0087	N/A	N/A	N/A
87	0	6	ALVARADO P.	JAVIER ANDRES	0	62	N/A	N/A	0.0123	N/A	N/A	N/A
1491	0	16	VLADIMIRO	GUERRINI   CONTE	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A
1514	0	15	YAJAIRA  ZULAY	ORTEGA  GOMEZ	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
1537	0	4	ZAMARYS	MARCANO	0	N/A	N/A	N/A	0.0066	N/A	N/A	N/A
1542	0	6	ZORAIDA	GONZALEZ MARICHE	0	N/A	N/A	N/A	0.0066	N/A	N/A	N/A
24	0	P0	AGENTES ADUANALES, C.A.	GREYMAR	0	N/A	N/A	N/A	0.0163	N/A	N/A	N/A
75	0	M	ALFREDO	MARANDO  FALCIGLIA	0	N/A	N/A	N/A	0.0207	N/A	N/A	N/A
76	0	B0	ALFREDO	MARANDO  FALCIGLIA	0	N/A	N/A	N/A	0.0280	N/A	N/A	N/A
77	0	B0	ALFREDO	MARANDO  FALCIGLIA	0	N/A	N/A	N/A	0.0357	N/A	N/A	N/A
78	0	P1	ALFREDO	MARANDO  FALCIGLIA	0	N/A	N/A	N/A	0.0159	N/A	N/A	N/A
79	0	P0	ALFREDO	MARANDO  FALCIGLIA	0	N/A	N/A	N/A	0.0109	N/A	N/A	N/A
80	0	P0	ALFREDO	MARANDO FALCIGLIA	0	N/A	N/A	N/A	0.0132	N/A	N/A	N/A
144	0	P2	ANTONIO	PE�ALVER	0	N/A	N/A	N/A	0.0097	N/A	N/A	N/A
174	0	P2	ATEMA	ACADEMIA TEC.AUTOMOTRIZ	0	N/A	N/A	N/A	0.0130	N/A	N/A	N/A
175	0	P1	ATILIO	PIETROBONO	0	N/A	N/A	N/A	0.0100	N/A	N/A	N/A
184	0	B0	BANCO  MERCANTIL	C.A.S.A.C.A.	0	N/A	N/A	N/A	0.1023	N/A	N/A	N/A
187	0	B0	BANPLUS	E.A.P. C.A.	0	N/A	N/A	N/A	0.0172	N/A	N/A	N/A
188	0	B0	BANPLUS	E.A.P. C.A.	0	N/A	N/A	N/A	0.0163	N/A	N/A	N/A
266	0	41	CARLOS	CARDENAS	0	N/A	N/A	N/A	0.0011	N/A	N/A	N/A
357	0	P0	CONCETTA	CONTINO  DE  CONSTANZA	0	N/A	N/A	N/A	0.0128	N/A	N/A	N/A
360	0	P2	CONSTRUCCIONES	1958	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
361	0	P3	CONSTRUCCIONES	1958	0	N/A	N/A	N/A	0.0176	N/A	N/A	N/A
432	0	M	EDITA	OSORIO  C.	0	N/A	N/A	N/A	0.0106	N/A	N/A	N/A
434	0	40	EDMUNDO	VIEIRA  DE  M.	0	N/A	N/A	N/A	0.0002	N/A	N/A	N/A
464	0	40	ELSA	VILLALOBOS  VELASCO	0	N/A	N/A	N/A	0.0003	N/A	N/A	N/A
388	0	4	DE A.	INOCENCIO LOFRUMENTO	0	1	N/A	N/A	0.0067	N/A	N/A	N/A
389	0	2	DE ABREU SOUSA	JEFFERDON J.	0	1	N/A	N/A	0.0083	N/A	N/A	N/A
391	0	3	DE AGUIRRE	CORINA IRAGORRY	0	1	N/A	N/A	0.0046	N/A	N/A	N/A
404	0	3	DEGWITZ	ALEJANDRO	0	1	N/A	N/A	0.0067	N/A	N/A	N/A
495	0	40	EVELYN	LOPEZ	0	N/A	N/A	N/A	0.0002	N/A	N/A	N/A
508	0	41	FELIX	CARAPAICA	0	N/A	N/A	N/A	0.0008	N/A	N/A	N/A
532	0	P3	FRANCISCO	BAEZA	0	N/A	N/A	N/A	0.0139	N/A	N/A	N/A
585	0	P2	GIUSEPPE	BELLANCA  MICELI	0	N/A	N/A	N/A	0.0186	N/A	N/A	N/A
656	0	P2	HUGO	NEGRETE	0	N/A	N/A	N/A	0.0154	N/A	N/A	N/A
672	0	N2	ILERJU	S.A.	0	N/A	N/A	N/A	0.0037	N/A	N/A	N/A
673	0	DE	ILERJU,	S.A.	0	N/A	N/A	N/A	0.0018	N/A	N/A	N/A
675	0	N2	ILERJU,	S.A.	0	N/A	N/A	N/A	0.0030	N/A	N/A	N/A
676	0	N2	ILERJU,	S.A.	0	N/A	N/A	N/A	0.0016	N/A	N/A	N/A
677	0	N2	ILERJU,	S.A.	0	N/A	N/A	N/A	0.0018	N/A	N/A	N/A
678	0	N2	ILERJU,	S.A.	0	N/A	N/A	N/A	0.0016	N/A	N/A	N/A
679	0	O	ILERJU,	S.A.	0	N/A	N/A	N/A	0.0120	N/A	N/A	N/A
693	0	P2	INMOBILIARIA  101,	C.A.	0	N/A	N/A	N/A	0.0125	N/A	N/A	N/A
694	0	P0	INMUEBLES  106	C.A.	0	N/A	N/A	N/A	0.0117	N/A	N/A	N/A
698	0	P3	INVERSIONES	8.892.087  C.  A.	0	N/A	N/A	N/A	0.0117	N/A	N/A	N/A
699	0	P3	INVERSIONES	8.892.087  C.  A.	0	N/A	N/A	N/A	0.0200	N/A	N/A	N/A
700	0	P3	INVERSIONES	8.892.087  C.  A.	0	N/A	N/A	N/A	0.0122	N/A	N/A	N/A
701	0	P4	INVERSIONES	8.892.087  C.  A.	0	N/A	N/A	N/A	0.0073	N/A	N/A	N/A
702	0	P4	INVERSIONES	8.892.087  C.  A.	0	N/A	N/A	N/A	0.0071	N/A	N/A	N/A
703	0	P4	INVERSIONES	8.892.087  C.  A.	0	N/A	N/A	N/A	0.0194	N/A	N/A	N/A
704	0	P3	INVERSIONES	8.892.087  C.  A..	0	N/A	N/A	N/A	0.0138	N/A	N/A	N/A
705	0	M	INVERSIONES	CANIA	0	N/A	N/A	N/A	0.0106	N/A	N/A	N/A
709	0	P2	INVERSIONES	GUIEN	0	N/A	N/A	N/A	0.0125	N/A	N/A	N/A
716	0	P1	INVERSIONES  DOLAFRI,	C.A.	0	N/A	N/A	N/A	0.0100	N/A	N/A	N/A
717	0	P1	INVERSIONES  DOLAFRI,	C.A.	0	N/A	N/A	N/A	0.0100	N/A	N/A	N/A
732	0	P2	IVAN	FEO  GARCIA  Y  SRA	0	N/A	N/A	N/A	0.0128	N/A	N/A	N/A
738	0	P1	J. FERNADEZ	M.  ABREU	0	N/A	N/A	N/A	0.0106	N/A	N/A	N/A
802	0	P4	JOSE  ROMERO  Y  NIEVESA	DE  ROMERO	0	N/A	N/A	N/A	0.0085	N/A	N/A	N/A
859	0	40	JULIO	POMBO	0	N/A	N/A	N/A	0.0002	N/A	N/A	N/A
883	0	P3	LENCERIAS  CRISTAL  II	C.  A.	0	N/A	N/A	N/A	0.0181	N/A	N/A	N/A
903	0	40	LIBERATA	RUSCITTI  DE  VAN  DOORN	0	N/A	N/A	N/A	0.0003	N/A	N/A	N/A
912	0	M	LIVIA	CARTA	0	N/A	N/A	N/A	0.0120	N/A	N/A	N/A
938	0	P0	LUIS	CONSTANZA	0	N/A	N/A	N/A	0.0125	N/A	N/A	N/A
946	0	40	LUIS	SANCHEZ	0	N/A	N/A	N/A	0.0003	N/A	N/A	N/A
984	0	ES	MARCELA	MU�OZ  CORREA	0	N/A	N/A	N/A	0.1018	N/A	N/A	N/A
2	0	P2	N/A	UNIFOT	0	N/A	N/A	N/A	0.0109	N/A	N/A	N/A
1237	0	40	R. CAJIAS Y	GENOVEVA DE CAJIAS	0	N/A	N/A	N/A	0.0003	N/A	N/A	N/A
1283	0	P0	REPRESENTACIONES	TOMASINO	0	N/A	N/A	N/A	0.0132	N/A	N/A	N/A
1294	0	40	RICARDO	CERGALE  FAUSTI	0	N/A	N/A	N/A	0.0003	N/A	N/A	N/A
1296	0	P1	RICARDO	GRISANTI  MACHADO	0	N/A	N/A	N/A	0.0117	N/A	N/A	N/A
1299	0	P1	RICARDO  ALI	INOJOSA  TOVAR	0	N/A	N/A	N/A	0.0134	N/A	N/A	N/A
1336	0	P1	ROMULO	NORI	0	N/A	N/A	N/A	0.0143	N/A	N/A	N/A
1378	0	41	SANTIAGO  JAIME	DE  ARMAS	0	N/A	N/A	N/A	0.0003	N/A	N/A	N/A
1391	0	P3	SERAFIN	MAZPARROTE  Y  SRA.	0	N/A	N/A	N/A	0.0120	N/A	N/A	N/A
1463	0	P4	VANIRO	CABELLE	0	N/A	N/A	N/A	0.0087	N/A	N/A	N/A
1467	0	P2	VIAJES Y TURISMO	MELFITUR	0	N/A	N/A	N/A	0.0117	N/A	N/A	N/A
1470	0	P4	VICENTE	GRISANTI	0	N/A	N/A	N/A	0.0106	N/A	N/A	N/A
1471	0	P3	VICENTE	GRISANTI  SALAZAR  Y  SRA.	0	N/A	N/A	N/A	0.0128	N/A	N/A	N/A
1473	0	P0	VICENZA	LO  PRESTI	0	N/A	N/A	N/A	0.0111	N/A	N/A	N/A
473	0	03	ENRIQUE	BART	0	N/A	N/A	N/A	0.0648	N/A	N/A	N/A
367	0	03	CRISTOBA L	GONZALEZ	0	N/A	N/A	N/A	0.0648	N/A	N/A	N/A
514	0	06	FERNANDO	CAO	0	N/A	N/A	N/A	0.0648	N/A	N/A	N/A
517	0	02	FERNANDO	FRANJO	0	N/A	N/A	N/A	0.0648	N/A	N/A	N/A
592	0	P	GLORIA	VALENCIA PEREZ	0	N/A	N/A	N/A	0.0930	N/A	N/A	N/A
648	0	07	HERNANDO	D' CARO ORTIZ	0	N/A	N/A	N/A	0.0724	N/A	N/A	N/A
718	0	05	INVERSORA	FARONCA S.A.	0	N/A	N/A	N/A	0.0648	N/A	N/A	N/A
730	0	07	ISRAEL	MONTES DE OCA DAGER	0	N/A	N/A	N/A	0.0572	N/A	N/A	N/A
733	0	04	IVAN	GUILLEN PADRON	0	N/A	N/A	N/A	0.0648	N/A	N/A	N/A
957	0	02	LUIS O. TORRELLAS Y	REINA M. AZUAJE	0	N/A	N/A	N/A	0.0648	N/A	N/A	N/A
1073	0	04	MAURA MERCEDES	RAMIREZ B.	0	N/A	N/A	N/A	0.0648	N/A	N/A	N/A
1396	0	05	SHIRLEY	MAISSI  SAENZ	0	N/A	N/A	N/A	0.0648	N/A	N/A	N/A
1507	0	06	Y MIRVA GARCIA	FRANKLIN GONZALEZ	0	N/A	N/A	N/A	0.0648	N/A	N/A	N/A
250	0	1	CALOGERA	RICCOBENE	0	N/A	N/A	N/A	0.0367	N/A	N/A	N/A
349	0	1	CLAUDIA	CUELLO	0	N/A	N/A	N/A	0.0367	N/A	N/A	N/A
417	0	1	DOLORES	PITA	0	N/A	N/A	N/A	0.0331	N/A	N/A	N/A
528	0	1	FRANCHESCA	KARIANI	0	N/A	N/A	N/A	0.0331	N/A	N/A	N/A
792	0	1	JOSE	NOBREGA	0	N/A	N/A	N/A	0.0470	N/A	N/A	N/A
798	0	1	JOSE	VERGARA	0	N/A	N/A	N/A	0.0276	N/A	N/A	N/A
958	0	1	LUISA	IBARRA	0	N/A	N/A	N/A	0.0394	N/A	N/A	N/A
989	0	1	MARGARITA	TOLEDO	0	N/A	N/A	N/A	0.0331	N/A	N/A	N/A
1037	0	1	MARIBEL	IBARRA	0	N/A	N/A	N/A	0.0244	N/A	N/A	N/A
1045	0	1	MARINA	BENCHIMOL	0	N/A	N/A	N/A	0.0244	N/A	N/A	N/A
1135	0	1	NELSON AGUSTIN	DO SANTOS	0	N/A	N/A	N/A	0.0276	N/A	N/A	N/A
1199	0	1	PATRICIA	PINEDA	0	N/A	N/A	N/A	0.0367	N/A	N/A	N/A
1351	0	1	ROSSANN Y ADOLFINA	GUEVARA	0	N/A	N/A	N/A	0.0276	N/A	N/A	N/A
217	0	4	BIJOUN	JUAN CHAQUIRA	0	N/A	N/A	N/A	0.0187	N/A	N/A	N/A
246	0	2	CABRAL GOMES	JOSE	0	N/A	N/A	N/A	0.0185	N/A	N/A	N/A
371	0	3	DA SILVA	JOSE CARLOS	0	N/A	N/A	N/A	0.0185	N/A	N/A	N/A
559	0	PB	GARCIA	MAXIMO ALEJANDRO	0	N/A	N/A	N/A	0.0196	N/A	N/A	N/A
664	0	1	I.H.	MANUEL CANDAL I.  /	0	N/A	N/A	N/A	0.0185	N/A	N/A	N/A
838	0	5	JUAN	ZABALA	0	N/A	N/A	N/A	0.0185	N/A	N/A	N/A
930	0	2	LOZANO	JUAN MIGUEL	0	N/A	N/A	N/A	0.0185	N/A	N/A	N/A
1216	0	3	PEREZ	MANUEL PEREZ	0	N/A	N/A	N/A	0.0185	N/A	N/A	N/A
1317	0	5	RODRIGUES	ANTONIO DE SOUSA	0	N/A	N/A	N/A	0.0185	N/A	N/A	N/A
1442	0	1	TORRES	CARMEN JOSEFINA	0	N/A	N/A	N/A	0.0185	N/A	N/A	N/A
1460	0	6	VAN HEEL QUINTERO	JOHANN A.	0	N/A	N/A	N/A	0.0199	N/A	N/A	N/A
154	0	6	ARANA	EUDE GUILLERMINA	0	N/A	N/A	N/A	0.0198	N/A	N/A	N/A
207	0	5	BENSHIMOL RODRIGUES	WILLIAN	0	N/A	N/A	N/A	0.0185	N/A	N/A	N/A
234	0	2	BRUNO DIVITA	GABRIEL	0	N/A	N/A	N/A	0.0185	N/A	N/A	N/A
374	0	PH	DA SILVA PEREIRA	MANUEL	0	N/A	N/A	N/A	0.0199	N/A	N/A	N/A
224	0	14	BOHORQUEZ MORAN	CARMEN L.	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
249	0	1	CALLES RODRIGUEZ	ANDRES Y JOSE	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
251	0	6	CAMACHO	ALBORADA	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
301	0	11	CARMONA	NANCY COROMOTO	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
386	0	4	DAVIS	DANIEL ALEJANDRO	0	N/A	N/A	N/A	0.0185	N/A	N/A	N/A
420	0	1	DONA MARCANO	JESUS E.	0	N/A	N/A	N/A	0.0185	N/A	N/A	N/A
497	0	PB	F-47 C.A.	DESARROLLOS .	0	N/A	N/A	N/A	0.0195	N/A	N/A	N/A
523	0	3	FIGUEROA	PEDRO MANUEL	0	N/A	N/A	N/A	0.0187	N/A	N/A	N/A
828	0	1	JRAICHE SALEH	JONATHAN	0	N/A	N/A	N/A	0.0185	N/A	N/A	N/A
1203	0	4	PEDRO	GUERRERO BILANCIERI	0	N/A	N/A	N/A	0.0185	N/A	N/A	N/A
1424	0	2	TAMARA	BILANCIELI	0	N/A	N/A	N/A	0.0185	N/A	N/A	N/A
1441	0	5	TORREALBA	GUSTAVO ADOLFO	0	N/A	N/A	N/A	0.0185	N/A	N/A	N/A
45	0	3	ALCALDE MORA	YESER	0	N/A	N/A	N/A	0.0150	N/A	N/A	N/A
186	0	5	BANEGAS	CARMEN INES	0	N/A	N/A	N/A	0.0185	N/A	N/A	N/A
395	0	6	DE FIUME	MARIA	0	N/A	N/A	N/A	0.0198	N/A	N/A	N/A
411	0	1	DI PRIMA	ROBERTO	0	N/A	N/A	N/A	0.0150	N/A	N/A	N/A
1334	0	3	ROMERO RUSSI	MIGUEL ANGEL	0	N/A	N/A	N/A	0.0185	N/A	N/A	N/A
1387	0	5	SCHNAIDER	HECTOR	0	N/A	N/A	N/A	0.0150	N/A	N/A	N/A
1402	0	PB	SINISCALCHI	UMBERTINA	0	N/A	N/A	N/A	0.0187	N/A	N/A	N/A
83	0	4	ALONSO	ANISETO IGNACIO	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A
220	0	8	BLANCO	CRISTOBAL	0	N/A	N/A	N/A	0.0235	N/A	N/A	N/A
376	0	5	DAHEC GARRIDO	RAFAEL	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A
403	0	6	DE TACON	LISSETTE	0	N/A	N/A	N/A	0.0216	N/A	N/A	N/A
617	0	5	GUARATASMA LOPEZ	ISBELIA	0	N/A	N/A	N/A	0.0230	N/A	N/A	N/A
923	0	2	LORETO	ZENITH	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A
1322	0	4	RODRIGUEZ	RAFAEL	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A
1361	0	8	SABINA	LISBETH	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A
1383	0	7	SAROUKHAN	ABBOUD	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A
1417	0	3	SUAREZ	ARTURO LEANEZ	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A
70	0	12	ALFONSO	RUBEN	0	N/A	N/A	N/A	0.0366	N/A	N/A	N/A
89	0	11	ALVAREZ C.	DANIEL A.	0	N/A	N/A	N/A	0.0366	N/A	N/A	N/A
182	0	9	BALL	INGRID	0	N/A	N/A	N/A	0.0366	N/A	N/A	N/A
194	0	9	BAUTISTA A.	MARIA E.	0	N/A	N/A	N/A	0.0366	N/A	N/A	N/A
227	0	PH	BOTERO A.	CAMERON D. ALAN /	0	N/A	N/A	N/A	0.0608	N/A	N/A	N/A
485	0	11	ESPINAL	CARLOS	0	N/A	N/A	N/A	0.0366	N/A	N/A	N/A
602	0	2	GONZALEZ	LUIS MANUEL	0	N/A	N/A	N/A	0.0366	N/A	N/A	N/A
814	0	6	JOSE FELIX	MESA	0	N/A	N/A	N/A	0.0366	N/A	N/A	N/A
827	0	PH	JOUBERT	FEDERICO	0	N/A	N/A	N/A	0.0608	N/A	N/A	N/A
865	0	7	K. / CARMEN	FRANCOIS A. CUBEK	0	N/A	N/A	N/A	0.0366	N/A	N/A	N/A
1072	0	3	MATOS RIVAS	JOSE F.	0	N/A	N/A	N/A	0.0366	N/A	N/A	N/A
1106	0	10	MOHAMED	JOHN	0	N/A	N/A	N/A	0.0366	N/A	N/A	N/A
1125	0	1	NARVAEZ TORRES	HUGO A.	0	N/A	N/A	N/A	0.0366	N/A	N/A	N/A
1188	0	5	PADRON TORREALBA	FANNY J.	0	N/A	N/A	N/A	0.0366	N/A	N/A	N/A
1225	0	5	PILEGGI PILEGGI	NICOLA	0	N/A	N/A	N/A	0.0366	N/A	N/A	N/A
1264	0	6	RAMOS DAY	DANIEL ERNESTO	0	N/A	N/A	N/A	0.0366	N/A	N/A	N/A
1366	0	3	SALAS BORJAS	MARIANA	0	N/A	N/A	N/A	0.0366	N/A	N/A	N/A
1374	0	1	SANCHEZ	ISABEL	0	N/A	N/A	N/A	0.0366	N/A	N/A	N/A
1418	0	2	SUAREZ AULAR	FRANCISCO J.	0	N/A	N/A	N/A	0.0366	N/A	N/A	N/A
1485	0	10	VILLALBA A.	LUISA A.	0	N/A	N/A	N/A	0.0366	N/A	N/A	N/A
1508	0	8	Y ROBERTO RIVAS	YOLANDA	0	N/A	N/A	N/A	0.0366	N/A	N/A	N/A
1519	0	4	YATIM	JORGE	0	N/A	N/A	N/A	0.0366	N/A	N/A	N/A
9	0	PH	ABREU	OLIVIA	0	N/A	N/A	N/A	0.0287	N/A	N/A	N/A
12	0	9	ACOSTA SANGRONA	JUAN MANUEL	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
99	0	10	AMAYA PENA	RICARDO YOVEIRO	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
155	0	14	ARANGUREN	PEDRO PABLO	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
205	0	4	BELTRAN	JORGE	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
206	0	7	BENARROCH	ELIAS	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
208	0	3	BENZAQUEN	RAQUEL	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
1301	0	11	RICCIO CAPUTO	GERARDO	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
1388	0	7	SEGURA	JULIO Y MARIA	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
1394	0	12	SERMECA	MENSAJEROS EXPRESOS, C.A.	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
1397	0	9	SICULA S.R.L.	INMOBILIARIA	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
1403	0	9	SIRIT MEZA	REINA MARIBEL	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
1454	0	7	URDANETA	RAMON	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
1457	0	6	VALENTE RUELA	JOAO JULIO	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
1483	0	4	VILLA DE MARTUL	MANUELA	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
1510	0	9	Y S. MARCHAN	H. FERNANDEZ	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
1529	0	13	YONA BENDAHAN	ENCARNACION DE N.	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
1538	0	14	ZAMBRANO	EDILBERTO Y SRA.	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
27	0	6	AGUILERA	ELBA	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
88	0	8	ALVAREZ	LILIAN	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
125	0	5	ANGEL MATA.	TERESA N. DE MATA	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
156	0	9	ARCAMONE	GLENDA	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
167	0	11	ARTECA	ANGELA	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
168	0	9	ARTECA	ANTONIO	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
193	0	12	BATLLES	SUCESION RIVAS  DE	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
247	0	11	CACIANA ANTEQUERA	CARMEN. A.	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
308	0	10	CARVAJAL CHITTY	HUMBERTO	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
749	0	9	JAVIER	MARTINEZ  RODRIGUEZ	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A
787	0	5	JOSE	DIAZ	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A
803	0	16	JOSE  URGUIZA	DIANA  DE	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A
839	0	9	JUAN  CARLOS	GONZALEZ  VERA	0	N/A	N/A	N/A	0.0066	N/A	N/A	N/A
878	0	12	LAURA  LEZAMA  -	ELSA  DUHARTE	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A
890	0	5	LEONARDO	BERTOGLI	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A
927	0	7	LOURDES	MORA  DE  LA  HUEBRA	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
951	0	2	LUIS  GUILLERMO	RODRIGUEZ  S.	0	N/A	N/A	N/A	0.0087	N/A	N/A	N/A
996	0	2	MARIA	HERNANDEZ	0	N/A	N/A	N/A	0.0087	N/A	N/A	N/A
1004	0	14	MARIA  DEL  CARMEN	PORRAS	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
1006	0	11	MARIA  EUGENIA	BARBIER	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A
327	0	8	CIATTI PASQUINI	FELICE	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
441	0	14	EDUARDO ALVARADO	ANA ACEVEDO Y	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
499	0	10	FAJARDO SILVERA	MANUEL ANTONIO	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
506	0	4	FELIPE ZAMORA	CARMEN TORTOLANI	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
525	0	1	FONSECA	HERMES	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
561	0	3	GARCIA M,	ANIBAL	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
570	0	10	GERARDO MILANO	RAQUEL GALLARDO Y	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
578	0	4	GINTEL	JERZY	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
597	0	8	GOMEZ	NORMA	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
598	0	13	GOMEZ ARIAS	FRANKLIN JAVIER	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
613	0	3	GROM CYRYL	EDWARD	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
631	0	5	GUTIERREZ DE FERNANDEZ	SARA	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
652	0	14	HO	ESTEBAN	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
722	0	3	IOK TENG DE HUI	KIN SUN HUI	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
873	0	PB	LA GENESTROIKA C.A.	INVERSIONES	0	N/A	N/A	N/A	0.0398	N/A	N/A	N/A
874	0	PB	LA GENESTROIKA C.A.	INVERSIONES	0	N/A	N/A	N/A	0.0448	N/A	N/A	N/A
881	0	11	LAZO	YENSI	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
894	0	7	LEONARDO PEREZ	YANDRES CHIRINOS	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
919	0	4	LORENA MIJARES	ANGEL RAMIREZ	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
953	0	3	LUIS COLMENAREZ	JUAN PERAZA	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
973	0	4	MALAVE	MORELLA	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
1064	0	5	MARTINEZ CARRASQUERO	AMPARO MAGDALENA	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
1068	0	13	MASSAI	ELIO	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
1069	0	1	MASSIMO	CONSTANZO MICHELE	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
1085	0	13	MENDEZ	ISABEL TERESA	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
1113	0	7	MONTOYA DE RODRIGUEZ	CARMEN. A.	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
795	0	P	JOSE	RINCON	0	751-8795	N/A	N/A	0.0178	N/A	N/A	N/A
911	0	7	LISBETH J. PARRA M.	JOSE L.DIAZ S. Y	0	751-2189	N/A	N/A	0.0089	N/A	N/A	N/A
1000	0	2	MARIA  ANGELES	GONCALVES  GO�I	0	751-2990	N/A	N/A	0.0062	N/A	N/A	N/A
1003	0	6	MARIA  DEL  CARMEN	GARCIA  VILAR	0	992-4622	N/A	N/A	0.0065	N/A	N/A	N/A
1121	0	6	MU�OZ	RAFAEL	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
1158	0	2	OCHOA ESPINOZA	REINA	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
1175	0	12	ORTIZ DE PETTI	JOSEFA	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
1255	0	14	RAMIREZ	VICTORIA	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
1265	0	2	RAMOS VASQUEZ	FRANCISCO	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
1285	0	13	REY	THAIS	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
1318	0	6	RODRIGUEZ	CONSTANTE	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
1323	0	5	RODRIGUEZ FAJARDO	ADALBERTO	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
1324	0	14	RODRIGUEZ LEBRUN	ARMANDO	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
292	0	1	CARMEN  T.	GONZALEZ CH.	0	1	1	1	0.0212	P	N/A	N/A
1367	0	12	SALAZAR	JOSE RAMON	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
1412	0	9	SOSA VAAMONDE	LUIS ADOLFO	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
160	0	4	ARGENIS ROJAS Y	SUSANA NAVAS	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A
180	0	1	AURORA DE R. Y	VICTOR RIVAS	0	N/A	N/A	N/A	0.0062	N/A	N/A	N/A
278	0	3	CARLOS EDUARDO	HERNANDEZ ARDILA	0	N/A	N/A	N/A	0.0065	N/A	N/A	N/A
425	0	1	DULCE  MARIA	CORONEL  GARCIA	0	N/A	N/A	N/A	0.0088	N/A	N/A	N/A
429	0	1	EDGAR JOSE	JOA MATOS	0	N/A	N/A	N/A	0.0087	N/A	N/A	N/A
439	0	5	EDUARDO	GARCIA	0	N/A	N/A	N/A	0.0064	N/A	N/A	N/A
463	0	8	ELIZABETH INMACULADA	ARANGUREN	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
496	0	16	EXCLUSIVIDADES	PALIO  C.  A.	0	N/A	N/A	N/A	0.0065	N/A	N/A	N/A
527	0	6	FRANCESCO	COLTRARO	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
545	0	16	FRANZ	DIEMINGER	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A
549	0	8	FREDDY   ENRIQUE	MORA	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A
550	0	16	FREDDY M. GARCIA	LIBIA DE GARCIA	0	N/A	N/A	N/A	0.0064	N/A	N/A	N/A
565	0	14	GENARO	CARRASCO	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A
581	0	11	GIRALUNA	RONDON	0	N/A	N/A	N/A	0.0065	N/A	N/A	N/A
128	0	10	ANGELICA	KNEPPER MACIAS	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A
212	0	15	BERTHA   CECILIA	MORALES  ORTEGA	0	N/A	N/A	N/A	0.0064	N/A	N/A	N/A
674	0	N2	ILERJU,	S.A.	0	N/A	N/A	N/A	0.0018	N/A	N/A	N/A
16	0	15	ADMINISTRADORA	LAS  LUCIAS	0	N/A	N/A	N/A	0.0065	N/A	N/A	N/A
59	0	3	ALEMAN	ESTHER	0	N/A	N/A	N/A	0.0421	N/A	N/A	N/A
426	0	2	E  IVONNE E. RODRIGUEZ	JOSE A. CONNOR	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
1117	0	1	MOSQUERA	CARLOS ENRIQUE	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
1335	0	10	ROMERO Y OTROS	SALVAROR	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
1342	0	12	ROSA DE G.	ANGEL GUTIERREZ Y	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
1456	0	4	VALBUENA	HUMBERTO	0	N/A	N/A	N/A	0.0150	N/A	N/A	N/A
231	0	5	BRITO	AMILCAR	0	N/A	N/A	N/A	0.0421	N/A	N/A	N/A
258	0	PB	CARIBE SACA	BANCO DEL	0	N/A	N/A	N/A	0.1011	N/A	N/A	N/A
259	0	PB	CARIBE SACA	BANCO DEL	0	N/A	N/A	N/A	0.0393	N/A	N/A	N/A
522	0	2	FIGUEREDO	RAFAEL	0	N/A	N/A	N/A	0.0421	N/A	N/A	N/A
594	0	5	GODOY	LEDYS M.	0	N/A	N/A	N/A	0.0421	N/A	N/A	N/A
605	0	4	GONZALEZ  GUERRA	CESAR L.	0	N/A	N/A	N/A	0.0421	N/A	N/A	N/A
680	0	PB	IMPORT, C.A.	IMPERIAL	0	N/A	N/A	N/A	0.0393	N/A	N/A	N/A
681	0	PB	IMPORT, C.A.	IMPERIAL	0	N/A	N/A	N/A	0.0393	N/A	N/A	N/A
774	0	1	JOERCE, C.A.	INVERSIONES	0	N/A	N/A	N/A	0.0532	N/A	N/A	N/A
1145	0	3	NIETO	FLOR DE MARIA	0	N/A	N/A	N/A	0.0421	N/A	N/A	N/A
1153	0	2	NU�EZ	GISELA  C.	0	N/A	N/A	N/A	0.0421	N/A	N/A	N/A
1196	0	4	PASQUALE	ANGELO	0	N/A	N/A	N/A	0.0421	N/A	N/A	N/A
1197	0	4	PASQUALE	ANTONELLA	0	N/A	N/A	N/A	0.0421	N/A	N/A	N/A
1233	0	5	PROSPERI	LUIS	0	N/A	N/A	N/A	0.0421	N/A	N/A	N/A
20	0	1	ADRIANA	CARVAJAL CUEVAS	0	N/A	N/A	N/A	0.0202	N/A	N/A	N/A
148	0	2	ANTONIO	SANTOS	0	N/A	N/A	N/A	0.0302	N/A	N/A	N/A
165	0	1	ARMANDO	BRANGER	0	N/A	N/A	N/A	0.0277	N/A	N/A	N/A
235	0	1	BSM	ASOCIACION CIVIL	0	N/A	N/A	N/A	0.0284	N/A	N/A	N/A
236	0	1	BSM	ASOCIACION CIVIL	0	N/A	N/A	N/A	0.0302	N/A	N/A	N/A
237	0	2	BSM	ASOCIACION CIVIL	0	N/A	N/A	N/A	0.0284	N/A	N/A	N/A
238	0	3	BSM	ASOCIACION CIVIL	0	N/A	N/A	N/A	0.0281	N/A	N/A	N/A
239	0	3	BSM	ASOCIACION CIVIL	0	N/A	N/A	N/A	0.0287	N/A	N/A	N/A
240	0	P	BSM	ASOCIACION CIVIL	0	N/A	N/A	N/A	0.0143	N/A	N/A	N/A
269	0	1	CARLOS	GARRIDO BUSTAMANTE	0	N/A	N/A	N/A	0.0234	N/A	N/A	N/A
354	0	3	CLINICA CCT	SERGIO GINER	0	N/A	N/A	N/A	0.0287	N/A	N/A	N/A
552	0	1	GABRIEL	ROIG	0	N/A	N/A	N/A	0.0283	N/A	N/A	N/A
553	0	1	GABRIEL	ROIG	0	N/A	N/A	N/A	0.0292	N/A	N/A	N/A
586	0	1	GIUSEPPE	CARMAGNOLA	0	N/A	N/A	N/A	0.0226	N/A	N/A	N/A
627	0	2	GUSTAVO	YANES	0	N/A	N/A	N/A	0.0202	N/A	N/A	N/A
670	0	3	IKER URCELAY	MASPERO	0	N/A	N/A	N/A	0.0268	N/A	N/A	N/A
691	0	1	INMOBILIARIA	ROSO,C.A	0	N/A	N/A	N/A	0.0374	N/A	N/A	N/A
706	0	1	INVERSIONES	DELTA	0	N/A	N/A	N/A	0.0221	N/A	N/A	N/A
777	0	2	JORGE	LANDALUCE	0	N/A	N/A	N/A	0.0198	N/A	N/A	N/A
817	0	3	JOSE GREGORIO	FRANCO	0	N/A	N/A	N/A	0.0281	N/A	N/A	N/A
818	0	1	JOSE LUIS	LOPEZ TOLEDO	0	N/A	N/A	N/A	0.0135	N/A	N/A	N/A
891	0	2	LEONARDO	MORENO	0	N/A	N/A	N/A	0.0292	N/A	N/A	N/A
970	0	1	MAGDALENA	ILIJA	0	N/A	N/A	N/A	0.0198	N/A	N/A	N/A
1055	0	2	MARK	MELILLI	0	N/A	N/A	N/A	0.0257	N/A	N/A	N/A
1095	0	2	MIGUEL ANGEL	AMADO DA SILVA	0	N/A	N/A	N/A	0.0398	N/A	N/A	N/A
1097	0	2	MILDRED	SOLANO	0	N/A	N/A	N/A	0.0283	N/A	N/A	N/A
1185	0	2	PABLO	SANCHEZ DE LEON	0	N/A	N/A	N/A	0.0277	N/A	N/A	N/A
1193	0	3	PAOLA	FORTINO	0	N/A	N/A	N/A	0.0396	N/A	N/A	N/A
1234	0	3	PROYECTOS	URBANOS PRODEUR, C.A.	0	N/A	N/A	N/A	0.0444	N/A	N/A	N/A
1238	0	2	RAFAEL	GERDEL	0	N/A	N/A	N/A	0.0216	N/A	N/A	N/A
1290	0	2	RICARDO	ANDA TORO	0	N/A	N/A	N/A	0.0226	N/A	N/A	N/A
1308	0	3	ROBERTO	PEREZ	0	N/A	N/A	N/A	0.0268	N/A	N/A	N/A
1373	0	3	SALVATORE	BOTIGLIERI	0	N/A	N/A	N/A	0.0382	N/A	N/A	N/A
1410	0	1	SORAYA MERCEDES	MOSSI APARICIO	0	N/A	N/A	N/A	0.0216	N/A	N/A	N/A
113	0	2	ANANIAS	MORENO	0	N/A	N/A	N/A	0.0088	N/A	N/A	N/A
1451	0	2	TRINI	GUEVARA	0	N/A	N/A	N/A	0.0221	N/A	N/A	N/A
1462	0	3	VANESSA KARINA	CONSTANTINO D�VILA	0	N/A	N/A	N/A	0.0382	N/A	N/A	N/A
1515	0	2	YANETH	HIDALGO	0	N/A	N/A	N/A	0.0135	N/A	N/A	N/A
17	0	2	ADRIAN ARGENIS	OVALLES SMITTER	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
28	0	7	AGUSTIN	DE LECA	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
52	0	2	ALEJANDRINA	RIVAS	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
115	0	5	ANDREA	MARQUEZ DIAS	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
142	0	1	ANTONIO	GABRIEL	0	N/A	N/A	N/A	0.0100	N/A	N/A	N/A
195	0	9	BEATRIS Y MARIA	TORRES	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
199	0	12	BEDYS ELIZABETH	GARCIA FERRER	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
201	0	10	BELKYS CORTESIA	JUAN HERRERA/	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
279	0	11	CARLOS JOSE	ROMERO	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
293	0	6	CARMEN AMANDA	GOMEZ N.	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
407	0	9	DELIA	PEREZ RODRIGUEZ	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
430	0	7	EDILSA	VALLADARES C.	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
455	0	7	ELIDA ESTHER	SANCHEZ PEREZ	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
467	0	2	EMILIO	VALERA AZUAJE	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
468	0	4	EMILIO C.	GUERRERO CONWAY	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
472	0	6	ENMANUEL	GENNUSO SARTA	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
486	0	8	ESTHER Y MANUEL	RIODRIGUEZ	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
491	0	3	EUKARIS CAROLINA	BATISTA JIMENEZ	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
537	0	3	FRANCISCO	YELAMOS S.	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
611	0	1	GREGORIA	RUIZ FIGUEROA	0	N/A	N/A	N/A	0.0093	N/A	N/A	N/A
622	0	10	GUILLERMO A.	MEDINA	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
636	0	4	HECTOR	PANTOJA	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
658	0	10	HUGO A.	OSORIO VIANA	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
659	0	8	HUGO A.	SALAZAR PANZ	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
763	0	1	JESUS	VALCARCEL IGLESIAS	0	N/A	N/A	N/A	0.0093	N/A	N/A	N/A
821	0	1	JOSE MIGUEL	RAMOS	0	N/A	N/A	N/A	0.0100	N/A	N/A	N/A
822	0	2	JOSE MIGUEL	SANCHEZ BAUTISTA	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
829	0	5	JUAN	ALVAREZ FERNANDEZ	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
198	0	2	BECERRA	LUDY  J.	0	N/A	N/A	N/A	0.0421	N/A	N/A	N/A
901	0	4	LETICIA MOLINA	ROBERTO MOLINA/	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
952	0	6	LUIS ALBERTO	RAMOS SANCHEZ	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
1025	0	12	MARIA LOUDES	VALLADARES GONZALEZ	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
1033	0	3	MARIA USUBILLAGA	RAFAEL SOLBAS/	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
1042	0	11	MARIELA MARILU	SANELLA LOVERA	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
1103	0	6	MIRIAM	JIMENEZ SORIANO	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
1278	0	3	REINA CRISTINA	MORENO	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
1345	0	7	ROSALBA	RIOS BERNAL	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
1349	0	5	ROSANGELA ORTEGA	RICHARD RONDON Y	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
1359	0	PB	S.A.	CONDRASA,	0	N/A	N/A	N/A	0.0216	N/A	N/A	N/A
1393	0	2	SERGIO OSCAR	ROSALEZ ALVAREZ	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
1399	0	12	SILVANA	CERUZZI GRIPPO	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
1409	0	10	SONIA ELIZABETH	AGUILAR ANDREA	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
1422	0	11	SUSANA MARIA	MARTINI TORTONE	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
1498	0	6	WILLI	MENDOZA S.	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
1532	0	7	YSMENIA DEL PILAR	OCHOA TERAN	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
1104	0	10	MIRNA I..	HERRERA C.	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
1109	0	9	MONICA NELLY	PEDROZA CASTILLO	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
1138	0	7	NESTOR	VENEGAS	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
1314	0	9	RODOLFO JOSE	MAGALLANES	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
1331	0	12	ROMANO	MANFRE MORE	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
1406	0	5	SOMYS RAQUEL	LANDAETA VEROES	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
1494	0	8	WALTER ALEXANDRO	RATTO MU�IZ	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
1497	0	8	WILD ALFREDO	GUEVARA SARTI	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
4	0	11	1848, S.A.	INVERSIONES	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
39	0	10	ALBERTO	PERALDO PUENTE	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
58	0	11	ALEJANDRO O.	FONSECA	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
97	0	7	AMAYA	ALDAZ LARRAZA,	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
107	0	4	ANA ALCIRA	BALZA M.	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
210	0	4	BERNARDA DOLORES	TOVAR RODRIGUEZ	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
243	0	PB	C.A.	INVERSIONES RIAC,	0	N/A	N/A	N/A	0.0204	N/A	N/A	N/A
275	0	10	CARLOS A.	LOPEZ CHACIN	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
315	0	3	CECILIA	ANCHICOQUE	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
317	0	9	CEFERINA SALAZAR	ENRIQUE QUINTANA Y	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
353	0	12	CLAUDIO CAROLI	ANNI	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
378	0	10	DALIA ANTONIETA	SILVA LARRAZABAL	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
413	0	4	DIEGO	DI CIOCCIO SANTACROCE	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
1459	0	9	VALONGO PRIMOZIC	ANA MARIA	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A
1499	0	3	WILLIAM	GONZALEZ	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
48	0	11	ALCIRA ROMERO	GUSTAVO RAMIREZ Y	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
1270	0	PB	RAUL	HIGUERA MESA	0	N/A	N/A	N/A	0.0509	N/A	N/A	N/A
1504	0	PB	Y  SERVICIOS	TEE INSTALACIONES	0	N/A	N/A	N/A	0.0255	N/A	N/A	N/A
588	0	01	GLADYS ARIAS DE	FERRER	0	N/A	N/A	N/A	0.0132	N/A	N/A	N/A
849	0	01	JUDITH	HERNANDEZ	0	N/A	N/A	N/A	0.0134	N/A	N/A	N/A
947	0	02	LUIS	VARGAS	0	N/A	N/A	N/A	0.0132	N/A	N/A	N/A
994	0	02	MARIA	FERNANDEZ	0	N/A	N/A	N/A	0.0134	N/A	N/A	N/A
1	0	3	N/A	PETEX	0	N/A	N/A	N/A	0.0514	N/A	N/A	N/A
850	0	01	JUDITH SIMONA	BENGUIGUI BERGEL	0	111111111	1111111111	N/A	0.0648	N/A	N/A	N/A
51	0	1	ALEJANDRA	MARQUEZ VILLA	0	1	1	N/A	0.0544	N/A	N/A	N/A
326	0	2	CHRISTIAN	DI GIOVANNI DI UBALDO	0	1	1	N/A	0.0634	N/A	N/A	N/A
369	0	4	CRUZ MANUEL	GARRIDO	0	1	1	N/A	0.0514	N/A	N/A	N/A
690	0	2	INMBL.	FAIMACO	0	1	1	N/A	0.0514	N/A	N/A	N/A
799	0	3	JOSE   V.	GARCES	0	1	1	N/A	0.0634	N/A	N/A	N/A
841	0	4	JUAN  MANUEL	RODRIGUEZ CENTENO	0	1	1	N/A	0.0634	N/A	N/A	N/A
852	0	3	JULIA	DE  PENZO	0	1	1	N/A	0.0544	N/A	N/A	N/A
935	0	5	LUIS	BRUZUAL	0	1	1	N/A	0.0544	N/A	N/A	N/A
990	0	4	MARGARITA	VALERO	0	1	1	N/A	0.0544	N/A	N/A	N/A
1227	0	P	POMPEYO	DE  FALCO	0	1	1	N/A	0.0906	N/A	N/A	N/A
1229	0	5	PRADO	MORITA  2	0	1	1	N/A	0.0634	N/A	N/A	N/A
1241	0	1	RAFAEL  A.	RIVERO	0	1	1	N/A	0.0514	N/A	N/A	N/A
1250	0	MZ	RAIZA	SILANO	0	1	1	N/A	0.0634	N/A	N/A	N/A
1303	0	2	RICHARD W.	DELGADO C.	0	1	1	N/A	0.0544	N/A	N/A	N/A
1339	0	5	ROSA	MORENO	0	1	1	N/A	0.0514	N/A	N/A	N/A
1513	0	1	YAJAIRA	MARQUEZ MORA	0	1	1	N/A	0.0634	N/A	N/A	N/A
7	0	14	ABELARDO  DIAZ  Y	ESMERALDA   DE	0	753-8920	014-9-466446	N/A	0.0066	N/A	N/A	N/A
380	0	03	DAMAS ANTON	MIREYA  N.	0	271	N/A	N/A	0.0134	N/A	N/A	N/A
451	0	08	ELDA	PENAGO	0	271	N/A	N/A	0.0132	N/A	N/A	N/A
481	0	05	ERNESTO Y EUCARIS DE	MONSALVE	0	271	N/A	N/A	0.0134	N/A	N/A	N/A
490	0	10	EUCARIS	PI�ERO	0	271	N/A	N/A	0.0132	N/A	N/A	N/A
501	0	11	FANNY	GUANDA	0	271	N/A	N/A	0.0134	N/A	N/A	N/A
546	0	18	FRED	MEYER	0	271	N/A	N/A	0.0132	N/A	N/A	N/A
548	0	07	FREDDY	SALAZAR	0	271	N/A	N/A	0.0134	N/A	N/A	N/A
568	0	05	GEORGINA	MOYA	0	271	N/A	N/A	0.0134	N/A	N/A	N/A
587	0	08	GIUSEPPE	SEGRETTO	0	271	N/A	N/A	0.0134	N/A	N/A	N/A
688	0	04	INGRID JOSEFINA	MONSALVE	0	271	N/A	N/A	0.0134	N/A	N/A	N/A
736	0	14	IVONNE	ZAPATA	0	271	N/A	N/A	0.0132	N/A	N/A	N/A
757	0	15	JESUS	GARCIA	0	271	N/A	N/A	0.0134	N/A	N/A	N/A
761	0	15	JESUS	ROJAS	0	271	N/A	N/A	0.0134	N/A	N/A	N/A
769	0	16	JOAQUIN GOMEZ	DE OLIVEIRA	0	271	N/A	N/A	0.0132	N/A	N/A	N/A
782	0	03	JOSE	CABRAL	0	271	N/A	N/A	0.0134	N/A	N/A	N/A
796	0	04	JOSE	SILVERSTRI	0	271	N/A	N/A	0.0134	N/A	N/A	N/A
804	0	18	JOSE A. GIL	JOHANA PEDROSO Y	0	271	N/A	N/A	0.0132	N/A	N/A	N/A
830	0	06	JUAN	BARRIOS	0	271	N/A	N/A	0.0134	N/A	N/A	N/A
831	0	09	JUAN	CAVERO	0	271	N/A	N/A	0.0134	N/A	N/A	N/A
833	0	05	JUAN	MORALES	0	271	N/A	N/A	0.0132	N/A	N/A	N/A
847	0	07	JUANA	DEL PINO	0	271	N/A	N/A	0.0132	N/A	N/A	N/A
860	0	12	JULIO  CESAR	BERMUDEZ	0	271	N/A	N/A	0.0132	N/A	N/A	N/A
884	0	05	LENIA	LOPEZ ROJAS	0	271	N/A	N/A	0.0132	N/A	N/A	N/A
900	0	08	LETICIA	PAOLINI	0	271	N/A	N/A	0.0132	N/A	N/A	N/A
915	0	10	LJUBICA TUCOVICH	DE CAPELETTI	0	271	N/A	N/A	0.0132	N/A	N/A	N/A
974	0	16	MANUEL	BERMUDEZ	0	271	N/A	N/A	0.0134	N/A	N/A	N/A
1088	0	17	MERCEDES  A.	MENDOZA  H.	0	271	N/A	N/A	0.0134	N/A	N/A	N/A
1091	0	07	MICHELLE	VETROMILLI	0	271	N/A	N/A	0.0132	N/A	N/A	N/A
1132	0	12	NELLY	OSTOS	0	271	N/A	N/A	0.0134	N/A	N/A	N/A
1133	0	13	NELSON	GONZALEZ	0	271	N/A	N/A	0.0132	N/A	N/A	N/A
1134	0	17	NELSON	RODRIGUEZ	0	271	N/A	N/A	0.0132	N/A	N/A	N/A
1137	0	08	NESTOR	GOMEZ	0	271	N/A	N/A	0.0134	N/A	N/A	N/A
1159	0	04	OCTAVIO	ESPINOZA	0	271	N/A	N/A	0.0132	N/A	N/A	N/A
1160	0	03	ODOARDO	RODRIGUEZ	0	271	N/A	N/A	0.0132	N/A	N/A	N/A
1143	0	3	NICOLO	MARRA	0	751-9572	N/A	N/A	0.0064	N/A	N/A	N/A
1232	0	15	PRIMO  D.	DE  GREGORIO	0	753-9193	N/A	N/A	0.0089	N/A	N/A	N/A
1408	0	7	SONIA ELISA	ROJAS PIERETTI	0	551-3733; 551-5730	N/A	N/A	0.0063	N/A	N/A	N/A
1500	0	12	WILLIAMS  JOSUE	SIRA  VELASQUEZ	0	265-7647	N/A	N/A	0.0089	N/A	N/A	N/A
1531	0	8	YOUSSEF	KARAM	0	263-1247	N/A	N/A	0.0090	N/A	N/A	N/A
885	0	11	LEON	AMELINCKX	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
5	0	2	203040, C.A.	ADMINISTRADORA	0	1	N/A	N/A	0.0080	N/A	N/A	N/A
22	0	5	ADRIANA I.	SALAZAR MARCANO	0	76	N/A	N/A	0.0085	N/A	N/A	N/A
26	0	1	AGRESTI ALONSO	HERMOSINDA	0	1	N/A	N/A	0.0067	N/A	N/A	N/A
54	0	4	ALEJANDRO	GASTON SANTAROMITA	0	1	N/A	N/A	0.0046	N/A	N/A	N/A
61	0	5	ALESSI GRIFO	CAROLINA	0	61	N/A	N/A	0.0067	N/A	N/A	N/A
85	0	2	ALOS BORDET	MARIA DE LOS A.	0	1	N/A	N/A	0.0046	N/A	N/A	N/A
93	0	2	AMADO ENRIQUE	CLARO IZARRA	0	96	N/A	N/A	0.0089	N/A	N/A	N/A
147	0	3	ANTONIO	SALVIOLO	0	71	N/A	N/A	0.0085	N/A	N/A	N/A
153	0	1	ANTONIO P.	SALVIOLI MARMO	0	67	N/A	N/A	0.0120	N/A	N/A	N/A
158	0	1	AREVALO	VIRGINIA	0	1	N/A	N/A	0.0067	N/A	N/A	N/A
192	0	2	BARRETO MARTINEZ	BELKIS	0	98	N/A	N/A	0.0089	N/A	N/A	N/A
222	0	6	BLEJMAN	RAQUEL	0	89	N/A	N/A	0.0085	N/A	N/A	N/A
241	0	6	BURIEL	JEANETTE	0	108	N/A	N/A	0.0089	N/A	N/A	N/A
252	0	3	CAMPA DURAN	RODOLFO	0	1	N/A	N/A	0.0083	N/A	N/A	N/A
267	0	3	CARLOS	DAYANA MONTES DE OCA	0	1	N/A	N/A	0.0046	N/A	N/A	N/A
281	0	4	CARLOS LUIS	VILLARROEL	0	1	N/A	N/A	0.0083	N/A	N/A	N/A
300	0	6	CARMEN TRASANDE	JONNY LOUTPHI -	0	63	N/A	N/A	0.0119	N/A	N/A	N/A
307	0	4	CARSTENS	GUSTAVO	0	86	N/A	N/A	0.0085	N/A	N/A	N/A
310	0	3	CASAS	CRISTIAN	0	1	N/A	N/A	0.0079	N/A	N/A	N/A
311	0	PB	CASIANI	MARIA FERNANDA	0	1	N/A	N/A	0.0115	N/A	N/A	N/A
313	0	3	CASTRO M.	RAUL HERNANDO	0	1	N/A	N/A	0.0067	N/A	N/A	N/A
340	0	2	CIMA AVILA 23, C.A.	INVERSIONES	0	97	N/A	N/A	0.0086	N/A	N/A	N/A
359	0	3	CONST. H	MAT. Y SERV.	0	1	N/A	N/A	0.0073	N/A	N/A	N/A
373	0	5	DA SILVA GOMES	LUIS HUMBERTO	0	2	N/A	N/A	0.0079	N/A	N/A	N/A
412	0	5	DIAZ	MIGUEL ANGEL	0	1	N/A	N/A	0.0046	N/A	N/A	N/A
423	0	4	DUARTE CALDEIRA	JOSE	0	56	N/A	N/A	0.0067	N/A	N/A	N/A
427	0	1	EDGAR	TAVARES	0	1	N/A	N/A	0.0079	N/A	N/A	N/A
459	0	5	ELIZABETH	LEAL	0	59	N/A	N/A	0.0067	N/A	N/A	N/A
543	0	4	FRANCO	LUIS	0	1	N/A	N/A	0.0067	N/A	N/A	N/A
551	0	4	FUENTES	EDWIN	0	1	N/A	N/A	0.0079	N/A	N/A	N/A
558	0	6	GARCIA	MAXIMO ALEJANDRO	0	65	N/A	N/A	0.0066	N/A	N/A	N/A
563	0	6	GARCIA U.	WILLIAN FERMIN	0	77	N/A	N/A	0.0085	N/A	N/A	N/A
596	0	5	GOMEZ	IRIS VIANEY	0	107	N/A	N/A	0.0089	N/A	N/A	N/A
601	0	2	GONZALEZ	ANA	0	1	N/A	N/A	0.0046	N/A	N/A	N/A
603	0	4	GONZALEZ	MARIA DE LOS A.	0	73	N/A	N/A	0.0085	N/A	N/A	N/A
618	0	6	GUERRA	LUIS J.	0	1	N/A	N/A	0.0064	N/A	N/A	N/A
646	0	7	HERNANDEZ	JACSON DE FREITAS	0	92	N/A	N/A	0.0163	N/A	N/A	N/A
743	0	6	JACINTO PARRA	CAROLINA FERRER/	0	109	N/A	N/A	0.0086	N/A	N/A	N/A
768	0	5	JOAO LUIS	GOMES CORREIA	0	57	N/A	N/A	0.0083	N/A	N/A	N/A
887	0	1	LEON RAMPESSAD	GLENMAR DEL CARMEN	0	2	N/A	N/A	0.0046	N/A	N/A	N/A
899	0	5	LEOSAR, C.A.	INVERSIONES	0	1	N/A	N/A	0.0067	N/A	N/A	N/A
962	0	PB	LUNA	ANA AZALIA	0	94	N/A	N/A	0.0121	N/A	N/A	N/A
963	0	2	LUONGO	SOFIA	0	1	N/A	N/A	0.0067	N/A	N/A	N/A
1012	0	1	MARIA C. BALLABEN L.	LUIS F. MORALES R/	0	1	N/A	N/A	0.0067	N/A	N/A	N/A
1021	0	PB	MARIA FERNANDA	ZAJEA	0	1	N/A	N/A	0.0050	N/A	N/A	N/A
1083	0	2	MENDEZ	CARLOS	0	1	N/A	N/A	0.0067	N/A	N/A	N/A
1105	0	1	MODICA	ANTININA INFRANCO	0	2	N/A	N/A	0.0067	N/A	N/A	N/A
1110	0	5	MONSALVE	LUIS ALBERTO	0	58	N/A	N/A	0.0079	N/A	N/A	N/A
1126	0	4	NASCIMIENTO	FATIMA DE JESUS	0	1	N/A	N/A	0.0079	N/A	N/A	N/A
1148	0	7	NOBREGA	DANILO	0	112	N/A	N/A	0.0171	N/A	N/A	N/A
1179	0	1	OSORIO	ALEJANDRO	0	1	N/A	N/A	0.0046	N/A	N/A	N/A
1191	0	3	PANZA	ANTONIO	0	99	N/A	N/A	0.0089	N/A	N/A	N/A
1192	0	3	PANZA	ANTONIO	0	100	N/A	N/A	0.0086	N/A	N/A	N/A
1217	0	4	PEREZ OLVARES	YARBIC CAROLINA	0	103	N/A	N/A	0.0086	N/A	N/A	N/A
1254	0	2	RAMIREZ	JOSE JACINTO	0	1	N/A	N/A	0.0079	N/A	N/A	N/A
1256	0	PB	RAMIREZ D.	KENNETH RODDGERS	0	95	N/A	N/A	0.0127	N/A	N/A	N/A
1257	0	3	RAMIREZ D.	MARILYN LIDSAY	0	101	N/A	N/A	0.0089	N/A	N/A	N/A
1263	0	PB	RAMOS	RAFAEL JOSE	0	1	N/A	N/A	0.0112	N/A	N/A	N/A
1272	0	PB	RAVELO	ROGER	0	1	N/A	N/A	0.0053	N/A	N/A	N/A
1284	0	6	REY	PEDRO ELIANT	0	110	N/A	N/A	0.0089	N/A	N/A	N/A
1286	0	5	REY LORENZO	JORGE	0	75	N/A	N/A	0.0085	N/A	N/A	N/A
1288	0	2	REZETTI	DANIELA E.	0	1	N/A	N/A	0.0067	N/A	N/A	N/A
1327	0	3	ROJAS	JOSE JACINTO	0	1	N/A	N/A	0.0079	N/A	N/A	N/A
1337	0	PB	RONALD SALAS	RODNEY SALAS	0	1	N/A	N/A	0.0101	N/A	N/A	N/A
1354	0	6	RUBENS R.	ROMERO BARON	0	2	N/A	N/A	0.0098	N/A	N/A	N/A
1376	0	1	SANTANA	ALBERTO	0	68	N/A	N/A	0.0120	N/A	N/A	N/A
1411	0	3	SORIANO	ALEX	0	1	N/A	N/A	0.0067	N/A	N/A	N/A
1420	0	1	SURIANI SORIANI	GIUSEPPE	0	1	N/A	N/A	0.0080	N/A	N/A	N/A
1465	0	3	VENTURA	JOSE DE JESUS	0	72	N/A	N/A	0.0087	N/A	N/A	N/A
1466	0	1	VERONICA A.	LOZADA	0	2	N/A	N/A	0.0083	N/A	N/A	N/A
1481	0	1	VIEIRA DA SILVA	JOSE JORGE	0	1	N/A	N/A	0.0085	N/A	N/A	N/A
1486	0	4	VILLALOBOS	HOWARD DE JESUS	0	1	N/A	N/A	0.0083	N/A	N/A	N/A
1495	0	5	WANDELINDER RODRIGUEZ	TREBLINK OMAR	0	87	N/A	N/A	0.0085	N/A	N/A	N/A
1523	0	4	YEPEZ	FRANCISCO J.	0	102	N/A	N/A	0.0089	N/A	N/A	N/A
1525	0	6	YESSICA	NAIRUD RAMOS	0	2	N/A	N/A	0.0123	N/A	N/A	N/A
1530	0	4	YOSELINM	CATHERINE MARTINEZ	0	2	N/A	N/A	0.0067	N/A	N/A	N/A
419	0	7	DOMINGO	CHOQUE C.	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
470	0	12	ENCARNACION	BRIEGA	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
1539	0	6	ZAMBRANO PAGUA	JACK CARMELO	0	2	N/A	N/A	0.0117	N/A	N/A	N/A
394	0	6	DE F.	JULIO Q. DE FREITAS	0	90	N/A	N/A	0.0085	N/A	N/A	N/A
599	0	4	GOMEZ DE ROJAS	ANA MARIA	0	104	N/A	N/A	0.0091	N/A	N/A	N/A
651	0	2	HNEICH NASSOUR	JEAN CARLO	0	1	N/A	N/A	0.0083	N/A	N/A	N/A
1280	0	4	RENDON	ANA YURAIMA	0	1	N/A	N/A	0.0046	N/A	N/A	N/A
872	0	01	KWOK  HUNG	NIP	0	7829637	N/A	N/A	0.0648	N/A	N/A	N/A
323	0	PB	CHOCRON	PILAR	0	N/A	N/A	N/A	0.0249	N/A	N/A	N/A
324	0	PB	CHOCRON	PILAR	0	N/A	N/A	N/A	0.0249	N/A	N/A	N/A
325	0	PB	CHOCRON	PILAR	0	N/A	N/A	N/A	0.0249	N/A	N/A	N/A
396	0	5	DE GRATEROL	CARMEN YOLANDA	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
402	0	5	DE RUIBAL FERNANDEZ	AURORA	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
405	0	10	DELGADO VELASQUEZ	HECTOR JOSE	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
443	0	3	EGUI	GUSTAVO	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
557	0	4	GAITAN VILLAMIZAR	OSCAR ORLANDO	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
562	0	5	GARCIA MARCANO	LUISA MERCEDES	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
604	0	8	GONZALEZ	MARIA DEL CARMEN	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
630	0	11	GUTIERREZ	JOSE RAMON	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
640	0	6	HENRIQUEZ LOPEZ	HERNAN	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
641	0	8	HENRIQUEZ LOPEZ	HERNAN	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
767	0	13	JIMENEZ	JANET JULIETA	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
845	0	13	JUAN COLMENARES P.	SUCESION	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
888	0	11	LEON RODRIGUEZ	AMARILIS	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
972	0	2	MAILLO	FRANCISCO	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
981	0	13	MANZO Q,	VICTOR VICENTE	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
1067	0	3	MAS SAEZ	JORGE	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
1070	0	1	MATERAN GUTIERREZ	MARIANO	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
1078	0	2	MEDINA CASTILLO	CEFERINO	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
1079	0	2	MEDINA CASTILLO	CEFERINO	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
1080	0	2	MEDINA CASTILLO	CEFERINO	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
1115	0	8	MORALIAN DE BEDROSIAN	ALICE	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
1174	0	14	ORTIZ DE BURELLI RIVAS	OLGA	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
1190	0	8	PANTALEO	MARIO	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
1214	0	12	PERDOMO MARTINEZ	LUIS ALBERTO	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
1219	0	PB	PIERRE	PANEYKO	0	N/A	N/A	N/A	0.0353	N/A	N/A	N/A
1220	0	PB	PIERRE	PANEYKO	0	N/A	N/A	N/A	0.0353	N/A	N/A	N/A
1228	0	12	PORRAS DE ESCAGEDO	ISABEL	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
1230	0	6	PRIETO CONDE	CARLOS	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
1287	0	3	REYES DE DOS RAMOS	HIRMA	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
1381	0	5	SARCINA ORZA	ANIELLO	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
316	0	10	CEDILLO V.	JOSE J.	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
510	0	7	FEO C	ERNESTO	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
1101	0	1	MIMOSA	LEYLEKIAN	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
1108	0	12	MOLKO LINSEN	RENEE	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A
143	0	16	ANTONIO	PADRINO	0	993-2540	N/A	N/A	0.0089	N/A	N/A	N/A
170	0	11	ARTURO	RONALD	0	753-6514	N/A	N/A	0.0090	N/A	N/A	N/A
179	0	2	AURORA  C.	IGLESIAS  Y  OTRO	0	751-6105; 751-6481	N/A	N/A	0.0062	N/A	N/A	N/A
218	0	9	BLANCA	MACHADO	0	751-9528	N/A	N/A	0.0064	N/A	N/A	N/A
276	0	13	CARLOS ANTONIO	SAAVEDRA	0	753-4751	N/A	N/A	0.0089	N/A	N/A	N/A
288	0	3	CARMEN	PATI�O	0	751-5940	N/A	N/A	0.0089	N/A	N/A	N/A
554	0	8	GABRIELA	GRIMALDI	0	751-6969	N/A	N/A	0.0066	N/A	N/A	N/A
575	0	14	GERSON DANIEL	MORENO RANGEL	0	754-0930	N/A	N/A	0.0090	N/A	N/A	N/A
628	0	15	GUSTAVO  ENRIQUE	SANCHEZ	0	975-9669	N/A	N/A	0.0066	N/A	N/A	N/A
725	0	7	IRENE	PEREZ  SCHAEL	0	864-1007	N/A	N/A	0.0066	N/A	N/A	N/A
813	0	14	JOSE DAVID	AMARGOS  BEHAR	0	267-6343	N/A	N/A	0.0065	N/A	N/A	N/A
1372	0	14	SALVADOR	SANTORO	0	267-6343	N/A	N/A	0.0089	N/A	N/A	N/A
8	0	9	ABRAHAM	QUINTERO	0	751-5973;  862-2447	N/A	N/A	0.0090	N/A	N/A	N/A
38	0	9	ALBERTO	OLIVAREZ	0	261-3439	N/A	N/A	0.0089	N/A	N/A	N/A
42	0	5	ALBERTO  NINO	GABIDIO	0	753-9885	N/A	N/A	0.0090	N/A	N/A	N/A
60	0	9	ALESIA   DE	VINCENZO  STARITA	0	753-5764;  OFIC:  577-3218	N/A	N/A	0.0089	N/A	N/A	N/A
63	0	15	ALEXANDRA	LATUFF	0	751-9283	N/A	N/A	0.0089	N/A	N/A	N/A
345	0	8	CIMA AVILA 23, C.A.	INVERSIONES	0	115	N/A	N/A	0.0084	N/A	N/A	N/A
346	0	8	CIMA AVILA 23, C.A.	INVERSIONES	0	114	N/A	N/A	0.0127	N/A	N/A	N/A
863	0	6	JUTRO, C.A.	INVERSIONES	0	64	N/A	N/A	0.0098	N/A	N/A	N/A
871	0	7	KOPEC 59600, C. A.	INVERSIONES	0	79	N/A	N/A	0.0185	N/A	N/A	N/A
1082	0	2	MENDEZ	BEATRIS	0	82	N/A	N/A	0.0085	N/A	N/A	N/A
1118	0	5	MOSTAR, C.A.	INVERSIONES	0	2	N/A	N/A	0.0083	N/A	N/A	N/A
1368	0	5	SALAZAR M.	ADRIANA ISABEL	0	88	N/A	N/A	0.0085	N/A	N/A	N/A
1416	0	3	STAR 7 C.A.	INVERSIONES	0	84	N/A	N/A	0.0085	N/A	N/A	N/A
33	0	6	ALBEA	DARIAS  DE  RAMIREZ	0	753-6847	N/A	N/A	0.0090	N/A	N/A	N/A
41	0	13	ALBERTO  JOSE	JESURUM  ARELLANO	0	751-0305	N/A	N/A	0.0090	N/A	N/A	N/A
62	0	8	ALEXANDER	PI�A	0	751-7358	N/A	N/A	0.0089	N/A	N/A	N/A
72	0	7	ALFREDO	MARANDO  FALCIGLIA	0	753-5407	N/A	N/A	0.0090	N/A	N/A	N/A
73	0	12	ALFREDO	MARANDO  FALCIGLIA	0	751-7520	N/A	N/A	0.0089	N/A	N/A	N/A
653	0	8	HOMERO R.	ORTIZ	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
685	0	12	INES COVA	DE SOLOWJOV	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
745	0	6	JAIME	PRATS CONDE	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
759	0	9	JESUS	PARDO DURAN	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
791	0	3	JOSE	MIJARES PENA	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
812	0	PB	JOSE CARLOS	MARQUEZ FERREIRA	0	N/A	N/A	N/A	0.0204	N/A	N/A	N/A
832	0	5	JUAN	MORA	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
862	0	9	JULIO E. GONZALEZ	FRANCISCO J. GONZALEZ/	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
870	0	1	KOCI	JAKIN	0	N/A	N/A	N/A	0.0100	N/A	N/A	N/A
906	0	8	LILA JOSEFINA	SISIRUCA RODRIGUEZ	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
908	0	6	LILIANA DEL VALLE	ROMERO ALBARRAN	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
913	0	1	LIZARDO	GOMEZ REINOSO	0	N/A	N/A	N/A	0.0093	N/A	N/A	N/A
914	0	2	LIZARDO	GOMEZ REINOSO	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
918	0	1	LORENA J.	D''JESUS SANCHEZ	0	N/A	N/A	N/A	0.0093	N/A	N/A	N/A
961	0	8	LUISA J.FRIAS	ARGIMIRO R. FRIAS/	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
1009	0	9	MARIA ALBA	DE SORIA	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
1014	0	8	MARIA CELMAR	PARRA CASTILLO	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
1046	0	3	MARIO	DI LEONARDO DI PRIETO	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
1168	0	4	OMAIRA	MORENO Z.	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
1169	0	5	OMAIRA C	GASPERI	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
1213	0	6	PENELOPE LUCIA	PERALDO PUENTE	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
1246	0	2	RAFAEL OVIEDO	MARIA ROJAS/	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
574	0	1	GERONIMO	CALDERON	0	N/A	N/A	N/A	0.0100	N/A	N/A	N/A
977	0	5	MANUEL	LOPEZ LOPEZ	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A
\.


--
-- TOC entry 2463 (class 0 OID 0)
-- Dependencies: 216
-- Name: cd_propietarios_cd_propietarios_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cd_propietarios_cd_propietarios_pk_seq', 1549, true);


--
-- TOC entry 2416 (class 0 OID 79342)
-- Dependencies: 204
-- Data for Name: cd_proveedores; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cd_proveedores (cd_proveedores_pk, razon_social, beneficiario) FROM stdin;
\.


--
-- TOC entry 2464 (class 0 OID 0)
-- Dependencies: 205
-- Name: cd_proveedores_cd_proveedores_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cd_proveedores_cd_proveedores_pk_seq', 1, false);


--
-- TOC entry 2418 (class 0 OID 79347)
-- Dependencies: 206
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: -
--

COPY menu (id, name, parent, route, "order", data) FROM stdin;
\.


--
-- TOC entry 2465 (class 0 OID 0)
-- Dependencies: 207
-- Name: menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('menu_id_seq', 1, false);


--
-- TOC entry 2420 (class 0 OID 79355)
-- Dependencies: 208
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
-- TOC entry 2421 (class 0 OID 79358)
-- Dependencies: 209
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
-- TOC entry 2466 (class 0 OID 0)
-- Dependencies: 210
-- Name: operaciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('operaciones_id_seq', 26, true);


--
-- TOC entry 2423 (class 0 OID 79363)
-- Dependencies: 211
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY roles (id, nombre) FROM stdin;
2	Administrador
3	Usuario Estandar
1	Super Usuario
\.


--
-- TOC entry 2467 (class 0 OID 0)
-- Dependencies: 212
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('roles_id_seq', 7, true);


--
-- TOC entry 2425 (class 0 OID 79368)
-- Dependencies: 213
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
-- TOC entry 2426 (class 0 OID 79371)
-- Dependencies: 214
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "user" (id, username, auth_key, password_hash, password_reset_token, email, status, created_at, updated_at, rol_id) FROM stdin;
2	Humberto Benedito	YNpx8aveIJnohs2qt4gf-UJwLvcpjPam	$2y$13$F2Urt6u9zeZXi8WC6NXhxeR0Swaeqx5.OlennesqM6KjpuIh1Rs0C	\N	humbertobenedito@gmail.com	1	1464703400	1467295621	2
1	admin	moFHYdX57cwdFURVeuNNxTj_W7TY0JmZ	$2y$13$rulmew34igPPxmnnZpmJ1.qDIMHa.X5d39ZuMA6/CReoHAt7RY5hu	\N	admin@admin.com	1	1464620742	1467340244	1
\.


--
-- TOC entry 2468 (class 0 OID 0)
-- Dependencies: 215
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('user_id_seq', 4, true);


--
-- TOC entry 2222 (class 2606 OID 79398)
-- Name: cd_aguas_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_aguas
    ADD CONSTRAINT cd_aguas_pk PRIMARY KEY (cd_aguas_pk);


--
-- TOC entry 2224 (class 2606 OID 79602)
-- Name: cd_aptos_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_aptos
    ADD CONSTRAINT cd_aptos_pk PRIMARY KEY (cd_aptos_pk, cod_edificio);


--
-- TOC entry 2226 (class 2606 OID 79402)
-- Name: cd_chequeras_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_chequeras
    ADD CONSTRAINT cd_chequeras_pk PRIMARY KEY (cd_chequeras_pk);


--
-- TOC entry 2228 (class 2606 OID 79404)
-- Name: cd_conceptos_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_conceptos
    ADD CONSTRAINT cd_conceptos_pk PRIMARY KEY (cd_conceptos_pk);


--
-- TOC entry 2230 (class 2606 OID 79406)
-- Name: cd_conjuntos_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_conjuntos
    ADD CONSTRAINT cd_conjuntos_pk PRIMARY KEY (cd_conjuntos_pk);


--
-- TOC entry 2232 (class 2606 OID 79408)
-- Name: cd_deudas_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_deudas
    ADD CONSTRAINT cd_deudas_pk PRIMARY KEY (cd_deudas_pk);


--
-- TOC entry 2234 (class 2606 OID 79410)
-- Name: cd_edificios_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_edificios
    ADD CONSTRAINT cd_edificios_pk PRIMARY KEY (cd_edificios_pk);


--
-- TOC entry 2236 (class 2606 OID 79412)
-- Name: cd_fondos_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_fondos
    ADD CONSTRAINT cd_fondos_pk PRIMARY KEY (cd_fondos_pk);


--
-- TOC entry 2238 (class 2606 OID 79414)
-- Name: cd_historicos_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_historicos
    ADD CONSTRAINT cd_historicos_pk PRIMARY KEY (cd_historicos_pk);


--
-- TOC entry 2240 (class 2606 OID 79416)
-- Name: cd_mantenimientos_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_mantenimientos
    ADD CONSTRAINT cd_mantenimientos_pk PRIMARY KEY (cd_mantenimientos_pk);


--
-- TOC entry 2242 (class 2606 OID 79418)
-- Name: cd_mov_chequeras_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_mov_chequeras
    ADD CONSTRAINT cd_mov_chequeras_pk PRIMARY KEY (cd_mov_chequeras_pk);


--
-- TOC entry 2244 (class 2606 OID 79420)
-- Name: cd_mov_mes_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_mov_mes
    ADD CONSTRAINT cd_mov_mes_pk PRIMARY KEY (cd_mov_mes_pk);


--
-- TOC entry 2246 (class 2606 OID 79422)
-- Name: cd_observaciones_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_observaciones
    ADD CONSTRAINT cd_observaciones_pk PRIMARY KEY (cd_observaciones_pk);


--
-- TOC entry 2262 (class 2606 OID 79665)
-- Name: cd_propietarios_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_propietarios
    ADD CONSTRAINT cd_propietarios_pk PRIMARY KEY (cd_propietarios_pk);


--
-- TOC entry 2248 (class 2606 OID 79426)
-- Name: cd_proveedores_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_proveedores
    ADD CONSTRAINT cd_proveedores_pk PRIMARY KEY (cd_proveedores_pk);


--
-- TOC entry 2250 (class 2606 OID 79428)
-- Name: menu_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (id);


--
-- TOC entry 2252 (class 2606 OID 79430)
-- Name: migration_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migration
    ADD CONSTRAINT migration_pkey PRIMARY KEY (version);


--
-- TOC entry 2254 (class 2606 OID 79432)
-- Name: operaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY operaciones
    ADD CONSTRAINT operaciones_pkey PRIMARY KEY (id);


--
-- TOC entry 2258 (class 2606 OID 79434)
-- Name: roles_operaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY roles_operaciones
    ADD CONSTRAINT roles_operaciones_pkey PRIMARY KEY (rol_id, operacion_id);


--
-- TOC entry 2256 (class 2606 OID 79436)
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 2260 (class 2606 OID 79438)
-- Name: user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 2271 (class 2606 OID 79459)
-- Name: cd_conceptos_cd_mov_chequeras_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_mov_chequeras
    ADD CONSTRAINT cd_conceptos_cd_mov_chequeras_fk FOREIGN KEY (cod_concepto) REFERENCES cd_conceptos(cd_conceptos_pk);


--
-- TOC entry 2273 (class 2606 OID 79464)
-- Name: cd_conceptos_cd_mov_mes_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_mov_mes
    ADD CONSTRAINT cd_conceptos_cd_mov_mes_fk FOREIGN KEY (cod_concepto) REFERENCES cd_conceptos(cd_conceptos_pk);


--
-- TOC entry 2263 (class 2606 OID 79469)
-- Name: cd_conjuntos_cd_aguas_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_aguas
    ADD CONSTRAINT cd_conjuntos_cd_aguas_fk FOREIGN KEY (cod_conjunto) REFERENCES cd_conjuntos(cd_conjuntos_pk) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2264 (class 2606 OID 79474)
-- Name: cd_conjuntos_cd_chequeras_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_chequeras
    ADD CONSTRAINT cd_conjuntos_cd_chequeras_fk FOREIGN KEY (cod_conjunto) REFERENCES cd_conjuntos(cd_conjuntos_pk) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2265 (class 2606 OID 79479)
-- Name: cd_conjuntos_cd_deudas_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_deudas
    ADD CONSTRAINT cd_conjuntos_cd_deudas_fk FOREIGN KEY (cod_conjunto) REFERENCES cd_conjuntos(cd_conjuntos_pk) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2266 (class 2606 OID 79484)
-- Name: cd_conjuntos_cd_edificios_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_edificios
    ADD CONSTRAINT cd_conjuntos_cd_edificios_fk FOREIGN KEY (cod_conjunto) REFERENCES cd_conjuntos(cd_conjuntos_pk) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2267 (class 2606 OID 79489)
-- Name: cd_conjuntos_cd_fondos_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_fondos
    ADD CONSTRAINT cd_conjuntos_cd_fondos_fk FOREIGN KEY (cod_conjunto) REFERENCES cd_conjuntos(cd_conjuntos_pk) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2268 (class 2606 OID 79494)
-- Name: cd_conjuntos_cd_historicos_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_historicos
    ADD CONSTRAINT cd_conjuntos_cd_historicos_fk FOREIGN KEY (cod_conjunto) REFERENCES cd_conjuntos(cd_conjuntos_pk) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2274 (class 2606 OID 79499)
-- Name: cd_conjuntos_cd_mov_mes_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_mov_mes
    ADD CONSTRAINT cd_conjuntos_cd_mov_mes_fk FOREIGN KEY (cod_conjunto) REFERENCES cd_conjuntos(cd_conjuntos_pk);


--
-- TOC entry 2269 (class 2606 OID 79504)
-- Name: cd_deudas_cd_historicos_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_historicos
    ADD CONSTRAINT cd_deudas_cd_historicos_fk FOREIGN KEY (cod_deuda) REFERENCES cd_deudas(cd_deudas_pk);


--
-- TOC entry 2270 (class 2606 OID 79509)
-- Name: cd_observaciones_cd_historicos_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_historicos
    ADD CONSTRAINT cd_observaciones_cd_historicos_fk FOREIGN KEY (cod_observacion) REFERENCES cd_observaciones(cd_observaciones_pk);


--
-- TOC entry 2272 (class 2606 OID 79514)
-- Name: cd_proveedores_cd_mov_chequeras_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cd_mov_chequeras
    ADD CONSTRAINT cd_proveedores_cd_mov_chequeras_fk FOREIGN KEY (cod_proveedor) REFERENCES cd_proveedores(cd_proveedores_pk);


--
-- TOC entry 2275 (class 2606 OID 79519)
-- Name: menu_parent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY menu
    ADD CONSTRAINT menu_parent_fkey FOREIGN KEY (parent) REFERENCES menu(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 2276 (class 2606 OID 79524)
-- Name: roles_operaciones_operaciones_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY roles_operaciones
    ADD CONSTRAINT roles_operaciones_operaciones_fkey FOREIGN KEY (operacion_id) REFERENCES operaciones(id) ON DELETE CASCADE;


--
-- TOC entry 2277 (class 2606 OID 79529)
-- Name: roles_operaciones_roles_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY roles_operaciones
    ADD CONSTRAINT roles_operaciones_roles_fkey FOREIGN KEY (rol_id) REFERENCES roles(id) ON DELETE CASCADE;


--
-- TOC entry 2278 (class 2606 OID 79534)
-- Name: roles_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT roles_user_fkey FOREIGN KEY (rol_id) REFERENCES roles(id);


-- Completed on 2016-07-04 19:15:27 VET

--
-- PostgreSQL database dump complete
--

