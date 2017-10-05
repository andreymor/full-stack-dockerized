--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.8
-- Dumped by pg_dump version 9.5.8

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: hdd; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE hdd (
    id_hdd integer NOT NULL,
    fk_hdd_type integer,
    size integer NOT NULL,
    size_type character varying(2) NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    removed_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE hdd OWNER TO postgres;

--
-- Name: hdd_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE hdd_type (
    id_hdd_type integer NOT NULL,
    description character varying(6) NOT NULL
);


ALTER TABLE hdd_type OWNER TO postgres;

--
-- Name: location; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE location (
    id_location integer NOT NULL,
    name character varying(50) NOT NULL,
    initials character varying(5) NOT NULL,
    code character varying(3) NOT NULL
);


ALTER TABLE location OWNER TO postgres;

--
-- Name: ram; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ram (
    id_ram integer NOT NULL,
    fk_ram_type integer,
    size integer NOT NULL,
    size_type character varying(2) NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    removed_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE ram OWNER TO postgres;

--
-- Name: ram_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ram_type (
    id_ram_type integer NOT NULL,
    description character varying(6) NOT NULL
);


ALTER TABLE ram_type OWNER TO postgres;

--
-- Name: server; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE server (
    id_server integer NOT NULL,
    fk_ram integer,
    fk_hdd integer,
    fk_location integer,
    model character varying(500) NOT NULL,
    hdd_quantity integer NOT NULL,
    price character varying(10) NOT NULL,
    model_type character varying(30) NOT NULL
);


ALTER TABLE server OWNER TO postgres;

--
-- Name: sq_hdd; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_hdd
    START WITH 1
    INCREMENT BY 100
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sq_hdd OWNER TO postgres;

--
-- Name: sq_hdd_type; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_hdd_type
    START WITH 1
    INCREMENT BY 100
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sq_hdd_type OWNER TO postgres;

--
-- Name: sq_location; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_location
    START WITH 1
    INCREMENT BY 100
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sq_location OWNER TO postgres;

--
-- Name: sq_ram; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_ram
    START WITH 1
    INCREMENT BY 100
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sq_ram OWNER TO postgres;

--
-- Name: sq_ram_type; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_ram_type
    START WITH 1
    INCREMENT BY 100
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sq_ram_type OWNER TO postgres;

--
-- Name: sq_server; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_server
    START WITH 1
    INCREMENT BY 100
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sq_server OWNER TO postgres;

--
-- Data for Name: hdd; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO hdd VALUES (101, 101, 2000, 'TB', '2017-09-30 19:23:32', NULL);
INSERT INTO hdd VALUES (102, 102, 480, 'GB', '2017-09-30 19:23:32', NULL);
INSERT INTO hdd VALUES (103, 101, 1000, 'TB', '2017-09-30 19:23:32', NULL);
INSERT INTO hdd VALUES (104, 102, 120, 'GB', '2017-09-30 19:23:32', NULL);
INSERT INTO hdd VALUES (105, 101, 500, 'GB', '2017-09-30 19:23:32', NULL);
INSERT INTO hdd VALUES (106, 103, 300, 'GB', '2017-09-30 19:23:32', NULL);
INSERT INTO hdd VALUES (107, 101, 3000, 'TB', '2017-09-30 19:23:32', NULL);
INSERT INTO hdd VALUES (108, 102, 960, 'GB', '2017-09-30 19:23:32', NULL);
INSERT INTO hdd VALUES (109, 102, 240, 'GB', '2017-09-30 19:23:32', NULL);


--
-- Data for Name: hdd_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO hdd_type VALUES (101, 'SATA2');
INSERT INTO hdd_type VALUES (102, 'SSD');
INSERT INTO hdd_type VALUES (103, 'SAS');


--
-- Data for Name: location; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO location VALUES (101, 'Amsterdam', 'AMS', '01');
INSERT INTO location VALUES (102, 'Washington D.C.', 'WDC', '01');
INSERT INTO location VALUES (103, 'San Francisco', 'SFO', '12');
INSERT INTO location VALUES (104, 'Singapore', 'SIN', '11');
INSERT INTO location VALUES (105, 'Dallas', 'DAL', '10');
INSERT INTO location VALUES (106, 'Frankfurt', 'FRA', '10');
INSERT INTO location VALUES (107, 'Hong Kong', 'HKG', '10');


--
-- Data for Name: ram; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO ram VALUES (101, 101, 16, 'GB', '2017-09-30 19:23:32', NULL);
INSERT INTO ram VALUES (102, 101, 32, 'GB', '2017-09-30 19:23:32', NULL);
INSERT INTO ram VALUES (103, 101, 128, 'GB', '2017-09-30 19:23:32', NULL);
INSERT INTO ram VALUES (104, 102, 64, 'GB', '2017-09-30 19:23:32', NULL);
INSERT INTO ram VALUES (105, 101, 4, 'GB', '2017-09-30 19:23:32', NULL);
INSERT INTO ram VALUES (106, 101, 96, 'GB', '2017-09-30 19:23:32', NULL);
INSERT INTO ram VALUES (107, 101, 8, 'GB', '2017-09-30 19:23:32', NULL);


--
-- Data for Name: ram_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO ram_type VALUES (101, 'DDR3');
INSERT INTO ram_type VALUES (102, 'DDR4');


--
-- Data for Name: server; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO server VALUES (1, 101, 101, 101, 'Dell R210Intel', 2, '€49.99', 'Xeon X3440');
INSERT INTO server VALUES (2, 102, 101, 101, 'HP DL180G62x Intel', 8, '€119.00', 'Xeon E5620');
INSERT INTO server VALUES (3, 102, 101, 101, 'HP DL380eG82x Intel', 8, '€131.99', 'Xeon E5-2420');
INSERT INTO server VALUES (4, 103, 102, 101, 'RH2288v32x Intel', 4, '€227.99', 'Xeon E5-2650V4');
INSERT INTO server VALUES (5, 104, 101, 101, 'RH2288v32x Intel', 4, '€161.99', 'Xeon E5-2620v4');
INSERT INTO server VALUES (6, 101, 101, 101, 'Dell R210-IIIntel', 2, '€72.99', 'Xeon E3-1230v2');
INSERT INTO server VALUES (7, 104, 101, 101, 'HP DL380pG82x Intel', 8, '€179.99', 'Xeon E5-2650');
INSERT INTO server VALUES (8, 102, 101, 101, 'IBM X36302x Intel', 8, '€106.99', 'Xeon E5620');
INSERT INTO server VALUES (9, 105, 103, 101, 'HP', 4, '€39.99', 'DL120G7Intel G850');
INSERT INTO server VALUES (10, 103, 104, 101, 'Dell R730XD2x Intel', 2, '€364.99', 'Xeon E5-2667v4');
INSERT INTO server VALUES (11, 103, 104, 101, 'Dell R730XD2x Intel', 2, '€364.99', 'Xeon E5-2670v3');
INSERT INTO server VALUES (12, 103, 102, 101, 'Dell R730XD2x Intel', 4, '€279.99', 'Xeon E5-2650v3');
INSERT INTO server VALUES (13, 103, 102, 101, 'Dell R730XD2x Intel', 4, '€286.99', 'Xeon E5-2650v4');
INSERT INTO server VALUES (14, 103, 102, 101, 'Dell R730XD2x Intel', 4, '€239.99', 'Xeon E5-2630v4');
INSERT INTO server VALUES (15, 104, 104, 101, 'HP DL180 G92x Intel', 2, '€199.99', 'Xeon E5-2620v3');
INSERT INTO server VALUES (16, 105, 105, 101, 'Dell', 2, '€35.99', 'R210-IIIntel G530');
INSERT INTO server VALUES (17, 101, 103, 101, 'Dell R210-IIIntel', 2, '€59.99', 'Xeon E3-1220');
INSERT INTO server VALUES (18, 104, 104, 101, 'Dell R9304x Intel', 2, '€1044.99', 'Xeon E7-4850v3');
INSERT INTO server VALUES (19, 104, 104, 101, 'Dell R9304x Intel', 2, '€756.99', 'Xeon E7-4820v3');
INSERT INTO server VALUES (20, 104, 104, 101, 'Dell R9304x Intel', 2, '€874.99', 'Xeon E7-4830v3');
INSERT INTO server VALUES (21, 101, 103, 101, 'Dell R210-IIIntel', 2, '€89.99', 'Xeon E3-1270v2');
INSERT INTO server VALUES (22, 102, 103, 101, 'Supermicro SC846Intel', 24, '€199.99', 'Xeon E5620');
INSERT INTO server VALUES (23, 104, 101, 101, 'HP DL120G91x', 4, '€154.99', 'Intel E5-1650v3');
INSERT INTO server VALUES (24, 101, 103, 101, 'HP DL120G7Intel', 4, '€84.99', 'Xeon E3-1230');
INSERT INTO server VALUES (25, 101, 103, 101, 'DL20G9Intel', 2, '€112.99', 'Xeon E3-1270v5');
INSERT INTO server VALUES (26, 102, 101, 101, 'HP DL120G91x', 4, '€119.99', 'Intel E5-1620v3');
INSERT INTO server VALUES (27, 104, 101, 101, 'HP DL380pG82x Intel', 8, '€154.99', 'Xeon E5-2620');
INSERT INTO server VALUES (28, 102, 101, 101, 'HP DL380eG82x Intel', 8, '€142.99', 'Xeon E5-2420');
INSERT INTO server VALUES (29, 104, 101, 101, 'Dell R730XD2x Intel', 4, '€209.99', 'Xeon E5-2620v3');
INSERT INTO server VALUES (30, 103, 102, 101, 'RH2288v32x Intel', 4, '€227.99', 'Xeon E5-2650V4');
INSERT INTO server VALUES (31, 104, 101, 101, 'RH2288v32x Intel', 4, '€161.99', 'Xeon E5-2620v4');
INSERT INTO server VALUES (32, 104, 101, 101, 'Dell R730XD2x Intel', 4, '€204.99', 'Xeon E5-2620v4');
INSERT INTO server VALUES (33, 101, 101, 101, 'Dell R210-IIIntel', 2, '€72.99', 'Xeon E3-1230v2');
INSERT INTO server VALUES (34, 102, 104, 101, 'Dell R7202x Intel', 2, '€221.99', 'Xeon E5-2643');
INSERT INTO server VALUES (35, 102, 101, 101, 'HP DL180G62x Intel', 8, '€129.99', 'Xeon E5645');
INSERT INTO server VALUES (36, 106, 104, 101, 'Dell R6202x Intel', 8, '€191.99', 'Xeon E5-2650');
INSERT INTO server VALUES (37, 101, 103, 101, 'HP DL120G7Intel', 4, '€195.99', 'Xeon E3-1230');
INSERT INTO server VALUES (38, 104, 101, 101, 'HP DL380pG82x Intel', 8, '€295.99', 'Xeon E5-2620');
INSERT INTO server VALUES (39, 104, 101, 101, 'HP DL380pG82x Intel', 8, '€355.99', 'Xeon E5-2650');
INSERT INTO server VALUES (40, 105, 103, 101, 'HP', 4, '€163.99', 'DL120G7Intel G850');
INSERT INTO server VALUES (41, 101, 105, 101, 'Dell R210-IIIntel', 2, '€119.99', 'Xeon E3-1230v2');
INSERT INTO server VALUES (42, 104, 101, 101, 'HP DL380pG82x Intel', 8, '€272.99', 'Xeon E5-2650');
INSERT INTO server VALUES (43, 103, 102, 101, 'Dell R730XD2x Intel', 4, '€367.99', 'Xeon E5-2650v3');
INSERT INTO server VALUES (44, 104, 101, 101, 'HP DL380pG82x Intel', 8, '€212.99', 'Xeon E5-2620');
INSERT INTO server VALUES (45, 104, 101, 101, 'Dell R730XD2x Intel', 4, '€277.99', 'Xeon E5-2620v3');
INSERT INTO server VALUES (46, 103, 104, 101, 'Dell R730XD2x Intel', 2, '€389.99', 'Xeon E5-2670v3');
INSERT INTO server VALUES (47, 102, 101, 101, 'HP DL180G62x Intel', 8, '€180.99', 'Xeon E5645');
INSERT INTO server VALUES (48, 102, 104, 101, 'Dell R7202x Intel', 2, '€246.99', 'Xeon E5-2643');
INSERT INTO server VALUES (49, 103, 102, 101, 'Dell R730XD2x Intel', 4, '€341.99', 'Xeon E5-2630v4');
INSERT INTO server VALUES (50, 102, 101, 101, 'HP DL180G62x Intel', 8, '€166.99', 'Xeon E5620');
INSERT INTO server VALUES (51, 104, 101, 101, 'HP DL380eG82x Intel', 8, '€304.99', 'Xeon E5-2420');
INSERT INTO server VALUES (52, 104, 104, 101, 'HP DL180 G92x Intel', 2, '€279.99', 'Xeon E5-2620v3');
INSERT INTO server VALUES (53, 105, 105, 101, 'Dell', 2, '€60.99', 'R210-IIIntel G530');
INSERT INTO server VALUES (54, 101, 103, 101, 'Dell R210-IIIntel', 2, '€110.99', 'Xeon E3-1220');
INSERT INTO server VALUES (55, 101, 101, 101, 'Dell R210Intel', 2, '€83.99', 'Xeon X3440');
INSERT INTO server VALUES (56, 104, 104, 101, 'Dell R9304x Intel', 2, '€1069.99', 'Xeon E7-4850v3');
INSERT INTO server VALUES (57, 104, 104, 101, 'Dell R9304x Intel', 2, '€781.99', 'Xeon E7-4820v3');
INSERT INTO server VALUES (58, 104, 104, 101, 'Dell R9304x Intel', 2, '€899.99', 'Xeon E7-4830v3');
INSERT INTO server VALUES (59, 105, 103, 101, 'HP', 4, '€80.99', 'DL120G7Intel G850');
INSERT INTO server VALUES (60, 102, 103, 101, 'Supermicro SC846Intel', 24, '€224.99', 'Xeon E5620');
INSERT INTO server VALUES (61, 102, 101, 101, 'HP DL120G91x', 4, '€143.99', 'Intel E5-1620v3');
INSERT INTO server VALUES (62, 104, 101, 101, 'HP DL380pG82x Intel', 8, '€252.99', 'Xeon E5-2650');
INSERT INTO server VALUES (63, 103, 102, 101, 'Dell R730XD2x Intel', 4, '€347.99', 'Xeon E5-2650v3');
INSERT INTO server VALUES (64, 102, 101, 101, 'HP DL180G62x Intel', 8, '€146.99', 'Xeon E5620');
INSERT INTO server VALUES (65, 104, 101, 101, 'Dell R730XD2x Intel', 4, '€257.99', 'Xeon E5-2620v3');
INSERT INTO server VALUES (66, 104, 101, 101, 'HP DL380pG82x Intel', 8, '€192.99', 'Xeon E5-2620');
INSERT INTO server VALUES (67, 103, 104, 101, 'Dell R730XD2x Intel', 2, '€369.99', 'Xeon E5-2670v3');
INSERT INTO server VALUES (68, 102, 104, 101, 'Dell R7202x Intel', 2, '€226.99', 'Xeon E5-2643');
INSERT INTO server VALUES (69, 103, 102, 101, 'Dell R730XD2x Intel', 4, '€321.99', 'Xeon E5-2630v4');
INSERT INTO server VALUES (70, 104, 104, 101, 'HP DL180 G92x Intel', 2, '€259.99', 'Xeon E5-2620v3');
INSERT INTO server VALUES (71, 104, 104, 101, 'Dell R9304x Intel', 2, '€879.99', 'Xeon E7-4830v3');
INSERT INTO server VALUES (72, 104, 104, 101, 'Dell R9304x Intel', 2, '€1049.99', 'Xeon E7-4850v3');
INSERT INTO server VALUES (73, 104, 104, 101, 'Dell R9304x Intel', 2, '€761.99', 'Xeon E7-4820v3');
INSERT INTO server VALUES (74, 105, 105, 101, 'Dell', 2, '€40.99', 'R210-IIIntel G530');
INSERT INTO server VALUES (75, 101, 101, 101, 'Dell R210Intel', 2, '€63.99', 'Xeon X3440');
INSERT INTO server VALUES (76, 101, 103, 101, 'Dell R210-IIIntel', 2, '€90.99', 'Xeon E3-1220');
INSERT INTO server VALUES (77, 105, 103, 101, 'HP', 4, '€60.99', 'DL120G7Intel G850');
INSERT INTO server VALUES (78, 102, 103, 101, 'Supermicro SC846Intel', 24, '€355.99', 'Xeon E5620');
INSERT INTO server VALUES (79, 104, 101, 101, 'HP DL380eG82x Intel', 8, '€190.99', 'Xeon E5-2420');
INSERT INTO server VALUES (80, 102, 101, 101, 'HP DL180G62x Intel', 8, '€160.99', 'Xeon E5645');
INSERT INTO server VALUES (81, 101, 101, 101, 'Dell R210Intel', 2, '€197.99', 'Xeon X3440');
INSERT INTO server VALUES (82, 104, 101, 101, 'HP DL380pG82x Intel', 8, '€386.99', 'Xeon E5-2650');
INSERT INTO server VALUES (83, 103, 102, 101, 'Dell R730XD2x Intel', 4, '€481.99', 'Xeon E5-2650v3');
INSERT INTO server VALUES (84, 102, 101, 101, 'HP DL180G62x Intel', 8, '€280.99', 'Xeon E5620');
INSERT INTO server VALUES (85, 104, 101, 101, 'Dell R730XD2x Intel', 4, '€391.99', 'Xeon E5-2620v3');
INSERT INTO server VALUES (86, 104, 101, 101, 'HP DL380pG82x Intel', 8, '€326.99', 'Xeon E5-2620');
INSERT INTO server VALUES (87, 103, 104, 101, 'Dell R730XD2x Intel', 2, '€503.99', 'Xeon E5-2670v3');
INSERT INTO server VALUES (88, 102, 104, 101, 'Dell R7202x Intel', 2, '€360.99', 'Xeon E5-2643');
INSERT INTO server VALUES (89, 103, 102, 101, 'Dell R730XD2x Intel', 4, '€455.99', 'Xeon E5-2630v4');
INSERT INTO server VALUES (90, 104, 104, 101, 'HP DL180 G92x Intel', 2, '€393.99', 'Xeon E5-2620v3');
INSERT INTO server VALUES (91, 104, 104, 101, 'Dell R9304x Intel', 2, '€1013.99', 'Xeon E7-4830v3');
INSERT INTO server VALUES (92, 104, 104, 101, 'Dell R9304x Intel', 2, '€1183.99', 'Xeon E7-4850v3');
INSERT INTO server VALUES (93, 104, 104, 101, 'Dell R9304x Intel', 2, '€895.99', 'Xeon E7-4820v3');
INSERT INTO server VALUES (94, 105, 105, 101, 'Dell', 2, '€174.99', 'R210-IIIntel G530');
INSERT INTO server VALUES (95, 101, 103, 101, 'Dell R210-IIIntel', 2, '€224.99', 'Xeon E3-1220');
INSERT INTO server VALUES (96, 105, 103, 101, 'HP', 4, '€194.99', 'DL120G7Intel G850');
INSERT INTO server VALUES (97, 102, 103, 101, 'Supermicro SC846Intel', 24, '€489.99', 'Xeon E5620');
INSERT INTO server VALUES (98, 104, 101, 101, 'HP DL380eG82x Intel', 8, '€304.99', 'Xeon E5-2420');
INSERT INTO server VALUES (99, 102, 101, 101, 'HP DL180G62x Intel', 8, '€294.99', 'Xeon E5645');
INSERT INTO server VALUES (100, 107, 103, 101, 'Dell R720XD2x Intel', 4, '€1907.99', 'Xeon E5-2620');
INSERT INTO server VALUES (101, 107, 103, 101, 'Dell R720XD2x Intel', 4, '€1973.99', 'Xeon E5-2650');
INSERT INTO server VALUES (102, 107, 103, 101, 'HP DL380pG82x Intel', 4, '€1907.99', 'Xeon E5-2620');
INSERT INTO server VALUES (103, 107, 103, 101, 'HP DL380pG82x Intel', 4, '€1967.99', 'Xeon E5-2650');
INSERT INTO server VALUES (104, 105, 105, 101, 'HP', 4, '€1775.99', 'DL120G7Intel G850');
INSERT INTO server VALUES (105, 107, 105, 101, 'HP DL120G7Intel', 4, '€1807.99', 'Xeon E3-1230');
INSERT INTO server VALUES (106, 101, 103, 102, 'HP DL120G7Intel', 4, '$105.99', 'Xeon E3-1240');
INSERT INTO server VALUES (107, 107, 105, 102, 'Dell R210Intel', 2, '$55.99', 'Xeon X3430');
INSERT INTO server VALUES (108, 101, 103, 103, 'Dell R210-IIIntel', 2, '$121.99', 'Xeon E3-1270v2');
INSERT INTO server VALUES (109, 103, 102, 104, 'Dell R730XD2x Intel', 4, 'S$565.99', 'Xeon E5-2650V4');
INSERT INTO server VALUES (110, 103, 102, 102, 'Dell R730XD2x Intel', 4, '$431.99', 'Xeon E5-2650v4');
INSERT INTO server VALUES (111, 103, 102, 102, 'Dell R730XD2x Intel', 4, '$380.99', 'Xeon E5-2630v4');
INSERT INTO server VALUES (112, 103, 104, 102, 'Dell R730XD2x Intel', 2, '$360.99', 'Xeon E5-2630v3');
INSERT INTO server VALUES (113, 103, 104, 102, 'HP DL180 G92x Intel', 2, '$413.99', 'Xeon E5-2650v3');
INSERT INTO server VALUES (114, 104, 104, 103, 'HP DL180 G92x Intel', 2, '$305.99', 'Xeon E5-2620v3');
INSERT INTO server VALUES (115, 104, 104, 103, 'Dell R730XD2x Intel', 2, '$303.99', 'Xeon E5-2620v3');
INSERT INTO server VALUES (116, 103, 104, 103, 'HP DL180 G92x Intel', 2, '$362.99', 'Xeon E5-2630v3');
INSERT INTO server VALUES (117, 103, 104, 103, 'Dell R730XD2x Intel', 2, '$360.99', 'Xeon E5-2630v3');
INSERT INTO server VALUES (118, 103, 102, 103, 'Dell R730XD2x Intel', 4, '$380.99', 'Xeon E5-2630v4');
INSERT INTO server VALUES (119, 103, 104, 103, 'HP DL180 G92x Intel', 2, '$413.99', 'Xeon E5-2650v3');
INSERT INTO server VALUES (120, 103, 104, 103, 'Dell R730XD2x Intel', 2, '$411.99', 'Xeon E5-2650v3');
INSERT INTO server VALUES (121, 103, 102, 103, 'Dell R730XD2x Intel', 4, '$431.99', 'Xeon E5-2650v4');
INSERT INTO server VALUES (122, 104, 104, 103, 'Dell R730XD2x Intel', 2, '$319.99', 'Xeon E5-2620v4');
INSERT INTO server VALUES (123, 104, 104, 102, 'Dell R730XD2x Intel', 2, '$319.99', 'Xeon E5-2620v4');
INSERT INTO server VALUES (124, 102, 106, 105, 'HP DL180G62x Intel', 8, '$170.99', 'Xeon E5620');
INSERT INTO server VALUES (125, 107, 103, 105, 'Dell R5102x Intel', 2, '$165.99', 'Xeon E5620');
INSERT INTO server VALUES (126, 104, 101, 105, 'HP DL380eG82x Intel', 8, '$199.99', 'Xeon E5-2420');
INSERT INTO server VALUES (127, 101, 107, 105, 'HP DL380eG82x Intel', 8, '$206.99', 'Xeon E5-2420');
INSERT INTO server VALUES (128, 102, 103, 105, 'IBM X3650M42x Intel', 2, '$220.99', 'Xeon E5-2620');
INSERT INTO server VALUES (129, 102, 103, 105, 'HP DL380pG82x Intel', 2, '$225.99', 'Xeon E5-2620');
INSERT INTO server VALUES (130, 103, 104, 105, 'HP DL380pG82x Intel', 1, '$297.99', 'Xeon E5-2650');
INSERT INTO server VALUES (131, 102, 106, 102, 'HP DL180G62x Intel', 8, '$170.99', 'Xeon E5620');
INSERT INTO server VALUES (132, 102, 103, 102, 'HP DL380eG82x Intel', 2, '$199.99', 'Xeon E5-2420');
INSERT INTO server VALUES (133, 102, 103, 102, 'IBM X3650M42x Intel', 2, '$220.99', 'Xeon E5-2620');
INSERT INTO server VALUES (134, 102, 103, 104, 'HP DL180G62x Intel', 2, 'S$228.00', 'Xeon E5620');
INSERT INTO server VALUES (135, 102, 103, 105, 'Supermicro SC846Intel', 24, '$421.99', 'Xeon E5620');
INSERT INTO server VALUES (136, 101, 103, 103, 'DL20G9Intel', 2, '$135.99', 'Xeon E3-1270v5');
INSERT INTO server VALUES (137, 107, 103, 104, 'Huawei RH1288v22x Intel', 2, 'S$269.99', 'Xeon E5-2650');
INSERT INTO server VALUES (138, 104, 101, 104, 'Dell R730XD2x Intel', 4, 'S$421.99', 'Xeon E5-2620V4');
INSERT INTO server VALUES (139, 102, 103, 104, 'Huawei RH2288V22x Intel', 2, 'S$239.99', 'Xeon E5-2620');
INSERT INTO server VALUES (140, 103, 102, 106, 'Dell R730XD2x Intel', 4, '€395.99', 'Xeon E5-2650v4');
INSERT INTO server VALUES (141, 104, 104, 106, 'Dell R730XD2x Intel', 2, '€252.99', 'Xeon E5-2620v3');
INSERT INTO server VALUES (142, 103, 104, 106, 'Dell R730XD2x Intel', 2, '€342.99', 'Xeon E5-2650v3');
INSERT INTO server VALUES (143, 103, 104, 106, 'Dell R730XD2x Intel', 2, '€364.99', 'Xeon E5-2670v3');
INSERT INTO server VALUES (144, 103, 104, 102, 'Dell R730XD2x Intel', 2, '$437.99', 'Xeon E5-2670v3');
INSERT INTO server VALUES (145, 104, 104, 105, 'Dell R730XD2x Intel', 2, '$303.99', 'Xeon E5-2620v3');
INSERT INTO server VALUES (146, 103, 104, 105, 'Dell R730XD2x Intel', 2, '$411.99', 'Xeon E5-2650v3');
INSERT INTO server VALUES (147, 102, 101, 106, 'HP DL180G62x Intel', 8, '€99.00', 'Xeon E5620');
INSERT INTO server VALUES (148, 102, 101, 106, 'IBM X36302x Intel', 8, '€99.00', 'Xeon E5620');
INSERT INTO server VALUES (149, 102, 103, 106, 'IBM X3650M42x Intel', 6, '€124.99', 'Xeon E5-2620');
INSERT INTO server VALUES (150, 102, 103, 105, 'Dell R720XD2x Intel', 2, '$225.99', 'Xeon E5-2620');
INSERT INTO server VALUES (151, 102, 101, 106, 'HP DL180G62x Intel', 8, '€187.99', 'Xeon E5620');
INSERT INTO server VALUES (152, 102, 106, 106, 'HP DL380eG82x Intel', 8, '€176.99', 'Xeon E5-2420');
INSERT INTO server VALUES (153, 107, 103, 102, 'HP DL380eG82x Intel', 4, '$183.99', 'Xeon E5-2420');
INSERT INTO server VALUES (154, 102, 103, 107, 'HP DL180G62x Intel', 2, 'S$228.00', 'Xeon E5620');
INSERT INTO server VALUES (155, 107, 103, 102, 'HP DL180G62x Intel', 4, '$175.99', 'Xeon E5620');
INSERT INTO server VALUES (156, 104, 103, 106, 'Dell R720XD2x Intel', 8, '€249.00', 'Xeon E5-2640v2');
INSERT INTO server VALUES (157, 103, 102, 106, 'Dell R730XD2x Intel', 4, '€316.99', 'Xeon E5-2630v4');
INSERT INTO server VALUES (158, 103, 102, 105, 'Dell R730XD2x Intel', 4, '$380.99', 'Xeon E5-2630v4');
INSERT INTO server VALUES (159, 103, 108, 106, 'Dell R730XD2x Intel', 4, '€362.99', 'Xeon E5-2630v4');
INSERT INTO server VALUES (160, 103, 108, 106, 'Dell R730XD2x Intel', 4, '€471.99', 'Xeon E5-2650v4');
INSERT INTO server VALUES (161, 107, 103, 102, 'HP DL180G62x Intel', 4, '$187.99', 'Xeon E5645');
INSERT INTO server VALUES (162, 102, 103, 102, 'Dell R720XD2x Intel', 2, '$225.99', 'Xeon E5-2620');
INSERT INTO server VALUES (163, 103, 104, 104, 'Dell R730XD2x Intel', 2, 'S$545.99', 'Xeon E5-2650V3');
INSERT INTO server VALUES (164, 104, 104, 102, 'Dell R730XD2x Intel', 2, '$303.99', 'Xeon E5-2620v3');
INSERT INTO server VALUES (165, 103, 104, 102, 'Dell R730XD2x Intel', 2, '$411.99', 'Xeon E5-2650v3');
INSERT INTO server VALUES (166, 104, 104, 106, 'HP DL180 G92x Intel', 2, '€254.99', 'Xeon E5-2620v3');
INSERT INTO server VALUES (167, 104, 104, 102, 'HP DL180 G92x Intel', 2, '$305.99', 'Xeon E5-2620v3');
INSERT INTO server VALUES (168, 104, 104, 105, 'HP DL180 G92x Intel', 2, '$305.99', 'Xeon E5-2620v3');
INSERT INTO server VALUES (169, 103, 104, 105, 'HP DL160 G92x Intel', 2, '$382.99', 'Xeon E5-2630v3');
INSERT INTO server VALUES (170, 103, 104, 105, 'Dell R730XD2x Intel', 2, '$437.99', 'Xeon E5-2670v3');
INSERT INTO server VALUES (171, 103, 104, 102, 'HP DL180 G92x Intel', 2, '$362.99', 'Xeon E5-2630v3');
INSERT INTO server VALUES (172, 103, 104, 106, 'HP DL180 G92x Intel', 2, '€318.99', 'Xeon E5-2630v3');
INSERT INTO server VALUES (173, 103, 104, 104, 'Dell R6302x Intel', 2, 'S$555.99', 'Xeon E5-2650v3');
INSERT INTO server VALUES (174, 101, 105, 103, 'HP DL120G7Intel', 2, '$105.99', 'Xeon E3-1230');
INSERT INTO server VALUES (175, 101, 105, 102, 'HP DL120G7Intel', 2, '$105.99', 'Xeon E3-1230');
INSERT INTO server VALUES (176, 101, 105, 105, 'HP DL120G7Intel', 2, '$110.99', 'Xeon E3-1270');
INSERT INTO server VALUES (177, 101, 105, 105, 'HP DL120G7Intel', 2, '$105.99', 'Xeon E3-1230');
INSERT INTO server VALUES (178, 101, 103, 105, 'Dell R210-IIIntel', 2, '$121.99', 'Xeon E3-1270v2');
INSERT INTO server VALUES (179, 105, 105, 102, 'HP', 4, '$49.99', 'DL120G6Intel G6950');
INSERT INTO server VALUES (180, 101, 103, 102, 'HP DL120G7Intel', 2, '$110.99', 'Xeon E3-1270');
INSERT INTO server VALUES (181, 104, 104, 103, 'HP DL120G91x', 2, '$263.99', 'Intel E5-1650v3');
INSERT INTO server VALUES (182, 104, 104, 105, 'HP DL120G91x', 2, '$263.99', 'Intel E5-1650v3');
INSERT INTO server VALUES (183, 104, 104, 107, 'HP DL120G9Intel', 2, 'S$368.99', 'Xeon E5-1650v3');
INSERT INTO server VALUES (184, 104, 104, 104, 'HP DL120G9Intel', 2, 'S$368.99', 'Xeon E5-1650v3');
INSERT INTO server VALUES (185, 104, 104, 104, 'Dell R9304x Intel', 2, 'S$1328.99', 'Xeon E7-4820v3');
INSERT INTO server VALUES (186, 104, 104, 104, 'Dell R9304x Intel', 2, 'S$1516.99', 'Xeon E7-4830v3');
INSERT INTO server VALUES (187, 104, 104, 106, 'Dell R9304x Intel', 2, '€1044.99', 'Xeon E7-4850v3');
INSERT INTO server VALUES (188, 104, 104, 104, 'Dell R9304x Intel', 2, 'S$1787.99', 'Xeon E7-4850v3');
INSERT INTO server VALUES (189, 104, 104, 106, 'Dell R9304x Intel', 2, '€756.99', 'Xeon E7-4820v3');
INSERT INTO server VALUES (190, 104, 104, 106, 'Dell R9304x Intel', 2, '€874.99', 'Xeon E7-4830v3');
INSERT INTO server VALUES (191, 101, 103, 102, 'DL20G9Intel', 2, '$135.99', 'Xeon E3-1270v5');
INSERT INTO server VALUES (192, 101, 103, 102, 'HP DL120G91x', 4, '$176.99', 'Intel E5-1620v3');
INSERT INTO server VALUES (193, 104, 101, 106, 'Dell R730XD2x Intel', 4, '€204.99', 'Xeon E5-2620v4');
INSERT INTO server VALUES (194, 105, 105, 102, 'HP', 4, '$43.99', 'DL120G6Intel G6950');
INSERT INTO server VALUES (195, 101, 103, 104, 'HP DL20 G9Intel', 2, 'S$208.00', 'Xeon E3-1270v5');
INSERT INTO server VALUES (196, 101, 103, 107, 'HP DL20 G9Intel', 2, 'S$208.00', 'Xeon E3-1270v5');
INSERT INTO server VALUES (197, 101, 105, 102, 'Dell R210-IIIntel', 2, '$139.00', 'Xeon E3-1230v2');
INSERT INTO server VALUES (198, 102, 103, 102, 'Supermicro SC846Intel', 24, '$421.99', 'Xeon E5620');
INSERT INTO server VALUES (199, 102, 103, 106, 'Supermicro SC846Intel', 24, '€350.99', 'Xeon E5620');
INSERT INTO server VALUES (200, 101, 103, 106, 'HP DL120G7Intel', 4, '€87.99', 'Xeon E3-1270');
INSERT INTO server VALUES (201, 101, 103, 102, 'HP DL120G7Intel', 4, '$103.99', 'Xeon E3-1230');
INSERT INTO server VALUES (202, 104, 104, 102, 'Supermicro SC8131x', 2, '$233.99', 'Intel E5-1650v2');
INSERT INTO server VALUES (203, 104, 101, 106, 'HP DL120G91x', 4, '€219.99', 'Intel E5-1650v3');
INSERT INTO server VALUES (204, 104, 101, 102, 'HP DL120G91x', 4, '$275.99', 'Intel E5-1650v3');
INSERT INTO server VALUES (205, 101, 103, 102, 'DL20G9Intel', 2, '$135.99', 'Xeon E3-1270v5');
INSERT INTO server VALUES (206, 101, 103, 102, 'HP DL120G7Intel', 4, '$105.99', 'Xeon E3-1240');
INSERT INTO server VALUES (207, 102, 103, 103, 'HP DL120G91x', 4, '$239.99', 'Intel E5-1650v3');
INSERT INTO server VALUES (208, 107, 103, 102, 'HP DL120G6Intel', 2, '$69.99', 'Xeon X3440');
INSERT INTO server VALUES (209, 101, 103, 103, 'DL20G9Intel', 2, '$135.99', 'Xeon E3-1270v5');
INSERT INTO server VALUES (210, 103, 104, 103, 'Dell R730XD2x Intel', 2, '$437.99', 'Xeon E5-2670v3');
INSERT INTO server VALUES (211, 107, 109, 102, 'HP DL120G6Intel', 2, '$69.99', 'Xeon X3440');
INSERT INTO server VALUES (212, 103, 102, 102, 'HP DL380pG82x Intel', 4, '$399.99', 'Xeon E5-2650');
INSERT INTO server VALUES (213, 102, 101, 106, 'HP DL380eG82x Intel', 8, '€142.99', 'Xeon E5-2420');
INSERT INTO server VALUES (214, 102, 104, 106, 'Dell R7202x Intel', 2, '€221.99', 'Xeon E5-2643');
INSERT INTO server VALUES (215, 102, 103, 106, 'Dell R720XD2x Intel', 2, '€187.99', 'Xeon E5-2620');
INSERT INTO server VALUES (216, 104, 101, 106, 'HP DL380eG82x Intel', 8, '€165.99', 'Xeon E5-2420');
INSERT INTO server VALUES (217, 101, 107, 106, 'HP DL380eG82x Intel', 8, '€165.99', 'Xeon E5-2420');
INSERT INTO server VALUES (218, 103, 104, 106, 'HP DL380pG82x Intel', 1, '€247.99', 'Xeon E5-2650');
INSERT INTO server VALUES (219, 102, 103, 102, 'HP DL380pG82x Intel', 2, '$225.99', 'Xeon E5-2620');
INSERT INTO server VALUES (220, 102, 103, 103, 'HP DL380pG82x Intel', 2, '$225.99', 'Xeon E5-2620');
INSERT INTO server VALUES (221, 103, 104, 102, 'HP DL380pG82x Intel', 1, '$297.99', 'Xeon E5-2650');
INSERT INTO server VALUES (222, 103, 104, 103, 'HP DL380pG82x Intel', 1, '$297.99', 'Xeon E5-2650');
INSERT INTO server VALUES (223, 104, 101, 103, 'HP DL380eG82x Intel', 8, '$200.99', 'Xeon E5-2420');
INSERT INTO server VALUES (224, 101, 107, 103, 'HP DL380eG82x Intel', 8, '$200.99', 'Xeon E5-2420');
INSERT INTO server VALUES (225, 102, 103, 103, 'IBM X3650M42x Intel', 2, '$220.99', 'Xeon E5-2620');
INSERT INTO server VALUES (226, 105, 103, 102, 'Dell R5102x Intel', 4, '$104.99', 'Xeon E5504');
INSERT INTO server VALUES (227, 107, 103, 102, 'Dell R5102x Intel', 2, '$165.99', 'Xeon E5620');
INSERT INTO server VALUES (228, 105, 103, 104, 'HP', 4, 'S$119.99', 'DL120G7Intel G850');
INSERT INTO server VALUES (229, 104, 109, 104, 'Dell R6302x Intel', 2, 'S$489.99', 'Xeon E5-2630v4');
INSERT INTO server VALUES (230, 104, 109, 107, 'Dell R6302x Intel', 2, 'S$489.99', 'Xeon E5-2630v4');
INSERT INTO server VALUES (231, 104, 101, 107, 'Dell R730XD2x Intel', 4, 'S$421.99', 'Xeon E5-2620V4');
INSERT INTO server VALUES (232, 104, 101, 104, 'RH2288v32x Intel', 4, 'S$319.99', 'Xeon E5-2620V4');
INSERT INTO server VALUES (233, 103, 102, 104, 'RH2288v32x Intel', 4, 'S$429.99', 'Xeon E5-2650V4');
INSERT INTO server VALUES (234, 107, 103, 104, 'Dell R210-IIIntel', 2, 'S$199.99', 'Xeon E3-1270v2');
INSERT INTO server VALUES (235, 101, 103, 106, 'HP', 4, '€49.99', 'DL120G7Intel G850');
INSERT INTO server VALUES (236, 107, 103, 104, 'Dell R6202x Intel', 2, 'S$319.99', 'Xeon E5-2620v2');
INSERT INTO server VALUES (237, 107, 103, 107, 'Dell R210-IIIntel', 2, 'S$199.99', 'Xeon E3-1270v2');
INSERT INTO server VALUES (238, 101, 105, 106, 'Dell R210-IIIntel', 2, '€74.00', 'Xeon E3-1230v2');
INSERT INTO server VALUES (239, 101, 103, 106, 'HP DL20G9Intel', 2, '€112.99', 'Xeon E3-1270v5');
INSERT INTO server VALUES (240, 101, 103, 106, 'HP DL120G7Intel', 4, '€75.00', 'Xeon E3-1230');
INSERT INTO server VALUES (241, 104, 101, 106, 'HP DL380eG82x Intel', 8, '€142.99', 'Xeon E5-2420');
INSERT INTO server VALUES (242, 101, 105, 102, 'HP DL120G7Intel', 2, '$235.59', 'Xeon E3-1230');
INSERT INTO server VALUES (243, 102, 103, 102, 'IBM X3650M42x Intel', 2, '$350.59', 'Xeon E5-2620');
INSERT INTO server VALUES (244, 102, 103, 102, 'HP DL380pG82x Intel', 2, '$355.59', 'Xeon E5-2620');
INSERT INTO server VALUES (245, 103, 104, 102, 'HP DL380pG82x Intel', 1, '$427.59', 'Xeon E5-2650');
INSERT INTO server VALUES (246, 102, 103, 106, 'IBM X3650M42x Intel', 2, '€295.99', 'Xeon E5-2620');
INSERT INTO server VALUES (247, 103, 104, 106, 'HP DL380pG82x Intel', 1, '€355.99', 'Xeon E5-2650');
INSERT INTO server VALUES (248, 101, 103, 106, 'Dell R210-IIIntel', 2, '€103.99', 'Xeon E3-1270v2');
INSERT INTO server VALUES (249, 101, 103, 103, 'Dell R210-IIIntel', 2, '$151.99', 'Xeon E3-1270v2');
INSERT INTO server VALUES (250, 101, 105, 103, 'HP DL120G7Intel', 2, '$135.99', 'Xeon E3-1230');
INSERT INTO server VALUES (251, 101, 105, 106, 'HP DL120G7Intel', 2, '€94.99', 'Xeon E3-1230');
INSERT INTO server VALUES (252, 103, 102, 102, 'Dell R730XD2x Intel', 4, '$410.99', 'Xeon E5-2630v4');
INSERT INTO server VALUES (253, 105, 103, 102, 'HP', 4, '$97.99', 'DL120G7Intel G850');
INSERT INTO server VALUES (254, 104, 101, 105, 'HP DL380eG82x Intel', 8, '$206.99', 'Xeon E5-2420');
INSERT INTO server VALUES (255, 102, 103, 105, 'Supermicro SC846Intel', 24, '$451.99', 'Xeon E5620');
INSERT INTO server VALUES (256, 102, 103, 107, 'HP DL180G62x Intel', 2, 'S$719.99', 'Xeon E5620');
INSERT INTO server VALUES (257, 104, 104, 102, 'Dell R730XD2x Intel', 2, '$349.99', 'Xeon E5-2620v4');
INSERT INTO server VALUES (258, 103, 102, 102, 'Dell R730XD2x Intel', 4, '$461.99', 'Xeon E5-2650v4');
INSERT INTO server VALUES (259, 101, 103, 102, 'DL20G9Intel', 2, '$169.99', 'Xeon E3-1270v5');
INSERT INTO server VALUES (260, 103, 104, 103, 'HP DL380pG82x Intel', 1, '$327.99', 'Xeon E5-2650');
INSERT INTO server VALUES (261, 104, 104, 106, 'Dell R730XD2x Intel', 2, '€277.99', 'Xeon E5-2620v3');
INSERT INTO server VALUES (262, 103, 104, 106, 'Dell R730XD2x Intel', 2, '€367.99', 'Xeon E5-2650v3');
INSERT INTO server VALUES (263, 103, 104, 106, 'Dell R730XD2x Intel', 2, '€389.99', 'Xeon E5-2670v3');
INSERT INTO server VALUES (264, 104, 104, 105, 'Dell R730XD2x Intel', 2, '$333.99', 'Xeon E5-2620v3');
INSERT INTO server VALUES (265, 103, 104, 105, 'Dell R730XD2x Intel', 2, '$441.99', 'Xeon E5-2650v3');
INSERT INTO server VALUES (266, 103, 104, 102, 'Dell R730XD2x Intel', 2, '$467.99', 'Xeon E5-2670v3');
INSERT INTO server VALUES (267, 102, 106, 105, 'HP DL180G62x Intel', 8, '$200.99', 'Xeon E5620');
INSERT INTO server VALUES (268, 107, 103, 105, 'Dell R5102x Intel', 2, '$195.99', 'Xeon E5620');
INSERT INTO server VALUES (269, 102, 101, 105, 'HP DL180G62x Intel', 8, '$217.99', 'Xeon E5645');
INSERT INTO server VALUES (270, 101, 107, 105, 'HP DL380eG82x Intel', 8, '$367.79', 'Xeon E5-2420');
INSERT INTO server VALUES (271, 102, 103, 105, 'IBM X3650M42x Intel', 2, '$250.99', 'Xeon E5-2620');
INSERT INTO server VALUES (272, 102, 103, 105, 'Dell R720XD2x Intel', 2, '$255.99', 'Xeon E5-2620');
INSERT INTO server VALUES (273, 103, 104, 105, 'HP DL380pG82x Intel', 1, '$327.99', 'Xeon E5-2650');
INSERT INTO server VALUES (274, 102, 106, 102, 'HP DL180G62x Intel', 8, '$200.99', 'Xeon E5620');
INSERT INTO server VALUES (275, 107, 103, 102, 'Dell R5102x Intel', 2, '$195.99', 'Xeon E5620');
INSERT INTO server VALUES (276, 103, 102, 106, 'Dell R730XD2x Intel', 4, '€341.99', 'Xeon E5-2630v4');
INSERT INTO server VALUES (277, 103, 102, 105, 'Dell R730XD2x Intel', 4, '$410.99', 'Xeon E5-2630v4');
INSERT INTO server VALUES (278, 102, 103, 105, 'HP DL380pG82x Intel', 2, '$255.99', 'Xeon E5-2620');
INSERT INTO server VALUES (279, 103, 104, 103, 'HP DL380pG82x Intel', 1, '$327.99', 'Xeon E5-2650');
INSERT INTO server VALUES (280, 102, 103, 103, 'HP DL380pG82x Intel', 2, '$255.99', 'Xeon E5-2620');
INSERT INTO server VALUES (281, 103, 104, 102, 'HP DL380pG82x Intel', 1, '$327.99', 'Xeon E5-2650');
INSERT INTO server VALUES (282, 102, 103, 102, 'Dell R720XD2x Intel', 2, '$255.99', 'Xeon E5-2620');
INSERT INTO server VALUES (283, 101, 103, 102, 'IBM X36302x Intel', 2, '$202.99', 'Xeon E5620');
INSERT INTO server VALUES (284, 102, 103, 102, 'IBM X3650M42x Intel', 2, '$250.99', 'Xeon E5-2620');
INSERT INTO server VALUES (285, 102, 103, 102, 'HP DL380pG82x Intel', 2, '$255.99', 'Xeon E5-2620');
INSERT INTO server VALUES (286, 101, 107, 102, 'HP DL380eG82x Intel', 8, '$367.79', 'Xeon E5-2420');
INSERT INTO server VALUES (287, 101, 107, 103, 'HP DL380eG82x Intel', 8, '$200.99', 'Xeon E5-2420');
INSERT INTO server VALUES (288, 102, 103, 103, 'IBM X3650M42x Intel', 2, '$250.99', 'Xeon E5-2620');
INSERT INTO server VALUES (289, 104, 104, 102, 'Dell R730XD2x Intel', 2, '$333.99', 'Xeon E5-2620v3');
INSERT INTO server VALUES (290, 103, 104, 102, 'Dell R730XD2x Intel', 2, '$441.99', 'Xeon E5-2650v3');
INSERT INTO server VALUES (291, 104, 104, 106, 'HP DL180 G92x Intel', 2, '€279.99', 'Xeon E5-2620v3');
INSERT INTO server VALUES (292, 104, 104, 102, 'HP DL180 G92x Intel', 2, '$335.99', 'Xeon E5-2620v3');
INSERT INTO server VALUES (293, 104, 104, 105, 'HP DL180 G92x Intel', 2, '$335.99', 'Xeon E5-2620v3');
INSERT INTO server VALUES (294, 103, 104, 105, 'HP DL160 G92x Intel', 2, '$412.99', 'Xeon E5-2630v3');
INSERT INTO server VALUES (295, 103, 104, 105, 'Dell R730XD2x Intel', 2, '$467.99', 'Xeon E5-2670v3');
INSERT INTO server VALUES (296, 103, 104, 106, 'HP DL180 G92x Intel', 2, '€343.99', 'Xeon E5-2630v3');
INSERT INTO server VALUES (297, 103, 104, 102, 'HP DL180 G92x Intel', 2, '$412.99', 'Xeon E5-2630v3');
INSERT INTO server VALUES (298, 101, 103, 106, 'HP DL120G7Intel', 2, '€99.99', 'Xeon E3-1270');
INSERT INTO server VALUES (299, 105, 105, 102, 'HP', 4, '$79.99', 'DL120G6Intel G6950');
INSERT INTO server VALUES (300, 101, 105, 105, 'HP DL120G7Intel', 2, '$135.99', 'Xeon E3-1230');
INSERT INTO server VALUES (301, 101, 105, 105, 'HP DL120G7Intel', 2, '$140.99', 'Xeon E3-1270');
INSERT INTO server VALUES (302, 104, 104, 103, 'Supermicro SC813MTQIntel', 2, '$233.99', 'Xeon E5-1650v2');
INSERT INTO server VALUES (303, 104, 104, 102, 'Supermicro SC813MTQIntel', 2, '$233.99', 'Xeon E5-1650v2');
INSERT INTO server VALUES (304, 107, 103, 102, 'HP DL120G6Intel', 2, '$99.99', 'Xeon X3440');
INSERT INTO server VALUES (305, 101, 103, 105, 'Dell R210-IIIntel', 2, '$151.99', 'Xeon E3-1270v2');
INSERT INTO server VALUES (306, 104, 104, 105, 'Supermicro SC813MTQIntel', 2, '$233.99', 'Xeon E5-1650v2');
INSERT INTO server VALUES (307, 101, 103, 102, 'HP DL120G7Intel', 2, '$140.99', 'Xeon E3-1270');
INSERT INTO server VALUES (308, 101, 105, 102, 'HP DL120G7Intel', 2, '$135.99', 'Xeon E3-1230');
INSERT INTO server VALUES (309, 104, 104, 104, 'Dell R9304x Intel', 2, 'S$1953.99', 'Xeon E7-4820v3');
INSERT INTO server VALUES (310, 104, 104, 104, 'Dell R9304x Intel', 2, 'S$2141.99', 'Xeon E7-4830v3');
INSERT INTO server VALUES (311, 104, 104, 106, 'Dell R9304x Intel', 2, '€1069.99', 'Xeon E7-4850v3');
INSERT INTO server VALUES (312, 104, 104, 104, 'Dell R9304x Intel', 2, 'S$2412.99', 'Xeon E7-4850v3');
INSERT INTO server VALUES (313, 104, 104, 106, 'Dell R9304x Intel', 2, '€781.99', 'Xeon E7-4820v3');
INSERT INTO server VALUES (314, 104, 104, 106, 'Dell R9304x Intel', 2, '€899.99', 'Xeon E7-4830v3');
INSERT INTO server VALUES (315, 102, 103, 102, 'Supermicro SC846Intel', 24, '$451.99', 'Xeon E5620');
INSERT INTO server VALUES (316, 102, 103, 106, 'Supermicro SC846Intel', 24, '€375.99', 'Xeon E5620');
INSERT INTO server VALUES (317, 101, 105, 106, 'Dell R210-IIIntel', 2, '€96.99', 'Xeon E3-1230v2');
INSERT INTO server VALUES (318, 103, 104, 106, 'HP DL380pG82x Intel', 1, '€272.99', 'Xeon E5-2650');
INSERT INTO server VALUES (319, 102, 106, 106, 'HP DL180G62x Intel', 8, '€166.99', 'Xeon E5620');
INSERT INTO server VALUES (320, 101, 107, 106, 'HP DL380eG82x Intel', 8, '€190.99', 'Xeon E5-2420');
INSERT INTO server VALUES (321, 102, 103, 106, 'Dell R720XD2x Intel', 2, '€212.99', 'Xeon E5-2620');
INSERT INTO server VALUES (322, 102, 104, 106, 'Dell R7202x Intel', 2, '€246.99', 'Xeon E5-2643');
INSERT INTO server VALUES (323, 104, 101, 106, 'HP DL380eG82x Intel', 8, '€190.99', 'Xeon E5-2420');
INSERT INTO server VALUES (324, 104, 101, 102, 'HP DL380eG82x Intel', 8, '$230.99', 'Xeon E5-2420');
INSERT INTO server VALUES (325, 102, 103, 104, 'HP DL180G62x Intel', 2, 'S$719.99', 'Xeon E5620');
INSERT INTO server VALUES (326, 107, 103, 102, 'HP DL180G62x Intel', 4, '$143.99', 'Xeon E5620');
INSERT INTO server VALUES (327, 101, 105, 103, 'HP DL120G7Intel', 2, '$111.99', 'Xeon E3-1230');
INSERT INTO server VALUES (328, 107, 105, 102, 'Dell R210Intel', 2, '$61.99', 'Xeon X3430');
INSERT INTO server VALUES (329, 101, 103, 103, 'Dell R210-IIIntel', 2, '$127.99', 'Xeon E3-1270v2');
INSERT INTO server VALUES (330, 101, 105, 102, 'HP DL120G7Intel', 2, '$111.99', 'Xeon E3-1230');
INSERT INTO server VALUES (331, 101, 103, 102, 'HP DL120G7Intel', 2, '$116.99', 'Xeon E3-1270');
INSERT INTO server VALUES (332, 103, 102, 102, 'Dell R730XD2x Intel', 4, '$386.99', 'Xeon E5-2630v4');
INSERT INTO server VALUES (333, 102, 106, 105, 'HP DL180G62x Intel', 8, '$176.99', 'Xeon E5620');
INSERT INTO server VALUES (334, 107, 103, 105, 'Dell R5102x Intel', 2, '$171.99', 'Xeon E5620');
INSERT INTO server VALUES (335, 102, 101, 105, 'HP DL180G62x Intel', 8, '$193.99', 'Xeon E5645');
INSERT INTO server VALUES (336, 104, 101, 105, 'HP DL380eG82x Intel', 8, '$230.99', 'Xeon E5-2420');
INSERT INTO server VALUES (337, 101, 107, 105, 'HP DL380eG82x Intel', 8, '$230.99', 'Xeon E5-2420');
INSERT INTO server VALUES (338, 102, 103, 105, 'IBM X3650M42x Intel', 2, '$226.99', 'Xeon E5-2620');
INSERT INTO server VALUES (339, 102, 103, 105, 'HP DL380pG82x Intel', 2, '$231.99', 'Xeon E5-2620');
INSERT INTO server VALUES (340, 103, 104, 105, 'HP DL380pG82x Intel', 1, '$303.99', 'Xeon E5-2650');
INSERT INTO server VALUES (341, 102, 103, 105, 'Supermicro SC846Intel', 24, '$427.99', 'Xeon E5620');
INSERT INTO server VALUES (342, 102, 103, 107, 'HP DL180G62x Intel', 2, 'S$569.99', 'Xeon E5620');
INSERT INTO server VALUES (343, 102, 101, 106, 'HP DL180G62x Intel', 8, '€146.99', 'Xeon E5620');
INSERT INTO server VALUES (344, 104, 104, 102, 'Dell R730XD2x Intel', 2, '$464.99', 'Xeon E5-2620v4');
INSERT INTO server VALUES (345, 103, 102, 102, 'Dell R730XD2x Intel', 4, '$576.99', 'Xeon E5-2650v4');
INSERT INTO server VALUES (346, 101, 103, 102, 'DL20G9Intel', 2, '$280.99', 'Xeon E3-1270v5');
INSERT INTO server VALUES (347, 104, 104, 106, 'Dell R730XD2x Intel', 2, '€257.99', 'Xeon E5-2620v3');
INSERT INTO server VALUES (348, 103, 104, 106, 'Dell R730XD2x Intel', 2, '€347.99', 'Xeon E5-2650v3');
INSERT INTO server VALUES (349, 104, 104, 105, 'Dell R730XD2x Intel', 2, '$309.99', 'Xeon E5-2620v3');
INSERT INTO server VALUES (350, 103, 104, 105, 'Dell R730XD2x Intel', 2, '$417.99', 'Xeon E5-2650v3');
INSERT INTO server VALUES (351, 103, 104, 102, 'Dell R730XD2x Intel', 2, '$443.99', 'Xeon E5-2670v3');
INSERT INTO server VALUES (352, 103, 104, 106, 'Dell R730XD2x Intel', 2, '€369.99', 'Xeon E5-2670v3');
INSERT INTO server VALUES (353, 102, 103, 105, 'Dell R720XD2x Intel', 2, '$231.99', 'Xeon E5-2620');
INSERT INTO server VALUES (354, 104, 103, 106, 'Dell R720XD2x Intel', 8, '€279.00', 'Xeon E5-2640v2');
INSERT INTO server VALUES (355, 103, 102, 106, 'Dell R730XD2x Intel', 4, '€321.99', 'Xeon E5-2630v4');
INSERT INTO server VALUES (356, 103, 102, 105, 'Dell R730XD2x Intel', 4, '$386.99', 'Xeon E5-2630v4');
INSERT INTO server VALUES (357, 102, 103, 102, 'Dell R720XD2x Intel', 2, '$231.99', 'Xeon E5-2620');
INSERT INTO server VALUES (358, 102, 103, 104, 'HP DL180G62x Intel', 2, 'S$569.99', 'Xeon E5620');
INSERT INTO server VALUES (359, 104, 104, 102, 'Dell R730XD2x Intel', 2, '$309.99', 'Xeon E5-2620v3');
INSERT INTO server VALUES (360, 103, 104, 102, 'Dell R730XD2x Intel', 2, '$417.99', 'Xeon E5-2650v3');
INSERT INTO server VALUES (361, 103, 104, 106, 'HP DL160 G92x Intel', 2, '€323.99', 'Xeon E5-2630v3');
INSERT INTO server VALUES (362, 104, 104, 106, 'HP DL180 G92x Intel', 2, '€259.99', 'Xeon E5-2620v3');
INSERT INTO server VALUES (363, 104, 104, 102, 'HP DL180 G92x Intel', 2, '$311.99', 'Xeon E5-2620v3');
INSERT INTO server VALUES (364, 103, 104, 102, 'HP DL160 G92x Intel', 2, '$388.99', 'Xeon E5-2630v3');
INSERT INTO server VALUES (365, 104, 104, 105, 'HP DL180 G92x Intel', 2, '$311.99', 'Xeon E5-2620v3');
INSERT INTO server VALUES (366, 103, 104, 105, 'HP DL160 G92x Intel', 2, '$388.99', 'Xeon E5-2630v3');
INSERT INTO server VALUES (367, 103, 104, 105, 'Dell R730XD2x Intel', 2, '$443.99', 'Xeon E5-2670v3');
INSERT INTO server VALUES (368, 101, 103, 106, 'HP DL120G7Intel', 2, '€96.99', 'Xeon E3-1270');
INSERT INTO server VALUES (369, 101, 105, 105, 'HP DL120G7Intel', 2, '$111.99', 'Xeon E3-1230');
INSERT INTO server VALUES (370, 101, 105, 105, 'HP DL120G7Intel', 2, '$116.99', 'Xeon E3-1270');
INSERT INTO server VALUES (371, 104, 104, 102, 'Supermicro SC813MTQIntel', 2, '$209.99', 'Xeon E5-1650v2');
INSERT INTO server VALUES (372, 107, 103, 102, 'HP DL120G6Intel', 2, '$75.99', 'Xeon X3440');
INSERT INTO server VALUES (373, 101, 103, 105, 'Dell R210-IIIntel', 2, '$127.99', 'Xeon E3-1270v2');
INSERT INTO server VALUES (374, 104, 104, 105, 'Supermicro SC813MTQIntel', 2, '$209.99', 'Xeon E5-1650v2');
INSERT INTO server VALUES (375, 101, 105, 106, 'HP DL120G7Intel', 2, '€92.99', 'Xeon E3-1230');
INSERT INTO server VALUES (376, 105, 105, 102, 'HP', 4, '$55.99', 'DL120G6Intel G6950');
INSERT INTO server VALUES (377, 104, 104, 103, 'Supermicro SC813MTQIntel', 2, '$209.99', 'Xeon E5-1650v2');
INSERT INTO server VALUES (378, 104, 104, 104, 'Dell R9304x Intel', 2, 'S$1553.99', 'Xeon E7-4820v3');
INSERT INTO server VALUES (379, 104, 104, 104, 'Dell R9304x Intel', 2, 'S$1741.99', 'Xeon E7-4830v3');
INSERT INTO server VALUES (380, 104, 104, 106, 'Dell R9304x Intel', 2, '€1049.99', 'Xeon E7-4850v3');
INSERT INTO server VALUES (381, 104, 104, 104, 'Dell R9304x Intel', 2, 'S$2012.99', 'Xeon E7-4850v3');
INSERT INTO server VALUES (382, 104, 104, 106, 'Dell R9304x Intel', 2, '€761.99', 'Xeon E7-4820v3');
INSERT INTO server VALUES (383, 104, 104, 106, 'Dell R9304x Intel', 2, '€879.99', 'Xeon E7-4830v3');
INSERT INTO server VALUES (384, 102, 103, 102, 'Supermicro SC846Intel', 24, '$427.99', 'Xeon E5620');
INSERT INTO server VALUES (385, 102, 103, 106, 'Supermicro SC846Intel', 24, '€355.99', 'Xeon E5620');
INSERT INTO server VALUES (386, 102, 104, 106, 'Dell R7202x Intel', 2, '€226.99', 'Xeon E5-2643');
INSERT INTO server VALUES (387, 102, 103, 106, 'Dell R720XD2x Intel', 2, '€192.99', 'Xeon E5-2620');
INSERT INTO server VALUES (388, 103, 104, 106, 'HP DL380pG82x Intel', 1, '€252.99', 'Xeon E5-2650');
INSERT INTO server VALUES (389, 101, 107, 106, 'HP DL380eG82x Intel', 8, '€170.99', 'Xeon E5-2420');
INSERT INTO server VALUES (390, 104, 101, 106, 'HP DL380eG82x Intel', 8, '€170.99', 'Xeon E5-2420');
INSERT INTO server VALUES (391, 104, 101, 103, 'HP DL380eG82x Intel', 8, '$200.99', 'Xeon E5-2420');
INSERT INTO server VALUES (392, 101, 107, 103, 'HP DL380eG82x Intel', 8, '$200.99', 'Xeon E5-2420');
INSERT INTO server VALUES (393, 102, 103, 103, 'IBM X3650M42x Intel', 2, '$226.99', 'Xeon E5-2620');
INSERT INTO server VALUES (394, 105, 103, 102, 'Dell R5102x Intel', 4, '$110.99', 'Xeon E5504');
INSERT INTO server VALUES (395, 102, 106, 102, 'HP DL180G62x Intel', 8, '$176.99', 'Xeon E5620');
INSERT INTO server VALUES (396, 102, 101, 102, 'HP DL180G62x Intel', 8, '$193.99', 'Xeon E5645');
INSERT INTO server VALUES (397, 104, 101, 102, 'HP DL380eG82x Intel', 8, '$200.99', 'Xeon E5-2420');
INSERT INTO server VALUES (398, 101, 107, 102, 'HP DL380eG82x Intel', 8, '$230.99', 'Xeon E5-2420');
INSERT INTO server VALUES (399, 102, 103, 102, 'HP DL380pG82x Intel', 2, '$231.99', 'Xeon E5-2620');
INSERT INTO server VALUES (400, 102, 103, 103, 'HP DL380pG82x Intel', 2, '$231.99', 'Xeon E5-2620');
INSERT INTO server VALUES (401, 103, 104, 102, 'HP DL380pG82x Intel', 1, '$303.99', 'Xeon E5-2650');
INSERT INTO server VALUES (402, 103, 104, 103, 'HP DL380pG82x Intel', 1, '$303.99', 'Xeon E5-2650');
INSERT INTO server VALUES (403, 102, 103, 102, 'IBM X3650M42x Intel', 2, '$226.99', 'Xeon E5-2620');
INSERT INTO server VALUES (404, 107, 103, 102, 'Dell R5102x Intel', 2, '$171.99', 'Xeon E5620');
INSERT INTO server VALUES (405, 105, 105, 102, 'HP DL120G6Intel', 2, '$236.79', 'Xeon X3440');
INSERT INTO server VALUES (406, 101, 105, 102, 'HP DL120G7Intel', 2, '$272.79', 'Xeon E3-1230');
INSERT INTO server VALUES (407, 101, 103, 102, 'HP DL120G7Intel', 2, '$277.79', 'Xeon E3-1270');
INSERT INTO server VALUES (408, 101, 103, 103, 'Dell R210-IIIntel', 2, '$288.79', 'Xeon E3-1270v2');
INSERT INTO server VALUES (409, 101, 101, 102, 'Dell R210Intel', 2, '$237.79', 'Xeon X3440');
INSERT INTO server VALUES (410, 101, 105, 103, 'HP DL120G7Intel', 2, '$272.79', 'Xeon E3-1230');
INSERT INTO server VALUES (411, 107, 105, 102, 'Dell R210Intel', 2, '$222.79', 'Xeon X3430');
INSERT INTO server VALUES (412, 101, 105, 106, 'HP DL120G7Intel', 2, '€226.99', 'Xeon E3-1230');
INSERT INTO server VALUES (413, 101, 103, 106, 'HP DL120G7Intel', 2, '€230.99', 'Xeon E3-1270');
INSERT INTO server VALUES (414, 103, 102, 102, 'Dell R730XD2x Intel', 4, '$547.79', 'Xeon E5-2630v4');
INSERT INTO server VALUES (415, 107, 103, 105, 'Dell R5102x Intel', 2, '$332.79', 'Xeon E5620');
INSERT INTO server VALUES (416, 102, 106, 105, 'HP DL180G62x Intel', 8, '$337.79', 'Xeon E5620');
INSERT INTO server VALUES (417, 102, 101, 105, 'HP DL180G62x Intel', 8, '$354.79', 'Xeon E5645');
INSERT INTO server VALUES (418, 104, 101, 105, 'HP DL380eG82x Intel', 8, '$367.79', 'Xeon E5-2420');
INSERT INTO server VALUES (419, 101, 107, 105, 'HP DL380eG82x Intel', 8, '$367.79', 'Xeon E5-2420');
INSERT INTO server VALUES (420, 102, 103, 105, 'IBM X3650M42x Intel', 2, '$387.79', 'Xeon E5-2620');
INSERT INTO server VALUES (421, 102, 103, 105, 'HP DL380pG82x Intel', 2, '$392.79', 'Xeon E5-2620');
INSERT INTO server VALUES (422, 103, 104, 105, 'HP DL380pG82x Intel', 1, '$464.79', 'Xeon E5-2650');
INSERT INTO server VALUES (423, 102, 103, 105, 'Supermicro SC846Intel', 24, '$588.79', 'Xeon E5620');
INSERT INTO server VALUES (424, 104, 104, 102, 'Dell R730XD2x Intel', 2, '$994.99', 'Xeon E5-2620v4');
INSERT INTO server VALUES (425, 103, 102, 102, 'Dell R730XD2x Intel', 4, '$1106.99', 'Xeon E5-2650v4');
INSERT INTO server VALUES (426, 101, 103, 102, 'DL20G9Intel', 2, '$810.99', 'Xeon E3-1270v5');
INSERT INTO server VALUES (427, 103, 102, 102, 'Dell R730XD2x Intel', 4, '$1055.99', 'Xeon E5-2630v4');
INSERT INTO server VALUES (428, 104, 104, 106, 'Dell R730XD2x Intel', 2, '€391.99', 'Xeon E5-2620v3');
INSERT INTO server VALUES (429, 103, 104, 106, 'Dell R730XD2x Intel', 2, '€481.99', 'Xeon E5-2650v3');
INSERT INTO server VALUES (430, 103, 104, 105, 'Dell R730XD2x Intel', 2, '$578.79', 'Xeon E5-2650v3');
INSERT INTO server VALUES (431, 104, 104, 105, 'Dell R730XD2x Intel', 2, '$470.79', 'Xeon E5-2620v3');
INSERT INTO server VALUES (432, 103, 104, 106, 'Dell R730XD2x Intel', 2, '€503.99', 'Xeon E5-2670v3');
INSERT INTO server VALUES (433, 103, 104, 102, 'Dell R730XD2x Intel', 2, '$604.79', 'Xeon E5-2670v3');
INSERT INTO server VALUES (434, 102, 103, 105, 'Dell R720XD2x Intel', 2, '$392.79', 'Xeon E5-2620');
INSERT INTO server VALUES (435, 103, 102, 106, 'Dell R730XD2x Intel', 4, '€455.99', 'Xeon E5-2630v4');
INSERT INTO server VALUES (436, 103, 102, 105, 'Dell R730XD2x Intel', 4, '$547.79', 'Xeon E5-2630v4');
INSERT INTO server VALUES (437, 101, 103, 102, 'IBM X36302x Intel', 2, '$339.79', 'Xeon E5620');
INSERT INTO server VALUES (438, 102, 103, 103, 'HP DL380pG82x Intel', 2, '$392.79', 'Xeon E5-2620');
INSERT INTO server VALUES (439, 103, 104, 103, 'HP DL380pG82x Intel', 1, '$464.79', 'Xeon E5-2650');
INSERT INTO server VALUES (440, 102, 103, 102, 'Dell R720XD2x Intel', 2, '$392.79', 'Xeon E5-2620');
INSERT INTO server VALUES (441, 104, 104, 102, 'Dell R730XD2x Intel', 2, '$470.79', 'Xeon E5-2620v3');
INSERT INTO server VALUES (442, 103, 104, 102, 'Dell R730XD2x Intel', 2, '$578.79', 'Xeon E5-2650v3');
INSERT INTO server VALUES (443, 103, 104, 106, 'HP DL160 G92x Intel', 2, '€457.99', 'Xeon E5-2630v3');
INSERT INTO server VALUES (444, 104, 104, 106, 'HP DL180 G92x Intel', 2, '€393.99', 'Xeon E5-2620v3');
INSERT INTO server VALUES (445, 104, 104, 102, 'HP DL180 G92x Intel', 2, '$472.79', 'Xeon E5-2620v3');
INSERT INTO server VALUES (446, 104, 104, 105, 'HP DL180 G92x Intel', 2, '$472.79', 'Xeon E5-2620v3');
INSERT INTO server VALUES (447, 103, 104, 105, 'HP DL160 G92x Intel', 2, '$549.79', 'Xeon E5-2630v3');
INSERT INTO server VALUES (448, 103, 104, 105, 'Dell R730XD2x Intel', 2, '$604.79', 'Xeon E5-2670v3');
INSERT INTO server VALUES (449, 103, 104, 102, 'HP DL180 G92x Intel', 2, '$549.79', 'Xeon E5-2630v3');
INSERT INTO server VALUES (450, 104, 104, 102, 'Supermicro SC813MTQIntel', 2, '$370.79', 'Xeon E5-1650v2');
INSERT INTO server VALUES (451, 104, 104, 103, 'Supermicro SC813MTQIntel', 2, '$370.79', 'Xeon E5-1650v2');
INSERT INTO server VALUES (452, 101, 105, 105, 'HP DL120G7Intel', 2, '$272.79', 'Xeon E3-1230');
INSERT INTO server VALUES (453, 101, 103, 105, 'HP DL120G7Intel', 2, '$277.79', 'Xeon E3-1270');
INSERT INTO server VALUES (454, 101, 103, 105, 'Dell R210-IIIntel', 2, '$288.79', 'Xeon E3-1270v2');
INSERT INTO server VALUES (455, 104, 104, 105, 'Supermicro SC813MTQIntel', 2, '$370.79', 'Xeon E5-1650v2');
INSERT INTO server VALUES (456, 105, 105, 102, 'HP', 4, '$216.79', 'DL120G6Intel G6950');
INSERT INTO server VALUES (457, 104, 104, 104, 'Dell R9304x Intel', 2, 'S$4203.99', 'Xeon E7-4820v3');
INSERT INTO server VALUES (458, 104, 104, 104, 'Dell R9304x Intel', 2, 'S$4391.99', 'Xeon E7-4830v3');
INSERT INTO server VALUES (459, 104, 104, 106, 'Dell R9304x Intel', 2, '€1183.99', 'Xeon E7-4850v3');
INSERT INTO server VALUES (460, 104, 104, 104, 'Dell R9304x Intel', 2, 'S$4662.99', 'Xeon E7-4850v3');
INSERT INTO server VALUES (461, 104, 104, 106, 'Dell R9304x Intel', 2, '€895.99', 'Xeon E7-4820v3');
INSERT INTO server VALUES (462, 104, 104, 106, 'Dell R9304x Intel', 2, '€1013.99', 'Xeon E7-4830v3');
INSERT INTO server VALUES (463, 102, 103, 102, 'Supermicro SC846Intel', 24, '$588.79', 'Xeon E5620');
INSERT INTO server VALUES (464, 102, 103, 106, 'Supermicro SC846Intel', 24, '€489.99', 'Xeon E5620');
INSERT INTO server VALUES (465, 102, 104, 106, 'Dell R7202x Intel', 2, '€360.99', 'Xeon E5-2643');
INSERT INTO server VALUES (466, 102, 103, 106, 'Dell R720XD2x Intel', 2, '€326.99', 'Xeon E5-2620');
INSERT INTO server VALUES (467, 102, 106, 106, 'HP DL180G62x Intel', 8, '€280.99', 'Xeon E5620');
INSERT INTO server VALUES (468, 101, 107, 106, 'HP DL380eG82x Intel', 8, '€304.99', 'Xeon E5-2420');
INSERT INTO server VALUES (469, 103, 104, 106, 'HP DL380pG82x Intel', 1, '€386.99', 'Xeon E5-2650');
INSERT INTO server VALUES (470, 101, 107, 103, 'HP DL380eG82x Intel', 8, '$367.79', 'Xeon E5-2420');
INSERT INTO server VALUES (471, 102, 103, 103, 'IBM X3650M42x Intel', 2, '$387.79', 'Xeon E5-2620');
INSERT INTO server VALUES (472, 105, 103, 102, 'Dell R5102x Intel', 4, '$271.79', 'Xeon E5504');
INSERT INTO server VALUES (473, 107, 103, 102, 'Dell R5102x Intel', 2, '$332.79', 'Xeon E5620');
INSERT INTO server VALUES (474, 102, 106, 102, 'HP DL180G62x Intel', 8, '$337.79', 'Xeon E5620');
INSERT INTO server VALUES (475, 102, 101, 102, 'HP DL180G62x Intel', 8, '$354.79', 'Xeon E5645');
INSERT INTO server VALUES (476, 101, 107, 102, 'HP DL380eG82x Intel', 8, '$367.79', 'Xeon E5-2420');
INSERT INTO server VALUES (477, 102, 103, 102, 'HP DL380pG82x Intel', 2, '$392.79', 'Xeon E5-2620');
INSERT INTO server VALUES (478, 103, 104, 102, 'HP DL380pG82x Intel', 1, '$464.79', 'Xeon E5-2650');
INSERT INTO server VALUES (479, 102, 103, 102, 'IBM X3650M42x Intel', 2, '$387.79', 'Xeon E5-2620');
INSERT INTO server VALUES (480, 107, 105, 102, 'HP DL120G7Intel', 4, '$2169.99', 'Xeon E3-1230');
INSERT INTO server VALUES (481, 107, 103, 105, 'HP DL380pG82x Intel', 4, '$2289.99', 'Xeon E5-2620');
INSERT INTO server VALUES (482, 107, 103, 105, 'HP DL380pG82x Intel', 4, '$2361.99', 'Xeon E5-2650');
INSERT INTO server VALUES (483, 107, 105, 105, 'HP DL120G7Intel', 4, '$2169.99', 'Xeon E3-1230');
INSERT INTO server VALUES (484, 107, 103, 106, 'HP DL380pG82x Intel', 4, '€1967.99', 'Xeon E5-2650');
INSERT INTO server VALUES (485, 107, 103, 102, 'HP DL380pG82x Intel', 4, '$2289.99', 'Xeon E5-2620');
INSERT INTO server VALUES (486, 107, 103, 102, 'HP DL380pG82x Intel', 4, '$2361.99', 'Xeon E5-2650');


--
-- Name: sq_hdd; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_hdd', 101, true);


--
-- Name: sq_hdd_type; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_hdd_type', 101, true);


--
-- Name: sq_location; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_location', 101, true);


--
-- Name: sq_ram; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_ram', 101, true);


--
-- Name: sq_ram_type; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_ram_type', 101, true);


--
-- Name: sq_server; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_server', 401, true);


--
-- Name: hdd_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY hdd
    ADD CONSTRAINT hdd_pkey PRIMARY KEY (id_hdd);


--
-- Name: hdd_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY hdd_type
    ADD CONSTRAINT hdd_type_pkey PRIMARY KEY (id_hdd_type);


--
-- Name: location_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY location
    ADD CONSTRAINT location_pkey PRIMARY KEY (id_location);


--
-- Name: ram_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ram
    ADD CONSTRAINT ram_pkey PRIMARY KEY (id_ram);


--
-- Name: ram_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ram_type
    ADD CONSTRAINT ram_type_pkey PRIMARY KEY (id_ram_type);


--
-- Name: server_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY server
    ADD CONSTRAINT server_pkey PRIMARY KEY (id_server);


--
-- Name: idx_5a6dd5f61f698536; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_5a6dd5f61f698536 ON server USING btree (fk_hdd);


--
-- Name: idx_5a6dd5f66cb6ca15; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_5a6dd5f66cb6ca15 ON server USING btree (fk_location);


--
-- Name: idx_5a6dd5f6a73ef71; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_5a6dd5f6a73ef71 ON server USING btree (fk_ram);


--
-- Name: idx_e7d1222f370d81a0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_e7d1222f370d81a0 ON ram USING btree (fk_ram_type);


--
-- Name: idx_f2cb4868af41d22c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_f2cb4868af41d22c ON hdd USING btree (fk_hdd_type);


--
-- Name: fk_5a6dd5f61f698536; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY server
    ADD CONSTRAINT fk_5a6dd5f61f698536 FOREIGN KEY (fk_hdd) REFERENCES hdd(id_hdd);


--
-- Name: fk_5a6dd5f66cb6ca15; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY server
    ADD CONSTRAINT fk_5a6dd5f66cb6ca15 FOREIGN KEY (fk_location) REFERENCES location(id_location);


--
-- Name: fk_5a6dd5f6a73ef71; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY server
    ADD CONSTRAINT fk_5a6dd5f6a73ef71 FOREIGN KEY (fk_ram) REFERENCES ram(id_ram);


--
-- Name: fk_e7d1222f370d81a0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ram
    ADD CONSTRAINT fk_e7d1222f370d81a0 FOREIGN KEY (fk_ram_type) REFERENCES ram_type(id_ram_type);


--
-- Name: fk_f2cb4868af41d22c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY hdd
    ADD CONSTRAINT fk_f2cb4868af41d22c FOREIGN KEY (fk_hdd_type) REFERENCES hdd_type(id_hdd_type);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

