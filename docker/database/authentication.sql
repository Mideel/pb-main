--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2 (Ubuntu 12.2-1.pgdg18.04+1)
-- Dumped by pg_dump version 12.2 (Ubuntu 12.2-1.pgdg18.04+1)

-- Started on 2020-07-26 16:54:04 WIB

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

DROP DATABASE IF EXISTS authentication;
--
-- TOC entry 3047 (class 1262 OID 16546)
-- Name: authentication; Type: DATABASE; Schema: -; Owner: dbexerphi_dba
--

CREATE DATABASE authentication WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


ALTER DATABASE authentication OWNER TO dbexerphi_dba;

\connect authentication

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
-- TOC entry 202 (class 1259 OID 16547)
-- Name: clientdetails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientdetails (
    appid character varying(255) NOT NULL,
    resourceids character varying(255),
    appsecret character varying(255),
    scope character varying(255),
    granttypes character varying(255),
    redirecturl character varying(255),
    authorities character varying(255),
    access_token_validity integer,
    refresh_token_validity integer,
    additionalinformation character varying(4096),
    autoapprovescopes character varying(255)
);


ALTER TABLE public.clientdetails OWNER TO dbexerphi_dba;

--
-- TOC entry 203 (class 1259 OID 16553)
-- Name: contact; Type: TABLE; Schema: public; Owner: dbexerphi_dba
--

CREATE TABLE public.contact (
    systemid bigint NOT NULL,
    birthdate date,
    citizenid character varying(255),
    citizenid_type integer,
    email character varying(255),
    firstname character varying(255) NOT NULL,
    lastname character varying(255),
    phone character varying(255),
    type character varying(255),
    usercred_id integer
);


ALTER TABLE public.contact OWNER TO dbexerphi_dba;

--
-- TOC entry 204 (class 1259 OID 16559)
-- Name: contact_systemid_seq; Type: SEQUENCE; Schema: public; Owner: dbexerphi_dba
--

CREATE SEQUENCE public.contact_systemid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contact_systemid_seq OWNER TO dbexerphi_dba;

--
-- TOC entry 205 (class 1259 OID 16561)
-- Name: contact_systemid_seq1; Type: SEQUENCE; Schema: public; Owner: dbexerphi_dba
--

CREATE SEQUENCE public.contact_systemid_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contact_systemid_seq1 OWNER TO dbexerphi_dba;

--
-- TOC entry 3048 (class 0 OID 0)
-- Dependencies: 205
-- Name: contact_systemid_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbexerphi_dba
--

ALTER SEQUENCE public.contact_systemid_seq1 OWNED BY public.contact.systemid;


--
-- TOC entry 206 (class 1259 OID 16563)
-- Name: contactaddress; Type: TABLE; Schema: public; Owner: dbexerphi_dba
--

CREATE TABLE public.contactaddress (
    systemid bigint NOT NULL,
    street character varying(255) NOT NULL,
    owner bigint,
    regency_id bigint
);


ALTER TABLE public.contactaddress OWNER TO dbexerphi_dba;

--
-- TOC entry 207 (class 1259 OID 16566)
-- Name: contactaddress_systemid_seq; Type: SEQUENCE; Schema: public; Owner: dbexerphi_dba
--

CREATE SEQUENCE public.contactaddress_systemid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contactaddress_systemid_seq OWNER TO dbexerphi_dba;

--
-- TOC entry 208 (class 1259 OID 16568)
-- Name: country; Type: TABLE; Schema: public; Owner: dbexerphi_dba
--

