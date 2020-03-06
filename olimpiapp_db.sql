--
-- PostgreSQL database dump
--

-- Dumped from database version 11.7 (Debian 11.7-0+deb10u1)
-- Dumped by pg_dump version 11.7 (Debian 11.7-0+deb10u1)

-- Started on 2020-03-05 18:34:31 -05

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 212 (class 1259 OID 19112)
-- Name: Comisarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Comisarios" (
    id integer NOT NULL,
    nombre character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Comisarios" OWNER TO postgres;

--
-- TOC entry 3021 (class 0 OID 0)
-- Dependencies: 212
-- Name: TABLE "Comisarios"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Comisarios" IS 'Comisarios disponible para los eventos';


--
-- TOC entry 3022 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN "Comisarios".nombre; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Comisarios".nombre IS 'nombre del comisario';


--
-- TOC entry 211 (class 1259 OID 19110)
-- Name: Comisarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Comisarios_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Comisarios_id_seq" OWNER TO postgres;

--
-- TOC entry 3023 (class 0 OID 0)
-- Dependencies: 211
-- Name: Comisarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Comisarios_id_seq" OWNED BY public."Comisarios".id;


--
-- TOC entry 202 (class 1259 OID 19056)
-- Name: Complejos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Complejos" (
    id integer NOT NULL,
    nombre character varying(255),
    localizacion character varying(255),
    jefe character varying(255),
    superficie double precision,
    id_sede integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Complejos" OWNER TO postgres;

--
-- TOC entry 3024 (class 0 OID 0)
-- Dependencies: 202
-- Name: TABLE "Complejos"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Complejos" IS 'Complejos deportivos de cada Sede Olimpica';


--
-- TOC entry 3025 (class 0 OID 0)
-- Dependencies: 202
-- Name: COLUMN "Complejos".nombre; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Complejos".nombre IS 'nombre del complejo deportivo';


--
-- TOC entry 3026 (class 0 OID 0)
-- Dependencies: 202
-- Name: COLUMN "Complejos".localizacion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Complejos".localizacion IS 'ubicacion del complejo';


--
-- TOC entry 3027 (class 0 OID 0)
-- Dependencies: 202
-- Name: COLUMN "Complejos".jefe; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Complejos".jefe IS 'Jefe del complejo';


--
-- TOC entry 3028 (class 0 OID 0)
-- Dependencies: 202
-- Name: COLUMN "Complejos".superficie; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Complejos".superficie IS 'metros cuadrado de extension del complejo';


--
-- TOC entry 3029 (class 0 OID 0)
-- Dependencies: 202
-- Name: COLUMN "Complejos".id_sede; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Complejos".id_sede IS 'owner del complejo';


--
-- TOC entry 201 (class 1259 OID 19054)
-- Name: Complejos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Complejos_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Complejos_id_seq" OWNER TO postgres;

--
-- TOC entry 3030 (class 0 OID 0)
-- Dependencies: 201
-- Name: Complejos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Complejos_id_seq" OWNED BY public."Complejos".id;


--
-- TOC entry 210 (class 1259 OID 19096)
-- Name: Deportes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Deportes" (
    id integer NOT NULL,
    nombre character varying(255),
    indicador character varying(255),
    id_subsede integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Deportes" OWNER TO postgres;

--
-- TOC entry 3031 (class 0 OID 0)
-- Dependencies: 210
-- Name: TABLE "Deportes"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Deportes" IS 'Cada instalacion dependiendo del tipo puede albergar de uno (tipo unico) o muchos (tipo polideportivo) deportes';


--
-- TOC entry 3032 (class 0 OID 0)
-- Dependencies: 210
-- Name: COLUMN "Deportes".nombre; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Deportes".nombre IS 'nombre del deporte ';


--
-- TOC entry 3033 (class 0 OID 0)
-- Dependencies: 210
-- Name: COLUMN "Deportes".indicador; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Deportes".indicador IS 'indicador de localizacion para el deporte';


--
-- TOC entry 3034 (class 0 OID 0)
-- Dependencies: 210
-- Name: COLUMN "Deportes".id_subsede; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Deportes".id_subsede IS 'subsede a la que pertenece el deporte';


--
-- TOC entry 209 (class 1259 OID 19094)
-- Name: Deportes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Deportes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Deportes_id_seq" OWNER TO postgres;

--
-- TOC entry 3035 (class 0 OID 0)
-- Dependencies: 209
-- Name: Deportes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Deportes_id_seq" OWNED BY public."Deportes".id;


