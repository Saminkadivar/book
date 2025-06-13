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

CREATE TABLE public._admin (
    id smallint,
    email character varying(23) DEFAULT NULL::character varying,
    password character varying(60) DEFAULT NULL::character varying,
    name character varying(5) DEFAULT NULL::character varying,
    role character varying(11) DEFAULT NULL::character varying,
    created_at character varying(19) DEFAULT NULL::character varying
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
  crypt('admin123', gen_salt('bf')),
  'Super Admin',
  'Super Admin'
);

COPY public._admin (id, email, password, name, role, created_at) FROM stdin;
7	black@gmail.com	e10adc3949ba59abbe56e057f20f883e	Black	Super Admin	2025-02-06 22:36:20
15	saminkadivar1@gmail.com	e10adc3949ba59abbe56e057f20f883e	samin	manager	2025-03-05 11:28:18
19	book@gmail.com	$2y$10$RBWfUBKpVcc1SJj592Pj3OlM0QQ4MmWVsyYOCcem20wt5BnlrMSHK	Book	Admin	2025-03-13 09:32:43
\.


--
-- Data for Name: _books; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._books (id, category_id, "ISBN", name, img, author, mrp, security, rent, qty, best_seller, short_desc, description, status, price) FROM stdin;
1	0	978-9-35-141670-8	Gulliver's Travels	1483558651_4145VVA6yGL._SX317_BO1,204,203,200_.jpg	Jonathan Swift	1750	1750	10	8	0	Gulliver's Travels was first published in 1726, and three centuries later it remains in full force. This famous satirical novel is both an adventure story and a devious philosophical reflection on the constitution of modern societies. The shipwrecked Lemuel Gulliver's encounters with the tiny Lilliputians, the Brobdingnag giants, the philosophical Houyhnhnms and the brute Yahoos will make the protagonist, like the reader, open his eyes to the raw and true human nature.	Jonathan Swift (1667-1745), a great English satirist, wrote his longest and most famous book, Gulliver’s Travels between 1720 and 1725 (published in 1726). The book deals with imaginary voyages of Gulliver among the pigmies (Lilliputians), the giants (Brobdingnagians), the moonstruck philosophers (Laputans), and the race of the talking horses (Houyhnhnms) with their human serfs the Yahoos. Once Swift wrote to Pope, “I heartily hate and detest that animal called man” and his Gulliver’s Travels and Pilgrim’s Progress are the elaboration of that attitude. In his Gulliver’s Travels, he magnifies man into a giant, and then he diminishes him into a mannikin called Lilliput, and then he turns from man altogether to the race of horses called Houyhnhnms and discovers charity and sagacity in them. The Travels have a charm and vivacity that delight old and young. Swift’s comments upon mankind are shrewd and arresting as well as satirical. The style is Swift’s best - clear, easy, tireless and powerful.	1	1760
2	3	978-1-54-209413-9	One Arranged Marrage	newArrival1.jpg	Chetan Bhagat	4000	4000	40	4	0	One Arranged Murder is the ninth novel and the twelfth book overall written by the Indian author Chetan Bhagat. The novel is the sequel to Bhagat's 2018 novel The Girl in Room 105. A sequel to the book named 400 days was released in 2021.	Saurabh Maheshwari is engaged to Prerna Malhotra. His wedding is three months away. On the night of karva chauth, however, Prerna is murdered after being pushed from her terrace. With Inspector Vijender Singh and aided by ACP Rana, the case is investigated by Saurabh and Keshav Rajpurohit. They interrogate all the people in the family. Prerna has a cousin sister called Anjali, and Keshav falls in love with her. They initially believe it is Prerna's father's brother who has murdered her, but it is later revealed that Anjali had actually murdered Prerna in a fit of jealously. It is also revealed that Anjali and Prerna were twins, but since Prerna was better off, Anjali felt incredibly jealous and planned to murder Prerna.	1	4040
16	0	978-1-84-283255-4	The General’s Envoy	2140619059_generalEnvoy.jpeg	Anthony  Conway	786	786	5	10	0	The second thrilling volume of the Caspasian series, set this time in the lawless China of 1925 John Caspasian, hero of The Viceroy's Captain, is assigned to Shanghai, a city seething with intrigue and violence as rival Chinese revolutionaries make war on each other. Sent up the Yangtsc to make an alliance with the man the British have picked to stop the 'communist' Chiang Kai-Shek, Caspasian discovers that the supposed champion of the west is a vicious murderer. The warlord's right hand man is the English war hero who saved Caspasian's life in the trenches in World War I. So why is he trying to Kill Caspasian now?	none	1	791
17	0	978-0-09-957784-3	The Black Tide	1396051893_311YEMuKDCL._SX325_BO1,204,203,200_.jpg	Hammond Innes	4930	4930	100	3	0	From the author of DELTA CONNECTION, THE LONELY SKIER, THE TROJAN HORSE and WRECKERS MUST BREATHE, a thriller about a woman who takes matters into her own hands when yet another ship carrying oil flounders on the rocks around Land's End, and she sets off to find the one man who knows the truth.	none	1	5030
18	12	978-0-32-416862-4	Principles of Economics	1138740780_51sHIn7iIbL._SX401_BO1,204,203,200_.jpg	N. Gregory Mankiw	5000	5000	100	1	0	Students save money when purchasing bundled products. This bundle contains a loose-leaf version of Principles of Economics, 8th Edition, and access to MindTap Economics for 1 term (6 months). With a single login for MindTap, you can connect with your instructor, organize coursework, and have access to a range of study tools, including e-book and apps all in one place! MindTap helps you learn on your terms. Read or listen to textbooks and study with the aid of instructor notifications, flashcards, and practice quizzes.	None	1	5100
20	20	978-0-07-352935-6	Design Of Machinery	1966742517_51JDN8F3NBL._SX378_BO1,204,203,200_.jpg	Robert L. Norton, Milton P. Higgins II	1999	1999	20	1	0	Laboratory Applications in Microbiology: A Case Study Approach uses real-life case studies as the basis for exercises in the laboratory. This is the only microbiology lab manual focusing on this means of instruction, an approach particularly applicable to the microbiology laboratory. The author has carefully organized the exercises so that students develop a solid intellectual base beginning with a particular technique, moving through the case study, and finally applying new knowledge to unique situations beyond the case study.	Design of Machinery has proven to be a favorite of both students and educators across the globe. It is currently used in hundreds of schools in the U.S. and Canada and in many more worldwide in both English and several other languages. The book is praised for its friendly writing style, clear exposition of difficult topics, attractive appearance, thorough and relevant coverage, its emphasis on synthesis and design, and its useful computer programs. The foremost goal of the author is to convey the art of the design process and the fundamentals of kinematics and dynamics in order to prepare students to successfully tackle genuine engineering problems encountered in practice. While both thorough and complete on the topics of analysis, the book also emphasizes the synthesis and design aspects of the subject to a greater degree than any other similar book on the market today. Analytical synthesis of linkages is covered, and cam design is given a more thorough and practical treatment than in any other text.\r\n\r\nIncluded with this text are downloadable videos containing animated models of over 100 of the examples from the text. Students can open, run, interact, and modify these Working Model simulations. Student editions of three custom programs for design and analysis of mechanisms: Linkages, DYNACAM, and MATRIX are also on the book’s website.  Linkages is a new program that incorporates the older programs Fourbar, Fivebar, Sixbar, Slider and Engine. (The programs with the book are limited functionality versions of the professional editions of the same programs available elsewhere on this web site.) Also included are many Matlab models for kinematic analysis.\r\n\r\nThe Sixth Edition has a collection of Master Lecture Videos and Tutorials made by the author over a thirty-year period while teaching at Worcester Polytechnic Institute. There are 82 instructional videos in total. Thirty-four are “50-minute” lectures. Thirty-nine are short “snippets” from the lecture videos that are linked to the relevant topics in a chapter. Seven are demonstrations of machinery or tutorials. Two are laboratory exercises that have been “virtualized” via video demonstration and the provision of test data so that students can simulate the lab.	1	2019
21	0	978-1-85-398020-6	In Search Of Nikola Tesla	1520464866_41BGPY5CGQL._SX295_BO1,204,203,200_.jpg	F. David Peat	6000	6000	200	-1	0	– Dr. Peat gives a scientific perspective to Tesla's work, specifically, the wireless power transmission theories. The book is very narritive in his search for the truth about Tesla. His endeavors of searching for info are quite interesting. I recommend the book to any scientist out there. The book was originally published in 1983.	none	1	6200
22	0	978-0-81-530322-0	History Of Astronomy	1864802571_9780815303220.tif	John Lankford	300	300	3	6	1	– This new history of astronomy, in the form of an encyclopedia, is a welcome addition to the literature of astronomy. Many of the histories that have been published are now long out of print. Although those early histories are still useful, this volume brings together, in a very readable and pleasant format, much information scattered among several publications. The unique quality of this work is its five-pronged approach to presenting information.The first approach, which takes up most of the book, is a historical overview of astronomy. Ancient and medieval periods are covered, but the focus is on the beginnings of the scientific revolution of the seventeenth century to the present. The second approach looks at astronomy as it fits into various national contexts. For example, the reader will find key entries for astronomy in France or Russia or Great Britain, describing milestones of astronomical accomplishments in each of those countries.	None	1	303
23	0	185-286-336-6	Black Orchid	1219428166_47700.jpg	Neil Gaiman	225	225	240	11	1	From one of the most highly recognised and award winning comic writers on the scene today, Neil Gaiman (Sandman, Death, Violent Cases), and his sometime collaborator, innovative artist Dave McKean (Arkham Asylum, Cages, Violent Cases) comes a haunting and stylish exploration of birth, death and renewal. Both human and flower the heroine, Black Orchid, undertakes a hazardous journey to uncover her true origins, providing a moving ecological parable for our times. This work by Gaiman and Mckean is an early showcase for the talent we know today.	None	1	465
24	0	067-404-649-8	What Is Mental Illness?	1979676086_content.jpeg	Richard J. Mcnally	273	273	25	2	0	According to a major health survey, nearly half of all Americans have been mentally ill at some point in their lives - more than a quarter in the last year. Can this be true? What exactly does it mean, anyway? What's a disorder, and what's just a struggle with real life? This lucid and incisive book cuts through both professional jargon and polemical hot air, to describe the intense political and intellectual struggles over what counts as a 'real' disorder, and what goes into the 'DSM', the psychiatric bible. Is schizophrenia a disorder? Absolutely. Is homosexuality? It was - till gay rights activists drove it out of the DSM a generation ago. What about new and controversial diagnoses? Is 'social anxiety disorder' a way of saying that it's sick to be shy, or 'female sexual arousal disorder' that it's sick to be tired? An advisor to the DSM, but also a fierce critic of exaggerated overuse, McNally defends the careful approach of describing disorders by patterns of symptoms that can be seen, and illustrates how often the system medicalizes everyday emotional life. Neuroscience, genetics, and evolutionary psychology may illuminate the biological bases of mental illness, but at this point, McNally argues, no science can draw a bright line between disorder and distress. In a pragmatic and humane conclusion, he offers questions for patients and professionals alike to help understand, and cope with, the sorrows and psychopathologies of everyday life.	None	1	298
26	0	978-19-3-610794-011	Rich Dad Poor Dad	richdad.phg.png	test	1000	1000	10	1002	0	TESTING TESTING	testing	1	1010
\.


