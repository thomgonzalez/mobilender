--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE mb_db;
DROP DATABASE mobi_db;




--
-- Drop roles
--

DROP ROLE mb_user;


--
-- Roles
--

CREATE ROLE mb_user;
ALTER ROLE mb_user WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:DUcOAR71y+Dck4luiMNbKQ==$lu5+7sZq8d4yrZ5b4B23LVGzyAvkrS3e1/JJI8Dthwc=:++cqz4OXzf0bh1YKwVHnFdvkRy9ALY1QTA7sjo3kxUA=';






--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1 (Debian 14.1-1.pgdg110+1)
-- Dumped by pg_dump version 14.1 (Debian 14.1-1.pgdg110+1)

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: mb_user
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO mb_user;

\connect template1

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

--
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: mb_user
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: mb_user
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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

--
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: mb_user
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "mb_db" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1 (Debian 14.1-1.pgdg110+1)
-- Dumped by pg_dump version 14.1 (Debian 14.1-1.pgdg110+1)

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

--
-- Name: mb_db; Type: DATABASE; Schema: -; Owner: mb_user
--

CREATE DATABASE mb_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE mb_db OWNER TO mb_user;

\connect mb_db

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: mb_user
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO mb_user;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: mb_user
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO mb_user;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mb_user
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: mb_user
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO mb_user;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: mb_user
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO mb_user;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mb_user
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: mb_user
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO mb_user;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: mb_user
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO mb_user;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mb_user
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: mb_user
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO mb_user;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: mb_user
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO mb_user;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: mb_user
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO mb_user;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mb_user
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: mb_user
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO mb_user;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mb_user
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: mb_user
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO mb_user;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: mb_user
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO mb_user;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mb_user
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: company_customer; Type: TABLE; Schema: public; Owner: mb_user
--

CREATE TABLE public.company_customer (
    id bigint NOT NULL,
    status boolean NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    code character varying(20) NOT NULL,
    client_type character varying(2) NOT NULL,
    name character varying(100),
    rfc character varying(13) NOT NULL,
    logo character varying(100),
    address character varying(300)
);


ALTER TABLE public.company_customer OWNER TO mb_user;

--
-- Name: company_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: mb_user
--

CREATE SEQUENCE public.company_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.company_customer_id_seq OWNER TO mb_user;

--
-- Name: company_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mb_user
--

ALTER SEQUENCE public.company_customer_id_seq OWNED BY public.company_customer.id;


--
-- Name: company_supplier; Type: TABLE; Schema: public; Owner: mb_user
--

CREATE TABLE public.company_supplier (
    id bigint NOT NULL,
    status boolean NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    name character varying(100),
    address character varying(300)
);


ALTER TABLE public.company_supplier OWNER TO mb_user;

--
-- Name: company_supplier_id_seq; Type: SEQUENCE; Schema: public; Owner: mb_user
--

CREATE SEQUENCE public.company_supplier_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.company_supplier_id_seq OWNER TO mb_user;

--
-- Name: company_supplier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mb_user
--

ALTER SEQUENCE public.company_supplier_id_seq OWNED BY public.company_supplier.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: mb_user
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO mb_user;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: mb_user
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO mb_user;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mb_user
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: mb_user
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO mb_user;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: mb_user
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO mb_user;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mb_user
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: mb_user
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO mb_user;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: mb_user
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO mb_user;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mb_user
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: mb_user
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO mb_user;

--
-- Name: shop_article; Type: TABLE; Schema: public; Owner: mb_user
--

CREATE TABLE public.shop_article (
    id bigint NOT NULL,
    status boolean NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    code integer NOT NULL,
    title character varying(100) NOT NULL,
    description text,
    price double precision NOT NULL,
    supplier_id bigint NOT NULL
);


ALTER TABLE public.shop_article OWNER TO mb_user;

--
-- Name: shop_article_id_seq; Type: SEQUENCE; Schema: public; Owner: mb_user
--

CREATE SEQUENCE public.shop_article_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_article_id_seq OWNER TO mb_user;

--
-- Name: shop_article_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mb_user
--

ALTER SEQUENCE public.shop_article_id_seq OWNED BY public.shop_article.id;


--
-- Name: shop_branch; Type: TABLE; Schema: public; Owner: mb_user
--

CREATE TABLE public.shop_branch (
    id bigint NOT NULL,
    code integer NOT NULL,
    reference character varying(50) NOT NULL
);


ALTER TABLE public.shop_branch OWNER TO mb_user;

--
-- Name: shop_branch_id_seq; Type: SEQUENCE; Schema: public; Owner: mb_user
--

CREATE SEQUENCE public.shop_branch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_branch_id_seq OWNER TO mb_user;

--
-- Name: shop_branch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mb_user
--

ALTER SEQUENCE public.shop_branch_id_seq OWNED BY public.shop_branch.id;


--
-- Name: shop_company; Type: TABLE; Schema: public; Owner: mb_user
--

CREATE TABLE public.shop_company (
    id bigint NOT NULL,
    code integer NOT NULL,
    reference character varying(50) NOT NULL
);


ALTER TABLE public.shop_company OWNER TO mb_user;

--
-- Name: shop_company_id_seq; Type: SEQUENCE; Schema: public; Owner: mb_user
--

CREATE SEQUENCE public.shop_company_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_company_id_seq OWNER TO mb_user;

--
-- Name: shop_company_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mb_user
--

ALTER SEQUENCE public.shop_company_id_seq OWNED BY public.shop_company.id;


--
-- Name: shop_delivery; Type: TABLE; Schema: public; Owner: mb_user
--

CREATE TABLE public.shop_delivery (
    id bigint NOT NULL,
    assorted_date timestamp with time zone,
    order_detail_id bigint NOT NULL,
    status boolean NOT NULL
);


ALTER TABLE public.shop_delivery OWNER TO mb_user;

--
-- Name: shop_delivery_id_seq; Type: SEQUENCE; Schema: public; Owner: mb_user
--

CREATE SEQUENCE public.shop_delivery_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_delivery_id_seq OWNER TO mb_user;

--
-- Name: shop_delivery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mb_user
--

ALTER SEQUENCE public.shop_delivery_id_seq OWNED BY public.shop_delivery.id;


--
-- Name: shop_distribution; Type: TABLE; Schema: public; Owner: mb_user
--

CREATE TABLE public.shop_distribution (
    id bigint NOT NULL,
    stock character varying(100) NOT NULL
);


ALTER TABLE public.shop_distribution OWNER TO mb_user;

--
-- Name: shop_distribution_id_seq; Type: SEQUENCE; Schema: public; Owner: mb_user
--

CREATE SEQUENCE public.shop_distribution_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_distribution_id_seq OWNER TO mb_user;

--
-- Name: shop_distribution_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mb_user
--

ALTER SEQUENCE public.shop_distribution_id_seq OWNED BY public.shop_distribution.id;


--
-- Name: shop_order; Type: TABLE; Schema: public; Owner: mb_user
--

CREATE TABLE public.shop_order (
    id bigint NOT NULL,
    order_number integer NOT NULL,
    is_urgent boolean NOT NULL,
    generated_date timestamp with time zone NOT NULL,
    amount integer NOT NULL,
    branch_id bigint,
    company_id bigint,
    customer_id bigint NOT NULL,
    distribution_id bigint
);