--
-- TOC entry 216 (class 1259 OID 19133)
-- Name: Equipamientos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Equipamientos" (
    id integer NOT NULL,
    nombre character varying(255),
    cantidad integer,
    id_deporte integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Equipamientos" OWNER TO postgres;

--
-- TOC entry 3036 (class 0 OID 0)
-- Dependencies: 216
-- Name: TABLE "Equipamientos"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Equipamientos" IS 'Equipamiento asociado a cada deporte y que tambien puede ser usado en cada evento';


--
-- TOC entry 3037 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN "Equipamientos".nombre; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Equipamientos".nombre IS 'Nombre del tipo del equipamiento';


--
-- TOC entry 3038 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN "Equipamientos".cantidad; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Equipamientos".cantidad IS 'cantidad en inventario';


--
-- TOC entry 3039 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN "Equipamientos".id_deporte; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Equipamientos".id_deporte IS 'deporte asociado al equipamiento';


--
-- TOC entry 215 (class 1259 OID 19131)
-- Name: Equipamientos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Equipamientos_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Equipamientos_id_seq" OWNER TO postgres;

--
-- TOC entry 3040 (class 0 OID 0)
-- Dependencies: 215
-- Name: Equipamientos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Equipamientos_id_seq" OWNED BY public."Equipamientos".id;


--
-- TOC entry 218 (class 1259 OID 19146)
-- Name: Equipoeventos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Equipoeventos" (
    id integer NOT NULL,
    cantidad integer,
    id_evento integer,
    id_equipo integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Equipoeventos" OWNER TO postgres;

--
-- TOC entry 3041 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE "Equipoeventos"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Equipoeventos" IS 'Equipos asociados a un evento';


--
-- TOC entry 3042 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN "Equipoeventos".cantidad; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Equipoeventos".cantidad IS 'cantidad necesaria para el evento';


--
-- TOC entry 3043 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN "Equipoeventos".id_evento; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Equipoeventos".id_evento IS 'id del evento donde se requiere el equipo';


--
-- TOC entry 3044 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN "Equipoeventos".id_equipo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Equipoeventos".id_equipo IS 'is del Equipo para el evento';


--
-- TOC entry 217 (class 1259 OID 19144)
-- Name: Equipoeventos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Equipoeventos_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Equipoeventos_id_seq" OWNER TO postgres;

--
-- TOC entry 3045 (class 0 OID 0)
-- Dependencies: 217
-- Name: Equipoeventos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Equipoeventos_id_seq" OWNED BY public."Equipoeventos".id;


--
-- TOC entry 220 (class 1259 OID 19164)
-- Name: Eventocomisarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Eventocomisarios" (
    id integer NOT NULL,
    tipo character varying(255),
    id_comisario integer,
    id_evento integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Eventocomisarios" OWNER TO postgres;

--
-- TOC entry 3046 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE "Eventocomisarios"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Eventocomisarios" IS 'Comisarios participante en eventos';


--
-- TOC entry 3047 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN "Eventocomisarios".tipo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Eventocomisarios".tipo IS 'los tipos son Juez y Observador';


--
-- TOC entry 3048 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN "Eventocomisarios".id_comisario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Eventocomisarios".id_comisario IS 'id del comisario que participa en el evento';


--
-- TOC entry 3049 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN "Eventocomisarios".id_evento; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Eventocomisarios".id_evento IS 'id del evento en el que partcipa el comisario';


--
-- TOC entry 219 (class 1259 OID 19162)
-- Name: Eventocomisarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Eventocomisarios_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Eventocomisarios_id_seq" OWNER TO postgres;

--
-- TOC entry 3050 (class 0 OID 0)
-- Dependencies: 219
-- Name: Eventocomisarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Eventocomisarios_id_seq" OWNED BY public."Eventocomisarios".id;


--
-- TOC entry 214 (class 1259 OID 19120)
-- Name: Eventos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Eventos" (
    id integer NOT NULL,
    nombre character varying(255),
    inicio timestamp with time zone,
    fin timestamp with time zone,
    comisarios integer,
    participantes integer,
    id_deporte integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Eventos" OWNER TO postgres;

--
-- TOC entry 3051 (class 0 OID 0)
-- Dependencies: 214
-- Name: TABLE "Eventos"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Eventos" IS 'eventos de una subsede';


--
-- TOC entry 3052 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN "Eventos".nombre; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Eventos".nombre IS 'nombre del evento';


--
-- TOC entry 3053 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN "Eventos".inicio; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Eventos".inicio IS 'fecha de inicio';


