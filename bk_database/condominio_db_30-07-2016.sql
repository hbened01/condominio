--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.3
-- Dumped by pg_dump version 9.5.3

-- Started on 2016-07-30 21:20:52 VET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12433)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2560 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 19982)
-- Name: cd_aguas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cd_aguas (
    cd_aguas_pk smallint NOT NULL,
    cod_apto character varying(3) NOT NULL,
    cod_conjunto smallint NOT NULL,
    cod_edificio smallint NOT NULL,
    lect_ant numeric NOT NULL,
    lect_post numeric NOT NULL
);


ALTER TABLE cd_aguas OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 19988)
-- Name: cd_aguas_cd_aguas_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cd_aguas_cd_aguas_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cd_aguas_cd_aguas_pk_seq OWNER TO postgres;

--
-- TOC entry 2561 (class 0 OID 0)
-- Dependencies: 182
-- Name: cd_aguas_cd_aguas_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cd_aguas_cd_aguas_pk_seq OWNED BY cd_aguas.cd_aguas_pk;


--
-- TOC entry 183 (class 1259 OID 19990)
-- Name: cd_aptos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cd_aptos (
    cd_aptos_pk character varying(3) NOT NULL,
    cod_propietario smallint NOT NULL,
    cod_edificio smallint NOT NULL
);


ALTER TABLE cd_aptos OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 19993)
-- Name: cd_chequeras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cd_chequeras (
    cd_chequeras_pk smallint NOT NULL,
    cod_conjunto smallint NOT NULL,
    cod_edificio smallint NOT NULL,
    nro_cuenta character varying(20) NOT NULL,
    monto numeric(10,4) NOT NULL,
    saldo numeric(10,4) NOT NULL
);


ALTER TABLE cd_chequeras OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 19996)
-- Name: cd_chequeras_cd_chequeras_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cd_chequeras_cd_chequeras_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cd_chequeras_cd_chequeras_pk_seq OWNER TO postgres;

--
-- TOC entry 2562 (class 0 OID 0)
-- Dependencies: 185
-- Name: cd_chequeras_cd_chequeras_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cd_chequeras_cd_chequeras_pk_seq OWNED BY cd_chequeras.cd_chequeras_pk;


--
-- TOC entry 186 (class 1259 OID 19998)
-- Name: cd_conceptos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cd_conceptos (
    cd_conceptos_pk smallint NOT NULL,
    descrip_concepto character varying(100) NOT NULL,
    tipo character varying(1) NOT NULL,
    frecuencia integer NOT NULL
);


ALTER TABLE cd_conceptos OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 20001)
-- Name: cd_conceptos_cd_conceptos_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cd_conceptos_cd_conceptos_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cd_conceptos_cd_conceptos_pk_seq OWNER TO postgres;

--
-- TOC entry 2563 (class 0 OID 0)
-- Dependencies: 187
-- Name: cd_conceptos_cd_conceptos_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cd_conceptos_cd_conceptos_pk_seq OWNED BY cd_conceptos.cd_conceptos_pk;


--
-- TOC entry 188 (class 1259 OID 20003)
-- Name: cd_conjuntos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cd_conjuntos (
    cd_conjuntos_pk smallint NOT NULL,
    nombre character varying(50) NOT NULL,
    direccion character varying(150) NOT NULL
);


ALTER TABLE cd_conjuntos OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 20006)
-- Name: cd_conjuntos_cd_conjuntos_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cd_conjuntos_cd_conjuntos_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cd_conjuntos_cd_conjuntos_pk_seq OWNER TO postgres;

--
-- TOC entry 2564 (class 0 OID 0)
-- Dependencies: 189
-- Name: cd_conjuntos_cd_conjuntos_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cd_conjuntos_cd_conjuntos_pk_seq OWNED BY cd_conjuntos.cd_conjuntos_pk;


--
-- TOC entry 190 (class 1259 OID 20008)
-- Name: cd_deudas; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE cd_deudas OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 20011)
-- Name: cd_deudas_cd_deudas_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cd_deudas_cd_deudas_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cd_deudas_cd_deudas_pk_seq OWNER TO postgres;

--
-- TOC entry 2565 (class 0 OID 0)
-- Dependencies: 191
-- Name: cd_deudas_cd_deudas_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cd_deudas_cd_deudas_pk_seq OWNED BY cd_deudas.cd_deudas_pk;


--
-- TOC entry 192 (class 1259 OID 20013)
-- Name: cd_edificios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cd_edificios (
    cd_edificios_pk smallint NOT NULL,
    cod_conjunto smallint NOT NULL,
    nombre_edificio character varying(100) DEFAULT 'N/A'::character varying NOT NULL,
    nombre_concerje character varying(100) DEFAULT 'N/A'::character varying NOT NULL,
    telf_concerje numeric(11,0) DEFAULT 0 NOT NULL,
    porcentaje_nro1 numeric(10,4) DEFAULT 0 NOT NULL,
    email_edificio character varying(256) DEFAULT 'N/A'::character varying,
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


ALTER TABLE cd_edificios OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 20034)
-- Name: cd_edificios_cd_edificios_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cd_edificios_cd_edificios_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cd_edificios_cd_edificios_pk_seq OWNER TO postgres;

--
-- TOC entry 2566 (class 0 OID 0)
-- Dependencies: 193
-- Name: cd_edificios_cd_edificios_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cd_edificios_cd_edificios_pk_seq OWNED BY cd_edificios.cd_edificios_pk;


--
-- TOC entry 194 (class 1259 OID 20036)
-- Name: cd_fondos; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE cd_fondos OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 20039)
-- Name: cd_fondos_cd_fondos_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cd_fondos_cd_fondos_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cd_fondos_cd_fondos_pk_seq OWNER TO postgres;

--
-- TOC entry 2567 (class 0 OID 0)
-- Dependencies: 195
-- Name: cd_fondos_cd_fondos_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cd_fondos_cd_fondos_pk_seq OWNED BY cd_fondos.cd_fondos_pk;


--
-- TOC entry 196 (class 1259 OID 20041)
-- Name: cd_historicos; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE cd_historicos OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 20044)
-- Name: cd_historicos_cd_historicos_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cd_historicos_cd_historicos_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cd_historicos_cd_historicos_pk_seq OWNER TO postgres;

--
-- TOC entry 2568 (class 0 OID 0)
-- Dependencies: 197
-- Name: cd_historicos_cd_historicos_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cd_historicos_cd_historicos_pk_seq OWNED BY cd_historicos.cd_historicos_pk;


--
-- TOC entry 198 (class 1259 OID 20046)
-- Name: cd_mantenimientos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cd_mantenimientos (
    cd_mantenimientos_pk smallint NOT NULL,
    correlativo real NOT NULL
);


ALTER TABLE cd_mantenimientos OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 20049)
-- Name: cd_mantenimientos_cd_mantenimientos_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cd_mantenimientos_cd_mantenimientos_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cd_mantenimientos_cd_mantenimientos_pk_seq OWNER TO postgres;

--
-- TOC entry 2569 (class 0 OID 0)
-- Dependencies: 199
-- Name: cd_mantenimientos_cd_mantenimientos_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cd_mantenimientos_cd_mantenimientos_pk_seq OWNED BY cd_mantenimientos.cd_mantenimientos_pk;


--
-- TOC entry 200 (class 1259 OID 20051)
-- Name: cd_mov_chequeras; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE cd_mov_chequeras OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 20057)
-- Name: cd_mov_mes; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE cd_mov_mes OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 20060)
-- Name: cd_observaciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cd_observaciones (
    cd_observaciones_pk smallint NOT NULL,
    descripcion character varying(300) NOT NULL
);


ALTER TABLE cd_observaciones OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 20063)
-- Name: cd_observaciones_cd_observaciones_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cd_observaciones_cd_observaciones_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cd_observaciones_cd_observaciones_pk_seq OWNER TO postgres;

--
-- TOC entry 2570 (class 0 OID 0)
-- Dependencies: 203
-- Name: cd_observaciones_cd_observaciones_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cd_observaciones_cd_observaciones_pk_seq OWNED BY cd_observaciones.cd_observaciones_pk;


--
-- TOC entry 204 (class 1259 OID 20065)
-- Name: cd_pagos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cd_pagos (
    cd_pago_pk smallint NOT NULL,
    cod_edificio smallint NOT NULL,
    cod_apto character varying(3) NOT NULL,
    cod_factura smallint NOT NULL,
    cod_tipo_pago smallint NOT NULL,
    nro_transferencia_referencia numeric(50,0) NOT NULL,
    fecha_pago date NOT NULL,
    nota_descrip_pago character varying(500),
    nombre character varying(30) NOT NULL,
    apellido character varying(30) NOT NULL,
    nro_cedula numeric(10,0) NOT NULL,
    cod_tipo_doc smallint NOT NULL,
    email character varying(255) NOT NULL,
    estatus_pago boolean DEFAULT false NOT NULL
);


ALTER TABLE cd_pagos OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 20072)
-- Name: cd_pagos_cd_pago_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cd_pagos_cd_pago_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cd_pagos_cd_pago_pk_seq OWNER TO postgres;

--
-- TOC entry 2571 (class 0 OID 0)
-- Dependencies: 205
-- Name: cd_pagos_cd_pago_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cd_pagos_cd_pago_pk_seq OWNED BY cd_pagos.cd_pago_pk;


--
-- TOC entry 206 (class 1259 OID 20074)
-- Name: cd_propietarios; Type: TABLE; Schema: public; Owner: postgres
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
    email character varying(256) DEFAULT 'N/A'::character varying,
    alicuota numeric(10,4) DEFAULT 0,
    quien_vive character varying(25) DEFAULT 'N/A'::character varying,
    direccion character varying(150) DEFAULT 'N/A'::character varying,
    direccion_cobro character varying(150) DEFAULT 'N/A'::character varying,
    update_usr boolean DEFAULT true NOT NULL
);


ALTER TABLE cd_propietarios OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 20093)
-- Name: cd_propietarios_cd_propietarios_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cd_propietarios_cd_propietarios_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cd_propietarios_cd_propietarios_pk_seq OWNER TO postgres;

--
-- TOC entry 2572 (class 0 OID 0)
-- Dependencies: 207
-- Name: cd_propietarios_cd_propietarios_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cd_propietarios_cd_propietarios_pk_seq OWNED BY cd_propietarios.cd_propietarios_pk;


--
-- TOC entry 208 (class 1259 OID 20095)
-- Name: cd_proveedores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cd_proveedores (
    cd_proveedores_pk smallint NOT NULL,
    razon_social character varying(35) NOT NULL,
    beneficiario character varying(35) NOT NULL
);


ALTER TABLE cd_proveedores OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 20098)
-- Name: cd_proveedores_cd_proveedores_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cd_proveedores_cd_proveedores_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cd_proveedores_cd_proveedores_pk_seq OWNER TO postgres;

--
-- TOC entry 2573 (class 0 OID 0)
-- Dependencies: 209
-- Name: cd_proveedores_cd_proveedores_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cd_proveedores_cd_proveedores_pk_seq OWNED BY cd_proveedores.cd_proveedores_pk;


--
-- TOC entry 210 (class 1259 OID 20100)
-- Name: cd_tipos_docs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cd_tipos_docs (
    cd_tipo_doc_pk smallint NOT NULL,
    tipo_doc character varying(1) NOT NULL,
    descrip_doc character varying(25) NOT NULL
);


ALTER TABLE cd_tipos_docs OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 20103)
-- Name: cd_tipos_docs_cd_tipo_doc_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cd_tipos_docs_cd_tipo_doc_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cd_tipos_docs_cd_tipo_doc_pk_seq OWNER TO postgres;

--
-- TOC entry 2574 (class 0 OID 0)
-- Dependencies: 211
-- Name: cd_tipos_docs_cd_tipo_doc_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cd_tipos_docs_cd_tipo_doc_pk_seq OWNED BY cd_tipos_docs.cd_tipo_doc_pk;


--
-- TOC entry 212 (class 1259 OID 20105)
-- Name: cd_tipos_pagos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cd_tipos_pagos (
    cd_tipo_pago_pk integer NOT NULL,
    descrip_pago character varying(255) NOT NULL
);


ALTER TABLE cd_tipos_pagos OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 20108)
-- Name: cd_tipos_pagos_cd_tipo_pago_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cd_tipos_pagos_cd_tipo_pago_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cd_tipos_pagos_cd_tipo_pago_pk_seq OWNER TO postgres;

--
-- TOC entry 2575 (class 0 OID 0)
-- Dependencies: 213
-- Name: cd_tipos_pagos_cd_tipo_pago_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cd_tipos_pagos_cd_tipo_pago_pk_seq OWNED BY cd_tipos_pagos.cd_tipo_pago_pk;


--
-- TOC entry 214 (class 1259 OID 20110)
-- Name: facturas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE facturas (
    cd_factura_pk smallint NOT NULL,
    cod_apto character varying(3) NOT NULL,
    edificio character varying(250) NOT NULL,
    nombre character varying(100) NOT NULL,
    apellido character varying(100) NOT NULL,
    alicuota numeric NOT NULL,
    nr numeric NOT NULL,
    fecha character varying(30) NOT NULL,
    total_gastos_mes numeric NOT NULL,
    sub_total_alicuota numeric NOT NULL,
    total_pagar_mes numeric NOT NULL,
    deuda_actual numeric NOT NULL,
    recibos smallint,
    estatus_factura boolean DEFAULT false
);


ALTER TABLE facturas OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 20116)
-- Name: facturas_cd_factura_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE facturas_cd_factura_pk_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE facturas_cd_factura_pk_seq OWNER TO postgres;

--
-- TOC entry 2576 (class 0 OID 0)
-- Dependencies: 215
-- Name: facturas_cd_factura_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE facturas_cd_factura_pk_seq OWNED BY facturas.cd_factura_pk;


--
-- TOC entry 216 (class 1259 OID 20118)
-- Name: facturas_gastos_comunes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE facturas_gastos_comunes (
    cod_gasto_comun_fk smallint NOT NULL,
    cod_factura_fk smallint NOT NULL
);


ALTER TABLE facturas_gastos_comunes OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 20121)
-- Name: fondos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE fondos (
    cd_fondo_pk smallint NOT NULL,
    cod_factura_fk smallint NOT NULL,
    descripcion character varying(250) NOT NULL,
    saldo_anterior numeric DEFAULT 0 NOT NULL,
    cota_mes numeric DEFAULT 0 NOT NULL,
    cargo numeric DEFAULT 0 NOT NULL,
    saldo_actual numeric DEFAULT 0 NOT NULL
);


ALTER TABLE fondos OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 20131)
-- Name: fondos_cd_fondo_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE fondos_cd_fondo_pk_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE fondos_cd_fondo_pk_seq OWNER TO postgres;

--
-- TOC entry 2577 (class 0 OID 0)
-- Dependencies: 218
-- Name: fondos_cd_fondo_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE fondos_cd_fondo_pk_seq OWNED BY fondos.cd_fondo_pk;


--
-- TOC entry 219 (class 1259 OID 20133)
-- Name: gastos_comunes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE gastos_comunes (
    cd_gasto_comun_pk smallint NOT NULL,
    descripcion character varying(250) NOT NULL,
    monto numeric NOT NULL
);


ALTER TABLE gastos_comunes OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 20139)
-- Name: gastos_comunes_cd_gasto_comun_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE gastos_comunes_cd_gasto_comun_pk_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE gastos_comunes_cd_gasto_comun_pk_seq OWNER TO postgres;

--
-- TOC entry 2578 (class 0 OID 0)
-- Dependencies: 220
-- Name: gastos_comunes_cd_gasto_comun_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE gastos_comunes_cd_gasto_comun_pk_seq OWNED BY gastos_comunes.cd_gasto_comun_pk;


--
-- TOC entry 221 (class 1259 OID 20141)
-- Name: gastos_nocomunes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE gastos_nocomunes (
    cd_gasto_nocomun_pk smallint NOT NULL,
    cod_factura_fk smallint NOT NULL,
    descripcion character varying(250) NOT NULL,
    monto numeric NOT NULL
);


ALTER TABLE gastos_nocomunes OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 20147)
-- Name: gastos_nocomunes_cd_gasto_nocomun_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE gastos_nocomunes_cd_gasto_nocomun_pk_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE gastos_nocomunes_cd_gasto_nocomun_pk_seq OWNER TO postgres;

--
-- TOC entry 2579 (class 0 OID 0)
-- Dependencies: 222
-- Name: gastos_nocomunes_cd_gasto_nocomun_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE gastos_nocomunes_cd_gasto_nocomun_pk_seq OWNED BY gastos_nocomunes.cd_gasto_nocomun_pk;


--
-- TOC entry 234 (class 1259 OID 20427)
-- Name: mensajes; Type: TABLE; Schema: public; Owner: hjtecnos
--

CREATE TABLE mensajes (
    cd_mensajes_pk smallint NOT NULL,
    texto text NOT NULL,
    msn_default boolean DEFAULT false
);


ALTER TABLE mensajes OWNER TO hjtecnos;

--
-- TOC entry 233 (class 1259 OID 20425)
-- Name: mensajes_cd_mensajes_pk_seq; Type: SEQUENCE; Schema: public; Owner: hjtecnos
--

CREATE SEQUENCE mensajes_cd_mensajes_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mensajes_cd_mensajes_pk_seq OWNER TO hjtecnos;

--
-- TOC entry 2580 (class 0 OID 0)
-- Dependencies: 233
-- Name: mensajes_cd_mensajes_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hjtecnos
--

ALTER SEQUENCE mensajes_cd_mensajes_pk_seq OWNED BY mensajes.cd_mensajes_pk;


--
-- TOC entry 223 (class 1259 OID 20149)
-- Name: menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE menu (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    parent integer,
    route character varying(255),
    "order" integer,
    data bytea
);


ALTER TABLE menu OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 20155)
-- Name: menu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE menu_id_seq OWNER TO postgres;

--
-- TOC entry 2581 (class 0 OID 0)
-- Dependencies: 224
-- Name: menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE menu_id_seq OWNED BY menu.id;


--
-- TOC entry 225 (class 1259 OID 20157)
-- Name: migration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE migration (
    version character varying(180) NOT NULL,
    apply_time integer
);


ALTER TABLE migration OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 20160)
-- Name: operaciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE operaciones (
    id integer NOT NULL,
    nombre character varying(64) NOT NULL,
    descripcion character varying(255)
);


ALTER TABLE operaciones OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 20163)
-- Name: operaciones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE operaciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE operaciones_id_seq OWNER TO postgres;

--
-- TOC entry 2582 (class 0 OID 0)
-- Dependencies: 227
-- Name: operaciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE operaciones_id_seq OWNED BY operaciones.id;


--
-- TOC entry 228 (class 1259 OID 20165)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE roles (
    id integer NOT NULL,
    nombre character varying(32) NOT NULL
);


ALTER TABLE roles OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 20168)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE roles_id_seq OWNER TO postgres;

--
-- TOC entry 2583 (class 0 OID 0)
-- Dependencies: 229
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- TOC entry 230 (class 1259 OID 20170)
-- Name: roles_operaciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE roles_operaciones (
    rol_id integer NOT NULL,
    operacion_id integer NOT NULL
);


ALTER TABLE roles_operaciones OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 20173)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "user" (
    id integer NOT NULL,
    username character varying(32) NOT NULL,
    auth_key character varying(32) NOT NULL,
    password_hash character varying(256) NOT NULL,
    password_reset_token character varying(256),
    email character varying(256) NOT NULL,
    status integer DEFAULT 1 NOT NULL,
    created_at integer NOT NULL,
    updated_at integer NOT NULL,
    rol_id integer
);


ALTER TABLE "user" OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 20180)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_id_seq OWNER TO postgres;

--
-- TOC entry 2584 (class 0 OID 0)
-- Dependencies: 232
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_id_seq OWNED BY "user".id;


--
-- TOC entry 2232 (class 2604 OID 20182)
-- Name: cd_aguas_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cd_aguas ALTER COLUMN cd_aguas_pk SET DEFAULT nextval('cd_aguas_cd_aguas_pk_seq'::regclass);