ALTER TABLE public.shop_order OWNER TO mb_user;

--
-- Name: shop_order_id_seq; Type: SEQUENCE; Schema: public; Owner: mb_user
--

CREATE SEQUENCE public.shop_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_order_id_seq OWNER TO mb_user;

--
-- Name: shop_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mb_user
--

ALTER SEQUENCE public.shop_order_id_seq OWNED BY public.shop_order.id;


--
-- Name: shop_orderdetail; Type: TABLE; Schema: public; Owner: mb_user
--

CREATE TABLE public.shop_orderdetail (
    id bigint NOT NULL,
    article_id bigint NOT NULL,
    order_id bigint NOT NULL
);


ALTER TABLE public.shop_orderdetail OWNER TO mb_user;

--
-- Name: shop_orderdetail_id_seq; Type: SEQUENCE; Schema: public; Owner: mb_user
--

CREATE SEQUENCE public.shop_orderdetail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_orderdetail_id_seq OWNER TO mb_user;

--
-- Name: shop_orderdetail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mb_user
--

ALTER SEQUENCE public.shop_orderdetail_id_seq OWNED BY public.shop_orderdetail.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: company_customer id; Type: DEFAULT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.company_customer ALTER COLUMN id SET DEFAULT nextval('public.company_customer_id_seq'::regclass);


