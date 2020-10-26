--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2 (Ubuntu 12.2-1.pgdg18.04+1)
-- Dumped by pg_dump version 12.2 (Ubuntu 12.2-1.pgdg18.04+1)

-- Started on 2020-07-26 17:03:11 WIB

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

DROP DATABASE IF EXISTS salesinvoice;
--
-- TOC entry 2958 (class 1262 OID 16544)
-- Name: salesinvoice; Type: DATABASE; Schema: -; Owner: dbexerphi_dba
--

CREATE DATABASE salesinvoice WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


ALTER DATABASE salesinvoice OWNER TO dbexerphi_dba;

\connect salesinvoice

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
-- TOC entry 202 (class 1259 OID 16695)
-- Name: paymentimage; Type: TABLE; Schema: public; Owner: dbexerphi_dba
--

CREATE TABLE public.paymentimage (
    salesinvoice bigint NOT NULL,
    imagedata bytea NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.paymentimage OWNER TO dbexerphi_dba;

--
-- TOC entry 203 (class 1259 OID 16701)
-- Name: salesinvoice; Type: TABLE; Schema: public; Owner: dbexerphi_dba
--

CREATE TABLE public.salesinvoice (
    systemid bigint NOT NULL,
    status_canceled integer,
    status_delivery integer,
    disc double precision,
    disc_memo character varying(255),
    id_customer bigint NOT NULL,
    invoice_no character varying(255) NOT NULL,
    issuedate timestamp without time zone NOT NULL,
    memo character varying(255),
    misc_charge double precision,
    misc_charge_memo character varying(255),
    no_fak_pajak character varying(255),
    payment_amount double precision,
    payment_details character varying(255),
    status_payment integer,
    payment_type integer,
    promocode_used integer,
    shipping_line integer,
    vat double precision,
    vat_inclusive boolean
);


ALTER TABLE public.salesinvoice OWNER TO dbexerphi_dba;

--
-- TOC entry 204 (class 1259 OID 16707)
-- Name: salesinvoice_id_si_seq; Type: SEQUENCE; Schema: public; Owner: dbexerphi_dba
--

CREATE SEQUENCE public.salesinvoice_id_si_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.salesinvoice_id_si_seq OWNER TO dbexerphi_dba;

--
-- TOC entry 205 (class 1259 OID 16709)
-- Name: salesinvoice_systemid_seq; Type: SEQUENCE; Schema: public; Owner: dbexerphi_dba
--

CREATE SEQUENCE public.salesinvoice_systemid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.salesinvoice_systemid_seq OWNER TO dbexerphi_dba;

--
-- TOC entry 2959 (class 0 OID 0)
-- Dependencies: 205
-- Name: salesinvoice_systemid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbexerphi_dba
--

ALTER SEQUENCE public.salesinvoice_systemid_seq OWNED BY public.salesinvoice.systemid;


--
-- TOC entry 206 (class 1259 OID 16711)
-- Name: salesinvoiceitem; Type: TABLE; Schema: public; Owner: dbexerphi_dba
--

CREATE TABLE public.salesinvoiceitem (
    id_item integer NOT NULL,
    parent bigint NOT NULL,
    disc double precision,
    harga_jual double precision,
    item_name character varying(255) NOT NULL,
    qty double precision,
    reqnote character varying(255)
);


ALTER TABLE public.salesinvoiceitem OWNER TO dbexerphi_dba;

--
-- TOC entry 2816 (class 2604 OID 16717)
-- Name: salesinvoice systemid; Type: DEFAULT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.salesinvoice ALTER COLUMN systemid SET DEFAULT nextval('public.salesinvoice_systemid_seq'::regclass);


--
-- TOC entry 2818 (class 2606 OID 16720)
-- Name: paymentimage paymentimage_pkey; Type: CONSTRAINT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.paymentimage
    ADD CONSTRAINT paymentimage_pkey PRIMARY KEY (salesinvoice);


--
-- TOC entry 2820 (class 2606 OID 16722)
-- Name: salesinvoice salesinvoice_pkey; Type: CONSTRAINT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.salesinvoice
    ADD CONSTRAINT salesinvoice_pkey PRIMARY KEY (systemid);


--
-- TOC entry 2824 (class 2606 OID 16724)
-- Name: salesinvoiceitem salesinvoiceitem_pkey; Type: CONSTRAINT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.salesinvoiceitem
    ADD CONSTRAINT salesinvoiceitem_pkey PRIMARY KEY (id_item, parent);


--
-- TOC entry 2822 (class 2606 OID 16726)
-- Name: salesinvoice uk_gh7l6j86uqocd3c3f8ofjpjlg; Type: CONSTRAINT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.salesinvoice
    ADD CONSTRAINT uk_gh7l6j86uqocd3c3f8ofjpjlg UNIQUE (invoice_no);


--
-- TOC entry 2825 (class 2606 OID 16727)
-- Name: paymentimage paymentimage_salesinvoice_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.paymentimage
    ADD CONSTRAINT paymentimage_salesinvoice_fkey FOREIGN KEY (salesinvoice) REFERENCES public.salesinvoice(systemid);


--
-- TOC entry 2826 (class 2606 OID 16732)
-- Name: salesinvoiceitem salesinvoiceitem_parent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.salesinvoiceitem
    ADD CONSTRAINT salesinvoiceitem_parent_fkey FOREIGN KEY (parent) REFERENCES public.salesinvoice(systemid);


-- Completed on 2020-07-26 17:03:12 WIB

--
-- PostgreSQL database dump complete
--

