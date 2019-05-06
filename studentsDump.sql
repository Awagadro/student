--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.0

-- Started on 2019-05-06 15:53:19

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2816 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 199 (class 1259 OID 27062)
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE groups (
    group_id integer NOT NULL,
    group_name character varying NOT NULL,
    curator character varying NOT NULL,
    speciality character varying NOT NULL
);


ALTER TABLE groups OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 27060)
-- Name: groups_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE groups_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE groups_group_id_seq OWNER TO postgres;

--
-- TOC entry 2817 (class 0 OID 0)
-- Dependencies: 198
-- Name: groups_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE groups_group_id_seq OWNED BY groups.group_id;


--
-- TOC entry 197 (class 1259 OID 27051)
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE students (
    student_id integer NOT NULL,
    first_name character varying NOT NULL,
    sur_name character varying NOT NULL,
    patronymic character varying NOT NULL,
    date_of_birth date NOT NULL,
    sex character(1) NOT NULL,
    education_year integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE students OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 27049)
-- Name: students_student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE students_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE students_student_id_seq OWNER TO postgres;

--
-- TOC entry 2818 (class 0 OID 0)
-- Dependencies: 196
-- Name: students_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE students_student_id_seq OWNED BY students.student_id;


--
-- TOC entry 2679 (class 2604 OID 27065)
-- Name: groups group_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY groups ALTER COLUMN group_id SET DEFAULT nextval('groups_group_id_seq'::regclass);


--
-- TOC entry 2678 (class 2604 OID 27054)
-- Name: students student_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY students ALTER COLUMN student_id SET DEFAULT nextval('students_student_id_seq'::regclass);


--
-- TOC entry 2809 (class 0 OID 27062)
-- Dependencies: 199
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO groups (group_id, group_name, curator, speciality) VALUES (1, 'вторая', 'Профессор Преображенский', 'Создание человеков из собачек');
INSERT INTO groups (group_id, group_name, curator, speciality) VALUES (2, 'первая', 'Доктор Борменталь', 'Создание собачек из человеков');


--
-- TOC entry 2807 (class 0 OID 27051)
-- Dependencies: 197
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO students (student_id, first_name, sur_name, patronymic, date_of_birth, sex, education_year, group_id) VALUES (2, 'Иван', 'Степанов', 'Сергеевич', '1990-03-20', 'М', 2006, 1);
INSERT INTO students (student_id, first_name, sur_name, patronymic, date_of_birth, sex, education_year, group_id) VALUES (3, 'Наталья', 'Чичикова', 'Андреевна', '1990-06-10', 'Ж', 2006, 1);
INSERT INTO students (student_id, first_name, sur_name, patronymic, date_of_birth, sex, education_year, group_id) VALUES (4, 'Виктор', 'Белов', 'Сидорович', '1990-01-10', 'М', 2006, 1);
INSERT INTO students (student_id, first_name, sur_name, patronymic, date_of_birth, sex, education_year, group_id) VALUES (5, 'Петр', 'Сушкин', 'Викторович', '1991-03-12', 'М', 2006, 2);
INSERT INTO students (student_id, first_name, sur_name, patronymic, date_of_birth, sex, education_year, group_id) VALUES (6, 'Вероника', 'Ковалева', 'Сергеевна', '1991-07-13', 'Ж', 2006, 2);
INSERT INTO students (student_id, first_name, sur_name, patronymic, date_of_birth, sex, education_year, group_id) VALUES (7, 'Ирина', 'Истомина', 'Федоровна', '1991-04-29', 'Ж', 2006, 2);


--
-- TOC entry 2819 (class 0 OID 0)
-- Dependencies: 198
-- Name: groups_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('groups_group_id_seq', 2, true);


--
-- TOC entry 2820 (class 0 OID 0)
-- Dependencies: 196
-- Name: students_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('students_student_id_seq', 7, true);


--
-- TOC entry 2683 (class 2606 OID 27070)
-- Name: groups groups_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT groups_pk PRIMARY KEY (group_id);


--
-- TOC entry 2681 (class 2606 OID 27059)
-- Name: students students_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY students
    ADD CONSTRAINT students_pk PRIMARY KEY (student_id);


--
-- TOC entry 2684 (class 2606 OID 27071)
-- Name: students students_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY students
    ADD CONSTRAINT students_fk0 FOREIGN KEY (group_id) REFERENCES groups(group_id);


-- Completed on 2019-05-06 15:53:19

--
-- PostgreSQL database dump complete
--