--
-- Name: company_supplier id; Type: DEFAULT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.company_supplier ALTER COLUMN id SET DEFAULT nextval('public.company_supplier_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: shop_article id; Type: DEFAULT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.shop_article ALTER COLUMN id SET DEFAULT nextval('public.shop_article_id_seq'::regclass);


--
-- Name: shop_branch id; Type: DEFAULT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.shop_branch ALTER COLUMN id SET DEFAULT nextval('public.shop_branch_id_seq'::regclass);


--
-- Name: shop_company id; Type: DEFAULT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.shop_company ALTER COLUMN id SET DEFAULT nextval('public.shop_company_id_seq'::regclass);


--
-- Name: shop_delivery id; Type: DEFAULT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.shop_delivery ALTER COLUMN id SET DEFAULT nextval('public.shop_delivery_id_seq'::regclass);


--
-- Name: shop_distribution id; Type: DEFAULT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.shop_distribution ALTER COLUMN id SET DEFAULT nextval('public.shop_distribution_id_seq'::regclass);


--
-- Name: shop_order id; Type: DEFAULT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.shop_order ALTER COLUMN id SET DEFAULT nextval('public.shop_order_id_seq'::regclass);


--
-- Name: shop_orderdetail id; Type: DEFAULT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.shop_orderdetail ALTER COLUMN id SET DEFAULT nextval('public.shop_orderdetail_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: mb_user
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: mb_user
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: mb_user
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add supplier	7	add_supplier
26	Can change supplier	7	change_supplier
27	Can delete supplier	7	delete_supplier
28	Can view supplier	7	view_supplier
29	Can add customer	8	add_customer
30	Can change customer	8	change_customer
31	Can delete customer	8	delete_customer
32	Can view customer	8	view_customer
33	Can add article	9	add_article
34	Can change article	9	change_article
35	Can delete article	9	delete_article
36	Can view article	9	view_article
37	Can add branch	10	add_branch
38	Can change branch	10	change_branch
39	Can delete branch	10	delete_branch
40	Can view branch	10	view_branch
41	Can add company	11	add_company
42	Can change company	11	change_company
43	Can delete company	11	delete_company
44	Can view company	11	view_company
45	Can add distribution	12	add_distribution
46	Can change distribution	12	change_distribution
47	Can delete distribution	12	delete_distribution
48	Can view distribution	12	view_distribution
49	Can add order	13	add_order
50	Can change order	13	change_order
51	Can delete order	13	delete_order
52	Can view order	13	view_order
53	Can add order detail	14	add_orderdetail
54	Can change order detail	14	change_orderdetail
55	Can delete order detail	14	delete_orderdetail
56	Can view order detail	14	view_orderdetail
57	Can add delivery	15	add_delivery
58	Can change delivery	15	change_delivery
59	Can delete delivery	15	delete_delivery
60	Can view delivery	15	view_delivery
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: mb_user
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$260000$p36PjVtBwnQMRCYovTkZym$e9EtvR1VLkT+c/WHr/kO/XppgovHU8kdZOUuhEbNsQ0=	2022-01-07 04:58:21.256446+00	t	tsantiago			tsantiago@gmail.com	t	t	2022-01-06 08:46:57.981598+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: mb_user
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: mb_user
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: company_customer; Type: TABLE DATA; Schema: public; Owner: mb_user
--

COPY public.company_customer (id, status, created, modified, code, client_type, name, rfc, logo, address) FROM stdin;
1	t	2022-01-06 23:53:29.16964+00	2022-01-06 23:53:29.169664+00	01	02	PATITA	123		Estado de Mexico
2	t	2022-01-07 06:57:03.326667+00	2022-01-07 06:57:03.326788+00	OI	04	Tomas Santiago	6789		El Potrero
\.


--
-- Data for Name: company_supplier; Type: TABLE DATA; Schema: public; Owner: mb_user
--

COPY public.company_supplier (id, status, created, modified, name, address) FROM stdin;
1	t	2022-01-06 23:53:56.239379+00	2022-01-06 23:53:56.239404+00	PROVEEDOR 1	Estado de Mexico
2	t	2022-01-06 23:54:14.99242+00	2022-01-06 23:54:14.992444+00	PROVEEDOR 2	Ciudad de Mexico
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: mb_user
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-01-06 23:53:29.764712+00	1	01 PATITA	1	[{"added": {}}]	8	1
2	2022-01-06 23:53:56.267123+00	1	PROVEEDOR 1	1	[{"added": {}}]	7	1
3	2022-01-06 23:54:14.996769+00	2	PROVEEDOR 2	1	[{"added": {}}]	7	1
4	2022-01-06 23:59:36.431258+00	1	Branch object (1)	1	[{"added": {}}]	10	1
5	2022-01-06 23:59:58.522563+00	1	Company object (1)	1	[{"added": {}}]	11	1
6	2022-01-07 00:00:21.8638+00	1	Distribution object (1)	1	[{"added": {}}]	12	1
7	2022-01-07 00:01:13.084161+00	1	100.0 PRODUCTO 1	1	[{"added": {}}]	9	1
8	2022-01-07 00:01:43.538412+00	2	500.0 PRODUCTO 2	1	[{"added": {}}]	9	1
9	2022-01-07 00:06:59.455437+00	1	Order object (1)	1	[{"added": {}}]	13	1
10	2022-01-07 04:59:30.893178+00	1	OrderDetail object (1)	1	[{"added": {}}]	14	1
11	2022-01-07 06:57:03.365837+00	2	OI Tomas Santiago	1	[{"added": {}}]	8	1
12	2022-01-07 06:57:52.758962+00	2	456	1	[{"added": {}}]	13	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: mb_user
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	company	supplier
8	company	customer
9	shop	article
10	shop	branch
11	shop	company
12	shop	distribution
13	shop	order
14	shop	orderdetail
15	shop	delivery
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: mb_user
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-01-06 05:43:16.395191+00
2	auth	0001_initial	2022-01-06 05:43:17.991748+00
3	admin	0001_initial	2022-01-06 05:43:18.216656+00
4	admin	0002_logentry_remove_auto_add	2022-01-06 05:43:18.236953+00
5	admin	0003_logentry_add_action_flag_choices	2022-01-06 05:43:18.250955+00
6	contenttypes	0002_remove_content_type_name	2022-01-06 05:43:18.28744+00
7	auth	0002_alter_permission_name_max_length	2022-01-06 05:43:18.303241+00
8	auth	0003_alter_user_email_max_length	2022-01-06 05:43:18.326058+00
9	auth	0004_alter_user_username_opts	2022-01-06 05:43:18.354787+00
10	auth	0005_alter_user_last_login_null	2022-01-06 05:43:18.368393+00
11	auth	0006_require_contenttypes_0002	2022-01-06 05:43:18.375479+00
12	auth	0007_alter_validators_add_error_messages	2022-01-06 05:43:18.396119+00
13	auth	0008_alter_user_username_max_length	2022-01-06 05:43:18.457126+00
14	auth	0009_alter_user_last_name_max_length	2022-01-06 05:43:18.484101+00
15	auth	0010_alter_group_name_max_length	2022-01-06 05:43:18.504119+00
16	auth	0011_update_proxy_permissions	2022-01-06 05:43:18.540934+00
17	auth	0012_alter_user_first_name_max_length	2022-01-06 05:43:18.562883+00
18	company	0001_initial	2022-01-06 05:43:18.850087+00
19	sessions	0001_initial	2022-01-06 05:43:19.133558+00
20	shop	0001_initial	2022-01-06 05:43:20.210661+00
21	company	0002_alter_customer_logo	2022-01-07 06:43:48.299502+00
22	shop	0002_auto_20220107_0643	2022-01-07 06:43:49.020452+00
23	shop	0002_auto_20220107_0742	2022-01-07 07:51:19.886452+00
24	shop	0002_auto_20220107_0800	2022-01-07 08:00:25.579691+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: mb_user
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
z83vo4a0mlsjfvwlojj861sqreve66dy	.eJxVjMEOwiAQRP-FsyEt7gLr0Xu_oQF2K1UDSWlPxn_XJj3oYS7z3sxLjWFb87g1WcaZ1UX16vTbxZAeUnbA91BuVada1mWOelf0QZseKsvzerh_Bzm0_F3HaCI56IE7Tjaenbfo0YAw7vEUhCYHnskgEQIGCwjkOo9JxEzq_QHTdTdE:1n5OQR:z8KWnJU_yruM2xZEwurpnMBnVf4mXDRP7GXYiZU1ZQQ	2022-01-20 08:47:11.819144+00
edpw0gkghctookwk123naxavyxl9ogc6	.eJxVjMEOwiAQRP-FsyEt7gLr0Xu_oQF2K1UDSWlPxn_XJj3oYS7z3sxLjWFb87g1WcaZ1UX16vTbxZAeUnbA91BuVada1mWOelf0QZseKsvzerh_Bzm0_F3HaCI56IE7Tjaenbfo0YAw7vEUhCYHnskgEQIGCwjkOo9JxEzq_QHTdTdE:1n5cKK:B-ZEyY3y_fnghonf1Jp-veyN5A7J423r34c559y7go0	2022-01-20 23:37:48.197537+00
5tnqzo3x0i2a7l9ddug35pnfdjpkh5um	.eJxVjMEOwiAQRP-FsyEt7gLr0Xu_oQF2K1UDSWlPxn_XJj3oYS7z3sxLjWFb87g1WcaZ1UX16vTbxZAeUnbA91BuVada1mWOelf0QZseKsvzerh_Bzm0_F3HaCI56IE7Tjaenbfo0YAw7vEUhCYHnskgEQIGCwjkOo9JxEzq_QHTdTdE:1n5hKX:FFKbq7RQ2VO4th7Fe3m6x9I-HBWjt2Cn0lO5l9xtVHI	2022-01-21 04:58:21.291885+00
\.


--
-- Data for Name: shop_article; Type: TABLE DATA; Schema: public; Owner: mb_user
--

COPY public.shop_article (id, status, created, modified, code, title, description, price, supplier_id) FROM stdin;
1	t	2022-01-07 00:01:13.044776+00	2022-01-07 00:01:13.044801+00	1	PRODUCTO 1	Este producto es una demostración	100	1
2	t	2022-01-07 00:01:43.537094+00	2022-01-07 00:01:43.537136+00	2	PRODUCTO 2	Este es un producto demo.	500	2
\.


--
-- Data for Name: shop_branch; Type: TABLE DATA; Schema: public; Owner: mb_user
--

COPY public.shop_branch (id, code, reference) FROM stdin;
1	1	Sucursal One
\.


--
-- Data for Name: shop_company; Type: TABLE DATA; Schema: public; Owner: mb_user
--

COPY public.shop_company (id, code, reference) FROM stdin;
1	1	Compañia One
\.


--
-- Data for Name: shop_delivery; Type: TABLE DATA; Schema: public; Owner: mb_user
--

COPY public.shop_delivery (id, assorted_date, order_detail_id, status) FROM stdin;
\.


--
-- Data for Name: shop_distribution; Type: TABLE DATA; Schema: public; Owner: mb_user
--

COPY public.shop_distribution (id, stock) FROM stdin;
1	Mexico
\.


--
-- Data for Name: shop_order; Type: TABLE DATA; Schema: public; Owner: mb_user
--

COPY public.shop_order (id, order_number, is_urgent, generated_date, amount, branch_id, company_id, customer_id, distribution_id) FROM stdin;
1	123	f	2022-01-07 00:06:59.414479+00	10	1	\N	1	\N
2	456	t	2022-01-07 06:57:52.735506+00	100	\N	\N	2	1
\.


--
-- Data for Name: shop_orderdetail; Type: TABLE DATA; Schema: public; Owner: mb_user
--

COPY public.shop_orderdetail (id, article_id, order_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mb_user
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mb_user
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mb_user
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 60, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mb_user
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mb_user
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mb_user
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: company_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mb_user
--

SELECT pg_catalog.setval('public.company_customer_id_seq', 2, true);


--
-- Name: company_supplier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mb_user
--

SELECT pg_catalog.setval('public.company_supplier_id_seq', 2, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mb_user
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 12, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mb_user
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 15, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mb_user
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 56, true);


--
-- Name: shop_article_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mb_user
--

SELECT pg_catalog.setval('public.shop_article_id_seq', 2, true);


--
-- Name: shop_branch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mb_user
--

SELECT pg_catalog.setval('public.shop_branch_id_seq', 1, true);


--
-- Name: shop_company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mb_user
--

SELECT pg_catalog.setval('public.shop_company_id_seq', 1, true);


--
-- Name: shop_delivery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mb_user
--

SELECT pg_catalog.setval('public.shop_delivery_id_seq', 1, false);


--
-- Name: shop_distribution_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mb_user
--

SELECT pg_catalog.setval('public.shop_distribution_id_seq', 1, true);


--
-- Name: shop_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mb_user
--

SELECT pg_catalog.setval('public.shop_order_id_seq', 2, true);


--
-- Name: shop_orderdetail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mb_user
--

SELECT pg_catalog.setval('public.shop_orderdetail_id_seq', 1, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: company_customer company_customer_code_589e7b18_uniq; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.company_customer
    ADD CONSTRAINT company_customer_code_589e7b18_uniq UNIQUE (code);


--
-- Name: company_customer company_customer_code_key; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.company_customer
    ADD CONSTRAINT company_customer_code_key UNIQUE (code);


--
-- Name: company_customer company_customer_pkey; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.company_customer
    ADD CONSTRAINT company_customer_pkey PRIMARY KEY (id);


--
-- Name: company_supplier company_supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.company_supplier
    ADD CONSTRAINT company_supplier_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: shop_article shop_article_code_d43bfcc2_uniq; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.shop_article
    ADD CONSTRAINT shop_article_code_d43bfcc2_uniq UNIQUE (code);


--
-- Name: shop_article shop_article_pkey; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.shop_article
    ADD CONSTRAINT shop_article_pkey PRIMARY KEY (id);


--
-- Name: shop_branch shop_branch_code_42728625_uniq; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.shop_branch
    ADD CONSTRAINT shop_branch_code_42728625_uniq UNIQUE (code);


--
-- Name: shop_branch shop_branch_pkey; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.shop_branch
    ADD CONSTRAINT shop_branch_pkey PRIMARY KEY (id);


--
-- Name: shop_company shop_company_code_8cd03031_uniq; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.shop_company
    ADD CONSTRAINT shop_company_code_8cd03031_uniq UNIQUE (code);


--
-- Name: shop_company shop_company_pkey; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.shop_company
    ADD CONSTRAINT shop_company_pkey PRIMARY KEY (id);


--
-- Name: shop_delivery shop_delivery_pkey; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.shop_delivery
    ADD CONSTRAINT shop_delivery_pkey PRIMARY KEY (id);


--
-- Name: shop_distribution shop_distribution_pkey; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.shop_distribution
    ADD CONSTRAINT shop_distribution_pkey PRIMARY KEY (id);


--
-- Name: shop_order shop_order_order_number_b27cffb7_uniq; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.shop_order
    ADD CONSTRAINT shop_order_order_number_b27cffb7_uniq UNIQUE (order_number);


--
-- Name: shop_order shop_order_pkey; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.shop_order
    ADD CONSTRAINT shop_order_pkey PRIMARY KEY (id);


--
-- Name: shop_orderdetail shop_orderdetail_order_id_article_id_267c5e21_uniq; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.shop_orderdetail
    ADD CONSTRAINT shop_orderdetail_order_id_article_id_267c5e21_uniq UNIQUE (order_id, article_id);


--
-- Name: shop_orderdetail shop_orderdetail_order_id_key; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.shop_orderdetail
    ADD CONSTRAINT shop_orderdetail_order_id_key UNIQUE (order_id);


--
-- Name: shop_orderdetail shop_orderdetail_pkey; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.shop_orderdetail
    ADD CONSTRAINT shop_orderdetail_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: mb_user
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: mb_user
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: mb_user
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: mb_user
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: mb_user
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: mb_user
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: mb_user
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: mb_user
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: mb_user
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: company_customer_code_589e7b18_like; Type: INDEX; Schema: public; Owner: mb_user
--

CREATE INDEX company_customer_code_589e7b18_like ON public.company_customer USING btree (code varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: mb_user
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: mb_user
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: mb_user
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: mb_user
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: shop_article_supplier_id_10c40f7b; Type: INDEX; Schema: public; Owner: mb_user
--

CREATE INDEX shop_article_supplier_id_10c40f7b ON public.shop_article USING btree (supplier_id);


--
-- Name: shop_delivery_order_detail_id_2005f3b0; Type: INDEX; Schema: public; Owner: mb_user
--

CREATE INDEX shop_delivery_order_detail_id_2005f3b0 ON public.shop_delivery USING btree (order_detail_id);


--
-- Name: shop_order_branch_id_3001d644; Type: INDEX; Schema: public; Owner: mb_user
--

CREATE INDEX shop_order_branch_id_3001d644 ON public.shop_order USING btree (branch_id);


--
-- Name: shop_order_company_id_7c40996c; Type: INDEX; Schema: public; Owner: mb_user
--

CREATE INDEX shop_order_company_id_7c40996c ON public.shop_order USING btree (company_id);


--
-- Name: shop_order_customer_id_f638df20; Type: INDEX; Schema: public; Owner: mb_user
--

CREATE INDEX shop_order_customer_id_f638df20 ON public.shop_order USING btree (customer_id);


--
-- Name: shop_order_distribution_id_80d5f34a; Type: INDEX; Schema: public; Owner: mb_user
--

CREATE INDEX shop_order_distribution_id_80d5f34a ON public.shop_order USING btree (distribution_id);


--
-- Name: shop_orderdetail_article_id_d44b589f; Type: INDEX; Schema: public; Owner: mb_user
--

CREATE INDEX shop_orderdetail_article_id_d44b589f ON public.shop_orderdetail USING btree (article_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_article shop_article_supplier_id_10c40f7b_fk_company_supplier_id; Type: FK CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.shop_article
    ADD CONSTRAINT shop_article_supplier_id_10c40f7b_fk_company_supplier_id FOREIGN KEY (supplier_id) REFERENCES public.company_supplier(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_delivery shop_delivery_order_detail_id_2005f3b0_fk_shop_orderdetail_id; Type: FK CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.shop_delivery
    ADD CONSTRAINT shop_delivery_order_detail_id_2005f3b0_fk_shop_orderdetail_id FOREIGN KEY (order_detail_id) REFERENCES public.shop_orderdetail(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_order shop_order_branch_id_3001d644_fk_shop_branch_id; Type: FK CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.shop_order
    ADD CONSTRAINT shop_order_branch_id_3001d644_fk_shop_branch_id FOREIGN KEY (branch_id) REFERENCES public.shop_branch(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_order shop_order_company_id_7c40996c_fk_shop_company_id; Type: FK CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.shop_order
    ADD CONSTRAINT shop_order_company_id_7c40996c_fk_shop_company_id FOREIGN KEY (company_id) REFERENCES public.shop_company(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_order shop_order_customer_id_f638df20_fk_company_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.shop_order
    ADD CONSTRAINT shop_order_customer_id_f638df20_fk_company_customer_id FOREIGN KEY (customer_id) REFERENCES public.company_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_order shop_order_distribution_id_80d5f34a_fk_shop_distribution_id; Type: FK CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.shop_order
    ADD CONSTRAINT shop_order_distribution_id_80d5f34a_fk_shop_distribution_id FOREIGN KEY (distribution_id) REFERENCES public.shop_distribution(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

--
-- Database "mobi_db" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1 (Debian 14.1-1.pgdg110+1)
-- Dumped by pg_dump version 14.1 (Debian 14.1-1.pgdg110+1)

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

--
-- Name: mobi_db; Type: DATABASE; Schema: -; Owner: mb_user
--

CREATE DATABASE mobi_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE mobi_db OWNER TO mb_user;

\connect mobi_db

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: mb_user
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO mb_user;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: mb_user
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO mb_user;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mb_user
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: mb_user
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO mb_user;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: mb_user
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO mb_user;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mb_user
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: mb_user
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO mb_user;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: mb_user
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO mb_user;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mb_user
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: mb_user
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO mb_user;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: mb_user
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO mb_user;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: mb_user
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO mb_user;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mb_user
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: mb_user
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO mb_user;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mb_user
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: mb_user
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO mb_user;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: mb_user
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO mb_user;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mb_user
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: company_customer; Type: TABLE; Schema: public; Owner: mb_user
--

CREATE TABLE public.company_customer (
    id bigint NOT NULL,
    status boolean NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    code character varying(20) NOT NULL,
    client_type character varying(2) NOT NULL,
    name character varying(100),
    rfc character varying(13) NOT NULL,
    logo character varying(100),
    address character varying(300)
);


ALTER TABLE public.company_customer OWNER TO mb_user;

--
-- Name: company_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: mb_user
--

CREATE SEQUENCE public.company_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.company_customer_id_seq OWNER TO mb_user;

--
-- Name: company_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mb_user
--

ALTER SEQUENCE public.company_customer_id_seq OWNED BY public.company_customer.id;


--
-- Name: company_supplier; Type: TABLE; Schema: public; Owner: mb_user
--

CREATE TABLE public.company_supplier (
    id bigint NOT NULL,
    status boolean NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    name character varying(100),
    address character varying(300)
);


ALTER TABLE public.company_supplier OWNER TO mb_user;

--
-- Name: company_supplier_id_seq; Type: SEQUENCE; Schema: public; Owner: mb_user
--

CREATE SEQUENCE public.company_supplier_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.company_supplier_id_seq OWNER TO mb_user;

--
-- Name: company_supplier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mb_user
--

ALTER SEQUENCE public.company_supplier_id_seq OWNED BY public.company_supplier.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: mb_user
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO mb_user;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: mb_user
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO mb_user;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mb_user
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: mb_user
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO mb_user;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: mb_user
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO mb_user;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mb_user
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: mb_user
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO mb_user;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: mb_user
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO mb_user;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mb_user
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: mb_user
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO mb_user;

--
-- Name: shop_article; Type: TABLE; Schema: public; Owner: mb_user
--

CREATE TABLE public.shop_article (
    id bigint NOT NULL,
    status boolean NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    code integer NOT NULL,
    title character varying(100) NOT NULL,
    description text,
    price double precision NOT NULL,
    supplier_id bigint NOT NULL
);


ALTER TABLE public.shop_article OWNER TO mb_user;

--
-- Name: shop_article_id_seq; Type: SEQUENCE; Schema: public; Owner: mb_user
--

CREATE SEQUENCE public.shop_article_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_article_id_seq OWNER TO mb_user;

--
-- Name: shop_article_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mb_user
--

ALTER SEQUENCE public.shop_article_id_seq OWNED BY public.shop_article.id;


--
-- Name: shop_branch; Type: TABLE; Schema: public; Owner: mb_user
--

CREATE TABLE public.shop_branch (
    id bigint NOT NULL,
    code integer NOT NULL,
    reference character varying(50) NOT NULL
);


ALTER TABLE public.shop_branch OWNER TO mb_user;

--
-- Name: shop_branch_id_seq; Type: SEQUENCE; Schema: public; Owner: mb_user
--

CREATE SEQUENCE public.shop_branch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_branch_id_seq OWNER TO mb_user;

--
-- Name: shop_branch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mb_user
--

ALTER SEQUENCE public.shop_branch_id_seq OWNED BY public.shop_branch.id;


--
-- Name: shop_company; Type: TABLE; Schema: public; Owner: mb_user
--

CREATE TABLE public.shop_company (
    id bigint NOT NULL,
    code integer NOT NULL,
    reference character varying(50) NOT NULL
);


ALTER TABLE public.shop_company OWNER TO mb_user;

--
-- Name: shop_company_id_seq; Type: SEQUENCE; Schema: public; Owner: mb_user
--

CREATE SEQUENCE public.shop_company_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_company_id_seq OWNER TO mb_user;

--
-- Name: shop_company_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mb_user
--

ALTER SEQUENCE public.shop_company_id_seq OWNED BY public.shop_company.id;


--
-- Name: shop_delivery; Type: TABLE; Schema: public; Owner: mb_user
--

CREATE TABLE public.shop_delivery (
    id bigint NOT NULL,
    order_detail_id bigint NOT NULL,
    delivery_date timestamp with time zone
);


ALTER TABLE public.shop_delivery OWNER TO mb_user;

--
-- Name: shop_delivery_id_seq; Type: SEQUENCE; Schema: public; Owner: mb_user
--

CREATE SEQUENCE public.shop_delivery_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_delivery_id_seq OWNER TO mb_user;

--
-- Name: shop_delivery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mb_user
--

ALTER SEQUENCE public.shop_delivery_id_seq OWNED BY public.shop_delivery.id;


--
-- Name: shop_distribution; Type: TABLE; Schema: public; Owner: mb_user
--

CREATE TABLE public.shop_distribution (
    id bigint NOT NULL,
    stock character varying(100) NOT NULL
);


ALTER TABLE public.shop_distribution OWNER TO mb_user;

--
-- Name: shop_distribution_id_seq; Type: SEQUENCE; Schema: public; Owner: mb_user
--

CREATE SEQUENCE public.shop_distribution_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_distribution_id_seq OWNER TO mb_user;

--
-- Name: shop_distribution_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mb_user
--

ALTER SEQUENCE public.shop_distribution_id_seq OWNED BY public.shop_distribution.id;


--
-- Name: shop_order; Type: TABLE; Schema: public; Owner: mb_user
--

CREATE TABLE public.shop_order (
    id bigint NOT NULL,
    order_number integer NOT NULL,
    is_urgent boolean NOT NULL,
    generated_date timestamp with time zone NOT NULL,
    amount integer NOT NULL,
    branch_id bigint,
    company_id bigint,
    customer_id bigint NOT NULL,
    distribution_id bigint
);


ALTER TABLE public.shop_order OWNER TO mb_user;

--
-- Name: shop_order_id_seq; Type: SEQUENCE; Schema: public; Owner: mb_user
--

CREATE SEQUENCE public.shop_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_order_id_seq OWNER TO mb_user;

--
-- Name: shop_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mb_user
--

ALTER SEQUENCE public.shop_order_id_seq OWNED BY public.shop_order.id;


--
-- Name: shop_orderdetail; Type: TABLE; Schema: public; Owner: mb_user
--

CREATE TABLE public.shop_orderdetail (
    id bigint NOT NULL,
    article_id bigint NOT NULL,
    order_id bigint NOT NULL,
    assortment_date timestamp with time zone
);


ALTER TABLE public.shop_orderdetail OWNER TO mb_user;

--
-- Name: shop_orderdetail_id_seq; Type: SEQUENCE; Schema: public; Owner: mb_user
--

CREATE SEQUENCE public.shop_orderdetail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_orderdetail_id_seq OWNER TO mb_user;

--
-- Name: shop_orderdetail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mb_user
--

ALTER SEQUENCE public.shop_orderdetail_id_seq OWNED BY public.shop_orderdetail.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: company_customer id; Type: DEFAULT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.company_customer ALTER COLUMN id SET DEFAULT nextval('public.company_customer_id_seq'::regclass);


--
-- Name: company_supplier id; Type: DEFAULT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.company_supplier ALTER COLUMN id SET DEFAULT nextval('public.company_supplier_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: shop_article id; Type: DEFAULT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.shop_article ALTER COLUMN id SET DEFAULT nextval('public.shop_article_id_seq'::regclass);


--
-- Name: shop_branch id; Type: DEFAULT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.shop_branch ALTER COLUMN id SET DEFAULT nextval('public.shop_branch_id_seq'::regclass);


--
-- Name: shop_company id; Type: DEFAULT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.shop_company ALTER COLUMN id SET DEFAULT nextval('public.shop_company_id_seq'::regclass);


--
-- Name: shop_delivery id; Type: DEFAULT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.shop_delivery ALTER COLUMN id SET DEFAULT nextval('public.shop_delivery_id_seq'::regclass);


--
-- Name: shop_distribution id; Type: DEFAULT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.shop_distribution ALTER COLUMN id SET DEFAULT nextval('public.shop_distribution_id_seq'::regclass);


--
-- Name: shop_order id; Type: DEFAULT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.shop_order ALTER COLUMN id SET DEFAULT nextval('public.shop_order_id_seq'::regclass);


--
-- Name: shop_orderdetail id; Type: DEFAULT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.shop_orderdetail ALTER COLUMN id SET DEFAULT nextval('public.shop_orderdetail_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: mb_user
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: mb_user
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: mb_user
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add supplier	7	add_supplier
26	Can change supplier	7	change_supplier
27	Can delete supplier	7	delete_supplier
28	Can view supplier	7	view_supplier
29	Can add customer	8	add_customer
30	Can change customer	8	change_customer
31	Can delete customer	8	delete_customer
32	Can view customer	8	view_customer
33	Can add article	9	add_article
34	Can change article	9	change_article
35	Can delete article	9	delete_article
36	Can view article	9	view_article
37	Can add branch	10	add_branch
38	Can change branch	10	change_branch
39	Can delete branch	10	delete_branch
40	Can view branch	10	view_branch
41	Can add company	11	add_company
42	Can change company	11	change_company
43	Can delete company	11	delete_company
44	Can view company	11	view_company
45	Can add distribution	12	add_distribution
46	Can change distribution	12	change_distribution
47	Can delete distribution	12	delete_distribution
48	Can view distribution	12	view_distribution
49	Can add order	13	add_order
50	Can change order	13	change_order
51	Can delete order	13	delete_order
52	Can view order	13	view_order
53	Can add order detail	14	add_orderdetail
54	Can change order detail	14	change_orderdetail
55	Can delete order detail	14	delete_orderdetail
56	Can view order detail	14	view_orderdetail
57	Can add delivery	15	add_delivery
58	Can change delivery	15	change_delivery
59	Can delete delivery	15	delete_delivery
60	Can view delivery	15	view_delivery
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: mb_user
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$260000$a9oUV2fTBca3vCfaXCbwyV$bsFGnlUUx1b80jbXA48yY+EHmHBtGpZUHYBH4c+JQQE=	2022-01-07 14:47:02.359332+00	t	tsantiago			tsantiago@gmail.com	t	t	2022-01-07 14:45:59.568628+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: mb_user
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: mb_user
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: company_customer; Type: TABLE DATA; Schema: public; Owner: mb_user
--

COPY public.company_customer (id, status, created, modified, code, client_type, name, rfc, logo, address) FROM stdin;
1	t	2022-01-07 14:48:28.759488+00	2022-01-07 14:48:28.759517+00	01	01	PATITO 1	6789		Ciudad de Mexico
2	t	2022-01-07 14:48:46.849359+00	2022-01-07 14:48:46.849394+00	02	02	PATITO 2	6789		Ciudad de Mexico
3	t	2022-01-07 14:49:18.223096+00	2022-01-07 14:49:18.223126+00	03	03	PATITO 3	1234		Ciudad de Mexico
4	t	2022-01-07 14:49:43.1604+00	2022-01-07 14:49:43.160425+00	04	04	PATITO 4	7890		Ciudad de Mexico
\.


--
-- Data for Name: company_supplier; Type: TABLE DATA; Schema: public; Owner: mb_user
--

COPY public.company_supplier (id, status, created, modified, name, address) FROM stdin;
1	t	2022-01-07 14:47:26.011887+00	2022-01-07 14:47:26.011914+00	TOMAS	El Potrero
2	t	2022-01-07 14:47:46.443853+00	2022-01-07 14:47:46.443883+00	SANTIAGO	Azucena
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: mb_user
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-01-07 14:47:26.066533+00	1	TOMAS	1	[{"added": {}}]	7	1
2	2022-01-07 14:47:46.446214+00	2	SANTIAGO	1	[{"added": {}}]	7	1
3	2022-01-07 14:48:28.80657+00	1	01 PATITO 1	1	[{"added": {}}]	8	1
4	2022-01-07 14:48:46.851679+00	2	02 PATITO 2	1	[{"added": {}}]	8	1
5	2022-01-07 14:49:18.225746+00	3	03 PATITO 3	1	[{"added": {}}]	8	1
6	2022-01-07 14:49:43.161252+00	4	04 PATITO 4	1	[{"added": {}}]	8	1
7	2022-01-07 14:50:11.7779+00	1	1 Queretaro	1	[{"added": {}}]	10	1
8	2022-01-07 14:50:38.2127+00	1	1 Central Santa Fe	1	[{"added": {}}]	11	1
9	2022-01-07 14:51:05.273717+00	1	Tepozotlan	1	[{"added": {}}]	12	1
10	2022-01-07 14:52:06.375067+00	1	1000.0 ZAPATOS	1	[{"added": {}}]	9	1
11	2022-01-07 14:52:31.745928+00	2	500.0 DULCES	1	[{"added": {}}]	9	1
12	2022-01-07 14:52:52.128984+00	3	200.0 INSUMOS	1	[{"added": {}}]	9	1
13	2022-01-07 14:53:49.361889+00	1	123456789	1	[{"added": {}}]	13	1
14	2022-01-07 14:54:35.202427+00	2	764538267	1	[{"added": {}}]	13	1
15	2022-01-07 14:54:49.472427+00	1	123456789	2	[{"changed": {"fields": ["Is urgent"]}}]	13	1
16	2022-01-07 14:55:14.423228+00	3	456789234	1	[{"added": {}}]	13	1
17	2022-01-07 15:11:25.988908+00	1	123456789 ZAPATOS	1	[{"added": {}}]	14	1
18	2022-01-07 16:19:06.33197+00	2	764538267 DULCES	1	[{"added": {}}]	14	1
19	2022-01-07 16:19:29.836261+00	3	456789234 INSUMOS	1	[{"added": {}}]	14	1
20	2022-01-08 21:43:54.578977+00	2	500.0 IMPRESORAS	2	[{"changed": {"fields": ["Title"]}}]	9	1
21	2022-01-08 21:44:06.295694+00	1	1000.0 LAPTOP	2	[{"changed": {"fields": ["Title"]}}]	9	1
22	2022-01-08 21:45:04.920685+00	4	600.0 CPU	1	[{"added": {}}]	9	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: mb_user
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	company	supplier
8	company	customer
9	shop	article
10	shop	branch
11	shop	company
12	shop	distribution
13	shop	order
14	shop	orderdetail
15	shop	delivery
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: mb_user
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-01-07 09:45:19.839031+00
2	auth	0001_initial	2022-01-07 09:45:20.806567+00
3	admin	0001_initial	2022-01-07 09:45:21.123784+00
4	admin	0002_logentry_remove_auto_add	2022-01-07 09:45:21.143899+00
5	admin	0003_logentry_add_action_flag_choices	2022-01-07 09:45:21.156289+00
6	contenttypes	0002_remove_content_type_name	2022-01-07 09:45:21.183968+00
7	auth	0002_alter_permission_name_max_length	2022-01-07 09:45:21.199481+00
8	auth	0003_alter_user_email_max_length	2022-01-07 09:45:21.219278+00
9	auth	0004_alter_user_username_opts	2022-01-07 09:45:21.231675+00
10	auth	0005_alter_user_last_login_null	2022-01-07 09:45:21.248203+00
11	auth	0006_require_contenttypes_0002	2022-01-07 09:45:21.256756+00
12	auth	0007_alter_validators_add_error_messages	2022-01-07 09:45:21.27903+00
13	auth	0008_alter_user_username_max_length	2022-01-07 09:45:21.35664+00
14	auth	0009_alter_user_last_name_max_length	2022-01-07 09:45:21.375226+00
15	auth	0010_alter_group_name_max_length	2022-01-07 09:45:21.391092+00
16	auth	0011_update_proxy_permissions	2022-01-07 09:45:21.410832+00
17	auth	0012_alter_user_first_name_max_length	2022-01-07 09:45:21.423117+00
18	company	0001_initial	2022-01-07 09:45:21.673182+00
19	company	0002_alter_customer_logo	2022-01-07 09:45:21.685699+00
20	sessions	0001_initial	2022-01-07 09:45:21.907442+00
21	shop	0001_initial	2022-01-07 09:45:22.843024+00
22	shop	0002_auto_20220107_0910	2022-01-07 09:45:23.114363+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: mb_user
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
jphpf8tc3j5a1wc1po3bpqk374o0e3nb	.eJxVjDsOwjAQBe_iGlm7_iQ2JX3OEK29CwkgW4qTCnF3iJQC2jcz76VG2tZp3Jos48zqrFCdfrdE-SFlB3yncqs617Iuc9K7og_a9FBZnpfD_TuYqE3fuoMQEW0vjrD3V3AOkK3vQwgehAS9BBLBmNkaMZ1JkAGwy4wuuBTV-wOu6zbT:1n5qWE:9HGV4-SJhWTdaGLD9uKCdvCaHDUJjQY1Vo3JxokQ4Ls	2022-01-21 14:47:02.503603+00
\.


--
-- Data for Name: shop_article; Type: TABLE DATA; Schema: public; Owner: mb_user
--

COPY public.shop_article (id, status, created, modified, code, title, description, price, supplier_id) FROM stdin;
3	t	2022-01-07 14:52:52.126551+00	2022-01-07 14:52:52.12658+00	1	INSUMOS	Este producto es una desmostración	200	2
2	t	2022-01-07 14:52:31.744471+00	2022-01-08 21:43:54.531593+00	2	IMPRESORAS	Este producto es una desmostración	500	2
1	t	2022-01-07 14:52:06.318756+00	2022-01-08 21:44:06.293063+00	123456	LAPTOP	Este producto es una desmostración	1000	1
4	t	2022-01-08 21:45:04.905859+00	2022-01-08 21:45:04.905888+00	4	CPU	es un producto de demostración.	600	2
\.


--
-- Data for Name: shop_branch; Type: TABLE DATA; Schema: public; Owner: mb_user
--

COPY public.shop_branch (id, code, reference) FROM stdin;
1	1	Queretaro
\.


--
-- Data for Name: shop_company; Type: TABLE DATA; Schema: public; Owner: mb_user
--

COPY public.shop_company (id, code, reference) FROM stdin;
1	1	Central Santa Fe
\.


--
-- Data for Name: shop_delivery; Type: TABLE DATA; Schema: public; Owner: mb_user
--

COPY public.shop_delivery (id, order_detail_id, delivery_date) FROM stdin;
\.


--
-- Data for Name: shop_distribution; Type: TABLE DATA; Schema: public; Owner: mb_user
--

COPY public.shop_distribution (id, stock) FROM stdin;
1	Tepozotlan
\.


--
-- Data for Name: shop_order; Type: TABLE DATA; Schema: public; Owner: mb_user
--

COPY public.shop_order (id, order_number, is_urgent, generated_date, amount, branch_id, company_id, customer_id, distribution_id) FROM stdin;
2	764538267	f	2022-01-07 14:54:35.201428+00	500	\N	1	2	\N
1	123456789	t	2022-01-07 14:53:49.318038+00	3000	\N	\N	4	1
3	456789234	f	2022-01-07 14:55:14.422529+00	1000	1	\N	3	\N
39	999	f	2022-01-07 17:47:01.654364+00	50	\N	\N	1	\N
40	991	f	2022-01-07 18:16:08.165414+00	50	\N	\N	1	\N
41	992	f	2022-01-07 18:26:49.302348+00	50	\N	\N	1	\N
42	993	t	2022-01-07 18:34:32.41232+00	50	\N	1	1	\N
\.


--
-- Data for Name: shop_orderdetail; Type: TABLE DATA; Schema: public; Owner: mb_user
--

COPY public.shop_orderdetail (id, article_id, order_id, assortment_date) FROM stdin;
1	1	1	\N
2	2	2	2022-01-01 16:19:02+00
3	3	3	2022-01-06 18:00:00+00
38	1	39	\N
39	1	40	\N
40	1	41	\N
41	1	42	\N
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mb_user
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mb_user
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mb_user
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 60, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mb_user
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mb_user
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mb_user
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: company_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mb_user
--

SELECT pg_catalog.setval('public.company_customer_id_seq', 4, true);


--
-- Name: company_supplier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mb_user
--

SELECT pg_catalog.setval('public.company_supplier_id_seq', 2, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mb_user
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 22, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mb_user
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 15, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mb_user
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 22, true);


--
-- Name: shop_article_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mb_user
--

SELECT pg_catalog.setval('public.shop_article_id_seq', 4, true);


--
-- Name: shop_branch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mb_user
--

SELECT pg_catalog.setval('public.shop_branch_id_seq', 1, true);


--
-- Name: shop_company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mb_user
--

SELECT pg_catalog.setval('public.shop_company_id_seq', 1, true);


--
-- Name: shop_delivery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mb_user
--

SELECT pg_catalog.setval('public.shop_delivery_id_seq', 1, false);


--
-- Name: shop_distribution_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mb_user
--

SELECT pg_catalog.setval('public.shop_distribution_id_seq', 1, true);


--
-- Name: shop_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mb_user
--

SELECT pg_catalog.setval('public.shop_order_id_seq', 42, true);


--
-- Name: shop_orderdetail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mb_user
--

SELECT pg_catalog.setval('public.shop_orderdetail_id_seq', 41, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: company_customer company_customer_code_589e7b18_uniq; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.company_customer
    ADD CONSTRAINT company_customer_code_589e7b18_uniq UNIQUE (code);


--
-- Name: company_customer company_customer_code_key; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.company_customer
    ADD CONSTRAINT company_customer_code_key UNIQUE (code);


--
-- Name: company_customer company_customer_pkey; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.company_customer
    ADD CONSTRAINT company_customer_pkey PRIMARY KEY (id);


--
-- Name: company_supplier company_supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.company_supplier
    ADD CONSTRAINT company_supplier_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: shop_article shop_article_code_d43bfcc2_uniq; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.shop_article
    ADD CONSTRAINT shop_article_code_d43bfcc2_uniq UNIQUE (code);


--
-- Name: shop_article shop_article_pkey; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.shop_article
    ADD CONSTRAINT shop_article_pkey PRIMARY KEY (id);


--
-- Name: shop_branch shop_branch_code_42728625_uniq; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.shop_branch
    ADD CONSTRAINT shop_branch_code_42728625_uniq UNIQUE (code);


--
-- Name: shop_branch shop_branch_pkey; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.shop_branch
    ADD CONSTRAINT shop_branch_pkey PRIMARY KEY (id);


--
-- Name: shop_company shop_company_code_8cd03031_uniq; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.shop_company
    ADD CONSTRAINT shop_company_code_8cd03031_uniq UNIQUE (code);


--
-- Name: shop_company shop_company_pkey; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.shop_company
    ADD CONSTRAINT shop_company_pkey PRIMARY KEY (id);


--
-- Name: shop_delivery shop_delivery_pkey; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.shop_delivery
    ADD CONSTRAINT shop_delivery_pkey PRIMARY KEY (id);


--
-- Name: shop_distribution shop_distribution_pkey; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.shop_distribution
    ADD CONSTRAINT shop_distribution_pkey PRIMARY KEY (id);


--
-- Name: shop_order shop_order_order_number_b27cffb7_uniq; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.shop_order
    ADD CONSTRAINT shop_order_order_number_b27cffb7_uniq UNIQUE (order_number);


--
-- Name: shop_order shop_order_pkey; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.shop_order
    ADD CONSTRAINT shop_order_pkey PRIMARY KEY (id);


--
-- Name: shop_orderdetail shop_orderdetail_pkey; Type: CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.shop_orderdetail
    ADD CONSTRAINT shop_orderdetail_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: mb_user
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: mb_user
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: mb_user
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: mb_user
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: mb_user
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: mb_user
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: mb_user
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: mb_user
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: mb_user
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: company_customer_code_589e7b18_like; Type: INDEX; Schema: public; Owner: mb_user
--

CREATE INDEX company_customer_code_589e7b18_like ON public.company_customer USING btree (code varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: mb_user
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: mb_user
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: mb_user
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: mb_user
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: shop_article_supplier_id_10c40f7b; Type: INDEX; Schema: public; Owner: mb_user
--

CREATE INDEX shop_article_supplier_id_10c40f7b ON public.shop_article USING btree (supplier_id);


--
-- Name: shop_delivery_order_detail_id_2005f3b0; Type: INDEX; Schema: public; Owner: mb_user
--

CREATE INDEX shop_delivery_order_detail_id_2005f3b0 ON public.shop_delivery USING btree (order_detail_id);


--
-- Name: shop_order_branch_id_3001d644; Type: INDEX; Schema: public; Owner: mb_user
--

CREATE INDEX shop_order_branch_id_3001d644 ON public.shop_order USING btree (branch_id);


--
-- Name: shop_order_company_id_7c40996c; Type: INDEX; Schema: public; Owner: mb_user
--

CREATE INDEX shop_order_company_id_7c40996c ON public.shop_order USING btree (company_id);


--
-- Name: shop_order_customer_id_f638df20; Type: INDEX; Schema: public; Owner: mb_user
--

CREATE INDEX shop_order_customer_id_f638df20 ON public.shop_order USING btree (customer_id);


--
-- Name: shop_order_distribution_id_80d5f34a; Type: INDEX; Schema: public; Owner: mb_user
--

CREATE INDEX shop_order_distribution_id_80d5f34a ON public.shop_order USING btree (distribution_id);


--
-- Name: shop_orderdetail_article_id_d44b589f; Type: INDEX; Schema: public; Owner: mb_user
--

CREATE INDEX shop_orderdetail_article_id_d44b589f ON public.shop_orderdetail USING btree (article_id);


--
-- Name: shop_orderdetail_order_id_80ad38f0; Type: INDEX; Schema: public; Owner: mb_user
--

CREATE INDEX shop_orderdetail_order_id_80ad38f0 ON public.shop_orderdetail USING btree (order_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_article shop_article_supplier_id_10c40f7b_fk_company_supplier_id; Type: FK CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.shop_article
    ADD CONSTRAINT shop_article_supplier_id_10c40f7b_fk_company_supplier_id FOREIGN KEY (supplier_id) REFERENCES public.company_supplier(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_delivery shop_delivery_order_detail_id_2005f3b0_fk_shop_orderdetail_id; Type: FK CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.shop_delivery
    ADD CONSTRAINT shop_delivery_order_detail_id_2005f3b0_fk_shop_orderdetail_id FOREIGN KEY (order_detail_id) REFERENCES public.shop_orderdetail(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_order shop_order_branch_id_3001d644_fk_shop_branch_id; Type: FK CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.shop_order
    ADD CONSTRAINT shop_order_branch_id_3001d644_fk_shop_branch_id FOREIGN KEY (branch_id) REFERENCES public.shop_branch(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_order shop_order_company_id_7c40996c_fk_shop_company_id; Type: FK CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.shop_order
    ADD CONSTRAINT shop_order_company_id_7c40996c_fk_shop_company_id FOREIGN KEY (company_id) REFERENCES public.shop_company(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_order shop_order_customer_id_f638df20_fk_company_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.shop_order
    ADD CONSTRAINT shop_order_customer_id_f638df20_fk_company_customer_id FOREIGN KEY (customer_id) REFERENCES public.company_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_order shop_order_distribution_id_80d5f34a_fk_shop_distribution_id; Type: FK CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.shop_order
    ADD CONSTRAINT shop_order_distribution_id_80d5f34a_fk_shop_distribution_id FOREIGN KEY (distribution_id) REFERENCES public.shop_distribution(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_orderdetail shop_orderdetail_article_id_d44b589f_fk_shop_article_id; Type: FK CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.shop_orderdetail
    ADD CONSTRAINT shop_orderdetail_article_id_d44b589f_fk_shop_article_id FOREIGN KEY (article_id) REFERENCES public.shop_article(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_orderdetail shop_orderdetail_order_id_80ad38f0_fk_shop_order_id; Type: FK CONSTRAINT; Schema: public; Owner: mb_user
--

ALTER TABLE ONLY public.shop_orderdetail
    ADD CONSTRAINT shop_orderdetail_order_id_80ad38f0_fk_shop_order_id FOREIGN KEY (order_id) REFERENCES public.shop_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1 (Debian 14.1-1.pgdg110+1)
-- Dumped by pg_dump version 14.1 (Debian 14.1-1.pgdg110+1)

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: mb_user
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO mb_user;

\connect postgres

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

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: mb_user
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