CREATE TABLE public.country (
    iso_code_s2 character varying(255) NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.country OWNER TO dbexerphi_dba;

--
-- TOC entry 209 (class 1259 OID 16574)
-- Name: oauth_access_token; Type: TABLE; Schema: public; Owner: dbexerphi_dba
--

CREATE TABLE public.oauth_access_token (
    token_id character varying(255),
    token bytea,
    authentication_id character varying(255) NOT NULL,
    user_name character varying(255),
    client_id character varying(255),
    authentication bytea,
    refresh_token character varying(255)
);


ALTER TABLE public.oauth_access_token OWNER TO dbexerphi_dba;

--
-- TOC entry 210 (class 1259 OID 16580)
-- Name: oauth_approvals; Type: TABLE; Schema: public; Owner: dbexerphi_dba
--

CREATE TABLE public.oauth_approvals (
    userid character varying(255),
    clientid character varying(255),
    scope character varying(255),
    status character varying(10),
    expiresat timestamp without time zone,
    lastmodifiedat timestamp without time zone
);


ALTER TABLE public.oauth_approvals OWNER TO dbexerphi_dba;

--
-- TOC entry 211 (class 1259 OID 16586)
-- Name: oauth_client_details; Type: TABLE; Schema: public; Owner: dbexerphi_dba
--

CREATE TABLE public.oauth_client_details (
    client_id character varying(255) NOT NULL,
    resource_ids character varying(255),
    client_secret character varying(255),
    scope character varying(255),
    authorized_grant_types character varying(255),
    web_server_redirect_uri character varying(255),
    authorities character varying(255),
    access_token_validity integer,
    refresh_token_validity integer,
    additional_information character varying(4096),
    autoapprove character varying(255)
);


ALTER TABLE public.oauth_client_details OWNER TO dbexerphi_dba;

--
-- TOC entry 212 (class 1259 OID 16592)
-- Name: oauth_client_token; Type: TABLE; Schema: public; Owner: dbexerphi_dba
--

CREATE TABLE public.oauth_client_token (
    token_id character varying(255),
    token bytea,
    authentication_id character varying(255) NOT NULL,
    user_name character varying(255),
    client_id character varying(255)
);


ALTER TABLE public.oauth_client_token OWNER TO dbexerphi_dba;

--
-- TOC entry 213 (class 1259 OID 16598)
-- Name: oauth_code; Type: TABLE; Schema: public; Owner: dbexerphi_dba
--

CREATE TABLE public.oauth_code (
    code character varying(255),
    authentication bytea
);


ALTER TABLE public.oauth_code OWNER TO dbexerphi_dba;

--
-- TOC entry 214 (class 1259 OID 16604)
-- Name: oauth_refresh_token; Type: TABLE; Schema: public; Owner: dbexerphi_dba
--

CREATE TABLE public.oauth_refresh_token (
    token_id character varying(255),
    token bytea,
    authentication bytea
);


ALTER TABLE public.oauth_refresh_token OWNER TO dbexerphi_dba;

--
-- TOC entry 215 (class 1259 OID 16610)
-- Name: province; Type: TABLE; Schema: public; Owner: dbexerphi_dba
--

CREATE TABLE public.province (
    systemid bigint NOT NULL,
    name character varying(255) NOT NULL,
    country_code character varying(255) NOT NULL
);


ALTER TABLE public.province OWNER TO dbexerphi_dba;

--
-- TOC entry 216 (class 1259 OID 16616)
-- Name: province_systemid_seq; Type: SEQUENCE; Schema: public; Owner: dbexerphi_dba
--

CREATE SEQUENCE public.province_systemid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.province_systemid_seq OWNER TO dbexerphi_dba;

--
-- TOC entry 217 (class 1259 OID 16618)
-- Name: regency; Type: TABLE; Schema: public; Owner: dbexerphi_dba
--

CREATE TABLE public.regency (
    systemid bigint NOT NULL,
    name character varying(255) NOT NULL,
    prov_id bigint NOT NULL
);


ALTER TABLE public.regency OWNER TO dbexerphi_dba;

--
-- TOC entry 218 (class 1259 OID 16621)
-- Name: regency_systemid_seq; Type: SEQUENCE; Schema: public; Owner: dbexerphi_dba
--

CREATE SEQUENCE public.regency_systemid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.regency_systemid_seq OWNER TO dbexerphi_dba;

--
-- TOC entry 219 (class 1259 OID 16623)
-- Name: user_orgs; Type: TABLE; Schema: public; Owner: dbexerphi_dba
--

CREATE TABLE public.user_orgs (
    organization_id character varying(100) NOT NULL,
    user_name character varying(100) NOT NULL
);


ALTER TABLE public.user_orgs OWNER TO dbexerphi_dba;

--
-- TOC entry 220 (class 1259 OID 16626)
-- Name: user_roles; Type: TABLE; Schema: public; Owner: dbexerphi_dba
--

CREATE TABLE public.user_roles (
    user_role_id integer NOT NULL,
    user_name character varying(100) NOT NULL,
    role character varying(100) NOT NULL
);


ALTER TABLE public.user_roles OWNER TO dbexerphi_dba;

--
-- TOC entry 221 (class 1259 OID 16629)
-- Name: user_roles_user_role_id_seq; Type: SEQUENCE; Schema: public; Owner: dbexerphi_dba
--

CREATE SEQUENCE public.user_roles_user_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_roles_user_role_id_seq OWNER TO dbexerphi_dba;

--
-- TOC entry 3049 (class 0 OID 0)
-- Dependencies: 221
-- Name: user_roles_user_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbexerphi_dba
--

ALTER SEQUENCE public.user_roles_user_role_id_seq OWNED BY public.user_roles.user_role_id;


--
-- TOC entry 222 (class 1259 OID 16631)
-- Name: usercredential; Type: TABLE; Schema: public; Owner: dbexerphi_dba
--

CREATE TABLE public.usercredential (
    systemid integer NOT NULL,
    expiredate timestamp without time zone,
    isenable boolean,
    notes character varying(255),
    pwd character varying(255) NOT NULL,
    registration_token character varying(255),
    socialmedia_type character varying(255),
    sys_create_ip character varying(255),
    sys_last_login timestamp without time zone,
    username character varying(255) NOT NULL
);


ALTER TABLE public.usercredential OWNER TO dbexerphi_dba;

--
-- TOC entry 223 (class 1259 OID 16637)
-- Name: usercredential_systemid_seq; Type: SEQUENCE; Schema: public; Owner: dbexerphi_dba
--

CREATE SEQUENCE public.usercredential_systemid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usercredential_systemid_seq OWNER TO dbexerphi_dba;

--
-- TOC entry 224 (class 1259 OID 16639)
-- Name: usercredential_systemid_seq1; Type: SEQUENCE; Schema: public; Owner: dbexerphi_dba
--

CREATE SEQUENCE public.usercredential_systemid_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usercredential_systemid_seq1 OWNER TO dbexerphi_dba;

--
-- TOC entry 3050 (class 0 OID 0)
-- Dependencies: 224
-- Name: usercredential_systemid_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbexerphi_dba
--

ALTER SEQUENCE public.usercredential_systemid_seq1 OWNED BY public.usercredential.systemid;


--
-- TOC entry 2884 (class 2604 OID 16641)
-- Name: contact systemid; Type: DEFAULT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.contact ALTER COLUMN systemid SET DEFAULT nextval('public.contact_systemid_seq1'::regclass);


--
-- TOC entry 2885 (class 2604 OID 16642)
-- Name: user_roles user_role_id; Type: DEFAULT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.user_roles ALTER COLUMN user_role_id SET DEFAULT nextval('public.user_roles_user_role_id_seq'::regclass);


--
-- TOC entry 2886 (class 2604 OID 16643)
-- Name: usercredential systemid; Type: DEFAULT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.usercredential ALTER COLUMN systemid SET DEFAULT nextval('public.usercredential_systemid_seq1'::regclass);


--
-- TOC entry 2888 (class 2606 OID 16647)
-- Name: clientdetails clientdetails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientdetails
    ADD CONSTRAINT clientdetails_pkey PRIMARY KEY (appid);


--
-- TOC entry 2890 (class 2606 OID 16649)
-- Name: contact contact_pkey; Type: CONSTRAINT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.contact
    ADD CONSTRAINT contact_pkey PRIMARY KEY (systemid);


--
-- TOC entry 2892 (class 2606 OID 16651)
-- Name: contactaddress contactaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.contactaddress
    ADD CONSTRAINT contactaddress_pkey PRIMARY KEY (systemid);


--
-- TOC entry 2894 (class 2606 OID 16653)
-- Name: country country_pkey; Type: CONSTRAINT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (iso_code_s2);


--
-- TOC entry 2896 (class 2606 OID 16655)
-- Name: oauth_access_token oauth_access_token_pkey; Type: CONSTRAINT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.oauth_access_token
    ADD CONSTRAINT oauth_access_token_pkey PRIMARY KEY (authentication_id);


--
-- TOC entry 2898 (class 2606 OID 16657)
-- Name: oauth_client_details oauth_client_details_pkey; Type: CONSTRAINT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.oauth_client_details
    ADD CONSTRAINT oauth_client_details_pkey PRIMARY KEY (client_id);


--
-- TOC entry 2900 (class 2606 OID 16659)
-- Name: oauth_client_token oauth_client_token_pkey; Type: CONSTRAINT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.oauth_client_token
    ADD CONSTRAINT oauth_client_token_pkey PRIMARY KEY (authentication_id);


--
-- TOC entry 2902 (class 2606 OID 16661)
-- Name: province province_pkey; Type: CONSTRAINT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.province
    ADD CONSTRAINT province_pkey PRIMARY KEY (systemid);


--
-- TOC entry 2904 (class 2606 OID 16663)
-- Name: regency regency_pkey; Type: CONSTRAINT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.regency
    ADD CONSTRAINT regency_pkey PRIMARY KEY (systemid);


--
-- TOC entry 2906 (class 2606 OID 16665)
-- Name: user_orgs user_orgs_pkey; Type: CONSTRAINT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.user_orgs
    ADD CONSTRAINT user_orgs_pkey PRIMARY KEY (user_name);


--
-- TOC entry 2908 (class 2606 OID 16667)
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (user_role_id);


--
-- TOC entry 2910 (class 2606 OID 16669)
-- Name: usercredential usercredential_pkey; Type: CONSTRAINT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.usercredential
    ADD CONSTRAINT usercredential_pkey PRIMARY KEY (systemid);


--
-- TOC entry 2911 (class 2606 OID 16670)
-- Name: contact contact_usercred_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.contact
    ADD CONSTRAINT contact_usercred_id_fkey FOREIGN KEY (usercred_id) REFERENCES public.usercredential(systemid);


--
-- TOC entry 2912 (class 2606 OID 16675)
-- Name: contactaddress contactaddress_owner_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.contactaddress
    ADD CONSTRAINT contactaddress_owner_fkey FOREIGN KEY (owner) REFERENCES public.contact(systemid);


--
-- TOC entry 2913 (class 2606 OID 16680)
-- Name: contactaddress fk83s492qr60c3vpqtxmrhcsgjf; Type: FK CONSTRAINT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.contactaddress
    ADD CONSTRAINT fk83s492qr60c3vpqtxmrhcsgjf FOREIGN KEY (regency_id) REFERENCES public.regency(systemid);


--
-- TOC entry 2915 (class 2606 OID 16685)
-- Name: regency fkirdjmjakyfy8xf386b803jgrd; Type: FK CONSTRAINT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.regency
    ADD CONSTRAINT fkirdjmjakyfy8xf386b803jgrd FOREIGN KEY (prov_id) REFERENCES public.province(systemid);


--
-- TOC entry 2914 (class 2606 OID 16690)
-- Name: province fkp001a3cq64p85ugirjwlqtaus; Type: FK CONSTRAINT; Schema: public; Owner: dbexerphi_dba
--

ALTER TABLE ONLY public.province
    ADD CONSTRAINT fkp001a3cq64p85ugirjwlqtaus FOREIGN KEY (country_code) REFERENCES public.country(iso_code_s2);


-- Completed on 2020-07-26 16:54:04 WIB

--
-- PostgreSQL database dump complete
--