--
-- Data for Name: _categories; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._categories (id, category, status) FROM stdin;
3	Computing, Internet & Digital Media	1
12	Business & Economics	1
13	Arts,Film & photography	1
20	Engineering	1
21	Exam Preparation	1
23	Health, Family & Personal Development	0
25	Higher Education Textbooks	1
26	Historical Fiction	1
27	History	1
29	Language, Linguistics & Writing	1
30	Law	1
31	Literature & Fiction	1
32	Medicine & Health Sciences	1
39	Travel	0
40	Romance	1
41	Analysis & Strategy	1
44	Sciences & Technology	1
\.


--
-- Data for Name: _contact_us; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._contact_us (id, name, email, mobile, message, date) FROM stdin;
13	Black	black@gmail.com	8200026180	hello this is testing email	2025-01-09 11:26:47
25	Black	black@gmail.com	8200026180	testing testing	2025-01-09 23:17:57
44	Samin kadivar	saminkadivar1@gmail.com	8200026182	hello	2025-03-05 17:19:02
\.


--
-- Data for Name: _order_detail; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._order_detail (id, order_id, book_id, price, "time") FROM stdin;
17	2	13	1630.0	23
18	3	13	1500.0	10
19	4	13	1500.0	10
21	6	15	250.0	10
22	7	13	1500.0	10
23	8	1	200.0	10
25	10	27	1110.0	10
26	11	26	1110.0	10
27	12	27	1110.0	10
28	13	27	2010.0	100
29	14	26	1110.0	10
30	15	27	1420.0	41
31	16	26	2010.0	100
32	17	26	1110.0	10
33	18	27	1110.0	10
34	19	27	1110.0	10
35	20	26	1110.0	10
36	21	26	1110.0	10
41	26	26	1260.0	25
42	27	26	1110.0	10
43	28	26	1110.0	10
44	29	26	1110.0	10
45	30	26	1110.0	10
46	31	26	1110.0	10
47	32	26	1110.0	10
48	33	26	1210.0	20
49	34	26	1210.0	20
50	35	26	1210.0	20
51	36	26	1110.0	10
53	38	26	1110.0	10
54	39	26	1110.0	10
55	40	26	1110.0	10
56	41	26	1110.0	10
57	42	26	1110.0	10
58	43	26	1110.0	10
70	55	26	1110.0	10
71	56	26	1110.0	10
72	0	26	1510.0	50
73	0	26	1110.0	10
74	0	26	1110.0	10
75	0	26	1110.0	10
76	57	26	1110.0	10
77	58	26	1210.0	20
78	59	26	1210.0	20
79	60	26	1110.0	10
80	61	26	1110.0	10
81	62	26	1110.0	10
82	63	26	1110.0	10
83	64	26	1110.0	10
84	65	26	1110.0	10
85	66	26	1110.0	10
86	67	26	1110.0	10
87	68	26	1110.0	10
88	69	26	1110.0	10
89	70	26	1110.0	10
90	71	26	1110.0	10
91	72	26	1110.0	10
92	73	26	1110.0	10
93	74	26	1110.0	10
94	75	26	1510.0	50
95	76	26	1110.0	10
96	77	26	1510.0	50
97	78	26	1110.0	10
98	79	26	1210.0	20
99	80	26	1110.0	10
100	81	26	1110.0	10
101	82	26	1110.0	10
102	83	26	1110.0	10
103	84	26	1110.0	10
109	0	26	2010.0	100
110	90	26	1210.0	20
111	91	26	1130.0	12
112	92	26	1110.0	10
113	93	26	1110.0	10
114	94	1	210.0	11
115	95	1	210.0	11
116	96	26	1110.0	10
117	97	26	1110.0	10
118	98	26	1110.0	10
119	99	26	1110.0	10
120	100	26	1110.0	10
121	101	26	1110.0	10
122	102	26	1110.0	10
128	108	26	1110.0	10
129	109	26	1110.0	10
130	110	26	1110.0	10
131	111	26	1110.0	10
132	112	26	1110.0	10
133	113	26	1260.0	25
134	114	26	1110.0	10
135	115	26	1210.0	20
136	116	26	1210.0	20
137	117	26	1210.0	20
138	118	26	1210.0	20
139	119	26	1210.0	20
140	120	26	1110.0	10
141	121	26	2010.0	100
144	124	26	1110.0	10
146	126	26	1210.0	20
147	127	26	1110.0	10
\.


