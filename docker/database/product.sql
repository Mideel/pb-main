--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2 (Ubuntu 12.2-1.pgdg18.04+1)
-- Dumped by pg_dump version 12.2 (Ubuntu 12.2-1.pgdg18.04+1)

-- Started on 2020-07-26 17:01:37 WIB

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

DROP DATABASE IF EXISTS product;
--
-- TOC entry 3018 (class 1262 OID 16385)
-- Name: product; Type: DATABASE; Schema: -; Owner: dbexerphi_dba
--

CREATE DATABASE product WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


ALTER DATABASE product OWNER TO dbexerphi_dba;

\connect product

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
-- TOC entry 202 (class 1259 OID 16386)
-- Name: item; Type: TABLE; Schema: public; Owner: dbexerphi_dba
--

CREATE TABLE public.item (
    code_item_s50 character varying(255) NOT NULL,
    imagebytes bytea,
    min_stock real,
    sku character varying(255),
    systemid integer NOT NULL,
    id_merk integer NOT NULL,
    name_s50_inv character varying(255)
);


ALTER TABLE public.item OWNER TO dbexerphi_dba;

--
-- TOC entry 203 (class 1259 OID 16392)
-- Name: itemcategory; Type: TABLE; Schema: public; Owner: dbexerphi_dba
--

