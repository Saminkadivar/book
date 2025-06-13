--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.10
-- Dumped by pg_dump version 9.6.10

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
CREATE EXTENSION IF NOT EXISTS pgcrypto;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: _admin; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE IF NOT EXISTS admin (
  id SERIAL PRIMARY KEY,
  email VARCHAR(50) NOT NULL,
  password VARCHAR(255) NOT NULL,
  name VARCHAR(100) NOT NULL,
  role VARCHAR(30) CHECK (role IN ('Super Admin','Admin','manager')) DEFAULT 'Admin',
  created_at TIMESTAMP DEFAULT current_timestamp
);


ALTER TABLE public._admin OWNER TO rebasedata;

--
-- Name: _books; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._books (
    id smallint,
    category_id smallint,
    "ISBN" character varying(19) DEFAULT NULL::character varying,
    name character varying(25) DEFAULT NULL::character varying,
    img character varying(50) DEFAULT NULL::character varying,
    author character varying(38) DEFAULT NULL::character varying,
    mrp smallint,
    security smallint,
    rent smallint,
    qty smallint,
    best_seller smallint,
    short_desc character varying(1467) DEFAULT NULL::character varying,
    description character varying(2249) DEFAULT NULL::character varying,
    status smallint,
    price smallint
);


ALTER TABLE public._books OWNER TO rebasedata;

--
-- Name: _categories; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._categories (
    id smallint,
    category character varying(37) DEFAULT NULL::character varying,
    status smallint
);


ALTER TABLE public._categories OWNER TO rebasedata;

--
-- Name: _contact_us; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._contact_us (
    id smallint,
    name character varying(13) DEFAULT NULL::character varying,
    email character varying(23) DEFAULT NULL::character varying,
    mobile bigint,
    message character varying(27) DEFAULT NULL::character varying,
    date character varying(19) DEFAULT NULL::character varying
);


ALTER TABLE public._contact_us OWNER TO rebasedata;

--
-- Name: _order_detail; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._order_detail (
    id smallint,
    order_id smallint,
    book_id smallint,
    price numeric(5,1) DEFAULT NULL::numeric,
    "time" smallint
);


ALTER TABLE public._order_detail OWNER TO rebasedata;

--
-- Name: _order_status; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._order_status (
    id smallint,
    status_name character varying(10) DEFAULT NULL::character varying
);


ALTER TABLE public._order_status OWNER TO rebasedata;

--
-- Name: _orders; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._orders (
    id smallint,
    user_id smallint,
    book_id smallint,
    address character varying(50) DEFAULT NULL::character varying,
    address2 character varying(11) DEFAULT NULL::character varying,
    pin integer,
    payment_method character varying(6) DEFAULT NULL::character varying,
    total smallint,
    payment_status character varying(7) DEFAULT NULL::character varying,
    order_status smallint,
    date character varying(19) DEFAULT NULL::character varying,
    duration smallint,
    transaction_id character varying(18) DEFAULT NULL::character varying,
    deposit_refunded character varying(7) DEFAULT NULL::character varying,
    payment_id character varying(1) DEFAULT NULL::character varying
);


ALTER TABLE public._orders OWNER TO rebasedata;

--
-- Name: _password_resets; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._password_resets (
    id smallint,
    user_id smallint,
    token character varying(100) DEFAULT NULL::character varying,
    expiration bigint
);


ALTER TABLE public._password_resets OWNER TO rebasedata;

--
-- Name: _rental_returns; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._rental_returns (
    id smallint,
    user_id smallint,
    book_id smallint,
    order_id smallint,
    return_date character varying(10) DEFAULT NULL::character varying,
    condition_status character varying(7) DEFAULT NULL::character varying,
    late_fee numeric(4,2) DEFAULT NULL::numeric,
    security_deposit_refund numeric(6,2) DEFAULT NULL::numeric,
    status character varying(8) DEFAULT NULL::character varying,
    created_at character varying(19) DEFAULT NULL::character varying,
    refund_id character varying(1) DEFAULT NULL::character varying
);


ALTER TABLE public._rental_returns OWNER TO rebasedata;

--
-- Name: _users; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._users (
    id smallint,
    name character varying(13) DEFAULT NULL::character varying,
    email character varying(24) DEFAULT NULL::character varying,
    mobile bigint,
    doj character varying(19) DEFAULT NULL::character varying,
    password character varying(32) DEFAULT NULL::character varying
);


ALTER TABLE public._users OWNER TO rebasedata;

--
-- Data for Name: _admin; Type: TABLE DATA; Schema: public; Owner: rebasedata
--
-- Insert Super Admin user (password: admin123)
INSERT INTO admin (email, password, name, role)
VALUES (
  'admin@bookheaven.com',
  '$2y$10$8dzsWAvjJKJ7K5OpEh3eEetTdo8zFl9XQn1BdAeMZxscsWJ9PfDwW',
  'Super Admin',
  'Super Admin'
);

INSERT INTO books (id, best_seller, isbn, name, img, rent)
VALUES
(1, true, '978-9-35-141670-8', 'Gulliver''s Travels', '1483558651_4145VVA6BXL.jpg', 20);