--
-- TOC entry 3054 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN "Eventos".fin; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Eventos".fin IS 'fecha de fin';


--
-- TOC entry 3055 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN "Eventos".comisarios; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Eventos".comisarios IS 'cantidad de comisarios del evento';


--
-- TOC entry 3056 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN "Eventos".participantes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Eventos".participantes IS 'cantidad de participantes ';


--
-- TOC entry 3057 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN "Eventos".id_deporte; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Eventos".id_deporte IS 'Deporte asociado al evento a realizar';


--
-- TOC entry 213 (class 1259 OID 19118)
-- Name: Eventos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Eventos_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Eventos_id_seq" OWNER TO postgres;

--
-- TOC entry 3058 (class 0 OID 0)
-- Dependencies: 213
-- Name: Eventos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Eventos_id_seq" OWNED BY public."Eventos".id;


--
-- TOC entry 206 (class 1259 OID 19080)
-- Name: Polis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Polis" (
    id integer NOT NULL,
    datos character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Polis" OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 19078)
-- Name: Polis_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Polis_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Polis_id_seq" OWNER TO postgres;

--
-- TOC entry 3059 (class 0 OID 0)
-- Dependencies: 205
-- Name: Polis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Polis_id_seq" OWNED BY public."Polis".id;


--
-- TOC entry 200 (class 1259 OID 19048)
-- Name: Sedes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Sedes" (
    id integer NOT NULL,
    nombre character varying(255),
    complejos integer,
    presupuesto double precision,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Sedes" OWNER TO postgres;

--
-- TOC entry 3060 (class 0 OID 0)
-- Dependencies: 200
-- Name: TABLE "Sedes"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Sedes" IS 'Sedes Olimpicas';


--
-- TOC entry 3061 (class 0 OID 0)
-- Dependencies: 200
-- Name: COLUMN "Sedes".nombre; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Sedes".nombre IS 'nombre de la sede olimpica';


--
-- TOC entry 3062 (class 0 OID 0)
-- Dependencies: 200
-- Name: COLUMN "Sedes".complejos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Sedes".complejos IS 'cantidad de complejos deportivos con los que cuenta  la sede';


--
-- TOC entry 3063 (class 0 OID 0)
-- Dependencies: 200
-- Name: COLUMN "Sedes".presupuesto; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Sedes".presupuesto IS 'presupuesto asignado';


--
-- TOC entry 199 (class 1259 OID 19046)
-- Name: Sedes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Sedes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Sedes_id_seq" OWNER TO postgres;

--
-- TOC entry 3064 (class 0 OID 0)
-- Dependencies: 199
-- Name: Sedes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Sedes_id_seq" OWNED BY public."Sedes".id;


--
-- TOC entry 196 (class 1259 OID 17664)
-- Name: SequelizeMeta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);


ALTER TABLE public."SequelizeMeta" OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 19088)
-- Name: Subsedes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Subsedes" (
    id integer NOT NULL,
    tipo character varying(255),
    id_complejo integer,
    id_unico integer,
    id_poli integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Subsedes" OWNER TO postgres;

--
-- TOC entry 3065 (class 0 OID 0)
-- Dependencies: 208
-- Name: TABLE "Subsedes"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Subsedes" IS 'Subsede del complejo, puede ser  polideportivo o unico deporte';


--
-- TOC entry 3066 (class 0 OID 0)
-- Dependencies: 208
-- Name: COLUMN "Subsedes".tipo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Subsedes".tipo IS 'tipo de sede: polideportivo o unico';


--
-- TOC entry 3067 (class 0 OID 0)
-- Dependencies: 208
-- Name: COLUMN "Subsedes".id_complejo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Subsedes".id_complejo IS 'complejo al que pertenece la sede';


--
-- TOC entry 3068 (class 0 OID 0)
-- Dependencies: 208
-- Name: COLUMN "Subsedes".id_unico; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Subsedes".id_unico IS 'Si es complejo unico esta asociado a la tabla Unicos, que contendra datos adicionales de este tipo de instalacion';


--
-- TOC entry 3069 (class 0 OID 0)
-- Dependencies: 208
-- Name: COLUMN "Subsedes".id_poli; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Subsedes".id_poli IS 'Si es complejo polideportivo esta asociado a la tabla Poli, que contendra datos adicionales de este tipo de instalacion';


--
-- TOC entry 207 (class 1259 OID 19086)
-- Name: Subsedes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Subsedes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Subsedes_id_seq" OWNER TO postgres;

--
-- TOC entry 3070 (class 0 OID 0)
-- Dependencies: 207
-- Name: Subsedes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Subsedes_id_seq" OWNED BY public."Subsedes".id;


