--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4 (Debian 17.4-1.pgdg120+2)
-- Dumped by pg_dump version 17.4 (Debian 17.4-1.pgdg120+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: website; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.website (
    id integer NOT NULL,
    server character varying(100) NOT NULL,
    type character varying(100) NOT NULL,
    url character varying(255) NOT NULL,
    status character varying(100) NOT NULL,
    response_time double precision,
    last_checked timestamp without time zone,
    error_message text
);


ALTER TABLE public.website OWNER TO admin;

--
-- Name: website_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.website_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.website_id_seq OWNER TO admin;

--
-- Name: website_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.website_id_seq OWNED BY public.website.id;


--
-- Name: website id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.website ALTER COLUMN id SET DEFAULT nextval('public.website_id_seq'::regclass);


--
-- Data for Name: website; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.website (id, server, type, url, status, response_time, last_checked, error_message) FROM stdin;
5	Cloud2(( 37.27.16.130)	Web Application	https://lisa.icem.com.au/	OK	1033.53	2025-03-15 13:57:21.897053	\N
6	Cloud2(( 37.27.16.130)	Geoserver	https://geoagrocam.icem.com.au/geoserver	OK	1522.68	2025-03-15 13:57:23.41978	\N
7	Cloud2(( 37.27.16.130)	Geoserver	https://geoagrophp.icem.com.au/geoserver	OK	1209.36	2025-03-15 13:57:24.629241	\N
8	Cloud2(( 37.27.16.130)	Geoserver	https://geoprb.icem.com.au/geoserver/	OK	1504.73	2025-03-15 13:57:26.134037	\N
9	Cloud1( 78.47.82.63 )	Web Application	https://camatlas.icem.com.au	OK	2988.8	2025-03-15 13:57:29.122893	\N
10	Cloud1( 78.47.82.63 )	Web Application	https://9c9t.icem.com.au	OK	3267.11	2025-03-15 13:57:32.390056	\N
11	Cloud1( 78.47.82.63 )	Web Application	https://mon9440.icem.com.au	OK	1825.27	2025-03-15 13:57:34.215386	\N
12	Cloud1( 78.47.82.63 )	Web Application	https://nsroads.icem.com.au	OK	1635.25	2025-03-15 13:57:35.850676	\N
13	Cloud1( 78.47.82.63 )	Web Application	https://ta9191.icem.com.au	OK	2892.02	2025-03-15 13:57:38.742754	\N
14	Cloud1( 78.47.82.63 )	Web Application	https://nepalams.icem.com.au	OK	1144.42	2025-03-15 13:57:39.887214	\N
15	Cloud1( 78.47.82.63 )	Web Application	https://dss.icem.com.au/cambodiadss/	DOWN	\N	2025-03-15 13:57:45.710679	HTTPSConnectionPool(host='dss.icem.com.au', port=443): Read timed out. (read timeout=5)
16	Cloud1( 78.47.82.63 )	Geoserver	https://dev.icem.com.au/geocamatlas/	OK	952.05	2025-03-15 13:57:46.662785	\N
17	Cloud1( 78.47.82.63 )	Geoserver	https://dev.icem.com.au/geo9c9t/	OK	1226.16	2025-03-15 13:57:47.889081	\N
18	Cloud1( 78.47.82.63 )	Geoserver	https://dev.icem.com.au/geonsroads/	OK	1180.34	2025-03-15 13:57:49.069483	\N
19	Cloud1( 78.47.82.63 )	Geoserver	https://dev.icem.com.au/geota9191/	OK	937.51	2025-03-15 13:57:50.007053	\N
20	Cloud1( 78.47.82.63 )	Geoserver	https://dev.icem.com.au/geoiki/	OK	963.65	2025-03-15 13:57:50.970749	\N
21	Cloud1( 78.47.82.63 )	Geoserver	https://dev.icem.com.au/geonepalams/	OK	949.73	2025-03-15 13:57:51.920521	\N
22	Cloud1( 78.47.82.63 )	Geoserver	https://geolisa.icem.com.au/geoserver/	OK	1217.1	2025-03-15 13:57:53.137663	\N
23	Cloud1( 78.47.82.63 )	Rstudio	https://rstudio.icem.com.au	OK	1204.3	2025-03-15 13:57:54.342002	\N
24	ICEM Dedicated ( 95.216.34.45)	Web Application	https://shinydev.icem.com.au/giz3s	DOWN	\N	2025-03-15 13:58:01.193684	HTTPSConnectionPool(host='shinydev.icem.com.au', port=443): Read timed out. (read timeout=5)
25	ICEM Dedicated ( 95.216.34.45)	Geoserver	https://geogiz3s.icem.com.au/geoserver	OK	1579.83	2025-03-15 13:58:02.773593	\N
26	ICEM Dedicated ( 95.216.34.45)	Rstudio	https://rstudiodev.icem.com.au	OK	1527.78	2025-03-15 13:58:04.301427	\N
1	Cloud2(( 37.27.16.130)	Web Application	https://agrophp.icem.com.au	OK	1716.17	2025-03-15 13:58:06.017646	\N
2	Cloud2(( 37.27.16.130)	Web Application	https://agrocam.icem.com.au	OK	1711.03	2025-03-15 13:58:07.728733	\N
3	Cloud2(( 37.27.16.130)	Web Application	https://capfish.icem.com.au	OK	1511.65	2025-03-15 13:58:09.240433	\N
4	Cloud2(( 37.27.16.130)	Web Application	https://amsprb.icem.com.au/	OK	1463.67	2025-03-15 13:58:10.704152	\N
\.


--
-- Name: website_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.website_id_seq', 26, true);


--
-- Name: website website_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.website
    ADD CONSTRAINT website_pkey PRIMARY KEY (id);


--
-- Name: website website_url_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.website
    ADD CONSTRAINT website_url_key UNIQUE (url);


--
-- PostgreSQL database dump complete
--

