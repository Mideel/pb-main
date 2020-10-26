--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2 (Ubuntu 12.2-1.pgdg18.04+1)
-- Dumped by pg_dump version 12.2 (Ubuntu 12.2-1.pgdg18.04+1)

-- Started on 2020-07-26 17:04:31 WIB

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

DROP DATABASE IF EXISTS salesorder;
--
-- TOC entry 2954 (class 1262 OID 16512)
-- Name: salesorder; Type: DATABASE; Schema: -; Owner: dbexerphi_dba
--

CREATE DATABASE salesorder WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


ALTER DATABASE salesorder OWNER TO dbexerphi_dba;

\connect salesorder

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
-- TOC entry 202 (class 1259 OID 16513)
-- Name: cartdetail; Type: TABLE; Schema: public; Owner: dbexerphi_dba
--

CREATE TABLE public.cartdetail (
    id_customer bigint NOT NULL,
    id_item integer NOT NULL,
    item_name character varying(255),
    qty double precision,
    reqnote character varying(255)
);


ALTER TABLE public.cartdetail OWNER TO dbexerphi_dba;

--
-- TOC entry 203 (class 1259 OID 16519)
-- Name: salesorder; Type: TABLE; Schema: public; Owner: dbexerphi_dba
--

CREATE TABLE public.salesorder (
    systemid bigint NOT NULL,
    status_canceled integer NOT NULL,
    status_delivery integer,
    disc double precision,
    disc_memo character varying(255),
    id_customer bigint NOT NULL,
    issuedate timestamp without time zone NOT NULL,
    memo character varying(255),
    misc_charge double precision,
    misc_charge_memo character varying(255),
    status_payment integer,
    promocode_used integer,
    shipping_line integer,
    vat double precision,
    vat_inclusive boolean
);


ALTER TABLE public.salesorder OWNER TO dbexerphi_dba;

--
-- TOC entry 204 (class 1259 OID 16525)
-- Name: salesorder_id_so_seq; Type: SEQUENCE; Schema: public; Owner: dbexerphi_dba
--

CREATE SEQUENCE public.salesorder_id_so_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.salesorder_id_so_seq OWNER TO dbexerphi_dba;

--
-- TOC entry 205 (class 1259 OID 16527)
-- Name: salesorder_systemid_seq; Type: SEQUENCE; Schema: public; Owner: dbexerphi_dba
--

CREATE SEQUENCE public.salesorder_systemid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.salesorder_systemid_seq OWNER TO dbexerphi_dba;

--
-- TOC entry 2955 (class 0 OID 0)
-- Dependencies: 205
-- Name: salesorder_systemid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbexerphi_dba
--

ALTER SEQUENCE public.salesorder_systemid_seq OWNED BY public.salesorder.systemid;


--
-- TOC entry 206 (class 1259 OID 16529)
-- Name: salesorderitem; Type: TABLE; Schema: public; Owner: dbexerphi_dba
--

CREATE TABLE public.salesorderitem (
    id_item integer NOT NULL,
    parent bigint NOT NULL,
    disc double precision,
    harga_jual double precision,
    item_name character varying(255) NOT NULL,
    qty double precision
);


ALTER TABLE public.salesorderitem OWNER TO dbexerphi_dba;

--
-- TOC entry 2815 (class 2604 OID 16532)
-- Name: salesorder systemid; Type: DEFAULT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.salesorder ALTER COLUMN systemid SET DEFAULT nextval('public.salesorder_systemid_seq'::regclass);


--
-- TOC entry 2817 (class 2606 OID 16534)
-- Name: cartdetail cartdetail_pkey; Type: CONSTRAINT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.cartdetail
    ADD CONSTRAINT cartdetail_pkey PRIMARY KEY (id_customer, id_item);


--
-- TOC entry 2819 (class 2606 OID 16536)
-- Name: salesorder salesorder_pkey; Type: CONSTRAINT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.salesorder
    ADD CONSTRAINT salesorder_pkey PRIMARY KEY (systemid);


--
-- TOC entry 2821 (class 2606 OID 16538)
-- Name: salesorderitem salesorderitem_pkey; Type: CONSTRAINT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.salesorderitem
    ADD CONSTRAINT salesorderitem_pkey PRIMARY KEY (id_item, parent);


--
-- TOC entry 2822 (class 2606 OID 16539)
-- Name: salesorderitem salesorderitem_parent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.salesorderitem
    ADD CONSTRAINT salesorderitem_parent_fkey FOREIGN KEY (parent) REFERENCES public.salesorder(systemid);


-- Completed on 2020-07-26 17:04:32 WIB

--
-- PostgreSQL database dump complete
--