--
-- Data for Name: _order_status; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._order_status (id, status_name) FROM stdin;
4	Cancelled
5	Delivered
1	Pending
2	Processing
6	Returned
3	Shipped
\.


--
-- Data for Name: _orders; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._orders (id, user_id, book_id, address, address2, pin, payment_method, total, payment_status, order_status, date, duration, transaction_id, deposit_refunded, payment_id) FROM stdin;
2	13	0	samin		360000	COD	1630	pending	4	2025-01-08 22:22:32	23		pending	
3	13	0	panchduwarka		363622	COD	1500	success	4	2024-01-08 22:24:18	10		pending	
4	13	0	samin		363621	COD	1500	success	5	2025-01-08 22:25:38	10		pending	
6	13	0	gandhinagar		363621	COD	250	success	4	2025-01-09 11:23:14	10		pending	
7	13	0	kavad		363621	COD	1500	pending	4	2025-01-09 11:23:40	10		pending	
8	13	0	panchduwarka		363621	COD	200	success	4	2025-01-09 13:24:07	10		pending	
10	13	0	panchduwarka		363621	COD	1110	success	4	2024-01-09 14:14:02	10		pending	
11	13	0	gandhinagar		382024	COD	1110	success	4	2025-01-09 14:17:46	10		pending	
12	13	0	gandhinagar		363621	COD	1110	success	1	2025-01-18 13:59:08	10		pending	
13	13	0	gandhinagar		363621	COD	2010	success	4	2025-01-26 15:24:36	100		pending	
14	13	0	gandhinagar		363621	COD	1110	success	4	2025-01-28 23:39:59	10		pending	
15	13	0	gandhinagar		3633621	COD	1420	success	6	2025-01-28 23:42:19	41		pending	
16	13	0	panchduwarka		363621	Online	2010	pending	4	2025-01-28 23:43:34	100		pending	
17	13	0	panchduwarka		363621	COD	1110	success	4	2025-01-30 23:17:49	10		pending	
18	14	0	panchduwarka		363621	COD	1110	success	5	2025-01-30 23:51:23	10		pending	
19	14	0	panchduwarka		363621	Online	1110	pending	5	2025-01-30 23:51:29	10		pending	
20	13	0	panchduwarka		363621	COD	1110	success	0	2025-01-31 13:02:30	10		pending	
21	15	0	panchduwarka		363621	COD	1110	success	5	2025-01-31 13:16:10	10		pending	
22	13	0	Abcd	12345	363621	Online	2010	pending	4	2025-02-03 19:08:25	100		pending	
26	13	0	panchduwarka		363621	COD	1260	success	4	2025-02-04 02:15:56	25		pending	
27	13	0	panchduwarka		136362	COD	1110	success	6	2025-02-04 02:19:36	10		pending	
28	13	0	panchduwarka		120200	COD	1110	success	6	2025-02-04 02:38:04	10		pending	
29	13	0	10diu		363621	COD	1110	success	6	2025-02-04 02:39:27	10		pending	
30	13	0	gandhinagar		363621	COD	1110	success	6	2025-02-04 02:40:41	10		pending	
31	13	0	dedfe		363621	COD	1110	success	5	2025-02-04 02:56:25	10		pending	
32	13	0	dedfe		363621	COD	1110	success	1	2025-02-04 02:58:24	10		pending	
33	13	0	gandhinagar		363621	COD	1210	success	1	2025-02-04 03:01:16	20		pending	
34	13	0	gandhinagar		363621	COD	1210	success	1	2025-02-04 03:07:27	20		pending	
35	13	0	gandhinagar		363621	COD	1210	success	1	2025-02-04 03:12:33	20		pending	
36	13	0	gandhinagar		363621	Online	1110	pending	1	2025-02-04 03:14:22	10		pending	
38	13	0	panchduwarka		363621	COD	1110	success	1	2025-02-04 03:22:56	10		pending	
39	13	0	gandhinagar		366621	COD	1110	success	1	2025-02-04 03:29:02	10		pending	
40	13	0	gandhinagar		363621	COD	1110	success	1	2025-02-04 03:35:32	10		pending	
41	13	0	panchduwarka		363621	COD	1110	success	1	2025-02-04 03:44:03	10		pending	
42	13	0	panchduwarka		363621	COD	1110	success	1	2025-02-05 13:14:17	10		pending	
43	13	0	panchduwarka		363621	Online	1110	pending	1	2025-02-06 08:29:38	10		pending	
47	13	0	panchduwarka		363621	COD	1110	success	1	2025-02-07 02:02:06	10		pending	
48	13	0	sector 24 gandhinagar		382024	COD	1110	success	1	2025-02-07 02:02:49	10		pending	
49	13	0	sector 24 gandhinagar		382024	COD	1110	success	1	2025-02-07 02:11:15	10		pending	
50	13	26	sector 24 gandhinagar		382024	COD	1110	success	1	2025-02-07 02:12:33	10		pending	
51	13	0	panchduwarka	12344	363621	COD	1110	success	1	2025-02-14 23:44:59	10		pending	
52	13	0	sector 24 gandhinagar		363621	COD	1110	success	1	2025-02-15 00:04:42	10		pending	
53	13	0	panchduwarka		252727	COD	1510	success	1	2025-02-15 00:21:28	50		pending	
54	13	0	panchduwarka		363621	COD	1110	success	1	2025-02-15 12:52:37	10		pending	
55	13	0	sector 24 gandhinagar		36321	COD	1110	success	1	2025-02-15 12:54:02	10		pending	
56	13	0	panchduwarka		363621	Online	1110	pending	4	2025-02-15 18:01:51	10		pending	
57	13	0	gandhinagar		363621	COD	1110	success	1	2025-02-15 18:40:01	10		pending	
58	13	0	panchduwarka		284984	Online	1210	pending	1	2025-02-15 19:19:45	20		pending	
59	13	0	wn		29289	Online	1210	pending	1	2025-02-15 19:20:43	20		pending	
70	13	0	sector 24 gandhinagar		363621	COD	1110	success	1	2025-02-18 23:29:59	10		pending	
71	13	0	sector 24 gandhinagar		363621	COD	1110	success	1	2025-02-18 23:30:59	10		pending	
72	13	0	sector 24 gandhinagar		123123	COD	1110	success	1	2025-02-18 23:33:16	10		pending	
73	13	0	sector 24 gandhinagar		123123	COD	1110	success	1	2025-02-18 23:33:45	10		pending	
74	13	0	panchduwarka		363621	COD	1110	success	1	2025-02-18 23:36:55	10		pending	
75	13	0	gandhinagar		363621	COD	1510	success	1	2025-02-18 23:46:02	50		pending	
76	13	0	gandhinagar		363621	COD	1110	success	1	2025-02-18 23:47:52	10		pending	
77	13	0	gandhinagar		363621	COD	1510	success	1	2025-02-18 23:51:29	50		pending	
78	13	0	gandhinagar		363621	Online	1110	pending	1	2025-02-19 00:22:57	10		pending	
79	13	0	gandhinagar		363621	COD	1210	success	1	2025-02-19 00:26:14	20		pending	
80	13	0	gandhinagar		363621	COD	1110	success	0	2025-02-19 00:26:53	10		pending	
81	13	0	gandhinagar		363621	Online	1110	pending	1	2025-02-19 00:28:09	10		pending	
82	13	0	gandhinagar		363621	Online	1110	pending	1	2025-02-19 00:28:57	10		pending	
83	13	10	gandhinagar		363621	COD	1110	success	0	2025-02-19 01:21:10	10		pending	
84	13	0	gandhinagar		363621	COD	1110	success	1	2025-02-19 02:45:27	10		pending	
90	13	0	gandhinagar		363621	COD	1210	success	1	2025-02-20 05:06:14	20		pending	
91	13	0	gandhinagar		382016	COD	1130	success	5	2025-02-20 09:00:14	12		pending	
94	13	0	gandhinagar	gandhinagar	382330	COD	210	success	4	2025-02-20 12:36:13	11		pending	
95	13	0	gandhinagar	gandhinagar	382330	COD	210	success	1	2025-02-20 12:36:37	11		pending	
96	13	0	gandhinagar		363621	COD	1110	success	1	2025-02-23 19:25:53	10		pending	
97	13	0	gandhinagar		363621	COD	1110	success	1	2025-02-23 22:05:29	10		pending	
98	13	0	gandhinagar		363621	COD	1110	success	1	2025-02-23 22:23:48	10		pending	
99	13	0	gandhinagar		363621	COD	1110	success	1	2025-02-23 22:24:02	10		pending	
100	13	0	gandhinagar		363621	COD	1110	success	1	2025-02-23 22:24:37	10		pending	
101	13	0	gandhinagar		363621	COD	1110	success	1	2025-02-23 22:26:51	10		pending	
102	13	0	gandhinagar		363636	COD	1110	success	1	2025-02-23 22:27:02	10		pending	
111	13	26	gandhinagar		101010	COD	1110	success	6	2025-02-01 22:44:19	10		pending	
112	13	0	gandhinagar		101010	COD	1110	success	6	2025-02-23 22:52:36	10		pending	
113	13	26	92 house number, Indiranagar sector-24 Gandhinagar		363621	COD	1260	success	4	2025-02-23 22:54:55	25		pending	
114	13	26	gandhinagar		363621	COD	1110	success	4	2025-03-03 09:38:50	10		pending	
119	13	26	gandhinagar		363621	COD	1210	success	6	2025-03-03 11:03:35	20		pending	
120	13	26	92 house number, Indiranagar sector-24 Gandhinagar		363621	COD	1110	success	4	2025-03-03 16:07:25	10		pending	
121	16	26	gandhinagar		382024	COD	2010	success	3	2025-03-03 21:51:42	100		pending	
126	13	26	wankaner		363621	COD	1210	success	4	2025-03-04 16:49:48	20		pending	
127	13	26	92 house number, Indiranagar sector-24 Gandhinagar		363621	COD	1110	success	1	2025-03-04 17:01:00	10		pending	
128	13	26	92 house number, Indiranagar sector-24 Gandhinagar		363621	COD	1110	success	1	2025-03-04 17:01:23	10		pending	
129	13	26	samin		363621	COD	1120	success	1	2025-03-04 17:04:16	11		pending	
130	13	26	92 house number, Indiranagar sector-24 Gandhinagar		363621	COD	1110	success	1	2025-03-04 17:17:52	10		pending	
131	13	0	92 house number, Indiranagar sector-24 Gandhinagar		363621	COD	1340	success	1	2025-03-04 17:20:32	33		pending	
132	13	0	92 house number, Indiranagar sector-24 Gandhinagar		363621	Online	1340	pending	1	2025-03-04 17:21:41	33		pending	
133	13	0	92 house number, Indiranagar sector-24 Gandhinagar		363625	COD	1120	success	1	2025-03-04 17:24:31	11		pending	
134	13	0	92 house number, Indiranagar sector-24 Gandhinagar		362514	Online	1210	pending	4	2025-03-04 17:24:46	20		pending	
135	13	0	92 house number, Indiranagar sector-24 Gandhinagar		363621	COD	1110	success	1	2025-03-04 17:49:48	10		pending	
136	13	0	92 house number, Indiranagar sector-24 Gandhinagar	daw	363621	COD	1110	success	1	2025-03-04 18:32:15	10		pending	
137	13	0	wankaner		363621	COD	1210	success	1	2025-03-04 18:49:33	20		pending	
138	13	0	wankaner		363621	COD	1210	success	1	2025-03-04 18:50:14	20		pending	
139	13	0	wankaner		363621	COD	1210	success	1	2025-03-04 18:50:35	20		pending	
140	13	0	wankaner		363621	Online	1210	pending	1	2025-03-04 19:20:26	20		pending	
141	13	0	wankaner		382026	Online	1110	pending	1	2025-03-04 19:29:20	10		pending	
142	13	0	wankaner		382026	Online	1110	pending	1	2025-03-04 19:31:43	10		pending	
143	13	0	wankaner		363621	Online	1210	pending	1	2025-03-04 19:33:27	20		pending	
\.