--
-- TOC entry 204 (class 1259 OID 19072)
-- Name: Unicos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Unicos" (
    id integer NOT NULL,
    datos character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Unicos" OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 19070)
-- Name: Unicos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Unicos_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Unicos_id_seq" OWNER TO postgres;

--
-- TOC entry 3071 (class 0 OID 0)
-- Dependencies: 203
-- Name: Unicos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Unicos_id_seq" OWNED BY public."Unicos".id;


--
-- TOC entry 198 (class 1259 OID 19037)
-- Name: Usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Usuarios" (
    id integer NOT NULL,
    nombre character varying(255),
    email character varying(255),
    password character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Usuarios" OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 19035)
-- Name: Usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Usuarios_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Usuarios_id_seq" OWNER TO postgres;

--
-- TOC entry 3072 (class 0 OID 0)
-- Dependencies: 197
-- Name: Usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Usuarios_id_seq" OWNED BY public."Usuarios".id;


--
-- TOC entry 2855 (class 2604 OID 19115)
-- Name: Comisarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Comisarios" ALTER COLUMN id SET DEFAULT nextval('public."Comisarios_id_seq"'::regclass);


--
-- TOC entry 2850 (class 2604 OID 19059)
-- Name: Complejos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Complejos" ALTER COLUMN id SET DEFAULT nextval('public."Complejos_id_seq"'::regclass);


--
-- TOC entry 2854 (class 2604 OID 19099)
-- Name: Deportes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Deportes" ALTER COLUMN id SET DEFAULT nextval('public."Deportes_id_seq"'::regclass);


--
-- TOC entry 2857 (class 2604 OID 19136)
-- Name: Equipamientos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Equipamientos" ALTER COLUMN id SET DEFAULT nextval('public."Equipamientos_id_seq"'::regclass);


--
-- TOC entry 2858 (class 2604 OID 19149)
-- Name: Equipoeventos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Equipoeventos" ALTER COLUMN id SET DEFAULT nextval('public."Equipoeventos_id_seq"'::regclass);


--
-- TOC entry 2859 (class 2604 OID 19167)
-- Name: Eventocomisarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Eventocomisarios" ALTER COLUMN id SET DEFAULT nextval('public."Eventocomisarios_id_seq"'::regclass);


--
-- TOC entry 2856 (class 2604 OID 19123)
-- Name: Eventos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Eventos" ALTER COLUMN id SET DEFAULT nextval('public."Eventos_id_seq"'::regclass);


--
-- TOC entry 2852 (class 2604 OID 19083)
-- Name: Polis id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Polis" ALTER COLUMN id SET DEFAULT nextval('public."Polis_id_seq"'::regclass);


--
-- TOC entry 2849 (class 2604 OID 19051)
-- Name: Sedes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sedes" ALTER COLUMN id SET DEFAULT nextval('public."Sedes_id_seq"'::regclass);


--
-- TOC entry 2853 (class 2604 OID 19091)
-- Name: Subsedes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Subsedes" ALTER COLUMN id SET DEFAULT nextval('public."Subsedes_id_seq"'::regclass);


--
-- TOC entry 2851 (class 2604 OID 19075)
-- Name: Unicos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Unicos" ALTER COLUMN id SET DEFAULT nextval('public."Unicos_id_seq"'::regclass);


--
-- TOC entry 2848 (class 2604 OID 19040)
-- Name: Usuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuarios" ALTER COLUMN id SET DEFAULT nextval('public."Usuarios_id_seq"'::regclass);


--
-- TOC entry 2877 (class 2606 OID 19117)
-- Name: Comisarios Comisarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Comisarios"
    ADD CONSTRAINT "Comisarios_pkey" PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 19064)
-- Name: Complejos Complejos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Complejos"
    ADD CONSTRAINT "Complejos_pkey" PRIMARY KEY (id);


--
-- TOC entry 2875 (class 2606 OID 19104)
-- Name: Deportes Deportes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Deportes"
    ADD CONSTRAINT "Deportes_pkey" PRIMARY KEY (id);


--
-- TOC entry 2881 (class 2606 OID 19138)
-- Name: Equipamientos Equipamientos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Equipamientos"
    ADD CONSTRAINT "Equipamientos_pkey" PRIMARY KEY (id);


--
-- TOC entry 2883 (class 2606 OID 19151)
-- Name: Equipoeventos Equipoeventos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Equipoeventos"
    ADD CONSTRAINT "Equipoeventos_pkey" PRIMARY KEY (id);