--
-- TOC entry 2233 (class 2604 OID 20183)
-- Name: cd_chequeras_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cd_chequeras ALTER COLUMN cd_chequeras_pk SET DEFAULT nextval('cd_chequeras_cd_chequeras_pk_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 20184)
-- Name: cd_conceptos_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cd_conceptos ALTER COLUMN cd_conceptos_pk SET DEFAULT nextval('cd_conceptos_cd_conceptos_pk_seq'::regclass);


--
-- TOC entry 2235 (class 2604 OID 20185)
-- Name: cd_conjuntos_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cd_conjuntos ALTER COLUMN cd_conjuntos_pk SET DEFAULT nextval('cd_conjuntos_cd_conjuntos_pk_seq'::regclass);


--
-- TOC entry 2236 (class 2604 OID 20186)
-- Name: cd_deudas_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cd_deudas ALTER COLUMN cd_deudas_pk SET DEFAULT nextval('cd_deudas_cd_deudas_pk_seq'::regclass);


--
-- TOC entry 2252 (class 2604 OID 20187)
-- Name: cd_edificios_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cd_edificios ALTER COLUMN cd_edificios_pk SET DEFAULT nextval('cd_edificios_cd_edificios_pk_seq'::regclass);


--
-- TOC entry 2253 (class 2604 OID 20188)
-- Name: cd_fondos_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cd_fondos ALTER COLUMN cd_fondos_pk SET DEFAULT nextval('cd_fondos_cd_fondos_pk_seq'::regclass);


--
-- TOC entry 2254 (class 2604 OID 20189)
-- Name: cd_historicos_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cd_historicos ALTER COLUMN cd_historicos_pk SET DEFAULT nextval('cd_historicos_cd_historicos_pk_seq'::regclass);


--
-- TOC entry 2255 (class 2604 OID 20190)
-- Name: cd_mantenimientos_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cd_mantenimientos ALTER COLUMN cd_mantenimientos_pk SET DEFAULT nextval('cd_mantenimientos_cd_mantenimientos_pk_seq'::regclass);


--
-- TOC entry 2259 (class 2604 OID 20191)
-- Name: cd_observaciones_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cd_observaciones ALTER COLUMN cd_observaciones_pk SET DEFAULT nextval('cd_observaciones_cd_observaciones_pk_seq'::regclass);


--
-- TOC entry 2261 (class 2604 OID 20192)
-- Name: cd_pago_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cd_pagos ALTER COLUMN cd_pago_pk SET DEFAULT nextval('cd_pagos_cd_pago_pk_seq'::regclass);


--
-- TOC entry 2275 (class 2604 OID 20193)
-- Name: cd_propietarios_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cd_propietarios ALTER COLUMN cd_propietarios_pk SET DEFAULT nextval('cd_propietarios_cd_propietarios_pk_seq'::regclass);


--
-- TOC entry 2276 (class 2604 OID 20194)
-- Name: cd_proveedores_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cd_proveedores ALTER COLUMN cd_proveedores_pk SET DEFAULT nextval('cd_proveedores_cd_proveedores_pk_seq'::regclass);


--
-- TOC entry 2277 (class 2604 OID 20195)
-- Name: cd_tipo_doc_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cd_tipos_docs ALTER COLUMN cd_tipo_doc_pk SET DEFAULT nextval('cd_tipos_docs_cd_tipo_doc_pk_seq'::regclass);


--
-- TOC entry 2278 (class 2604 OID 20196)
-- Name: cd_tipo_pago_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cd_tipos_pagos ALTER COLUMN cd_tipo_pago_pk SET DEFAULT nextval('cd_tipos_pagos_cd_tipo_pago_pk_seq'::regclass);


--
-- TOC entry 2279 (class 2604 OID 20197)
-- Name: cd_factura_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY facturas ALTER COLUMN cd_factura_pk SET DEFAULT nextval('facturas_cd_factura_pk_seq'::regclass);


--
-- TOC entry 2285 (class 2604 OID 20198)
-- Name: cd_fondo_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fondos ALTER COLUMN cd_fondo_pk SET DEFAULT nextval('fondos_cd_fondo_pk_seq'::regclass);


--
-- TOC entry 2286 (class 2604 OID 20199)
-- Name: cd_gasto_comun_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gastos_comunes ALTER COLUMN cd_gasto_comun_pk SET DEFAULT nextval('gastos_comunes_cd_gasto_comun_pk_seq'::regclass);


--
-- TOC entry 2287 (class 2604 OID 20200)
-- Name: cd_gasto_nocomun_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gastos_nocomunes ALTER COLUMN cd_gasto_nocomun_pk SET DEFAULT nextval('gastos_nocomunes_cd_gasto_nocomun_pk_seq'::regclass);


--
-- TOC entry 2294 (class 2604 OID 20437)
-- Name: cd_mensajes_pk; Type: DEFAULT; Schema: public; Owner: hjtecnos
--

ALTER TABLE ONLY mensajes ALTER COLUMN cd_mensajes_pk SET DEFAULT nextval('mensajes_cd_mensajes_pk_seq'::regclass);


--
-- TOC entry 2288 (class 2604 OID 20201)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY menu ALTER COLUMN id SET DEFAULT nextval('menu_id_seq'::regclass);


--
-- TOC entry 2289 (class 2604 OID 20202)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY operaciones ALTER COLUMN id SET DEFAULT nextval('operaciones_id_seq'::regclass);


--
-- TOC entry 2290 (class 2604 OID 20203)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- TOC entry 2292 (class 2604 OID 20204)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "user" ALTER COLUMN id SET DEFAULT nextval('user_id_seq'::regclass);


--
-- TOC entry 2499 (class 0 OID 19982)
-- Dependencies: 181
-- Data for Name: cd_aguas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cd_aguas (cd_aguas_pk, cod_apto, cod_conjunto, cod_edificio, lect_ant, lect_post) FROM stdin;
\.


--
-- TOC entry 2585 (class 0 OID 0)
-- Dependencies: 182
-- Name: cd_aguas_cd_aguas_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cd_aguas_cd_aguas_pk_seq', 1, false);


--
-- TOC entry 2501 (class 0 OID 19990)
-- Dependencies: 183
-- Data for Name: cd_aptos; Type: TABLE DATA; Schema: public; Owner: postgres
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
-- TOC entry 2502 (class 0 OID 19993)
-- Dependencies: 184
-- Data for Name: cd_chequeras; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cd_chequeras (cd_chequeras_pk, cod_conjunto, cod_edificio, nro_cuenta, monto, saldo) FROM stdin;
\.


--
-- TOC entry 2586 (class 0 OID 0)
-- Dependencies: 185
-- Name: cd_chequeras_cd_chequeras_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cd_chequeras_cd_chequeras_pk_seq', 1, false);


--
-- TOC entry 2504 (class 0 OID 19998)
-- Dependencies: 186
-- Data for Name: cd_conceptos; Type: TABLE DATA; Schema: public; Owner: postgres
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
83	ASOC. VEC. DE VALLE ALTO  BONIF. DE FIN DE Aï¿œO DIC-2008	F	1
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
72	ARREGLO BAÃO CONSERJERIA  PROP. 1  1 DE 7	V	2
73	ARREGLO BAÃO CONSERJERIA PROP. 1    1 DE 8	V	2
74	ARREGLO BAÃO DE LA CONSERJERIA  CUOTAS 10  DE 10	V	2
75	ARREGLO BAÃO DE LA CONSERJERIA  CUOTAS 10  DE 11	V	2
77	ARREGLO BAÃO DE LA CONSERJERIA  CUOTAS 6  DE 6	V	2
76	ARREGLO BAÃO DE LA CONSERJERIA  CUOTAS 10  DE 12	V	2
78	ARREGLO BAÃO DE LA CONSERJERIA  CUOTAS 7  DE 7	V	2
79	ARREGLO BAÃO DE LA CONSERJERIA  CUOTAS 8  DE 8	V	2
96	BONIF. FIN DE AÃO 2015 TRAB. RES. TORRES  2  Y  2	F	1
97	BONIFICACION DE FIN ADE AÃO 2015	F	1
99	BONIFICACION DE FIN DE AÃO 2010 2 DE 2	F	1
98	BONIFICACION DE FIN DE AÃO 2007	F	1
100	BONIFICACION DE FIN DE AÃO 2014	F	1
102	BONIFICACION DE FIN DE AÃO 2015   2 DE 2	F	1
101	BONIFICACION DE FIN DE AÃO 2015	F	1
103	BONIFICACION DE FIN DE AÃO 2015  2 DE 2	F	1
104	BONIFICACION DE FIN DE AÃO 2015  3 DE 3	F	1
105	BONIFICACION DE FIN DE AÃO 2016	F	1
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
107	BONIFICACION ESPECIAL  AÃO 2015  2 DE 2	F	1
110	BONIFICACION FIN DE AÃO 1/3	F	1
112	BONIFICACION FIN DE AÃO 3/3	F	1
111	BONIFICACION FIN DE AÃO 2/3	F	1
118	BONO FIN DE AÃO 1/3	F	1
120	BONO FIN DE AÃO 3/3	F	1
119	BONO FIN DE AÃO 2/3	F	1
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
650	J	F	1
314	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA   MAR - 2013	V	2
1093	REPARACION PUERTA 2/2	F	1
226	COMPRA DE AVISOS DE SEÃALIZACION	F	1
309	DESTAPADO DEL BAÃO DE LA CONSERJERIA	F	1
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
1308	SUPLENCIA POR VAC. SR. JAIRO	F	1
773	MANT. DE REJA DE ESTAC. FEBRERO 2016	F	1
774	MANT. DE SISTEMA HIDRONEUMATICO 03/2016	F	1
885	MANTENIMIENTO PARQUE Y JARDINES	F	1
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
1057	REPARACION BAÃOS 5/6	F	1
1056	REPARACION BAÃOS 4/6	F	1
1055	REPARACION BAÃOS 3/6	F	1
1054	REPARACION BAÃOS 2/6	F	1
1008	REINTEGRO ARREGLO BAÃO DE LA CONSERJERIA  CUOTAS  4  DE  4	V	2
1009	REINTEGRO ARREGLO BAÃO DE LA CONSERJERIA  CUOTAS  5  DE  5	V	2
1079	REPARACION DEL BAÃO DE LA GARITA	F	1
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
1392	UTILES ESCOLARES 3/4	F	1
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
1410	ï¿œ	F	1
34	ALBAÃIL. Y PINT. PARED DUCTO VENT. COCINA LINEA 4 Y 2-3   1 DE 2	F	1
1411	HASTA AQUI CENTRO POLO I TORRE C	F	1
1353	TRABAJOS ALBAÃILERIA	F	1
1354	TRABAJOS ALBAÃILERIA, PLOMERIA	F	1
1377	TRABAJOS VARIOS EN EL EDIFICIO AÃO 2015	F	1
1289	SUM. Y COLOC. PUERTA MET. CON MARCO BAÃO VIGILANCIA	F	1
1330	TRAB. DE ALBAÃILERIA EN REP. DE FILTRACION TUB. PPAL.	F	1
1058	REPARACION BAÃOS 6/6	F	1
1053	REPARACION BAÃOS 1/6	F	1
291	DAÃO DEL ASCENSOR POR SOBREPESO 2 DE 2	V	2
106	BONIFICACION DE FIN DE AÃO DE LA CONSERJE  2009 2 DE  2	F	1
543	HASTA  AQUI GAVIOTAS	F	1
954	PLOMERIA EN LOS PISOS 9 Y 11 Y BAÃO DEL SF	F	1
\.


--
-- TOC entry 2587 (class 0 OID 0)
-- Dependencies: 187
-- Name: cd_conceptos_cd_conceptos_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cd_conceptos_cd_conceptos_pk_seq', 1411, true);


--
-- TOC entry 2506 (class 0 OID 20003)
-- Dependencies: 188
-- Data for Name: cd_conjuntos; Type: TABLE DATA; Schema: public; Owner: postgres
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
-- TOC entry 2588 (class 0 OID 0)
-- Dependencies: 189
-- Name: cd_conjuntos_cd_conjuntos_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cd_conjuntos_cd_conjuntos_pk_seq', 30, true);


--
-- TOC entry 2508 (class 0 OID 20008)
-- Dependencies: 190
-- Data for Name: cd_deudas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cd_deudas (cd_deudas_pk, cod_apto, cod_conjunto, cod_edificio, fecha_deuda, fecha_cancelado, monto, interes, nro_doc, nro_cheque) FROM stdin;
\.


--
-- TOC entry 2589 (class 0 OID 0)
-- Dependencies: 191
-- Name: cd_deudas_cd_deudas_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cd_deudas_cd_deudas_pk_seq', 1, false);


--
-- TOC entry 2510 (class 0 OID 20013)
-- Dependencies: 192
-- Data for Name: cd_edificios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cd_edificios (cd_edificios_pk, cod_conjunto, nombre_edificio, nombre_concerje, telf_concerje, porcentaje_nro1, email_edificio, porcentaje_nro2, agua, fondo_nro1, fondo_nro2, fondo_nro3, fondo_nro4, fondo_nro5, fondo_nro6, fondo_nro7, fondo_nro8) FROM stdin;
13	9	0	0	0	10.0000	N/A	0.0000	0.0000	360	604	603	0	0	0	0	0
15	11	0	0	0	25.0000	N/A	0.0000	0.0000	360	150	0	0	0	0	0	0
19	14	0	0	0	20.0000	N/A	0.0000	0.0000	360	0	0	0	0	0	0	0
24	18	0	0	0	10.0000	N/A	0.0000	0.0000	360	1251	0	0	0	0	0	0
11	7	MONTERIA	NOHAY	9879874	10.0000	N/A	0.0000	0.0000	360	150	0	0	0	0	0	0
12	8	GUARICHAL	NOHAY	4569712	10.0000	N/A	0.0000	0.0000	714	150	731	0	0	0	0	0
14	10	GUARACARUMBO	CARMEN	9784225	14.0000	N/A	0.0000	0.0000	360	977	1004	0	0	0	0	0
17	12	LA GUAIRITA	MARIA	0	10.0000	N/A	0.0000	0.0000	1085	150	1172	0	0	0	0	0
18	13	PARQUE COLINA "A"	LUZ	7512222	15.0000	N/A	0.0000	0.0000	360	150	1127	0	0	0	0	0
20	15	" A "	NO HAY	6662222	10.0000	N/A	0.0000	0.0000	360	150	0	0	0	0	0	0
21	15	" B "	NO HAY	7773333	10.0000	N/A	0.0000	0.0000	360	150	0	0	0	0	0	0
22	16	EMINENCE PALACE	NO HAY	8884444	15.0000	N/A	0.0000	0.0000	360	150	1203	1222	0	0	0	0
23	17	LOMA LINDA TOWN HOUSES	NO HAY	9991111	10.0000	N/A	0.0000	0.0000	360	1250	1243	0	0	0	0	0
25	19	CIMA AVILA	NO HAY	42142142	10.0000	N/A	0.0000	0.0000	360	0	0	0	0	0	0	0
26	20	LEANDRO	NO HAY	123456789	10.0000	N/A	0.0000	0.0000	360	150	1298	0	0	0	0	0
27	21	MURALTA TORRE A	MMMMMM	99999999	15.0000	N/A	0.0000	0.0000	360	0	1335	1342	0	0	0	0
28	21	MURALTA TORRE B	MMMMMM	9999999999	15.0000	N/A	0.0000	0.0000	360	0	1335	1342	0	0	0	0
29	21	MURALTA TORRE C	MMMMMM	9999999	15.0000	N/A	0.0000	0.0000	360	0	1335	1342	0	0	0	0
30	21	MURALTA TORRE D	MMMMMM	9999999	15.0000	N/A	0.0000	0.0000	360	0	1335	1342	0	0	0	0
31	21	MURALTA ESTACIONAMIENTO	MMMMMM	9999999	15.0000	N/A	0.0000	0.0000	360	0	1335	1342	0	0	0	0
32	21	MURALTA MALETEROS	MMMMMM	9999999	15.0000	N/A	0.0000	0.0000	360	0	1335	1342	0	0	0	0
33	22	MILY TORRE  A	XXXXX	2127530000	10.0000	N/A	0.0000	0.0000	360	150	1393	0	0	0	0	0
1	1	TORRE C	A	0	5.0000	prueba@prueba.com	5.0000	0.0000	360	370	409	150	429	594	407	451
2	1	TORRE B	A	0	5.0000	N/A	5.0000	0.0000	360	370	409	150	0	594	407	451
3	1	CENTRO COMERCIAL	A	234	5.0000	N/A	5.0000	0.0000	360	370	448	0	0	0	0	0
4	1	TORRE C	N/A	0	5.0000	N/A	5.0000	0.0000	360	370	409	150	429	0	0	0
5	1	TORRE A	NO TIENE	4444444	10.0000	N/A	0.0000	0.0000	360	150	0	0	0	0	0	0
6	2	RESIDENCIAS ARIES	HELENA	2	10.0000	N/A	0.0000	0.0000	360	150	778	779	682	0	0	0
7	3	RES. ALBARREGAS	YANELIS	0	40.0000	N/A	0.0000	0.0000	360	150	419	0	0	0	0	0
8	4	RES.  CHANTILLY	JUANA	0	15.0000	N/A	0.0000	0.0000	360	150	0	0	0	0	0	0
9	5	TORRES  1-2 Y 3	CARMEN	7540909	10.0000	N/A	0.0000	0.0000	360	150	875	0	0	0	0	0
10	6	RESIDENCIAS  MARCONI	NO HAY	9999998	10.0000	N/A	0.0000	0.0000	360	150	689	685	651	0	0	0
34	23	RESIDENCIAS JAJI	EDGAR	2129530000	10.0000	N/A	0.0000	0.0000	360	150	0	0	0	1353	0	0
35	22	MILY TORRE  B	XXXXX	2127530000	10.0000	N/A	0.0000	0.0000	360	150	1393	0	0	0	0	0
36	24	ACACIAS PLAZA	DORIS	432432432	10.0000	N/A	0.0000	0.0000	360	150	0	0	0	0	0	0
37	25	RES. CARONI	NO HAY	666666433	10.0000	N/A	0.0000	0.0000	360	1491	150	419	0	0	0	0
38	25	RES. ARAUCA	NO HAY	666666434	10.0000	N/A	0.0000	0.0000	360	1491	150	419	0	0	0	0
39	19	CIMA AVILA	NO HAY	521521521	10.0000	N/A	0.0000	0.0000	360	0	0	0	0	0	0	0
40	26	LOS CERRITOS	NO HAY	316264777	10.0000	N/A	0.0000	0.0000	360	0	0	0	0	0	0	0
41	27	SAINT TROPEZ	NO HAY	529529529	20.0000	N/A	0.0000	0.0000	360	150	0	0	0	0	0	0
42	28	DE ALTO HATILLO	NO HAY	530530530	10.0000	N/A	0.0000	0.0000	360	1596	0	0	0	0	0	0
43	30	LOS ROBLES A	NO HAY	530530530	10.0000	N/A	0.0000	0.0000	360	150	1679	1680	1681	1682	1683	1684
44	30	LOS ROBLES B	NO HAY	530530530	10.0000	N/A	0.0000	0.0000	360	150	1679	1680	1681	1682	1683	1684
\.


--
-- TOC entry 2590 (class 0 OID 0)
-- Dependencies: 193
-- Name: cd_edificios_cd_edificios_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cd_edificios_cd_edificios_pk_seq', 44, true);


--
-- TOC entry 2512 (class 0 OID 20036)
-- Dependencies: 194
-- Data for Name: cd_fondos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cd_fondos (cd_fondos_pk, cod_conjunto, cod_edificio, cod_concepto, fecha_i, fecha_f, monto_g, nro_cuotas, cuota_m, gastos) FROM stdin;
\.


--
-- TOC entry 2591 (class 0 OID 0)
-- Dependencies: 195
-- Name: cd_fondos_cd_fondos_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cd_fondos_cd_fondos_pk_seq', 1, false);


--
-- TOC entry 2514 (class 0 OID 20041)
-- Dependencies: 196
-- Data for Name: cd_historicos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cd_historicos (cd_historicos_pk, cod_observacion, cod_deuda, cod_apto, cod_conjunto, cod_edificio, fecha, monto, apagar, recibo) FROM stdin;
\.


--
-- TOC entry 2592 (class 0 OID 0)
-- Dependencies: 197
-- Name: cd_historicos_cd_historicos_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cd_historicos_cd_historicos_pk_seq', 1, false);


--
-- TOC entry 2516 (class 0 OID 20046)
-- Dependencies: 198
-- Data for Name: cd_mantenimientos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cd_mantenimientos (cd_mantenimientos_pk, correlativo) FROM stdin;
\.


--
-- TOC entry 2593 (class 0 OID 0)
-- Dependencies: 199
-- Name: cd_mantenimientos_cd_mantenimientos_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cd_mantenimientos_cd_mantenimientos_pk_seq', 1, false);


--
-- TOC entry 2518 (class 0 OID 20051)
-- Dependencies: 200
-- Data for Name: cd_mov_chequeras; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cd_mov_chequeras (cd_mov_chequeras_pk, cod_concepto, cod_proveedor, nro_cheque, factura, monto, nro_cuenta, fecha) FROM stdin;
\.


--
-- TOC entry 2519 (class 0 OID 20057)
-- Dependencies: 201
-- Data for Name: cd_mov_mes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cd_mov_mes (cd_mov_mes_pk, cod_concepto, cod_apto, cod_conjunto, cod_edificio, fecha, monto) FROM stdin;
\.


--
-- TOC entry 2520 (class 0 OID 20060)
-- Dependencies: 202
-- Data for Name: cd_observaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cd_observaciones (cd_observaciones_pk, descripcion) FROM stdin;
\.


--
-- TOC entry 2594 (class 0 OID 0)
-- Dependencies: 203
-- Name: cd_observaciones_cd_observaciones_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cd_observaciones_cd_observaciones_pk_seq', 1, false);


--
-- TOC entry 2522 (class 0 OID 20065)
-- Dependencies: 204
-- Data for Name: cd_pagos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cd_pagos (cd_pago_pk, cod_edificio, cod_apto, cod_factura, cod_tipo_pago, nro_transferencia_referencia, fecha_pago, nota_descrip_pago, nombre, apellido, nro_cedula, cod_tipo_doc, email, estatus_pago) FROM stdin;
\.


--
-- TOC entry 2595 (class 0 OID 0)
-- Dependencies: 205
-- Name: cd_pagos_cd_pago_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cd_pagos_cd_pago_pk_seq', 1, true);


--
-- TOC entry 2524 (class 0 OID 20074)
-- Dependencies: 206
-- Data for Name: cd_propietarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cd_propietarios (cd_propietarios_pk, cod_user, nro_piso, nombre, apellido, nro_cedula, telf_local, telf_celular, email, alicuota, quien_vive, direccion, direccion_cobro, update_usr) FROM stdin;
1241	\N	1	RAFAEL  A.	RIVERO	0	1	1	N/A	0.0514	N/A	N/A	N/A	t
1021	\N	PB	MARIA FERNANDA	ZAJEA	0	1	N/A	N/A	0.0050	N/A	N/A	N/A	t
574	\N	1	GERONIMO	CALDERON	0	N/A	N/A	N/A	0.0100	N/A	N/A	N/A	t
977	\N	5	MANUEL	LOPEZ LOPEZ	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
1512	\N	1	Y SRA.	LEON AMELINCKX	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A	t
82	\N	8	ALMOGUERA	LUIS	0	N/A	N/A	N/A	0.0366	N/A	N/A	N/A	t
191	\N	12	BARRETO	OSCAR	0	N/A	N/A	N/A	0.0366	N/A	N/A	N/A	t
1063	\N	7	MARTINEZ	ALEJANDRO	0	N/A	N/A	N/A	0.0366	N/A	N/A	N/A	t
1346	\N	4	ROSALES	ALBERTO	0	N/A	N/A	N/A	0.0366	N/A	N/A	N/A	t
521	\N	1	FIGUEIRA	CARLOS	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A	t
645	\N	8	HERNANDEZ	FERNANDO	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A	t
1305	\N	2	ROBAYO L.	CARLOS A.	0	N/A	N/A	N/A	0.0220	N/A	N/A	N/A	t
1332	\N	6	ROMERO	FRANCISCO A.	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A	t
253	\N	PH	CAMPO PALMA	YANETH DEL CARMEN	0	N/A	N/A	N/A	0.0294	N/A	N/A	N/A	t
322	\N	PB	CHACIN MARTINEZ	ALBERTO	0	N/A	N/A	N/A	0.0423	N/A	N/A	N/A	t
560	\N	3	GARCIA DIAZ	VIRGINIA	0	N/A	N/A	N/A	0.0421	N/A	N/A	N/A	t
875	\N	1	LANDAETA	ROLANDO	0	N/A	N/A	N/A	0.0421	N/A	N/A	N/A	t
877	\N	PB	LAUGHLIN	GEORGE	0	N/A	N/A	N/A	0.0393	N/A	N/A	N/A	t
1390	\N	PH	SEQUERA	GELVIS	0	N/A	N/A	N/A	0.0570	N/A	N/A	N/A	t
1398	\N	1	SIERRALTA	JESUS	0	N/A	N/A	N/A	0.0421	N/A	N/A	N/A	t
244	\N	P	C.A.	TELE CUATRO,	0	N/A	N/A	N/A	0.0048	N/A	N/A	N/A	t
287	\N	12	CARMEN	OJEDA	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
750	\N	5	JAVIER H.	CASTILLO MONCADA	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
74	\N	5	ALFREDO	MARANDO  FALCIGLIA	0	7515142	N/A	N/A	0.0089	N/A	N/A	N/A	t
31	\N	12	AILID DEYANIRA	BARRIOS GOLDING	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A	t
65	\N	3	ALEXIS	FLORES	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A	t
71	\N	10	ALFREDO	MARANDO   FALCIGLIA	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A	t
81	\N	3	ALFREDO	SEVER  MENDEZ	0	N/A	N/A	N/A	0.0066	N/A	N/A	N/A	t
1198	\N	3	PASQUALE	DELL'AQUILA	0	N/A	N/A	N/A	0.1059	N/A	N/A	N/A	t
114	\N	6	ANDRE	KHAYAN  BABIKIAN	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A	t
1492	\N	11	VOLCA	C. A.	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A	t
36	\N	2	ALBERTO	FERNANDEZ	0	N/A	N/A	N/A	0.1059	N/A	N/A	N/A	t
37	\N	1	ALBERTO	GURREIRO	0	N/A	N/A	N/A	0.0843	N/A	N/A	N/A	t
416	\N	2	DOLORES	PABON	0	N/A	N/A	N/A	0.0442	N/A	N/A	N/A	t
483	\N	1	ESPERANZA	GIL	0	N/A	N/A	N/A	0.1059	N/A	N/A	N/A	t
505	\N	2	FEDERICO	ROJAS	0	N/A	N/A	N/A	0.0843	N/A	N/A	N/A	t
556	\N	PB	GAETANO	BIUNDO	0	N/A	N/A	N/A	0.0923	N/A	N/A	N/A	t
773	\N	PB	JOEL	MUJICA	0	N/A	N/A	N/A	0.0843	N/A	N/A	N/A	t
775	\N	PB	JONATHAN	BARRERO	0	N/A	N/A	N/A	0.0442	N/A	N/A	N/A	t
1419	\N	11	SUAREZ CEDEï¿œO	CRUZ MARIA	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
1440	\N	6	TOMASELLO MINEO	ANTONIO	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
1444	\N	7	TOVAR LUENGA	MARIA MILAGRO	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
100	\N	3	AMERICA DEL CARMEN	JIMENEZ	0	632-8757	N/A	N/A	0.0090	N/A	N/A	N/A	t
112	\N	11	ANAEM  M.	CARO MONTES DE OCA	0	753-8592;  979-6973	N/A	N/A	0.0089	N/A	N/A	N/A	t
1458	\N	8	VALLEJO	CORINA	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
366	\N	5	CRESPILLO	MONIKA	0	1	N/A	N/A	0.0067	N/A	N/A	N/A	t
1502	\N	2	WILMA	PUCHE	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
1464	\N	2	VEGLIANTE G.  Y SRA	MICHELE	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
1549	\N	7	ZULEIMA DE CASTILLO	LUBIN CASTILLO	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
1201	\N	3	PAULA	RASTELLI	0	N/A	N/A	N/A	0.0843	N/A	N/A	N/A	t
1348	\N	3	ROSANGELA	NATERA	0	N/A	N/A	N/A	0.0442	N/A	N/A	N/A	t
1436	\N	1	THARIK	ESCALONA	0	N/A	N/A	N/A	0.0442	N/A	N/A	N/A	t
1011	\N	PH	MARIA ANTONIETA	PACIELLO	0	N/A	N/A	N/A	0.0762	N/A	N/A	N/A	t
3	\N	3	090663 C.A.	CORPORACION	0	83	N/A	N/A	0.0085	N/A	N/A	N/A	t
328	\N	2	CIMA 0411 C.A.	INVERSIONES	0	70	N/A	N/A	0.0085	N/A	N/A	N/A	t
329	\N	2	CIMA 1302 C.A.	INVERSIONES	0	69	N/A	N/A	0.0085	N/A	N/A	N/A	t
330	\N	2	CIMA 2805, C. A.	INVERSIONES	0	81	N/A	N/A	0.0085	N/A	N/A	N/A	t
331	\N	PB	CIMA AVILA 23, C.A.	INVERSIONES	0	2	N/A	N/A	0.0094	N/A	N/A	N/A	t
332	\N	6	CIMA AVILA 23, C.A.	INVERSIONES	0	2	N/A	N/A	0.0098	N/A	N/A	N/A	t
333	\N	6	CIMA AVILA 23, C.A.	INVERSIONES	0	66	N/A	N/A	0.0098	N/A	N/A	N/A	t
334	\N	4	CIMA AVILA 23, C.A.	INVERSIONES	0	74	N/A	N/A	0.0085	N/A	N/A	N/A	t
335	\N	6	CIMA AVILA 23, C.A.	INVERSIONES	0	78	N/A	N/A	0.0085	N/A	N/A	N/A	t
336	\N	7	CIMA AVILA 23, C.A.	INVERSIONES	0	80	N/A	N/A	0.0148	N/A	N/A	N/A	t
337	\N	4	CIMA AVILA 23, C.A.	INVERSIONES	0	85	N/A	N/A	0.0085	N/A	N/A	N/A	t
338	\N	7	CIMA AVILA 23, C.A.	INVERSIONES	0	91	N/A	N/A	0.0148	N/A	N/A	N/A	t
339	\N	PB	CIMA AVILA 23, C.A.	INVERSIONES	0	93	N/A	N/A	0.0089	N/A	N/A	N/A	t
341	\N	5	CIMA AVILA 23, C.A.	INVERSIONES	0	105	N/A	N/A	0.0089	N/A	N/A	N/A	t
342	\N	5	CIMA AVILA 23, C.A.	INVERSIONES	0	106	N/A	N/A	0.0086	N/A	N/A	N/A	t
343	\N	7	CIMA AVILA 23, C.A.	INVERSIONES	0	111	N/A	N/A	0.0183	N/A	N/A	N/A	t
344	\N	7	CIMA AVILA 23, C.A.	INVERSIONES	0	113	N/A	N/A	0.0225	N/A	N/A	N/A	t
1496	\N	6	WENDY	ESTRELLA YANNARELLA	0	731-2632;  081-651548	014-2651442	N/A	0.0063	P	N/A	N/A	t
741	\N	5	J.M. 52,  C.A.	DESARROLLOS	0	N/A	N/A	N/A	0.0019	N/A	N/A	N/A	t
1015	\N	PB	MARIA CONCEPCION	BLANCO	0	N/A	N/A	N/A	0.0098	N/A	N/A	N/A	t
1509	\N	1	Y S. CHAVEZ	ALBERTO BURRAJO	0	N/A	N/A	N/A	0.0019	N/A	N/A	N/A	t
55	\N	3	ALEJANDRO	SIERRA	0	N/A	N/A	N/A	0.0094	N/A	N/A	N/A	t
1224	\N	12	PILAR  C.	VAZ  MACEIRA	0	N/A	N/A	N/A	0.0066	N/A	N/A	N/A	t
1520	\N	1	YELVIS MARINA	LEON CASTRO	0	N/A	N/A	N/A	0.0062	N/A	N/A	N/A	t
1547	\N	3	ZULAY JOSEFINA	RIDRIGUEZ FIGUERA	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A	t
591	\N	1	GLORIA	NAVARRO	0	N/A	N/A	N/A	0.0087	N/A	N/A	N/A	t
1093	\N	2	MIGUEL	OTAOLA	0	N/A	N/A	N/A	0.0505	N/A	N/A	N/A	t
6	\N	3	ABDALLAH KHABBAZE Y	NORMA DE KHABBAZE	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A	t
13	\N	4	ADALBERTO	GABALDON	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A	t
92	\N	2	ALVARO RUIZ  Y	MIRIAM PEREZ C.	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A	t
211	\N	4	BERNARDO	RATMIROFF  Y  SRA.	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A	t
262	\N	2	CARLOS	ALVARADO  G.	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A	t
365	5	2	COVA	ALEJANDRO	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A	t
263	\N	7	CARLOS	BARROETA	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A	t
356	\N	3	COMUNICACION	ACD	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A	t
364	\N	4	CORINA  ALEJANDRA	MORIN  CEDEï¿œO	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A	t
513	\N	2	FERNANDO	ALBA HERNANDEZ	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A	t
609	\N	5	GRACIELA T.	MORANDIN ZAMOLO	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A	t
644	\N	1	HERNAN  F.	HERNANDEZ	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A	t
668	\N	PH	IGLESIAS	JOSE  REY	0	N/A	N/A	N/A	0.0368	N/A	N/A	N/A	t
731	\N	6	ITALO	PIMENTEL	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A	t
744	\N	7	JAIME	GOMEZ  CASTRO	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A	t
765	\N	3	JESUS  ORANGEL	PEREIRA  V.	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A	t
778	\N	2	JORGE	URDANETA  GALVE	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A	t
783	\N	PH	JOSE	CARMONA	0	N/A	N/A	N/A	0.0368	N/A	N/A	N/A	t
864	\N	1	JUVENCIO  PULGAR	TROCONIS	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A	t
623	\N	7	GUMERSINDO	MENDEZ MORENO	0	N/A	N/A	N/A	0.0064	N/A	N/A	N/A	t
910	\N	1	LINDA	GARCIA  R.	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A	t
809	\N	1	JOSE ANGEL	PAZ	0	N/A	N/A	N/A	0.0470	N/A	N/A	N/A	t
309	\N	4	CASADALBE, C.A.	INVERSIONES	0	N/A	N/A	N/A	0.0186	N/A	N/A	N/A	t
683	\N	6	INCERTO SILVESTRI	ANTONIO	0	N/A	N/A	N/A	0.0201	N/A	N/A	N/A	t
129	\N	6	ANGULO	MARDIN	0	N/A	N/A	N/A	0.0185	N/A	N/A	N/A	t
576	\N	3	GILIB	JUAN LUIS CASTELLANOS	0	N/A	N/A	N/A	0.0185	N/A	N/A	N/A	t
108	\N	5	ANA K.H., C.A.	INVERSIONES	0	N/A	N/A	N/A	0.0150	N/A	N/A	N/A	t
229	\N	6	BRACHO	VICTOR	0	N/A	N/A	N/A	0.0185	N/A	N/A	N/A	t
610	\N	PB	GREAT HOMES	INVERSIONES	0	N/A	N/A	N/A	0.0188	N/A	N/A	N/A	t
1044	\N	PH	MARILYN T.	CARLOS RONDON /	0	N/A	N/A	N/A	0.0198	N/A	N/A	N/A	t
1195	\N	1	PARTNERCA,C.A.	INVERSIONES	0	N/A	N/A	N/A	0.0186	N/A	N/A	N/A	t
1320	\N	2	RODRIGUEZ	JUAN CARLOS	0	N/A	N/A	N/A	0.0186	N/A	N/A	N/A	t
1107	\N	3	MOLINA	EUGENIO	0	N/A	N/A	N/A	0.0152	N/A	N/A	N/A	t
649	\N	E	HILLOCK	INVERSIONES	0	N/A	N/A	N/A	0.0004	N/A	N/A	N/A	t
1119	\N	E	MURALTA	DESARROLLOS	0	N/A	N/A	N/A	0.0002	N/A	N/A	N/A	t
650	\N	M	HILLOCK	INVERSIONES	0	N/A	N/A	N/A	0.0007	N/A	N/A	N/A	t
1120	\N	M	MURALTA	DESARROLLOS	0	N/A	N/A	N/A	0.0014	N/A	N/A	N/A	t
203	\N	2	BELLOMO	TRIFONE	0	N/A	N/A	N/A	0.0218	N/A	N/A	N/A	t
387	\N	7	DE  HENRIQUEZ	FILOMENA G	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A	t
647	\N	3	HERNANDEZ	OSWALDO J.	0	N/A	N/A	N/A	0.0217	N/A	N/A	N/A	t
1453	\N	6	URDANETA	GUSTAVO	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A	t
23	\N	06	ADRIANO	SIERRA  ESCARRAGA	0	271	N/A	N/A	0.0132	N/A	N/A	N/A	t
29	\N	PB	AGUSTIN	GONCALVES	0	271	N/A	N/A	0.0416	N/A	N/A	N/A	t
46	\N	09	ALCIDES	FARIAS	0	271	N/A	N/A	0.0132	N/A	N/A	N/A	t
66	\N	15	ALEXIS	HERNANDEZ	0	271	N/A	N/A	0.0132	N/A	N/A	N/A	t
98	\N	16	AMAYA	MAGUREGUI	0	271	N/A	N/A	0.0132	N/A	N/A	N/A	t
102	\N	14	AMPARO	MARI	0	271	N/A	N/A	0.0132	N/A	N/A	N/A	t
104	\N	02	ANA	VILLARROEL	0	271	N/A	N/A	0.0134	N/A	N/A	N/A	t
111	\N	07	ANA TERESA	SANOJA PERDOMO	0	271	N/A	N/A	0.0134	N/A	N/A	N/A	t
123	\N	06	ANGEL	LOPEZ	0	271	N/A	N/A	0.0132	N/A	N/A	N/A	t
124	\N	12	ANGEL IRAN	APARICIO PERNIA	0	271	N/A	N/A	0.0134	N/A	N/A	N/A	t
921	\N	7	LORENZO	SEIJAS  LOPEZ	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A	t
934	\N	4	LUIGI	PACILLI	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A	t
1271	\N	PB	RAUL	RAMIREZ	0	N/A	N/A	N/A	0.0975	N/A	N/A	N/A	t
949	\N	5	LUIS  CARLOS	SILVA  SAGASETA	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A	t
956	\N	PH	LUIS MANUEL	SALAMANCA PEREZ	0	N/A	N/A	N/A	0.0368	N/A	N/A	N/A	t
1016	\N	6	MARIA DEL CARMEN	GARCIA  B.	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A	t
1026	\N	6	MARIA LUISA	ARIAS MORAIS	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A	t
1032	\N	5	MARIA TERESA  SAGASETA	DE  SILVA	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A	t
1076	\N	1	MEDARDO	MEDINA  PUIG	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A	t
91	\N	M	ALVARO	RUIZ LUNA	0	N/A	N/A	N/A	0.0418	N/A	N/A	N/A	t
136	\N	04	ANTONIO	ANATO	0	N/A	N/A	N/A	0.0151	N/A	N/A	N/A	t
159	\N	03	ARGENIS HERNAN	CASTRO LUCENA	0	N/A	N/A	N/A	0.0151	N/A	N/A	N/A	t
171	\N	SO	ASOAVILEM	A.C.	0	N/A	N/A	N/A	0.1024	N/A	N/A	N/A	t
254	\N	02	CANDELARIA SOTO /	LINO TOMEI	0	N/A	N/A	N/A	0.0151	N/A	N/A	N/A	t
435	\N	02	EDOCONSTRUR	C.A.	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A	t
456	\N	01	ELISA	CABANA DE NEVADO	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A	t
461	\N	01	ELIZABETH	RUIZ LUNA	0	N/A	N/A	N/A	0.0151	N/A	N/A	N/A	t
608	\N	07	GONZALO DIAZ Y	DIXIE PERDOMO	0	N/A	N/A	N/A	0.0151	N/A	N/A	N/A	t
162	\N	9	ARIAS	AIDA	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A	t
200	\N	5	BELISA LLANOS	A. GABRIELA/	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A	t
248	\N	11	CALELLO	LUCIANO	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A	t
400	\N	PH	DE PEREDA	EUDOXIA LECUNA	0	N/A	N/A	N/A	0.0356	N/A	N/A	N/A	t
482	\N	10	ESCOBAR	CECILIA	0	N/A	N/A	N/A	0.0216	N/A	N/A	N/A	t
922	\N	5	LORETO	ANDREA	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A	t
1146	\N	6	NILA	CASANOVA	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A	t
1147	\N	3	NINA  ELENA	ESTE SALAS	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A	t
1173	\N	7	ORLANDO  VICENTE	RODRIGUEZ	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A	t
1215	\N	2	PEREGRINA	RIVERA  PEREZ	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A	t
1235	\N	3	PURA  F.	DE  FERMIN	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A	t
1249	\N	2	RAIMOND J. HAMONI  Y	TUBRESA  HAMAO	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A	t
1277	\N	5	REINA	REYES  JIMENEZ	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A	t
1306	\N	6	ROBERT	BLANKENSHIP	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A	t
1341	\N	7	ROSA  S.	CAMMARDELLA  S.	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A	t
1355	\N	4	RUDI	MAGDALENIC CARRIO	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A	t
1364	\N	2	SACHA ROHAN	FERNANDEZ CABRERA	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A	t
1375	\N	6	SANDRA B. GINER	JOSE R. DE NOBREA SUAREZ	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A	t
1377	\N	2	SANTIAGO	PENA  RICO	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A	t
1490	\N	5	VIVIANA  DE  M.	ROBERTO  MORENO  Y	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A	t
1524	\N	7	YEPEZ COLMENARES	GERMAN E.	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A	t
1536	\N	4	ZAIRA	ATIQUE  CRUZ	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A	t
1548	\N	1	ZULAY VERA	DURAND	0	N/A	N/A	N/A	0.0212	N/A	N/A	N/A	t
95	\N	6	AMANCIO	LOPEZ	0	N/A	N/A	N/A	0.0404	N/A	N/A	N/A	t
96	\N	6	AMANCIO	LOPEZ	0	N/A	N/A	N/A	0.0404	N/A	N/A	N/A	t
120	\N	9	ANDRES	MOURELOS	0	N/A	N/A	N/A	0.0404	N/A	N/A	N/A	t
232	\N	7	BRUNA	PACE	0	N/A	N/A	N/A	0.0404	N/A	N/A	N/A	t
233	\N	7	BRUNA	PACE	0	N/A	N/A	N/A	0.0404	N/A	N/A	N/A	t
273	\N	2	CARLOS  A.	MENDOZA	0	N/A	N/A	N/A	0.0404	N/A	N/A	N/A	t
381	\N	3	DANIEL	REQUEIJO	0	N/A	N/A	N/A	0.0404	N/A	N/A	N/A	t
422	\N	8	DORIS ANGELICA	VALERO ARANGURE	0	N/A	N/A	N/A	0.0404	N/A	N/A	N/A	t
433	\N	9	EDITH	OROZCO  RAMIREZ	0	N/A	N/A	N/A	0.0404	N/A	N/A	N/A	t
436	\N	1	EDUAR A.	BELTRAN CEDEï¿œO	0	N/A	N/A	N/A	0.0404	N/A	N/A	N/A	t
539	\N	12	FRANCISCO J.	COBO	0	N/A	N/A	N/A	0.0404	N/A	N/A	N/A	t
671	\N	5	ILEANA MORELBA	RIVAS QUINTERO	0	N/A	N/A	N/A	0.0404	N/A	N/A	N/A	t
846	\N	11	JUAN M.	WEISSHAAR	0	N/A	N/A	N/A	0.0404	N/A	N/A	N/A	t
895	\N	5	LEONEL	HERNANDEZ	0	N/A	N/A	N/A	0.0404	N/A	N/A	N/A	t
936	\N	13	LUIS	CAPRILES	0	N/A	N/A	N/A	0.0720	N/A	N/A	N/A	t
976	\N	8	MANUEL	GONZALEZ	0	N/A	N/A	N/A	0.0404	N/A	N/A	N/A	t
1149	\N	4	NOHELYS JUDITH	PERDOMO C.	0	N/A	N/A	N/A	0.0404	N/A	N/A	N/A	t
1162	\N	1	OLGA	PERAZA	0	N/A	N/A	N/A	0.0404	N/A	N/A	N/A	t
1202	\N	10	PAULINA ISABEL	TORRES	0	N/A	N/A	N/A	0.0404	N/A	N/A	N/A	t
1274	\N	12	REBECA	DE SANTIS	0	N/A	N/A	N/A	0.0404	N/A	N/A	N/A	t
1356	\N	11	RUFINA	LOPEZ	0	N/A	N/A	N/A	0.0404	N/A	N/A	N/A	t
1379	\N	3	SANTIAGO ANTONIO	SALAZAR BORGES	0	N/A	N/A	N/A	0.0404	N/A	N/A	N/A	t
1428	\N	10	TATIANA	KOCHANOSKY	0	N/A	N/A	N/A	0.0404	N/A	N/A	N/A	t
1437	\N	4	THOMAS	GIBBS	0	N/A	N/A	N/A	0.0404	N/A	N/A	N/A	t
119	\N	PB	ANDRES	GARCIA	0	N/A	N/A	N/A	0.0918	N/A	N/A	N/A	t
223	\N	4	BODO	BITTKAN	0	N/A	N/A	N/A	0.0676	N/A	N/A	N/A	t
286	\N	4	CARMEN	LOPEZ N.	0	N/A	N/A	N/A	0.0676	N/A	N/A	N/A	t
384	\N	6	DANIELCOELLO	MARSINYACH	0	N/A	N/A	N/A	0.0676	N/A	N/A	N/A	t
639	\N	2	HELENA	MENDEZ DE BELDA	0	N/A	N/A	N/A	0.0676	N/A	N/A	N/A	t
138	\N	18	ANTONIO	ARIAS	0	271	N/A	N/A	0.0134	N/A	N/A	N/A	t
669	\N	PH	IGNACIO L.	RIVERO	0	N/A	N/A	N/A	0.0966	N/A	N/A	N/A	t
754	\N	3	JESUS	ALFARO	0	N/A	N/A	N/A	0.0676	N/A	N/A	N/A	t
811	\N	1	JOSE CARLOS	DE GOUVEIA	0	N/A	N/A	N/A	0.0676	N/A	N/A	N/A	t
944	\N	2	LUIS	PASTORI APONTE	0	N/A	N/A	N/A	0.0676	N/A	N/A	N/A	t
1089	\N	6	MERCEDEZ	HERNANDEZ	0	N/A	N/A	N/A	0.0676	N/A	N/A	N/A	t
1140	\N	5	NEUGIN BEATRIZ	PASTORI	0	N/A	N/A	N/A	0.0676	N/A	N/A	N/A	t
1167	\N	5	OLIVIO	DA SILVA VIERA	0	N/A	N/A	N/A	0.0676	N/A	N/A	N/A	t
164	\N	04	ARLENE T	SANCHEZ  B.	0	271	N/A	N/A	0.0132	N/A	N/A	N/A	t
172	\N	15	ASTRID	HOLMQUIST	0	271	N/A	N/A	0.0132	N/A	N/A	N/A	t
173	\N	03	ASTRID	MARIN	0	271	N/A	N/A	0.0132	N/A	N/A	N/A	t
270	\N	13	CARLOS	GONCALVES	0	271	N/A	N/A	0.0132	N/A	N/A	N/A	t
271	\N	06	CARLOS	ROJAS	0	271	N/A	N/A	0.0134	N/A	N/A	N/A	t
272	\N	09	CARLOS	VILLARROEL	0	271	N/A	N/A	0.0134	N/A	N/A	N/A	t
291	\N	14	CARMEN  MARIA	SUAREZ	0	271	N/A	N/A	0.0134	N/A	N/A	N/A	t
296	\N	09	CARMEN MARIA	SUAREZ	0	271	N/A	N/A	0.0132	N/A	N/A	N/A	t
355	\N	16	COLMAN	GARCIA	0	271	N/A	N/A	0.0134	N/A	N/A	N/A	t
377	\N	10	DALIA	MORALES	0	271	N/A	N/A	0.0134	N/A	N/A	N/A	t
1172	\N	1	OMAR	MAZEI	0	N/A	N/A	N/A	0.0676	N/A	N/A	N/A	t
1222	\N	3	PIETRO	TRISTAMO	0	N/A	N/A	N/A	0.0676	N/A	N/A	N/A	t
121	\N	1	ANDRES	RODRIGUEZ	0	N/A	N/A	N/A	0.0506	N/A	N/A	N/A	t
214	\N	1	BETSABE DE U./	LEANDRO USECHE	0	N/A	N/A	N/A	0.0506	N/A	N/A	N/A	t
277	\N	8	CARLOS E.	BALDERRAMA	0	N/A	N/A	N/A	0.0506	N/A	N/A	N/A	t
358	\N	3	CONST.	ALASIA	0	N/A	N/A	N/A	0.0506	N/A	N/A	N/A	t
370	\N	PH	D.	ALASIA	0	N/A	N/A	N/A	0.0892	N/A	N/A	N/A	t
509	\N	5	FELIX	TEJERO	0	N/A	N/A	N/A	0.0506	N/A	N/A	N/A	t
663	\N	7	I.	SCHILLANI	0	N/A	N/A	N/A	0.0506	N/A	N/A	N/A	t
724	\N	9	IRENE	COLMENARES	0	N/A	N/A	N/A	0.0506	N/A	N/A	N/A	t
444	\N	1	EINNA, C.A.	CONSTRUCTORA	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A	t
737	\N	8	J.	DE BALDERRAMA	0	N/A	N/A	N/A	0.0506	N/A	N/A	N/A	t
879	\N	2	LAURA DE	BENSHIMOL	0	N/A	N/A	N/A	0.0506	N/A	N/A	N/A	t
1030	\N	5	MARIA T. DE	DIAZ	0	N/A	N/A	N/A	0.0506	N/A	N/A	N/A	t
445	\N	1	EINNA, C.A.	CONSTRUCTORA	0	N/A	N/A	N/A	0.0214	N/A	N/A	N/A	t
446	\N	1	EINNA, C.A.	CONSTRUCTORA	0	N/A	N/A	N/A	0.0152	N/A	N/A	N/A	t
1041	\N	4	MARIELA DE	LUGO	0	N/A	N/A	N/A	0.0506	N/A	N/A	N/A	t
447	\N	1	EINNA, C.A.	CONSTRUCTORA	0	N/A	N/A	N/A	0.0149	N/A	N/A	N/A	t
1066	\N	6	MARY JOSEFINA	FLORES ALFONSO	0	N/A	N/A	N/A	0.0506	N/A	N/A	N/A	t
448	\N	PB	EINNA, C.A.	CONSTRUCTORA	0	N/A	N/A	N/A	0.0214	N/A	N/A	N/A	t
1176	\N	9	OSCAR	MENDOZA RINCONES	0	N/A	N/A	N/A	0.0506	N/A	N/A	N/A	t
1325	\N	3	RODRIGUEZ VILLAR	CAROLINA	0	N/A	N/A	N/A	0.0506	N/A	N/A	N/A	t
1389	\N	6	SEHIDY	TORRES	0	N/A	N/A	N/A	0.0506	N/A	N/A	N/A	t
1439	\N	2	TOMAS	ANDONEGNI	0	N/A	N/A	N/A	0.0506	N/A	N/A	N/A	t
449	\N	PB	EINNA, C.A.	CONSTRUCTORA	0	N/A	N/A	N/A	0.0197	N/A	N/A	N/A	t
1469	\N	4	VICENTE	ALEMAN	0	N/A	N/A	N/A	0.0506	N/A	N/A	N/A	t
450	\N	PB	EINNA, C.A.	CONSTRUCTORA	0	N/A	N/A	N/A	0.0146	N/A	N/A	N/A	t
1487	\N	7	VINCENZO	FUSCO	0	N/A	N/A	N/A	0.0506	N/A	N/A	N/A	t
116	\N	5	ANDRES	AMELINCKX	0	N/A	N/A	N/A	0.0756	N/A	N/A	N/A	t
166	\N	5	ARMINDO	OLIVEIRA	0	N/A	N/A	N/A	0.0759	N/A	N/A	N/A	t
519	\N	2	FERNANDO	RENTERIA	0	N/A	N/A	N/A	0.0490	N/A	N/A	N/A	t
666	\N	3	IBRAHIN ALBERTO	ARTEAGA	0	N/A	N/A	N/A	0.0490	N/A	N/A	N/A	t
682	\N	3	INARCLE, C.A.	INMOBILIARIA	0	N/A	N/A	N/A	0.0505	N/A	N/A	N/A	t
746	\N	1	JAIME	ROSS	0	N/A	N/A	N/A	0.0505	N/A	N/A	N/A	t
788	\N	1	JOSE	FERNANDEZ	0	N/A	N/A	N/A	0.0490	N/A	N/A	N/A	t
929	\N	4	LOURDES HAYEK	DE CHACAL	0	N/A	N/A	N/A	0.0759	N/A	N/A	N/A	t
955	\N	1	LUIS G.	DUARTE	0	N/A	N/A	N/A	0.0505	N/A	N/A	N/A	t
1023	\N	2	MARIA ISABELLA	CIRIGLIANO	0	N/A	N/A	N/A	0.0490	N/A	N/A	N/A	t
1038	\N	2	MARICARMEN	GOMEZ	0	N/A	N/A	N/A	0.0505	N/A	N/A	N/A	t
1039	\N	3	MARICARMEN	GOMEZ	0	N/A	N/A	N/A	0.0505	N/A	N/A	N/A	t
1517	\N	2	YARITZA	SILVA	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A	t
1040	\N	4	MARICARMEN	GOMEZ	0	N/A	N/A	N/A	0.0490	N/A	N/A	N/A	t
1094	\N	3	MIGUEL	TRUNFIO TUDISCO	0	N/A	N/A	N/A	0.0490	N/A	N/A	N/A	t
1200	\N	4	PATRICIA	VEGAS	0	N/A	N/A	N/A	0.0756	N/A	N/A	N/A	t
1423	\N	4	TALINA	TAWID	0	N/A	N/A	N/A	0.0505	N/A	N/A	N/A	t
1438	\N	1	TIZIANO	BURGONI	0	N/A	N/A	N/A	0.0490	N/A	N/A	N/A	t
126	\N	5	ANGELA	DE CATANESE	0	N/A	N/A	N/A	0.0902	N/A	N/A	N/A	t
137	\N	2	ANTONIO	ANTOR	0	N/A	N/A	N/A	0.0877	N/A	N/A	N/A	t
169	\N	4	ARTURO	PUENTE	0	N/A	N/A	N/A	0.0877	N/A	N/A	N/A	t
298	\N	5	CARMEN S. DE LAYA Y	JOSE LAYA	0	N/A	N/A	N/A	0.0902	N/A	N/A	N/A	t
607	\N	PB	GONZALO	SANTANA LOPEZ	0	N/A	N/A	N/A	0.1182	N/A	N/A	N/A	t
624	\N	1	GUSTAVO	LOZADA V.	0	N/A	N/A	N/A	0.0877	N/A	N/A	N/A	t
626	\N	3	GUSTAVO	ORTIZ	0	N/A	N/A	N/A	0.0877	N/A	N/A	N/A	t
708	\N	3	INVERSIONES	GUARAVIVI, C.A.	0	N/A	N/A	N/A	0.0877	N/A	N/A	N/A	t
882	\N	1	LEIVA ZABALETA	ARMANDI LOZADA	0	N/A	N/A	N/A	0.0877	N/A	N/A	N/A	t
1029	\N	2	MARIA SINESI	RICHARD YARJOUR	0	N/A	N/A	N/A	0.0877	N/A	N/A	N/A	t
1142	\N	4	NICOLA	MORETTI	0	N/A	N/A	N/A	0.0877	N/A	N/A	N/A	t
109	\N	1	ANA KATINA	PINZON	0	N/A	N/A	N/A	0.0940	N/A	N/A	N/A	t
477	\N	3	ENRIQUE	LIBERATORE	0	N/A	N/A	N/A	0.0919	N/A	N/A	N/A	t
569	\N	1	GERARDO	CHACON	0	N/A	N/A	N/A	0.0905	N/A	N/A	N/A	t
689	\N	5	INGRID ORIHUELA	DE GONZALEZ	0	N/A	N/A	N/A	0.0870	N/A	N/A	N/A	t
820	\N	2	JOSE M. MONIZ	DE ABREU	0	N/A	N/A	N/A	0.0870	N/A	N/A	N/A	t
942	\N	2	LUIS	MAZZEI	0	N/A	N/A	N/A	0.0919	N/A	N/A	N/A	t
1031	\N	4	MARIA TERESA	VILLER DE TORRES	0	N/A	N/A	N/A	0.0919	N/A	N/A	N/A	t
1062	\N	4	MARTIN	RONDON	0	N/A	N/A	N/A	0.0870	N/A	N/A	N/A	t
1269	\N	PH	RAUL	HERNANDEZ	0	N/A	N/A	N/A	0.0940	N/A	N/A	N/A	t
1527	\N	3	YOLANDA	DE CONDERO	0	N/A	N/A	N/A	0.0870	N/A	N/A	N/A	t
10	\N	2	ACEVEDO	GUIOMAR	0	N/A	N/A	N/A	0.0324	N/A	N/A	N/A	t
68	\N	4	ALEXIS SANCHEZ Y	LUISA E. SANCHEZ	0	N/A	N/A	N/A	0.0324	N/A	N/A	N/A	t
225	\N	9	BORGES	ALBERTO	0	N/A	N/A	N/A	0.0324	N/A	N/A	N/A	t
375	\N	2	DA SILVA REIS	JOSE	0	N/A	N/A	N/A	0.0300	N/A	N/A	N/A	t
393	\N	5	DE CARMONA	CRISTINA	0	N/A	N/A	N/A	0.0324	N/A	N/A	N/A	t
397	\N	3	DE JORGES	LUISA	0	N/A	N/A	N/A	0.0300	N/A	N/A	N/A	t
398	\N	6	DE MALAVE	MARIA	0	N/A	N/A	N/A	0.0324	N/A	N/A	N/A	t
399	\N	4	DE OLIVEIRA	QUINTINO	0	N/A	N/A	N/A	0.0324	N/A	N/A	N/A	t
401	\N	10	DE RODERO	DORITA	0	N/A	N/A	N/A	0.0324	N/A	N/A	N/A	t
424	\N	9	DUGARTE	OLGA	0	N/A	N/A	N/A	0.0324	N/A	N/A	N/A	t
577	\N	4	GIMENEZ	CLIFFORD A.	0	N/A	N/A	N/A	0.0300	N/A	N/A	N/A	t
667	\N	7	IGLESIAS	JESUS	0	N/A	N/A	N/A	0.0324	N/A	N/A	N/A	t
968	\N	7	MADRIZ	GASTON	0	N/A	N/A	N/A	0.0300	N/A	N/A	N/A	t
1057	\N	10	MARQUEZ	CARLOS	0	N/A	N/A	N/A	0.0324	N/A	N/A	N/A	t
1071	\N	1	MATOS	ILSE	0	N/A	N/A	N/A	0.0324	N/A	N/A	N/A	t
1074	\N	5	MAURERA	JOSE	0	N/A	N/A	N/A	0.0324	N/A	N/A	N/A	t
1077	\N	10	MEDINA	EFRAIN	0	N/A	N/A	N/A	0.0300	N/A	N/A	N/A	t
1154	\N	1	NUï¿œEZ	MARIA	0	N/A	N/A	N/A	0.0324	N/A	N/A	N/A	t
1186	\N	3	PACHANO	JOSE	0	N/A	N/A	N/A	0.0324	N/A	N/A	N/A	t
1187	\N	6	PACHECO	JUAN	0	N/A	N/A	N/A	0.0324	N/A	N/A	N/A	t
1253	\N	6	RAMIREZ	JAVIER	0	N/A	N/A	N/A	0.0300	N/A	N/A	N/A	t
1273	\N	3	REAL	WERNER SAUL	0	N/A	N/A	N/A	0.0324	N/A	N/A	N/A	t
1321	\N	2	RODRIGUEZ	MANUEL	0	N/A	N/A	N/A	0.0324	N/A	N/A	N/A	t
1344	\N	8	ROSA YOLANDA	URBANO PIRRONGELLI	0	N/A	N/A	N/A	0.0300	N/A	N/A	N/A	t
479	\N	4	ENZO	TROMBETTA	0	N/A	N/A	N/A	0.0085	N/A	N/A	N/A	t
480	\N	1	ERIC J. PINT M./	ANGELA M. DAZA V.	0	N/A	N/A	N/A	0.0082	N/A	N/A	N/A	t
484	\N	1	ESPERANZA	GONZALEZ J.	0	N/A	N/A	N/A	0.0082	N/A	N/A	N/A	t
1358	\N	8	RUSSICA	SEBASTIAN	0	N/A	N/A	N/A	0.0324	N/A	N/A	N/A	t
1360	\N	7	SAAVEDRA	JUAN DOMINGO	0	N/A	N/A	N/A	0.0324	N/A	N/A	N/A	t
1443	\N	8	TORRES	MARLENE	0	N/A	N/A	N/A	0.0324	N/A	N/A	N/A	t
1482	\N	5	VIERA	JULIO	0	N/A	N/A	N/A	0.0300	N/A	N/A	N/A	t
1484	\N	9	VILLAFAï¿œE	MIRTHA	0	N/A	N/A	N/A	0.0300	N/A	N/A	N/A	t
1516	\N	1	YANI ALEXANDRA	SALTAPIDAS	0	N/A	N/A	N/A	0.0300	N/A	N/A	N/A	t
1535	\N	PH	ZAILETH	DIAZ	0	N/A	N/A	N/A	0.0575	N/A	N/A	N/A	t
11	\N	10	ACHS	GERARDO A.	0	N/A	N/A	N/A	0.0455	N/A	N/A	N/A	t
134	\N	7	ANTONELLA	GENOVESI	0	N/A	N/A	N/A	0.0455	N/A	N/A	N/A	t
181	\N	PH	BALASONE	ANTONIO	0	N/A	N/A	N/A	0.0816	N/A	N/A	N/A	t
190	\N	3	BARRAL Y SRA.	JAIME LOPEZ	0	N/A	N/A	N/A	0.0455	N/A	N/A	N/A	t
213	\N	1	BETANCOURT	FERNANDO	0	N/A	N/A	N/A	0.0455	N/A	N/A	N/A	t
221	\N	5	BLANCO GALINDEZ	ROSAURA ELISIA	0	N/A	N/A	N/A	0.0455	N/A	N/A	N/A	t
226	\N	9	BORGES	JORGE	0	N/A	N/A	N/A	0.0455	N/A	N/A	N/A	t
228	\N	2	BRACHO	LAURA	0	N/A	N/A	N/A	0.0455	N/A	N/A	N/A	t
255	\N	1	CANDIA CASTRO	RUBEN	0	N/A	N/A	N/A	0.0455	N/A	N/A	N/A	t
320	\N	6	CENTENO	CARMEN JULIETA	0	N/A	N/A	N/A	0.0455	N/A	N/A	N/A	t
347	\N	7	CIMARRO	ISAIAS B.	0	N/A	N/A	N/A	0.0455	N/A	N/A	N/A	t
390	\N	5	DE ACOSTA	ROSA G.	0	N/A	N/A	N/A	0.0455	N/A	N/A	N/A	t
392	\N	4	DE BOLIVAR	NANCY	0	N/A	N/A	N/A	0.0455	N/A	N/A	N/A	t
410	\N	PB	DEPOSITO	LOCAL	0	N/A	N/A	N/A	0.0080	N/A	N/A	N/A	t
132	\N	01	ANNIE  CAROLINA	RODRIGUEZ	0	N/A	N/A	N/A	0.0134	N/A	N/A	N/A	t
747	\N	04	JAIME	SERFATY	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A	t
755	\N	02	JESUS	BUSTAMANTE	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A	t
758	\N	11	JESUS	LIRA	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A	t
810	\N	PH	JOSE ANTONIO	PEREZ ALVAREZ	0	N/A	N/A	N/A	0.0342	N/A	N/A	N/A	t
816	\N	08	JOSE GILBERTO	HERNANDEZ BERNAL	0	N/A	N/A	N/A	0.0151	N/A	N/A	N/A	t
819	\N	03	JOSE LUIS	PEREIRA ROJAS	0	N/A	N/A	N/A	0.0151	N/A	N/A	N/A	t
959	\N	09	LUISA	RIVERO	0	N/A	N/A	N/A	0.0151	N/A	N/A	N/A	t
969	\N	02	MAGDA DE JESUS	RAMIREZ G.	0	N/A	N/A	N/A	0.0151	N/A	N/A	N/A	t
1061	\N	M	MARTIN	PEREZ PINAL	0	N/A	N/A	N/A	0.0568	N/A	N/A	N/A	t
1130	\N	04	NELLY	BERRIOS PEREZ	0	N/A	N/A	N/A	0.0151	N/A	N/A	N/A	t
1144	\N	09	NIDIA BEATRIZ	LAMEDA	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A	t
1258	\N	05	RAMIRO	RONDON	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A	t
1268	\N	07	RAUL	CHANDUVI	0	N/A	N/A	N/A	0.0151	N/A	N/A	N/A	t
1311	\N	03	ROBERTO IVAN	BOLAï¿œOS	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A	t
1522	\N	05	YENIFFER DEL CARMEN	VILLEGAS L.	0	N/A	N/A	N/A	0.0151	N/A	N/A	N/A	t
1533	\N	06	YURIMA JOSEFINA	PEREZ R.	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A	t
720	\N	04	INVERSORA	SAMARTAN S.R.L.	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A	t
642	\N	2	HERBERT	JORDAN	0	N/A	N/A	N/A	0.0085	N/A	N/A	N/A	t
805	\N	06	JOSE A. NOGUEIRAS	Y MANUELA N.	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A	t
925	\N	08	LOURDES	MONTANO	0	N/A	N/A	N/A	0.0151	N/A	N/A	N/A	t
983	\N	09	MARCEL PAZ	DUQUE LLOID	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A	t
1024	\N	10	MARIA JOSE	PEREZ SARMIENTO	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A	t
1027	\N	09	MARIA LUISA	PRIETO TORRES	0	N/A	N/A	N/A	0.0151	N/A	N/A	N/A	t
1054	\N	07	MARITZA	MARTINEZ D.	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A	t
1099	\N	06	MILKA SUAREZ /	DANIEL MORALES	0	N/A	N/A	N/A	0.0151	N/A	N/A	N/A	t
1171	\N	08	OMAR	LEIRA	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A	t
1313	\N	10	RODOLFO	RODRIGUEZ	0	N/A	N/A	N/A	0.0151	N/A	N/A	N/A	t
1329	\N	2	ROMAN	GONZALEZ	0	N/A	N/A	N/A	0.0086	N/A	N/A	N/A	t
1407	\N	05	SONIA	CORREA	0	N/A	N/A	N/A	0.0151	N/A	N/A	N/A	t
1461	\N	03	VANESSA CELLA /	IVAN DIAZ P.	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A	t
1476	\N	05	VICTOR	LOPEZ	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A	t
18	\N	1	ADRIAN JOSE	SANCHEZ PARRA	0	N/A	N/A	N/A	0.0114	N/A	N/A	N/A	t
35	\N	3	ALBERTO	BARADAT	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A	t
44	\N	1	ALBERTO J.	MARTINEZ JIMENEZ	0	N/A	N/A	N/A	0.0146	N/A	N/A	N/A	t
127	\N	2	ANGELA	FLORES DARIA	0	N/A	N/A	N/A	0.0214	N/A	N/A	N/A	t
131	\N	2	ANNA PAOLA	VASRELLI	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A	t
245	\N	PB	C.A.	VENGASEOSAS	0	N/A	N/A	N/A	0.0124	N/A	N/A	N/A	t
303	\N	2	CAROLINA ROMERO Y	JULIAN LASSER	0	N/A	N/A	N/A	0.0214	N/A	N/A	N/A	t
306	\N	2	CARRERO	RAFAEL	0	N/A	N/A	N/A	0.0114	N/A	N/A	N/A	t
382	\N	3	DANIEL	SALCEDO	0	N/A	N/A	N/A	0.0117	N/A	N/A	N/A	t
385	\N	4	DANILOR 2000, C.A.	INVERSIONES	0	N/A	N/A	N/A	0.0121	N/A	N/A	N/A	t
452	\N	2	ELEAZAR	YOUSEFF DIAZ	0	N/A	N/A	N/A	0.0146	N/A	N/A	N/A	t
502	\N	2	FANNY	LUCKERT B.	0	N/A	N/A	N/A	0.0146	N/A	N/A	N/A	t
503	\N	2	FEDERICO	MASSIMO	0	N/A	N/A	N/A	0.0017	N/A	N/A	N/A	t
504	\N	3	FEDERICO	MASSIMO	0	N/A	N/A	N/A	0.0015	N/A	N/A	N/A	t
571	\N	4	GERMAN	SPINOSI	0	N/A	N/A	N/A	0.0114	N/A	N/A	N/A	t
572	\N	4	GERMAN	SPINOSI	0	N/A	N/A	N/A	0.0146	N/A	N/A	N/A	t
579	\N	2	GIOVANNI	CAMELI	0	N/A	N/A	N/A	0.0121	N/A	N/A	N/A	t
660	\N	3	HUGO MIGUEL	CONCALVES	0	N/A	N/A	N/A	0.0146	N/A	N/A	N/A	t
695	\N	6	INV. LORENAVILA, C.A.	ANA M. LOZANO/	0	N/A	N/A	N/A	0.0012	N/A	N/A	N/A	t
696	\N	7	INV. LORENAVILA, C.A.	ANA M. LOZANO/	0	N/A	N/A	N/A	0.0012	N/A	N/A	N/A	t
727	\N	1	IRLY DE LOZANO	DARIO LOZANO/	0	N/A	N/A	N/A	0.0214	N/A	N/A	N/A	t
753	\N	PH	JESUC. DE S.U.D.	A.V. IGLESIA DE	0	N/A	N/A	N/A	0.0627	N/A	N/A	N/A	t
779	\N	1	JORGE LUIS	MANRIQUE CASTRO	0	N/A	N/A	N/A	0.0114	N/A	N/A	N/A	t
807	\N	1	JOSE ALBERTO	MELIAN TRUJILLO	0	N/A	N/A	N/A	0.0214	N/A	N/A	N/A	t
823	\N	3	JOSE PERFETTI	RHAIZA RON/	0	N/A	N/A	N/A	0.0214	N/A	N/A	N/A	t
851	\N	PB	JUHANA MANZANO	CHIC & WILD/	0	N/A	N/A	N/A	0.0214	N/A	N/A	N/A	t
855	\N	2	JULIAN LASSER	CAROLINA ROMERO/	0	N/A	N/A	N/A	0.0121	N/A	N/A	N/A	t
917	\N	PH	LORANAVILA, C.A.	INVERSIONES	0	N/A	N/A	N/A	0.0621	N/A	N/A	N/A	t
954	\N	3	LUIS ERNESTO	ALVARAY GONZALEZ	0	N/A	N/A	N/A	0.0121	N/A	N/A	N/A	t
965	\N	3	LUZ PAULINA	IBAï¿œEZ MAIRA	0	N/A	N/A	N/A	0.0214	N/A	N/A	N/A	t
980	\N	3	MANUEL MORENO	DARIO MORENO/	0	N/A	N/A	N/A	0.0114	N/A	N/A	N/A	t
1058	\N	3	MARTHA CORINA	FAZZINO BARBIERI	0	N/A	N/A	N/A	0.0149	N/A	N/A	N/A	t
1184	\N	3	PABLO	CHIROUZE	0	N/A	N/A	N/A	0.0146	N/A	N/A	N/A	t
1251	\N	2	RAIZA ELOISA	GARCIA YANEZ	0	N/A	N/A	N/A	0.0114	N/A	N/A	N/A	t
1275	\N	3	REBECA	FARIAS CASANOVA	0	N/A	N/A	N/A	0.0127	N/A	N/A	N/A	t
1291	\N	1	RICARDO	AZPURUA HENRIQUEZ	0	N/A	N/A	N/A	0.0146	N/A	N/A	N/A	t
1343	\N	3	ROSA DEL VALLE	MEZA ROMERO	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A	t
1380	\N	3	SARA FAJARDO DE	GUZMAN	0	N/A	N/A	N/A	0.0146	N/A	N/A	N/A	t
1385	\N	4	SAUL	CUEVAS	0	N/A	N/A	N/A	0.0019	N/A	N/A	N/A	t
1392	\N	4	SERGIO	SOLARINO	0	N/A	N/A	N/A	0.0149	N/A	N/A	N/A	t
1427	\N	4	TANIBO, C.A.	INVERSIONES	0	N/A	N/A	N/A	0.0124	N/A	N/A	N/A	t
1518	\N	2	YASMELI	MORENO	0	N/A	N/A	N/A	0.0146	N/A	N/A	N/A	t
1543	\N	4	ZUCORT 1995, C.A.	INVERSIONES	0	N/A	N/A	N/A	0.0146	N/A	N/A	N/A	t
1544	\N	4	ZUCORT 1995, C.A.	INVERSIONES	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A	t
1545	\N	4	ZUCORT 1995, C.A.	INVERSIONES	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A	t
1546	\N	4	ZUCORT 1995, C.A.	INVERSIONES	0	N/A	N/A	N/A	0.0146	N/A	N/A	N/A	t
15	\N	4	ADELINO	FIGUEIRA	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
19	\N	4	ADRIANA	AYALA	0	N/A	N/A	N/A	0.0083	N/A	N/A	N/A	t
21	\N	4	ADRIANA	DE SOLA	0	N/A	N/A	N/A	0.0096	N/A	N/A	N/A	t
49	\N	1	ALDRI	FRANCO	0	N/A	N/A	N/A	0.0087	N/A	N/A	N/A	t
53	\N	4	ALEJANDRO	AYALA	0	N/A	N/A	N/A	0.0149	N/A	N/A	N/A	t
64	\N	1	ALEXANDRO	BROCCO	0	N/A	N/A	N/A	0.0082	N/A	N/A	N/A	t
84	\N	3	ALONSO GARCIA	DE BLANES	0	N/A	N/A	N/A	0.0083	N/A	N/A	N/A	t
110	\N	1	ANA MARIA	RODRIGUEZ	0	N/A	N/A	N/A	0.0082	N/A	N/A	N/A	t
117	\N	4	ANDRES	CANELA	0	N/A	N/A	N/A	0.0161	N/A	N/A	N/A	t
202	\N	3	BELKYS PRIETO	ALEXANDER CORDERO Y	0	N/A	N/A	N/A	0.0083	N/A	N/A	N/A	t
230	\N	4	BRICCIA	ALVARADO	0	N/A	N/A	N/A	0.0096	N/A	N/A	N/A	t
283	\N	4	CARMELINA	VARANESE	0	N/A	N/A	N/A	0.0096	N/A	N/A	N/A	t
285	\N	2	CARMEN	CHANG	0	N/A	N/A	N/A	0.0082	N/A	N/A	N/A	t
297	\N	2	CARMEN ROSA	SILVA	0	N/A	N/A	N/A	0.0086	N/A	N/A	N/A	t
302	\N	2	CAROLINA	SANTANA	0	N/A	N/A	N/A	0.0102	N/A	N/A	N/A	t
304	\N	1	CAROLL E.	BAPTISTA R	0	N/A	N/A	N/A	0.0082	N/A	N/A	N/A	t
348	\N	1	CLAUDIA	BERTOU	0	N/A	N/A	N/A	0.0093	N/A	N/A	N/A	t
350	\N	4	CLAUDIA	MAIONE	0	N/A	N/A	N/A	0.0085	N/A	N/A	N/A	t
351	\N	4	CLAUDIA	MAIONE	0	N/A	N/A	N/A	0.0083	N/A	N/A	N/A	t
352	\N	3	CLAUDIA	REBECCHI	0	N/A	N/A	N/A	0.0096	N/A	N/A	N/A	t
379	\N	2	DALMIRO	GARDIE	0	N/A	N/A	N/A	0.0085	N/A	N/A	N/A	t
406	\N	1	DELIA	PEREZ	0	N/A	N/A	N/A	0.0081	N/A	N/A	N/A	t
437	\N	2	EDUARDO	BRICEï¿œO	0	N/A	N/A	N/A	0.0106	N/A	N/A	N/A	t
460	\N	2	ELIZABETH	PROCOPIO	0	N/A	N/A	N/A	0.0086	N/A	N/A	N/A	t
474	\N	3	ENRIQUE	FLORES	0	N/A	N/A	N/A	0.0149	N/A	N/A	N/A	t
476	\N	2	ENRIQUE	LA ROSA	0	N/A	N/A	N/A	0.0097	N/A	N/A	N/A	t
1050	\N	3	MARIO ALEJANDRO	ELIAS	0	N/A	N/A	N/A	0.0083	N/A	N/A	N/A	t
1052	\N	3	MARISOL	SANCHEZ	0	N/A	N/A	N/A	0.0094	N/A	N/A	N/A	t
1056	\N	2	MARLEN	FERNANDEZ	0	N/A	N/A	N/A	0.0096	N/A	N/A	N/A	t
1096	\N	1	MILAGROS	NEGRON	0	N/A	N/A	N/A	0.0081	N/A	N/A	N/A	t
1100	\N	1	MIMI	BUSTAMANTE	0	N/A	N/A	N/A	0.0085	N/A	N/A	N/A	t
1129	\N	2	NEILA	PEREZ	0	N/A	N/A	N/A	0.0086	N/A	N/A	N/A	t
1178	\N	1	OSMAN	VILORIA	0	N/A	N/A	N/A	0.0082	N/A	N/A	N/A	t
1183	\N	4	OTTO	LUDEWIG	0	N/A	N/A	N/A	0.0085	N/A	N/A	N/A	t
1223	\N	4	PILAR	GURDIAL	0	N/A	N/A	N/A	0.0083	N/A	N/A	N/A	t
1245	\N	4	RAFAEL JOSE	PACHECO MIRABAL	0	N/A	N/A	N/A	0.0085	N/A	N/A	N/A	t
1247	\N	2	RAFAEL Y ZULEIDA	RODRIGUEZ	0	N/A	N/A	N/A	0.0086	N/A	N/A	N/A	t
1248	\N	4	RAFAELLE	DE LEONARDIS	0	N/A	N/A	N/A	0.0085	N/A	N/A	N/A	t
1266	\N	3	RAQUEL	OVIEDO	0	N/A	N/A	N/A	0.0084	N/A	N/A	N/A	t
1281	\N	4	RENE	DIAZ	0	N/A	N/A	N/A	0.0096	N/A	N/A	N/A	t
1289	\N	3	RHANDY	PIï¿œERO	0	N/A	N/A	N/A	0.0083	N/A	N/A	N/A	t
1297	\N	3	RICARDO	MELENDES	0	N/A	N/A	N/A	0.0084	N/A	N/A	N/A	t
1315	\N	1	RODRIGO	TRONCOSO	0	N/A	N/A	N/A	0.0083	N/A	N/A	N/A	t
1352	\N	2	ROYSBELL	ANTUNES	0	N/A	N/A	N/A	0.0086	N/A	N/A	N/A	t
1353	\N	4	RUBEN	ASOREY	0	N/A	N/A	N/A	0.0085	N/A	N/A	N/A	t
1363	\N	3	SABRINA MUSSO	DE RON	0	N/A	N/A	N/A	0.0083	N/A	N/A	N/A	t
1405	\N	3	SOLGEMY ARENCIBIA	DE VILLORIA	0	N/A	N/A	N/A	0.0083	N/A	N/A	N/A	t
1425	\N	2	TAMARA	NOVIKOW	0	N/A	N/A	N/A	0.0085	N/A	N/A	N/A	t
1429	\N	3	TAYLOR Y NANCY	PEREZ	0	N/A	N/A	N/A	0.0083	N/A	N/A	N/A	t
1430	\N	3	TAYNE	GAMBOA	0	N/A	N/A	N/A	0.0161	N/A	N/A	N/A	t
1445	\N	4	TOWN HOUSE, C.A.	LOMA LINDA	0	N/A	N/A	N/A	0.0168	N/A	N/A	N/A	t
1446	\N	4	TOWN HOUSE, C.A.	LOMA LINDA	0	N/A	N/A	N/A	0.0168	N/A	N/A	N/A	t
1447	\N	4	TOWN HOUSE, C.A.	LOMA LINDA	0	N/A	N/A	N/A	0.0168	N/A	N/A	N/A	t
1448	\N	4	TOWN HOUSE, C.A.	LOMA LINDA	0	N/A	N/A	N/A	0.0168	N/A	N/A	N/A	t
1474	\N	1	VICTOR	ALVAREZ	0	N/A	N/A	N/A	0.0082	N/A	N/A	N/A	t
1489	\N	3	VITO	FUMAI	0	N/A	N/A	N/A	0.0084	N/A	N/A	N/A	t
1150	\N	14	NORELIS	ALCALA	0	N/A	N/A	N/A	0.0064	N/A	N/A	N/A	t
992	\N	41	MARIA	CAMACHO	0	N/A	N/A	N/A	0.0011	N/A	N/A	N/A	t
999	\N	40	MARIA	SULLY  BEAUJON	0	N/A	N/A	N/A	0.0003	N/A	N/A	N/A	t
1002	\N	P3	MARIA  AUGUSTA	DA  SILVA	0	N/A	N/A	N/A	0.0187	N/A	N/A	N/A	t
1081	\N	P0	MEKEL	ONAY	0	N/A	N/A	N/A	0.0100	N/A	N/A	N/A	t
1139	\N	P1	NETWORK 3000,C.A.	INVERSIONES	0	N/A	N/A	N/A	0.0120	N/A	N/A	N/A	t
1163	\N	M	OLGA	VILLNI  DE  CASTELLI	0	N/A	N/A	N/A	0.0125	N/A	N/A	N/A	t
1164	\N	M	OLGA	VILLNI  DE  CASTELLI	0	N/A	N/A	N/A	0.0117	N/A	N/A	N/A	t
1165	\N	N2	OLGA	VILLNI  DE  CASTELLI	0	N/A	N/A	N/A	0.0018	N/A	N/A	N/A	t
1166	\N	N2	OLGA	VILLNI  DE  CASTELLI	0	N/A	N/A	N/A	0.0030	N/A	N/A	N/A	t
1208	\N	M	PEDRO	UROSA  LOUD	0	N/A	N/A	N/A	0.0097	N/A	N/A	N/A	t
1231	\N	P1	PRIMO	DESIDERI  DE  GREGORIO	0	N/A	N/A	N/A	0.0082	N/A	N/A	N/A	t
719	\N	16	INVERSORA	GUINIMA	0	576-6842	N/A	N/A	0.0090	N/A	N/A	N/A	t
1382	\N	4	SARMIENTO	MARIANELA	0	N/A	N/A	N/A	0.0185	N/A	N/A	N/A	t
1488	\N	2	VINISIMO DE OLIM	MANUEL	0	N/A	N/A	N/A	0.0150	N/A	N/A	N/A	t
189	\N	1	BARAZARTE	REINALDO	0	N/A	N/A	N/A	0.0150	N/A	N/A	N/A	t
216	\N	6	BIDROS	TERSIAN	0	N/A	N/A	N/A	0.0198	N/A	N/A	N/A	t
242	\N	1	C.A.	AP23,	0	N/A	N/A	N/A	0.0186	N/A	N/A	N/A	t
372	\N	2	DA SILVA DE A.	HORACIO PEDRO	0	N/A	N/A	N/A	0.0185	N/A	N/A	N/A	t
595	\N	4	GOMEZ	ANTONIO RAFAEL	0	N/A	N/A	N/A	0.0186	N/A	N/A	N/A	t
600	\N	3	GONCALVES	DENNY	0	N/A	N/A	N/A	0.0185	N/A	N/A	N/A	t
866	\N	4	KARAM	HARRAKA	0	N/A	N/A	N/A	0.0150	N/A	N/A	N/A	t
931	\N	PH	LUCERO BIGOTT	TOMAS DARIO	0	N/A	N/A	N/A	0.0198	N/A	N/A	N/A	t
1128	\N	6	NAZARET A.	FEDERICO ANTONIO	0	N/A	N/A	N/A	0.0185	N/A	N/A	N/A	t
1218	\N	2	PEZZOLI	FABRICIO	0	N/A	N/A	N/A	0.0151	N/A	N/A	N/A	t
916	\N	4	LOPEZ RAMIREZ	TULIO	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
1226	\N	5	PITA CABRAL	JESUS ANTONIO	0	N/A	N/A	N/A	0.0186	N/A	N/A	N/A	t
1503	\N	3	WILMER O.	ANDUEZA MENDOZA	0	N/A	N/A	N/A	0.0084	N/A	N/A	N/A	t
1505	\N	4	Y JACQUELINE ALVES	WINSTON UJUETA	0	N/A	N/A	N/A	0.0096	N/A	N/A	N/A	t
1506	\N	4	Y LUIS BRICEï¿œO	TATIANA PEï¿œA A.	0	N/A	N/A	N/A	0.0085	N/A	N/A	N/A	t
1521	\N	3	YENIAN	VELASQUEZ	0	N/A	N/A	N/A	0.0083	N/A	N/A	N/A	t
1534	\N	4	YUSMARY	RODRIGUEZ	0	N/A	N/A	N/A	0.0085	N/A	N/A	N/A	t
157	\N	1	ARELIS	ROJAS	0	N/A	N/A	N/A	0.0299	N/A	N/A	N/A	t
196	\N	4	BEATRIZ	GIMENEZ	0	N/A	N/A	N/A	0.0299	N/A	N/A	N/A	t
219	\N	5	BLANCA	SILVA	0	N/A	N/A	N/A	0.0299	N/A	N/A	N/A	t
284	\N	7	CARMELO	BOLIVAR	0	N/A	N/A	N/A	0.0475	N/A	N/A	N/A	t
294	\N	7	CARMEN LEONOR	MATOS	0	N/A	N/A	N/A	0.0475	N/A	N/A	N/A	t
319	\N	8	CELESTINO	MURIEL LOPEZ	0	N/A	N/A	N/A	0.0475	N/A	N/A	N/A	t
368	\N	6	CRISTOBAL	BASTIDAS	0	N/A	N/A	N/A	0.0299	N/A	N/A	N/A	t
478	\N	6	ENRIQUE R.	ROJAS BASTARDO	0	N/A	N/A	N/A	0.0475	N/A	N/A	N/A	t
500	\N	5	FANNY	CHACON	0	N/A	N/A	N/A	0.0475	N/A	N/A	N/A	t
620	\N	4	GUILLERMO	HEILBOCK	0	N/A	N/A	N/A	0.0475	N/A	N/A	N/A	t
815	\N	1	JOSE G.	OTOLINO	0	N/A	N/A	N/A	0.0475	N/A	N/A	N/A	t
834	\N	2	JUAN	PASTOR MALAVE	0	N/A	N/A	N/A	0.0299	N/A	N/A	N/A	t
835	\N	3	JUAN	PASTOR MALAVE	0	N/A	N/A	N/A	0.0475	N/A	N/A	N/A	t
844	\N	2	JUAN CARLOS	SANCHEZ	0	N/A	N/A	N/A	0.0475	N/A	N/A	N/A	t
889	\N	8	LEONARDO	ALVAREZ TOLEDO	0	N/A	N/A	N/A	0.0299	N/A	N/A	N/A	t
909	\N	4	LILIANA V.	MANCHEGO ORTEGA	0	N/A	N/A	N/A	0.0475	N/A	N/A	N/A	t
933	\N	2	LUDIS DAYANA	PINO LUNA	0	N/A	N/A	N/A	0.0475	N/A	N/A	N/A	t
692	\N	16	INMOBILIARIA	TIDAN, C.A.	0	751-2447	N/A	N/A	0.0066	N/A	N/A	N/A	t
710	\N	4	INVERSIONES	NAR  307,  C.  A.	0	751-6979	N/A	N/A	0.0090	N/A	N/A	N/A	t
711	\N	11	INVERSIONES	PIGME	0	751-7520	N/A	N/A	0.0089	N/A	N/A	N/A	t
721	\N	9	INVERSORA  THAEL	B.B.M., C. A.	0	751-8738	N/A	N/A	0.0065	N/A	N/A	N/A	t
766	\N	6	JESUS A.	MORENO D.	0	753-4856	N/A	N/A	0.0066	N/A	N/A	N/A	t
780	\N	2	JORGE VALL Y	DAYSY DE VALL	0	242-0164; 242-0029	N/A	N/A	0.0063	N/A	N/A	N/A	t
794	\N	10	JOSE	REGUEIRA  REY	0	751-0301	N/A	N/A	0.0090	N/A	N/A	N/A	t
837	\N	10	JUAN	TRULLAS	0	751-0610	N/A	N/A	0.0065	N/A	N/A	N/A	t
857	\N	13	JULIO	MONAGAS	0	751-9839	N/A	N/A	0.0064	N/A	N/A	N/A	t
867	\N	7	KARIN  HAGGARD  Y	CRISTINA  HAGGARD	0	751-9450; 9032466	N/A	N/A	0.0065	N/A	N/A	N/A	t
907	\N	12	LILIAN	GUANCHEZ	0	751-7083 - 6392;  794-1617 - 0792	N/A	N/A	0.0090	N/A	N/A	N/A	t
948	\N	4	LUIS  BELTRAN	FARIAS	0	753-7663	N/A	N/A	0.0090	N/A	N/A	N/A	t
998	\N	6	MARIA	RIVERA  NOVO	0	753-9761;  753-1126	N/A	N/A	0.0089	N/A	N/A	N/A	t
1020	\N	2	MARIA EUGENIA	SILVA PAZ	0	754-0354	N/A	N/A	0.0062	N/A	N/A	N/A	t
1051	\N	10	MARISELA  J.	ISEA  DELGADO	0	753-2781	N/A	N/A	0.0064	N/A	N/A	N/A	t
1152	\N	12	NUVIA	QUINTANA	0	267-9103; 7876	N/A	N/A	0.0065	N/A	N/A	N/A	t
34	\N	4	ALBERTINA	AGUILERA	0	N/A	N/A	N/A	0.0114	N/A	N/A	N/A	t
1365	\N	10	SADAY	FELIBERT  GUTIERREZ	0	751-2637; 283-2015	N/A	N/A	0.0066	N/A	N/A	N/A	t
1431	\N	2	TECNO  ALINEACIï¿œN	NORIEGA	0	751-9396	N/A	N/A	0.0088	N/A	N/A	N/A	t
1478	\N	16	VICTOR  DAMASO  Y	ALICIA  DE	0	753-1126	N/A	N/A	0.0089	N/A	N/A	N/A	t
584	\N	2	GISELA ORTEGA	PILAR O. DE ORTEGA	0	N/A	N/A	N/A	0.0146	N/A	N/A	N/A	t
1528	\N	13	YOLANDA	FERMIN	0	751-6352; 751-2590; 975-6071	N/A	N/A	0.0063	N/A	N/A	N/A	t
739	\N	4	J.M. 52,  C.A.	DESARROLLOS	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A	t
740	\N	4	J.M. 52,  C.A.	DESARROLLOS	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A	t
1209	\N	02	PEDRO	VILLAROEL	0	271	N/A	N/A	0.0132	N/A	N/A	N/A	t
1326	\N	17	ROGELIO	DE  LA  NUEZ	0	271	N/A	N/A	0.0134	N/A	N/A	N/A	t
1330	\N	11	ROMAN EDUARDO	APITZ	0	271	N/A	N/A	0.0132	N/A	N/A	N/A	t
1386	\N	13	SCARLET HERNANDEZ	VICTORIA CONTRERAS	0	271	N/A	N/A	0.0134	N/A	N/A	N/A	t
1400	\N	10	SIMON	REYES	0	271	N/A	N/A	0.0134	N/A	N/A	N/A	t
1404	\N	12	SOBEIDA  COROMOTO	GARCIA  PEREIRA	0	271	N/A	N/A	0.0132	N/A	N/A	N/A	t
1413	\N	11	SOTERO	SEVILLANO	0	271	N/A	N/A	0.0134	N/A	N/A	N/A	t
1475	\N	18	VICTOR	DE  SANTIAGO	0	271	N/A	N/A	0.0134	N/A	N/A	N/A	t
1493	\N	14	WALDO	QUINTERO	0	271	N/A	N/A	0.0134	N/A	N/A	N/A	t
1501	\N	13	WILLIAN	FIFFE  Y  SRA.	0	271	N/A	N/A	0.0134	N/A	N/A	N/A	t
1526	\N	17	YMA	CARDONE	0	271	N/A	N/A	0.0132	N/A	N/A	N/A	t
1236	\N	10	QUEVEDO	RAUL	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
836	\N	11	JUAN	SAMPABLO ANDRES	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
843	\N	11	JUAN CARLOS	BENCOMO ARMAS	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
897	\N	4	LEONOR	ANDRADE RODRI	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
67	\N	13	ALEXIS JOSE	GONZALEZ	0	N/A	N/A	N/A	0.0066	N/A	N/A	N/A	t
971	\N	5	MAIGUALIDA	BARRERA	0	N/A	N/A	N/A	0.0475	N/A	N/A	N/A	t
1065	\N	8	MARY ANIURKA	FARIAS DIAZ	0	N/A	N/A	N/A	0.0475	N/A	N/A	N/A	t
1111	\N	3	MONTAï¿œO	GONZALEZ	0	N/A	N/A	N/A	0.0299	N/A	N/A	N/A	t
1112	\N	3	MONTAï¿œO	GONZALEZ	0	N/A	N/A	N/A	0.0475	N/A	N/A	N/A	t
1206	\N	6	PEDRO	RODRIGUEZ	0	N/A	N/A	N/A	0.0475	N/A	N/A	N/A	t
1244	\N	1	RAFAEL GONZALEZ Y	CLEMENTINA CAPRILES	0	N/A	N/A	N/A	0.0475	N/A	N/A	N/A	t
1260	\N	7	RAMON	PINO	0	N/A	N/A	N/A	0.0299	N/A	N/A	N/A	t
475	\N	1	ENRIQUE	GARCIA	0	N/A	N/A	N/A	0.0394	N/A	N/A	N/A	t
526	\N	1	FORTUNATO	BENACERRAF S.	0	N/A	N/A	N/A	0.0677	N/A	N/A	N/A	t
535	\N	1	FRANCISCO	JIMENEZ	0	N/A	N/A	N/A	0.0470	N/A	N/A	N/A	t
789	\N	1	JOSE	GONCALVES	0	N/A	N/A	N/A	0.0394	N/A	N/A	N/A	t
854	\N	1	JULIA MIREYA	SAIAS E.	0	N/A	N/A	N/A	0.0744	N/A	N/A	N/A	t
896	\N	1	LEONEL	ROJAS MORALES	0	N/A	N/A	N/A	0.0367	N/A	N/A	N/A	t
975	\N	1	MANUEL	FERNANDEZ	0	N/A	N/A	N/A	0.0331	N/A	N/A	N/A	t
1028	\N	1	MARIA M.	ROMERO	0	N/A	N/A	N/A	0.0276	N/A	N/A	N/A	t
1262	\N	1	RAMON RAMIREZ	GLORIA SUAREZ Y	0	N/A	N/A	N/A	0.0244	N/A	N/A	N/A	t
1395	\N	1	SETE C.	BENACERRAF S.	0	N/A	N/A	N/A	0.0744	N/A	N/A	N/A	t
1452	\N	1	UNIFORMES	VIRGEN DE FATIMA	0	N/A	N/A	N/A	0.0617	N/A	N/A	N/A	t
314	\N	1	CASULO	ADOLFO	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A	t
880	\N	9	LAYAS	JOSE MANUEL	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A	t
967	\N	9	MACHADO	CONNY	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A	t
1060	\N	11	MARTIN	FABIOLA	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A	t
1127	\N	PH	NATALE	DANIEL	0	N/A	N/A	N/A	0.0361	N/A	N/A	N/A	t
1155	\N	10	NUï¿œEZ	SERGIO CONESA	0	N/A	N/A	N/A	0.0228	N/A	N/A	N/A	t
1319	\N	10	RODRIGUEZ	ENMA	0	N/A	N/A	N/A	0.0216	N/A	N/A	N/A	t
1455	\N	11	USECHE	JOSE	0	N/A	N/A	N/A	0.0222	N/A	N/A	N/A	t
1059	\N	9	MARTIN	DASELYS	0	N/A	N/A	N/A	0.0216	N/A	N/A	N/A	t
1116	\N	3	MORENO	LUIS MARTINEZ	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A	t
1123	\N	8	NAHMENS	ANTONIO A.	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A	t
1157	\N	7	OCHOA	PEDRO M	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A	t
1252	\N	10	RAMIREZ	CRISTINA	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A	t
1328	\N	3	ROJAS	MARIA TERESA	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A	t
1357	\N	6	RUSSIAN	MARIA EUGENIS	0	N/A	N/A	N/A	0.0239	N/A	N/A	N/A	t
583	\N	01	GISELA	BOCCO	0	N/A	N/A	N/A	0.0132	N/A	N/A	N/A	t
1401	\N	1	SIMOSA ROSALES	ISAURA	0	N/A	N/A	N/A	0.0216	N/A	N/A	N/A	t
1414	\N	4	SOTO	RAFAEL GARRIDO	0	N/A	N/A	N/A	0.0233	N/A	N/A	N/A	t
1449	\N	11	TREZZA Y SRA.	PASQUALE A.	0	N/A	N/A	N/A	0.0220	N/A	N/A	N/A	t
1511	\N	7	Y SRA.	JORGE FLRES	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A	t
30	\N	6	AGUZZI DURAN	FABIOLA Y.	0	N/A	N/A	N/A	0.0952	N/A	N/A	N/A	t
101	\N	PH	AMOR	CARLOS	0	N/A	N/A	N/A	0.1428	N/A	N/A	N/A	t
1043	\N	10	MARILYN	DE SANTIAGO	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
1075	\N	15	MAURIZIO MARIO	MARCINO PREATO	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A	t
1156	\N	15	OBANDO	GUTIERREZ  PENSO	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A	t
1180	\N	6	OSWALDO	CARPIO	0	N/A	N/A	N/A	0.0064	N/A	N/A	N/A	t
1279	\N	4	RENATO	DE  CECCO	0	N/A	N/A	N/A	0.0065	N/A	N/A	N/A	t
1282	\N	14	REPRESENTACIONES	RUDY	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A	t
1307	\N	5	ROBERTO	MONTI  Y  SRA.	0	N/A	N/A	N/A	0.0065	N/A	N/A	N/A	t
1309	\N	11	ROBERTO	RODRIGUEZ	0	N/A	N/A	N/A	0.0066	N/A	N/A	N/A	t
1333	\N	13	ROMERO GUILLERMINA	VELASQUEZ LUIS	0	N/A	N/A	N/A	0.0065	N/A	N/A	N/A	t
1370	\N	13	SALVADOR	CUPELLO  OSORIO	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
1541	\N	5	ZOGHBI CARLES	BARBARA YOLANDA	0	N/A	N/A	N/A	0.0066	N/A	N/A	N/A	t
14	\N	10	ADELA.	PERDOMO VIZQUEL	0	N/A	N/A	N/A	0.0064	N/A	N/A	N/A	t
43	\N	13	ALBERTO CARLOS	CASTILLO	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
50	\N	6	ALEJANDRA	CORREA   DORTA	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
57	\N	7	ALEJANDRO BOADA	CAROLINA PAREDES	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A	t
69	\N	1	ALFONSO	ROBERTSA	0	N/A	N/A	N/A	0.0087	N/A	N/A	N/A	t
103	\N	13	ANA	MOLINA  PERALTA	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A	t
105	\N	2	ANA  CLAUDIA	TEIXEIRA  MATIZ	0	N/A	N/A	N/A	0.0088	N/A	N/A	N/A	t
135	\N	8	ANTONINA	MARRA	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A	t
140	\N	6	ANTONIO	CHONG  LAI	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
150	\N	2	ANTONIO  ENCARNACAO  DE	SA	0	N/A	N/A	N/A	0.0088	N/A	N/A	N/A	t
264	\N	11	CARLOS	CAPUTO	0	N/A	N/A	N/A	0.0064	N/A	N/A	N/A	t
152	\N	1	ANTONIO JOSE	CORTI SOSA	0	N/A	N/A	N/A	0.0088	N/A	N/A	N/A	t
176	\N	7	ATILIO D. VILLEGAS	JOHANA M.ARAQUE	0	N/A	N/A	N/A	0.0065	N/A	N/A	N/A	t
177	\N	5	AUGUSTO  MACARIO	CONTRERAS  MORENO	0	N/A	N/A	N/A	0.0064	N/A	N/A	N/A	t
185	\N	15	BANDA	BOCCNI  DE  PASCAZIO	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
204	\N	8	BELMIRO	DA COSTA	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
209	\N	12	BERNARD	CROSS	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
215	\N	15	BIBIANA A.	FENANDEZ CANELONES	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A	t
415	\N	8	DIOCELINA	MONTILLA  VILLALOBOS	0	N/A	N/A	N/A	0.0064	N/A	N/A	N/A	t
260	\N	12	CARLA	LUNA	0	N/A	N/A	N/A	0.0065	N/A	N/A	N/A	t
261	\N	13	CARLENA	MACHUCA OLIVO	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
265	\N	8	CARLOS	CARDENAS	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
268	\N	9	CARLOS	DUARTE	0	N/A	N/A	N/A	0.0064	N/A	N/A	N/A	t
274	\N	10	CARLOS  ROBERTO	ISAMIT  G.	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A	t
280	\N	5	CARLOS JULIO	VALBUENA GOMEZ	0	N/A	N/A	N/A	0.0066	N/A	N/A	N/A	t
289	\N	2	CARMEN  BEATRIZ	PEREZ  MARGOY	0	N/A	N/A	N/A	0.0062	N/A	N/A	N/A	t
290	\N	3	CARMEN  JASMIN	ZAVALA FIGUEROA	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A	t
295	\N	16	CARMEN LUISA	CALDERA	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A	t
299	\N	14	CARMEN SILVIA	CALDERON	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
321	\N	8	CESAR	ANDRADES	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A	t
363	\N	1	CORA	CHACON  DE  CONTRERAS	0	N/A	N/A	N/A	0.0062	N/A	N/A	N/A	t
383	\N	1	DANIEL  DAVID	GASPARRI  REY	0	N/A	N/A	N/A	0.0062	N/A	N/A	N/A	t
408	\N	15	DELIHANA  R.	CARRERO BURGOS	0	N/A	N/A	N/A	0.0065	N/A	N/A	N/A	t
421	\N	14	DORIS  INES	BLANCO	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A	t
431	\N	10	EDITA	OSORIO	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A	t
440	\N	16	EDUARDO   Y  EVE  DE	VALENZUELA	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A	t
453	\N	9	ELENA	VALERA	0	N/A	N/A	N/A	0.0065	N/A	N/A	N/A	t
454	\N	16	ELIANA INES	PEROZA VERGARA	0	N/A	N/A	N/A	0.0064	N/A	N/A	N/A	t
465	\N	4	ELSA ELISA	CICCONE D ANNUNZIO	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A	t
466	\N	16	EMIGDIO	GARCIA   ALFARO	0	N/A	N/A	N/A	0.0066	N/A	N/A	N/A	t
471	\N	3	ENDER	FALCON	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A	t
493	\N	15	EVE  DE	VALENZUELA	0	N/A	N/A	N/A	0.0064	N/A	N/A	N/A	t
524	\N	6	FLORINDA	AMAYA  S.	0	N/A	N/A	N/A	0.0064	N/A	N/A	N/A	t
529	\N	5	FRANCIA  JOSEFINA	TOVAR	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A	t
530	\N	12	FRANCIS C. ROSETE R.	ENRIQUE REINA L.	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A	t
531	\N	15	FRANCISCO	AROCHA	0	N/A	N/A	N/A	0.0066	N/A	N/A	N/A	t
538	\N	5	FRANCISCO  JOSE	HERNANDEZ	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
540	\N	16	FRANCISCO JOSE	SOLORZANO ARASME	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
566	\N	4	GENOVEVA	DE  CAJIAS	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A	t
573	\N	P	GERMAN  AVELINO	TORREALBA	0	N/A	N/A	N/A	0.0178	N/A	N/A	N/A	t
582	\N	3	GIRALUNA M.	RONDON N.	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A	t
589	\N	13	GLORIA	BONETT	0	N/A	N/A	N/A	0.0065	N/A	N/A	N/A	t
590	\N	10	GLORIA	CASTILLO	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
512	\N	4	FERNANDEZ MORENO	IMELDA YURAIMA	0	N/A	N/A	N/A	0.0455	N/A	N/A	N/A	t
520	\N	10	FIGLIULO A.	PASQUALE	0	N/A	N/A	N/A	0.0455	N/A	N/A	N/A	t
1084	\N	8	MENDEZ	CARLOS A.	0	N/A	N/A	N/A	0.0455	N/A	N/A	N/A	t
1141	\N	2	NICHOLS	MARIA	0	N/A	N/A	N/A	0.0455	N/A	N/A	N/A	t
1182	\N	3	OTERO	ZOILO	0	N/A	N/A	N/A	0.0455	N/A	N/A	N/A	t
1189	\N	9	PALMA P.	NORMAN A.	0	N/A	N/A	N/A	0.0455	N/A	N/A	N/A	t
1267	\N	8	RAQUEL DE M.	MANUEL MOREIRA  Y	0	N/A	N/A	N/A	0.0455	N/A	N/A	N/A	t
1415	\N	6	SOULAVY	OTTO K.	0	N/A	N/A	N/A	0.0455	N/A	N/A	N/A	t
312	\N	02	CASTILLO MORIN	MARY	0	N/A	N/A	N/A	0.2500	N/A	N/A	N/A	t
616	\N	01	GUARAPO RODRIGUEZ	ESMIRNA	0	N/A	N/A	N/A	0.2500	N/A	N/A	N/A	t
1194	\N	01	PARILLI	FERNANDO	0	N/A	N/A	N/A	0.2500	N/A	N/A	N/A	t
1432	\N	02	TELLEZ	LEONARDO Y ROXANA	0	N/A	N/A	N/A	0.2500	N/A	N/A	N/A	t
47	\N	10	ALCIRA	RAMIREZ ZAMBRANO	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A	t
90	\N	01	ALVARO	RUIZ	0	N/A	N/A	N/A	0.0262	N/A	N/A	N/A	t
118	\N	06	ANDRES	FERNANDEZ	0	N/A	N/A	N/A	0.0151	N/A	N/A	N/A	t
122	\N	08	ANGEL	CID BOUZAS	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A	t
469	\N	01	EMIRO	PEREZ	0	N/A	N/A	N/A	0.0151	N/A	N/A	N/A	t
516	\N	10	FERNANDO	DOS SANTOS	0	N/A	N/A	N/A	0.0151	N/A	N/A	N/A	t
536	\N	11	FRANCISCO	VELAZQUEZ	0	N/A	N/A	N/A	0.0151	N/A	N/A	N/A	t
555	\N	07	GABRIELA O.	MATHEUS C.	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A	t
409	\N	2	DENIZA ELENA	GOTTO	0	N/A	N/A	N/A	0.0211	N/A	N/A	N/A	t
418	\N	1	DOLORES Z DE DORTA	SILFREDO DORTA /	0	N/A	N/A	N/A	0.0124	N/A	N/A	N/A	t
428	\N	1	EDGAR	VIVAS	0	N/A	N/A	N/A	0.0124	N/A	N/A	N/A	t
515	\N	1	FERNANDO	DA COSTA	0	N/A	N/A	N/A	0.0086	N/A	N/A	N/A	t
518	\N	4	FERNANDO	GIL	0	N/A	N/A	N/A	0.0085	N/A	N/A	N/A	t
534	\N	3	FRANCISCO	GONZALEZ	0	N/A	N/A	N/A	0.0083	N/A	N/A	N/A	t
542	\N	1	FRANCO	CAPRILI	0	N/A	N/A	N/A	0.0085	N/A	N/A	N/A	t
612	\N	4	GRIDELIDIA	HIDALGO Y.	0	N/A	N/A	N/A	0.0096	N/A	N/A	N/A	t
632	\N	2	HECTOR	ANGARITA	0	N/A	N/A	N/A	0.0086	N/A	N/A	N/A	t
726	\N	4	IRIS COROMOTO	DELGADO	0	N/A	N/A	N/A	0.0146	N/A	N/A	N/A	t
806	\N	3	JOSE ABREU Y	LUCY DE ABREU	0	N/A	N/A	N/A	0.0154	N/A	N/A	N/A	t
614	\N	2	GUADALUPE	MARQUEZ	0	N/A	N/A	N/A	0.0082	N/A	N/A	N/A	t
619	\N	2	GUILLERMO	BEATRIZ	0	N/A	N/A	N/A	0.0087	N/A	N/A	N/A	t
625	\N	4	GUSTAVO	MARTINEZ	0	N/A	N/A	N/A	0.0085	N/A	N/A	N/A	t
654	\N	4	HORACIO	DE ABREU	0	N/A	N/A	N/A	0.0096	N/A	N/A	N/A	t
728	\N	2	ISAIAS Y ADRIANA	MARCANO	0	N/A	N/A	N/A	0.0087	N/A	N/A	N/A	t
751	\N	3	JEAN JACK	SIMON	0	N/A	N/A	N/A	0.0084	N/A	N/A	N/A	t
756	\N	3	JESUS	FRANCHESCI	0	N/A	N/A	N/A	0.0095	N/A	N/A	N/A	t
772	\N	4	JOEL	GASCON	0	N/A	N/A	N/A	0.0096	N/A	N/A	N/A	t
776	\N	3	JORGE	BORGES	0	N/A	N/A	N/A	0.0083	N/A	N/A	N/A	t
786	\N	4	JOSE	DE FREITAS	0	N/A	N/A	N/A	0.0085	N/A	N/A	N/A	t
808	\N	2	JOSE ALBERTO	RODRIGUEZ	0	N/A	N/A	N/A	0.0086	N/A	N/A	N/A	t
824	\N	3	JOSE ROURA	FLORENTINA SECONDULFO	0	N/A	N/A	N/A	0.0083	N/A	N/A	N/A	t
856	\N	2	JULIO	BORREGALES	0	N/A	N/A	N/A	0.0085	N/A	N/A	N/A	t
898	\N	3	LEOPOLDO	JIMENEZ	0	N/A	N/A	N/A	0.0083	N/A	N/A	N/A	t
902	\N	1	LEYDA ROJAS	DE RIOS	0	N/A	N/A	N/A	0.0093	N/A	N/A	N/A	t
924	\N	4	LOURDES	DIEZ	0	N/A	N/A	N/A	0.0085	N/A	N/A	N/A	t
939	\N	4	LUIS	GONCALVES	0	N/A	N/A	N/A	0.0096	N/A	N/A	N/A	t
960	\N	4	LUISA ELENA	RIANII ARMAS	0	N/A	N/A	N/A	0.0083	N/A	N/A	N/A	t
964	\N	3	LUZ	BOTERO	0	N/A	N/A	N/A	0.0083	N/A	N/A	N/A	t
978	\N	4	MANUEL	RODRIGUEZ PITA	0	N/A	N/A	N/A	0.0096	N/A	N/A	N/A	t
982	\N	3	MARBIOLIS RORAIMA	PEREZ	0	N/A	N/A	N/A	0.0084	N/A	N/A	N/A	t
986	\N	3	MARCOS	GORDON	0	N/A	N/A	N/A	0.0084	N/A	N/A	N/A	t
988	\N	4	MARGARITA	GARCIA	0	N/A	N/A	N/A	0.0096	N/A	N/A	N/A	t
1010	\N	3	MARIA ANTONIETA	FERRARI	0	N/A	N/A	N/A	0.0156	N/A	N/A	N/A	t
1017	\N	4	MARIA DEL CARMEN	SANCHEZ	0	N/A	N/A	N/A	0.0096	N/A	N/A	N/A	t
1019	\N	4	MARIA ELENA	IZAGUIRRE	0	N/A	N/A	N/A	0.0085	N/A	N/A	N/A	t
1034	\N	4	MARIANELLA	TOZZI	0	N/A	N/A	N/A	0.0096	N/A	N/A	N/A	t
1338	\N	4	ROOSEVELT	VELASQUEZ	0	N/A	N/A	N/A	0.0165	N/A	N/A	N/A	t
1347	\N	4	ROSANELLA	PIOVESAN	0	N/A	N/A	N/A	0.0083	N/A	N/A	N/A	t
492	\N	4	EVA, C.A.	CORPORACION	0	N/A	N/A	N/A	0.0952	N/A	N/A	N/A	t
826	\N	11	JOSEPH	CHEHWARO	0	039-255113	N/A	N/A	0.0090	N/A	N/A	N/A	t
564	\N	9	GASIOLA	INVERSIONES	0	N/A	N/A	N/A	0.0952	N/A	N/A	N/A	t
655	\N	1	HORTENCIA	GUERRERO	0	N/A	N/A	N/A	0.0952	N/A	N/A	N/A	t
770	\N	3	JOCARSOI 157, C.A.	INVERSIONES	0	N/A	N/A	N/A	0.0952	N/A	N/A	N/A	t
781	\N	8	JOSE	ALMOSNY	0	N/A	N/A	N/A	0.0952	N/A	N/A	N/A	t
318	\N	5	CELESTE A.	YANNARELLA  G.	0	753-7973;  563-2847	N/A	N/A	0.0089	N/A	N/A	N/A	t
861	\N	2	JULIO CESAR	DIAZ G.	0	N/A	N/A	N/A	0.0952	N/A	N/A	N/A	t
414	\N	4	DILIA MARIA	MARQUEZ  ALVARAY	0	751-5840	N/A	N/A	0.0064	N/A	N/A	N/A	t
1124	\N	7	NAHON	JOS	0	N/A	N/A	N/A	0.0952	N/A	N/A	N/A	t
1479	\N	5	VIDEOACUARIO.COM	VENTAS@	0	N/A	N/A	N/A	0.0952	N/A	N/A	N/A	t
458	\N	14	ELIZABETH	DE BOZIK LOPEZ	0	751-8639	N/A	N/A	0.0064	N/A	N/A	N/A	t
257	\N	1	CARDENAS	SUCESION	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
489	\N	4	EUCARIO	CONTRERAS	0	945-1106	N/A	N/A	0.0089	N/A	N/A	N/A	t
511	\N	15	FERMIN  RAMILO	CARBALLIDO	0	761-3602;  762-6476	N/A	N/A	0.0063	N/A	N/A	N/A	t
541	\N	8	FRANCISCO MORENO Y	NATALIA SCORZA	0	263-5673	N/A	N/A	0.0064	N/A	N/A	N/A	t
684	\N	1	INES	GRANADO	0	962-1331	016-6-078980	N/A	0.0088	N/A	N/A	N/A	t
662	\N	4	HUMBERTO  GIONNI	ARMILLEI	0	753-0342;  086-7582121	N/A	N/A	0.0089	N/A	N/A	N/A	t
714	\N	10	INVERSIONES	ROMELA	0	575-0713	N/A	N/A	0.0089	N/A	N/A	N/A	t
256	\N	1	CAPRILES PEï¿œALOZA	RAUL	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
629	\N	4	GUSTAVO ADOLFO	RODRIGUEZ	0	N/A	N/A	N/A	0.0066	N/A	N/A	N/A	t
130	\N	8	ANKE	VON  ROSENBERG	0	N/A	N/A	N/A	0.0065	N/A	N/A	N/A	t
547	\N	3	FREDDY	DE  LA  TORRE	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
635	\N	12	HECTOR	LUCENA	0	N/A	N/A	N/A	0.0064	N/A	N/A	N/A	t
643	\N	9	HERMAN  A.	RODRIGUEZ	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A	t
661	\N	1	HUGO Y MADALY	SATURNO	0	N/A	N/A	N/A	0.0062	N/A	N/A	N/A	t
606	\N	7	GONZALO	GONZALEZ	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A	t
615	\N	5	GUADALUPE	PEREIRA	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A	t
637	\N	11	HEIDY MERCEDES	GHERSI F.	0	N/A	N/A	N/A	0.0064	N/A	N/A	N/A	t
638	\N	6	HEIDY VIRGINIA	TOUSSAINT  MARCANO	0	N/A	N/A	N/A	0.0065	N/A	N/A	N/A	t
686	\N	13	INGRID	MONTERO  .	0	N/A	N/A	N/A	0.0064	N/A	N/A	N/A	t
697	\N	16	INVERSIONES	26,03,96, C.A.	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
707	\N	6	INVERSIONES	GINIMA	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A	t
712	\N	3	INVERSIONES	RAFELLI,  C.  A.	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
713	\N	14	INVERSIONES	RAPHORO	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A	t
729	\N	1	ISIDRO	ZEA  THOMPSON	0	N/A	N/A	N/A	0.0062	N/A	N/A	N/A	t
734	\N	12	IVAN	PRADO	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A	t
735	\N	4	IVAN  OCTAVIO	MARQUEZ	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A	t
752	\N	12	JENNY	BELIZ	0	N/A	N/A	N/A	0.0064	N/A	N/A	N/A	t
762	\N	12	JESUS	SULBARAN	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A	t
784	\N	9	JOSE	CASTIï¿œEIRA	0	N/A	N/A	N/A	0.0066	N/A	N/A	N/A	t
790	\N	11	JOSE	MARCANO	0	N/A	N/A	N/A	0.0065	N/A	N/A	N/A	t
800	\N	9	JOSE  ANGEL	CARRASCO  VALLES	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A	t
801	\N	3	JOSE  ENRIQUE	GONZALEZ  DIAZ	0	N/A	N/A	N/A	0.0064	N/A	N/A	N/A	t
742	\N	7	J0SMAR	GUTIERREZ  REYES	0	751-7658;  751-8753; 751-3742	0142068780	N/A	0.0090	N/A	N/A	N/A	t
869	\N	16	KARINA ROSSMIL	PEREIRA SANZ	0	N/A	N/A	N/A	0.0065	N/A	N/A	N/A	t
886	\N	11	LEON	AMELINCKX	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
892	\N	10	LEONARDO	RAMOS ROJAS	0	N/A	N/A	N/A	0.0066	N/A	N/A	N/A	t
893	\N	1	LEONARDO  JOSE	NUï¿œEZ	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A	t
904	\N	7	LIBERATA  DE	VAN  DOORN	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
868	\N	13	KARINA	HEIGH	0	753-0730	014-9-174625	N/A	0.0090	N/A	N/A	N/A	t
905	\N	5	LIGIA  DEL  R.	ROVIRA  FERREIRA	0	N/A	N/A	N/A	0.0065	N/A	N/A	N/A	t
937	\N	11	LUIS	COLMENARES	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A	t
940	\N	3	LUIS	HERNANDEZ	0	N/A	N/A	N/A	0.0066	N/A	N/A	N/A	t
941	\N	4	LUIS	MALAVE	0	N/A	N/A	N/A	0.0064	N/A	N/A	N/A	t
950	\N	11	LUIS  F.	MATURANA GONZALEZ	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A	t
966	\N	1	LYLIAN  I.	CAICEDO	0	N/A	N/A	N/A	0.0087	N/A	N/A	N/A	t
985	\N	12	MARCELINO	MARTINEZ  REY	0	N/A	N/A	N/A	0.0066	N/A	N/A	N/A	t
987	\N	14	MARCOS	ZAIDMAN	0	N/A	N/A	N/A	0.0065	N/A	N/A	N/A	t
995	\N	9	MARIA	FUENMAYOR	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A	t
997	\N	10	MARIA	MOREJON	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A	t
1001	\N	3	MARIA  ANTONIETA	D' ARMATA	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
1005	\N	4	MARIA  ESPERANZA	CORREA  R.	0	N/A	N/A	N/A	0.0065	N/A	N/A	N/A	t
1018	\N	6	MARIA DEL PILAR	SANCHEZ R.	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A	t
1022	\N	13	MARIA GABRIELA	ARANGUREN  MONZON	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A	t
1047	\N	5	MARIO	GUARIGLIA PACE	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
1049	\N	3	MARIO	RINALDI	0	N/A	N/A	N/A	0.0065	N/A	N/A	N/A	t
1053	\N	2	MARITZA	ESCALONA	0	N/A	N/A	N/A	0.0062	N/A	N/A	N/A	t
1092	\N	13	MIGUEL	CONTRERAS	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A	t
1098	\N	8	MILENA	LAJUSTICIA  LEPIANI	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A	t
1102	\N	7	MIREYA	LOPEZ	0	N/A	N/A	N/A	0.0064	N/A	N/A	N/A	t
715	\N	8	INVERSIONES	YANONI,  C. A.	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A	t
1131	\N	14	NELLY	DARIAS  DE  TORRES	0	N/A	N/A	N/A	0.0066	N/A	N/A	N/A	t
1136	\N	15	NELSON JESUS	REQUIS SAYAGO	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A	t
1151	\N	16	NORMA	SANDERS	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A	t
1177	\N	9	OSIRIS	AGUILERA	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
1207	\N	15	PEDRO	SANCHEZ	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A	t
1210	\N	7	PEDRO  A. MATIAS Y	HAIDEE C. DE MATIAS	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A	t
1221	\N	8	PIETRO	IMBRENDA	0	N/A	N/A	N/A	0.0065	N/A	N/A	N/A	t
1240	\N	11	RAFAEL	SILVA	0	N/A	N/A	N/A	0.0066	N/A	N/A	N/A	t
1261	\N	4	RAMON	VEGA	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
1276	\N	14	REINA	BENZADON	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A	t
1292	\N	4	RICARDO	BOSIO	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
1298	\N	1	RICARDO	RODRIGUEZ	0	N/A	N/A	N/A	0.0088	N/A	N/A	N/A	t
1300	\N	10	RICARDO ALBERTO	ALEZONES	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
1302	\N	12	RICHARD	GONZALEZ	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
1310	\N	14	ROBERTO	VERGARA  MARQUEZ	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
1316	\N	2	RODRIGO G. BELISARIO P.	DANAYI G. FIGUERA P. Y	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A	t
1340	\N	2	ROSA  MARY	BUERGO  SUAREZ	0	N/A	N/A	N/A	0.0087	N/A	N/A	N/A	t
1362	\N	5	SABRINA CADETTO I	ELSA DE CADETTO	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A	t
1369	\N	8	SALVADOR	CONSTANZA	0	N/A	N/A	N/A	0.0066	N/A	N/A	N/A	t
1384	\N	9	SASKIA	SANCHEZ	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
1421	\N	2	SUSANA	HERRERA	0	N/A	N/A	N/A	0.0087	N/A	N/A	N/A	t
1433	\N	13	TENERIA	DOS  LEONES  C. A.	0	N/A	N/A	N/A	0.0066	N/A	N/A	N/A	t
1450	\N	7	TRINA  F.	OSORIO U.	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
1472	\N	10	VICENTE   JULIO	VERA  MUï¿œOZ	0	N/A	N/A	N/A	0.0065	N/A	N/A	N/A	t
1477	\N	9	VICTOR	RODRIGUEZ  A.	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A	t
1480	\N	7	VIDRIS	RODRIGUEZ	0	N/A	N/A	N/A	0.0066	N/A	N/A	N/A	t
32	\N	5	ALBA NANCO	VERONICA	0	60	N/A	N/A	0.0046	N/A	N/A	N/A	t
56	\N	2	ALEJANDRO ABA	JOSE CRISTIAN	0	1	N/A	N/A	0.0067	N/A	N/A	N/A	t
86	\N	3	ALVARADO	ANA	0	1	N/A	N/A	0.0087	N/A	N/A	N/A	t
87	\N	6	ALVARADO P.	JAVIER ANDRES	0	62	N/A	N/A	0.0123	N/A	N/A	N/A	t
1491	\N	16	VLADIMIRO	GUERRINI   CONTE	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A	t
1514	\N	15	YAJAIRA  ZULAY	ORTEGA  GOMEZ	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
1537	\N	4	ZAMARYS	MARCANO	0	N/A	N/A	N/A	0.0066	N/A	N/A	N/A	t
1542	\N	6	ZORAIDA	GONZALEZ MARICHE	0	N/A	N/A	N/A	0.0066	N/A	N/A	N/A	t
24	\N	P0	AGENTES ADUANALES, C.A.	GREYMAR	0	N/A	N/A	N/A	0.0163	N/A	N/A	N/A	t
75	\N	M	ALFREDO	MARANDO  FALCIGLIA	0	N/A	N/A	N/A	0.0207	N/A	N/A	N/A	t
76	\N	B0	ALFREDO	MARANDO  FALCIGLIA	0	N/A	N/A	N/A	0.0280	N/A	N/A	N/A	t
77	\N	B0	ALFREDO	MARANDO  FALCIGLIA	0	N/A	N/A	N/A	0.0357	N/A	N/A	N/A	t
78	\N	P1	ALFREDO	MARANDO  FALCIGLIA	0	N/A	N/A	N/A	0.0159	N/A	N/A	N/A	t
79	\N	P0	ALFREDO	MARANDO  FALCIGLIA	0	N/A	N/A	N/A	0.0109	N/A	N/A	N/A	t
80	\N	P0	ALFREDO	MARANDO FALCIGLIA	0	N/A	N/A	N/A	0.0132	N/A	N/A	N/A	t
144	\N	P2	ANTONIO	PEï¿œALVER	0	N/A	N/A	N/A	0.0097	N/A	N/A	N/A	t
174	\N	P2	ATEMA	ACADEMIA TEC.AUTOMOTRIZ	0	N/A	N/A	N/A	0.0130	N/A	N/A	N/A	t
175	\N	P1	ATILIO	PIETROBONO	0	N/A	N/A	N/A	0.0100	N/A	N/A	N/A	t
184	\N	B0	BANCO  MERCANTIL	C.A.S.A.C.A.	0	N/A	N/A	N/A	0.1023	N/A	N/A	N/A	t
187	\N	B0	BANPLUS	E.A.P. C.A.	0	N/A	N/A	N/A	0.0172	N/A	N/A	N/A	t
188	\N	B0	BANPLUS	E.A.P. C.A.	0	N/A	N/A	N/A	0.0163	N/A	N/A	N/A	t
266	\N	41	CARLOS	CARDENAS	0	N/A	N/A	N/A	0.0011	N/A	N/A	N/A	t
357	\N	P0	CONCETTA	CONTINO  DE  CONSTANZA	0	N/A	N/A	N/A	0.0128	N/A	N/A	N/A	t
360	\N	P2	CONSTRUCCIONES	1958	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
361	\N	P3	CONSTRUCCIONES	1958	0	N/A	N/A	N/A	0.0176	N/A	N/A	N/A	t
432	\N	M	EDITA	OSORIO  C.	0	N/A	N/A	N/A	0.0106	N/A	N/A	N/A	t
434	\N	40	EDMUNDO	VIEIRA  DE  M.	0	N/A	N/A	N/A	0.0002	N/A	N/A	N/A	t
464	\N	40	ELSA	VILLALOBOS  VELASCO	0	N/A	N/A	N/A	0.0003	N/A	N/A	N/A	t
388	\N	4	DE A.	INOCENCIO LOFRUMENTO	0	1	N/A	N/A	0.0067	N/A	N/A	N/A	t
389	\N	2	DE ABREU SOUSA	JEFFERDON J.	0	1	N/A	N/A	0.0083	N/A	N/A	N/A	t
391	\N	3	DE AGUIRRE	CORINA IRAGORRY	0	1	N/A	N/A	0.0046	N/A	N/A	N/A	t
404	\N	3	DEGWITZ	ALEJANDRO	0	1	N/A	N/A	0.0067	N/A	N/A	N/A	t
495	\N	40	EVELYN	LOPEZ	0	N/A	N/A	N/A	0.0002	N/A	N/A	N/A	t
508	\N	41	FELIX	CARAPAICA	0	N/A	N/A	N/A	0.0008	N/A	N/A	N/A	t
532	\N	P3	FRANCISCO	BAEZA	0	N/A	N/A	N/A	0.0139	N/A	N/A	N/A	t
585	\N	P2	GIUSEPPE	BELLANCA  MICELI	0	N/A	N/A	N/A	0.0186	N/A	N/A	N/A	t
656	\N	P2	HUGO	NEGRETE	0	N/A	N/A	N/A	0.0154	N/A	N/A	N/A	t
672	\N	N2	ILERJU	S.A.	0	N/A	N/A	N/A	0.0037	N/A	N/A	N/A	t
673	\N	DE	ILERJU,	S.A.	0	N/A	N/A	N/A	0.0018	N/A	N/A	N/A	t
675	\N	N2	ILERJU,	S.A.	0	N/A	N/A	N/A	0.0030	N/A	N/A	N/A	t
676	\N	N2	ILERJU,	S.A.	0	N/A	N/A	N/A	0.0016	N/A	N/A	N/A	t
677	\N	N2	ILERJU,	S.A.	0	N/A	N/A	N/A	0.0018	N/A	N/A	N/A	t
678	\N	N2	ILERJU,	S.A.	0	N/A	N/A	N/A	0.0016	N/A	N/A	N/A	t
679	\N	O	ILERJU,	S.A.	0	N/A	N/A	N/A	0.0120	N/A	N/A	N/A	t
693	\N	P2	INMOBILIARIA  101,	C.A.	0	N/A	N/A	N/A	0.0125	N/A	N/A	N/A	t
694	\N	P0	INMUEBLES  106	C.A.	0	N/A	N/A	N/A	0.0117	N/A	N/A	N/A	t
698	\N	P3	INVERSIONES	8.892.087  C.  A.	0	N/A	N/A	N/A	0.0117	N/A	N/A	N/A	t
699	\N	P3	INVERSIONES	8.892.087  C.  A.	0	N/A	N/A	N/A	0.0200	N/A	N/A	N/A	t
700	\N	P3	INVERSIONES	8.892.087  C.  A.	0	N/A	N/A	N/A	0.0122	N/A	N/A	N/A	t
701	\N	P4	INVERSIONES	8.892.087  C.  A.	0	N/A	N/A	N/A	0.0073	N/A	N/A	N/A	t
702	\N	P4	INVERSIONES	8.892.087  C.  A.	0	N/A	N/A	N/A	0.0071	N/A	N/A	N/A	t
703	\N	P4	INVERSIONES	8.892.087  C.  A.	0	N/A	N/A	N/A	0.0194	N/A	N/A	N/A	t
704	\N	P3	INVERSIONES	8.892.087  C.  A..	0	N/A	N/A	N/A	0.0138	N/A	N/A	N/A	t
705	\N	M	INVERSIONES	CANIA	0	N/A	N/A	N/A	0.0106	N/A	N/A	N/A	t
709	\N	P2	INVERSIONES	GUIEN	0	N/A	N/A	N/A	0.0125	N/A	N/A	N/A	t
716	\N	P1	INVERSIONES  DOLAFRI,	C.A.	0	N/A	N/A	N/A	0.0100	N/A	N/A	N/A	t
717	\N	P1	INVERSIONES  DOLAFRI,	C.A.	0	N/A	N/A	N/A	0.0100	N/A	N/A	N/A	t
732	\N	P2	IVAN	FEO  GARCIA  Y  SRA	0	N/A	N/A	N/A	0.0128	N/A	N/A	N/A	t
738	\N	P1	J. FERNADEZ	M.  ABREU	0	N/A	N/A	N/A	0.0106	N/A	N/A	N/A	t
802	\N	P4	JOSE  ROMERO  Y  NIEVESA	DE  ROMERO	0	N/A	N/A	N/A	0.0085	N/A	N/A	N/A	t
859	\N	40	JULIO	POMBO	0	N/A	N/A	N/A	0.0002	N/A	N/A	N/A	t
883	\N	P3	LENCERIAS  CRISTAL  II	C.  A.	0	N/A	N/A	N/A	0.0181	N/A	N/A	N/A	t
903	\N	40	LIBERATA	RUSCITTI  DE  VAN  DOORN	0	N/A	N/A	N/A	0.0003	N/A	N/A	N/A	t
912	\N	M	LIVIA	CARTA	0	N/A	N/A	N/A	0.0120	N/A	N/A	N/A	t
938	\N	P0	LUIS	CONSTANZA	0	N/A	N/A	N/A	0.0125	N/A	N/A	N/A	t
946	\N	40	LUIS	SANCHEZ	0	N/A	N/A	N/A	0.0003	N/A	N/A	N/A	t
984	\N	ES	MARCELA	MUï¿œOZ  CORREA	0	N/A	N/A	N/A	0.1018	N/A	N/A	N/A	t
2	\N	P2	N/A	UNIFOT	0	N/A	N/A	N/A	0.0109	N/A	N/A	N/A	t
1237	\N	40	R. CAJIAS Y	GENOVEVA DE CAJIAS	0	N/A	N/A	N/A	0.0003	N/A	N/A	N/A	t
1283	\N	P0	REPRESENTACIONES	TOMASINO	0	N/A	N/A	N/A	0.0132	N/A	N/A	N/A	t
1294	\N	40	RICARDO	CERGALE  FAUSTI	0	N/A	N/A	N/A	0.0003	N/A	N/A	N/A	t
1296	\N	P1	RICARDO	GRISANTI  MACHADO	0	N/A	N/A	N/A	0.0117	N/A	N/A	N/A	t
1299	\N	P1	RICARDO  ALI	INOJOSA  TOVAR	0	N/A	N/A	N/A	0.0134	N/A	N/A	N/A	t
1336	\N	P1	ROMULO	NORI	0	N/A	N/A	N/A	0.0143	N/A	N/A	N/A	t
1378	\N	41	SANTIAGO  JAIME	DE  ARMAS	0	N/A	N/A	N/A	0.0003	N/A	N/A	N/A	t
1391	\N	P3	SERAFIN	MAZPARROTE  Y  SRA.	0	N/A	N/A	N/A	0.0120	N/A	N/A	N/A	t
1463	\N	P4	VANIRO	CABELLE	0	N/A	N/A	N/A	0.0087	N/A	N/A	N/A	t
1467	\N	P2	VIAJES Y TURISMO	MELFITUR	0	N/A	N/A	N/A	0.0117	N/A	N/A	N/A	t
1470	\N	P4	VICENTE	GRISANTI	0	N/A	N/A	N/A	0.0106	N/A	N/A	N/A	t
1471	\N	P3	VICENTE	GRISANTI  SALAZAR  Y  SRA.	0	N/A	N/A	N/A	0.0128	N/A	N/A	N/A	t
1473	\N	P0	VICENZA	LO  PRESTI	0	N/A	N/A	N/A	0.0111	N/A	N/A	N/A	t
473	\N	03	ENRIQUE	BART	0	N/A	N/A	N/A	0.0648	N/A	N/A	N/A	t
367	\N	03	CRISTOBA L	GONZALEZ	0	N/A	N/A	N/A	0.0648	N/A	N/A	N/A	t
514	\N	06	FERNANDO	CAO	0	N/A	N/A	N/A	0.0648	N/A	N/A	N/A	t
517	\N	02	FERNANDO	FRANJO	0	N/A	N/A	N/A	0.0648	N/A	N/A	N/A	t
592	\N	P	GLORIA	VALENCIA PEREZ	0	N/A	N/A	N/A	0.0930	N/A	N/A	N/A	t
648	\N	07	HERNANDO	D' CARO ORTIZ	0	N/A	N/A	N/A	0.0724	N/A	N/A	N/A	t
718	\N	05	INVERSORA	FARONCA S.A.	0	N/A	N/A	N/A	0.0648	N/A	N/A	N/A	t
730	\N	07	ISRAEL	MONTES DE OCA DAGER	0	N/A	N/A	N/A	0.0572	N/A	N/A	N/A	t
733	\N	04	IVAN	GUILLEN PADRON	0	N/A	N/A	N/A	0.0648	N/A	N/A	N/A	t
957	\N	02	LUIS O. TORRELLAS Y	REINA M. AZUAJE	0	N/A	N/A	N/A	0.0648	N/A	N/A	N/A	t
1073	\N	04	MAURA MERCEDES	RAMIREZ B.	0	N/A	N/A	N/A	0.0648	N/A	N/A	N/A	t
1396	\N	05	SHIRLEY	MAISSI  SAENZ	0	N/A	N/A	N/A	0.0648	N/A	N/A	N/A	t
1507	\N	06	Y MIRVA GARCIA	FRANKLIN GONZALEZ	0	N/A	N/A	N/A	0.0648	N/A	N/A	N/A	t
250	\N	1	CALOGERA	RICCOBENE	0	N/A	N/A	N/A	0.0367	N/A	N/A	N/A	t
349	\N	1	CLAUDIA	CUELLO	0	N/A	N/A	N/A	0.0367	N/A	N/A	N/A	t
417	\N	1	DOLORES	PITA	0	N/A	N/A	N/A	0.0331	N/A	N/A	N/A	t
528	\N	1	FRANCHESCA	KARIANI	0	N/A	N/A	N/A	0.0331	N/A	N/A	N/A	t
792	\N	1	JOSE	NOBREGA	0	N/A	N/A	N/A	0.0470	N/A	N/A	N/A	t
798	\N	1	JOSE	VERGARA	0	N/A	N/A	N/A	0.0276	N/A	N/A	N/A	t
958	\N	1	LUISA	IBARRA	0	N/A	N/A	N/A	0.0394	N/A	N/A	N/A	t
989	\N	1	MARGARITA	TOLEDO	0	N/A	N/A	N/A	0.0331	N/A	N/A	N/A	t
1037	\N	1	MARIBEL	IBARRA	0	N/A	N/A	N/A	0.0244	N/A	N/A	N/A	t
1045	\N	1	MARINA	BENCHIMOL	0	N/A	N/A	N/A	0.0244	N/A	N/A	N/A	t
1135	\N	1	NELSON AGUSTIN	DO SANTOS	0	N/A	N/A	N/A	0.0276	N/A	N/A	N/A	t
1199	\N	1	PATRICIA	PINEDA	0	N/A	N/A	N/A	0.0367	N/A	N/A	N/A	t
1351	\N	1	ROSSANN Y ADOLFINA	GUEVARA	0	N/A	N/A	N/A	0.0276	N/A	N/A	N/A	t
217	\N	4	BIJOUN	JUAN CHAQUIRA	0	N/A	N/A	N/A	0.0187	N/A	N/A	N/A	t
246	\N	2	CABRAL GOMES	JOSE	0	N/A	N/A	N/A	0.0185	N/A	N/A	N/A	t
371	\N	3	DA SILVA	JOSE CARLOS	0	N/A	N/A	N/A	0.0185	N/A	N/A	N/A	t
559	\N	PB	GARCIA	MAXIMO ALEJANDRO	0	N/A	N/A	N/A	0.0196	N/A	N/A	N/A	t
664	\N	1	I.H.	MANUEL CANDAL I.  /	0	N/A	N/A	N/A	0.0185	N/A	N/A	N/A	t
838	\N	5	JUAN	ZABALA	0	N/A	N/A	N/A	0.0185	N/A	N/A	N/A	t
930	\N	2	LOZANO	JUAN MIGUEL	0	N/A	N/A	N/A	0.0185	N/A	N/A	N/A	t
1216	\N	3	PEREZ	MANUEL PEREZ	0	N/A	N/A	N/A	0.0185	N/A	N/A	N/A	t
1317	\N	5	RODRIGUES	ANTONIO DE SOUSA	0	N/A	N/A	N/A	0.0185	N/A	N/A	N/A	t
1442	\N	1	TORRES	CARMEN JOSEFINA	0	N/A	N/A	N/A	0.0185	N/A	N/A	N/A	t
1460	\N	6	VAN HEEL QUINTERO	JOHANN A.	0	N/A	N/A	N/A	0.0199	N/A	N/A	N/A	t
154	\N	6	ARANA	EUDE GUILLERMINA	0	N/A	N/A	N/A	0.0198	N/A	N/A	N/A	t
207	\N	5	BENSHIMOL RODRIGUES	WILLIAN	0	N/A	N/A	N/A	0.0185	N/A	N/A	N/A	t
234	\N	2	BRUNO DIVITA	GABRIEL	0	N/A	N/A	N/A	0.0185	N/A	N/A	N/A	t
374	\N	PH	DA SILVA PEREIRA	MANUEL	0	N/A	N/A	N/A	0.0199	N/A	N/A	N/A	t
224	\N	14	BOHORQUEZ MORAN	CARMEN L.	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
249	\N	1	CALLES RODRIGUEZ	ANDRES Y JOSE	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
251	\N	6	CAMACHO	ALBORADA	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
301	\N	11	CARMONA	NANCY COROMOTO	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
386	\N	4	DAVIS	DANIEL ALEJANDRO	0	N/A	N/A	N/A	0.0185	N/A	N/A	N/A	t
420	\N	1	DONA MARCANO	JESUS E.	0	N/A	N/A	N/A	0.0185	N/A	N/A	N/A	t
497	\N	PB	F-47 C.A.	DESARROLLOS .	0	N/A	N/A	N/A	0.0195	N/A	N/A	N/A	t
523	\N	3	FIGUEROA	PEDRO MANUEL	0	N/A	N/A	N/A	0.0187	N/A	N/A	N/A	t
828	\N	1	JRAICHE SALEH	JONATHAN	0	N/A	N/A	N/A	0.0185	N/A	N/A	N/A	t
1203	\N	4	PEDRO	GUERRERO BILANCIERI	0	N/A	N/A	N/A	0.0185	N/A	N/A	N/A	t
1424	\N	2	TAMARA	BILANCIELI	0	N/A	N/A	N/A	0.0185	N/A	N/A	N/A	t
1441	\N	5	TORREALBA	GUSTAVO ADOLFO	0	N/A	N/A	N/A	0.0185	N/A	N/A	N/A	t
45	\N	3	ALCALDE MORA	YESER	0	N/A	N/A	N/A	0.0150	N/A	N/A	N/A	t
186	\N	5	BANEGAS	CARMEN INES	0	N/A	N/A	N/A	0.0185	N/A	N/A	N/A	t
395	\N	6	DE FIUME	MARIA	0	N/A	N/A	N/A	0.0198	N/A	N/A	N/A	t
411	\N	1	DI PRIMA	ROBERTO	0	N/A	N/A	N/A	0.0150	N/A	N/A	N/A	t
1334	\N	3	ROMERO RUSSI	MIGUEL ANGEL	0	N/A	N/A	N/A	0.0185	N/A	N/A	N/A	t
1387	\N	5	SCHNAIDER	HECTOR	0	N/A	N/A	N/A	0.0150	N/A	N/A	N/A	t
1402	\N	PB	SINISCALCHI	UMBERTINA	0	N/A	N/A	N/A	0.0187	N/A	N/A	N/A	t
83	\N	4	ALONSO	ANISETO IGNACIO	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A	t
220	\N	8	BLANCO	CRISTOBAL	0	N/A	N/A	N/A	0.0235	N/A	N/A	N/A	t
376	\N	5	DAHEC GARRIDO	RAFAEL	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A	t
403	\N	6	DE TACON	LISSETTE	0	N/A	N/A	N/A	0.0216	N/A	N/A	N/A	t
617	\N	5	GUARATASMA LOPEZ	ISBELIA	0	N/A	N/A	N/A	0.0230	N/A	N/A	N/A	t
923	\N	2	LORETO	ZENITH	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A	t
1322	\N	4	RODRIGUEZ	RAFAEL	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A	t
1361	\N	8	SABINA	LISBETH	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A	t
1383	\N	7	SAROUKHAN	ABBOUD	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A	t
1417	\N	3	SUAREZ	ARTURO LEANEZ	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A	t
70	\N	12	ALFONSO	RUBEN	0	N/A	N/A	N/A	0.0366	N/A	N/A	N/A	t
89	\N	11	ALVAREZ C.	DANIEL A.	0	N/A	N/A	N/A	0.0366	N/A	N/A	N/A	t
182	\N	9	BALL	INGRID	0	N/A	N/A	N/A	0.0366	N/A	N/A	N/A	t
194	\N	9	BAUTISTA A.	MARIA E.	0	N/A	N/A	N/A	0.0366	N/A	N/A	N/A	t
227	\N	PH	BOTERO A.	CAMERON D. ALAN /	0	N/A	N/A	N/A	0.0608	N/A	N/A	N/A	t
485	\N	11	ESPINAL	CARLOS	0	N/A	N/A	N/A	0.0366	N/A	N/A	N/A	t
602	\N	2	GONZALEZ	LUIS MANUEL	0	N/A	N/A	N/A	0.0366	N/A	N/A	N/A	t
814	\N	6	JOSE FELIX	MESA	0	N/A	N/A	N/A	0.0366	N/A	N/A	N/A	t
827	\N	PH	JOUBERT	FEDERICO	0	N/A	N/A	N/A	0.0608	N/A	N/A	N/A	t
865	\N	7	K. / CARMEN	FRANCOIS A. CUBEK	0	N/A	N/A	N/A	0.0366	N/A	N/A	N/A	t
1072	\N	3	MATOS RIVAS	JOSE F.	0	N/A	N/A	N/A	0.0366	N/A	N/A	N/A	t
1106	\N	10	MOHAMED	JOHN	0	N/A	N/A	N/A	0.0366	N/A	N/A	N/A	t
1125	\N	1	NARVAEZ TORRES	HUGO A.	0	N/A	N/A	N/A	0.0366	N/A	N/A	N/A	t
1188	\N	5	PADRON TORREALBA	FANNY J.	0	N/A	N/A	N/A	0.0366	N/A	N/A	N/A	t
1225	\N	5	PILEGGI PILEGGI	NICOLA	0	N/A	N/A	N/A	0.0366	N/A	N/A	N/A	t
1264	\N	6	RAMOS DAY	DANIEL ERNESTO	0	N/A	N/A	N/A	0.0366	N/A	N/A	N/A	t
1366	\N	3	SALAS BORJAS	MARIANA	0	N/A	N/A	N/A	0.0366	N/A	N/A	N/A	t
1374	\N	1	SANCHEZ	ISABEL	0	N/A	N/A	N/A	0.0366	N/A	N/A	N/A	t
1418	\N	2	SUAREZ AULAR	FRANCISCO J.	0	N/A	N/A	N/A	0.0366	N/A	N/A	N/A	t
1485	\N	10	VILLALBA A.	LUISA A.	0	N/A	N/A	N/A	0.0366	N/A	N/A	N/A	t
1508	\N	8	Y ROBERTO RIVAS	YOLANDA	0	N/A	N/A	N/A	0.0366	N/A	N/A	N/A	t
1519	\N	4	YATIM	JORGE	0	N/A	N/A	N/A	0.0366	N/A	N/A	N/A	t
9	\N	PH	ABREU	OLIVIA	0	N/A	N/A	N/A	0.0287	N/A	N/A	N/A	t
12	\N	9	ACOSTA SANGRONA	JUAN MANUEL	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
99	\N	10	AMAYA PENA	RICARDO YOVEIRO	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
155	\N	14	ARANGUREN	PEDRO PABLO	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
205	\N	4	BELTRAN	JORGE	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
206	\N	7	BENARROCH	ELIAS	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
208	\N	3	BENZAQUEN	RAQUEL	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
1301	\N	11	RICCIO CAPUTO	GERARDO	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
1388	\N	7	SEGURA	JULIO Y MARIA	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
1394	\N	12	SERMECA	MENSAJEROS EXPRESOS, C.A.	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
1397	\N	9	SICULA S.R.L.	INMOBILIARIA	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
1403	\N	9	SIRIT MEZA	REINA MARIBEL	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
1454	\N	7	URDANETA	RAMON	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
1457	\N	6	VALENTE RUELA	JOAO JULIO	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
1483	\N	4	VILLA DE MARTUL	MANUELA	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
1510	\N	9	Y S. MARCHAN	H. FERNANDEZ	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
1529	\N	13	YONA BENDAHAN	ENCARNACION DE N.	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
1538	\N	14	ZAMBRANO	EDILBERTO Y SRA.	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
27	\N	6	AGUILERA	ELBA	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
88	\N	8	ALVAREZ	LILIAN	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
125	\N	5	ANGEL MATA.	TERESA N. DE MATA	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
156	\N	9	ARCAMONE	GLENDA	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
167	\N	11	ARTECA	ANGELA	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
168	\N	9	ARTECA	ANTONIO	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
193	\N	12	BATLLES	SUCESION RIVAS  DE	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
247	\N	11	CACIANA ANTEQUERA	CARMEN. A.	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
308	\N	10	CARVAJAL CHITTY	HUMBERTO	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
749	\N	9	JAVIER	MARTINEZ  RODRIGUEZ	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A	t
787	\N	5	JOSE	DIAZ	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A	t
803	\N	16	JOSE  URGUIZA	DIANA  DE	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A	t
839	\N	9	JUAN  CARLOS	GONZALEZ  VERA	0	N/A	N/A	N/A	0.0066	N/A	N/A	N/A	t
878	\N	12	LAURA  LEZAMA  -	ELSA  DUHARTE	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A	t
890	\N	5	LEONARDO	BERTOGLI	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A	t
927	\N	7	LOURDES	MORA  DE  LA  HUEBRA	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
951	\N	2	LUIS  GUILLERMO	RODRIGUEZ  S.	0	N/A	N/A	N/A	0.0087	N/A	N/A	N/A	t
996	\N	2	MARIA	HERNANDEZ	0	N/A	N/A	N/A	0.0087	N/A	N/A	N/A	t
1004	\N	14	MARIA  DEL  CARMEN	PORRAS	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
1006	\N	11	MARIA  EUGENIA	BARBIER	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A	t
327	\N	8	CIATTI PASQUINI	FELICE	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
441	\N	14	EDUARDO ALVARADO	ANA ACEVEDO Y	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
499	\N	10	FAJARDO SILVERA	MANUEL ANTONIO	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
506	\N	4	FELIPE ZAMORA	CARMEN TORTOLANI	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
525	\N	1	FONSECA	HERMES	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
561	\N	3	GARCIA M,	ANIBAL	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
570	\N	10	GERARDO MILANO	RAQUEL GALLARDO Y	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
578	\N	4	GINTEL	JERZY	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
597	\N	8	GOMEZ	NORMA	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
598	\N	13	GOMEZ ARIAS	FRANKLIN JAVIER	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
613	\N	3	GROM CYRYL	EDWARD	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
631	\N	5	GUTIERREZ DE FERNANDEZ	SARA	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
652	\N	14	HO	ESTEBAN	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
722	\N	3	IOK TENG DE HUI	KIN SUN HUI	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
873	\N	PB	LA GENESTROIKA C.A.	INVERSIONES	0	N/A	N/A	N/A	0.0398	N/A	N/A	N/A	t
874	\N	PB	LA GENESTROIKA C.A.	INVERSIONES	0	N/A	N/A	N/A	0.0448	N/A	N/A	N/A	t
881	\N	11	LAZO	YENSI	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
894	\N	7	LEONARDO PEREZ	YANDRES CHIRINOS	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
919	\N	4	LORENA MIJARES	ANGEL RAMIREZ	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
953	\N	3	LUIS COLMENAREZ	JUAN PERAZA	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
973	\N	4	MALAVE	MORELLA	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
1064	\N	5	MARTINEZ CARRASQUERO	AMPARO MAGDALENA	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
1068	\N	13	MASSAI	ELIO	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
1069	\N	1	MASSIMO	CONSTANZO MICHELE	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
1085	\N	13	MENDEZ	ISABEL TERESA	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
1113	\N	7	MONTOYA DE RODRIGUEZ	CARMEN. A.	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
795	\N	P	JOSE	RINCON	0	751-8795	N/A	N/A	0.0178	N/A	N/A	N/A	t
911	\N	7	LISBETH J. PARRA M.	JOSE L.DIAZ S. Y	0	751-2189	N/A	N/A	0.0089	N/A	N/A	N/A	t
1000	\N	2	MARIA  ANGELES	GONCALVES  GOï¿œI	0	751-2990	N/A	N/A	0.0062	N/A	N/A	N/A	t
17	\N	2	ADRIAN ARGENIS	OVALLES SMITTER	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
1003	\N	6	MARIA  DEL  CARMEN	GARCIA  VILAR	0	992-4622	N/A	N/A	0.0065	N/A	N/A	N/A	t
1121	\N	6	MUï¿œOZ	RAFAEL	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
1158	\N	2	OCHOA ESPINOZA	REINA	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
1175	\N	12	ORTIZ DE PETTI	JOSEFA	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
1255	\N	14	RAMIREZ	VICTORIA	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
1265	\N	2	RAMOS VASQUEZ	FRANCISCO	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
1285	\N	13	REY	THAIS	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
1318	\N	6	RODRIGUEZ	CONSTANTE	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
1323	\N	5	RODRIGUEZ FAJARDO	ADALBERTO	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
1324	\N	14	RODRIGUEZ LEBRUN	ARMANDO	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
292	\N	1	CARMEN  T.	GONZALEZ CH.	0	1	1	1	0.0212	P	N/A	N/A	t
1367	\N	12	SALAZAR	JOSE RAMON	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
1412	\N	9	SOSA VAAMONDE	LUIS ADOLFO	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
160	\N	4	ARGENIS ROJAS Y	SUSANA NAVAS	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A	t
180	\N	1	AURORA DE R. Y	VICTOR RIVAS	0	N/A	N/A	N/A	0.0062	N/A	N/A	N/A	t
278	\N	3	CARLOS EDUARDO	HERNANDEZ ARDILA	0	N/A	N/A	N/A	0.0065	N/A	N/A	N/A	t
425	\N	1	DULCE  MARIA	CORONEL  GARCIA	0	N/A	N/A	N/A	0.0088	N/A	N/A	N/A	t
429	\N	1	EDGAR JOSE	JOA MATOS	0	N/A	N/A	N/A	0.0087	N/A	N/A	N/A	t
439	\N	5	EDUARDO	GARCIA	0	N/A	N/A	N/A	0.0064	N/A	N/A	N/A	t
463	\N	8	ELIZABETH INMACULADA	ARANGUREN	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
496	\N	16	EXCLUSIVIDADES	PALIO  C.  A.	0	N/A	N/A	N/A	0.0065	N/A	N/A	N/A	t
527	\N	6	FRANCESCO	COLTRARO	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
545	\N	16	FRANZ	DIEMINGER	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A	t
549	\N	8	FREDDY   ENRIQUE	MORA	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A	t
550	\N	16	FREDDY M. GARCIA	LIBIA DE GARCIA	0	N/A	N/A	N/A	0.0064	N/A	N/A	N/A	t
565	\N	14	GENARO	CARRASCO	0	N/A	N/A	N/A	0.0063	N/A	N/A	N/A	t
581	\N	11	GIRALUNA	RONDON	0	N/A	N/A	N/A	0.0065	N/A	N/A	N/A	t
128	\N	10	ANGELICA	KNEPPER MACIAS	0	N/A	N/A	N/A	0.0090	N/A	N/A	N/A	t
212	\N	15	BERTHA   CECILIA	MORALES  ORTEGA	0	N/A	N/A	N/A	0.0064	N/A	N/A	N/A	t
674	\N	N2	ILERJU,	S.A.	0	N/A	N/A	N/A	0.0018	N/A	N/A	N/A	t
16	\N	15	ADMINISTRADORA	LAS  LUCIAS	0	N/A	N/A	N/A	0.0065	N/A	N/A	N/A	t
59	\N	3	ALEMAN	ESTHER	0	N/A	N/A	N/A	0.0421	N/A	N/A	N/A	t
426	\N	2	E  IVONNE E. RODRIGUEZ	JOSE A. CONNOR	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
1117	\N	1	MOSQUERA	CARLOS ENRIQUE	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
1335	\N	10	ROMERO Y OTROS	SALVAROR	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
1342	\N	12	ROSA DE G.	ANGEL GUTIERREZ Y	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
1456	\N	4	VALBUENA	HUMBERTO	0	N/A	N/A	N/A	0.0150	N/A	N/A	N/A	t
231	\N	5	BRITO	AMILCAR	0	N/A	N/A	N/A	0.0421	N/A	N/A	N/A	t
258	\N	PB	CARIBE SACA	BANCO DEL	0	N/A	N/A	N/A	0.1011	N/A	N/A	N/A	t
259	\N	PB	CARIBE SACA	BANCO DEL	0	N/A	N/A	N/A	0.0393	N/A	N/A	N/A	t
522	\N	2	FIGUEREDO	RAFAEL	0	N/A	N/A	N/A	0.0421	N/A	N/A	N/A	t
594	\N	5	GODOY	LEDYS M.	0	N/A	N/A	N/A	0.0421	N/A	N/A	N/A	t
605	\N	4	GONZALEZ  GUERRA	CESAR L.	0	N/A	N/A	N/A	0.0421	N/A	N/A	N/A	t
680	\N	PB	IMPORT, C.A.	IMPERIAL	0	N/A	N/A	N/A	0.0393	N/A	N/A	N/A	t
681	\N	PB	IMPORT, C.A.	IMPERIAL	0	N/A	N/A	N/A	0.0393	N/A	N/A	N/A	t
774	\N	1	JOERCE, C.A.	INVERSIONES	0	N/A	N/A	N/A	0.0532	N/A	N/A	N/A	t
1145	\N	3	NIETO	FLOR DE MARIA	0	N/A	N/A	N/A	0.0421	N/A	N/A	N/A	t
1153	\N	2	NUï¿œEZ	GISELA  C.	0	N/A	N/A	N/A	0.0421	N/A	N/A	N/A	t
1196	\N	4	PASQUALE	ANGELO	0	N/A	N/A	N/A	0.0421	N/A	N/A	N/A	t
1197	\N	4	PASQUALE	ANTONELLA	0	N/A	N/A	N/A	0.0421	N/A	N/A	N/A	t
1233	\N	5	PROSPERI	LUIS	0	N/A	N/A	N/A	0.0421	N/A	N/A	N/A	t
20	\N	1	ADRIANA	CARVAJAL CUEVAS	0	N/A	N/A	N/A	0.0202	N/A	N/A	N/A	t
148	\N	2	ANTONIO	SANTOS	0	N/A	N/A	N/A	0.0302	N/A	N/A	N/A	t
165	\N	1	ARMANDO	BRANGER	0	N/A	N/A	N/A	0.0277	N/A	N/A	N/A	t
235	\N	1	BSM	ASOCIACION CIVIL	0	N/A	N/A	N/A	0.0284	N/A	N/A	N/A	t
236	\N	1	BSM	ASOCIACION CIVIL	0	N/A	N/A	N/A	0.0302	N/A	N/A	N/A	t
237	\N	2	BSM	ASOCIACION CIVIL	0	N/A	N/A	N/A	0.0284	N/A	N/A	N/A	t
238	\N	3	BSM	ASOCIACION CIVIL	0	N/A	N/A	N/A	0.0281	N/A	N/A	N/A	t
239	\N	3	BSM	ASOCIACION CIVIL	0	N/A	N/A	N/A	0.0287	N/A	N/A	N/A	t
240	\N	P	BSM	ASOCIACION CIVIL	0	N/A	N/A	N/A	0.0143	N/A	N/A	N/A	t
269	\N	1	CARLOS	GARRIDO BUSTAMANTE	0	N/A	N/A	N/A	0.0234	N/A	N/A	N/A	t
354	\N	3	CLINICA CCT	SERGIO GINER	0	N/A	N/A	N/A	0.0287	N/A	N/A	N/A	t
552	\N	1	GABRIEL	ROIG	0	N/A	N/A	N/A	0.0283	N/A	N/A	N/A	t
553	\N	1	GABRIEL	ROIG	0	N/A	N/A	N/A	0.0292	N/A	N/A	N/A	t
586	\N	1	GIUSEPPE	CARMAGNOLA	0	N/A	N/A	N/A	0.0226	N/A	N/A	N/A	t
627	\N	2	GUSTAVO	YANES	0	N/A	N/A	N/A	0.0202	N/A	N/A	N/A	t
670	\N	3	IKER URCELAY	MASPERO	0	N/A	N/A	N/A	0.0268	N/A	N/A	N/A	t
691	\N	1	INMOBILIARIA	ROSO,C.A	0	N/A	N/A	N/A	0.0374	N/A	N/A	N/A	t
706	\N	1	INVERSIONES	DELTA	0	N/A	N/A	N/A	0.0221	N/A	N/A	N/A	t
777	\N	2	JORGE	LANDALUCE	0	N/A	N/A	N/A	0.0198	N/A	N/A	N/A	t
817	\N	3	JOSE GREGORIO	FRANCO	0	N/A	N/A	N/A	0.0281	N/A	N/A	N/A	t
818	\N	1	JOSE LUIS	LOPEZ TOLEDO	0	N/A	N/A	N/A	0.0135	N/A	N/A	N/A	t
891	\N	2	LEONARDO	MORENO	0	N/A	N/A	N/A	0.0292	N/A	N/A	N/A	t
970	\N	1	MAGDALENA	ILIJA	0	N/A	N/A	N/A	0.0198	N/A	N/A	N/A	t
1055	\N	2	MARK	MELILLI	0	N/A	N/A	N/A	0.0257	N/A	N/A	N/A	t
1095	\N	2	MIGUEL ANGEL	AMADO DA SILVA	0	N/A	N/A	N/A	0.0398	N/A	N/A	N/A	t
1097	\N	2	MILDRED	SOLANO	0	N/A	N/A	N/A	0.0283	N/A	N/A	N/A	t
1185	\N	2	PABLO	SANCHEZ DE LEON	0	N/A	N/A	N/A	0.0277	N/A	N/A	N/A	t
1193	\N	3	PAOLA	FORTINO	0	N/A	N/A	N/A	0.0396	N/A	N/A	N/A	t
1234	\N	3	PROYECTOS	URBANOS PRODEUR, C.A.	0	N/A	N/A	N/A	0.0444	N/A	N/A	N/A	t
1238	\N	2	RAFAEL	GERDEL	0	N/A	N/A	N/A	0.0216	N/A	N/A	N/A	t
1290	\N	2	RICARDO	ANDA TORO	0	N/A	N/A	N/A	0.0226	N/A	N/A	N/A	t
1308	\N	3	ROBERTO	PEREZ	0	N/A	N/A	N/A	0.0268	N/A	N/A	N/A	t
1373	\N	3	SALVATORE	BOTIGLIERI	0	N/A	N/A	N/A	0.0382	N/A	N/A	N/A	t
1410	\N	1	SORAYA MERCEDES	MOSSI APARICIO	0	N/A	N/A	N/A	0.0216	N/A	N/A	N/A	t
113	\N	2	ANANIAS	MORENO	0	N/A	N/A	N/A	0.0088	N/A	N/A	N/A	t
1451	\N	2	TRINI	GUEVARA	0	N/A	N/A	N/A	0.0221	N/A	N/A	N/A	t
1462	\N	3	VANESSA KARINA	CONSTANTINO Dï¿œVILA	0	N/A	N/A	N/A	0.0382	N/A	N/A	N/A	t
1515	\N	2	YANETH	HIDALGO	0	N/A	N/A	N/A	0.0135	N/A	N/A	N/A	t
28	\N	7	AGUSTIN	DE LECA	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
52	\N	2	ALEJANDRINA	RIVAS	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
115	\N	5	ANDREA	MARQUEZ DIAS	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
142	\N	1	ANTONIO	GABRIEL	0	N/A	N/A	N/A	0.0100	N/A	N/A	N/A	t
195	\N	9	BEATRIS Y MARIA	TORRES	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
199	\N	12	BEDYS ELIZABETH	GARCIA FERRER	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
201	\N	10	BELKYS CORTESIA	JUAN HERRERA/	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
279	\N	11	CARLOS JOSE	ROMERO	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
293	\N	6	CARMEN AMANDA	GOMEZ N.	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
407	\N	9	DELIA	PEREZ RODRIGUEZ	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
430	\N	7	EDILSA	VALLADARES C.	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
455	\N	7	ELIDA ESTHER	SANCHEZ PEREZ	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
467	\N	2	EMILIO	VALERA AZUAJE	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
468	\N	4	EMILIO C.	GUERRERO CONWAY	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
472	\N	6	ENMANUEL	GENNUSO SARTA	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
486	\N	8	ESTHER Y MANUEL	RIODRIGUEZ	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
491	\N	3	EUKARIS CAROLINA	BATISTA JIMENEZ	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
537	\N	3	FRANCISCO	YELAMOS S.	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
611	\N	1	GREGORIA	RUIZ FIGUEROA	0	N/A	N/A	N/A	0.0093	N/A	N/A	N/A	t
622	\N	10	GUILLERMO A.	MEDINA	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
636	\N	4	HECTOR	PANTOJA	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
658	\N	10	HUGO A.	OSORIO VIANA	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
659	\N	8	HUGO A.	SALAZAR PANZ	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
763	\N	1	JESUS	VALCARCEL IGLESIAS	0	N/A	N/A	N/A	0.0093	N/A	N/A	N/A	t
821	\N	1	JOSE MIGUEL	RAMOS	0	N/A	N/A	N/A	0.0100	N/A	N/A	N/A	t
822	\N	2	JOSE MIGUEL	SANCHEZ BAUTISTA	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
829	\N	5	JUAN	ALVAREZ FERNANDEZ	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
198	\N	2	BECERRA	LUDY  J.	0	N/A	N/A	N/A	0.0421	N/A	N/A	N/A	t
901	\N	4	LETICIA MOLINA	ROBERTO MOLINA/	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
952	\N	6	LUIS ALBERTO	RAMOS SANCHEZ	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
1025	\N	12	MARIA LOUDES	VALLADARES GONZALEZ	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
1033	\N	3	MARIA USUBILLAGA	RAFAEL SOLBAS/	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
1042	\N	11	MARIELA MARILU	SANELLA LOVERA	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
1103	\N	6	MIRIAM	JIMENEZ SORIANO	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
1278	\N	3	REINA CRISTINA	MORENO	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
1345	\N	7	ROSALBA	RIOS BERNAL	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
1349	\N	5	ROSANGELA ORTEGA	RICHARD RONDON Y	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
1359	\N	PB	S.A.	CONDRASA,	0	N/A	N/A	N/A	0.0216	N/A	N/A	N/A	t
1393	\N	2	SERGIO OSCAR	ROSALEZ ALVAREZ	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
1399	\N	12	SILVANA	CERUZZI GRIPPO	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
1409	\N	10	SONIA ELIZABETH	AGUILAR ANDREA	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
1422	\N	11	SUSANA MARIA	MARTINI TORTONE	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
1498	\N	6	WILLI	MENDOZA S.	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
1532	\N	7	YSMENIA DEL PILAR	OCHOA TERAN	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
1104	\N	10	MIRNA I..	HERRERA C.	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
1109	\N	9	MONICA NELLY	PEDROZA CASTILLO	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
1138	\N	7	NESTOR	VENEGAS	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
1314	\N	9	RODOLFO JOSE	MAGALLANES	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
1331	\N	12	ROMANO	MANFRE MORE	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
1406	\N	5	SOMYS RAQUEL	LANDAETA VEROES	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
1494	\N	8	WALTER ALEXANDRO	RATTO MUï¿œIZ	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
1497	\N	8	WILD ALFREDO	GUEVARA SARTI	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
4	\N	11	1848, S.A.	INVERSIONES	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
39	\N	10	ALBERTO	PERALDO PUENTE	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
58	\N	11	ALEJANDRO O.	FONSECA	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
97	\N	7	AMAYA	ALDAZ LARRAZA,	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
107	\N	4	ANA ALCIRA	BALZA M.	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
210	\N	4	BERNARDA DOLORES	TOVAR RODRIGUEZ	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
243	\N	PB	C.A.	INVERSIONES RIAC,	0	N/A	N/A	N/A	0.0204	N/A	N/A	N/A	t
275	\N	10	CARLOS A.	LOPEZ CHACIN	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
315	\N	3	CECILIA	ANCHICOQUE	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
317	\N	9	CEFERINA SALAZAR	ENRIQUE QUINTANA Y	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
353	\N	12	CLAUDIO CAROLI	ANNI	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
378	\N	10	DALIA ANTONIETA	SILVA LARRAZABAL	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
413	\N	4	DIEGO	DI CIOCCIO SANTACROCE	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
1459	\N	9	VALONGO PRIMOZIC	ANA MARIA	0	N/A	N/A	N/A	0.0158	N/A	N/A	N/A	t
1499	\N	3	WILLIAM	GONZALEZ	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
48	\N	11	ALCIRA ROMERO	GUSTAVO RAMIREZ Y	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
1270	\N	PB	RAUL	HIGUERA MESA	0	N/A	N/A	N/A	0.0509	N/A	N/A	N/A	t
1504	\N	PB	Y  SERVICIOS	TEE INSTALACIONES	0	N/A	N/A	N/A	0.0255	N/A	N/A	N/A	t
588	\N	01	GLADYS ARIAS DE	FERRER	0	N/A	N/A	N/A	0.0132	N/A	N/A	N/A	t
849	\N	01	JUDITH	HERNANDEZ	0	N/A	N/A	N/A	0.0134	N/A	N/A	N/A	t
947	\N	02	LUIS	VARGAS	0	N/A	N/A	N/A	0.0132	N/A	N/A	N/A	t
994	\N	02	MARIA	FERNANDEZ	0	N/A	N/A	N/A	0.0134	N/A	N/A	N/A	t
1	\N	3	N/A	PETEX	0	N/A	N/A	N/A	0.0514	N/A	N/A	N/A	t
850	\N	01	JUDITH SIMONA	BENGUIGUI BERGEL	0	111111111	1111111111	N/A	0.0648	N/A	N/A	N/A	t
51	\N	1	ALEJANDRA	MARQUEZ VILLA	0	1	1	N/A	0.0544	N/A	N/A	N/A	t
326	\N	2	CHRISTIAN	DI GIOVANNI DI UBALDO	0	1	1	N/A	0.0634	N/A	N/A	N/A	t
369	\N	4	CRUZ MANUEL	GARRIDO	0	1	1	N/A	0.0514	N/A	N/A	N/A	t
690	\N	2	INMBL.	FAIMACO	0	1	1	N/A	0.0514	N/A	N/A	N/A	t
799	\N	3	JOSE   V.	GARCES	0	1	1	N/A	0.0634	N/A	N/A	N/A	t
841	\N	4	JUAN  MANUEL	RODRIGUEZ CENTENO	0	1	1	N/A	0.0634	N/A	N/A	N/A	t
852	\N	3	JULIA	DE  PENZO	0	1	1	N/A	0.0544	N/A	N/A	N/A	t
935	\N	5	LUIS	BRUZUAL	0	1	1	N/A	0.0544	N/A	N/A	N/A	t
990	\N	4	MARGARITA	VALERO	0	1	1	N/A	0.0544	N/A	N/A	N/A	t
1227	\N	P	POMPEYO	DE  FALCO	0	1	1	N/A	0.0906	N/A	N/A	N/A	t
1229	\N	5	PRADO	MORITA  2	0	1	1	N/A	0.0634	N/A	N/A	N/A	t
1250	\N	MZ	RAIZA	SILANO	0	1	1	N/A	0.0634	N/A	N/A	N/A	t
1303	\N	2	RICHARD W.	DELGADO C.	0	1	1	N/A	0.0544	N/A	N/A	N/A	t
1339	\N	5	ROSA	MORENO	0	1	1	N/A	0.0514	N/A	N/A	N/A	t
1513	\N	1	YAJAIRA	MARQUEZ MORA	0	1	1	N/A	0.0634	N/A	N/A	N/A	t
7	\N	14	ABELARDO  DIAZ  Y	ESMERALDA   DE	0	753-8920	014-9-466446	N/A	0.0066	N/A	N/A	N/A	t
380	\N	03	DAMAS ANTON	MIREYA  N.	0	271	N/A	N/A	0.0134	N/A	N/A	N/A	t
451	\N	08	ELDA	PENAGO	0	271	N/A	N/A	0.0132	N/A	N/A	N/A	t
481	\N	05	ERNESTO Y EUCARIS DE	MONSALVE	0	271	N/A	N/A	0.0134	N/A	N/A	N/A	t
490	\N	10	EUCARIS	PIï¿œERO	0	271	N/A	N/A	0.0132	N/A	N/A	N/A	t
501	\N	11	FANNY	GUANDA	0	271	N/A	N/A	0.0134	N/A	N/A	N/A	t
546	\N	18	FRED	MEYER	0	271	N/A	N/A	0.0132	N/A	N/A	N/A	t
548	\N	07	FREDDY	SALAZAR	0	271	N/A	N/A	0.0134	N/A	N/A	N/A	t
568	\N	05	GEORGINA	MOYA	0	271	N/A	N/A	0.0134	N/A	N/A	N/A	t
587	\N	08	GIUSEPPE	SEGRETTO	0	271	N/A	N/A	0.0134	N/A	N/A	N/A	t
688	\N	04	INGRID JOSEFINA	MONSALVE	0	271	N/A	N/A	0.0134	N/A	N/A	N/A	t
736	\N	14	IVONNE	ZAPATA	0	271	N/A	N/A	0.0132	N/A	N/A	N/A	t
757	\N	15	JESUS	GARCIA	0	271	N/A	N/A	0.0134	N/A	N/A	N/A	t
761	\N	15	JESUS	ROJAS	0	271	N/A	N/A	0.0134	N/A	N/A	N/A	t
769	\N	16	JOAQUIN GOMEZ	DE OLIVEIRA	0	271	N/A	N/A	0.0132	N/A	N/A	N/A	t
782	\N	03	JOSE	CABRAL	0	271	N/A	N/A	0.0134	N/A	N/A	N/A	t
796	\N	04	JOSE	SILVERSTRI	0	271	N/A	N/A	0.0134	N/A	N/A	N/A	t
804	\N	18	JOSE A. GIL	JOHANA PEDROSO Y	0	271	N/A	N/A	0.0132	N/A	N/A	N/A	t
830	\N	06	JUAN	BARRIOS	0	271	N/A	N/A	0.0134	N/A	N/A	N/A	t
831	\N	09	JUAN	CAVERO	0	271	N/A	N/A	0.0134	N/A	N/A	N/A	t
833	\N	05	JUAN	MORALES	0	271	N/A	N/A	0.0132	N/A	N/A	N/A	t
847	\N	07	JUANA	DEL PINO	0	271	N/A	N/A	0.0132	N/A	N/A	N/A	t
860	\N	12	JULIO  CESAR	BERMUDEZ	0	271	N/A	N/A	0.0132	N/A	N/A	N/A	t
884	\N	05	LENIA	LOPEZ ROJAS	0	271	N/A	N/A	0.0132	N/A	N/A	N/A	t
900	\N	08	LETICIA	PAOLINI	0	271	N/A	N/A	0.0132	N/A	N/A	N/A	t
915	\N	10	LJUBICA TUCOVICH	DE CAPELETTI	0	271	N/A	N/A	0.0132	N/A	N/A	N/A	t
974	\N	16	MANUEL	BERMUDEZ	0	271	N/A	N/A	0.0134	N/A	N/A	N/A	t
1088	\N	17	MERCEDES  A.	MENDOZA  H.	0	271	N/A	N/A	0.0134	N/A	N/A	N/A	t
1091	\N	07	MICHELLE	VETROMILLI	0	271	N/A	N/A	0.0132	N/A	N/A	N/A	t
1132	\N	12	NELLY	OSTOS	0	271	N/A	N/A	0.0134	N/A	N/A	N/A	t
1133	\N	13	NELSON	GONZALEZ	0	271	N/A	N/A	0.0132	N/A	N/A	N/A	t
1134	\N	17	NELSON	RODRIGUEZ	0	271	N/A	N/A	0.0132	N/A	N/A	N/A	t
1137	\N	08	NESTOR	GOMEZ	0	271	N/A	N/A	0.0134	N/A	N/A	N/A	t
1159	\N	04	OCTAVIO	ESPINOZA	0	271	N/A	N/A	0.0132	N/A	N/A	N/A	t
1160	\N	03	ODOARDO	RODRIGUEZ	0	271	N/A	N/A	0.0132	N/A	N/A	N/A	t
1143	\N	3	NICOLO	MARRA	0	751-9572	N/A	N/A	0.0064	N/A	N/A	N/A	t
1232	\N	15	PRIMO  D.	DE  GREGORIO	0	753-9193	N/A	N/A	0.0089	N/A	N/A	N/A	t
1408	\N	7	SONIA ELISA	ROJAS PIERETTI	0	551-3733; 551-5730	N/A	N/A	0.0063	N/A	N/A	N/A	t
1500	\N	12	WILLIAMS  JOSUE	SIRA  VELASQUEZ	0	265-7647	N/A	N/A	0.0089	N/A	N/A	N/A	t
1531	\N	8	YOUSSEF	KARAM	0	263-1247	N/A	N/A	0.0090	N/A	N/A	N/A	t
885	\N	11	LEON	AMELINCKX	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
5	\N	2	203040, C.A.	ADMINISTRADORA	0	1	N/A	N/A	0.0080	N/A	N/A	N/A	t
22	\N	5	ADRIANA I.	SALAZAR MARCANO	0	76	N/A	N/A	0.0085	N/A	N/A	N/A	t
26	\N	1	AGRESTI ALONSO	HERMOSINDA	0	1	N/A	N/A	0.0067	N/A	N/A	N/A	t
54	\N	4	ALEJANDRO	GASTON SANTAROMITA	0	1	N/A	N/A	0.0046	N/A	N/A	N/A	t
61	\N	5	ALESSI GRIFO	CAROLINA	0	61	N/A	N/A	0.0067	N/A	N/A	N/A	t
85	\N	2	ALOS BORDET	MARIA DE LOS A.	0	1	N/A	N/A	0.0046	N/A	N/A	N/A	t
93	\N	2	AMADO ENRIQUE	CLARO IZARRA	0	96	N/A	N/A	0.0089	N/A	N/A	N/A	t
147	\N	3	ANTONIO	SALVIOLO	0	71	N/A	N/A	0.0085	N/A	N/A	N/A	t
153	\N	1	ANTONIO P.	SALVIOLI MARMO	0	67	N/A	N/A	0.0120	N/A	N/A	N/A	t
158	\N	1	AREVALO	VIRGINIA	0	1	N/A	N/A	0.0067	N/A	N/A	N/A	t
192	\N	2	BARRETO MARTINEZ	BELKIS	0	98	N/A	N/A	0.0089	N/A	N/A	N/A	t
222	\N	6	BLEJMAN	RAQUEL	0	89	N/A	N/A	0.0085	N/A	N/A	N/A	t
241	\N	6	BURIEL	JEANETTE	0	108	N/A	N/A	0.0089	N/A	N/A	N/A	t
252	\N	3	CAMPA DURAN	RODOLFO	0	1	N/A	N/A	0.0083	N/A	N/A	N/A	t
267	\N	3	CARLOS	DAYANA MONTES DE OCA	0	1	N/A	N/A	0.0046	N/A	N/A	N/A	t
281	\N	4	CARLOS LUIS	VILLARROEL	0	1	N/A	N/A	0.0083	N/A	N/A	N/A	t
300	\N	6	CARMEN TRASANDE	JONNY LOUTPHI -	0	63	N/A	N/A	0.0119	N/A	N/A	N/A	t
307	\N	4	CARSTENS	GUSTAVO	0	86	N/A	N/A	0.0085	N/A	N/A	N/A	t
310	\N	3	CASAS	CRISTIAN	0	1	N/A	N/A	0.0079	N/A	N/A	N/A	t
311	\N	PB	CASIANI	MARIA FERNANDA	0	1	N/A	N/A	0.0115	N/A	N/A	N/A	t
313	\N	3	CASTRO M.	RAUL HERNANDO	0	1	N/A	N/A	0.0067	N/A	N/A	N/A	t
340	\N	2	CIMA AVILA 23, C.A.	INVERSIONES	0	97	N/A	N/A	0.0086	N/A	N/A	N/A	t
359	\N	3	CONST. H	MAT. Y SERV.	0	1	N/A	N/A	0.0073	N/A	N/A	N/A	t
373	\N	5	DA SILVA GOMES	LUIS HUMBERTO	0	2	N/A	N/A	0.0079	N/A	N/A	N/A	t
412	\N	5	DIAZ	MIGUEL ANGEL	0	1	N/A	N/A	0.0046	N/A	N/A	N/A	t
423	\N	4	DUARTE CALDEIRA	JOSE	0	56	N/A	N/A	0.0067	N/A	N/A	N/A	t
427	\N	1	EDGAR	TAVARES	0	1	N/A	N/A	0.0079	N/A	N/A	N/A	t
459	\N	5	ELIZABETH	LEAL	0	59	N/A	N/A	0.0067	N/A	N/A	N/A	t
543	\N	4	FRANCO	LUIS	0	1	N/A	N/A	0.0067	N/A	N/A	N/A	t
551	\N	4	FUENTES	EDWIN	0	1	N/A	N/A	0.0079	N/A	N/A	N/A	t
558	\N	6	GARCIA	MAXIMO ALEJANDRO	0	65	N/A	N/A	0.0066	N/A	N/A	N/A	t
563	\N	6	GARCIA U.	WILLIAN FERMIN	0	77	N/A	N/A	0.0085	N/A	N/A	N/A	t
596	\N	5	GOMEZ	IRIS VIANEY	0	107	N/A	N/A	0.0089	N/A	N/A	N/A	t
601	\N	2	GONZALEZ	ANA	0	1	N/A	N/A	0.0046	N/A	N/A	N/A	t
603	\N	4	GONZALEZ	MARIA DE LOS A.	0	73	N/A	N/A	0.0085	N/A	N/A	N/A	t
618	\N	6	GUERRA	LUIS J.	0	1	N/A	N/A	0.0064	N/A	N/A	N/A	t
646	\N	7	HERNANDEZ	JACSON DE FREITAS	0	92	N/A	N/A	0.0163	N/A	N/A	N/A	t
743	\N	6	JACINTO PARRA	CAROLINA FERRER/	0	109	N/A	N/A	0.0086	N/A	N/A	N/A	t
768	\N	5	JOAO LUIS	GOMES CORREIA	0	57	N/A	N/A	0.0083	N/A	N/A	N/A	t
887	\N	1	LEON RAMPESSAD	GLENMAR DEL CARMEN	0	2	N/A	N/A	0.0046	N/A	N/A	N/A	t
899	\N	5	LEOSAR, C.A.	INVERSIONES	0	1	N/A	N/A	0.0067	N/A	N/A	N/A	t
962	\N	PB	LUNA	ANA AZALIA	0	94	N/A	N/A	0.0121	N/A	N/A	N/A	t
963	\N	2	LUONGO	SOFIA	0	1	N/A	N/A	0.0067	N/A	N/A	N/A	t
1012	\N	1	MARIA C. BALLABEN L.	LUIS F. MORALES R/	0	1	N/A	N/A	0.0067	N/A	N/A	N/A	t
1105	\N	1	MODICA	ANTININA INFRANCO	0	2	N/A	N/A	0.0067	N/A	N/A	N/A	t
1110	\N	5	MONSALVE	LUIS ALBERTO	0	58	N/A	N/A	0.0079	N/A	N/A	N/A	t
1126	\N	4	NASCIMIENTO	FATIMA DE JESUS	0	1	N/A	N/A	0.0079	N/A	N/A	N/A	t
1148	\N	7	NOBREGA	DANILO	0	112	N/A	N/A	0.0171	N/A	N/A	N/A	t
1179	\N	1	OSORIO	ALEJANDRO	0	1	N/A	N/A	0.0046	N/A	N/A	N/A	t
1191	\N	3	PANZA	ANTONIO	0	99	N/A	N/A	0.0089	N/A	N/A	N/A	t
1192	\N	3	PANZA	ANTONIO	0	100	N/A	N/A	0.0086	N/A	N/A	N/A	t
1217	\N	4	PEREZ OLVARES	YARBIC CAROLINA	0	103	N/A	N/A	0.0086	N/A	N/A	N/A	t
1254	\N	2	RAMIREZ	JOSE JACINTO	0	1	N/A	N/A	0.0079	N/A	N/A	N/A	t
1256	\N	PB	RAMIREZ D.	KENNETH RODDGERS	0	95	N/A	N/A	0.0127	N/A	N/A	N/A	t
1257	\N	3	RAMIREZ D.	MARILYN LIDSAY	0	101	N/A	N/A	0.0089	N/A	N/A	N/A	t
1263	\N	PB	RAMOS	RAFAEL JOSE	0	1	N/A	N/A	0.0112	N/A	N/A	N/A	t
1272	\N	PB	RAVELO	ROGER	0	1	N/A	N/A	0.0053	N/A	N/A	N/A	t
1284	\N	6	REY	PEDRO ELIANT	0	110	N/A	N/A	0.0089	N/A	N/A	N/A	t
1286	\N	5	REY LORENZO	JORGE	0	75	N/A	N/A	0.0085	N/A	N/A	N/A	t
1288	\N	2	REZETTI	DANIELA E.	0	1	N/A	N/A	0.0067	N/A	N/A	N/A	t
1327	\N	3	ROJAS	JOSE JACINTO	0	1	N/A	N/A	0.0079	N/A	N/A	N/A	t
1337	\N	PB	RONALD SALAS	RODNEY SALAS	0	1	N/A	N/A	0.0101	N/A	N/A	N/A	t
1354	\N	6	RUBENS R.	ROMERO BARON	0	2	N/A	N/A	0.0098	N/A	N/A	N/A	t
1376	\N	1	SANTANA	ALBERTO	0	68	N/A	N/A	0.0120	N/A	N/A	N/A	t
1411	\N	3	SORIANO	ALEX	0	1	N/A	N/A	0.0067	N/A	N/A	N/A	t
1420	\N	1	SURIANI SORIANI	GIUSEPPE	0	1	N/A	N/A	0.0080	N/A	N/A	N/A	t
1465	\N	3	VENTURA	JOSE DE JESUS	0	72	N/A	N/A	0.0087	N/A	N/A	N/A	t
1466	\N	1	VERONICA A.	LOZADA	0	2	N/A	N/A	0.0083	N/A	N/A	N/A	t
1481	\N	1	VIEIRA DA SILVA	JOSE JORGE	0	1	N/A	N/A	0.0085	N/A	N/A	N/A	t
1486	\N	4	VILLALOBOS	HOWARD DE JESUS	0	1	N/A	N/A	0.0083	N/A	N/A	N/A	t
1495	\N	5	WANDELINDER RODRIGUEZ	TREBLINK OMAR	0	87	N/A	N/A	0.0085	N/A	N/A	N/A	t
1523	\N	4	YEPEZ	FRANCISCO J.	0	102	N/A	N/A	0.0089	N/A	N/A	N/A	t
1525	\N	6	YESSICA	NAIRUD RAMOS	0	2	N/A	N/A	0.0123	N/A	N/A	N/A	t
1530	\N	4	YOSELINM	CATHERINE MARTINEZ	0	2	N/A	N/A	0.0067	N/A	N/A	N/A	t
419	\N	7	DOMINGO	CHOQUE C.	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
470	\N	12	ENCARNACION	BRIEGA	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
1539	\N	6	ZAMBRANO PAGUA	JACK CARMELO	0	2	N/A	N/A	0.0117	N/A	N/A	N/A	t
394	\N	6	DE F.	JULIO Q. DE FREITAS	0	90	N/A	N/A	0.0085	N/A	N/A	N/A	t
599	\N	4	GOMEZ DE ROJAS	ANA MARIA	0	104	N/A	N/A	0.0091	N/A	N/A	N/A	t
651	\N	2	HNEICH NASSOUR	JEAN CARLO	0	1	N/A	N/A	0.0083	N/A	N/A	N/A	t
1280	\N	4	RENDON	ANA YURAIMA	0	1	N/A	N/A	0.0046	N/A	N/A	N/A	t
872	\N	01	KWOK  HUNG	NIP	0	7829637	N/A	N/A	0.0648	N/A	N/A	N/A	t
323	\N	PB	CHOCRON	PILAR	0	N/A	N/A	N/A	0.0249	N/A	N/A	N/A	t
324	\N	PB	CHOCRON	PILAR	0	N/A	N/A	N/A	0.0249	N/A	N/A	N/A	t
325	\N	PB	CHOCRON	PILAR	0	N/A	N/A	N/A	0.0249	N/A	N/A	N/A	t
396	\N	5	DE GRATEROL	CARMEN YOLANDA	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
402	\N	5	DE RUIBAL FERNANDEZ	AURORA	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
405	\N	10	DELGADO VELASQUEZ	HECTOR JOSE	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
443	\N	3	EGUI	GUSTAVO	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
557	\N	4	GAITAN VILLAMIZAR	OSCAR ORLANDO	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
562	\N	5	GARCIA MARCANO	LUISA MERCEDES	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
604	\N	8	GONZALEZ	MARIA DEL CARMEN	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
630	\N	11	GUTIERREZ	JOSE RAMON	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
640	\N	6	HENRIQUEZ LOPEZ	HERNAN	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
641	\N	8	HENRIQUEZ LOPEZ	HERNAN	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
767	\N	13	JIMENEZ	JANET JULIETA	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
845	\N	13	JUAN COLMENARES P.	SUCESION	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
888	\N	11	LEON RODRIGUEZ	AMARILIS	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
972	\N	2	MAILLO	FRANCISCO	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
981	\N	13	MANZO Q,	VICTOR VICENTE	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
1067	\N	3	MAS SAEZ	JORGE	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
1070	\N	1	MATERAN GUTIERREZ	MARIANO	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
1078	\N	2	MEDINA CASTILLO	CEFERINO	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
1079	\N	2	MEDINA CASTILLO	CEFERINO	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
1080	\N	2	MEDINA CASTILLO	CEFERINO	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
1115	\N	8	MORALIAN DE BEDROSIAN	ALICE	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
1174	\N	14	ORTIZ DE BURELLI RIVAS	OLGA	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
1190	\N	8	PANTALEO	MARIO	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
1214	\N	12	PERDOMO MARTINEZ	LUIS ALBERTO	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
1219	\N	PB	PIERRE	PANEYKO	0	N/A	N/A	N/A	0.0353	N/A	N/A	N/A	t
1220	\N	PB	PIERRE	PANEYKO	0	N/A	N/A	N/A	0.0353	N/A	N/A	N/A	t
1228	\N	12	PORRAS DE ESCAGEDO	ISABEL	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
1230	\N	6	PRIETO CONDE	CARLOS	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
1287	\N	3	REYES DE DOS RAMOS	HIRMA	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
1381	\N	5	SARCINA ORZA	ANIELLO	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
316	\N	10	CEDILLO V.	JOSE J.	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
510	\N	7	FEO C	ERNESTO	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
1101	\N	1	MIMOSA	LEYLEKIAN	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
1108	\N	12	MOLKO LINSEN	RENEE	0	N/A	N/A	N/A	0.0147	N/A	N/A	N/A	t
143	\N	16	ANTONIO	PADRINO	0	993-2540	N/A	N/A	0.0089	N/A	N/A	N/A	t
170	\N	11	ARTURO	RONALD	0	753-6514	N/A	N/A	0.0090	N/A	N/A	N/A	t
179	\N	2	AURORA  C.	IGLESIAS  Y  OTRO	0	751-6105; 751-6481	N/A	N/A	0.0062	N/A	N/A	N/A	t
218	\N	9	BLANCA	MACHADO	0	751-9528	N/A	N/A	0.0064	N/A	N/A	N/A	t
276	\N	13	CARLOS ANTONIO	SAAVEDRA	0	753-4751	N/A	N/A	0.0089	N/A	N/A	N/A	t
288	\N	3	CARMEN	PATIï¿œO	0	751-5940	N/A	N/A	0.0089	N/A	N/A	N/A	t
554	\N	8	GABRIELA	GRIMALDI	0	751-6969	N/A	N/A	0.0066	N/A	N/A	N/A	t
575	\N	14	GERSON DANIEL	MORENO RANGEL	0	754-0930	N/A	N/A	0.0090	N/A	N/A	N/A	t
628	\N	15	GUSTAVO  ENRIQUE	SANCHEZ	0	975-9669	N/A	N/A	0.0066	N/A	N/A	N/A	t
725	\N	7	IRENE	PEREZ  SCHAEL	0	864-1007	N/A	N/A	0.0066	N/A	N/A	N/A	t
1170	\N	11	OMAR	CORTINA	0	271	N/A	N/A	0.0132	N/A	N/A	N/A	t
1083	\N	2	MENDEZ	CARLOS	0	1	N/A	N/A	0.0067	N/A	N/A	N/A	t
813	\N	14	JOSE DAVID	AMARGOS  BEHAR	0	267-6343	N/A	N/A	0.0065	N/A	N/A	N/A	t
1372	\N	14	SALVADOR	SANTORO	0	267-6343	N/A	N/A	0.0089	N/A	N/A	N/A	t
8	\N	9	ABRAHAM	QUINTERO	0	751-5973;  862-2447	N/A	N/A	0.0090	N/A	N/A	N/A	t
38	\N	9	ALBERTO	OLIVAREZ	0	261-3439	N/A	N/A	0.0089	N/A	N/A	N/A	t
42	\N	5	ALBERTO  NINO	GABIDIO	0	753-9885	N/A	N/A	0.0090	N/A	N/A	N/A	t
60	\N	9	ALESIA   DE	VINCENZO  STARITA	0	753-5764;  OFIC:  577-3218	N/A	N/A	0.0089	N/A	N/A	N/A	t
63	\N	15	ALEXANDRA	LATUFF	0	751-9283	N/A	N/A	0.0089	N/A	N/A	N/A	t
345	\N	8	CIMA AVILA 23, C.A.	INVERSIONES	0	115	N/A	N/A	0.0084	N/A	N/A	N/A	t
346	\N	8	CIMA AVILA 23, C.A.	INVERSIONES	0	114	N/A	N/A	0.0127	N/A	N/A	N/A	t
863	\N	6	JUTRO, C.A.	INVERSIONES	0	64	N/A	N/A	0.0098	N/A	N/A	N/A	t
871	\N	7	KOPEC 59600, C. A.	INVERSIONES	0	79	N/A	N/A	0.0185	N/A	N/A	N/A	t
1082	\N	2	MENDEZ	BEATRIS	0	82	N/A	N/A	0.0085	N/A	N/A	N/A	t
1118	\N	5	MOSTAR, C.A.	INVERSIONES	0	2	N/A	N/A	0.0083	N/A	N/A	N/A	t
1368	\N	5	SALAZAR M.	ADRIANA ISABEL	0	88	N/A	N/A	0.0085	N/A	N/A	N/A	t
1416	\N	3	STAR 7 C.A.	INVERSIONES	0	84	N/A	N/A	0.0085	N/A	N/A	N/A	t
33	\N	6	ALBEA	DARIAS  DE  RAMIREZ	0	753-6847	N/A	N/A	0.0090	N/A	N/A	N/A	t
41	\N	13	ALBERTO  JOSE	JESURUM  ARELLANO	0	751-0305	N/A	N/A	0.0090	N/A	N/A	N/A	t
62	\N	8	ALEXANDER	PIï¿œA	0	751-7358	N/A	N/A	0.0089	N/A	N/A	N/A	t
72	\N	7	ALFREDO	MARANDO  FALCIGLIA	0	753-5407	N/A	N/A	0.0090	N/A	N/A	N/A	t
73	\N	12	ALFREDO	MARANDO  FALCIGLIA	0	751-7520	N/A	N/A	0.0089	N/A	N/A	N/A	t
653	\N	8	HOMERO R.	ORTIZ	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
685	\N	12	INES COVA	DE SOLOWJOV	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
745	\N	6	JAIME	PRATS CONDE	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
759	\N	9	JESUS	PARDO DURAN	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
791	\N	3	JOSE	MIJARES PENA	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
812	\N	PB	JOSE CARLOS	MARQUEZ FERREIRA	0	N/A	N/A	N/A	0.0204	N/A	N/A	N/A	t
832	\N	5	JUAN	MORA	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
862	\N	9	JULIO E. GONZALEZ	FRANCISCO J. GONZALEZ/	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
870	\N	1	KOCI	JAKIN	0	N/A	N/A	N/A	0.0100	N/A	N/A	N/A	t
906	\N	8	LILA JOSEFINA	SISIRUCA RODRIGUEZ	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
908	\N	6	LILIANA DEL VALLE	ROMERO ALBARRAN	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
913	\N	1	LIZARDO	GOMEZ REINOSO	0	N/A	N/A	N/A	0.0093	N/A	N/A	N/A	t
914	\N	2	LIZARDO	GOMEZ REINOSO	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
918	\N	1	LORENA J.	D''JESUS SANCHEZ	0	N/A	N/A	N/A	0.0093	N/A	N/A	N/A	t
961	\N	8	LUISA J.FRIAS	ARGIMIRO R. FRIAS/	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
1009	\N	9	MARIA ALBA	DE SORIA	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
1014	\N	8	MARIA CELMAR	PARRA CASTILLO	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
1046	\N	3	MARIO	DI LEONARDO DI PRIETO	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
1168	\N	4	OMAIRA	MORENO Z.	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
1169	\N	5	OMAIRA C	GASPERI	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
1213	\N	6	PENELOPE LUCIA	PERALDO PUENTE	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
1246	\N	2	RAFAEL OVIEDO	MARIA ROJAS/	0	N/A	N/A	N/A	0.0089	N/A	N/A	N/A	t
457	\N	1	ELISA TERESA	CEDEÃO D MARCO	15800535	242-9919	242-9919	prueba@prueba.com	0.0063	N/A	N/A	N/A	f
305	\N	4	CARRASCO	ADELA	0	N/A	N/A	N/A	0.0205	N/A	N/A	N/A	t
\.


--
-- TOC entry 2596 (class 0 OID 0)
-- Dependencies: 207
-- Name: cd_propietarios_cd_propietarios_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cd_propietarios_cd_propietarios_pk_seq', 1549, true);


--
-- TOC entry 2526 (class 0 OID 20095)
-- Dependencies: 208
-- Data for Name: cd_proveedores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cd_proveedores (cd_proveedores_pk, razon_social, beneficiario) FROM stdin;
\.


--
-- TOC entry 2597 (class 0 OID 0)
-- Dependencies: 209
-- Name: cd_proveedores_cd_proveedores_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cd_proveedores_cd_proveedores_pk_seq', 1, false);


--
-- TOC entry 2528 (class 0 OID 20100)
-- Dependencies: 210
-- Data for Name: cd_tipos_docs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cd_tipos_docs (cd_tipo_doc_pk, tipo_doc, descrip_doc) FROM stdin;
1	V	VENEZOLANO
2	E	EXTRANJERO
3	J	JURIDICO
\.


--
-- TOC entry 2598 (class 0 OID 0)
-- Dependencies: 211
-- Name: cd_tipos_docs_cd_tipo_doc_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cd_tipos_docs_cd_tipo_doc_pk_seq', 3, true);


--
-- TOC entry 2530 (class 0 OID 20105)
-- Dependencies: 212
-- Data for Name: cd_tipos_pagos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cd_tipos_pagos (cd_tipo_pago_pk, descrip_pago) FROM stdin;
1	DEPOSITO
2	TRANSFERENCIA
3	CHEQUE
\.


--
-- TOC entry 2599 (class 0 OID 0)
-- Dependencies: 213
-- Name: cd_tipos_pagos_cd_tipo_pago_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cd_tipos_pagos_cd_tipo_pago_pk_seq', 3, true);


--
-- TOC entry 2532 (class 0 OID 20110)
-- Dependencies: 214
-- Data for Name: facturas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY facturas (cd_factura_pk, cod_apto, edificio, nombre, apellido, alicuota, nr, fecha, total_gastos_mes, sub_total_alicuota, total_pagar_mes, deuda_actual, recibos, estatus_factura) FROM stdin;
1	03A	LOMA LINDA TOWN HOUSES	DE RON, SABRINA MUSSO		0.0082978	132071	ABRIL 2016	0	0	0	0	4	f
2	04A	LOMA LINDA TOWN HOUSES	DE BLANES, ALONSO GARCIA		0.0082768	132072	ABRIL 2016	0	0	6777	20393	1	f
3	101	LOMA LINDA TOWN HOUSES	DE RIOS, LEYDA ROJAS		0.0093340	132073	ABRIL 2016	0	0	6626	6626	2	f
4	102	LOMA LINDA TOWN HOUSES	BERTOU, CLAUDIA		0.0092609	132074	ABRIL 2016	0	0	7526	13495	2	f
5	103	LOMA LINDA TOWN HOUSES	RODRIGUEZ, ANA MARIA		0.0081851	132075	ABRIL 2016	0	0	6889	12761	1	f
6	104	LOMA LINDA TOWN HOUSES	VILORIA, OSMAN		0.0081689	132076	ABRIL 2016	0	0	6552	6552	2	f
7	105	LOMA LINDA TOWN HOUSES	GONZALEZ J., ESPERANZA		0.0081832	132077	ABRIL 2016	0	0	6590	11767	2	f
8	106	LOMA LINDA TOWN HOUSES	ALVAREZ, VICTOR		0.0081731	132078	ABRIL 2016	0	0	6602	11871	2	f
9	107	LOMA LINDA TOWN HOUSES	TRONCOSO, RODRIGO		0.0083476	132079	ABRIL 2016	0	0	6593	11773	4	f
10	108	LOMA LINDA TOWN HOUSES	BAPTISTA R, CAROLL E.		0.0082144	132080	ABRIL 2016	0	0	6816	20512	2	f
11	109	LOMA LINDA TOWN HOUSES	PEREZ, DELIA		0.0081191	132081	ABRIL 2016	0	0	6628	11834	4	f
12	110	LOMA LINDA TOWN HOUSES	NEGRON, MILAGROS		0.0081467	132082	ABRIL 2016	0	0	6632	19956	1	f
13	111	LOMA LINDA TOWN HOUSES	ANGELA M. DAZA V., ERIC J. PINT M./		0.0081575	132083	ABRIL 2016	0	0	6522	6522	1	f
14	112	LOMA LINDA TOWN HOUSES	BROCCO, ALEXANDRO		0.0082456	132084	ABRIL 2016	0	0	6531	6531	4	f
15	113	LOMA LINDA TOWN HOUSES	CAPRILI, FRANCO		0.0085053	132085	ABRIL 2016	0	0	6712	18005	2	f
16	114	LOMA LINDA TOWN HOUSES	BUSTAMANTE, MIMI		0.0084723	132086	ABRIL 2016	0	0	6861	12250	4	f
17	115	LOMA LINDA TOWN HOUSES	FRANCO, ALDRI		0.0086612	132087	ABRIL 2016	0	0	6918	20819	2	f
18	116	LOMA LINDA TOWN HOUSES	DA COSTA, FERNANDO		0.0086257	132088	ABRIL 2016	0	0	6986	12473	2	f
19	201	LOMA LINDA TOWN HOUSES	SANTANA, CAROLINA		0.0102330	132089	ABRIL 2016	0	0	6958	12423	1	f
20	202	LOMA LINDA TOWN HOUSES	BRICEÑO, EDUARDO		0.0105520	132090	ABRIL 2016	0	0	8184	8184	1	f
21	203	LOMA LINDA TOWN HOUSES	GARDIE, DALMIRO		0.0085419	132091	ABRIL 2016	0	0	8437	8437	1	f
22	204	LOMA LINDA TOWN HOUSES	MARQUEZ, GUADALUPE		0.0082240	132092	ABRIL 2016	0	0	6836	6836	4	f
23	205	LOMA LINDA TOWN HOUSES	CHANG, CARMEN		0.0082425	132093	ABRIL 2016	0	0	6716	20424	2	f
24	206	LOMA LINDA TOWN HOUSES	JORDAN, HERBERT		0.0085047	132094	ABRIL 2016	0	0	6598	3522	1	f
25	207	LOMA LINDA TOWN HOUSES	RODRIGUEZ, RAFAEL Y ZULEIDA		0.0085587	132095	ABRIL 2016	0	0	6807	6807	3	f
26	208	LOMA LINDA TOWN HOUSES	BORREGALES, JULIO		0.0084699	132096	ABRIL 2016	0	0	6955	17784	1	f
27	209	LOMA LINDA TOWN HOUSES	NOVIKOW, TAMARA		0.0085130	132097	ABRIL 2016	0	0	6779	6779	1	f
28	210	LOMA LINDA TOWN HOUSES	RODRIGUEZ, JOSE ALBERTO		0.0086377	132098	ABRIL 2016	0	0	6814	6814	2	f
29	211	LOMA LINDA TOWN HOUSES	ANTUNES, ROYSBELL		0.0086198	132099	ABRIL 2016	0	0	6913	7024	2	f
30	212	LOMA LINDA TOWN HOUSES	MARCANO, ISAIAS Y ADRIANA		0.0086701	132100	ABRIL 2016	0	0	6898	1807	1	f
31	213	LOMA LINDA TOWN HOUSES	BEATRIZ, GUILLERMO		0.0086624	132101	ABRIL 2016	0	0	6939	6939	1	f
32	214	LOMA LINDA TOWN HOUSES	PEREZ, NEILA		0.0086096	132102	ABRIL 2016	0	0	6933	6933	1	f
33	215	LOMA LINDA TOWN HOUSES	PROCOPIO, ELIZABETH		0.0086402	132103	ABRIL 2016	0	0	6891	6891	1	f
34	216	LOMA LINDA TOWN HOUSES	ANGARITA, HECTOR		0.0086234	132104	ABRIL 2016	0	0	6915	6915	2	f
35	217	LOMA LINDA TOWN HOUSES	GONZALEZ, ROMAN		0.0086402	132105	ABRIL 2016	0	0	6956	12420	2	f
36	218	LOMA LINDA TOWN HOUSES	SILVA, CARMEN ROSA		0.0086300	132106	ABRIL 2016	0	0	6915	-166	2	f
37	219	LOMA LINDA TOWN HOUSES	FERNANDEZ, MARLEN		0.0095996	132107	ABRIL 2016	0	0	6907	8979	2	f
38	220	LOMA LINDA TOWN HOUSES	LA ROSA, ENRIQUE		0.0097148	132108	ABRIL 2016	0	0	7679	5135	2	f
39	301	LOMA LINDA TOWN HOUSES	REBECCHI, CLAUDIA		0.0095876	132109	ABRIL 2016	0	0	7832	13983	1	f
40	302	LOMA LINDA TOWN HOUSES	FRANCHESCI, JESUS		0.0095421	132110	ABRIL 2016	0	0	7669	7669	6	f
41	303	LOMA LINDA TOWN HOUSES	GORDON, MARCOS		0.0084128	132111	ABRIL 2016	0	0	7921	37461	2	f
42	304	LOMA LINDA TOWN HOUSES	FUMAI, VITO		0.0083729	132112	ABRIL 2016	0	0	6734	-2934	3	f
43	305	LOMA LINDA TOWN HOUSES	SIMON, JEAN JACK		0.0084128	132113	ABRIL 2016	0	0	6805	17192	1	f
44	306	LOMA LINDA TOWN HOUSES	BOTERO, LUZ		0.0082978	132114	ABRIL 2016	0	0	6734	6734	4	f
45	307	LOMA LINDA TOWN HOUSES	JIMENEZ, LEOPOLDO		0.0082768	132115	ABRIL 2016	0	0	6766	19533	3	f
46	308	LOMA LINDA TOWN HOUSES	ANDUEZA MENDOZA, WILMER O.		0.0083728	132116	ABRIL 2016	0	0	6728	16998	3	f
47	309	LOMA LINDA TOWN HOUSES	MELENDES, RICARDO		0.0084128	132117	ABRIL 2016	0	0	6805	17226	21	f
48	310	LOMA LINDA TOWN HOUSES	BORGES, JORGE		0.0082978	132118	ABRIL 2016	0	0	7311	71402	2	f
49	311	LOMA LINDA TOWN HOUSES	ELIAS, MARIO ALEJANDRO		0.0083008	132119	ABRIL 2016	0	0	6694	11952	1	f
50	312	LOMA LINDA TOWN HOUSES	OVIEDO, RAQUEL		0.0083728	132120	ABRIL 2016	0	0	6644	6644	9	f
51	313	LOMA LINDA TOWN HOUSES	PEREZ, MARBIOLIS RORAIMA		0.0084027	132121	ABRIL 2016	0	0	7048	43042	1	f
52	314	LOMA LINDA TOWN HOUSES	VELASQUEZ, YENIAN		0.0083008	132122	ABRIL 2016	0	0	6725	6725	1	f
53	315	LOMA LINDA TOWN HOUSES	FLORENTINA SECONDULFO, JOSE ROURA		0.0082918	132123	ABRIL 2016	0	0	6644	6644	1	f
54	316	LOMA LINDA TOWN HOUSES	LUCY DE ABREU, JOSE ABREU Y		0.0154382	132124	ABRIL 2016	0	0	6638	6638	1	f
55	317	LOMA LINDA TOWN HOUSES	FERRARI, MARIA ANTONIETA		0.0155971	132125	ABRIL 2016	0	0	12329	12329	1	f
56	318	LOMA LINDA TOWN HOUSES	FLORES, ENRIQUE		0.0148721	132126	ABRIL 2016	0	0	12455	12455	3	f
57	319	LOMA LINDA TOWN HOUSES	GAMBOA, TAYNE		0.0161026	132127	ABRIL 2016	0	0	12016	26044	3	f
58	320	LOMA LINDA TOWN HOUSES	ALEXANDER CORDERO Y, BELKYS PRIETO		0.0082882	132128	ABRIL 2016	0	0	13056	32986	1	f
59	321	LOMA LINDA TOWN HOUSES	PIÑERO, RHANDY		0.0083176	132129	ABRIL 2016	0	0	6634	6634	1	f
60	322	LOMA LINDA TOWN HOUSES	GONZALEZ, FRANCISCO		0.0082888	132130	ABRIL 2016	0	0	6658	6658	1	f
61	323	LOMA LINDA TOWN HOUSES	PEREZ, TAYLOR Y NANCY		0.0082768	132131	ABRIL 2016	0	0	6635	6635	4	f
62	324	LOMA LINDA TOWN HOUSES	DE VILLORIA, SOLGEMY ARENCIBIA		0.0083434	132132	ABRIL 2016	0	0	6728	17118	2	f
63	325	LOMA LINDA TOWN HOUSES	SIERRA, ALEJANDRO		0.0094000	132133	ABRIL 2016	0	0	6730	12017	1	f
64	326	LOMA LINDA TOWN HOUSES	SANCHEZ, MARISOL		0.0094132	132134	ABRIL 2016	0	0	7520	7520	1	f
65	401	LOMA LINDA TOWN HOUSES	GONCALVES, LUIS		0.0095853	132135	ABRIL 2016	0	0	7530	7530	3	f
66	402	LOMA LINDA TOWN HOUSES	DIAZ, RENE		0.0095853	132136	ABRIL 2016	0	0	7785	19670	1	f
67	403	LOMA LINDA TOWN HOUSES	VARANESE, CARMELINA		0.0095853	132137	ABRIL 2016	0	0	7667	7667	1	f
68	404	LOMA LINDA TOWN HOUSES	DE ABREU, HORACIO		0.0095853	132138	ABRIL 2016	0	0	7667	7667	1	f
69	405	LOMA LINDA TOWN HOUSES	LOMA LINDA, TOWN HOUSE, C.A.		0.0167815	132139	ABRIL 2016	0	0	7667	7667	1	f
70	406	LOMA LINDA TOWN HOUSES	LOMA LINDA, TOWN HOUSE, C.A.		0.0167815	132140	ABRIL 2016	744867	12499	12499	12499	1	f
71	407	LOMA LINDA TOWN HOUSES	LOMA LINDA, TOWN HOUSE, C.A.		0.0167815	132141	ABRIL 2016	744867	12499	12499	12499	1	f
72	408	LOMA LINDA TOWN HOUSES	LOMA LINDA, TOWN HOUSE, C.A.		0.0167815	132142	ABRIL 2016	744867	12499	12499	12499	1	f
73	409	LOMA LINDA TOWN HOUSES	LUDEWIG, OTTO		0.0085083	132143	ABRIL 2016	744867	12499	12499	12499	50	f
74	410	LOMA LINDA TOWN HOUSES	MARTINEZ, GUSTAVO		0.0085083	132144	ABRIL 2016	0	0	7683	101862	1	f
75	411	LOMA LINDA TOWN HOUSES	GASCON, JOEL		0.0095853	132145	ABRIL 2016	0	0	6810	6810	64	f
76	412	LOMA LINDA TOWN HOUSES	HIDALGO Y., GRIDELIDIA		0.0095853	132146	ABRIL 2016	0	0	8743	125043	1	f
77	413	LOMA LINDA TOWN HOUSES	AYALA, ALEJANDRO		0.0149249	132147	ABRIL 2016	0	0	7667	7667	32	f
78	414	LOMA LINDA TOWN HOUSES	DELGADO, IRIS COROMOTO		0.0146250	132148	ABRIL 2016	0	0	13180	150648	3	f
79	415	LOMA LINDA TOWN HOUSES	DE LEONARDIS, RAFAELLE		0.0085083	132149	ABRIL 2016	0	0	11861	29967	2	f
80	416	LOMA LINDA TOWN HOUSES	DE FREITAS, JOSE		0.0085083	132150	ABRIL 2016	0	0	6863	12254	3	f
81	417	LOMA LINDA TOWN HOUSES	DIEZ, LOURDES		0.0085083	132151	ABRIL 2016	0	0	6865	12376	2	f
82	418	LOMA LINDA TOWN HOUSES	ASOREY, RUBEN		0.0085083	132152	ABRIL 2016	0	0	6863	12254	12	f
83	419	LOMA LINDA TOWN HOUSES	SANCHEZ, MARIA DEL CARMEN		0.0095853	132153	ABRIL 2016	0	0	7254	53479	2	f
84	420	LOMA LINDA TOWN HOUSES	GARCIA, MARGARITA		0.0095853	132154	ABRIL 2016	0	0	7727	13797	1	f
85	421	LOMA LINDA TOWN HOUSES	MAIONE, CLAUDIA		0.0085083	132155	ABRIL 2016	0	0	7667	7667	1	f
86	422	LOMA LINDA TOWN HOUSES	MAIONE, CLAUDIA		0.0082804	132156	ABRIL 2016	0	0	6810	6810	1	f
87	423	LOMA LINDA TOWN HOUSES	RIANII ARMAS, LUISA ELENA		0.0082792	132157	ABRIL 2016	0	0	6628	6628	16	f
88	424	LOMA LINDA TOWN HOUSES	IZAGUIRRE, MARIA ELENA		0.0085083	132158	ABRIL 2016	0	0	7134	60461	1	f
89	425	LOMA LINDA TOWN HOUSES	TATIANA PEÑA A., Y LUIS BRICEÑO		0.0085083	132159	ABRIL 2016	0	0	6810	6810	4	f
90	426	LOMA LINDA TOWN HOUSES	PACHECO MIRABAL, RAFAEL JOSE		0.0085083	132160	ABRIL 2016	0	0	6945	21057	1	f
91	427	LOMA LINDA TOWN HOUSES	WINSTON UJUETA, Y JACQUELINE ALVES		0.0095853	132161	ABRIL 2016	0	0	6810	6810	14	f
92	428	LOMA LINDA TOWN HOUSES	FIGUEIRA, ADELINO		0.0158219	132162	ABRIL 2016	0	0	8227	66877	1	f
93	429	LOMA LINDA TOWN HOUSES	VELASQUEZ, ROOSEVELT		0.0165440	132163	ABRIL 2016	0	0	12634	12634	1	f
94	430	LOMA LINDA TOWN HOUSES	CANELA, ANDRES		0.0160817	132164	ABRIL 2016	0	0	13210	13210	3	f
95	431	LOMA LINDA TOWN HOUSES	GURDIAL, PILAR		0.0082792	132165	ABRIL 2016	0	0	13039	32943	1	f
96	432	LOMA LINDA TOWN HOUSES	RODRIGUEZ, YUSMARY		0.0085083	132166	ABRIL 2016	0	0	6627	6627	2	f
97	433	LOMA LINDA TOWN HOUSES	GIL, FERNANDO		0.0085083	132167	ABRIL 2016	0	0	6863	12254	3	f
98	434	LOMA LINDA TOWN HOUSES	PIOVESAN, ROSANELLA		0.0082851	132168	ABRIL 2016	0	0	6915	17727	2	f
99	435	LOMA LINDA TOWN HOUSES	AYALA, ADRIANA		0.0082792	132169	ABRIL 2016	0	0	6684	11935	2	f
100	436	LOMA LINDA TOWN HOUSES	TROMBETTA, ENZO		0.0085083	132170	ABRIL 2016	0	0	6679	11926	3	f
101	437	LOMA LINDA TOWN HOUSES	ALVARADO, BRICCIA		0.0095853	132171	ABRIL 2016	0	0	6915	17470	1	f
102	438	LOMA LINDA TOWN HOUSES	RODRIGUEZ PITA, MANUEL		0.0095853	132172	ABRIL 2016	0	0	7667	7667	1	f
103	439	LOMA LINDA TOWN HOUSES	TOZZI, MARIANELLA		0.0095853	132173	ABRIL 2016	0	0	7667	7667	1	f
104	440	LOMA LINDA TOWN HOUSES	DE SOLA, ADRIANA		0.0095853	132174	ABRIL 2016	0	0	7667	7667	2	f
\.


--
-- TOC entry 2600 (class 0 OID 0)
-- Dependencies: 215
-- Name: facturas_cd_factura_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('facturas_cd_factura_pk_seq', 104, true);


--
-- TOC entry 2534 (class 0 OID 20118)
-- Dependencies: 216
-- Data for Name: facturas_gastos_comunes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY facturas_gastos_comunes (cod_gasto_comun_fk, cod_factura_fk) FROM stdin;
1	1
2	1
3	1
4	1
5	1
6	1
7	1
8	1
9	1
10	1
1	2
2	2
3	2
4	2
5	2
6	2
7	2
8	2
9	2
10	2
1	3
2	3
3	3
4	3
5	3
6	3
7	3
8	3
9	3
10	3
1	4
2	4
3	4
4	4
5	4
6	4
7	4
8	4
9	4
10	4
1	5
2	5
3	5
4	5
5	5
6	5
7	5
8	5
9	5
10	5
1	6
2	6
3	6
4	6
5	6
6	6
7	6
8	6
9	6
10	6
1	7
2	7
3	7
4	7
5	7
6	7
7	7
8	7
9	7
10	7
1	8
2	8
3	8
4	8
5	8
6	8
7	8
8	8
9	8
10	8
1	9
2	9
3	9
4	9
5	9
6	9
7	9
8	9
9	9
10	9
1	10
2	10
3	10
4	10
5	10
6	10
7	10
8	10
9	10
10	10
1	11
2	11
3	11
4	11
5	11
6	11
7	11
8	11
9	11
10	11
1	12
2	12
3	12
4	12
5	12
6	12
7	12
8	12
9	12
10	12
1	13
2	13
3	13
4	13
5	13
6	13
7	13
8	13
9	13
10	13
1	14
2	14
3	14
4	14
5	14
6	14
7	14
8	14
9	14
10	14
1	15
2	15
3	15
4	15
5	15
6	15
7	15
8	15
9	15
10	15
1	16
2	16
3	16
4	16
5	16
6	16
7	16
8	16
9	16
10	16
1	17
2	17
3	17
4	17
5	17
6	17
7	17
8	17
9	17
10	17
1	18
2	18
3	18
4	18
5	18
6	18
7	18
8	18
9	18
10	18
1	19
2	19
3	19
4	19
5	19
6	19
7	19
8	19
9	19
10	19
1	20
2	20
3	20
4	20
5	20
6	20
7	20
8	20
9	20
10	20
1	21
2	21
3	21
4	21
5	21
6	21
7	21
8	21
9	21
10	21
1	22
2	22
3	22
4	22
5	22
6	22
7	22
8	22
9	22
10	22
1	23
2	23
3	23
4	23
5	23
6	23
7	23
8	23
9	23
10	23
1	24
2	24
3	24
4	24
5	24
6	24
7	24
8	24
9	24
10	24
1	25
2	25
3	25
4	25
5	25
6	25
7	25
8	25
9	25
10	25
1	26
2	26
3	26
4	26
5	26
6	26
7	26
8	26
9	26
10	26
1	27
2	27
3	27
4	27
5	27
6	27
7	27
8	27
9	27
10	27
1	28
2	28
3	28
4	28
5	28
6	28
7	28
8	28
9	28
10	28
1	29
2	29
3	29
4	29
5	29
6	29
7	29
8	29
9	29
10	29
1	30
2	30
3	30
4	30
5	30
6	30
7	30
8	30
9	30
10	30
1	31
2	31
3	31
4	31
5	31
6	31
7	31
8	31
9	31
10	31
1	32
2	32
3	32
4	32
5	32
6	32
7	32
8	32
9	32
10	32
1	33
2	33
3	33
4	33
5	33
6	33
7	33
8	33
9	33
10	33
1	34
2	34
3	34
4	34
5	34
6	34
7	34
8	34
9	34
10	34
1	35
2	35
3	35
4	35
5	35
6	35
7	35
8	35
9	35
10	35
1	36
2	36
3	36
4	36
5	36
6	36
7	36
8	36
9	36
10	36
1	37
2	37
3	37
4	37
5	37
6	37
7	37
8	37
9	37
10	37
1	38
2	38
3	38
4	38
5	38
6	38
7	38
8	38
9	38
10	38
1	39
2	39
3	39
4	39
5	39
6	39
7	39
8	39
9	39
10	39
1	40
2	40
3	40
4	40
5	40
6	40
7	40
8	40
9	40
10	40
1	41
2	41
3	41
4	41
5	41
6	41
7	41
8	41
9	41
10	41
1	42
2	42
3	42
4	42
5	42
6	42
7	42
8	42
9	42
10	42
1	43
2	43
3	43
4	43
5	43
6	43
7	43
8	43
9	43
10	43
1	44
2	44
3	44
4	44
5	44
6	44
7	44
8	44
9	44
10	44
1	45
2	45
3	45
4	45
5	45
6	45
7	45
8	45
9	45
10	45
1	46
2	46
3	46
4	46
5	46
6	46
7	46
8	46
9	46
10	46
1	47
2	47
3	47
4	47
5	47
6	47
7	47
8	47
9	47
10	47
1	48
2	48
3	48
4	48
5	48
6	48
7	48
8	48
9	48
10	48
1	49
2	49
3	49
4	49
5	49
6	49
7	49
8	49
9	49
10	49
1	50
2	50
3	50
4	50
5	50
6	50
7	50
8	50
9	50
10	50
1	51
2	51
3	51
4	51
5	51
6	51
7	51
8	51
9	51
10	51
1	52
2	52
3	52
4	52
5	52
6	52
7	52
8	52
9	52
10	52
1	53
2	53
3	53
4	53
5	53
6	53
7	53
8	53
9	53
10	53
1	54
2	54
3	54
4	54
5	54
6	54
7	54
8	54
9	54
10	54
1	55
2	55
3	55
4	55
5	55
6	55
7	55
8	55
9	55
10	55
1	56
2	56
3	56
4	56
5	56
6	56
7	56
8	56
9	56
10	56
1	57
2	57
3	57
4	57
5	57
6	57
7	57
8	57
9	57
10	57
1	58
2	58
3	58
4	58
5	58
6	58
7	58
8	58
9	58
10	58
1	59
2	59
3	59
4	59
5	59
6	59
7	59
8	59
9	59
10	59
1	60
2	60
3	60
4	60
5	60
6	60
7	60
8	60
9	60
10	60
1	61
2	61
3	61
4	61
5	61
6	61
7	61
8	61
9	61
10	61
1	62
2	62
3	62
4	62
5	62
6	62
7	62
8	62
9	62
10	62
1	63
2	63
3	63
4	63
5	63
6	63
7	63
8	63
9	63
10	63
1	64
2	64
3	64
4	64
5	64
6	64
7	64
8	64
9	64
10	64
1	65
2	65
3	65
4	65
5	65
6	65
7	65
8	65
9	65
10	65
1	66
2	66
3	66
4	66
5	66
6	66
7	66
8	66
9	66
10	66
1	67
2	67
3	67
4	67
5	67
6	67
7	67
8	67
9	67
10	67
1	68
2	68
3	68
4	68
5	68
6	68
7	68
8	68
9	68
10	68
1	69
2	69
3	69
4	69
5	69
6	69
7	69
8	69
9	69
10	69
1	70
2	70
3	70
4	70
5	70
6	70
7	70
8	70
9	70
10	70
1	71
2	71
3	71
4	71
5	71
6	71
7	71
8	71
9	71
10	71
1	72
2	72
3	72
4	72
5	72
6	72
7	72
8	72
9	72
10	72
1	73
2	73
3	73
4	73
5	73
6	73
7	73
8	73
9	73
10	73
1	74
2	74
3	74
4	74
5	74
6	74
7	74
8	74
9	74
10	74
1	75
2	75
3	75
4	75
5	75
6	75
7	75
8	75
9	75
10	75
1	76
2	76
3	76
4	76
5	76
6	76
7	76
8	76
9	76
10	76
1	77
2	77
3	77
4	77
5	77
6	77
7	77
8	77
9	77
10	77
1	78
2	78
3	78
4	78
5	78
6	78
7	78
8	78
9	78
10	78
1	79
2	79
3	79
4	79
5	79
6	79
7	79
8	79
9	79
10	79
1	80
2	80
3	80
4	80
5	80
6	80
7	80
8	80
9	80
10	80
1	81
2	81
3	81
4	81
5	81
6	81
7	81
8	81
9	81
10	81
1	82
2	82
3	82
4	82
5	82
6	82
7	82
8	82
9	82
10	82
1	83
2	83
3	83
4	83
5	83
6	83
7	83
8	83
9	83
10	83
1	84
2	84
3	84
4	84
5	84
6	84
7	84
8	84
9	84
10	84
1	85
2	85
3	85
4	85
5	85
6	85
7	85
8	85
9	85
10	85
1	86
2	86
3	86
4	86
5	86
6	86
7	86
8	86
9	86
10	86
1	87
2	87
3	87
4	87
5	87
6	87
7	87
8	87
9	87
10	87
1	88
2	88
3	88
4	88
5	88
6	88
7	88
8	88
9	88
10	88
1	89
2	89
3	89
4	89
5	89
6	89
7	89
8	89
9	89
10	89
1	90
2	90
3	90
4	90
5	90
6	90
7	90
8	90
9	90
10	90
1	91
2	91
3	91
4	91
5	91
6	91
7	91
8	91
9	91
10	91
1	92
2	92
3	92
4	92
5	92
6	92
7	92
8	92
9	92
10	92
1	93
2	93
3	93
4	93
5	93
6	93
7	93
8	93
9	93
10	93
1	94
2	94
3	94
4	94
5	94
6	94
7	94
8	94
9	94
10	94
1	95
2	95
3	95
4	95
5	95
6	95
7	95
8	95
9	95
10	95
1	96
2	96
3	96
4	96
5	96
6	96
7	96
8	96
9	96
10	96
1	97
2	97
3	97
4	97
5	97
6	97
7	97
8	97
9	97
10	97
1	98
2	98
3	98
4	98
5	98
6	98
7	98
8	98
9	98
10	98
1	99
2	99
3	99
4	99
5	99
6	99
7	99
8	99
9	99
10	99
1	100
2	100
3	100
4	100
5	100
6	100
7	100
8	100
9	100
10	100
1	101
2	101
3	101
4	101
5	101
6	101
7	101
8	101
9	101
10	101
1	102
2	102
3	102
4	102
5	102
6	102
7	102
8	102
9	102
10	102
1	103
2	103
3	103
4	103
5	103
6	103
7	103
8	103
9	103
10	103
1	104
2	104
3	104
4	104
5	104
6	104
7	104
8	104
9	104
10	104
\.


--
-- TOC entry 2535 (class 0 OID 20121)
-- Dependencies: 217
-- Data for Name: fondos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY fondos (cd_fondo_pk, cod_factura_fk, descripcion, saldo_anterior, cota_mes, cargo, saldo_actual) FROM stdin;
1	1	FONDO DE RESERVA	885873	67715	0	953588
2	1	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
3	1	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
4	2	FONDO DE RESERVA	885873	67715	0	953588
5	2	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
6	2	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
7	3	FONDO DE RESERVA	885873	67715	0	953588
8	3	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
9	3	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
10	4	FONDO DE RESERVA	885873	67715	0	953588
11	4	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
12	4	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
13	5	FONDO DE RESERVA	885873	67715	0	953588
14	5	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
15	5	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
16	6	FONDO DE RESERVA	885873	67715	0	953588
17	6	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
18	6	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
19	7	FONDO DE RESERVA	885873	67715	0	953588
20	7	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
21	7	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
22	8	FONDO DE RESERVA	885873	67715	0	953588
23	8	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
24	8	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
25	9	FONDO DE RESERVA	885873	67715	0	953588
26	9	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
27	9	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
28	10	FONDO DE RESERVA	885873	67715	0	953588
29	10	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
30	10	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
31	11	FONDO DE RESERVA	885873	67715	0	953588
32	11	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
33	11	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
34	12	FONDO DE RESERVA	885873	67715	0	953588
35	12	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
36	12	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
37	13	FONDO DE RESERVA	885873	67715	0	953588
38	13	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
39	13	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
40	14	FONDO DE RESERVA	885873	67715	0	953588
41	14	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
42	14	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
43	15	FONDO DE RESERVA	885873	67715	0	953588
44	15	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
45	15	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
46	16	FONDO DE RESERVA	885873	67715	0	953588
47	16	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
48	16	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
49	17	FONDO DE RESERVA	885873	67715	0	953588
50	17	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
51	17	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
52	18	FONDO DE RESERVA	885873	67715	0	953588
53	18	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
54	18	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
55	19	FONDO DE RESERVA	885873	67715	0	953588
56	19	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
57	19	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
58	20	FONDO DE RESERVA	885873	67715	0	953588
59	20	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
60	20	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
61	21	FONDO DE RESERVA	885873	67715	0	953588
62	21	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
63	21	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
64	22	FONDO DE RESERVA	885873	67715	0	953588
65	22	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
66	22	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
67	23	FONDO DE RESERVA	885873	67715	0	953588
68	23	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
69	23	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
70	24	FONDO DE RESERVA	885873	67715	0	953588
71	24	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
72	24	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
73	25	FONDO DE RESERVA	885873	67715	0	953588
74	25	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
75	25	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
76	26	FONDO DE RESERVA	885873	67715	0	953588
77	26	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
78	26	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
79	27	FONDO DE RESERVA	885873	67715	0	953588
80	27	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
81	27	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
82	28	FONDO DE RESERVA	885873	67715	0	953588
83	28	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
84	28	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
85	29	FONDO DE RESERVA	885873	67715	0	953588
86	29	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
87	29	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
88	30	FONDO DE RESERVA	885873	67715	0	953588
89	30	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
90	30	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
91	31	FONDO DE RESERVA	885873	67715	0	953588
92	31	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
93	31	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
94	32	FONDO DE RESERVA	885873	67715	0	953588
95	32	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
96	32	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
97	33	FONDO DE RESERVA	885873	67715	0	953588
98	33	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
99	33	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
100	34	FONDO DE RESERVA	885873	67715	0	953588
101	34	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
102	34	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
103	35	FONDO DE RESERVA	885873	67715	0	953588
104	35	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
105	35	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
106	36	FONDO DE RESERVA	885873	67715	0	953588
107	36	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
108	36	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
109	37	FONDO DE RESERVA	885873	67715	0	953588
110	37	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
111	37	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
112	38	FONDO DE RESERVA	885873	67715	0	953588
113	38	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
114	38	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
115	39	FONDO DE RESERVA	885873	67715	0	953588
116	39	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
117	39	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
118	40	FONDO DE RESERVA	885873	67715	0	953588
119	40	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
120	40	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
121	41	FONDO DE RESERVA	885873	67715	0	953588
122	41	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
123	41	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
124	42	FONDO DE RESERVA	885873	67715	0	953588
125	42	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
126	42	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
127	43	FONDO DE RESERVA	885873	67715	0	953588
128	43	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
129	43	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
130	44	FONDO DE RESERVA	885873	67715	0	953588
131	44	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
132	44	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
133	45	FONDO DE RESERVA	885873	67715	0	953588
134	45	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
135	45	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
136	46	FONDO DE RESERVA	885873	67715	0	953588
137	46	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
138	46	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
139	47	FONDO DE RESERVA	885873	67715	0	953588
140	47	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
141	47	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
142	48	FONDO DE RESERVA	885873	67715	0	953588
143	48	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
144	48	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
145	49	FONDO DE RESERVA	885873	67715	0	953588
146	49	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
147	49	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
148	50	FONDO DE RESERVA	885873	67715	0	953588
149	50	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
150	50	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
151	51	FONDO DE RESERVA	885873	67715	0	953588
152	51	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
153	51	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
154	52	FONDO DE RESERVA	885873	67715	0	953588
155	52	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
156	52	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
157	53	FONDO DE RESERVA	885873	67715	0	953588
158	53	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
159	53	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
160	54	FONDO DE RESERVA	885873	67715	0	953588
161	54	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
162	54	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
163	55	FONDO DE RESERVA	885873	67715	0	953588
164	55	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
165	55	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
166	56	FONDO DE RESERVA	885873	67715	0	953588
167	56	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
168	56	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
169	57	FONDO DE RESERVA	885873	67715	0	953588
170	57	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
171	57	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
172	58	FONDO DE RESERVA	885873	67715	0	953588
173	58	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
174	58	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
175	59	FONDO DE RESERVA	885873	67715	0	953588
176	59	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
177	59	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
178	60	FONDO DE RESERVA	885873	67715	0	953588
179	60	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
180	60	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
181	61	FONDO DE RESERVA	885873	67715	0	953588
182	61	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
183	61	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
184	62	FONDO DE RESERVA	885873	67715	0	953588
185	62	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
186	62	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
187	63	FONDO DE RESERVA	885873	67715	0	953588
188	63	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
189	63	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
190	64	FONDO DE RESERVA	885873	67715	0	953588
191	64	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
192	64	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
193	65	FONDO DE RESERVA	885873	67715	0	953588
194	65	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
195	65	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
196	66	FONDO DE RESERVA	885873	67715	0	953588
197	66	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
198	66	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
199	67	FONDO DE RESERVA	885873	67715	0	953588
200	67	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
201	67	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
202	68	FONDO DE RESERVA	885873	67715	0	953588
203	68	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
204	68	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
205	69	FONDO DE RESERVA	885873	67715	0	953588
206	69	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
207	69	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
208	70	FONDO DE RESERVA	885873	67715	0	953588
209	70	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
210	70	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
211	71	FONDO DE RESERVA	885873	67715	0	953588
212	71	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
213	71	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
214	72	FONDO DE RESERVA	885873	67715	0	953588
215	72	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
216	72	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
217	73	FONDO DE RESERVA	885873	67715	0	953588
218	73	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
219	73	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
220	74	FONDO DE RESERVA	885873	67715	0	953588
221	74	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
222	74	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
223	75	FONDO DE RESERVA	885873	67715	0	953588
224	75	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
225	75	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
226	76	FONDO DE RESERVA	885873	67715	0	953588
227	76	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
228	76	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
229	77	FONDO DE RESERVA	885873	67715	0	953588
230	77	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
231	77	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
232	78	FONDO DE RESERVA	885873	67715	0	953588
233	78	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
234	78	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
235	79	FONDO DE RESERVA	885873	67715	0	953588
236	79	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
237	79	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
238	80	FONDO DE RESERVA	885873	67715	0	953588
239	80	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
240	80	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
241	81	FONDO DE RESERVA	885873	67715	0	953588
242	81	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
243	81	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
244	82	FONDO DE RESERVA	885873	67715	0	953588
245	82	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
246	82	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
247	83	FONDO DE RESERVA	885873	67715	0	953588
248	83	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
249	83	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
250	84	FONDO DE RESERVA	885873	67715	0	953588
251	84	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
252	84	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
253	85	FONDO DE RESERVA	885873	67715	0	953588
254	85	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
255	85	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
256	86	FONDO DE RESERVA	885873	67715	0	953588
257	86	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
258	86	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
259	87	FONDO DE RESERVA	885873	67715	0	953588
260	87	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
261	87	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
262	88	FONDO DE RESERVA	885873	67715	0	953588
263	88	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
264	88	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
265	89	FONDO DE RESERVA	885873	67715	0	953588
266	89	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
267	89	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
268	90	FONDO DE RESERVA	885873	67715	0	953588
269	90	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
270	90	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
271	91	FONDO DE RESERVA	885873	67715	0	953588
272	91	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
273	91	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
274	92	FONDO DE RESERVA	885873	67715	0	953588
275	92	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
276	92	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
277	93	FONDO DE RESERVA	885873	67715	0	953588
278	93	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
279	93	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
280	94	FONDO DE RESERVA	885873	67715	0	953588
281	94	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
282	94	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
283	95	FONDO DE RESERVA	885873	67715	0	953588
284	95	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
285	95	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
286	96	FONDO DE RESERVA	885873	67715	0	953588
287	96	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
288	96	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
289	97	FONDO DE RESERVA	885873	67715	0	953588
290	97	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
291	97	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
292	98	FONDO DE RESERVA	885873	67715	0	953588
293	98	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
294	98	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
295	99	FONDO DE RESERVA	885873	67715	0	953588
296	99	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
297	99	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
298	100	FONDO DE RESERVA	885873	67715	0	953588
299	100	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
300	100	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
301	101	FONDO DE RESERVA	885873	67715	0	953588
302	101	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
303	101	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
304	102	FONDO DE RESERVA	885873	67715	0	953588
305	102	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
306	102	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
307	103	FONDO DE RESERVA	885873	67715	0	953588
308	103	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
309	103	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
310	104	FONDO DE RESERVA	885873	67715	0	953588
311	104	FONDO DE ARRANQUE 2 DE 2	70000	0	0	70000
312	104	FONDO DE CONTINGENCIA APROB. ASAMBLEA 6 DE 6	210000	0	0	210000
\.


--
-- TOC entry 2601 (class 0 OID 0)
-- Dependencies: 218
-- Name: fondos_cd_fondo_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('fondos_cd_fondo_pk_seq', 312, true);


--
-- TOC entry 2537 (class 0 OID 20133)
-- Dependencies: 219
-- Data for Name: gastos_comunes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY gastos_comunes (cd_gasto_comun_pk, descripcion, monto) FROM stdin;
1	HIDROCAPITAL 02/03/2016 A 04/04/2016	10515
2	VIGILANCIA PRIVADA ABRIL 2016	165000
3	LIMP. TALUD CONT. APROB. EN ASAMBLEA ABRIL-2016	138000
4	APORTE ASOC. VEC. LLTH PARA VIGILANCIA Y JARD.ABRIL-16	150000
5	ELECTRICIDAD ABRIL 2016	415
6	GASTOS DE ADMINISTRACION ABRIL-2016	29120
7	GASTOS DE CAJA CHICA ABRIL-2016	34200
8	CUOTA ELABORACION DE POLICIAS ACOSTADOS	120000
9	COMPRA DE BOMBILLOS	22102
10	UTENSILIOS DE JARDINERIA	7800
\.


--
-- TOC entry 2602 (class 0 OID 0)
-- Dependencies: 220
-- Name: gastos_comunes_cd_gasto_comun_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('gastos_comunes_cd_gasto_comun_pk_seq', 10, true);


--
-- TOC entry 2539 (class 0 OID 20141)
-- Dependencies: 221
-- Data for Name: gastos_nocomunes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY gastos_nocomunes (cd_gasto_nocomun_pk, cod_factura_fk, descripcion, monto) FROM stdin;
1	1	INTERESES DE MORA	135
2	1	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	462
3	2	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	461
4	3	INTERESES DE MORA	59
5	3	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	515
6	4	INTERESES DE MORA	58
7	4	ABONO AL RECIBO NO EJECUTADO	-578
8	4	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	511
9	5	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	456
10	6	INTERESES DE MORA	51
11	6	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	455
12	7	INTERESES DE MORA	51
13	7	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	456
14	8	INTERESES DE MORA	51
15	8	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	455
16	9	INTERESES DE MORA	135
17	9	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	464
18	10	INTERESES DE MORA	52
19	10	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	458
20	11	INTERESES DE MORA	132
21	11	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	453
22	12	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	454
23	13	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	455
24	14	INTERESES DE MORA	112
25	14	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	459
26	15	INTERESES DE MORA	53
27	15	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	473
28	16	INTERESES DE MORA	137
29	16	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	471
30	17	INTERESES DE MORA	54
31	17	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	481
32	18	INTERESES DE MORA	54
33	18	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	479
34	19	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	562
35	20	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	578
36	21	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	474
37	22	INTERESES DE MORA	133
38	22	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	458
39	23	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	459
40	24	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	473
41	25	INTERESES DE MORA	105
42	25	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	475
43	26	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	471
44	27	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	473
45	28	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	479
46	29	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	478
47	30	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	481
48	31	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	481
49	32	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	478
50	33	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	480
51	34	INTERESES DE MORA	54
52	34	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	479
53	35	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	480
54	36	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	479
55	37	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	529
56	38	INTERESES DE MORA	61
57	38	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	535
58	39	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	528
59	40	INTERESES DE MORA	288
60	40	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	526
61	41	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	468
62	42	INTERESES DE MORA	103
63	42	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	466
64	43	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	468
65	44	INTERESES DE MORA	124
66	44	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	462
67	45	INTERESES DE MORA	102
68	45	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	461
69	46	INTERESES DE MORA	103
70	46	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	466
71	47	INTERESES DE MORA	577
72	47	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	468
73	48	INTERESES DE MORA	52
74	48	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	462
75	49	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	462
76	50	INTERESES DE MORA	346
77	50	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	466
78	51	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	467
79	52	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	462
80	53	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	462
81	54	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	830
82	55	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	838
83	56	INTERESES DE MORA	139
84	56	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	800
85	57	INTERESES DE MORA	198
86	57	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	864
87	58	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	461
88	59	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	463
89	60	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	461
90	61	INTERESES DE MORA	102
91	61	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	461
92	62	INTERESES DE MORA	52
93	62	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	464
94	63	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	519
95	64	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	519
96	65	INTERESES DE MORA	118
97	65	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	528
98	66	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	528
99	67	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	528
100	68	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	528
101	73	INTERESES DE MORA	873
102	73	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	473
103	74	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	473
104	75	INTERESES DE MORA	1076
105	75	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	528
106	76	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	528
107	77	INTERESES DE MORA	1260
108	77	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	803
109	78	INTERESES DE MORA	180
110	78	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	788
111	79	INTERESES DE MORA	53
112	79	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	473
113	80	INTERESES DE MORA	55
114	80	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	473
115	81	INTERESES DE MORA	53
116	81	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	473
117	82	INTERESES DE MORA	444
118	82	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	473
119	83	INTERESES DE MORA	60
120	83	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	528
121	84	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	528
122	85	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	473
123	86	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	461
124	87	INTERESES DE MORA	507
125	87	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	461
126	88	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	473
127	89	INTERESES DE MORA	135
128	89	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	473
129	90	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	473
130	91	INTERESES DE MORA	560
131	91	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	528
132	92	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	849
133	93	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	887
134	94	INTERESES DE MORA	198
135	94	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	863
136	95	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	461
137	96	INTERESES DE MORA	53
138	96	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	473
139	97	INTERESES DE MORA	105
140	97	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	473
141	98	INTERESES DE MORA	52
142	98	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	461
143	99	INTERESES DE MORA	52
144	99	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	461
145	100	INTERESES DE MORA	105
146	100	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	473
147	101	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	528
148	102	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	528
149	103	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	528
150	104	INTERESES DE MORA	60
151	104	DEUDA T.HOUSE A REPARTIR / 100 T.H. APROB. ASAMBLEA ABR-16	528
\.


--
-- TOC entry 2603 (class 0 OID 0)
-- Dependencies: 222
-- Name: gastos_nocomunes_cd_gasto_nocomun_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('gastos_nocomunes_cd_gasto_nocomun_pk_seq', 151, true);


--
-- TOC entry 2552 (class 0 OID 20427)
-- Dependencies: 234
-- Data for Name: mensajes; Type: TABLE DATA; Schema: public; Owner: hjtecnos
--

COPY mensajes (cd_mensajes_pk, texto, msn_default) FROM stdin;
2	<p>CTA. CTE. &nbsp; BNC BANCO NACIONAL DE CREDITO &nbsp; # &nbsp;0191-0154-15-2100005915. &nbsp; &nbsp; &nbsp;&nbsp;<br />\r\nRIF CORREGIDO &nbsp;RIF- J-31622440-6</p>\r\n\r\n<p>CUANDO PAGUE SU RECIBO DE CONDOMINIO POR FAVOR ENVIAR UN CORREO A &nbsp; thlomalinda@gmail.com</p>\r\n\r\n<p>IMPORTANTE &nbsp; NUEVOS TELEF. &nbsp; 0212-715-3058 - 0212-214-8861</p>\r\n\r\n<p>ESTAREMOS COBRANDO EN EL CONJUNTO EL SABADO 14 Y EL SABADO 28 DE MAYO DE 2016</p>\r\n	f
\.


--
-- TOC entry 2604 (class 0 OID 0)
-- Dependencies: 233
-- Name: mensajes_cd_mensajes_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: hjtecnos
--

SELECT pg_catalog.setval('mensajes_cd_mensajes_pk_seq', 2, true);


--
-- TOC entry 2541 (class 0 OID 20149)
-- Dependencies: 223
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY menu (id, name, parent, route, "order", data) FROM stdin;
\.


--
-- TOC entry 2605 (class 0 OID 0)
-- Dependencies: 224
-- Name: menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('menu_id_seq', 1, false);


--
-- TOC entry 2543 (class 0 OID 20157)
-- Dependencies: 225
-- Data for Name: migration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY migration (version, apply_time) FROM stdin;
m000000_000000_base	1462978982
m130524_201442_init	1462978985
m140506_102106_rbac_init	1464693687
m140602_111327_create_menu_table	1464871526
m160312_050000_create_user	1464871526
\.


--
-- TOC entry 2544 (class 0 OID 20160)
-- Dependencies: 226
-- Data for Name: operaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY operaciones (id, nombre, descripcion) FROM stdin;
1	cd-conjuntos-index	Lista de Conjuntos
2	cd-conjuntos-create	Crear Conjunto
5	cd-conjuntos-view	Ver Conjunto
6	cd-conceptos-index	Lista de Conceptos
7	cd-conceptos-view	Ver Concepto
8	cd-conceptos-create	Crear Concepto
9	cd-conceptos-update	Actualizar Concepto
10	cd-conceptos-delete	Eliminar Concepto
11	operaciones-index	Lista de Operaciones
12	operaciones-view	Ver Operacion
16	roles-index	Lista de Roles
17	roles-view	Ver Rol
18	roles-create	Crear Rol
19	roles-update	Actualizar Rol
20	roles-delete	Eliminar Rol
21	user-index	Lista de Usuarios
22	user-view	Ver Usuario
23	user-create	Crear Usuario
24	user-update	Actualizar Usuario
25	user-delete	Eliminar Usuario
26	user-set-password	Asignar Password Usuario
27	cd-propietarios-index	Lista de Propietarios
31	cd-propietarios-delete	Eliminar Propietario
30	cd-propietarios-update	Actualizar Propietario
29	cd-propietarios-create	Crear Propietario
28	cd-propietarios-view	Ver Propietario
3	cd-conjuntos-update	Actualizar Conjunto
4	cd-conjuntos-delete	Eliminar Conjunto
32	files-file-load	Carga y Procesamiento de facturas
33	files-file-process	Procesar Archivo
13	operaciones-create	Crear Operación
14	operaciones-update	Actualizar Operación
15	operaciones-delete	Borrar Operación
34	mensajes-index	Lista de Mensajes
35	mensajes-view	Vista de Mensaje
36	mensajes-create	Crear Mensaje
37	mensajes-update	Actualizar Mensaje
38	mensajes-delete	Eliminar Mensaje
\.


--
-- TOC entry 2606 (class 0 OID 0)
-- Dependencies: 227
-- Name: operaciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('operaciones_id_seq', 38, true);


--
-- TOC entry 2546 (class 0 OID 20165)
-- Dependencies: 228
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY roles (id, nombre) FROM stdin;
2	Administrador
3	Usuario Estandar
1	Super Usuario
\.


--
-- TOC entry 2607 (class 0 OID 0)
-- Dependencies: 229
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('roles_id_seq', 7, true);


--
-- TOC entry 2548 (class 0 OID 20170)
-- Dependencies: 230
-- Data for Name: roles_operaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY roles_operaciones (rol_id, operacion_id) FROM stdin;
1	1
1	2
1	5
1	6
1	7
1	8
1	9
1	10
1	11
1	12
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
1	27
1	31
1	30
1	29
1	28
1	3
1	4
1	32
1	33
1	13
2	1
2	2
2	5
2	6
2	7
2	8
2	9
2	10
2	16
2	17
2	18
2	19
2	20
2	21
2	22
2	23
2	24
2	25
2	3
2	4
3	1
3	6
3	27
1	14
1	15
1	34
1	35
1	36
1	37
1	38
\.


--
-- TOC entry 2549 (class 0 OID 20173)
-- Dependencies: 231
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "user" (id, username, auth_key, password_hash, password_reset_token, email, status, created_at, updated_at, rol_id) FROM stdin;
1	root	moFHYdX57cwdFURVeuNNxTj_W7TY0JmZ	$2y$13$k4iIRdObMxmbtGMejFTLuO.OGkTzlH/YLVhdd541b2yiey5880uUy	\N	info@hjtecnosystems.com.ve	1	1464620742	1468202678	1
5	user	FPgx9Bb4z08wLnXStJ88uqRQEqiV1fE9	$2y$13$madgqryUUdSNM79TjQKenO8/P41K4a8PHIQ7l24kuI59CYbTIwZlO	\N	user@user.com	1	1468205244	1468205260	3
2	admin	YNpx8aveIJnohs2qt4gf-UJwLvcpjPam	$2y$13$V.mdU.Er9MYTpUwgW5x4v.eZqr1.q5awKPWd2JfaMX9mg.ZJBsfPu	\N	admin@condominio.com.ve	1	1464703400	1469831383	2
\.


--
-- TOC entry 2608 (class 0 OID 0)
-- Dependencies: 232
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_id_seq', 38, true);


--
-- TOC entry 2296 (class 2606 OID 20206)
-- Name: cd_aguas_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cd_aguas
    ADD CONSTRAINT cd_aguas_pk PRIMARY KEY (cd_aguas_pk);


--
-- TOC entry 2298 (class 2606 OID 20208)
-- Name: cd_aptos_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cd_aptos
    ADD CONSTRAINT cd_aptos_pk PRIMARY KEY (cd_aptos_pk, cod_edificio);


--
-- TOC entry 2300 (class 2606 OID 20210)
-- Name: cd_chequeras_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cd_chequeras
    ADD CONSTRAINT cd_chequeras_pk PRIMARY KEY (cd_chequeras_pk);


--
-- TOC entry 2302 (class 2606 OID 20212)
-- Name: cd_conceptos_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cd_conceptos
    ADD CONSTRAINT cd_conceptos_pk PRIMARY KEY (cd_conceptos_pk);


--
-- TOC entry 2304 (class 2606 OID 20214)
-- Name: cd_conjuntos_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cd_conjuntos
    ADD CONSTRAINT cd_conjuntos_pk PRIMARY KEY (cd_conjuntos_pk);


--
-- TOC entry 2306 (class 2606 OID 20216)
-- Name: cd_deudas_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cd_deudas
    ADD CONSTRAINT cd_deudas_pk PRIMARY KEY (cd_deudas_pk);


--
-- TOC entry 2308 (class 2606 OID 20218)
-- Name: cd_edificios_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cd_edificios
    ADD CONSTRAINT cd_edificios_pk PRIMARY KEY (cd_edificios_pk);


--
-- TOC entry 2310 (class 2606 OID 20220)
-- Name: cd_fondos_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cd_fondos
    ADD CONSTRAINT cd_fondos_pk PRIMARY KEY (cd_fondos_pk);


--
-- TOC entry 2312 (class 2606 OID 20222)
-- Name: cd_historicos_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cd_historicos
    ADD CONSTRAINT cd_historicos_pk PRIMARY KEY (cd_historicos_pk);


--
-- TOC entry 2314 (class 2606 OID 20224)
-- Name: cd_mantenimientos_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cd_mantenimientos
    ADD CONSTRAINT cd_mantenimientos_pk PRIMARY KEY (cd_mantenimientos_pk);


--
-- TOC entry 2316 (class 2606 OID 20226)
-- Name: cd_mov_chequeras_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cd_mov_chequeras
    ADD CONSTRAINT cd_mov_chequeras_pk PRIMARY KEY (cd_mov_chequeras_pk);


--
-- TOC entry 2318 (class 2606 OID 20228)
-- Name: cd_mov_mes_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cd_mov_mes
    ADD CONSTRAINT cd_mov_mes_pk PRIMARY KEY (cd_mov_mes_pk);


--
-- TOC entry 2320 (class 2606 OID 20230)
-- Name: cd_observaciones_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cd_observaciones
    ADD CONSTRAINT cd_observaciones_pk PRIMARY KEY (cd_observaciones_pk);


--
-- TOC entry 2322 (class 2606 OID 20232)
-- Name: cd_pago_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cd_pagos
    ADD CONSTRAINT cd_pago_pk PRIMARY KEY (cd_pago_pk);


--
-- TOC entry 2327 (class 2606 OID 20234)
-- Name: cd_propietarios_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cd_propietarios
    ADD CONSTRAINT cd_propietarios_pk PRIMARY KEY (cd_propietarios_pk);


--
-- TOC entry 2330 (class 2606 OID 20236)
-- Name: cd_proveedores_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cd_proveedores
    ADD CONSTRAINT cd_proveedores_pk PRIMARY KEY (cd_proveedores_pk);


--
-- TOC entry 2332 (class 2606 OID 20238)
-- Name: cd_tipo_doc_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cd_tipos_docs
    ADD CONSTRAINT cd_tipo_doc_pk PRIMARY KEY (cd_tipo_doc_pk);


--
-- TOC entry 2334 (class 2606 OID 20240)
-- Name: cd_tipo_pago_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cd_tipos_pagos
    ADD CONSTRAINT cd_tipo_pago_pk PRIMARY KEY (cd_tipo_pago_pk);


--
-- TOC entry 2336 (class 2606 OID 20242)
-- Name: facturas_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY facturas
    ADD CONSTRAINT facturas_pk PRIMARY KEY (cd_factura_pk);


--
-- TOC entry 2341 (class 2606 OID 20244)
-- Name: fondos_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fondos
    ADD CONSTRAINT fondos_pk PRIMARY KEY (cd_fondo_pk);


--
-- TOC entry 2343 (class 2606 OID 20246)
-- Name: gastos_comunes_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gastos_comunes
    ADD CONSTRAINT gastos_comunes_pk PRIMARY KEY (cd_gasto_comun_pk);


--
-- TOC entry 2346 (class 2606 OID 20248)
-- Name: gastos_nocomunes_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gastos_nocomunes
    ADD CONSTRAINT gastos_nocomunes_pk PRIMARY KEY (cd_gasto_nocomun_pk);


--
-- TOC entry 2360 (class 2606 OID 20439)
-- Name: mensajes_pkey; Type: CONSTRAINT; Schema: public; Owner: hjtecnos
--

ALTER TABLE ONLY mensajes
    ADD CONSTRAINT mensajes_pkey PRIMARY KEY (cd_mensajes_pk);


--
-- TOC entry 2348 (class 2606 OID 20250)
-- Name: menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (id);


--
-- TOC entry 2350 (class 2606 OID 20252)
-- Name: migration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY migration
    ADD CONSTRAINT migration_pkey PRIMARY KEY (version);


--
-- TOC entry 2352 (class 2606 OID 20254)
-- Name: operaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY operaciones
    ADD CONSTRAINT operaciones_pkey PRIMARY KEY (id);


--
-- TOC entry 2356 (class 2606 OID 20256)
-- Name: roles_operaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roles_operaciones
    ADD CONSTRAINT roles_operaciones_pkey PRIMARY KEY (rol_id, operacion_id);


--
-- TOC entry 2354 (class 2606 OID 20258)
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 2358 (class 2606 OID 20260)
-- Name: user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 2323 (class 1259 OID 20261)
-- Name: fki_cd_tipos_docs_cd_pagos_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_cd_tipos_docs_cd_pagos_fk ON cd_pagos USING btree (cod_tipo_doc);


--
-- TOC entry 2324 (class 1259 OID 20262)
-- Name: fki_cd_tipos_pagos_cd_pagos_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_cd_tipos_pagos_cd_pagos_fk ON cd_pagos USING btree (cod_tipo_pago);


--
-- TOC entry 2325 (class 1259 OID 20263)
-- Name: fki_facturas_cd_pagos_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_facturas_cd_pagos_fk ON cd_pagos USING btree (cod_factura);


--
-- TOC entry 2337 (class 1259 OID 20264)
-- Name: fki_facturas_facturas_gastos_comunes_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_facturas_facturas_gastos_comunes_fk ON facturas_gastos_comunes USING btree (cod_factura_fk);


--
-- TOC entry 2339 (class 1259 OID 20265)
-- Name: fki_facturas_fondos_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_facturas_fondos_fk ON fondos USING btree (cod_factura_fk);


--
-- TOC entry 2344 (class 1259 OID 20266)
-- Name: fki_facturas_gastos_comunes_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_facturas_gastos_comunes_fk ON gastos_nocomunes USING btree (cod_factura_fk);


--
-- TOC entry 2338 (class 1259 OID 20267)
-- Name: fki_gastos_comunes_facturas_gastos_comunes_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_gastos_comunes_facturas_gastos_comunes_fk ON facturas_gastos_comunes USING btree (cod_gasto_comun_fk);


--
-- TOC entry 2328 (class 1259 OID 20268)
-- Name: fki_propietario_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_propietario_user ON cd_propietarios USING btree (cod_user);


--
-- TOC entry 2369 (class 2606 OID 20269)
-- Name: cd_conceptos_cd_mov_chequeras_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cd_mov_chequeras
    ADD CONSTRAINT cd_conceptos_cd_mov_chequeras_fk FOREIGN KEY (cod_concepto) REFERENCES cd_conceptos(cd_conceptos_pk);


--
-- TOC entry 2371 (class 2606 OID 20274)
-- Name: cd_conceptos_cd_mov_mes_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cd_mov_mes
    ADD CONSTRAINT cd_conceptos_cd_mov_mes_fk FOREIGN KEY (cod_concepto) REFERENCES cd_conceptos(cd_conceptos_pk);


--
-- TOC entry 2361 (class 2606 OID 20279)
-- Name: cd_conjuntos_cd_aguas_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cd_aguas
    ADD CONSTRAINT cd_conjuntos_cd_aguas_fk FOREIGN KEY (cod_conjunto) REFERENCES cd_conjuntos(cd_conjuntos_pk) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2362 (class 2606 OID 20284)
-- Name: cd_conjuntos_cd_chequeras_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cd_chequeras
    ADD CONSTRAINT cd_conjuntos_cd_chequeras_fk FOREIGN KEY (cod_conjunto) REFERENCES cd_conjuntos(cd_conjuntos_pk) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2363 (class 2606 OID 20289)
-- Name: cd_conjuntos_cd_deudas_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cd_deudas
    ADD CONSTRAINT cd_conjuntos_cd_deudas_fk FOREIGN KEY (cod_conjunto) REFERENCES cd_conjuntos(cd_conjuntos_pk) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2364 (class 2606 OID 20294)
-- Name: cd_conjuntos_cd_edificios_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cd_edificios
    ADD CONSTRAINT cd_conjuntos_cd_edificios_fk FOREIGN KEY (cod_conjunto) REFERENCES cd_conjuntos(cd_conjuntos_pk) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2365 (class 2606 OID 20299)
-- Name: cd_conjuntos_cd_fondos_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cd_fondos
    ADD CONSTRAINT cd_conjuntos_cd_fondos_fk FOREIGN KEY (cod_conjunto) REFERENCES cd_conjuntos(cd_conjuntos_pk) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2366 (class 2606 OID 20304)
-- Name: cd_conjuntos_cd_historicos_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cd_historicos
    ADD CONSTRAINT cd_conjuntos_cd_historicos_fk FOREIGN KEY (cod_conjunto) REFERENCES cd_conjuntos(cd_conjuntos_pk) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2372 (class 2606 OID 20309)
-- Name: cd_conjuntos_cd_mov_mes_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cd_mov_mes
    ADD CONSTRAINT cd_conjuntos_cd_mov_mes_fk FOREIGN KEY (cod_conjunto) REFERENCES cd_conjuntos(cd_conjuntos_pk);


--
-- TOC entry 2367 (class 2606 OID 20314)
-- Name: cd_deudas_cd_historicos_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cd_historicos
    ADD CONSTRAINT cd_deudas_cd_historicos_fk FOREIGN KEY (cod_deuda) REFERENCES cd_deudas(cd_deudas_pk);


--
-- TOC entry 2368 (class 2606 OID 20319)
-- Name: cd_observaciones_cd_historicos_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cd_historicos
    ADD CONSTRAINT cd_observaciones_cd_historicos_fk FOREIGN KEY (cod_observacion) REFERENCES cd_observaciones(cd_observaciones_pk);


--
-- TOC entry 2370 (class 2606 OID 20324)
-- Name: cd_proveedores_cd_mov_chequeras_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cd_mov_chequeras
    ADD CONSTRAINT cd_proveedores_cd_mov_chequeras_fk FOREIGN KEY (cod_proveedor) REFERENCES cd_proveedores(cd_proveedores_pk);


--
-- TOC entry 2373 (class 2606 OID 20329)
-- Name: cd_tipos_docs_cd_pagos_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cd_pagos
    ADD CONSTRAINT cd_tipos_docs_cd_pagos_fk FOREIGN KEY (cod_tipo_doc) REFERENCES cd_tipos_docs(cd_tipo_doc_pk);


--
-- TOC entry 2374 (class 2606 OID 20334)
-- Name: cd_tipos_pagos_cd_pagos_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cd_pagos
    ADD CONSTRAINT cd_tipos_pagos_cd_pagos_fk FOREIGN KEY (cod_tipo_pago) REFERENCES cd_tipos_pagos(cd_tipo_pago_pk);


--
-- TOC entry 2375 (class 2606 OID 20339)
-- Name: facturas_cd_pagos_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cd_pagos
    ADD CONSTRAINT facturas_cd_pagos_fk FOREIGN KEY (cod_factura) REFERENCES facturas(cd_factura_pk);


--
-- TOC entry 2377 (class 2606 OID 20344)
-- Name: facturas_facturas_gastos_comunes_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY facturas_gastos_comunes
    ADD CONSTRAINT facturas_facturas_gastos_comunes_fk FOREIGN KEY (cod_factura_fk) REFERENCES facturas(cd_factura_pk) ON DELETE CASCADE;


--
-- TOC entry 2379 (class 2606 OID 20349)
-- Name: facturas_fondos_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fondos
    ADD CONSTRAINT facturas_fondos_fk FOREIGN KEY (cod_factura_fk) REFERENCES facturas(cd_factura_pk) ON DELETE CASCADE;


--
-- TOC entry 2380 (class 2606 OID 20354)
-- Name: facturas_gastos_comunes_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gastos_nocomunes
    ADD CONSTRAINT facturas_gastos_comunes_fk FOREIGN KEY (cod_factura_fk) REFERENCES facturas(cd_factura_pk) ON DELETE CASCADE;


--
-- TOC entry 2378 (class 2606 OID 20359)
-- Name: gastos_comunes_facturas_gastos_comunes_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY facturas_gastos_comunes
    ADD CONSTRAINT gastos_comunes_facturas_gastos_comunes_fk FOREIGN KEY (cod_gasto_comun_fk) REFERENCES gastos_comunes(cd_gasto_comun_pk) ON DELETE CASCADE;


--
-- TOC entry 2381 (class 2606 OID 20364)
-- Name: menu_parent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY menu
    ADD CONSTRAINT menu_parent_fkey FOREIGN KEY (parent) REFERENCES menu(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 2376 (class 2606 OID 20369)
-- Name: propietario_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cd_propietarios
    ADD CONSTRAINT propietario_user FOREIGN KEY (cod_user) REFERENCES "user"(id) ON DELETE SET NULL;


--
-- TOC entry 2382 (class 2606 OID 20374)
-- Name: roles_operaciones_operaciones_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roles_operaciones
    ADD CONSTRAINT roles_operaciones_operaciones_fkey FOREIGN KEY (operacion_id) REFERENCES operaciones(id) ON DELETE CASCADE;


--
-- TOC entry 2383 (class 2606 OID 20379)
-- Name: roles_operaciones_roles_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roles_operaciones
    ADD CONSTRAINT roles_operaciones_roles_fkey FOREIGN KEY (rol_id) REFERENCES roles(id) ON DELETE CASCADE;


--
-- TOC entry 2384 (class 2606 OID 20384)
-- Name: roles_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT roles_user_fkey FOREIGN KEY (rol_id) REFERENCES roles(id);


--
-- TOC entry 2559 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-07-30 21:20:53 VET

--
-- PostgreSQL database dump complete
--

