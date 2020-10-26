--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2 (Ubuntu 12.2-1.pgdg18.04+1)
-- Dumped by pg_dump version 12.2 (Ubuntu 12.2-1.pgdg18.04+1)

-- Started on 2020-07-26 20:24:33 WIB

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

DROP DATABASE IF EXISTS stock;
--
-- TOC entry 2954 (class 1262 OID 24658)
-- Name: stock; Type: DATABASE; Schema: -; Owner: dbexerphi_dba
--

CREATE DATABASE stock WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


ALTER DATABASE stock OWNER TO dbexerphi_dba;

\connect stock

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

SET default_table_access_method = heap;

--
-- TOC entry 202 (class 1259 OID 24659)
-- Name: gudang; Type: TABLE; Schema: public; Owner: dbexerphi_dba
--

CREATE TABLE public.gudang (
    id_gudang integer NOT NULL,
    addr character varying(255),
    isactive boolean,
    "default" boolean,
    memo character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.gudang OWNER TO dbexerphi_dba;

--
-- TOC entry 203 (class 1259 OID 24665)
-- Name: gudang_id_gudang_seq; Type: SEQUENCE; Schema: public; Owner: dbexerphi_dba
--

CREATE SEQUENCE public.gudang_id_gudang_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gudang_id_gudang_seq OWNER TO dbexerphi_dba;

--
-- TOC entry 204 (class 1259 OID 24667)
-- Name: gudang_id_gudang_seq1; Type: SEQUENCE; Schema: public; Owner: dbexerphi_dba
--

CREATE SEQUENCE public.gudang_id_gudang_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gudang_id_gudang_seq1 OWNER TO dbexerphi_dba;

--
-- TOC entry 2955 (class 0 OID 0)
-- Dependencies: 204
-- Name: gudang_id_gudang_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbexerphi_dba
--

ALTER SEQUENCE public.gudang_id_gudang_seq1 OWNED BY public.gudang.id_gudang;


--
-- TOC entry 205 (class 1259 OID 24669)
-- Name: onhandstock; Type: TABLE; Schema: public; Owner: dbexerphi_dba
--

CREATE TABLE public.onhandstock (
    id_item integer NOT NULL,
    id_gudang integer NOT NULL,
    batch_no character varying(255),
    expirydate timestamp without time zone,
    item_name character varying(255),
    qty double precision,
    serialno character varying(255),
    str_expiry_date character varying(255)
);


ALTER TABLE public.onhandstock OWNER TO dbexerphi_dba;

--
-- TOC entry 2811 (class 2604 OID 24675)
-- Name: gudang id_gudang; Type: DEFAULT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.gudang ALTER COLUMN id_gudang SET DEFAULT nextval('public.gudang_id_gudang_seq1'::regclass);


--
-- TOC entry 2945 (class 0 OID 24659)
-- Dependencies: 202
-- Data for Name: gudang; Type: TABLE DATA; Schema: public; Owner: dbexerphi_dba
--



--
-- TOC entry 2948 (class 0 OID 24669)
-- Dependencies: 205
-- Data for Name: onhandstock; Type: TABLE DATA; Schema: public; Owner: dbexerphi_dba
--



--
-- TOC entry 2956 (class 0 OID 0)
-- Dependencies: 203
-- Name: gudang_id_gudang_seq; Type: SEQUENCE SET; Schema: public; Owner: dbexerphi_dba
--

SELECT pg_catalog.setval('public.gudang_id_gudang_seq', 1, false);


--
-- TOC entry 2957 (class 0 OID 0)
-- Dependencies: 204
-- Name: gudang_id_gudang_seq1; Type: SEQUENCE SET; Schema: public; Owner: dbexerphi_dba
--

SELECT pg_catalog.setval('public.gudang_id_gudang_seq1', 1, false);


--
-- TOC entry 2813 (class 2606 OID 24677)
-- Name: gudang gudang_pkey; Type: CONSTRAINT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.gudang
    ADD CONSTRAINT gudang_pkey PRIMARY KEY (id_gudang);


--
-- TOC entry 2817 (class 2606 OID 24679)
-- Name: onhandstock onhandstock_pkey; Type: CONSTRAINT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.onhandstock
    ADD CONSTRAINT onhandstock_pkey PRIMARY KEY (id_item, id_gudang);


--
-- TOC entry 2815 (class 2606 OID 24681)
-- Name: gudang uk_r73kll7xypbyhwew6w44qn3p9; Type: CONSTRAINT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.gudang
    ADD CONSTRAINT uk_r73kll7xypbyhwew6w44qn3p9 UNIQUE (name);


--
-- TOC entry 2818 (class 2606 OID 24682)
-- Name: onhandstock onhandstock_id_gudang_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.onhandstock
    ADD CONSTRAINT onhandstock_id_gudang_fkey FOREIGN KEY (id_gudang) REFERENCES public.gudang(id_gudang);


-- Completed on 2020-07-26 20:24:34 WIB

--
-- PostgreSQL database dump complete
--