--
-- TOC entry 2885 (class 2606 OID 19169)
-- Name: Eventocomisarios Eventocomisarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Eventocomisarios"
    ADD CONSTRAINT "Eventocomisarios_pkey" PRIMARY KEY (id);


--
-- TOC entry 2879 (class 2606 OID 19125)
-- Name: Eventos Eventos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Eventos"
    ADD CONSTRAINT "Eventos_pkey" PRIMARY KEY (id);


--
-- TOC entry 2871 (class 2606 OID 19085)
-- Name: Polis Polis_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Polis"
    ADD CONSTRAINT "Polis_pkey" PRIMARY KEY (id);


--
-- TOC entry 2865 (class 2606 OID 19053)
-- Name: Sedes Sedes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sedes"
    ADD CONSTRAINT "Sedes_pkey" PRIMARY KEY (id);


--
-- TOC entry 2861 (class 2606 OID 17668)
-- Name: SequelizeMeta SequelizeMeta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);


--
-- TOC entry 2873 (class 2606 OID 19093)
-- Name: Subsedes Subsedes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Subsedes"
    ADD CONSTRAINT "Subsedes_pkey" PRIMARY KEY (id);


--
-- TOC entry 2869 (class 2606 OID 19077)
-- Name: Unicos Unicos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Unicos"
    ADD CONSTRAINT "Unicos_pkey" PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 19045)
-- Name: Usuarios Usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuarios"
    ADD CONSTRAINT "Usuarios_pkey" PRIMARY KEY (id);


--
-- TOC entry 2886 (class 2606 OID 19065)
-- Name: Complejos Complejos_id_sede_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Complejos"
    ADD CONSTRAINT "Complejos_id_sede_fkey" FOREIGN KEY (id_sede) REFERENCES public."Sedes"(id) ON DELETE CASCADE;


--
-- TOC entry 2888 (class 2606 OID 19105)
-- Name: Deportes Deportes_id_subsede_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Deportes"
    ADD CONSTRAINT "Deportes_id_subsede_fkey" FOREIGN KEY (id_subsede) REFERENCES public."Subsedes"(id) ON DELETE CASCADE;


--
-- TOC entry 2890 (class 2606 OID 19139)
-- Name: Equipamientos Equipamientos_id_deporte_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Equipamientos"
    ADD CONSTRAINT "Equipamientos_id_deporte_fkey" FOREIGN KEY (id_deporte) REFERENCES public."Deportes"(id) ON DELETE CASCADE;


--
-- TOC entry 2892 (class 2606 OID 19157)
-- Name: Equipoeventos Equipoeventos_id_equipo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Equipoeventos"
    ADD CONSTRAINT "Equipoeventos_id_equipo_fkey" FOREIGN KEY (id_equipo) REFERENCES public."Equipamientos"(id) ON DELETE CASCADE;


--
-- TOC entry 2891 (class 2606 OID 19152)
-- Name: Equipoeventos Equipoeventos_id_evento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Equipoeventos"
    ADD CONSTRAINT "Equipoeventos_id_evento_fkey" FOREIGN KEY (id_evento) REFERENCES public."Eventos"(id) ON DELETE CASCADE;


--
-- TOC entry 2893 (class 2606 OID 19170)
-- Name: Eventocomisarios Eventocomisarios_id_comisario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Eventocomisarios"
    ADD CONSTRAINT "Eventocomisarios_id_comisario_fkey" FOREIGN KEY (id_comisario) REFERENCES public."Comisarios"(id) ON DELETE CASCADE;


--
-- TOC entry 2894 (class 2606 OID 19175)
-- Name: Eventocomisarios Eventocomisarios_id_evento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Eventocomisarios"
    ADD CONSTRAINT "Eventocomisarios_id_evento_fkey" FOREIGN KEY (id_evento) REFERENCES public."Eventos"(id) ON DELETE CASCADE;


--
-- TOC entry 2889 (class 2606 OID 19126)
-- Name: Eventos Eventos_id_deporte_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Eventos"
    ADD CONSTRAINT "Eventos_id_deporte_fkey" FOREIGN KEY (id_deporte) REFERENCES public."Deportes"(id) ON DELETE CASCADE;


--
-- TOC entry 2887 (class 2606 OID 19180)
-- Name: Subsedes complejo_subsede_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Subsedes"
    ADD CONSTRAINT complejo_subsede_fk FOREIGN KEY (id_complejo) REFERENCES public."Complejos"(id);


-- Completed on 2020-03-05 18:34:33 -05

--
-- PostgreSQL database dump complete
--