--
-- Data for Name: _password_resets; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._password_resets (id, user_id, token, expiration) FROM stdin;
1	16	20b4edde7b7c8d39403ca2bc0d24edf918dd2d9675e70c8147c33dbe7a45a90df2acd8142fdb98a9b446ddb652c1c9e4407d	1738751583
2	16	2903589bebac6e668347dbaab95513843aa2f3ad2f35ce802458b248cef7370b1771a324a3dea61f5339d75767625edb5f9c	1738752235
3	16	5a36a1285d06a88af865882b7d54d6c13fbf54c6a0dd6922daf8d53af2bf979b84760222fb25dcf29cf2a14ce4dad9125460	1738752264
4	16	ca4368e9ed33d1f4fec3814c54bdf065d1b0d793355a3296b5fbcd4b6d04b3297d8b684f6094d4a3a02ed8569e8d450f19dd	1738752266
5	16	816706f4ff8e06ec5f4249e86516bc255ad5e481c0fdfda0ec3cbdabcc7ea0708b6f2cc80ec66d712457a2130cf42177e785	1738752300
6	16	61ddd5981883468a7e56754747bddcccf51c706d332e69b5acca7a44ad7d5ed372191dd7808a5a62136f8888c396702ff7ac	1738752415
10	13	6a01d16a119d86350853bd0b244fc3d25780cbc77b3406bb861f5594ca1238a37420b1d92e182be0f52feab05264fbf157eb	1738756003
13	13	76cf6068276ec7be8c49fb28972a05a77ca347ea95f6f7a1f50abd4b96a4b071135fc470c351f38f217e7c72f1493bfa4e51	1738756465
14	13	bc4403b34765f51b27dc5694cf8bd1129d7db17946da04dab6e587c8645d0aceedfe3cbd5fcc333aa84b239601cb70ec7487	1738814128
16	13	6a5e4a87ae49cc2bd581acbf368514bca00f23405ee8b86fe6daf9a91cc567f6f7d2a88393af813c5701270ab07bfe1e6c1a	1738814624
17	13	4e30393127e3cf8987f7dee77a198fd0d8f9d2d4bd77263084e1a286635c033de0bbf3aaefce25a9937af5187fc2dad9a4b9	1738814686
18	13	9fe9541b0c633cf6989c5c6044d855df9841876f214f2557d107d12d74a2f1a52c639f2fd86d080016e6b16f4625cf044265	1738815372
19	13	5cbb496b2a67a9c460e7275190b0201377b7409c5ca1541005f841077d49a21db64f70700a89deabb5099f9481e7bda59f36	1738816810
25	13	b99920bbe062df580f3d48c04d96df3c61d137355abd115f51384d9905be49da4f4176d7348823940cd756130c5fc1dd2fcb	1738820745
33	13	031f37c310f55f06a2b3b16946ace5ee568a0f95733a09fbf676146fa7ea4ea66b10751868c25c5ff15f89032adb8a2d94c8	1738837500
34	13	bfcf77001fba25fde3ab153a52c70f1a8ca96c778bd1ebae1f7f1d599e248244340b7108c5b6c2c2e9060b29b208a3edb62b	1738837505
40	13	ad4fe77b60bfa7d8ddd67239eb52521928241d299e6ab6a23efe64b691137b24f3113cfb84408329070e319e46564aafe20a	1739992205
41	13	d337ecadd75a07a5b7425ada80b05bb9adcd947e9d15aad24d60cf110ded1d4c7ad895aa1e0899a4e2daed90db672a8a6e8c	1739992235
44	13	f2416a0877c2136c7d149320466b1a8c45943c385a282572bd07faa40b261b81ec4a4f9b1dc162840730aedbaddfcc1efee4	1741159092
\.


