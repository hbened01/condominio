PGDMP         
                t            condominio_db    9.4.4    9.4.0 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           1262    133592    condominio_db    DATABASE     k   CREATE DATABASE condominio_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
    DROP DATABASE condominio_db;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    5            �           0    0    public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    5            �            3079    11855    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    209            �            1259    133712    cd_aguas    TABLE     �   CREATE TABLE cd_aguas (
    cd_aguas_pk smallint NOT NULL,
    cod_apto character varying(3) NOT NULL,
    cod_conjunto smallint NOT NULL,
    cod_edificio smallint NOT NULL,
    lect_ant numeric NOT NULL,
    lect_post numeric NOT NULL
);
    DROP TABLE public.cd_aguas;
       public         postgres    false    5            �            1259    133710    cd_aguas_cd_aguas_pk_seq    SEQUENCE     z   CREATE SEQUENCE cd_aguas_cd_aguas_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.cd_aguas_cd_aguas_pk_seq;
       public       postgres    false    198    5            �           0    0    cd_aguas_cd_aguas_pk_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE cd_aguas_cd_aguas_pk_seq OWNED BY cd_aguas.cd_aguas_pk;
            public       postgres    false    197            �            1259    133652    cd_aptos    TABLE     p   CREATE TABLE cd_aptos (
    cd_aptos_pk character varying(3) NOT NULL,
    cod_propietario smallint NOT NULL
);
    DROP TABLE public.cd_aptos;
       public         postgres    false    5            �            1259    133704    cd_chequeras    TABLE        CREATE TABLE cd_chequeras (
    cd_chequeras_pk smallint NOT NULL,
    cod_conjunto smallint NOT NULL,
    cod_edificio smallint NOT NULL,
    nro_cuenta character varying(20) NOT NULL,
    monto numeric(10,4) NOT NULL,
    saldo numeric(10,4) NOT NULL
);
     DROP TABLE public.cd_chequeras;
       public         postgres    false    5            �            1259    133702     cd_chequeras_cd_chequeras_pk_seq    SEQUENCE     �   CREATE SEQUENCE cd_chequeras_cd_chequeras_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.cd_chequeras_cd_chequeras_pk_seq;
       public       postgres    false    5    196            �           0    0     cd_chequeras_cd_chequeras_pk_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE cd_chequeras_cd_chequeras_pk_seq OWNED BY cd_chequeras.cd_chequeras_pk;
            public       postgres    false    195            �            1259    133683    cd_conceptos    TABLE     �   CREATE TABLE cd_conceptos (
    cd_conceptos_pk smallint NOT NULL,
    descrip_concepto character varying(50) NOT NULL,
    tipo character varying(1) NOT NULL,
    frecuencia integer NOT NULL
);
     DROP TABLE public.cd_conceptos;
       public         postgres    false    5            �            1259    133681     cd_conceptos_cd_conceptos_pk_seq    SEQUENCE     �   CREATE SEQUENCE cd_conceptos_cd_conceptos_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.cd_conceptos_cd_conceptos_pk_seq;
       public       postgres    false    192    5            �           0    0     cd_conceptos_cd_conceptos_pk_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE cd_conceptos_cd_conceptos_pk_seq OWNED BY cd_conceptos.cd_conceptos_pk;
            public       postgres    false    191            �            1259    133619    cd_conjuntos    TABLE     �   CREATE TABLE cd_conjuntos (
    cd_conjuntos_pk smallint NOT NULL,
    nombre character varying(30) NOT NULL,
    direccion character varying(150) NOT NULL
);
     DROP TABLE public.cd_conjuntos;
       public         postgres    false    5            �            1259    133617     cd_conjuntos_cd_conjuntos_pk_seq    SEQUENCE     �   CREATE SEQUENCE cd_conjuntos_cd_conjuntos_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.cd_conjuntos_cd_conjuntos_pk_seq;
       public       postgres    false    5    179            �           0    0     cd_conjuntos_cd_conjuntos_pk_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE cd_conjuntos_cd_conjuntos_pk_seq OWNED BY cd_conjuntos.cd_conjuntos_pk;
            public       postgres    false    178            �            1259    133659 	   cd_deudas    TABLE     �  CREATE TABLE cd_deudas (
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
    DROP TABLE public.cd_deudas;
       public         postgres    false    5            �            1259    133657    cd_deudas_cd_deudas_pk_seq    SEQUENCE     |   CREATE SEQUENCE cd_deudas_cd_deudas_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.cd_deudas_cd_deudas_pk_seq;
       public       postgres    false    5    186            �           0    0    cd_deudas_cd_deudas_pk_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE cd_deudas_cd_deudas_pk_seq OWNED BY cd_deudas.cd_deudas_pk;
            public       postgres    false    185            �            1259    133627    cd_edificios    TABLE     �  CREATE TABLE cd_edificios (
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
     DROP TABLE public.cd_edificios;
       public         postgres    false    5            �            1259    133625     cd_edificios_cd_edificios_pk_seq    SEQUENCE     �   CREATE SEQUENCE cd_edificios_cd_edificios_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.cd_edificios_cd_edificios_pk_seq;
       public       postgres    false    5    181            �           0    0     cd_edificios_cd_edificios_pk_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE cd_edificios_cd_edificios_pk_seq OWNED BY cd_edificios.cd_edificios_pk;
            public       postgres    false    180            �            1259    133667 	   cd_fondos    TABLE     m  CREATE TABLE cd_fondos (
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
    DROP TABLE public.cd_fondos;
       public         postgres    false    5            �            1259    133665    cd_fondos_cd_fondos_pk_seq    SEQUENCE     |   CREATE SEQUENCE cd_fondos_cd_fondos_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.cd_fondos_cd_fondos_pk_seq;
       public       postgres    false    5    188            �           0    0    cd_fondos_cd_fondos_pk_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE cd_fondos_cd_fondos_pk_seq OWNED BY cd_fondos.cd_fondos_pk;
            public       postgres    false    187            �            1259    133675    cd_historicos    TABLE     z  CREATE TABLE cd_historicos (
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
 !   DROP TABLE public.cd_historicos;
       public         postgres    false    5            �            1259    133673 "   cd_historicos_cd_historicos_pk_seq    SEQUENCE     �   CREATE SEQUENCE cd_historicos_cd_historicos_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.cd_historicos_cd_historicos_pk_seq;
       public       postgres    false    190    5            �           0    0 "   cd_historicos_cd_historicos_pk_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE cd_historicos_cd_historicos_pk_seq OWNED BY cd_historicos.cd_historicos_pk;
            public       postgres    false    189            �            1259    133611    cd_mantenimientos    TABLE     n   CREATE TABLE cd_mantenimientos (
    cd_mantenimientos_pk smallint NOT NULL,
    correlativo real NOT NULL
);
 %   DROP TABLE public.cd_mantenimientos;
       public         postgres    false    5            �            1259    133609 *   cd_mantenimientos_cd_mantenimientos_pk_seq    SEQUENCE     �   CREATE SEQUENCE cd_mantenimientos_cd_mantenimientos_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.cd_mantenimientos_cd_mantenimientos_pk_seq;
       public       postgres    false    5    177            �           0    0 *   cd_mantenimientos_cd_mantenimientos_pk_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE cd_mantenimientos_cd_mantenimientos_pk_seq OWNED BY cd_mantenimientos.cd_mantenimientos_pk;
            public       postgres    false    176            �            1259    133694    cd_mov_chequeras    TABLE     ]  CREATE TABLE cd_mov_chequeras (
    cd_mov_chequeras_pk smallint NOT NULL,
    cod_concepto smallint NOT NULL,
    cod_proveedor smallint NOT NULL,
    nro_cheque integer DEFAULT 0 NOT NULL,
    factura integer DEFAULT 0 NOT NULL,
    monto numeric(10,4) DEFAULT 0 NOT NULL,
    nro_cuenta character varying(20) NOT NULL,
    fecha date NOT NULL
);
 $   DROP TABLE public.cd_mov_chequeras;
       public         postgres    false    5            �            1259    133689 
   cd_mov_mes    TABLE       CREATE TABLE cd_mov_mes (
    cd_mov_mes_pk smallint NOT NULL,
    cod_concepto smallint NOT NULL,
    cod_apto character varying(3) NOT NULL,
    cod_conjunto smallint NOT NULL,
    cod_edificio smallint NOT NULL,
    fecha date NOT NULL,
    monto numeric(10,4) NOT NULL
);
    DROP TABLE public.cd_mov_mes;
       public         postgres    false    5            �            1259    133603    cd_observaciones    TABLE     ~   CREATE TABLE cd_observaciones (
    cd_observaciones_pk smallint NOT NULL,
    descripcion character varying(300) NOT NULL
);
 $   DROP TABLE public.cd_observaciones;
       public         postgres    false    5            �            1259    133601 (   cd_observaciones_cd_observaciones_pk_seq    SEQUENCE     �   CREATE SEQUENCE cd_observaciones_cd_observaciones_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.cd_observaciones_cd_observaciones_pk_seq;
       public       postgres    false    175    5            �           0    0 (   cd_observaciones_cd_observaciones_pk_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE cd_observaciones_cd_observaciones_pk_seq OWNED BY cd_observaciones.cd_observaciones_pk;
            public       postgres    false    174            �            1259    133644    cd_propietarios    TABLE     E  CREATE TABLE cd_propietarios (
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
 #   DROP TABLE public.cd_propietarios;
       public         postgres    false    5            �            1259    133642 &   cd_propietarios_cd_propietarios_pk_seq    SEQUENCE     �   CREATE SEQUENCE cd_propietarios_cd_propietarios_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.cd_propietarios_cd_propietarios_pk_seq;
       public       postgres    false    183    5            �           0    0 &   cd_propietarios_cd_propietarios_pk_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE cd_propietarios_cd_propietarios_pk_seq OWNED BY cd_propietarios.cd_propietarios_pk;
            public       postgres    false    182            �            1259    133595    cd_proveedores    TABLE     �   CREATE TABLE cd_proveedores (
    cd_proveedores_pk smallint NOT NULL,
    razon_social character varying(35) NOT NULL,
    beneficiario character varying(35) NOT NULL
);
 "   DROP TABLE public.cd_proveedores;
       public         postgres    false    5            �            1259    133593 $   cd_proveedores_cd_proveedores_pk_seq    SEQUENCE     �   CREATE SEQUENCE cd_proveedores_cd_proveedores_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.cd_proveedores_cd_proveedores_pk_seq;
       public       postgres    false    173    5            �           0    0 $   cd_proveedores_cd_proveedores_pk_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE cd_proveedores_cd_proveedores_pk_seq OWNED BY cd_proveedores.cd_proveedores_pk;
            public       postgres    false    172            �            1259    205445    menu    TABLE     �   CREATE TABLE menu (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    parent integer,
    route character varying(255),
    "order" integer,
    data bytea
);
    DROP TABLE public.menu;
       public         postgres    false    5            �            1259    205443    menu_id_seq    SEQUENCE     m   CREATE SEQUENCE menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.menu_id_seq;
       public       postgres    false    5    203            �           0    0    menu_id_seq    SEQUENCE OWNED BY     -   ALTER SEQUENCE menu_id_seq OWNED BY menu.id;
            public       postgres    false    202            �            1259    139905 	   migration    TABLE     `   CREATE TABLE migration (
    version character varying(180) NOT NULL,
    apply_time integer
);
    DROP TABLE public.migration;
       public         postgres    false    5            �            1259    213643    operaciones    TABLE     a   CREATE TABLE operaciones (
    id integer NOT NULL,
    nombre character varying(64) NOT NULL
);
    DROP TABLE public.operaciones;
       public         postgres    false    5            �            1259    213641    operaciones_id_seq    SEQUENCE     t   CREATE SEQUENCE operaciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.operaciones_id_seq;
       public       postgres    false    207    5            �           0    0    operaciones_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE operaciones_id_seq OWNED BY operaciones.id;
            public       postgres    false    206            �            1259    213635    roles    TABLE     [   CREATE TABLE roles (
    id integer NOT NULL,
    nombre character varying(32) NOT NULL
);
    DROP TABLE public.roles;
       public         postgres    false    5            �            1259    213633    roles_id_seq    SEQUENCE     n   CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roles_id_seq;
       public       postgres    false    205    5            �           0    0    roles_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE roles_id_seq OWNED BY roles.id;
            public       postgres    false    204            �            1259    213654    roles_operaciones    TABLE     c   CREATE TABLE roles_operaciones (
    rol_id integer NOT NULL,
    operacion_id integer NOT NULL
);
 %   DROP TABLE public.roles_operaciones;
       public         postgres    false    5            �            1259    189075    user    TABLE     �  CREATE TABLE "user" (
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
    DROP TABLE public."user";
       public         postgres    false    5            �            1259    189073    user_id_seq    SEQUENCE     m   CREATE SEQUENCE user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public       postgres    false    201    5            �           0    0    user_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE user_id_seq OWNED BY "user".id;
            public       postgres    false    200            �           2604    133715    cd_aguas_pk    DEFAULT     n   ALTER TABLE ONLY cd_aguas ALTER COLUMN cd_aguas_pk SET DEFAULT nextval('cd_aguas_cd_aguas_pk_seq'::regclass);
 C   ALTER TABLE public.cd_aguas ALTER COLUMN cd_aguas_pk DROP DEFAULT;
       public       postgres    false    197    198    198            �           2604    133707    cd_chequeras_pk    DEFAULT     ~   ALTER TABLE ONLY cd_chequeras ALTER COLUMN cd_chequeras_pk SET DEFAULT nextval('cd_chequeras_cd_chequeras_pk_seq'::regclass);
 K   ALTER TABLE public.cd_chequeras ALTER COLUMN cd_chequeras_pk DROP DEFAULT;
       public       postgres    false    196    195    196            �           2604    133686    cd_conceptos_pk    DEFAULT     ~   ALTER TABLE ONLY cd_conceptos ALTER COLUMN cd_conceptos_pk SET DEFAULT nextval('cd_conceptos_cd_conceptos_pk_seq'::regclass);
 K   ALTER TABLE public.cd_conceptos ALTER COLUMN cd_conceptos_pk DROP DEFAULT;
       public       postgres    false    192    191    192            �           2604    133622    cd_conjuntos_pk    DEFAULT     ~   ALTER TABLE ONLY cd_conjuntos ALTER COLUMN cd_conjuntos_pk SET DEFAULT nextval('cd_conjuntos_cd_conjuntos_pk_seq'::regclass);
 K   ALTER TABLE public.cd_conjuntos ALTER COLUMN cd_conjuntos_pk DROP DEFAULT;
       public       postgres    false    178    179    179            �           2604    133662    cd_deudas_pk    DEFAULT     r   ALTER TABLE ONLY cd_deudas ALTER COLUMN cd_deudas_pk SET DEFAULT nextval('cd_deudas_cd_deudas_pk_seq'::regclass);
 E   ALTER TABLE public.cd_deudas ALTER COLUMN cd_deudas_pk DROP DEFAULT;
       public       postgres    false    185    186    186            �           2604    133630    cd_edificios_pk    DEFAULT     ~   ALTER TABLE ONLY cd_edificios ALTER COLUMN cd_edificios_pk SET DEFAULT nextval('cd_edificios_cd_edificios_pk_seq'::regclass);
 K   ALTER TABLE public.cd_edificios ALTER COLUMN cd_edificios_pk DROP DEFAULT;
       public       postgres    false    181    180    181            �           2604    133670    cd_fondos_pk    DEFAULT     r   ALTER TABLE ONLY cd_fondos ALTER COLUMN cd_fondos_pk SET DEFAULT nextval('cd_fondos_cd_fondos_pk_seq'::regclass);
 E   ALTER TABLE public.cd_fondos ALTER COLUMN cd_fondos_pk DROP DEFAULT;
       public       postgres    false    188    187    188            �           2604    133678    cd_historicos_pk    DEFAULT     �   ALTER TABLE ONLY cd_historicos ALTER COLUMN cd_historicos_pk SET DEFAULT nextval('cd_historicos_cd_historicos_pk_seq'::regclass);
 M   ALTER TABLE public.cd_historicos ALTER COLUMN cd_historicos_pk DROP DEFAULT;
       public       postgres    false    189    190    190            �           2604    133614    cd_mantenimientos_pk    DEFAULT     �   ALTER TABLE ONLY cd_mantenimientos ALTER COLUMN cd_mantenimientos_pk SET DEFAULT nextval('cd_mantenimientos_cd_mantenimientos_pk_seq'::regclass);
 U   ALTER TABLE public.cd_mantenimientos ALTER COLUMN cd_mantenimientos_pk DROP DEFAULT;
       public       postgres    false    177    176    177            �           2604    133606    cd_observaciones_pk    DEFAULT     �   ALTER TABLE ONLY cd_observaciones ALTER COLUMN cd_observaciones_pk SET DEFAULT nextval('cd_observaciones_cd_observaciones_pk_seq'::regclass);
 S   ALTER TABLE public.cd_observaciones ALTER COLUMN cd_observaciones_pk DROP DEFAULT;
       public       postgres    false    174    175    175            �           2604    133647    cd_propietarios_pk    DEFAULT     �   ALTER TABLE ONLY cd_propietarios ALTER COLUMN cd_propietarios_pk SET DEFAULT nextval('cd_propietarios_cd_propietarios_pk_seq'::regclass);
 Q   ALTER TABLE public.cd_propietarios ALTER COLUMN cd_propietarios_pk DROP DEFAULT;
       public       postgres    false    183    182    183            �           2604    133598    cd_proveedores_pk    DEFAULT     �   ALTER TABLE ONLY cd_proveedores ALTER COLUMN cd_proveedores_pk SET DEFAULT nextval('cd_proveedores_cd_proveedores_pk_seq'::regclass);
 O   ALTER TABLE public.cd_proveedores ALTER COLUMN cd_proveedores_pk DROP DEFAULT;
       public       postgres    false    173    172    173            �           2604    205448    id    DEFAULT     T   ALTER TABLE ONLY menu ALTER COLUMN id SET DEFAULT nextval('menu_id_seq'::regclass);
 6   ALTER TABLE public.menu ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    203    202    203            �           2604    213646    id    DEFAULT     b   ALTER TABLE ONLY operaciones ALTER COLUMN id SET DEFAULT nextval('operaciones_id_seq'::regclass);
 =   ALTER TABLE public.operaciones ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    207    206    207            �           2604    213638    id    DEFAULT     V   ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);
 7   ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    205    204    205            �           2604    189078    id    DEFAULT     V   ALTER TABLE ONLY "user" ALTER COLUMN id SET DEFAULT nextval('user_id_seq'::regclass);
 8   ALTER TABLE public."user" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    201    200    201            �          0    133712    cd_aguas 
   TABLE DATA               c   COPY cd_aguas (cd_aguas_pk, cod_apto, cod_conjunto, cod_edificio, lect_ant, lect_post) FROM stdin;
    public       postgres    false    198   i�       �           0    0    cd_aguas_cd_aguas_pk_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('cd_aguas_cd_aguas_pk_seq', 1, false);
            public       postgres    false    197            �          0    133652    cd_aptos 
   TABLE DATA               9   COPY cd_aptos (cd_aptos_pk, cod_propietario) FROM stdin;
    public       postgres    false    184   ��       �          0    133704    cd_chequeras 
   TABLE DATA               f   COPY cd_chequeras (cd_chequeras_pk, cod_conjunto, cod_edificio, nro_cuenta, monto, saldo) FROM stdin;
    public       postgres    false    196   ��       �           0    0     cd_chequeras_cd_chequeras_pk_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('cd_chequeras_cd_chequeras_pk_seq', 1, false);
            public       postgres    false    195            �          0    133683    cd_conceptos 
   TABLE DATA               T   COPY cd_conceptos (cd_conceptos_pk, descrip_concepto, tipo, frecuencia) FROM stdin;
    public       postgres    false    192   ��       �           0    0     cd_conceptos_cd_conceptos_pk_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('cd_conceptos_cd_conceptos_pk_seq', 1, false);
            public       postgres    false    191            �          0    133619    cd_conjuntos 
   TABLE DATA               C   COPY cd_conjuntos (cd_conjuntos_pk, nombre, direccion) FROM stdin;
    public       postgres    false    179   ��       �           0    0     cd_conjuntos_cd_conjuntos_pk_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('cd_conjuntos_cd_conjuntos_pk_seq', 1, false);
            public       postgres    false    178            �          0    133659 	   cd_deudas 
   TABLE DATA               �   COPY cd_deudas (cd_deudas_pk, cod_apto, cod_conjunto, cod_edificio, fecha_deuda, fecha_cancelado, monto, interes, nro_doc, nro_cheque) FROM stdin;
    public       postgres    false    186   ��       �           0    0    cd_deudas_cd_deudas_pk_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('cd_deudas_cd_deudas_pk_seq', 1, false);
            public       postgres    false    185            �          0    133627    cd_edificios 
   TABLE DATA               �   COPY cd_edificios (cd_edificios_pk, cod_conjunto, nombre_edificio, nombre_concerje, telf_concerje, porcentaje_nro1, porcentaje_nro2, agua, fondo_nro1, fondo_nro2, fondo_nro3, fondo_nro4, fondo_nro5, fondo_nro6, fondo_nro7, fondo_nro8) FROM stdin;
    public       postgres    false    181   �       �           0    0     cd_edificios_cd_edificios_pk_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('cd_edificios_cd_edificios_pk_seq', 1, false);
            public       postgres    false    180            �          0    133667 	   cd_fondos 
   TABLE DATA               �   COPY cd_fondos (cd_fondos_pk, cod_conjunto, cod_edificio, cod_concepto, fecha_i, fecha_f, monto_g, nro_cuotas, cuota_m, gastos) FROM stdin;
    public       postgres    false    188   4�       �           0    0    cd_fondos_cd_fondos_pk_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('cd_fondos_cd_fondos_pk_seq', 1, false);
            public       postgres    false    187            �          0    133675    cd_historicos 
   TABLE DATA               �   COPY cd_historicos (cd_historicos_pk, cod_observacion, cod_deuda, cod_apto, cod_conjunto, cod_edificio, fecha, monto, apagar, recibo) FROM stdin;
    public       postgres    false    190   Q�       �           0    0 "   cd_historicos_cd_historicos_pk_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('cd_historicos_cd_historicos_pk_seq', 1, false);
            public       postgres    false    189            �          0    133611    cd_mantenimientos 
   TABLE DATA               G   COPY cd_mantenimientos (cd_mantenimientos_pk, correlativo) FROM stdin;
    public       postgres    false    177   n�       �           0    0 *   cd_mantenimientos_cd_mantenimientos_pk_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('cd_mantenimientos_cd_mantenimientos_pk_seq', 1, false);
            public       postgres    false    176            �          0    133694    cd_mov_chequeras 
   TABLE DATA               �   COPY cd_mov_chequeras (cd_mov_chequeras_pk, cod_concepto, cod_proveedor, nro_cheque, factura, monto, nro_cuenta, fecha) FROM stdin;
    public       postgres    false    194   ��       �          0    133689 
   cd_mov_mes 
   TABLE DATA               n   COPY cd_mov_mes (cd_mov_mes_pk, cod_concepto, cod_apto, cod_conjunto, cod_edificio, fecha, monto) FROM stdin;
    public       postgres    false    193   ��       �          0    133603    cd_observaciones 
   TABLE DATA               E   COPY cd_observaciones (cd_observaciones_pk, descripcion) FROM stdin;
    public       postgres    false    175   ��       �           0    0 (   cd_observaciones_cd_observaciones_pk_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('cd_observaciones_cd_observaciones_pk_seq', 1, false);
            public       postgres    false    174            �          0    133644    cd_propietarios 
   TABLE DATA               �   COPY cd_propietarios (cd_propietarios_pk, cod_conjunto, cod_edificio, nro_piso, nombre, apellido, telf_local, telf_celular, fax, alicuota, quien_vive, direccion, direccion_cobro) FROM stdin;
    public       postgres    false    183   ��       �           0    0 &   cd_propietarios_cd_propietarios_pk_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('cd_propietarios_cd_propietarios_pk_seq', 1, false);
            public       postgres    false    182            �          0    133595    cd_proveedores 
   TABLE DATA               P   COPY cd_proveedores (cd_proveedores_pk, razon_social, beneficiario) FROM stdin;
    public       postgres    false    173   ��       �           0    0 $   cd_proveedores_cd_proveedores_pk_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('cd_proveedores_cd_proveedores_pk_seq', 1, false);
            public       postgres    false    172            �          0    205445    menu 
   TABLE DATA               ?   COPY menu (id, name, parent, route, "order", data) FROM stdin;
    public       postgres    false    203   �       �           0    0    menu_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('menu_id_seq', 1, false);
            public       postgres    false    202            �          0    139905 	   migration 
   TABLE DATA               1   COPY migration (version, apply_time) FROM stdin;
    public       postgres    false    199   9�       �          0    213643    operaciones 
   TABLE DATA               *   COPY operaciones (id, nombre) FROM stdin;
    public       postgres    false    207   ��       �           0    0    operaciones_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('operaciones_id_seq', 25, true);
            public       postgres    false    206            �          0    213635    roles 
   TABLE DATA               $   COPY roles (id, nombre) FROM stdin;
    public       postgres    false    205   }�       �           0    0    roles_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('roles_id_seq', 7, true);
            public       postgres    false    204            �          0    213654    roles_operaciones 
   TABLE DATA               :   COPY roles_operaciones (rol_id, operacion_id) FROM stdin;
    public       postgres    false    208   ��       �          0    189075    user 
   TABLE DATA               �   COPY "user" (id, username, auth_key, password_hash, password_reset_token, email, status, created_at, updated_at, rol_id) FROM stdin;
    public       postgres    false    201   =�       �           0    0    user_id_seq    SEQUENCE SET     2   SELECT pg_catalog.setval('user_id_seq', 4, true);
            public       postgres    false    200                       2606    133720    cd_aguas_pk 
   CONSTRAINT     T   ALTER TABLE ONLY cd_aguas
    ADD CONSTRAINT cd_aguas_pk PRIMARY KEY (cd_aguas_pk);
 >   ALTER TABLE ONLY public.cd_aguas DROP CONSTRAINT cd_aguas_pk;
       public         postgres    false    198    198            �           2606    133656    cd_aptos_pk 
   CONSTRAINT     T   ALTER TABLE ONLY cd_aptos
    ADD CONSTRAINT cd_aptos_pk PRIMARY KEY (cd_aptos_pk);
 >   ALTER TABLE ONLY public.cd_aptos DROP CONSTRAINT cd_aptos_pk;
       public         postgres    false    184    184                       2606    133709    cd_chequeras_pk 
   CONSTRAINT     `   ALTER TABLE ONLY cd_chequeras
    ADD CONSTRAINT cd_chequeras_pk PRIMARY KEY (cd_chequeras_pk);
 F   ALTER TABLE ONLY public.cd_chequeras DROP CONSTRAINT cd_chequeras_pk;
       public         postgres    false    196    196            �           2606    133688    cd_conceptos_pk 
   CONSTRAINT     `   ALTER TABLE ONLY cd_conceptos
    ADD CONSTRAINT cd_conceptos_pk PRIMARY KEY (cd_conceptos_pk);
 F   ALTER TABLE ONLY public.cd_conceptos DROP CONSTRAINT cd_conceptos_pk;
       public         postgres    false    192    192            �           2606    133624    cd_conjuntos_pk 
   CONSTRAINT     `   ALTER TABLE ONLY cd_conjuntos
    ADD CONSTRAINT cd_conjuntos_pk PRIMARY KEY (cd_conjuntos_pk);
 F   ALTER TABLE ONLY public.cd_conjuntos DROP CONSTRAINT cd_conjuntos_pk;
       public         postgres    false    179    179            �           2606    133664    cd_deudas_pk 
   CONSTRAINT     W   ALTER TABLE ONLY cd_deudas
    ADD CONSTRAINT cd_deudas_pk PRIMARY KEY (cd_deudas_pk);
 @   ALTER TABLE ONLY public.cd_deudas DROP CONSTRAINT cd_deudas_pk;
       public         postgres    false    186    186            �           2606    133641    cd_edificios_pk 
   CONSTRAINT     `   ALTER TABLE ONLY cd_edificios
    ADD CONSTRAINT cd_edificios_pk PRIMARY KEY (cd_edificios_pk);
 F   ALTER TABLE ONLY public.cd_edificios DROP CONSTRAINT cd_edificios_pk;
       public         postgres    false    181    181            �           2606    133672    cd_fondos_pk 
   CONSTRAINT     W   ALTER TABLE ONLY cd_fondos
    ADD CONSTRAINT cd_fondos_pk PRIMARY KEY (cd_fondos_pk);
 @   ALTER TABLE ONLY public.cd_fondos DROP CONSTRAINT cd_fondos_pk;
       public         postgres    false    188    188            �           2606    133680    cd_historicos_pk 
   CONSTRAINT     c   ALTER TABLE ONLY cd_historicos
    ADD CONSTRAINT cd_historicos_pk PRIMARY KEY (cd_historicos_pk);
 H   ALTER TABLE ONLY public.cd_historicos DROP CONSTRAINT cd_historicos_pk;
       public         postgres    false    190    190            �           2606    133616    cd_mantenimientos_pk 
   CONSTRAINT     o   ALTER TABLE ONLY cd_mantenimientos
    ADD CONSTRAINT cd_mantenimientos_pk PRIMARY KEY (cd_mantenimientos_pk);
 P   ALTER TABLE ONLY public.cd_mantenimientos DROP CONSTRAINT cd_mantenimientos_pk;
       public         postgres    false    177    177                        2606    133701    cd_mov_chequeras_pk 
   CONSTRAINT     l   ALTER TABLE ONLY cd_mov_chequeras
    ADD CONSTRAINT cd_mov_chequeras_pk PRIMARY KEY (cd_mov_chequeras_pk);
 N   ALTER TABLE ONLY public.cd_mov_chequeras DROP CONSTRAINT cd_mov_chequeras_pk;
       public         postgres    false    194    194            �           2606    133693    cd_mov_mes_pk 
   CONSTRAINT     Z   ALTER TABLE ONLY cd_mov_mes
    ADD CONSTRAINT cd_mov_mes_pk PRIMARY KEY (cd_mov_mes_pk);
 B   ALTER TABLE ONLY public.cd_mov_mes DROP CONSTRAINT cd_mov_mes_pk;
       public         postgres    false    193    193            �           2606    133608    cd_observaciones_pk 
   CONSTRAINT     l   ALTER TABLE ONLY cd_observaciones
    ADD CONSTRAINT cd_observaciones_pk PRIMARY KEY (cd_observaciones_pk);
 N   ALTER TABLE ONLY public.cd_observaciones DROP CONSTRAINT cd_observaciones_pk;
       public         postgres    false    175    175            �           2606    133651    cd_propietarios_pk 
   CONSTRAINT     i   ALTER TABLE ONLY cd_propietarios
    ADD CONSTRAINT cd_propietarios_pk PRIMARY KEY (cd_propietarios_pk);
 L   ALTER TABLE ONLY public.cd_propietarios DROP CONSTRAINT cd_propietarios_pk;
       public         postgres    false    183    183            �           2606    133600    cd_proveedores_pk 
   CONSTRAINT     f   ALTER TABLE ONLY cd_proveedores
    ADD CONSTRAINT cd_proveedores_pk PRIMARY KEY (cd_proveedores_pk);
 J   ALTER TABLE ONLY public.cd_proveedores DROP CONSTRAINT cd_proveedores_pk;
       public         postgres    false    173    173            
           2606    205453 	   menu_pkey 
   CONSTRAINT     E   ALTER TABLE ONLY menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.menu DROP CONSTRAINT menu_pkey;
       public         postgres    false    203    203                       2606    139909    migration_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY migration
    ADD CONSTRAINT migration_pkey PRIMARY KEY (version);
 B   ALTER TABLE ONLY public.migration DROP CONSTRAINT migration_pkey;
       public         postgres    false    199    199                       2606    213648    operaciones_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY operaciones
    ADD CONSTRAINT operaciones_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.operaciones DROP CONSTRAINT operaciones_pkey;
       public         postgres    false    207    207                       2606    213658    roles_operaciones_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY roles_operaciones
    ADD CONSTRAINT roles_operaciones_pkey PRIMARY KEY (rol_id, operacion_id);
 R   ALTER TABLE ONLY public.roles_operaciones DROP CONSTRAINT roles_operaciones_pkey;
       public         postgres    false    208    208    208                       2606    213640 
   roles_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public         postgres    false    205    205                       2606    189084 	   user_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public         postgres    false    201    201            )           2606    133826    cd_aptos_cd_aguas_fk    FK CONSTRAINT     {   ALTER TABLE ONLY cd_aguas
    ADD CONSTRAINT cd_aptos_cd_aguas_fk FOREIGN KEY (cod_apto) REFERENCES cd_aptos(cd_aptos_pk);
 G   ALTER TABLE ONLY public.cd_aguas DROP CONSTRAINT cd_aptos_cd_aguas_fk;
       public       postgres    false    198    184    2036                       2606    133811    cd_aptos_cd_deudas_fk    FK CONSTRAINT     }   ALTER TABLE ONLY cd_deudas
    ADD CONSTRAINT cd_aptos_cd_deudas_fk FOREIGN KEY (cod_apto) REFERENCES cd_aptos(cd_aptos_pk);
 I   ALTER TABLE ONLY public.cd_deudas DROP CONSTRAINT cd_aptos_cd_deudas_fk;
       public       postgres    false    186    184    2036                       2606    133821    cd_aptos_cd_historicos_fk    FK CONSTRAINT     �   ALTER TABLE ONLY cd_historicos
    ADD CONSTRAINT cd_aptos_cd_historicos_fk FOREIGN KEY (cod_apto) REFERENCES cd_aptos(cd_aptos_pk);
 Q   ALTER TABLE ONLY public.cd_historicos DROP CONSTRAINT cd_aptos_cd_historicos_fk;
       public       postgres    false    190    184    2036            !           2606    133816    cd_aptos_cd_mov_mes_fk    FK CONSTRAINT        ALTER TABLE ONLY cd_mov_mes
    ADD CONSTRAINT cd_aptos_cd_mov_mes_fk FOREIGN KEY (cod_apto) REFERENCES cd_aptos(cd_aptos_pk);
 K   ALTER TABLE ONLY public.cd_mov_mes DROP CONSTRAINT cd_aptos_cd_mov_mes_fk;
       public       postgres    false    193    184    2036            $           2606    133836     cd_conceptos_cd_mov_chequeras_fk    FK CONSTRAINT     �   ALTER TABLE ONLY cd_mov_chequeras
    ADD CONSTRAINT cd_conceptos_cd_mov_chequeras_fk FOREIGN KEY (cod_concepto) REFERENCES cd_conceptos(cd_conceptos_pk);
 [   ALTER TABLE ONLY public.cd_mov_chequeras DROP CONSTRAINT cd_conceptos_cd_mov_chequeras_fk;
       public       postgres    false    194    192    2044            "           2606    133841    cd_conceptos_cd_mov_mes_fk    FK CONSTRAINT     �   ALTER TABLE ONLY cd_mov_mes
    ADD CONSTRAINT cd_conceptos_cd_mov_mes_fk FOREIGN KEY (cod_concepto) REFERENCES cd_conceptos(cd_conceptos_pk);
 O   ALTER TABLE ONLY public.cd_mov_mes DROP CONSTRAINT cd_conceptos_cd_mov_mes_fk;
       public       postgres    false    192    2044    193            '           2606    133761    cd_conjuntos_cd_aguas_fk    FK CONSTRAINT     �   ALTER TABLE ONLY cd_aguas
    ADD CONSTRAINT cd_conjuntos_cd_aguas_fk FOREIGN KEY (cod_conjunto) REFERENCES cd_conjuntos(cd_conjuntos_pk) ON UPDATE CASCADE ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.cd_aguas DROP CONSTRAINT cd_conjuntos_cd_aguas_fk;
       public       postgres    false    198    179    2030            %           2606    133741    cd_conjuntos_cd_chequeras_fk    FK CONSTRAINT     �   ALTER TABLE ONLY cd_chequeras
    ADD CONSTRAINT cd_conjuntos_cd_chequeras_fk FOREIGN KEY (cod_conjunto) REFERENCES cd_conjuntos(cd_conjuntos_pk) ON UPDATE CASCADE ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.cd_chequeras DROP CONSTRAINT cd_conjuntos_cd_chequeras_fk;
       public       postgres    false    196    179    2030                       2606    133756    cd_conjuntos_cd_deudas_fk    FK CONSTRAINT     �   ALTER TABLE ONLY cd_deudas
    ADD CONSTRAINT cd_conjuntos_cd_deudas_fk FOREIGN KEY (cod_conjunto) REFERENCES cd_conjuntos(cd_conjuntos_pk) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.cd_deudas DROP CONSTRAINT cd_conjuntos_cd_deudas_fk;
       public       postgres    false    186    179    2030                       2606    133731    cd_conjuntos_cd_edificios_fk    FK CONSTRAINT     �   ALTER TABLE ONLY cd_edificios
    ADD CONSTRAINT cd_conjuntos_cd_edificios_fk FOREIGN KEY (cod_conjunto) REFERENCES cd_conjuntos(cd_conjuntos_pk) ON UPDATE CASCADE ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.cd_edificios DROP CONSTRAINT cd_conjuntos_cd_edificios_fk;
       public       postgres    false    181    179    2030                       2606    133746    cd_conjuntos_cd_fondos_fk    FK CONSTRAINT     �   ALTER TABLE ONLY cd_fondos
    ADD CONSTRAINT cd_conjuntos_cd_fondos_fk FOREIGN KEY (cod_conjunto) REFERENCES cd_conjuntos(cd_conjuntos_pk) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.cd_fondos DROP CONSTRAINT cd_conjuntos_cd_fondos_fk;
       public       postgres    false    188    179    2030                       2606    133766    cd_conjuntos_cd_historicos_fk    FK CONSTRAINT     �   ALTER TABLE ONLY cd_historicos
    ADD CONSTRAINT cd_conjuntos_cd_historicos_fk FOREIGN KEY (cod_conjunto) REFERENCES cd_conjuntos(cd_conjuntos_pk) ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.cd_historicos DROP CONSTRAINT cd_conjuntos_cd_historicos_fk;
       public       postgres    false    190    179    2030                       2606    133736    cd_conjuntos_cd_mov_mes_fk    FK CONSTRAINT     �   ALTER TABLE ONLY cd_mov_mes
    ADD CONSTRAINT cd_conjuntos_cd_mov_mes_fk FOREIGN KEY (cod_conjunto) REFERENCES cd_conjuntos(cd_conjuntos_pk);
 O   ALTER TABLE ONLY public.cd_mov_mes DROP CONSTRAINT cd_conjuntos_cd_mov_mes_fk;
       public       postgres    false    193    179    2030                       2606    133751    cd_conjuntos_cd_propietarios_fk    FK CONSTRAINT     �   ALTER TABLE ONLY cd_propietarios
    ADD CONSTRAINT cd_conjuntos_cd_propietarios_fk FOREIGN KEY (cod_conjunto) REFERENCES cd_conjuntos(cd_conjuntos_pk) ON UPDATE CASCADE ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.cd_propietarios DROP CONSTRAINT cd_conjuntos_cd_propietarios_fk;
       public       postgres    false    183    179    2030                       2606    133831    cd_deudas_cd_historicos_fk    FK CONSTRAINT     �   ALTER TABLE ONLY cd_historicos
    ADD CONSTRAINT cd_deudas_cd_historicos_fk FOREIGN KEY (cod_deuda) REFERENCES cd_deudas(cd_deudas_pk);
 R   ALTER TABLE ONLY public.cd_historicos DROP CONSTRAINT cd_deudas_cd_historicos_fk;
       public       postgres    false    190    186    2038            (           2606    133771    cd_edificios_cd_aguas_fk    FK CONSTRAINT     �   ALTER TABLE ONLY cd_aguas
    ADD CONSTRAINT cd_edificios_cd_aguas_fk FOREIGN KEY (cod_edificio) REFERENCES cd_edificios(cd_edificios_pk) ON UPDATE CASCADE ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.cd_aguas DROP CONSTRAINT cd_edificios_cd_aguas_fk;
       public       postgres    false    198    181    2032            &           2606    133776    cd_edificios_cd_chequeras_fk    FK CONSTRAINT     �   ALTER TABLE ONLY cd_chequeras
    ADD CONSTRAINT cd_edificios_cd_chequeras_fk FOREIGN KEY (cod_edificio) REFERENCES cd_edificios(cd_edificios_pk) ON UPDATE CASCADE ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.cd_chequeras DROP CONSTRAINT cd_edificios_cd_chequeras_fk;
       public       postgres    false    196    181    2032                       2606    133801    cd_edificios_cd_deudas_fk    FK CONSTRAINT     �   ALTER TABLE ONLY cd_deudas
    ADD CONSTRAINT cd_edificios_cd_deudas_fk FOREIGN KEY (cod_edificio) REFERENCES cd_edificios(cd_edificios_pk) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.cd_deudas DROP CONSTRAINT cd_edificios_cd_deudas_fk;
       public       postgres    false    186    181    2032                       2606    133786    cd_edificios_cd_fondos_fk    FK CONSTRAINT     �   ALTER TABLE ONLY cd_fondos
    ADD CONSTRAINT cd_edificios_cd_fondos_fk FOREIGN KEY (cod_edificio) REFERENCES cd_edificios(cd_edificios_pk) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.cd_fondos DROP CONSTRAINT cd_edificios_cd_fondos_fk;
       public       postgres    false    188    181    2032                       2606    133781    cd_edificios_cd_historicos_fk    FK CONSTRAINT     �   ALTER TABLE ONLY cd_historicos
    ADD CONSTRAINT cd_edificios_cd_historicos_fk FOREIGN KEY (cod_edificio) REFERENCES cd_edificios(cd_edificios_pk) ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.cd_historicos DROP CONSTRAINT cd_edificios_cd_historicos_fk;
       public       postgres    false    190    181    2032                        2606    133796    cd_edificios_cd_mov_mes_fk    FK CONSTRAINT     �   ALTER TABLE ONLY cd_mov_mes
    ADD CONSTRAINT cd_edificios_cd_mov_mes_fk FOREIGN KEY (cod_edificio) REFERENCES cd_edificios(cd_edificios_pk) ON UPDATE CASCADE ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.cd_mov_mes DROP CONSTRAINT cd_edificios_cd_mov_mes_fk;
       public       postgres    false    193    181    2032                       2606    133791    cd_edificios_cd_propietarios_fk    FK CONSTRAINT     �   ALTER TABLE ONLY cd_propietarios
    ADD CONSTRAINT cd_edificios_cd_propietarios_fk FOREIGN KEY (cod_edificio) REFERENCES cd_edificios(cd_edificios_pk) ON UPDATE CASCADE ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.cd_propietarios DROP CONSTRAINT cd_edificios_cd_propietarios_fk;
       public       postgres    false    183    181    2032                       2606    133726 !   cd_observaciones_cd_historicos_fk    FK CONSTRAINT     �   ALTER TABLE ONLY cd_historicos
    ADD CONSTRAINT cd_observaciones_cd_historicos_fk FOREIGN KEY (cod_observacion) REFERENCES cd_observaciones(cd_observaciones_pk);
 Y   ALTER TABLE ONLY public.cd_historicos DROP CONSTRAINT cd_observaciones_cd_historicos_fk;
       public       postgres    false    190    175    2026                       2606    133806    cd_propietarios_cd_aptos_fk    FK CONSTRAINT     �   ALTER TABLE ONLY cd_aptos
    ADD CONSTRAINT cd_propietarios_cd_aptos_fk FOREIGN KEY (cod_propietario) REFERENCES cd_propietarios(cd_propietarios_pk);
 N   ALTER TABLE ONLY public.cd_aptos DROP CONSTRAINT cd_propietarios_cd_aptos_fk;
       public       postgres    false    184    183    2034            #           2606    133721 "   cd_proveedores_cd_mov_chequeras_fk    FK CONSTRAINT     �   ALTER TABLE ONLY cd_mov_chequeras
    ADD CONSTRAINT cd_proveedores_cd_mov_chequeras_fk FOREIGN KEY (cod_proveedor) REFERENCES cd_proveedores(cd_proveedores_pk);
 ]   ALTER TABLE ONLY public.cd_mov_chequeras DROP CONSTRAINT cd_proveedores_cd_mov_chequeras_fk;
       public       postgres    false    194    2024    173            +           2606    205454    menu_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY menu
    ADD CONSTRAINT menu_parent_fkey FOREIGN KEY (parent) REFERENCES menu(id) ON UPDATE CASCADE ON DELETE SET NULL;
 ?   ALTER TABLE ONLY public.menu DROP CONSTRAINT menu_parent_fkey;
       public       postgres    false    2058    203    203            -           2606    221830 "   roles_operaciones_operaciones_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY roles_operaciones
    ADD CONSTRAINT roles_operaciones_operaciones_fkey FOREIGN KEY (operacion_id) REFERENCES operaciones(id) ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public.roles_operaciones DROP CONSTRAINT roles_operaciones_operaciones_fkey;
       public       postgres    false    208    2062    207            ,           2606    221825    roles_operaciones_roles_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY roles_operaciones
    ADD CONSTRAINT roles_operaciones_roles_fkey FOREIGN KEY (rol_id) REFERENCES roles(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.roles_operaciones DROP CONSTRAINT roles_operaciones_roles_fkey;
       public       postgres    false    205    208    2060            *           2606    213669    roles_user_fkey    FK CONSTRAINT     f   ALTER TABLE ONLY "user"
    ADD CONSTRAINT roles_user_fkey FOREIGN KEY (rol_id) REFERENCES roles(id);
 @   ALTER TABLE ONLY public."user" DROP CONSTRAINT roles_user_fkey;
       public       postgres    false    201    2060    205            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   }   x�M�1� й���1p�JD�BB����^��lW��w�t��P�!2-8b%@f�u_��v�fp �@8��<�%Z	~RD��ui%�������y��GG2��Eұ���mϣ��yc.��/_      �   �   x�U�K�0��]Za�K7(�
%(@��%/B^��5�0�o.��������cYC�d��֚���FS/��h��k������W���<4C~�y�4F���U������<[T+�5��V�hIu&����Y?`�%Wؐ1�c�T��y�*�󀉛<������Z��8��      �   ;   x�3�tL����,.)JL�/�2�-.M,��Wp-.I�KI,�2�.-H-R�Jp��qqq �      �   e   x���� �j<Lw	����ȉB.@��Tjwx�3�����B���-t�@���Ma
Sx�sӹ��tn��6�
;�8��)T�/��7ӛ��]U���f      �   c  x�]�KO�@F��_Ⴍ8��vڢT��P����}���L��z�h4nn��;'�@�S���%�rU�d�ztX��G�~9�F���e<z���k2z��C�gf-�B�'��Ձ9���7�z�'	u�^M�0�S㶙��^�k����o���x�,��i- � Q�ڐPxF˂&q(�,�BO�� ��y��d�KRx*��&���ѽ٭h)B�å��N�u��]�����x�@o�����X�p9��+יּ>߿M�6�_hc���&dP����(�SU�ta����)�삼|�c�R��OS��O��r�[P�i�/��~$*�To���˕�?9dq�Z��6���������3c�7�d���     