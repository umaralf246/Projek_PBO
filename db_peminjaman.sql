--
-- PostgreSQL database dump
--

\restrict UahawOrZJCGmgx9XF5A8gdMcfPO5lF46LJiwO9S9Q1lFEoqQj5Wp7fXlJZ0pYte

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2026-01-06 19:10:38

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
-- TOC entry 222 (class 1259 OID 16585)
-- Name: barang; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.barang (
    id integer NOT NULL,
    nama_barang character varying(100) NOT NULL,
    deskripsi text,
    stok_total integer NOT NULL,
    stok_tersedia integer NOT NULL,
    gambar character varying(200)
);


ALTER TABLE public.barang OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16584)
-- Name: barang_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.barang_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.barang_id_seq OWNER TO postgres;

--
-- TOC entry 5038 (class 0 OID 0)
-- Dependencies: 221
-- Name: barang_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.barang_id_seq OWNED BY public.barang.id;


--
-- TOC entry 224 (class 1259 OID 16598)
-- Name: peminjaman; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.peminjaman (
    id integer NOT NULL,
    user_id integer,
    barang_id integer,
    jumlah integer NOT NULL,
    tgl_pinjam date NOT NULL,
    tgl_kembali date NOT NULL,
    keperluan text,
    status character varying(20) DEFAULT 'Dipinjam'::character varying
);


ALTER TABLE public.peminjaman OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16597)
-- Name: peminjaman_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.peminjaman_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.peminjaman_id_seq OWNER TO postgres;

--
-- TOC entry 5039 (class 0 OID 0)
-- Dependencies: 223
-- Name: peminjaman_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.peminjaman_id_seq OWNED BY public.peminjaman.id;


--
-- TOC entry 220 (class 1259 OID 16571)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    nim_nip character varying(20) NOT NULL,
    nama character varying(100) NOT NULL,
    password character varying(100) NOT NULL,
    role character varying(20) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16570)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 5040 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4867 (class 2604 OID 16588)
-- Name: barang id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.barang ALTER COLUMN id SET DEFAULT nextval('public.barang_id_seq'::regclass);


--
-- TOC entry 4868 (class 2604 OID 16601)
-- Name: peminjaman id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peminjaman ALTER COLUMN id SET DEFAULT nextval('public.peminjaman_id_seq'::regclass);


--
-- TOC entry 4866 (class 2604 OID 16574)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 5030 (class 0 OID 16585)
-- Dependencies: 222
-- Data for Name: barang; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.barang VALUES (2, 'Kamera DSLR Canon', NULL, 5, 5, 'kamera.jpg');
INSERT INTO public.barang VALUES (3, 'Sapu Ijuk', NULL, 20, 20, 'sapu.jpg');
INSERT INTO public.barang VALUES (4, 'Kabel HDMI', NULL, 15, 15, 'hdmi.jpg');
INSERT INTO public.barang VALUES (1, 'Proyektor Epson', NULL, 10, 10, 'proyektor.jpg');


--
-- TOC entry 5032 (class 0 OID 16598)
-- Dependencies: 224
-- Data for Name: peminjaman; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.peminjaman VALUES (1, 2, 1, 2, '2025-12-17', '2025-12-18', 'makan', 'Kembali');
INSERT INTO public.peminjaman VALUES (2, 2, 1, 10, '2025-12-18', '2025-12-31', 'makan', 'Kembali');
INSERT INTO public.peminjaman VALUES (3, 2, 1, 10, '2025-12-18', '2025-12-24', 'makan', 'Kembali');
INSERT INTO public.peminjaman VALUES (4, 2, 1, 3, '2025-12-20', '2025-12-30', 'penting', 'Kembali');
INSERT INTO public.peminjaman VALUES (5, 2, 1, 2, '2026-01-04', '2026-01-05', 'praktikum ', 'Kembali');
INSERT INTO public.peminjaman VALUES (6, 2, 1, 3, '2026-01-04', '2026-01-20', 'praktikum', 'Kembali');


--
-- TOC entry 5028 (class 0 OID 16571)
-- Dependencies: 220
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users VALUES (1, 'admin01', 'Pak Budi Admin', 'admin123', 'admin');
INSERT INTO public.users VALUES (2, '10123001', 'Umar Mahasiswa', '123', 'mahasiswa');


--
-- TOC entry 5041 (class 0 OID 0)
-- Dependencies: 221
-- Name: barang_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.barang_id_seq', 4, true);


--
-- TOC entry 5042 (class 0 OID 0)
-- Dependencies: 223
-- Name: peminjaman_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.peminjaman_id_seq', 6, true);


--
-- TOC entry 5043 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- TOC entry 4875 (class 2606 OID 16596)
-- Name: barang barang_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.barang
    ADD CONSTRAINT barang_pkey PRIMARY KEY (id);


--
-- TOC entry 4877 (class 2606 OID 16610)
-- Name: peminjaman peminjaman_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peminjaman
    ADD CONSTRAINT peminjaman_pkey PRIMARY KEY (id);


--
-- TOC entry 4871 (class 2606 OID 16583)
-- Name: users users_nim_nip_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nim_nip_key UNIQUE (nim_nip);


--
-- TOC entry 4873 (class 2606 OID 16581)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4878 (class 2606 OID 16616)
-- Name: peminjaman peminjaman_barang_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peminjaman
    ADD CONSTRAINT peminjaman_barang_id_fkey FOREIGN KEY (barang_id) REFERENCES public.barang(id);


--
-- TOC entry 4879 (class 2606 OID 16611)
-- Name: peminjaman peminjaman_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peminjaman
    ADD CONSTRAINT peminjaman_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


-- Completed on 2026-01-06 19:10:39

--
-- PostgreSQL database dump complete
--

\unrestrict UahawOrZJCGmgx9XF5A8gdMcfPO5lF46LJiwO9S9Q1lFEoqQj5Wp7fXlJZ0pYte