--
-- Data for Name: _rental_returns; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._rental_returns (id, user_id, book_id, order_id, return_date, condition_status, late_fee, security_deposit_refund, status, created_at, refund_id) FROM stdin;
1	13	26	114	2025-03-12	Damaged	10.00	1000.00	Rejected	2025-03-03 05:35:52	
2	13	26	114	2025-03-03	Good	0.00	0.00	Approved	2025-03-03 07:11:14	
3	13	26	83	2025-03-03	Good	1.94	0.00	Rejected	2025-03-03 09:07:09	
4	13	26	80	2025-03-03	Lost	1.98	0.00	Approved	2025-03-03 09:07:39	
6	13	26	17	2025-03-03	Good	21.03	0.00	Approved	2025-03-03 11:18:57	
7	13	26	20	2025-03-03	Lost	20.46	0.00	Approved	2025-03-03 11:23:36	
13	13	26	119	2025-03-03	Lost	0.00	1010.00	Approved	2025-03-03 11:44:27	
14	13	26	111	2025-03-03	Good	19.05	990.95	Approved	2025-03-03 11:49:45	
15	13	26	111	2025-03-03	Good	19.05	990.95	Approved	2025-03-03 11:50:55	
16	13	26	112	2025-03-03	Good	0.00	1010.00	Rejected	2025-03-03 11:51:11	
18	16	26	121	2025-03-03	Good	0.00	1010.00	Approved	2025-03-03 17:25:11	
26	13	26	153	2025-03-04	Good	0.00	1010.00	Rejected	2025-03-04 17:50:35	
27	13	26	191	2025-03-13	Damaged	0.00	505.00	Rejected	2025-03-13 11:03:26	
28	13	26	190	2025-03-13	Good	0.00	1010.00	Approved	2025-03-13 11:05:00	
29	13	26	189	2025-03-13	Lost	0.00	0.00	Rejected	2025-03-13 11:05:05	
30	13	26	187	2025-03-13	Good	0.00	1010.00	Approved	2025-03-13 13:23:54	
31	13	26	152	2025-03-13	Good	0.00	1010.00	Rejected	2025-03-13 13:24:18	
32	13	26	186	2025-03-13	Good	0.00	1010.00	Rejected	2025-03-13 13:25:27	
33	13	26	185	2025-03-13	Good	0.00	1010.00	Rejected	2025-03-13 13:28:54	
34	13	26	184	2025-03-13	Good	0.00	1010.00	Approved	2025-03-13 13:29:44	
35	13	26	183	2025-03-13	Good	0.00	1010.00	Approved	2025-03-13 13:38:05	
37	13	26	181	2025-03-13	Damaged	0.00	505.00	Approved	2025-03-13 14:11:42	
38	13	26	180	2025-03-13	Good	0.00	1010.00	Approved	2025-03-13 15:03:25	
39	13	26	179	2025-03-13	Good	0.00	1010.00	Approved	2025-03-13 15:06:44	
42	13	26	176	2025-03-13	Good	0.00	1010.00	Approved	2025-03-13 15:25:38	
43	13	26	174	2025-03-13	Good	0.00	1010.00	Approved	2025-03-13 15:29:14	
44	13	26	173	2025-03-13	Good	0.00	1010.00	Approved	2025-03-13 15:30:30	
45	13	26	172	2025-03-13	Good	0.00	1010.00	Approved	2025-03-13 15:31:46	
46	13	26	171	2025-03-13	Good	0.00	1010.00	Approved	2025-03-13 15:44:31	
47	13	26	170	2025-03-13	Good	0.00	1010.00	Rejected	2025-03-13 15:49:26	
52	13	26	27	2025-04-04	Lost	48.86	0.00	Approved	2025-04-04 20:17:43	
53	13	26	28	2025-04-04	Damaged	48.85	475.58	Approved	2025-04-04 20:20:47	
54	13	26	29	2025-04-04	Good	48.85	951.15	Approved	2025-04-04 20:20:56	
55	13	26	30	2025-04-04	Good	48.85	951.15	Approved	2025-04-04 20:21:04	
\.


--
-- Data for Name: _users; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._users (id, name, email, mobile, doj, password) FROM stdin;
13	Samin kadivar	saminkadivar1@gmail.com	8200026182	2025-01-08 22:17:14	e10adc3949ba59abbe56e057f20f883e
14	abc	abc@gmail.com	8200026182	2025-01-30 23:50:00	e10adc3949ba59abbe56e057f20f883e
15	ss	ss@gmail.com	8200026182	2025-01-31 13:15:41	e10adc3949ba59abbe56e057f20f883e
16	Naseeb	naseebbusines@gmail.com	8200026182	2025-02-04 04:01:35	e10adc3949ba59abbe56e057f20f883e
17	naseeb	naseebbusiness@gmail.com	8200026182	2025-02-20 09:47:46	e10adc3949ba59abbe56e057f20f883e
\.


--
-- PostgreSQL database dump complete
--