CREATE TABLE public.itemcategory (
    systemid integer NOT NULL,
    code_category character varying(255) NOT NULL,
    memo character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.itemcategory OWNER TO dbexerphi_dba;

--
-- TOC entry 204 (class 1259 OID 16398)
-- Name: itemcategory_systemid_seq; Type: SEQUENCE; Schema: public; Owner: dbexerphi_dba
--

CREATE SEQUENCE public.itemcategory_systemid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.itemcategory_systemid_seq OWNER TO dbexerphi_dba;

--
-- TOC entry 205 (class 1259 OID 16400)
-- Name: itemcategory_systemid_seq1; Type: SEQUENCE; Schema: public; Owner: dbexerphi_dba
--

CREATE SEQUENCE public.itemcategory_systemid_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.itemcategory_systemid_seq1 OWNER TO dbexerphi_dba;

--
-- TOC entry 3019 (class 0 OID 0)
-- Dependencies: 205
-- Name: itemcategory_systemid_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbexerphi_dba
--

ALTER SEQUENCE public.itemcategory_systemid_seq1 OWNED BY public.itemcategory.systemid;


--
-- TOC entry 206 (class 1259 OID 16402)
-- Name: itemcategorytag; Type: TABLE; Schema: public; Owner: dbexerphi_dba
--

CREATE TABLE public.itemcategorytag (
    id_item integer NOT NULL,
    id_ctgr integer NOT NULL
);


ALTER TABLE public.itemcategorytag OWNER TO dbexerphi_dba;

--
-- TOC entry 207 (class 1259 OID 16405)
-- Name: merk; Type: TABLE; Schema: public; Owner: dbexerphi_dba
--

CREATE TABLE public.merk (
    systemid integer NOT NULL,
    manufacturer character varying(255),
    memo character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.merk OWNER TO dbexerphi_dba;

--
-- TOC entry 208 (class 1259 OID 16411)
-- Name: merk_systemid_seq; Type: SEQUENCE; Schema: public; Owner: dbexerphi_dba
--

CREATE SEQUENCE public.merk_systemid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.merk_systemid_seq OWNER TO dbexerphi_dba;

--
-- TOC entry 209 (class 1259 OID 16413)
-- Name: merk_systemid_seq1; Type: SEQUENCE; Schema: public; Owner: dbexerphi_dba
--

CREATE SEQUENCE public.merk_systemid_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.merk_systemid_seq1 OWNER TO dbexerphi_dba;

--
-- TOC entry 3020 (class 0 OID 0)
-- Dependencies: 209
-- Name: merk_systemid_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbexerphi_dba
--

ALTER SEQUENCE public.merk_systemid_seq1 OWNED BY public.merk.systemid;


--
-- TOC entry 210 (class 1259 OID 16415)
-- Name: metrics; Type: TABLE; Schema: public; Owner: dbexerphi_dba
--

CREATE TABLE public.metrics (
    name_s50 character varying(255) NOT NULL,
    memo character varying(255),
    units double precision NOT NULL,
    metric_rinci character varying(255)
);


ALTER TABLE public.metrics OWNER TO dbexerphi_dba;

--
-- TOC entry 211 (class 1259 OID 16421)
-- Name: product; Type: TABLE; Schema: public; Owner: dbexerphi_dba
--

CREATE TABLE public.product (
    systemid integer NOT NULL,
    active boolean,
    last_sync timestamp without time zone,
    memo character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.product OWNER TO dbexerphi_dba;

--
-- TOC entry 212 (class 1259 OID 16427)
-- Name: product_id_product_seq; Type: SEQUENCE; Schema: public; Owner: dbexerphi_dba
--

CREATE SEQUENCE public.product_id_product_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_id_product_seq OWNER TO dbexerphi_dba;

--
-- TOC entry 213 (class 1259 OID 16429)
-- Name: product_systemid_seq; Type: SEQUENCE; Schema: public; Owner: dbexerphi_dba
--

CREATE SEQUENCE public.product_systemid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_systemid_seq OWNER TO dbexerphi_dba;

--
-- TOC entry 3021 (class 0 OID 0)
-- Dependencies: 213
-- Name: product_systemid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbexerphi_dba
--

ALTER SEQUENCE public.product_systemid_seq OWNED BY public.product.systemid;


--
-- TOC entry 214 (class 1259 OID 16431)
-- Name: productimage; Type: TABLE; Schema: public; Owner: dbexerphi_dba
--

CREATE TABLE public.productimage (
    product integer NOT NULL,
    imagedata bytea NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.productimage OWNER TO dbexerphi_dba;

--
-- TOC entry 215 (class 1259 OID 16437)
-- Name: productsellprice; Type: TABLE; Schema: public; Owner: dbexerphi_dba
--

CREATE TABLE public.productsellprice (
    id_pricelevel integer NOT NULL,
    id_product integer NOT NULL,
    price double precision NOT NULL,
    profitfactor real NOT NULL
);


ALTER TABLE public.productsellprice OWNER TO dbexerphi_dba;

--
-- TOC entry 216 (class 1259 OID 16440)
-- Name: sellpricelevel; Type: TABLE; Schema: public; Owner: dbexerphi_dba
--

CREATE TABLE public.sellpricelevel (
    id_pricelevel integer NOT NULL,
    memo character varying(255),
    name character varying(255) NOT NULL,
    passworded boolean,
    usebydefault boolean
);


ALTER TABLE public.sellpricelevel OWNER TO dbexerphi_dba;

--
-- TOC entry 217 (class 1259 OID 16446)
-- Name: sellpricelevel_id_pricelevel_seq; Type: SEQUENCE; Schema: public; Owner: dbexerphi_dba
--

CREATE SEQUENCE public.sellpricelevel_id_pricelevel_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sellpricelevel_id_pricelevel_seq OWNER TO dbexerphi_dba;

--
-- TOC entry 218 (class 1259 OID 16448)
-- Name: sellpricelevel_id_pricelevel_seq1; Type: SEQUENCE; Schema: public; Owner: dbexerphi_dba
--

CREATE SEQUENCE public.sellpricelevel_id_pricelevel_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sellpricelevel_id_pricelevel_seq1 OWNER TO dbexerphi_dba;

--
-- TOC entry 3022 (class 0 OID 0)
-- Dependencies: 218
-- Name: sellpricelevel_id_pricelevel_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbexerphi_dba
--

ALTER SEQUENCE public.sellpricelevel_id_pricelevel_seq1 OWNED BY public.sellpricelevel.id_pricelevel;


--
-- TOC entry 2856 (class 2604 OID 16450)
-- Name: itemcategory systemid; Type: DEFAULT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.itemcategory ALTER COLUMN systemid SET DEFAULT nextval('public.itemcategory_systemid_seq1'::regclass);


--
-- TOC entry 2857 (class 2604 OID 16451)
-- Name: merk systemid; Type: DEFAULT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.merk ALTER COLUMN systemid SET DEFAULT nextval('public.merk_systemid_seq1'::regclass);


--
-- TOC entry 2858 (class 2604 OID 16452)
-- Name: product systemid; Type: DEFAULT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.product ALTER COLUMN systemid SET DEFAULT nextval('public.product_systemid_seq'::regclass);


--
-- TOC entry 2859 (class 2604 OID 16453)
-- Name: sellpricelevel id_pricelevel; Type: DEFAULT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.sellpricelevel ALTER COLUMN id_pricelevel SET DEFAULT nextval('public.sellpricelevel_id_pricelevel_seq1'::regclass);


--
-- TOC entry 2861 (class 2606 OID 16458)
-- Name: item item_pkey; Type: CONSTRAINT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.item
    ADD CONSTRAINT item_pkey PRIMARY KEY (systemid);


--
-- TOC entry 2863 (class 2606 OID 16460)
-- Name: itemcategory itemcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.itemcategory
    ADD CONSTRAINT itemcategory_pkey PRIMARY KEY (systemid);


--
-- TOC entry 2865 (class 2606 OID 16462)
-- Name: merk merk_pkey; Type: CONSTRAINT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.merk
    ADD CONSTRAINT merk_pkey PRIMARY KEY (systemid);


--
-- TOC entry 2869 (class 2606 OID 16464)
-- Name: metrics metrics_pkey; Type: CONSTRAINT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.metrics
    ADD CONSTRAINT metrics_pkey PRIMARY KEY (name_s50);


--
-- TOC entry 2871 (class 2606 OID 16466)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (systemid);


--
-- TOC entry 2875 (class 2606 OID 16468)
-- Name: productimage productimage_pkey; Type: CONSTRAINT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.productimage
    ADD CONSTRAINT productimage_pkey PRIMARY KEY (product);


--
-- TOC entry 2877 (class 2606 OID 16470)
-- Name: productsellprice productsellprice_pkey; Type: CONSTRAINT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.productsellprice
    ADD CONSTRAINT productsellprice_pkey PRIMARY KEY (id_pricelevel, id_product);


--
-- TOC entry 2879 (class 2606 OID 16472)
-- Name: sellpricelevel sellpricelevel_pkey; Type: CONSTRAINT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.sellpricelevel
    ADD CONSTRAINT sellpricelevel_pkey PRIMARY KEY (id_pricelevel);


--
-- TOC entry 2867 (class 2606 OID 16474)
-- Name: merk uk_56gk8to1vyawv9y2neu61ulgy; Type: CONSTRAINT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.merk
    ADD CONSTRAINT uk_56gk8to1vyawv9y2neu61ulgy UNIQUE (name);


--
-- TOC entry 2873 (class 2606 OID 16476)
-- Name: product uk_jmivyxk9rmgysrmsqw15lqr5b; Type: CONSTRAINT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT uk_jmivyxk9rmgysrmsqw15lqr5b UNIQUE (name);


--
-- TOC entry 2882 (class 2606 OID 16477)
-- Name: itemcategorytag fk98endmuhwr7epr0vodte1tk4s; Type: FK CONSTRAINT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.itemcategorytag
    ADD CONSTRAINT fk98endmuhwr7epr0vodte1tk4s FOREIGN KEY (id_item) REFERENCES public.item(systemid);


--
-- TOC entry 2884 (class 2606 OID 16482)
-- Name: metrics fk9j369jtcqah90s5gpjsufk776; Type: FK CONSTRAINT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.metrics
    ADD CONSTRAINT fk9j369jtcqah90s5gpjsufk776 FOREIGN KEY (metric_rinci) REFERENCES public.metrics(name_s50);


--
-- TOC entry 2880 (class 2606 OID 16487)
-- Name: item fkpfx36mc78g5ut8027qpt70h4a; Type: FK CONSTRAINT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.item
    ADD CONSTRAINT fkpfx36mc78g5ut8027qpt70h4a FOREIGN KEY (name_s50_inv) REFERENCES public.metrics(name_s50);


--
-- TOC entry 2881 (class 2606 OID 16492)
-- Name: item item_id_merk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.item
    ADD CONSTRAINT item_id_merk_fkey FOREIGN KEY (id_merk) REFERENCES public.merk(systemid);


--
-- TOC entry 2883 (class 2606 OID 16497)
-- Name: itemcategorytag itemcategorytag_id_ctgr_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.itemcategorytag
    ADD CONSTRAINT itemcategorytag_id_ctgr_fkey FOREIGN KEY (id_ctgr) REFERENCES public.itemcategory(systemid);


--
-- TOC entry 2885 (class 2606 OID 16502)
-- Name: productimage productimage_product_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.productimage
    ADD CONSTRAINT productimage_product_fkey FOREIGN KEY (product) REFERENCES public.product(systemid);


--
-- TOC entry 2886 (class 2606 OID 16507)
-- Name: productsellprice productsellprice_id_product_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.productsellprice
    ADD CONSTRAINT productsellprice_id_product_fkey FOREIGN KEY (id_product) REFERENCES public.product(systemid);


-- Completed on 2020-07-26 17:01:37 WIB

--
-- PostgreSQL database dump complete
--

