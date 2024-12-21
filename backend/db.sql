--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0 (Debian 17.0-1.pgdg120+1)
-- Dumped by pg_dump version 17.0 (Debian 17.0-1.pgdg120+1)

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
-- Name: aircrafts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aircrafts (
    aircraft_id integer NOT NULL,
    aircraft_manufacturer character varying(255) NOT NULL,
    aircraft_type character varying(255) NOT NULL,
    aircraft_name character varying(255) NOT NULL,
    capacity integer NOT NULL
);


ALTER TABLE public.aircrafts OWNER TO postgres;

--
-- Name: aircrafts_aircraft_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.aircrafts_aircraft_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.aircrafts_aircraft_id_seq OWNER TO postgres;

--
-- Name: aircrafts_aircraft_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.aircrafts_aircraft_id_seq OWNED BY public.aircrafts.aircraft_id;


--
-- Name: airports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.airports (
    airport_id integer NOT NULL,
    name character varying(100) NOT NULL,
    city character varying(100) NOT NULL,
    country character varying(100) NOT NULL,
    iata character varying(255) NOT NULL,
    icao character varying(255) NOT NULL,
    timezone character varying(255) NOT NULL
);


ALTER TABLE public.airports OWNER TO postgres;

--
-- Name: airports_airport_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.airports_airport_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.airports_airport_id_seq OWNER TO postgres;

--
-- Name: airports_airport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.airports_airport_id_seq OWNED BY public.airports.airport_id;


--
-- Name: bookings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bookings (
    booking_id integer NOT NULL,
    flight_id integer NOT NULL,
    citizen_id character varying(100) NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    phone_number character varying(20),
    email character varying(100),
    dob date NOT NULL,
    total_passengers integer NOT NULL,
    booking_date timestamp with time zone NOT NULL,
    total_price numeric(20,2) DEFAULT 0.00 NOT NULL
);


ALTER TABLE public.bookings OWNER TO postgres;

--
-- Name: bookings_booking_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bookings_booking_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bookings_booking_id_seq OWNER TO postgres;

--
-- Name: bookings_booking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bookings_booking_id_seq OWNED BY public.bookings.booking_id;


--
-- Name: flights; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.flights (
    flight_id integer NOT NULL,
    flight_number character varying(200) NOT NULL,
    aircraft_id integer NOT NULL,
    departure_airport character varying(100) NOT NULL,
    arrival_airport character varying(100) NOT NULL,
    departure_time timestamp with time zone NOT NULL,
    arrival_time timestamp with time zone NOT NULL,
    status character varying(100) NOT NULL,
    gate character varying(255),
    board_time timestamp with time zone,
    price numeric(20,2) DEFAULT 0.00 NOT NULL
);


ALTER TABLE public.flights OWNER TO postgres;

--
-- Name: flights_flight_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.flights_flight_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.flights_flight_id_seq OWNER TO postgres;

--
-- Name: flights_flight_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.flights_flight_id_seq OWNED BY public.flights.flight_id;


--
-- Name: news; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.news (
    news_id integer NOT NULL,
    title character varying(255) NOT NULL,
    content text NOT NULL,
    category character varying(255) NOT NULL
);


ALTER TABLE public.news OWNER TO postgres;

--
-- Name: news_news_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.news_news_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.news_news_id_seq OWNER TO postgres;

--
-- Name: news_news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.news_news_id_seq OWNED BY public.news.news_id;


--
-- Name: passengers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.passengers (
    passenger_id integer NOT NULL,
    booking_id integer NOT NULL,
    citizen_id character varying(100),
    seat_id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    phone_number character varying(20),
    email character varying(100),
    dob date NOT NULL,
    gender character varying(10) NOT NULL
);


ALTER TABLE public.passengers OWNER TO postgres;

--
-- Name: passengers_passenger_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.passengers_passenger_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.passengers_passenger_id_seq OWNER TO postgres;

--
-- Name: passengers_passenger_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.passengers_passenger_id_seq OWNED BY public.passengers.passenger_id;


--
-- Name: planes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planes (
    aircraft_id integer NOT NULL,
    aircraft_type character varying(100) NOT NULL,
    capacity integer NOT NULL
);


ALTER TABLE public.planes OWNER TO postgres;

--
-- Name: planes_aircraft_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.planes_aircraft_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.planes_aircraft_id_seq OWNER TO postgres;

--
-- Name: planes_aircraft_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.planes_aircraft_id_seq OWNED BY public.planes.aircraft_id;


--
-- Name: seats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.seats (
    seat_id integer NOT NULL,
    aircraft_id integer NOT NULL,
    flight_id integer NOT NULL,
    seat_number character varying(10) NOT NULL,
    seat_type character varying(50) NOT NULL,
    seat_price numeric(10,2) NOT NULL,
    seat_status character varying(50) NOT NULL
);


ALTER TABLE public.seats OWNER TO postgres;

--
-- Name: seats_seat_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seats_seat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seats_seat_id_seq OWNER TO postgres;

--
-- Name: seats_seat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.seats_seat_id_seq OWNED BY public.seats.seat_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    citizen_id character varying(100) NOT NULL,
    username character varying(100) NOT NULL,
    hashed_password character varying(100) NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    email character varying(100),
    phone_number character varying(20),
    dob date NOT NULL,
    gender character varying(10) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_user_id_seq OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: aircrafts aircraft_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aircrafts ALTER COLUMN aircraft_id SET DEFAULT nextval('public.aircrafts_aircraft_id_seq'::regclass);


--
-- Name: airports airport_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.airports ALTER COLUMN airport_id SET DEFAULT nextval('public.airports_airport_id_seq'::regclass);


--
-- Name: bookings booking_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings ALTER COLUMN booking_id SET DEFAULT nextval('public.bookings_booking_id_seq'::regclass);


--
-- Name: flights flight_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flights ALTER COLUMN flight_id SET DEFAULT nextval('public.flights_flight_id_seq'::regclass);


--
-- Name: news news_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news ALTER COLUMN news_id SET DEFAULT nextval('public.news_news_id_seq'::regclass);


--
-- Name: passengers passenger_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passengers ALTER COLUMN passenger_id SET DEFAULT nextval('public.passengers_passenger_id_seq'::regclass);


--
-- Name: planes aircraft_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planes ALTER COLUMN aircraft_id SET DEFAULT nextval('public.planes_aircraft_id_seq'::regclass);


--
-- Name: seats seat_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seats ALTER COLUMN seat_id SET DEFAULT nextval('public.seats_seat_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: aircrafts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aircrafts (aircraft_id, aircraft_manufacturer, aircraft_type, aircraft_name, capacity) FROM stdin;
1	Reynolds, Sutton and Martinez	few	staff	40
2	Clark, Rodriguez and Stewart	believe	window	40
\.


--
-- Data for Name: airports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.airports (airport_id, name, city, country, iata, icao, timezone) FROM stdin;
1	Goroka Airport	Goroka	Papua New Guinea	GKA	AYGA	Pacific/Port_Moresby
2	Madang Airport	Madang	Papua New Guinea	MAG	AYMD	Pacific/Port_Moresby
3	Mount Hagen Kagamuga Airport	Mount Hagen	Papua New Guinea	HGU	AYMH	Pacific/Port_Moresby
4	Nadzab Airport	Nadzab	Papua New Guinea	LAE	AYNZ	Pacific/Port_Moresby
5	Port Moresby Jacksons International Airport	Port Moresby	Papua New Guinea	POM	AYPY	Pacific/Port_Moresby
6	Wewak International Airport	Wewak	Papua New Guinea	WWK	AYWK	Pacific/Port_Moresby
7	Narsarsuaq Airport	Narssarssuaq	Greenland	UAK	BGBW	America/Godthab
8	Godthaab / Nuuk Airport	Godthaab	Greenland	GOH	BGGH	America/Godthab
9	Kangerlussuaq Airport	Sondrestrom	Greenland	SFJ	BGSF	America/Godthab
10	Thule Air Base	Thule	Greenland	THU	BGTL	America/Thule
11	Akureyri Airport	Akureyri	Iceland	AEY	BIAR	Atlantic/Reykjavik
12	Egilsstaðir Airport	Egilsstadir	Iceland	EGS	BIEG	Atlantic/Reykjavik
13	Hornafjörður Airport	Hofn	Iceland	HFN	BIHN	Atlantic/Reykjavik
14	Húsavík Airport	Husavik	Iceland	HZK	BIHU	Atlantic/Reykjavik
15	Ísafjörður Airport	Isafjordur	Iceland	IFJ	BIIS	Atlantic/Reykjavik
16	Keflavik International Airport	Keflavik	Iceland	KEF	BIKF	Atlantic/Reykjavik
17	Patreksfjörður Airport	Patreksfjordur	Iceland	PFJ	BIPA	Atlantic/Reykjavik
18	Reykjavik Airport	Reykjavik	Iceland	RKV	BIRK	Atlantic/Reykjavik
19	Siglufjörður Airport	Siglufjordur	Iceland	SIJ	BISI	Atlantic/Reykjavik
20	Vestmannaeyjar Airport	Vestmannaeyjar	Iceland	VEY	BIVM	Atlantic/Reykjavik
21	Sault Ste Marie Airport	Sault Sainte Marie	Canada	YAM	CYAM	America/Toronto
22	Winnipeg / St. Andrews Airport	Winnipeg	Canada		CYAV	America/Winnipeg
23	Halifax / CFB Shearwater Heliport	Halifax	Canada		CYAW	America/Halifax
24	St. Anthony Airport	St. Anthony	Canada	YAY	CYAY	America/St_Johns
25	Tofino / Long Beach Airport	Tofino	Canada	YAZ	CYAZ	America/Vancouver
26	Kugaaruk Airport	Pelly Bay	Canada	YBB	CYBB	America/Edmonton
27	Baie Comeau Airport	Baie Comeau	Canada	YBC	CYBC	America/Toronto
28	CFB Bagotville	Bagotville	Canada	YBG	CYBG	America/Toronto
29	Baker Lake Airport	Baker Lake	Canada	YBK	CYBK	America/Winnipeg
30	Campbell River Airport	Campbell River	Canada	YBL	CYBL	America/Vancouver
31	Brandon Municipal Airport	Brandon	Canada	YBR	CYBR	America/Winnipeg
32	Cambridge Bay Airport	Cambridge Bay	Canada	YCB	CYCB	America/Edmonton
33	Nanaimo Airport	Nanaimo	Canada	YCD	CYCD	America/Vancouver
34	Castlegar/West Kootenay Regional Airport	Castlegar	Canada	YCG	CYCG	America/Vancouver
35	Miramichi Airport	Chatham	Canada	YCH	CYCH	America/Halifax
36	Charlo Airport	Charlo	Canada	YCL	CYCL	America/Halifax
37	Kugluktuk Airport	Coppermine	Canada	YCO	CYCO	America/Edmonton
38	Coronation Airport	Coronation	Canada	YCT	CYCT	America/Edmonton
39	Chilliwack Airport	Chilliwack	Canada	YCW	CYCW	America/Vancouver
40	Clyde River Airport	Clyde River	Canada	YCY	CYCY	America/Toronto
41	Coral Harbour Airport	Coral Harbour	Canada	YZS	CYZS	America/Coral_Harbour
42	Dawson City Airport	Dawson	Canada	YDA	CYDA	America/Vancouver
43	Burwash Airport	Burwash	Canada	YDB	CYDB	America/Vancouver
44	Princeton Airport	Princeton	Canada		CYDC	America/Vancouver
45	Deer Lake Airport	Deer Lake	Canada	YDF	CYDF	America/St_Johns
46	Dease Lake Airport	Dease Lake	Canada	YDL	CYDL	America/Vancouver
47	Dauphin Barker Airport	Dauphin	Canada	YDN	CYDN	America/Winnipeg
48	Dawson Creek Airport	Dawson Creek	Canada	YDQ	CYDQ	America/Dawson_Creek
49	Edmonton International Airport	Edmonton	Canada	YEG	CYEG	America/Edmonton
50	Arviat Airport	Eskimo Point	Canada	YEK	CYEK	America/Winnipeg
51	Estevan Airport	Estevan	Canada	YEN	CYEN	America/Regina
52	Edson Airport	Edson	Canada	YET	CYET	America/Edmonton
53	Eureka Airport	Eureka	Canada	YEU	CYEU	America/Winnipeg
54	Inuvik Mike Zubko Airport	Inuvik	Canada	YEV	CYEV	America/Edmonton
55	Iqaluit Airport	Iqaluit	Canada	YFB	CYFB	America/Toronto
56	Fredericton Airport	Fredericton	Canada	YFC	CYFC	America/Halifax
57	Forestville Airport	Forestville	Canada	YFE	CYFE	America/Toronto
58	Flin Flon Airport	Flin Flon	Canada	YFO	CYFO	America/Winnipeg
59	Fort Resolution Airport	Fort Resolution	Canada	YFR	CYFR	America/Edmonton
60	Fort Simpson Airport	Fort Simpson	Canada	YFS	CYFS	America/Edmonton
61	Kingston Norman Rogers Airport	Kingston	Canada	YGK	CYGK	America/Toronto
62	La Grande Rivière Airport	La Grande Riviere	Canada	YGL	CYGL	America/Toronto
63	Gaspé (Michel-Pouliot) Airport	Gaspe	Canada	YGP	CYGP	America/Toronto
64	Geraldton Greenstone Regional Airport	Geraldton	Canada	YGQ	CYGQ	America/Toronto
65	Îles-de-la-Madeleine Airport	Iles De La Madeleine	Canada	YGR	CYGR	America/Toronto
66	Hudson Bay Airport	Hudson Bay	Canada	YHB	CYHB	America/Regina
67	Dryden Regional Airport	Dryden	Canada	YHD	CYHD	America/Winnipeg
68	Ulukhaktok Holman Airport	Holman Island	Canada	YHI	CYHI	America/Edmonton
69	Gjoa Haven Airport	Gjoa Haven	Canada	YHK	CYHK	America/Edmonton
70	John C. Munro Hamilton International Airport	Hamilton	Canada	YHM	CYHM	America/Toronto
71	Montréal / Saint-Hubert Airport	Montreal	Canada	YHU	CYHU	America/Toronto
72	Hay River / Merlyn Carter Airport	Hay River	Canada	YHY	CYHY	America/Edmonton
73	Halifax / Stanfield International Airport	Halifax	Canada	YHZ	CYHZ	America/Halifax
74	Atikokan Municipal Airport	Atikokan	Canada	YIB	CYIB	America/Coral_Harbour
75	Pond Inlet Airport	Pond Inlet	Canada	YIO	CYIO	America/Toronto
76	St Jean Airport	St. Jean	Canada	YJN	CYJN	America/Toronto
77	Stephenville Airport	Stephenville	Canada	YJT	CYJT	America/St_Johns
78	Kamloops Airport	Kamloops	Canada	YKA	CYKA	America/Vancouver
79	Waterloo Airport	Waterloo	Canada	YKF	CYKF	America/Toronto
80	Schefferville Airport	Schefferville	Canada	YKL	CYKL	America/Toronto
81	Kindersley Airport	Kindersley	Canada	YKY	CYKY	America/Regina
82	Buttonville Municipal Airport	Toronto	Canada	YKZ	CYKZ	America/Toronto
83	Chapleau Airport	Chapleau	Canada	YLD	CYLD	America/Toronto
84	Meadow Lake Airport	Meadow Lake	Canada	YLJ	CYLJ	America/Regina
85	Lloydminster Airport	Lloydminster	Canada	YLL	CYLL	America/Edmonton
86	Alert Airport	Alert	Canada	YLT	CYLT	America/Toronto
87	Kelowna International Airport	Kelowna	Canada	YLW	CYLW	America/Vancouver
88	Mayo Airport	Mayo	Canada	YMA	CYMA	America/Vancouver
89	Moose Jaw Air Vice Marshal C. M. McEwen Airport	Moose Jaw	Canada	YMJ	CYMJ	America/Regina
90	Fort McMurray Airport	Fort Mcmurray	Canada	YMM	CYMM	America/Edmonton
91	Moosonee Airport	Moosonee	Canada	YMO	CYMO	America/Toronto
92	Maniwaki Airport	Maniwaki	Canada	YMW	CYMW	America/Toronto
93	Montreal International (Mirabel) Airport	Montreal	Canada	YMX	CYMX	America/Toronto
94	Natashquan Airport	Natashquan	Canada	YNA	CYNA	America/Toronto
95	Ottawa / Gatineau Airport	Gatineau	Canada	YND	CYND	America/Toronto
96	Matagami Airport	Matagami	Canada	YNM	CYNM	America/Toronto
97	Old Crow Airport	Old Crow	Canada	YOC	CYOC	America/Vancouver
98	CFB Cold Lake	Cold Lake	Canada	YOD	CYOD	America/Edmonton
99	High Level Airport	High Level	Canada	YOJ	CYOJ	America/Edmonton
100	Ottawa Macdonald-Cartier International Airport	Ottawa	Canada	YOW	CYOW	America/Toronto
101	Prince Albert Glass Field	Prince Albert	Canada	YPA	CYPA	America/Regina
102	Peace River Airport	Peace River	Canada	YPE	CYPE	America/Edmonton
103	Southport Airport	Portage-la-prairie	Canada	YPG	CYPG	America/Winnipeg
104	Pitt Meadows Airport	Pitt Meadows	Canada		CYPK	America/Vancouver
105	Pickle Lake Airport	Pickle Lake	Canada	YPL	CYPL	America/Coral_Harbour
106	Port Menier Airport	Port Menier	Canada	YPN	CYPN	America/Toronto
107	Peterborough Airport	Peterborough	Canada	YPQ	CYPQ	America/Toronto
108	Prince Rupert Airport	Prince Pupert	Canada	YPR	CYPR	America/Vancouver
109	Fort Chipewyan Airport	Fort Chipewyan	Canada	YPY	CYPY	America/Edmonton
110	Muskoka Airport	Muskoka	Canada	YQA	CYQA	America/Toronto
111	Quebec Jean Lesage International Airport	Quebec	Canada	YQB	CYQB	America/Toronto
112	Red Deer Regional Airport	Red Deer Industrial	Canada	YQF	CYQF	America/Edmonton
113	Windsor Airport	Windsor	Canada	YQG	CYQG	America/Toronto
114	Watson Lake Airport	Watson Lake	Canada	YQH	CYQH	America/Vancouver
115	Kenora Airport	Kenora	Canada	YQK	CYQK	America/Winnipeg
116	Lethbridge County Airport	Lethbridge	Canada	YQL	CYQL	America/Edmonton
117	Greater Moncton International Airport	Moncton	Canada	YQM	CYQM	America/Halifax
118	Comox Airport	Comox	Canada	YQQ	CYQQ	America/Vancouver
119	Regina International Airport	Regina	Canada	YQR	CYQR	America/Regina
120	Thunder Bay Airport	Thunder Bay	Canada	YQT	CYQT	America/Toronto
121	Grande Prairie Airport	Grande Prairie	Canada	YQU	CYQU	America/Edmonton
122	Yorkton Municipal Airport	Yorkton	Canada	YQV	CYQV	America/Regina
123	North Battleford Airport	North Battleford	Canada	YQW	CYQW	America/Regina
124	Gander International Airport	Gander	Canada	YQX	CYQX	America/St_Johns
125	Sydney / J.A. Douglas McCurdy Airport	Sydney	Canada	YQY	CYQY	America/Halifax
126	Quesnel Airport	Quesnel	Canada	YQZ	CYQZ	America/Vancouver
127	Resolute Bay Airport	Resolute	Canada	YRB	CYRB	America/Winnipeg
128	Rivière-du-Loup Airport	Riviere Du Loup	Canada	YRI	CYRI	America/Toronto
129	Roberval Airport	Roberval	Canada	YRJ	CYRJ	America/Toronto
130	Rocky Mountain House Airport	Rocky Mountain House	Canada	YRM	CYRM	America/Edmonton
131	Rankin Inlet Airport	Rankin Inlet	Canada	YRT	CYRT	America/Winnipeg
132	Sudbury Airport	Sudbury	Canada	YSB	CYSB	America/Toronto
133	Sherbrooke Airport	Sherbrooke	Canada	YSC	CYSC	America/Toronto
134	Saint John Airport	St. John	Canada	YSJ	CYSJ	America/Halifax
135	Fort Smith Airport	Fort Smith	Canada	YSM	CYSM	America/Edmonton
136	Nanisivik Airport	Nanisivik	Canada	YSR	CYSR	America/Toronto
137	Summerside Airport	Summerside	Canada	YSU	CYSU	America/Halifax
138	Sachs Harbour (David Nasogaluak Jr. Saaryuaq) Airport	Sachs Harbour	Canada	YSY	CYSY	America/Edmonton
139	Cape Dorset Airport	Cape Dorset	Canada	YTE	CYTE	America/Toronto
140	Thompson Airport	Thompson	Canada	YTH	CYTH	America/Winnipeg
141	CFB Trenton	Trenton	Canada	YTR	CYTR	America/Toronto
142	Timmins/Victor M. Power	Timmins	Canada	YTS	CYTS	America/Toronto
143	Billy Bishop Toronto City Centre Airport	Toronto	Canada	YTZ	CYTZ	America/Toronto
144	Tuktoyaktuk Airport	Tuktoyaktuk	Canada	YUB	CYUB	America/Edmonton
145	Montreal / Pierre Elliott Trudeau International Airport	Montreal	Canada	YUL	CYUL	America/Toronto
146	Repulse Bay Airport	Repulse Bay	Canada	YUT	CYUT	America/Winnipeg
147	Hall Beach Airport	Hall Beach	Canada	YUX	CYUX	America/Toronto
148	Rouyn Noranda Airport	Rouyn	Canada	YUY	CYUY	America/Toronto
149	La Ronge Airport	La Ronge	Canada	YVC	CYVC	America/Regina
150	Vermilion Airport	Vermillion	Canada	YVG	CYVG	America/Edmonton
151	Qikiqtarjuaq Airport	Broughton Island	Canada	YVM	CYVM	America/Toronto
152	Val-d'Or Airport	Val D'or	Canada	YVO	CYVO	America/Toronto
153	Kuujjuaq Airport	Quujjuaq	Canada	YVP	CYVP	America/Toronto
154	Norman Wells Airport	Norman Wells	Canada	YVQ	CYVQ	America/Edmonton
155	Vancouver International Airport	Vancouver	Canada	YVR	CYVR	America/Vancouver
156	Buffalo Narrows Airport	Buffalo Narrows	Canada	YVT	CYVT	America/Regina
157	Wiarton Airport	Wiarton	Canada	YVV	CYVV	America/Toronto
158	Petawawa Airport	Petawawa	Canada	YWA	CYWA	America/Toronto
159	Winnipeg / James Armstrong Richardson International Airport	Winnipeg	Canada	YWG	CYWG	America/Winnipeg
160	Wabush Airport	Wabush	Canada	YWK	CYWK	America/Halifax
161	Williams Lake Airport	Williams Lake	Canada	YWL	CYWL	America/Vancouver
162	Wrigley Airport	Wrigley	Canada	YWY	CYWY	America/Edmonton
163	Cranbrook/Canadian Rockies International Airport	Cranbrook	Canada	YXC	CYXC	America/Edmonton
164	Edmonton City Centre (Blatchford Field) Airport	Edmonton	Canada	YXD	CYXD	America/Edmonton
165	Saskatoon John G. Diefenbaker International Airport	Saskatoon	Canada	YXE	CYXE	America/Regina
166	Medicine Hat Airport	Medicine Hat	Canada	YXH	CYXH	America/Edmonton
167	Fort St John Airport	Fort Saint John	Canada	YXJ	CYXJ	America/Dawson_Creek
168	Sioux Lookout Airport	Sioux Lookout	Canada	YXL	CYXL	America/Winnipeg
169	Pangnirtung Airport	Pangnirtung	Canada	YXP	CYXP	America/Toronto
170	Earlton (Timiskaming Regional) Airport	Earlton	Canada	YXR	CYXR	America/Toronto
171	Prince George Airport	Prince George	Canada	YXS	CYXS	America/Vancouver
172	Northwest Regional Airport Terrace-Kitimat	Terrace	Canada	YXT	CYXT	America/Vancouver
173	London Airport	London	Canada	YXU	CYXU	America/Toronto
174	Abbotsford Airport	Abbotsford	Canada	YXX	CYXX	America/Vancouver
175	Whitehorse / Erik Nielsen International Airport	Whitehorse	Canada	YXY	CYXY	America/Vancouver
176	North Bay Jack Garland Airport	North Bay	Canada	YYB	CYYB	America/Toronto
177	Calgary International Airport	Calgary	Canada	YYC	CYYC	America/Edmonton
178	Smithers Airport	Smithers	Canada	YYD	CYYD	America/Vancouver
179	Fort Nelson Airport	Fort Nelson	Canada	YYE	CYYE	America/Vancouver
180	Penticton Airport	Penticton	Canada	YYF	CYYF	America/Vancouver
181	Charlottetown Airport	Charlottetown	Canada	YYG	CYYG	America/Halifax
182	Taloyoak Airport	Spence Bay	Canada	YYH	CYYH	America/Edmonton
183	Victoria International Airport	Victoria	Canada	YYJ	CYYJ	America/Vancouver
184	Lynn Lake Airport	Lynn Lake	Canada	YYL	CYYL	America/Winnipeg
185	Swift Current Airport	Swift Current	Canada	YYN	CYYN	America/Regina
186	Churchill Airport	Churchill	Canada	YYQ	CYYQ	America/Winnipeg
187	Goose Bay Airport	Goose Bay	Canada	YYR	CYYR	America/Halifax
188	St. John's International Airport	St. John's	Canada	YYT	CYYT	America/St_Johns
189	Kapuskasing Airport	Kapuskasing	Canada	YYU	CYYU	America/Toronto
190	Armstrong Airport	Armstrong	Canada	YYW	CYYW	America/Toronto
191	Mont Joli Airport	Mont Joli	Canada	YYY	CYYY	America/Toronto
192	Lester B. Pearson International Airport	Toronto	Canada	YYZ	CYYZ	America/Toronto
193	Downsview Airport	Toronto	Canada	YZD	CYZD	America/Toronto
194	Gore Bay Manitoulin Airport	Gore Bay	Canada	YZE	CYZE	America/Toronto
195	Yellowknife Airport	Yellowknife	Canada	YZF	CYZF	America/Edmonton
196	Slave Lake Airport	Slave Lake	Canada	YZH	CYZH	America/Edmonton
197	Sandspit Airport	Sandspit	Canada	YZP	CYZP	America/Vancouver
198	Chris Hadfield Airport	Sarnia	Canada	YZR	CYZR	America/Toronto
199	Port Hardy Airport	Port Hardy	Canada	YZT	CYZT	America/Vancouver
200	Whitecourt Airport	Whitecourt	Canada	YZU	CYZU	America/Edmonton
201	Sept-Îles Airport	Sept-iles	Canada	YZV	CYZV	America/Toronto
202	Teslin Airport	Teslin	Canada	YZW	CYZW	America/Vancouver
203	CFB Greenwood	Greenwood	Canada	YZX	CYZX	America/Halifax
204	Faro Airport	Faro	Canada	ZFA	CZFA	America/Vancouver
205	Fort Mcpherson Airport	Fort Mcpherson	Canada	ZFM	CZFM	America/Edmonton
206	Blida Airport	Blida	Algeria	QLD	DAAB	Africa/Algiers
207	Bou Saada Airport	Bou Saada	Algeria	BUJ	DAAD	Africa/Algiers
208	Soummam Airport	Bejaja	Algeria	BJA	DAAE	Africa/Algiers
209	Houari Boumediene Airport	Algier	Algeria	ALG	DAAG	Africa/Algiers
210	Djanet Inedbirene Airport	Djanet	Algeria	DJG	DAAJ	Africa/Algiers
211	Boufarik Airport	Boufarik	Algeria		DAAK	Africa/Algiers
212	Reggane Airport	Reggan	Algeria		DAAN	Africa/Algiers
213	Illizi Takhamalt Airport	Illizi	Algeria	VVZ	DAAP	Africa/Algiers
214	Ain Oussera Airport	Ain Oussera	Algeria		DAAQ	Africa/Algiers
215	Aguenar – Hadj Bey Akhamok Airport	Tamanrasset	Algeria	TMR	DAAT	Africa/Algiers
216	Jijel Ferhat Abbas Airport	Jijel	Algeria	GJL	DAAV	Africa/Algiers
217	Mecheria Airport	Mecheria	Algeria	MZW	DAAY	Africa/Algiers
218	Relizane Airport	Relizane	Algeria		DAAZ	Africa/Algiers
219	Rabah Bitat Airport	Annaba	Algeria	AAE	DABB	Africa/Algiers
220	Mohamed Boudiaf International Airport	Constantine	Algeria	CZL	DABC	Africa/Algiers
221	Cheikh Larbi Tébessi Airport	Tebessa	Algeria	TEE	DABS	Africa/Algiers
222	Hassi R'Mel Airport	Tilrempt	Algeria	HRM	DAFH	Africa/Algiers
223	Bou Chekif Airport	Tiaret	Algeria	TID	DAOB	Africa/Algiers
224	Bou Sfer Airport	Bou Sfer	Algeria		DAOE	Africa/Algiers
225	Tindouf Airport	Tindouf	Algeria	TIN	DAOF	Africa/Algiers
226	Ech Cheliff Airport	Ech-cheliff	Algeria	CFK	DAOI	Africa/Algiers
227	Tafaraoui Airport	Oran	Algeria	TAF	DAOL	Africa/Algiers
228	Zenata – Messali El Hadj Airport	Tlemcen	Algeria	TLM	DAON	Africa/Algiers
229	Es Senia Airport	Oran	Algeria	ORN	DAOO	Africa/Algiers
230	Sidi Bel Abbes Airport	Sidi Bel Abbes	Algeria	BFW	DAOS	Africa/Algiers
231	Ghriss Airport	Ghriss	Algeria	MUW	DAOV	Africa/Algiers
232	Touat Cheikh Sidi Mohamed Belkebir Airport	Adrar	Algeria	AZR	DAUA	Africa/Algiers
233	Biskra Airport	Biskra	Algeria	BSK	DAUB	Africa/Algiers
234	El Golea Airport	El Golea	Algeria	ELG	DAUE	Africa/Algiers
235	Noumérat - Moufdi Zakaria Airport	Ghardaia	Algeria	GHA	DAUG	Africa/Algiers
236	Oued Irara Airport	Hassi Messaoud	Algeria	HME	DAUH	Africa/Algiers
237	In Salah Airport	In Salah	Algeria	INZ	DAUI	Africa/Algiers
238	Touggourt Sidi Madhi Airport	Touggourt	Algeria	TGR	DAUK	Africa/Algiers
239	Laghouat Airport	Laghouat	Algeria	LOO	DAUL	Africa/Algiers
240	Timimoun Airport	Timimoun	Algeria	TMX	DAUT	Africa/Algiers
241	Ain el Beida Airport	Ouargla	Algeria	OGX	DAUU	Africa/Algiers
242	In Aménas Airport	Zarzaitine	Algeria	IAM	DAUZ	Africa/Algiers
243	Cadjehoun Airport	Cotonou	Benin	COO	DBBB	Africa/Porto-Novo
244	Ouagadougou Airport	Ouagadougou	Burkina Faso	OUA	DFFD	Africa/Ouagadougou
245	Bobo Dioulasso Airport	Bobo-dioulasso	Burkina Faso	BOY	DFOO	Africa/Ouagadougou
246	Kotoka International Airport	Accra	Ghana	ACC	DGAA	Africa/Accra
247	Tamale Airport	Tamale	Ghana	TML	DGLE	Africa/Accra
248	Wa Airport	Wa	Ghana		DGLW	Africa/Accra
249	Sunyani Airport	Sunyani	Ghana	NYI	DGSN	Africa/Accra
250	Takoradi Airport	Takoradi	Ghana	TKD	DGTK	Africa/Accra
251	Port Bouet Airport	Abidjan	Cote d'Ivoire	ABJ	DIAP	Africa/Abidjan
252	Bouaké Airport	Bouake	Cote d'Ivoire	BYK	DIBK	Africa/Abidjan
253	Daloa Airport	Daloa	Cote d'Ivoire	DJO	DIDL	Africa/Abidjan
254	Korhogo Airport	Korhogo	Cote d'Ivoire	HGO	DIKO	Africa/Abidjan
255	Man Airport	Man	Cote d'Ivoire	MJC	DIMN	Africa/Abidjan
256	San Pedro Airport	San Pedro	Cote d'Ivoire	SPY	DISP	Africa/Abidjan
257	Yamoussoukro Airport	Yamoussoukro	Cote d'Ivoire	ASK	DIYO	Africa/Abidjan
258	Nnamdi Azikiwe International Airport	Abuja	Nigeria	ABV	DNAA	Africa/Lagos
259	Akure Airport	Akure	Nigeria	AKR	DNAK	Africa/Lagos
260	Benin Airport	Benin	Nigeria	BNI	DNBE	Africa/Lagos
261	Margaret Ekpo International Airport	Calabar	Nigeria	CBQ	DNCA	Africa/Lagos
262	Akanu Ibiam International Airport	Enugu	Nigeria	ENU	DNEN	Africa/Lagos
263	Gusau Airport	Gusau	Nigeria		DNGU	Africa/Lagos
264	Ibadan Airport	Ibadan	Nigeria	IBA	DNIB	Africa/Lagos
265	Ilorin International Airport	Ilorin	Nigeria	ILR	DNIL	Africa/Lagos
266	Yakubu Gowon Airport	Jos	Nigeria	JOS	DNJO	Africa/Lagos
267	Kaduna Airport	Kaduna	Nigeria	KAD	DNKA	Africa/Lagos
268	Mallam Aminu International Airport	Kano	Nigeria	KAN	DNKN	Africa/Lagos
269	Maiduguri International Airport	Maiduguri	Nigeria	MIU	DNMA	Africa/Lagos
270	Makurdi Airport	Makurdi	Nigeria	MDI	DNMK	Africa/Lagos
271	Murtala Muhammed International Airport	Lagos	Nigeria	LOS	DNMM	Africa/Lagos
272	Minna Airport	Minna	Nigeria	MXJ	DNMN	Africa/Lagos
273	Port Harcourt International Airport	Port Hartcourt	Nigeria	PHC	DNPO	Africa/Lagos
274	Sadiq Abubakar III International Airport	Sokoto	Nigeria	SKO	DNSO	Africa/Lagos
275	Yola Airport	Yola	Nigeria	YOL	DNYO	Africa/Lagos
276	Zaria Airport	Zaria	Nigeria	ZAR	DNZA	Africa/Lagos
277	Maradi Airport	Maradi	Niger	MFQ	DRRM	Africa/Niamey
278	Diori Hamani International Airport	Niamey	Niger	NIM	DRRN	Africa/Niamey
279	Tahoua Airport	Tahoua	Niger	THZ	DRRT	Africa/Niamey
280	Mano Dayak International Airport	Agadez	Niger	AJY	DRZA	Africa/Niamey
281	Dirkou Airport	Dirkou	Niger		DRZD	Africa/Niamey
282	Diffa Airport	Diffa	Niger		DRZF	Africa/Niamey
283	Zinder Airport	Zinder	Niger	ZND	DRZR	Africa/Niamey
284	Monastir Habib Bourguiba International Airport	Monastir	Tunisia	MIR	DTMB	Africa/Tunis
285	Tunis Carthage International Airport	Tunis	Tunisia	TUN	DTTA	Africa/Tunis
286	Sidi Ahmed Air Base	Bizerte	Tunisia		DTTB	Africa/Tunis
287	Remada Air Base	Remada	Tunisia		DTTD	Africa/Tunis
288	Gafsa Ksar International Airport	Gafsa	Tunisia	GAF	DTTF	Africa/Tunis
289	Gabès Matmata International Airport	Gabes	Tunisia	GAE	DTTG	Africa/Tunis
290	Borj El Amri Airport	Bordj El Amri	Tunisia		DTTI	Africa/Tunis
291	Djerba Zarzis International Airport	Djerba	Tunisia	DJE	DTTJ	Africa/Tunis
292	El Borma Airport	El Borma	Tunisia	EBM	DTTR	Africa/Tunis
293	Sfax Thyna International Airport	Sfax	Tunisia	SFA	DTTX	Africa/Tunis
294	Tozeur Nefta International Airport	Tozeur	Tunisia	TOE	DTTZ	Africa/Tunis
295	Niamtougou International Airport	Niatougou	Togo	LRL	DXNG	Africa/Lome
296	Lomé-Tokoin Airport	Lome	Togo	LFW	DXXX	Africa/Lome
297	Antwerp International Airport (Deurne)	Antwerp	Belgium	ANR	EBAW	Europe/Brussels
298	Beauvechain Air Base	Beauvechain	Belgium		EBBE	Europe/Brussels
299	Kleine Brogel Air Base	Kleine Brogel	Belgium		EBBL	Europe/Brussels
300	Brussels Airport	Brussels	Belgium	BRU	EBBR	Europe/Brussels
301	Jehonville Air Base	Bertrix	Belgium		EBBX	Europe/Brussels
302	Brussels South Charleroi Airport	Charleroi	Belgium	CRL	EBCI	Europe/Brussels
303	Chièvres Air Base	Chievres	Belgium		EBCV	Europe/Brussels
304	Koksijde Air Base	Koksijde	Belgium		EBFN	Europe/Brussels
305	Florennes Air Base	Florennes	Belgium		EBFS	Europe/Brussels
306	Wevelgem Airport	Kortrijk-vevelgem	Belgium	KJK	EBKT	Europe/Brussels
307	Liège Airport	Liege	Belgium	LGG	EBLG	Europe/Brussels
308	Ostend-Bruges International Airport	Ostend	Belgium	OST	EBOS	Europe/Brussels
309	Zutendaal Air Base	Zutendaal	Belgium		EBSL	Europe/Brussels
310	Brustem Airfield Sint Truiden	Sint-truiden	Belgium		EBST	Europe/Brussels
311	Saint Hubert Air Base	St.-hubert	Belgium		EBSU	Europe/Brussels
312	Ursel Air Base	Ursel	Belgium		EBUL	Europe/Brussels
313	Weelde Air Base	Weelde	Belgium		EBWE	Europe/Brussels
314	Zoersel (Oostmalle) Airfield	Zoersel	Belgium	OBL	EBZR	Europe/Brussels
315	Flugplatz Bautzen	Bautzen	Germany		EDAB	Europe/Berlin
316	Altenburg-Nobitz Airport	Altenburg	Germany	AOC	EDAC	Europe/Berlin
317	Dessau Airfield	Dessau	Germany		EDAD	Europe/Berlin
318	Eisenhüttenstadt Airfield	Eisenhuettenstadt	Germany		EDAE	Europe/Berlin
319	Großenhain Airport	Suhl	Germany		EDAK	Europe/Berlin
320	Merseburg Airport	Muehlhausen	Germany		EDAM	Europe/Berlin
321	Halle-Oppin Airport	Halle	Germany		EDAQ	Europe/Berlin
322	Riesa-Göhlis Airport	Riesa	Germany	IES	EDAU	Europe/Berlin
323	Rechlin-Lärz Airport	Rechlin-laerz	Germany	REB	EDAX	Europe/Berlin
324	Strausberg Airport	Strausberg	Germany		EDAY	Europe/Berlin
325	Schönhagen Airport	Schoenhagen	Germany	QXH	EDAZ	Europe/Berlin
326	Barth Airport	Barth	Germany	BBH	EDBH	Europe/Berlin
327	Jena-Schöngleina Airfield	Jena	Germany		EDBJ	Europe/Berlin
328	Kyritz Airport	Kyritz	Germany		EDBK	Europe/Berlin
329	Magdeburg ""City"" Airport	Magdeburg	Germany	ZMG	EDBM	Europe/Berlin
330	Rothenburg/Görlitz Airport	Rothenburg/ol	Germany		EDBR	Europe/Berlin
331	Anklam Airfield	Anklam	Germany		EDCA	Europe/Berlin
332	Cottbus-Drewitz Airport	Cottbus	Germany	CBU	EDCD	Europe/Berlin
333	Kamenz Airport	Kamenz	Germany		EDCM	Europe/Berlin
334	Berlin-Schönefeld Airport	Berlin	Germany	SXF	EDDB	Europe/Berlin
335	Dresden Airport	Dresden	Germany	DRS	EDDC	Europe/Berlin
336	Erfurt Airport	Erfurt	Germany	ERF	EDDE	Europe/Berlin
337	Frankfurt am Main Airport	Frankfurt	Germany	FRA	EDDF	Europe/Berlin
338	Münster Osnabrück Airport	Munster	Germany	FMO	EDDG	Europe/Berlin
339	Hamburg Airport	Hamburg	Germany	HAM	EDDH	Europe/Berlin
340	Berlin-Tempelhof International Airport	Berlin	Germany	THF	EDDI	Europe/Berlin
341	Cologne Bonn Airport	Cologne	Germany	CGN	EDDK	Europe/Berlin
342	Düsseldorf Airport	Duesseldorf	Germany	DUS	EDDL	Europe/Berlin
343	Munich Airport	Munich	Germany	MUC	EDDM	Europe/Berlin
344	Nuremberg Airport	Nuernberg	Germany	NUE	EDDN	Europe/Berlin
345	Leipzig/Halle Airport	Leipzig	Germany	LEJ	EDDP	Europe/Berlin
346	Saarbrücken Airport	Saarbruecken	Germany	SCN	EDDR	Europe/Berlin
347	Stuttgart Airport	Stuttgart	Germany	STR	EDDS	Europe/Berlin
348	Berlin-Tegel Airport	Berlin	Germany	TXL	EDDT	Europe/Berlin
349	Hannover Airport	Hannover	Germany	HAJ	EDDV	Europe/Berlin
350	Bremen Airport	Bremen	Germany	BRE	EDDW	Europe/Berlin
351	Frankfurt-Egelsbach Airport	Egelsbach	Germany	QEF	EDFE	Europe/Berlin
352	Frankfurt-Hahn Airport	Hahn	Germany	HHN	EDFH	Europe/Berlin
353	Mannheim-City Airport	Mannheim	Germany	MHG	EDFM	Europe/Berlin
354	Allendorf/Eder Airport	Allendorf	Germany		EDFQ	Europe/Berlin
355	Worms Airport	Worms	Germany		EDFV	Europe/Berlin
356	Mainz-Finthen Airport	Mainz	Germany		EDFZ	Europe/Berlin
357	Eisenach-Kindel Airport	Eisenach	Germany	EIB	EDGE	Europe/Berlin
358	Siegerland Airport	Siegerland	Germany	SGE	EDGS	Europe/Berlin
359	Hamburg-Finkenwerder Airport	Hamburg	Germany	XFW	EDHI	Europe/Berlin
360	Kiel-Holtenau Airport	Kiel	Germany	KEL	EDHK	Europe/Berlin
361	Lübeck Blankensee Airport	Luebeck	Germany	LBC	EDHL	Europe/Berlin
362	Flugplatz Dahlemer Binz	Dahlemer Binz	Germany		EDKV	Europe/Berlin
363	Meinerzhagen Airport	Meinerzhagen	Germany		EDKZ	Europe/Berlin
364	Arnsberg-Menden Airport	Arnsberg	Germany		EDLA	Europe/Berlin
365	Essen Mulheim Airport	Essen	Germany	ESS	EDLE	Europe/Berlin
366	Bielefeld Airport	Bielefeld	Germany	BFE	EDLI	Europe/Berlin
367	Mönchengladbach Airport	Moenchengladbach	Germany	MGL	EDLN	Europe/Berlin
368	Paderborn Lippstadt Airport	Paderborn	Germany	PAD	EDLP	Europe/Berlin
369	Stadtlohn-Vreden Airport	Stadtlohn	Germany		EDLS	Europe/Berlin
370	Dortmund Airport	Dortmund	Germany	DTM	EDLW	Europe/Berlin
371	Augsburg Airport	Augsburg	Germany	AGB	EDMA	Europe/Berlin
372	Biberach a.d. Riß Airfield	Biberach	Germany		EDMB	Europe/Berlin
373	Eggenfelden Airport	Eggenfelden	Germany		EDME	Europe/Berlin
374	Mindelheim-Mattsies Airfield	Mindelheim	Germany		EDMN	Europe/Berlin
375	Oberpfaffenhofen Airport	Oberpfaffenhofen	Germany	OBF	EDMO	Europe/Berlin
376	Straubing Airport	Straubing	Germany	RBM	EDMS	Europe/Berlin
377	Vilshofen Airport	Vilshofen	Germany		EDMV	Europe/Berlin
378	Leutkirch-Unterzeil Airport	Leutkirch	Germany		EDNL	Europe/Berlin
379	Friedrichshafen Airport	Friedrichshafen	Germany	FDH	EDNY	Europe/Berlin
380	Schwerin Parchim Airport	Parchim	Germany	SZW	EDOP	Europe/Berlin
381	Stendal-Borstel Airport	Stendal	Germany		EDOV	Europe/Berlin
382	Aalen-Heidenheim/Elchingen Airport	Aalen-heidenheim	Germany		EDPA	Europe/Berlin
383	Bayreuth Airport	Bayreuth	Germany	BYU	EDQD	Europe/Berlin
384	Burg Feuerstein Airport	Burg Feuerstein	Germany	URD	EDQE	Europe/Berlin
385	Hof-Plauen Airport	Hof	Germany	HOQ	EDQM	Europe/Berlin
386	Haßfurt-Schweinfurt Airport	Hassfurt	Germany		EDQT	Europe/Berlin
387	Koblenz-Winningen Airfield	Koblenz	Germany		EDRK	Europe/Berlin
388	Trier-Föhren Airport	Trier	Germany		EDRT	Europe/Berlin
389	Speyer Airfield	Speyer	Germany		EDRY	Europe/Berlin
390	Zweibrücken Airport	Zweibruecken	Germany	ZQW	EDRZ	Europe/Berlin
391	Donaueschingen-Villingen Airport	Donaueschingen	Germany	ZQL	EDTD	Europe/Berlin
392	Freiburg i. Br. Airport	Freiburg	Germany		EDTF	Europe/Berlin
393	Mengen-Hohentengen Airport	Mengen	Germany		EDTM	Europe/Berlin
394	Adolf Würth Airport	Schwaebisch Hall	Germany		EDTY	Europe/Berlin
395	Finsterwalde/Schacksdorf Airport	Soest	Germany		EDUS	Europe/Berlin
396	Braunschweig-Wolfsburg Airport	Braunschweig	Germany	BWE	EDVE	Europe/Berlin
397	Kassel-Calden Airport	Kassel	Germany	KSF	EDVK	Europe/Berlin
398	Hildesheim Airport	Hildesheim	Germany		EDVM	Europe/Berlin
399	Bremerhaven Airport	Bremerhaven	Germany	BRV	EDWB	Europe/Berlin
400	Emden Airport	Emden	Germany	EME	EDWE	Europe/Berlin
401	Leer-Papenburg Airport	Leer	Germany		EDWF	Europe/Berlin
402	Wilhelmshaven-Mariensiel Airport	Wilhelmshaven	Germany	WVN	EDWI	Europe/Berlin
403	Borkum Airport	Borkum	Germany	BMK	EDWR	Europe/Berlin
404	Norderney Airport	Norderney	Germany	NRD	EDWY	Europe/Berlin
405	Flensburg-Schäferhaus Airport	Flensburg	Germany	FLF	EDXF	Europe/Berlin
406	Rendsburg-Schachtholm Airport	Rendsburg	Germany		EDXR	Europe/Berlin
407	Westerland Sylt Airport	Westerland	Germany	GWT	EDXW	Europe/Berlin
408	Ämari Air Base	Armari Air Force Base	Estonia		EEEI	Europe/Tallinn
409	Kärdla Airport	Kardla	Estonia	KDL	EEKA	Europe/Tallinn
410	Kuressaare Airport	Kuressaare	Estonia	URE	EEKE	Europe/Tallinn
411	Pärnu Airport	Parnu	Estonia	EPU	EEPU	Europe/Tallinn
412	Lennart Meri Tallinn Airport	Tallinn-ulemiste International	Estonia	TLL	EETN	Europe/Tallinn
413	Tartu Airport	Tartu	Estonia	TAY	EETU	Europe/Tallinn
414	Enontekio Airport	Enontekio	Finland	ENF	EFET	Europe/Helsinki
415	Eura Airport	Eura	Finland		EFEU	Europe/Helsinki
416	Halli Airport	Halli	Finland	KEV	EFHA	Europe/Helsinki
417	Helsinki Malmi Airport	Helsinki	Finland	HEM	EFHF	Europe/Helsinki
418	Helsinki Vantaa Airport	Helsinki	Finland	HEL	EFHK	Europe/Helsinki
419	Hameenkyro Airport	Hameenkyro	Finland		EFHM	Europe/Helsinki
420	Hanko Airport	Hanko	Finland		EFHN	Europe/Helsinki
421	Hyvinkää Airfield	Hyvinkaa	Finland	HYV	EFHV	Europe/Helsinki
422	Kiikala Airport	Kikala	Finland		EFIK	Europe/Helsinki
423	Immola Airport	Immola	Finland		EFIM	Europe/Helsinki
424	Kitee Airport	Kitee	Finland	KTQ	EFIT	Europe/Helsinki
425	Ivalo Airport	Ivalo	Finland	IVL	EFIV	Europe/Helsinki
426	Joensuu Airport	Joensuu	Finland	JOE	EFJO	Europe/Helsinki
427	Jyvaskyla Airport	Jyvaskyla	Finland	JYV	EFJY	Europe/Helsinki
428	Kauhava Airport	Kauhava	Finland	KAU	EFKA	Europe/Helsinki
429	Kemi-Tornio Airport	Kemi	Finland	KEM	EFKE	Europe/Helsinki
430	Kajaani Airport	Kajaani	Finland	KAJ	EFKI	Europe/Helsinki
431	Kauhajoki Airport	Kauhajoki	Finland	KHJ	EFKJ	Europe/Helsinki
432	Kokkola-Pietarsaari Airport	Kruunupyy	Finland	KOK	EFKK	Europe/Helsinki
433	Kemijarvi Airport	Kemijarvi	Finland		EFKM	Europe/Helsinki
434	Kuusamo Airport	Kuusamo	Finland	KAO	EFKS	Europe/Helsinki
435	Kittilä Airport	Kittila	Finland	KTT	EFKT	Europe/Helsinki
436	Kuopio Airport	Kuopio	Finland	KUO	EFKU	Europe/Helsinki
437	Lahti Vesivehmaa Airport	Vesivehmaa	Finland	QLF	EFLA	Europe/Helsinki
438	Lappeenranta Airport	Lappeenranta	Finland	LPP	EFLP	Europe/Helsinki
439	Mariehamn Airport	Mariehamn	Finland	MHQ	EFMA	Europe/Mariehamn
440	Menkijarvi Airport	Menkijarvi	Finland		EFME	Europe/Helsinki
441	Mikkeli Airport	Mikkeli	Finland	MIK	EFMI	Europe/Helsinki
442	Nummela Airport	Nummela	Finland		EFNU	Europe/Helsinki
443	Oulu Airport	Oulu	Finland	OUL	EFOU	Europe/Helsinki
444	Piikajarvi Airport	Piikajarvi	Finland		EFPI	Europe/Helsinki
445	Pori Airport	Pori	Finland	POR	EFPO	Europe/Helsinki
446	Pudasjärvi Airport	Pudasjarvi	Finland		EFPU	Europe/Helsinki
447	Pyhäsalmi Airport	Pyhasalmi	Finland		EFPY	Europe/Helsinki
448	Raahe Pattijoki Airport	Pattijoki	Finland		EFRH	Europe/Helsinki
449	Rantasalmi Airport	Rantasalmi	Finland		EFRN	Europe/Helsinki
450	Rovaniemi Airport	Rovaniemi	Finland	RVN	EFRO	Europe/Helsinki
451	Rayskala Airport	Rayskala	Finland		EFRY	Europe/Helsinki
452	Savonlinna Airport	Savonlinna	Finland	SVL	EFSA	Europe/Helsinki
453	Selanpaa Airport	Selanpaa	Finland		EFSE	Europe/Helsinki
454	Sodankyla Airport	Sodankyla	Finland	SOT	EFSO	Europe/Helsinki
455	Tampere-Pirkkala Airport	Tampere	Finland	TMP	EFTP	Europe/Helsinki
456	Teisko Airport	Teisko	Finland		EFTS	Europe/Helsinki
457	Turku Airport	Turku	Finland	TKU	EFTU	Europe/Helsinki
458	Utti Air Base	Utti	Finland	UTI	EFUT	Europe/Helsinki
459	Vaasa Airport	Vaasa	Finland	VAA	EFVA	Europe/Helsinki
460	Varkaus Airport	Varkaus	Finland	VRK	EFVR	Europe/Helsinki
461	Ylivieska Airfield	Ylivieska-raudaskyla	Finland	YLI	EFYL	Europe/Helsinki
462	Belfast International Airport	Belfast	United Kingdom	BFS	EGAA	Europe/London
463	St Angelo Airport	Enniskillen	United Kingdom	ENK	EGAB	Europe/London
464	George Best Belfast City Airport	Belfast	United Kingdom	BHD	EGAC	Europe/London
465	City of Derry Airport	Londonderry	United Kingdom	LDY	EGAE	Europe/London
466	Birmingham International Airport	Birmingham	United Kingdom	BHX	EGBB	Europe/London
467	Coventry Airport	Coventry	United Kingdom	CVT	EGBE	Europe/London
468	Leicester Airport	Leicester	United Kingdom		EGBG	Europe/London
469	Gloucestershire Airport	Golouchestershire	United Kingdom	GLO	EGBJ	Europe/London
470	Wolverhampton Halfpenny Green Airport	Halfpenny Green	United Kingdom		EGBO	Europe/London
471	Cotswold Airport	Pailton	United Kingdom	GBA	EGBP	Europe/London
472	Turweston Airport	Turweston	United Kingdom		EGBT	Europe/London
473	Wellesbourne Mountford Airport	Wellesbourne	United Kingdom		EGBW	Europe/London
474	Manchester Airport	Manchester	United Kingdom	MAN	EGCC	Europe/London
475	Manchester Woodford Airport	Woodfort	United Kingdom		EGCD	Europe/London
476	Royal Marines Base Chivenor Airport	Chivenor	United Kingdom		EGDC	Europe/London
477	Newquay Cornwall Airport	Newquai	United Kingdom	NQY	EGHQ	Europe/London
478	RAF Lyneham	Lyneham	United Kingdom	LYE	EGDL	Europe/London
479	MoD Boscombe Down Airport	Boscombe Down	United Kingdom		EGDM	Europe/London
480	RNAS Culdrose	Culdrose	United Kingdom		EGDR	Europe/London
481	MoD St. Athan	St. Athan	United Kingdom		EGDX	Europe/London
482	RNAS Yeovilton	Yeovilton	United Kingdom	YEO	EGDY	Europe/London
483	Haverfordwest Airport	Haverfordwest	United Kingdom	HAW	EGFE	Europe/London
484	Cardiff International Airport	Cardiff	United Kingdom	CWL	EGFF	Europe/London
485	Swansea Airport	Swansea	United Kingdom	SWS	EGFH	Europe/London
486	Bristol Airport	Bristol	United Kingdom	BRS	EGGD	Europe/London
487	Liverpool John Lennon Airport	Liverpool	United Kingdom	LPL	EGGP	Europe/London
488	London Luton Airport	London	United Kingdom	LTN	EGGW	Europe/London
489	Plymouth City Airport	Plymouth	United Kingdom	PLH	EGHD	Europe/London
490	Bournemouth Airport	Bournemouth	United Kingdom	BOH	EGHH	Europe/London
491	Southampton Airport	Southampton	United Kingdom	SOU	EGHI	Europe/London
492	Lasham Airport	Lasham	United Kingdom	QLA	EGHL	Europe/London
493	Alderney Airport	Alderney	Guernsey	ACI	EGJA	Europe/Guernsey
494	Guernsey Airport	Guernsey	Guernsey	GCI	EGJB	Europe/Guernsey
495	Jersey Airport	Jersey	Jersey	JER	EGJJ	Europe/Jersey
496	Shoreham Airport	Shoreham By Sea	United Kingdom	ESH	EGKA	Europe/London
497	London Biggin Hill Airport	Biggin Hill	United Kingdom	BQH	EGKB	Europe/London
498	London Gatwick Airport	London	United Kingdom	LGW	EGKK	Europe/London
499	London City Airport	London	United Kingdom	LCY	EGLC	Europe/London
500	Farnborough Airport	Farnborough	United Kingdom	FAB	EGLF	Europe/London
501	Chalgrove Airport	Chalsgrove	United Kingdom		EGLJ	Europe/London
502	Blackbushe Airport	Blackbushe	United Kingdom	BBS	EGLK	Europe/London
503	London Heathrow Airport	London	United Kingdom	LHR	EGLL	Europe/London
504	Southend Airport	Southend	United Kingdom	SEN	EGMC	Europe/London
505	Lydd Airport	Lydd	United Kingdom	LYX	EGMD	Europe/London
506	Kent International Airport	Manston	United Kingdom	MSE	EGMH	Europe/London
507	Brough Airport	Brough	United Kingdom		EGNB	Europe/London
508	Carlisle Airport	Carlisle	United Kingdom	CAX	EGNC	Europe/London
509	Retford Gamston Airport	Repton	United Kingdom		EGNE	Europe/London
510	Blackpool International Airport	Blackpool	United Kingdom	BLK	EGNH	Europe/London
511	Humberside Airport	Humberside	United Kingdom	HUY	EGNJ	Europe/London
512	Barrow Walney Island Airport	Barrow Island	United Kingdom	BWF	EGNL	Europe/London
513	Leeds Bradford Airport	Leeds	United Kingdom	LBA	EGNM	Europe/London
514	Warton Airport	Warton	United Kingdom	WRT	EGNO	Europe/London
515	Hawarden Airport	Hawarden	United Kingdom	CEG	EGNR	Europe/London
516	Isle of Man Airport	Isle Of Man	Isle of Man	IOM	EGNS	Europe/Isle_of_Man
517	Newcastle Airport	Newcastle	United Kingdom	NCL	EGNT	Europe/London
518	Durham Tees Valley Airport	Teesside	United Kingdom	MME	EGNV	Europe/London
519	East Midlands Airport	East Midlands	United Kingdom	EMA	EGNX	Europe/London
520	Llanbedr Airport	Llanbedr	United Kingdom		EGOD	Europe/London
521	RAF Ternhill	Ternhill	United Kingdom		EGOE	Europe/London
522	RAF Shawbury	Shawbury	United Kingdom		EGOS	Europe/London
523	RAF Woodvale	Woodvale	United Kingdom		EGOW	Europe/London
524	Kirkwall Airport	Kirkwall	United Kingdom	KOI	EGPA	Europe/London
525	Sumburgh Airport	Sumburgh	United Kingdom	LSI	EGPB	Europe/London
526	Wick Airport	Wick	United Kingdom	WIC	EGPC	Europe/London
527	Aberdeen Dyce Airport	Aberdeen	United Kingdom	ABZ	EGPD	Europe/London
528	Inverness Airport	Inverness	United Kingdom	INV	EGPE	Europe/London
529	Glasgow International Airport	Glasgow	United Kingdom	GLA	EGPF	Europe/London
530	Edinburgh Airport	Edinburgh	United Kingdom	EDI	EGPH	Europe/London
531	Islay Airport	Islay	United Kingdom	ILY	EGPI	Europe/London
532	Glasgow Prestwick Airport	Prestwick	United Kingdom	PIK	EGPK	Europe/London
533	Benbecula Airport	Benbecula	United Kingdom	BEB	EGPL	Europe/London
534	Scatsta Airport	Scatsta	United Kingdom	SCS	EGPM	Europe/London
535	Dundee Airport	Dundee	United Kingdom	DND	EGPN	Europe/London
536	Stornoway Airport	Stornoway	United Kingdom	SYY	EGPO	Europe/London
537	Tiree Airport	Tiree	United Kingdom	TRE	EGPU	Europe/London
538	RAF Leuchars	Leuchars	United Kingdom	ADX	EGQL	Europe/London
539	RAF Lossiemouth	Lossiemouth	United Kingdom	LMO	EGQS	Europe/London
540	Cambridge Airport	Cambridge	United Kingdom	CBG	EGSC	Europe/London
541	Peterborough Business Airport	Peterborough	United Kingdom		EGSF	Europe/London
542	Norwich International Airport	Norwich	United Kingdom	NWI	EGSH	Europe/London
543	London Stansted Airport	London	United Kingdom	STN	EGSS	Europe/London
544	North Weald Airport	North Weald	United Kingdom		EGSX	Europe/London
545	Sheffield City Heliport	Fowlmere	United Kingdom		EGSY	Europe/London
546	Cranfield Airport	Cranfield	United Kingdom		EGTC	Europe/London
547	Exeter International Airport	Exeter	United Kingdom	EXT	EGTE	Europe/London
548	Bristol Filton Airport	Bristol	United Kingdom	FZO	EGTG	Europe/London
549	Oxford (Kidlington) Airport	Oxford	United Kingdom	OXF	EGTK	Europe/London
550	RAF Benson	Benson	United Kingdom	BEX	EGUB	Europe/London
551	RAF Lakenheath	Lakenheath	United Kingdom	LKZ	EGUL	Europe/London
552	RAF Mildenhall	Mildenhall	United Kingdom	MHZ	EGUN	Europe/London
553	RAF Wattisham	Wattisham	United Kingdom		EGUW	Europe/London
554	RAF Wyton	Wyton	United Kingdom	QUY	EGUY	Europe/London
555	RAF Fairford	Fairford	United Kingdom	FFD	EGVA	Europe/London
556	RAF Brize Norton	Brize Norton	United Kingdom	BZZ	EGVN	Europe/London
557	RAF Odiham	Odiham	United Kingdom	ODH	EGVO	Europe/London
558	DCAE Cosford Air Base	Cosford	United Kingdom		EGWC	Europe/London
559	RAF Northolt	Northolt	United Kingdom	NHT	EGWU	Europe/London
560	RAF Coningsby	Coningsby	United Kingdom	QCY	EGXC	Europe/London
561	RAF Dishforth	Dishforth	United Kingdom		EGXD	Europe/London
562	Leeming Airport	Leeming	United Kingdom		EGXE	Europe/London
563	Leeds East Airport	Church Fenton	United Kingdom		EGXG	Europe/London
564	RAF Honington	Honington	United Kingdom	BEQ	EGXH	Europe/London
565	RAF Cottesmore	Cottesmore	United Kingdom		EGXJ	Europe/London
566	RAF Scampton	Scampton	United Kingdom	SQZ	EGXP	Europe/London
567	RAF Wittering	Wittering	United Kingdom		EGXT	Europe/London
568	RAF Linton-On-Ouse	Linton-on-ouse	United Kingdom	HRT	EGXU	Europe/London
569	RAF Waddington	Waddington	United Kingdom	WTN	EGXW	Europe/London
570	RAF Topcliffe	Topcliffe	United Kingdom		EGXZ	Europe/London
571	RAF Cranwell	Cranwell	United Kingdom		EGYD	Europe/London
572	RAF Barkston Heath	Barkston Heath	United Kingdom		EGYE	Europe/London
573	RAF Marham	Marham	United Kingdom	KNF	EGYM	Europe/London
574	Mount Pleasant Airport	Mount Pleasant	Falkland Islands	MPN	EGYP	Atlantic/Stanley
575	Amsterdam Airport Schiphol	Amsterdam	Netherlands	AMS	EHAM	Europe/Amsterdam
576	Budel Airfield Kempen	Weert	Netherlands		EHBD	Europe/Amsterdam
577	Maastricht Aachen Airport	Maastricht	Netherlands	MST	EHBK	Europe/Amsterdam
578	Deelen Air Base	Deelen	Netherlands		EHDL	Europe/Amsterdam
579	Drachten Airport	Drachten	Netherlands		EHDR	Europe/Amsterdam
580	Eindhoven Airport	Eindhoven	Netherlands	EIN	EHEH	Europe/Amsterdam
581	Eelde Airport	Groningen	Netherlands	GRQ	EHGG	Europe/Amsterdam
582	Gilze Rijen Air Base	Gilze-rijen	Netherlands	GLZ	EHGR	Europe/Amsterdam
583	De Kooy Airport	De Kooy	Netherlands	DHR	EHKD	Europe/Amsterdam
584	Lelystad Airport	Lelystad	Netherlands	LEY	EHLE	Europe/Amsterdam
585	Leeuwarden Air Base	Leeuwarden	Netherlands	LWR	EHLW	Europe/Amsterdam
586	Rotterdam The Hague Airport	Rotterdam	Netherlands	RTM	EHRD	Europe/Amsterdam
587	Soesterberg Air Base	Soesterberg	Netherlands	UTC	EHSB	Europe/Amsterdam
588	Twente Airport	Enschede	Netherlands	ENS	EHTW	Europe/Amsterdam
589	Valkenburg Naval Air Base	Valkenburg	Netherlands	LID	EHVB	Europe/Amsterdam
590	Woensdrecht Air Base	Woensdrecht	Netherlands	WOE	EHWO	Europe/Amsterdam
591	Cork Airport	Cork	Ireland	ORK	EICK	Europe/Dublin
592	Galway Airport	Galway	Ireland	GWY	EICM	Europe/Dublin
593	Dublin Airport	Dublin	Ireland	DUB	EIDW	Europe/Dublin
594	Ireland West Knock Airport	Connaught	Ireland	NOC	EIKN	Europe/Dublin
595	Kerry Airport	Kerry	Ireland	KIR	EIKY	Europe/Dublin
596	Casement Air Base	Casement	Ireland		EIME	Europe/Dublin
597	Shannon Airport	Shannon	Ireland	SNN	EINN	Europe/Dublin
598	Sligo Airport	Sligo	Ireland	SXL	EISG	Europe/Dublin
599	Waterford Airport	Waterford	Ireland	WAT	EIWF	Europe/Dublin
600	Aarhus Airport	Aarhus	Denmark	AAR	EKAH	Europe/Copenhagen
601	Billund Airport	Billund	Denmark	BLL	EKBI	Europe/Copenhagen
602	Copenhagen Kastrup Airport	Copenhagen	Denmark	CPH	EKCH	Europe/Copenhagen
603	Esbjerg Airport	Esbjerg	Denmark	EBJ	EKEB	Europe/Copenhagen
604	Grønholt Hillerød Airport	Gronholt	Denmark		EKGH	Europe/Copenhagen
605	Karup Airport	Karup	Denmark	KRP	EKKA	Europe/Copenhagen
606	Læsø Airport	Laeso	Denmark	BYR	EKLS	Europe/Copenhagen
607	Lolland Falster Maribo Airport	Maribo	Denmark	MRW	EKMB	Europe/Copenhagen
608	Odense Airport	Odense	Denmark	ODE	EKOD	Europe/Copenhagen
609	Kruså-Padborg Airport	Krusa-padborg	Denmark		EKPB	Europe/Copenhagen
610	Copenhagen Roskilde Airport	Copenhagen	Denmark	RKE	EKRK	Europe/Copenhagen
611	Bornholm Airport	Ronne	Denmark	RNN	EKRN	Europe/Copenhagen
612	Sønderborg Airport	Soenderborg	Denmark	SGD	EKSB	Europe/Copenhagen
613	Skrydstrup Air Base	Skrydstrup	Denmark	SKS	EKSP	Europe/Copenhagen
614	Skive Airport	Skive	Denmark	SQW	EKSV	Europe/Copenhagen
615	Thisted Airport	Thisted	Denmark	TED	EKTS	Europe/Copenhagen
616	Kolding Vamdrup Airfield	Kolding	Denmark		EKVD	Europe/Copenhagen
617	Vagar Airport	Vagar	Faroe Islands	FAE	EKVG	Atlantic/Faeroe
618	Vesthimmerlands Flyveplads	Vesthimmerland	Denmark		EKVH	Europe/Copenhagen
619	Stauning Airport	Stauning	Denmark	STA	EKVJ	Europe/Copenhagen
620	Aalborg Airport	Aalborg	Denmark	AAL	EKYT	Europe/Copenhagen
621	Luxembourg-Findel International Airport	Luxemburg	Luxembourg	LUX	ELLX	Europe/Luxembourg
622	Ålesund Airport	Alesund	Norway	AES	ENAL	Europe/Oslo
623	Andøya Airport	Andoya	Norway	ANX	ENAN	Europe/Oslo
624	Alta Airport	Alta	Norway	ALF	ENAT	Europe/Oslo
625	Bømoen Airport	Voss	Norway		ENBM	Europe/Oslo
626	Brønnøysund Airport	Bronnoysund	Norway	BNN	ENBN	Europe/Oslo
627	Bodø Airport	Bodo	Norway	BOO	ENBO	Europe/Oslo
628	Bergen Airport Flesland	Bergen	Norway	BGO	ENBR	Europe/Oslo
629	Båtsfjord Airport	Batsfjord	Norway	BJF	ENBS	Europe/Oslo
630	Kristiansand Airport	Kristiansand	Norway	KRS	ENCN	Europe/Oslo
631	Geilo Airport Dagali	Geilo	Norway	DLD	ENDI	Europe/Oslo
632	Bardufoss Airport	Bardufoss	Norway	BDU	ENDU	Europe/Oslo
633	Harstad/Narvik Airport	Evenes	Harstad/Narvik	Norway	EVE	E
634	Leirin Airport	Fagernes	Norway	VDB	ENFG	Europe/Oslo
635	Florø Airport	Floro	Norway	FRO	ENFL	Europe/Oslo
636	Oslo Lufthavn	Oslo	Norway	OSL	ENGM	Europe/Oslo
637	Haugesund Airport	Haugesund	Norway	HAU	ENHD	Europe/Oslo
638	Hasvik Airport	Hasvik	Norway	HAA	ENHK	Europe/Oslo
639	Kristiansund Airport (Kvernberget)	Kristiansund	Norway	KSU	ENKB	Europe/Oslo
640	Kjeller Airport	Kjeller	Norway		ENKJ	Europe/Oslo
641	Kirkenes Airport (Høybuktmoen)	Kirkenes	Norway	KKN	ENKR	Europe/Oslo
642	Lista Airport	Farsund	Norway	FAN	ENLI	Europe/Oslo
643	Molde Airport	Molde	Norway	MOL	ENML	Europe/Oslo
644	Mosjøen Airport (Kjærstad)	Mosjoen	Norway	MJF	ENMS	Europe/Oslo
645	Banak Airport	Lakselv	Norway	LKL	ENNA	Europe/Oslo
646	Notodden Airport	Notodden	Norway	NTB	ENNO	Europe/Oslo
647	Ørland Airport	Orland	Norway	OLA	ENOL	Europe/Oslo
648	Røros Airport	Roros	Norway	RRS	ENRO	Europe/Oslo
649	Moss Airport	Rygge	Rygge	Norway	RYG	E
650	Svalbard Airport	Longyear	Svalbard	Norway	LYR	E
651	Skien Airport	Skien	Norway	SKE	ENSN	Europe/Oslo
652	Stord Airport	Stord	Norway	SRP	ENSO	Europe/Oslo
653	Sandnessjøen Airport (Stokka)	Sandnessjoen	Norway	SSJ	ENST	Europe/Oslo
654	Tromsø Airport		Tromso	Norway	TOS	E
655	Sandefjord Airport	Torp	Sandefjord	Norway	TRF	E
656	Trondheim Airport Værnes	Trondheim	Norway	TRD	ENVA	Europe/Oslo
657	Stavanger Airport Sola	Stavanger	Norway	SVG	ENZV	Europe/Oslo
658	Babice Airport	Warsaw	Poland		EPBC	Europe/Warsaw
659	Gdańsk Lech Wałęsa Airport	Gdansk	Poland	GDN	EPGD	Europe/Warsaw
660	Kraków John Paul II International Airport	Krakow	Poland	KRK	EPKK	Europe/Warsaw
661	Muchowiec Airport	Katowice	Poland		EPKM	Europe/Warsaw
662	Katowice International Airport	Katowice	Poland	KTW	EPKT	Europe/Warsaw
663	Mielec Airport	Mielec	Poland		EPML	Europe/Warsaw
664	Poznań-Ławica Airport	Poznan	Poland	POZ	EPPO	Europe/Warsaw
665	Rzeszów-Jasionka Airport	Rzeszow	Poland	RZE	EPRZ	Europe/Warsaw
666	Szczecin-Goleniów ""Solidarność"" Airport	Szczecin	Poland	SZZ	EPSC	Europe/Warsaw
667	Redzikowo Air Base	Slupsk	Poland	OSP	EPSK	Europe/Warsaw
668	Swidwin Military Air Base	Shapaja	Poland		EPSN	Europe/Warsaw
669	Warsaw Chopin Airport	Warsaw	Poland	WAW	EPWA	Europe/Warsaw
670	Copernicus Wrocław Airport	Wroclaw	Poland	WRO	EPWR	Europe/Warsaw
671	Zielona Góra-Babimost Airport	Zielona Gora	Poland	IEG	EPZG	Europe/Warsaw
672	Malmen Air Base	Linkoeping	Sweden		ESCF	Europe/Stockholm
673	Bråvalla Air Base	Norrkoeping	Sweden		ESCK	Europe/Stockholm
674	Uppsala Airport	Uppsala	Sweden		ESCM	Europe/Stockholm
675	Ronneby Airport	Ronneby	Sweden	RNB	ESDF	Europe/Stockholm
676	Råda Air Base	Rada	Sweden		ESFR	Europe/Stockholm
677	Gothenburg-Landvetter Airport	Gothenborg	Sweden	GOT	ESGG	Europe/Stockholm
678	Jönköping Airport	Joenkoeping	Sweden	JKG	ESGJ	Europe/Stockholm
679	Falköping Airport	Falkoping	Sweden		ESGK	Europe/Stockholm
680	Lidköping-Hovby Airport	Lidkoping	Sweden	LDK	ESGL	Europe/Stockholm
681	Gothenburg City Airport	Gothenborg	Sweden	GSE	ESGP	Europe/Stockholm
682	Skövde Airport	Skovde	Sweden	KVB	ESGR	Europe/Stockholm
683	Trollhättan-Vänersborg Airport	Trollhattan	Sweden	THN	ESGT	Europe/Stockholm
684	Karlsborg Air Base	Karlsborg	Sweden		ESIA	Europe/Stockholm
685	Såtenäs Air Base	Satenas	Sweden		ESIB	Europe/Stockholm
686	Barkarby Airport	Stockholm	Sweden		ESKB	Europe/Stockholm
687	Karlskoga Airport	Karlskoga	Sweden	KSK	ESKK	Europe/Stockholm
688	Mora Airport	Mora	Sweden	MXX	ESKM	Europe/Stockholm
689	Stockholm Skavsta Airport	Stockholm	Sweden	NYO	ESKN	Europe/Stockholm
690	Arvika Airport	Arvika	Sweden		ESKV	Europe/Stockholm
691	Emmaboda Airfield	Emmaboda	Sweden		ESMA	Europe/Stockholm
692	Feringe Airport	Ljungby	Sweden		ESMG	Europe/Stockholm
693	Kristianstad Airport	Kristianstad	Sweden	KID	ESMK	Europe/Stockholm
694	Landskrona Airport	Landskrona	Sweden		ESML	Europe/Stockholm
695	Oskarshamn Airport	Oskarshamn	Sweden	OSK	ESMO	Europe/Stockholm
696	Anderstorp Airport	Anderstorp	Sweden		ESMP	Europe/Stockholm
697	Kalmar Airport	Kalkmar	Sweden	KLR	ESMQ	Europe/Stockholm
698	Malmö Sturup Airport	Malmoe	Sweden	MMX	ESMS	Europe/Stockholm
699	Halmstad Airport	Halmstad	Sweden	HAD	ESMT	Europe/Stockholm
700	Hagshult Air Base	Hagshult	Sweden		ESMV	Europe/Stockholm
701	Växjö Kronoberg Airport	Vaxjo	Sweden	VXO	ESMX	Europe/Stockholm
702	Hallviken Airport	Hallviken	Sweden		ESNA	Europe/Stockholm
703	Hedlanda Airport	Hede	Sweden		ESNC	Europe/Stockholm
704	Sveg Airport	Sveg	Sweden	EVG	ESND	Europe/Stockholm
705	Gällivare Airport	Gallivare	Sweden	GEV	ESNG	Europe/Stockholm
706	Hudiksvall Airport	Hudiksvall	Sweden	HUV	ESNH	Europe/Stockholm
707	Jokkmokk Airport	Jokkmokk	Sweden		ESNJ	Europe/Stockholm
708	Kramfors Sollefteå Airport	Kramfors	Sweden	KRF	ESNK	Europe/Stockholm
709	Lycksele Airport	Lycksele	Sweden	LYC	ESNL	Europe/Stockholm
710	Optand Airport	Optand	Sweden		ESNM	Europe/Stockholm
711	Sundsvall-Härnösand Airport	Sundsvall	Sweden	SDL	ESNN	Europe/Stockholm
712	Örnsköldsvik Airport	Ornskoldsvik	Sweden	OER	ESNO	Europe/Stockholm
713	Piteå Airport	Pitea	Sweden		ESNP	Europe/Stockholm
714	Kiruna Airport	Kiruna	Sweden	KRN	ESNQ	Europe/Stockholm
715	Orsa Airport	Orsa	Sweden		ESNR	Europe/Stockholm
716	Skellefteå Airport	Skelleftea	Sweden	SFT	ESNS	Europe/Stockholm
717	Sättna Airport	Sattna	Sweden		ESNT	Europe/Stockholm
718	Umeå Airport	Umea	Sweden	UME	ESNU	Europe/Stockholm
719	Vilhelmina Airport	Vilhelmina	Sweden	VHM	ESNV	Europe/Stockholm
720	Arvidsjaur Airport	Arvidsjaur	Sweden	AJR	ESNX	Europe/Stockholm
721	Örebro Airport	Orebro	Sweden	ORB	ESOE	Europe/Stockholm
722	Stockholm Västerås Airport	Vasteras	Sweden	VST	ESOW	Europe/Stockholm
723	Luleå Airport	Lulea	Sweden	LLA	ESPA	Europe/Stockholm
724	Vidsel Air Base	Vidsel	Sweden		ESPE	Europe/Stockholm
725	Arboga Airport	Arboga	Sweden		ESQO	Europe/Stockholm
726	Stockholm-Arlanda Airport	Stockholm	Sweden	ARN	ESSA	Europe/Stockholm
727	Stockholm-Bromma Airport	Stockholm	Sweden	BMA	ESSB	Europe/Stockholm
728	Borlange Airport	Borlange	Sweden	BLE	ESSD	Europe/Stockholm
729	Hultsfred Airport	Hultsfred	Sweden	HLF	ESSF	Europe/Stockholm
730	Gävle Sandviken Airport	Gavle	Sweden	GVX	ESSK	Europe/Stockholm
731	Linköping City Airport	Linkoeping	Sweden	LPI	ESSL	Europe/Stockholm
732	Norrköping Airport	Norrkoeping	Sweden	NRK	ESSP	Europe/Stockholm
733	Eskilstuna Airport	Eskilstuna	Sweden	EKT	ESSU	Europe/Stockholm
734	Visby Airport	Visby	Sweden	VBY	ESSV	Europe/Stockholm
735	Kalixfors Airport	Kalixfors	Sweden		ESUK	Europe/Stockholm
736	Spangdahlem Air Base	Spangdahlem	Germany	SPM	ETAD	Europe/Berlin
737	Ramstein Air Base	Ramstein	Germany	RMS	ETAR	Europe/Berlin
738	Bamberg Aaf	Bamberg	Germany		ETEJ	Europe/Berlin
1058	Ibn Batouta Airport	Tanger	Morocco	TNG	GMTT	Africa/Casablanca
739	[Duplicate] Giebelstadt Army Air Field	Giebelstadt	Germany	GHF	ETEU	Europe/Berlin
740	Bückeburg Air Base	Brueckeburg	Germany		ETHB	Europe/Berlin
741	Celle Airport	Celle	Germany	ZCN	ETHC	Europe/Berlin
742	Rheine Bentlage Air Base	Rheine-brentlange	Germany		ETHE	Europe/Berlin
743	Fritzlar Airport	Fritzlar	Germany	FRZ	ETHF	Europe/Berlin
744	Laupheim Air Base	Laupheim	Germany		ETHL	Europe/Berlin
745	Mendig Airfield	Mendig	Germany		ETHM	Europe/Berlin
746	Niederstetten Army Air Base	Niederstetten	Germany		ETHN	Europe/Berlin
747	Roth Airport	Roth	Germany		ETHR	Europe/Berlin
748	Fassberg Air Base	Fassberg	Germany		ETHS	Europe/Berlin
749	Grafenwohr Army Air Field	Grafenwoehr	Germany		ETIC	Europe/Berlin
750	Hanau Army Air Field	Hanau	Germany	ZNF	ETID	Europe/Berlin
751	Hohenfels Army Air Field	Hohenfels	Germany		ETIH	Europe/Berlin
752	Flugplatz Kitzingen	Kitzingen	Germany	KZG	ETIN	Europe/Berlin
753	Nordholz Naval Airbase	Nordholz	Germany	FCN	ETMN	Europe/Berlin
754	Diepholz Air Base	Diepholz	Germany		ETND	Europe/Berlin
755	Geilenkirchen Air Base	Geilenkirchen	Germany	GKE	ETNG	Europe/Berlin
756	Hohn Air Base	Hohn	Germany		ETNH	Europe/Berlin
757	Jever Air Base	Jever	Germany		ETNJ	Europe/Berlin
758	Rostock-Laage Airport	Laage	Germany	RLG	ETNL	Europe/Berlin
759	Nörvenich Air Base	Noervenich	Germany		ETNN	Europe/Berlin
760	Schleswig Air Base	Schleswig	Germany	WBG	ETNS	Europe/Berlin
761	Wittmundhafen Airport	Wittmundhafen	Germany		ETNT	Europe/Berlin
762	Neubrandenburg	Neubrandenburg	Germany		ETNU	Europe/Berlin
763	Wunstorf Air Base	Wunstorf	Germany		ETNW	Europe/Berlin
764	Vilseck Army Air Field	Vilseck	Germany		ETOI	Europe/Berlin
765	Coleman Army Air Field	Coleman	Germany		ETOR	Europe/Berlin
766	Wiesbaden Army Airfield	Wiesbaden	Germany	WIE	ETOU	Europe/Berlin
767	Landsberg Lech Air Base	Landsberg	Germany		ETSA	Europe/Berlin
768	Büchel Air Base	Buechel	Germany		ETSB	Europe/Berlin
769	Erding Airport	Erding	Germany		ETSE	Europe/Berlin
770	Fürstenfeldbruck Air Base	Fuerstenfeldbruck	Germany	FEL	ETSF	Europe/Berlin
771	Holzdorf Air Base	Holzdorf	Germany		ETSH	Europe/Berlin
772	Ingolstadt Manching Airport	Ingolstadt	Germany	IGS	ETSI	Europe/Berlin
773	Lechfeld Air Base	Lechfeld	Germany		ETSL	Europe/Berlin
774	Neuburg AFB	Neuburg	Germany		ETSN	Europe/Berlin
775	Gütersloh Air Base	Guetersloh	Germany	GUT	ETUO	Europe/Berlin
776	Alexander Bay Airport	Alexander Bay	South Africa	ALJ	FAAB	Africa/Johannesburg
777	Aggeneys Airport	Aggeneys	South Africa	AGZ	FAAG	Africa/Johannesburg
778	Brakpan Airport	Brakpan	South Africa		FABB	Africa/Johannesburg
779	Bisho Airport	Bisho	South Africa	BIY	FABE	Africa/Johannesburg
780	Bram Fischer International Airport	Bloemfontein	South Africa	BFN	FABL	Africa/Johannesburg
781	Bethlehem Airport	Bethlehem	South Africa		FABM	Africa/Johannesburg
782	Hendrik Potgieter Airport	Bothaville	South Africa		FABO	Africa/Johannesburg
783	Cape Town International Airport	Cape Town	South Africa	CPT	FACT	Africa/Johannesburg
784	Calvinia Airport	Calvinia	South Africa		FACV	Africa/Johannesburg
785	King Shaka International Airport	Durban	South Africa	DUR	FALE	Africa/Johannesburg
786	Ben Schoeman Airport	East London	South Africa	ELS	FAEL	Africa/Johannesburg
787	Ermelo Airport	Ermelo	South Africa		FAEO	Africa/Johannesburg
788	Ficksburg Sentraoes Airport	Ficksburg	South Africa	FCB	FAFB	Africa/Johannesburg
789	Grand Central Airport	Johannesburg	South Africa	GCJ	FAGC	Africa/Johannesburg
790	George Airport	George	South Africa	GRJ	FAGG	Africa/Johannesburg
791	Graaff Reinet Airport	Graaff Reinet	South Africa		FAGR	Africa/Johannesburg
792	Grahamstown Airport	Grahamstown	South Africa		FAGT	Africa/Johannesburg
793	Greytown Airport	Greytown	South Africa		FAGY	Africa/Johannesburg
794	Harmony Airport	Harmony	South Africa		FAHA	Africa/Johannesburg
795	Harrismith Airport	Harrismith	South Africa	HRS	FAHR	Africa/Johannesburg
796	Hoedspruit Air Force Base Airport	Hoedspruit	South Africa	HDS	FAHS	Africa/Johannesburg
797	Gariep Dam Airport	Hendrik Verwoerddam	South Africa		FAHV	Africa/Johannesburg
798	OR Tambo International Airport	Johannesburg	South Africa	JNB	FAOR	Africa/Johannesburg
799	P C Pelser Airport	Klerksdorp	South Africa	KXE	FAKD	Africa/Johannesburg
800	Kimberley Airport	Kimberley	South Africa	KIM	FAKM	Africa/Johannesburg
801	Krugersdorp Airport	Krugersdorp	South Africa		FAKR	Africa/Johannesburg
802	Kroonstad Airport	Kroonstad	South Africa		FAKS	Africa/Johannesburg
803	Johan Pienaar Airport	Kuruman	South Africa	KMH	FAKU	Africa/Johannesburg
804	Kleinsee Airport	Kleinsee	South Africa	KLZ	FAKZ	Africa/Johannesburg
805	Lanseria Airport	Johannesburg	South Africa	HLA	FALA	Africa/Johannesburg
806	Lichtenburg Airport	Lichtenburg	South Africa		FALI	Africa/Johannesburg
807	Makhado Air Force Base Airport	Lambertsbaai	South Africa		FALM	Africa/Johannesburg
808	Langebaanweg Airport	Langebaanweg	South Africa	SDB	FALW	Africa/Johannesburg
809	Ladysmith Airport	Ladysmith	South Africa	LAY	FALY	Africa/Johannesburg
810	Middelburg Airport	Middelburg	South Africa		FAMB	Africa/Johannesburg
811	Margate Airport	Margate	South Africa	MGH	FAMG	Africa/Johannesburg
812	Marble Hall Airport	Marble Hall	South Africa		FAMI	Africa/Johannesburg
813	Majuba Power Station Airport	Majuba Power Station	South Africa		FAMJ	Africa/Johannesburg
814	Riverside Airport	Malalane	South Africa	LLE	FAMN	Africa/Johannesburg
815	Morningside Farm Airport	Musina	South Africa		FAMS	Africa/Johannesburg
816	Mkuze Airport	Mkuze	South Africa	MZQ	FAMU	Africa/Johannesburg
817	Newcastle Airport	Newcastle	South Africa	NCS	FANC	Africa/Johannesburg
818	Nylstroom Airfield	Nylstroom	South Africa		FANY	Africa/Johannesburg
819	Overberg Airport	Overberg	South Africa	OVG	FAOB	Africa/Johannesburg
820	Oudtshoorn Airport	Oudtshoorn	South Africa	OUH	FAOH	Africa/Johannesburg
821	Port Elizabeth Airport	Port Elizabeth	South Africa	PLZ	FAPE	Africa/Johannesburg
822	Plettenberg Bay Airport	Plettenberg Bay	South Africa	PBZ	FAPG	Africa/Johannesburg
823	Hendrik Van Eck Airport	Phalaborwa	South Africa	PHW	FAPH	Africa/Johannesburg
824	Pietersburg Municipal Airport	Polokwane	South Africa		FAPI	Africa/Johannesburg
825	Port St Johns Airport	Port Saint Johns	South Africa	JOH	FAPJ	Africa/Johannesburg
826	Pietermaritzburg Airport	Pietermaritzburg	South Africa	PZB	FAPM	Africa/Johannesburg
827	Pilanesberg International Airport	Pilanesberg	South Africa	NTY	FAPN	Africa/Johannesburg
828	Polokwane International Airport	Potgietersrus	South Africa	PTG	FAPP	Africa/Johannesburg
829	Potchefstroom Airport	Potchefstroom	South Africa	PCF	FAPS	Africa/Johannesburg
830	Parys Airport	Parys	South Africa		FAPY	Africa/Johannesburg
831	Queenstown Airport	Queenstown	South Africa	UTW	FAQT	Africa/Johannesburg
832	Richards Bay Airport	Richard's Bay	South Africa	RCB	FARB	Africa/Johannesburg
833	Rustenburg Airport	Rustenburg	South Africa		FARG	Africa/Johannesburg
834	Robertson Airport	Robertson	South Africa	ROD	FARS	Africa/Johannesburg
835	Springbok Airport	Springbok	South Africa	SBU	FASB	Africa/Johannesburg
836	Secunda Airport	Secunda	South Africa	ZEC	FASC	Africa/Johannesburg
837	Saldanha /Vredenburg Airport	Saldanha	South Africa		FASD	Africa/Johannesburg
838	Springs Airfield	Springs	South Africa		FASI	Africa/Johannesburg
839	Swartkop Air Force Base	Swartkop	South Africa		FASK	Africa/Johannesburg
840	Sishen Airport	Sishen	South Africa	SIS	FASS	Africa/Johannesburg
841	Hendrik Swellengrebel Airport	Swellendam	South Africa		FASX	Africa/Johannesburg
842	Skukuza Airport	Skukuza	South Africa	SZK	FASZ	Africa/Johannesburg
843	Tommys Field Airport	Tommy's Field	South Africa		FATF	Africa/Johannesburg
844	New Tempe Airport	Bloemfontein	South Africa		FATP	Africa/Johannesburg
845	Tutuka Power Station Airport	Tutuka	South Africa		FATT	Africa/Johannesburg
846	Tzaneen Airport	Tzaneen	South Africa	LTA	FATZ	Africa/Johannesburg
847	Prince Mangosuthu Buthelezi Airport	Ulundi	South Africa	ULD	FAUL	Africa/Johannesburg
848	Pierre Van Ryneveld Airport	Upington	South Africa	UTN	FAUP	Africa/Johannesburg
849	K. D. Matanzima Airport	Umtata	South Africa	UTT	FAUT	Africa/Johannesburg
850	Vryburg Airport	Vryburg	South Africa	VRU	FAVB	Africa/Johannesburg
851	Virginia Airport	Durban	South Africa	VIR	FAVG	Africa/Johannesburg
852	Vredendal Airport	Vredendal	South Africa	VRE	FAVR	Africa/Johannesburg
853	Vereeniging Airport	Vereeniging	South Africa		FAVV	Africa/Johannesburg
854	Wonderboom Airport	Pretoria	South Africa	PRY	FAWB	Africa/Johannesburg
855	Witbank Airport	Witbank	South Africa		FAWI	Africa/Johannesburg
856	Waterkloof Air Force Base	Waterkloof	South Africa	WKF	FAWK	Africa/Johannesburg
857	Welkom Airport	Welkom	South Africa		FAWM	Africa/Johannesburg
858	Ysterplaat Air Force Base	Ysterplaat	South Africa		FAYP	Africa/Johannesburg
859	Zeerust Airport	Zeerust	South Africa		FAZR	Africa/Johannesburg
860	Francistown Airport	Francistown	Botswana	FRW	FBFT	Africa/Gaborone
861	Jwaneng Airport	Jwaneng	Botswana	JWA	FBJW	Africa/Gaborone
862	Kasane Airport	Kasane	Botswana	BBK	FBKE	Africa/Gaborone
863	Maun Airport	Maun	Botswana	MUB	FBMN	Africa/Gaborone
864	Sir Seretse Khama International Airport	Gaberone	Botswana	GBE	FBSK	Africa/Gaborone
865	Selebi Phikwe Airport	Selebi-phikwe	Botswana	PKW	FBSP	Africa/Gaborone
866	Maya-Maya Airport	Brazzaville	Congo (Brazzaville)	BZV	FCBB	Africa/Brazzaville
867	Owando Airport	Owando	Congo (Kinshasa)	FTX	FCOO	Africa/Brazzaville
868	Ouesso Airport	Ouesso	Congo (Kinshasa)	OUE	FCOU	Africa/Brazzaville
869	Pointe Noire Airport	Pointe-noire	Congo (Brazzaville)	PNR	FCPP	Africa/Brazzaville
870	Matsapha Airport	Manzini	Swaziland	MTS	FDMS	Africa/Mbabane
871	Bangui M'Poko International Airport	Bangui	Central African Republic	BGF	FEFF	Africa/Bangui
872	Berbérati Airport	Berberati	Central African Republic	BBT	FEFT	Africa/Bangui
873	Bata Airport	Bata	Equatorial Guinea	BSG	FGBT	Africa/Malabo
874	Malabo Airport	Malabo	Equatorial Guinea	SSG	FGSL	Africa/Malabo
875	RAF Ascension Island	Wide Awake	Saint Helena	ASI	FHAW	Atlantic/St_Helena
876	Sir Seewoosagur Ramgoolam International Airport	Plaisance	Mauritius	MRU	FIMP	Indian/Mauritius
877	Sir Charles Gaetan Duval Airport	Rodriguez Island	Mauritius	RRG	FIMR	Indian/Mauritius
878	Diego Garcia Naval Support Facility	Diego Garcia Island	British Indian Ocean Territory	NKW	FJDG	Indian/Chagos
879	Tiko Airport	Tiko	Cameroon	TKC	FKKC	Africa/Douala
880	Douala International Airport	Douala	Cameroon	DLA	FKKD	Africa/Douala
881	Salak Airport	Maroua	Cameroon	MVR	FKKL	Africa/Douala
882	Foumban Nkounja Airport	Foumban	Cameroon	FOM	FKKM	Africa/Douala
883	N'Gaoundéré Airport	N'gaoundere	Cameroon	NGE	FKKN	Africa/Douala
884	Garoua International Airport	Garoua	Cameroon	GOU	FKKR	Africa/Douala
885	Bafoussam Airport	Bafoussam	Cameroon	BFX	FKKU	Africa/Douala
886	Bamenda Airport	Bamenda	Cameroon	BPC	FKKV	Africa/Douala
887	Yaoundé Airport	Yaounde	Cameroon	YAO	FKKY	Africa/Douala
888	Kasompe Airport	Kasompe	Zambia	CGJ	FLKE	Africa/Lusaka
889	Livingstone Airport	Livingstone	Zambia	LVI	FLLI	Africa/Lusaka
890	Kenneth Kaunda International Airport Lusaka	Lusaka	Zambia	LUN	FLLS	Africa/Lusaka
891	Mfuwe Airport	Mfuwe	Zambia	MFU	FLMF	Africa/Lusaka
892	Mongu Airport	Mongu	Zambia	MNR	FLMG	Africa/Lusaka
893	Simon Mwansa Kapwepwe International Airport	Ndola	Zambia	NLA	FLND	Africa/Lusaka
894	Southdowns Airport	Southdowns	Zambia	KIW	FLSO	Africa/Lusaka
1059	Ziguinchor Airport	Ziguinchor	Senegal	ZIG	GOGG	Africa/Dakar
895	Prince Said Ibrahim International Airport	Moroni	Comoros	HAH	FMCH	Indian/Comoro
896	Mohéli Bandar Es Eslam Airport	Moheli	Comoros	NWA	FMCI	Indian/Comoro
897	Ouani Airport	Anjouan	Comoros	AJN	FMCV	Indian/Comoro
898	Dzaoudzi Pamandzi International Airport	Dzaoudzi	Mayotte	DZA	FMCZ	Indian/Mayotte
899	Roland Garros Airport	St.-denis	Reunion	RUN	FMEE	Indian/Reunion
900	Pierrefonds Airport	St.-pierre	Reunion	ZSE	FMEP	Indian/Reunion
901	Ivato Airport	Antananarivo	Madagascar	TNR	FMMI	Indian/Antananarivo
902	Miandrivazo Airport	Miandrivazo	Madagascar	ZVA	FMMN	Indian/Antananarivo
903	Sainte Marie Airport	Sainte Marie	Madagascar	SMS	FMMS	Indian/Antananarivo
904	Toamasina Airport	Toamasina	Madagascar	TMM	FMMT	Indian/Antananarivo
905	Morondava Airport	Morondava	Madagascar	MOQ	FMMV	Indian/Antananarivo
906	Arrachart Airport	Antsiranana	Madagascar	DIE	FMNA	Indian/Antananarivo
907	Mananara Nord Airport	Mananara	Madagascar	WMR	FMNC	Indian/Antananarivo
908	Andapa Airport	Andapa	Madagascar	ZWA	FMND	Indian/Antananarivo
909	Ambilobe Airport	Ambilobe	Madagascar	AMB	FMNE	Indian/Antananarivo
910	Antsirabato Airport	Antalaha	Madagascar	ANM	FMNH	Indian/Antananarivo
911	Analalava Airport	Analalava	Madagascar	HVA	FMNL	Indian/Antananarivo
912	Amborovy Airport	Mahajanga	Madagascar	MJN	FMNM	Indian/Antananarivo
913	Fascene Airport	Nosy-be	Madagascar	NOS	FMNN	Indian/Antananarivo
914	Besalampy Airport	Besalampy	Madagascar	BPY	FMNQ	Indian/Antananarivo
915	Maroantsetra Airport	Maroantsetra	Madagascar	WMN	FMNR	Indian/Antananarivo
916	Sambava Airport	Sambava	Madagascar	SVB	FMNS	Indian/Antananarivo
917	Vohimarina Airport	Vohemar	Madagascar	VOH	FMNV	Indian/Antananarivo
918	Ambalabe Airport	Antsohihy	Madagascar	WAI	FMNW	Indian/Antananarivo
919	Ampampamena Airport	Ampampamena	Madagascar	IVA	FMNZ	Indian/Antananarivo
920	Tôlanaro Airport	Tolagnaro	Madagascar	FTU	FMSD	Indian/Antananarivo
921	Fianarantsoa Airport	Fianarantsoa	Madagascar	WFI	FMSF	Indian/Antananarivo
922	Farafangana Airport	Farafangana	Madagascar	RVA	FMSG	Indian/Antananarivo
923	Manakara Airport	Manakara	Madagascar	WVK	FMSK	Indian/Antananarivo
924	Mananjary Airport	Mananjary	Madagascar	MNJ	FMSM	Indian/Antananarivo
925	Morombe Airport	Morombe	Madagascar	MXM	FMSR	Indian/Antananarivo
926	Toliara Airport	Toliara	Madagascar	TLE	FMST	Indian/Antananarivo
927	Mbanza Congo Airport	M'banza-congo	Angola	SSY	FNBC	Africa/Luanda
928	Benguela Airport	Benguela	Angola	BUG	FNBG	Africa/Luanda
929	Cabinda Airport	Cabinda	Angola	CAB	FNCA	Africa/Luanda
930	Nova Lisboa Airport	Huambo	Angola	NOV	FNHU	Africa/Luanda
931	Kuito Airport	Kuito	Angola	SVP	FNKU	Africa/Luanda
932	Lobito Airport	Lobito	Angola		FNLB	Africa/Luanda
933	Quatro de Fevereiro Airport	Luanda	Angola	LAD	FNLU	Africa/Luanda
934	Malanje Airport	Malanje	Angola	MEG	FNMA	Africa/Luanda
935	Menongue Airport	Menongue	Angola	SPP	FNME	Africa/Luanda
936	Negage Airport	Negage	Angola	GXG	FNNG	Africa/Luanda
937	Porto Amboim Airport	Porto Amboim	Angola	PBN	FNPA	Africa/Luanda
938	Saurimo Airport	Saurimo	Angola	VHC	FNSA	Africa/Luanda
939	Soyo Airport	Soyo	Angola	SZA	FNSO	Africa/Luanda
940	Lubango Airport	Lubango	Angola	SDD	FNUB	Africa/Luanda
941	Luena Airport	Luena	Angola	LUO	FNUE	Africa/Luanda
942	Uige Airport	Uige	Angola	UGO	FNUG	Africa/Luanda
943	Xangongo Airport	Xangongo	Angola	XGN	FNXA	Africa/Luanda
944	Oyem Airport	Oyem	Gabon	OYE	FOGO	Africa/Libreville
945	Okondja Airport	Okondja	Gabon	OKN	FOGQ	Africa/Libreville
946	Lambarene Airport	Lambarene	Gabon	LBQ	FOGR	Africa/Libreville
947	Bitam Airport	Bitam	Gabon	BMM	FOOB	Africa/Libreville
948	Port Gentil Airport	Port Gentil	Gabon	POG	FOOG	Africa/Libreville
949	Omboue Hopital Airport	Omboue Hospial	Gabon	OMB	FOOH	Africa/Libreville
950	Makokou Airport	Makokou	Gabon	MKU	FOOK	Africa/Libreville
951	Libreville Leon M'ba International Airport	Libreville	Gabon	LBV	FOOL	Africa/Libreville
952	M'Vengue El Hadj Omar Bongo Ondimba International Airport	Franceville	Gabon	MVB	FOON	Africa/Libreville
953	Principe Airport	Principe	Sao Tome and Principe	PCP	FPPR	Africa/Sao_Tome
954	São Tomé International Airport	Sao Tome	Sao Tome and Principe	TMS	FPST	Africa/Sao_Tome
955	Beira Airport	Beira	Mozambique	BEW	FQBR	Africa/Maputo
956	Inhambane Airport	Inhambane	Mozambique	INH	FQIN	Africa/Maputo
957	Lichinga Airport	Lichinga	Mozambique	VXC	FQLC	Africa/Maputo
958	Lumbo Airport	Lumbo	Mozambique	LFB	FQLU	Africa/Maputo
959	Maputo Airport	Maputo	Mozambique	MPM	FQMA	Africa/Maputo
960	Mueda Airport	Mueda	Mozambique	MUD	FQMD	Africa/Maputo
961	Mocímboa da Praia Airport	Mocimboa Da Praia	Mozambique	MZB	FQMP	Africa/Maputo
962	Marrupa Airport	Marrupa	Mozambique		FQMR	Africa/Maputo
963	Nacala Airport	Nacala	Mozambique	MNC	FQNC	Africa/Maputo
964	Nampula Airport	Nampula	Mozambique	APL	FQNP	Africa/Maputo
965	Pemba Airport	Pemba	Mozambique	POL	FQPB	Africa/Maputo
966	Quelimane Airport	Quelimane	Mozambique	UEL	FQQL	Africa/Maputo
967	Songo Airport	Songo	Mozambique		FQSG	Africa/Maputo
968	Chingozi Airport	Tete	Mozambique	TET	FQTT	Africa/Maputo
969	Ulongwe Airport	Ulongwe	Mozambique		FQUG	Africa/Maputo
970	Vilankulo Airport	Vilankulu	Mozambique	VNX	FQVL	Africa/Maputo
971	Alphonse Airport	Alphonse	Seychelles		FSAL	Indian/Mahe
972	Desroches Airport	Desroches	Seychelles	DES	FSDR	Indian/Mahe
973	Farquhar Airport	Farquhar	Seychelles		FSFA	Indian/Mahe
974	Seychelles International Airport	Mahe	Seychelles	SEZ	FSIA	Indian/Mahe
975	Praslin Airport	Praslin	Seychelles	PRI	FSPP	Indian/Mahe
976	Coetivy Airport	Coetivy	Seychelles		FSSC	Indian/Mahe
977	Abeche Airport	Abeche	Chad	AEH	FTTC	Africa/Ndjamena
978	Moundou Airport	Moundou	Chad	MQQ	FTTD	Africa/Ndjamena
979	N'Djamena International Airport	N'djamena	Chad	NDJ	FTTJ	Africa/Ndjamena
980	Faya Largeau Airport	Faya-largeau	Chad	FYT	FTTY	Africa/Ndjamena
981	Joshua Mqabuko Nkomo International Airport	Bulawayo	Zimbabwe	BUQ	FVBU	Africa/Harare
982	Charles Prince Airport	Harare	Zimbabwe		FVCP	Africa/Harare
983	Buffalo Range Airport	Chiredzi	Zimbabwe	BFO	FVCZ	Africa/Harare
984	Victoria Falls International Airport	Victoria Falls	Zimbabwe	VFA	FVFA	Africa/Harare
985	Robert Gabriel Mugabe International Airport	Harare	Zimbabwe	HRE	FVHA	Africa/Harare
986	Kariba International Airport	Kariba	Zimbabwe	KAB	FVKB	Africa/Harare
987	Mutoko Airport	Mutoko	Zimbabwe		FVMT	Africa/Harare
988	Mutare Airport	Mutare	Zimbabwe	UTA	FVMU	Africa/Harare
989	Masvingo International Airport	Masvingo	Zimbabwe	MVZ	FVMV	Africa/Harare
990	Zvishavane Airport	Zvishavane	Zimbabwe		FVSH	Africa/Harare
991	Thornhill Air Base	Gwert	Zimbabwe	GWE	FVTL	Africa/Harare
992	Hwange National Park Airport	Hwange National Park	Zimbabwe	HWN	FVWN	Africa/Harare
993	Chileka International Airport	Blantyre	Malawi	BLZ	FWCL	Africa/Blantyre
994	Karonga Airport	Karonga	Malawi	KGJ	FWKA	Africa/Blantyre
995	Kasungu Airport	Kasungu	Malawi	KBQ	FWKG	Africa/Blantyre
996	Lilongwe International Airport	Lilongwe	Malawi	LLW	FWKI	Africa/Blantyre
997	Mzuzu Airport	Mzuzu	Malawi	ZZU	FWUU	Africa/Blantyre
998	Moshoeshoe I International Airport	Maseru	Lesotho	MSU	FXMM	Africa/Maseru
999	Mejametalana Airbase	Maseru	Lesotho		FXMU	Africa/Maseru
1000	Ndjili International Airport	Kinshasa	Congo (Kinshasa)	FIH	FZAA	Africa/Kinshasa
1001	Ndolo Airport	Kinshasa	Congo (Kinshasa)	NLO	FZAB	Africa/Kinshasa
1002	Muanda Airport	Muanda	Congo (Kinshasa)	MNB	FZAG	Africa/Kinshasa
1003	Kitona Base Airport	Kitona Base	Congo (Kinshasa)		FZAI	Africa/Kinshasa
1004	Bandundu Airport	Bandoundu	Congo (Kinshasa)	FDU	FZBO	Africa/Kinshasa
1005	Kikwit Airport	Kikwit	Congo (Kinshasa)	KKW	FZCA	Africa/Kinshasa
1006	Mbandaka Airport	Mbandaka	Congo (Kinshasa)	MDK	FZEA	Africa/Kinshasa
1007	Gbadolite Airport	Gbadolite	Congo (Kinshasa)	BDT	FZFD	Africa/Kinshasa
1008	Gemena Airport	Gemena	Congo (Kinshasa)	GMA	FZFK	Africa/Kinshasa
1009	Kotakoli Airport	Kotakoli	Congo (Kinshasa)	KLI	FZFP	Africa/Kinshasa
1010	Lisala Airport	Lisala	Congo (Kinshasa)	LIQ	FZGA	Africa/Kinshasa
1011	Bangoka International Airport	Kisangani	Congo (Kinshasa)	FKI	FZIC	Africa/Lubumbashi
1012	Matari Airport	Isiro	Congo (Kinshasa)	IRP	FZJH	Africa/Lubumbashi
1013	Bunia Airport	Bunia	Congo (Kinshasa)	BUX	FZKA	Africa/Lubumbashi
1014	Buta Zega Airport	Buta Zega	Congo (Kinshasa)	BZU	FZKJ	Africa/Lubumbashi
1015	Bukavu Kavumu Airport	Bukavu/kavumu	Congo (Kinshasa)	BKY	FZMA	Africa/Lubumbashi
1016	Goma International Airport	Goma	Congo (Kinshasa)	GOM	FZNA	Africa/Kigali
1017	Kindu Airport	Kindu	Congo (Kinshasa)	KND	FZOA	Africa/Lubumbashi
1018	Lubumbashi International Airport	Lubumashi	Congo (Kinshasa)	FBM	FZQA	Africa/Lubumbashi
1019	Kolwezi Airport	Kolwezi	Congo (Kinshasa)	KWZ	FZQM	Africa/Lubumbashi
1020	Kalemie Airport	Kalemie	Congo (Kinshasa)	FMI	FZRF	Africa/Lubumbashi
1021	Kamina Base Airport	Kamina Base	Congo (Kinshasa)	KMN	FZSA	Africa/Lubumbashi
1022	Kananga Airport	Kananga	Congo (Kinshasa)	KGA	FZUA	Africa/Lubumbashi
1023	Mbuji Mayi Airport	Mbuji-mayi	Congo (Kinshasa)	MJM	FZWA	Africa/Lubumbashi
1024	Modibo Keita International Airport	Bamako	Mali	BKO	GABS	Africa/Bamako
1025	Gao Airport	Gao	Mali	GAQ	GAGO	Africa/Bamako
1026	Kayes Dag Dag Airport	Kayes	Mali	KYS	GAKY	Africa/Bamako
1027	Mopti Airport	Mopti	Mali	MZI	GAMB	Africa/Bamako
1028	Timbuktu Airport	Tombouctou	Mali	TOM	GATB	Africa/Bamako
1029	Tessalit Airport	Tessalit	Mali		GATS	Africa/Bamako
1030	Banjul International Airport	Banjul	Gambia	BJL	GBYD	Africa/Banjul
1031	Fuerteventura Airport	Fuerteventura	Spain	FUE	GCFV	Atlantic/Canary
1032	Hierro Airport	Hierro	Spain	VDE	GCHI	Atlantic/Canary
1033	La Palma Airport	Santa Cruz De La Palma	Spain	SPC	GCLA	Atlantic/Canary
1034	Gran Canaria Airport	Gran Canaria	Spain	LPA	GCLP	Atlantic/Canary
1035	Lanzarote Airport	Arrecife	Spain	ACE	GCRR	Atlantic/Canary
1036	Tenerife South Airport	Tenerife	Spain	TFS	GCTS	Atlantic/Canary
1037	Tenerife Norte Airport	Tenerife	Spain	TFN	GCXO	Atlantic/Canary
1038	Melilla Airport	Melilla	Spain	MLN	GEML	Europe/Madrid
1039	Lungi International Airport	Freetown	Sierra Leone	FNA	GFLL	Africa/Freetown
1040	Cufar Airport	Cufar	Guinea-Bissau		GGCF	Africa/Bissau
1041	Spriggs Payne Airport	Monrovia	Liberia	MLW	GLMR	Africa/Monrovia
1042	Roberts International Airport	Monrovia	Liberia	ROB	GLRB	Africa/Monrovia
1043	Al Massira Airport	Agadir	Morocco	AGA	GMAD	Africa/Casablanca
1044	Tan Tan Airport	Tan Tan	Morocco	TTA	GMAT	Africa/Casablanca
1045	Saïss Airport	Fes	Morocco	FEZ	GMFF	Africa/Casablanca
1046	Ifrane Airport	Ifrane	Morocco		GMFI	Africa/Casablanca
1047	Moulay Ali Cherif Airport	Er-rachidia	Morocco	ERH	GMFK	Africa/Casablanca
1048	Bassatine Airport	Meknes	Morocco	MEK	GMFM	Africa/Casablanca
1049	Angads Airport	Oujda	Morocco	OUD	GMFO	Africa/Casablanca
1050	Ben Slimane Airport	Ben Slimane	Morocco	GMD	GMMB	Africa/Casablanca
1051	Rabat-Salé Airport	Rabat	Morocco	RBA	GMME	Africa/Casablanca
1052	Mohammed V International Airport	Casablanca	Morocco	CMN	GMMN	Africa/Casablanca
1053	Menara Airport	Marrakech	Morocco	RAK	GMMX	Africa/Casablanca
1054	Kenitra Airport	Kentira	Morocco	NNA	GMMY	Africa/Casablanca
1055	Ouarzazate Airport	Ouarzazate	Morocco	OZZ	GMMZ	Africa/Casablanca
1056	Cherif Al Idrissi Airport	Al Hociema	Morocco	AHU	GMTA	Africa/Casablanca
1057	Saniat R'mel Airport	Tetouan	Morocco	TTU	GMTN	Africa/Casablanca
1060	Cap Skirring Airport	Cap Skiring	Senegal	CSK	GOGS	Africa/Dakar
1061	Kaolack Airport	Kaolack	Senegal	KLC	GOOK	Africa/Dakar
1062	Léopold Sédar Senghor International Airport	Dakar	Senegal	DKR	GOOY	Africa/Dakar
1063	Saint Louis Airport	St. Louis	Senegal	XLS	GOSS	Africa/Dakar
1064	Bakel Airport	Bakel	Senegal	BXE	GOTB	Africa/Dakar
1065	Kédougou Airport	Kedougou	Senegal	KGG	GOTK	Africa/Dakar
1066	Tambacounda Airport	Tambacounda	Senegal	TUD	GOTT	Africa/Dakar
1067	Aioun el Atrouss Airport	Aioun El Atrouss	Mauritania	AEO	GQNA	Africa/Nouakchott
1068	Tidjikja Airport	Tidjikja	Mauritania	TIY	GQND	Africa/Nouakchott
1069	Kiffa Airport	Kiffa	Mauritania	KFA	GQNF	Africa/Nouakchott
1070	Néma Airport	Nema	Mauritania	EMN	GQNI	Africa/Nouakchott
1071	Kaédi Airport	Kaedi	Mauritania	KED	GQNK	Africa/Nouakchott
1072	Nouakchott–Oumtounsy International Airport	Nouakschott	Mauritania	NKC	GQNO	Africa/Nouakchott
1073	Sélibaby Airport	Selibabi	Mauritania	SEY	GQNS	Africa/Nouakchott
1074	Atar International Airport	Atar	Mauritania	ATR	GQPA	Africa/Nouakchott
1075	Nouadhibou International Airport	Nouadhibou	Mauritania	NDB	GQPP	Africa/Nouakchott
1076	Bir Moghrein Airport	Bir Moghrein	Mauritania		GQPT	Africa/Nouakchott
1077	Fria Airport	Fira	Guinea	FIG	GUFA	Africa/Conakry
1078	Faranah Airport	Faranah	Guinea	FAA	GUFH	Africa/Conakry
1079	Tata Airport	Labe	Guinea	LEK	GULB	Africa/Conakry
1080	Amílcar Cabral International Airport	Amilcar Cabral	Cape Verde	SID	GVAC	Atlantic/Cape_Verde
1081	Rabil Airport	Boa Vista	Cape Verde	BVC	GVBA	Atlantic/Cape_Verde
1082	Maio Airport	Maio	Cape Verde	MMO	GVMA	Atlantic/Cape_Verde
1083	Preguiça Airport	Sao Nocolau Island	Cape Verde	SNE	GVSN	Atlantic/Cape_Verde
1084	São Pedro Airport	Sao Vicente Island	Cape Verde	VXE	GVSV	Atlantic/Cape_Verde
1085	Addis Ababa Bole International Airport	Addis Ababa	Ethiopia	ADD	HAAB	Africa/Addis_Ababa
1086	Lideta Army Airport	Addis Ababa	Ethiopia		HAAL	Africa/Addis_Ababa
1087	Arba Minch Airport	Arba Minch	Ethiopia	AMH	HAAM	Africa/Addis_Ababa
1088	Axum Airport	Axum	Ethiopia	AXU	HAAX	Africa/Addis_Ababa
1089	Bahir Dar Airport	Bahar Dar	Ethiopia	BJR	HABD	Africa/Addis_Ababa
1090	Aba Tenna Dejazmach Yilma International Airport	Dire Dawa	Ethiopia	DIR	HADR	Africa/Addis_Ababa
1091	Gambella Airport	Gambella	Ethiopia	GMB	HAGM	Africa/Addis_Ababa
1092	Gonder Airport	Gondar	Ethiopia	GDQ	HAGN	Africa/Addis_Ababa
1093	Jimma Airport	Jimma	Ethiopia	JIM	HAJM	Africa/Addis_Ababa
1094	Lalibella Airport	Lalibella	Ethiopia	LLI	HALL	Africa/Addis_Ababa
1095	Mekele Airport	Makale	Ethiopia	MQX	HAMK	Africa/Addis_Ababa
1096	Asosa Airport	Asosa	Ethiopia	ASO	HASO	Africa/Addis_Ababa
1097	Bujumbura International Airport	Bujumbura	Burundi	BJM	HBBA	Africa/Bujumbura
1098	Egal International Airport	Hargeisa	Somalia	HGA	HCMH	Africa/Mogadishu
1099	Berbera Airport	Berbera	Somalia	BBO	HCMI	Africa/Mogadishu
1100	Kisimayu Airport	Kismayu	Somalia	KMU	HCMK	Africa/Mogadishu
1101	El Nouzha Airport	Alexandria	Egypt	ALY	HEAX	Africa/Cairo
1102	Abu Simbel Airport	Abu Simbel	Egypt	ABS	HEBL	Africa/Cairo
1103	Cairo International Airport	Cairo	Egypt	CAI	HECA	Africa/Cairo
1104	Cairo West Airport	Cairo	Egypt	CWE	HECW	Africa/Cairo
1105	Hurghada International Airport	Hurghada	Egypt	HRG	HEGN	Africa/Cairo
1106	El Gora Airport	El Gorah	Egypt	EGH	HEGR	Africa/Cairo
1107	Luxor International Airport	Luxor	Egypt	LXR	HELX	Africa/Cairo
1108	Mersa Matruh Airport	Mersa-matruh	Egypt	MUH	HEMM	Africa/Cairo
1109	Port Said Airport	Port Said	Egypt	PSD	HEPS	Africa/Cairo
1110	St Catherine International Airport	St. Catherine	Egypt	SKV	HESC	Africa/Cairo
1111	Aswan International Airport	Aswan	Egypt	ASW	HESN	Africa/Cairo
1112	El Tor Airport	El-tor	Egypt	ELT	HETR	Africa/Cairo
1113	Eldoret International Airport	Eldoret	Kenya	EDL	HKEL	Africa/Nairobi
1114	Kakamega Airport	Kakamega	Kenya	GGM	HKKG	Africa/Nairobi
1115	Kisumu Airport	Kisumu	Kenya	KIS	HKKI	Africa/Nairobi
1116	Kitale Airport	Kitale	Kenya	KTL	HKKT	Africa/Nairobi
1117	Lodwar Airport	Lodwar	Kenya	LOK	HKLO	Africa/Nairobi
1118	Manda Airstrip	Lamu	Kenya	LAU	HKLU	Africa/Nairobi
1119	Mombasa Moi International Airport	Mombasa	Kenya	MBA	HKMO	Africa/Nairobi
1120	Naivasha Airport	Naivasha	Kenya		HKNV	Africa/Nairobi
1121	Nairobi Wilson Airport	Nairobi	Kenya	WIL	HKNW	Africa/Nairobi
1122	Moi Air Base	Nairobi	Kenya		HKRE	Africa/Nairobi
1123	Wajir Airport	Wajir	Kenya	WJR	HKWJ	Africa/Nairobi
1124	Bu Attifel Airport	Buattifel	Libya		HLFL	Africa/Tripoli
1125	Warehouse 59e Airport	Giallo	Libya		HLGL	Africa/Tripoli
1126	Ghat Airport	Ghat	Libya	GHT	HLGT	Africa/Tripoli
1127	Kufra Airport	Kufra	Libya	AKF	HLKF	Africa/Tripoli
1128	Benina International Airport	Benghazi	Libya	BEN	HLLB	Africa/Tripoli
1129	Sabha Airport	Sebha	Libya	SEB	HLLS	Africa/Tripoli
1130	Tripoli International Airport	Tripoli	Libya	TIP	HLLT	Africa/Tripoli
1131	Marsa Brega Airport	Marsa Brega	Libya	LMQ	HLMB	Africa/Tripoli
1132	Ras Lanuf Oil Airport	Ras Lanouf V 40	Libya		HLNF	Africa/Tripoli
1133	Hon Airport	Hon	Libya	HUQ	HLON	Africa/Tripoli
1134	Dahra Airport	Dahra	Libya		HLRA	Africa/Tripoli
1135	Ghadames East Airport	Ghadames	Libya	LTD	HLTD	Africa/Tripoli
1136	Zella 74 Airport	Zella 74	Libya		HLZA	Africa/Tripoli
1137	Gisenyi Airport	Gisenyi	Rwanda	GYI	HRYG	Africa/Kigali
1138	Kigali International Airport	Kigali	Rwanda	KGL	HRYR	Africa/Kigali
1139	Kamembe Airport	Kamembe	Rwanda	KME	HRZA	Africa/Kigali
1140	Dongola Airport	Dongola	Sudan	DOG	HSDN	Africa/Khartoum
1141	Damazin Airport	Damazin	Sudan	RSS	HSDZ	Africa/Khartoum
1142	El Fasher Airport	El Fasher	Sudan	ELF	HSFS	Africa/Khartoum
1143	Kassala Airport	Kassala	Sudan	KSL	HSKA	Africa/Khartoum
1144	Kadugli Airport	Kadugli	Sudan	KDX	HSLI	Africa/Khartoum
1145	El Obeid Airport	El Obeid	Sudan	EBD	HSOB	Africa/Khartoum
1146	Juba International Airport	Juba	South Sudan	JUB	HSSJ	Africa/Juba
1147	Malakal Airport	Malakal	Sudan	MAK	HSSM	Africa/Juba
1148	Khartoum International Airport	Khartoum	Sudan	KRT	HSSS	Africa/Khartoum
1149	Arusha Airport	Arusha	Tanzania	ARK	HTAR	Africa/Dar_es_Salaam
1150	Julius Nyerere International Airport	Dar Es Salaam	Tanzania	DAR	HTDA	Africa/Dar_es_Salaam
1151	Dodoma Airport	Dodoma	Tanzania	DOD	HTDO	Africa/Dar_es_Salaam
1152	Iringa Airport	Iringa	Tanzania	IRI	HTIR	Africa/Dar_es_Salaam
1153	Kilimanjaro International Airport	Kilimanjaro	Tanzania	JRO	HTKJ	Africa/Dar_es_Salaam
1154	Lake Manyara Airport	Lake Manyara	Tanzania	LKY	HTLM	Africa/Dar_es_Salaam
1155	Mtwara Airport	Mtwara	Tanzania	MYW	HTMT	Africa/Dar_es_Salaam
1156	Mwanza Airport	Mwanza	Tanzania	MWZ	HTMW	Africa/Dar_es_Salaam
1157	Pemba Airport	Pemba	Tanzania	PMA	HTPE	Africa/Dar_es_Salaam
1158	Tanga Airport	Tanga	Tanzania	TGT	HTTG	Africa/Dar_es_Salaam
1159	Abeid Amani Karume International Airport	Zanzibar	Tanzania	ZNZ	HTZA	Africa/Dar_es_Salaam
1160	Entebbe International Airport	Entebbe	Uganda	EBB	HUEN	Africa/Kampala
1161	Soroti Airport	Soroti	Uganda	SRT	HUSO	Africa/Kampala
1162	Tirana International Airport Mother Teresa	Tirana	Albania	TIA	LATI	Europe/Tirane
1163	Burgas Airport	Bourgas	Bulgaria	BOJ	LBBG	Europe/Sofia
1164	Gorna Oryahovitsa Airport	Gorna Orechovica	Bulgaria	GOZ	LBGO	Europe/Sofia
1165	Plovdiv International Airport	Plovdiv	Bulgaria	PDV	LBPD	Europe/Sofia
1166	Sofia Airport	Sofia	Bulgaria	SOF	LBSF	Europe/Sofia
1167	Stara Zagora Airport	Stara Zagora	Bulgaria	SZR	LBSZ	Europe/Sofia
1168	Varna Airport	Varna	Bulgaria	VAR	LBWN	Europe/Sofia
1169	Larnaca International Airport	Larnaca	Cyprus	LCA	LCLK	Asia/Nicosia
1170	Paphos International Airport	Paphos	Cyprus	PFO	LCPH	Asia/Nicosia
1171	RAF Akrotiri	Akrotiri	Cyprus	AKT	LCRA	Europe/London
1172	Dubrovnik Airport	Dubrovnik	Croatia	DBV	LDDU	Europe/Zagreb
1173	Osijek-Čepin Airfield	Cepin	Croatia		LDOC	Europe/Zagreb
1174	Osijek Airport	Osijek	Croatia	OSI	LDOS	Europe/Zagreb
1175	Pula Airport	Pula	Croatia	PUY	LDPL	Europe/Zagreb
1176	Grobnicko Polje Airport	Grobnik	Croatia		LDRG	Europe/Zagreb
1177	Rijeka Airport	Rijeka	Croatia	RJK	LDRI	Europe/Zagreb
1178	Split Airport	Split	Croatia	SPU	LDSP	Europe/Zagreb
1179	Varaždin Airport	Varazdin	Croatia		LDVA	Europe/Zagreb
1180	Zagreb Airport	Zagreb	Croatia	ZAG	LDZA	Europe/Zagreb
1181	Zadar Airport	Zadar	Croatia	ZAD	LDZD	Europe/Zagreb
1182	Udbina Air Base	Udbina	Croatia		LDZU	Europe/Zagreb
1183	Albacete-Los Llanos Airport	Albacete	Spain	ABC	LEAB	Europe/Madrid
1184	Alicante International Airport	Alicante	Spain	ALC	LEAL	Europe/Madrid
1185	Almería International Airport	Almeria	Spain	LEI	LEAM	Europe/Madrid
1186	Asturias Airport	Aviles	Spain	OVD	LEAS	Europe/Madrid
1187	Córdoba Airport	Cordoba	Spain	ODB	LEBA	Europe/Madrid
1188	Bilbao Airport	Bilbao	Spain	BIO	LEBB	Europe/Madrid
1189	Barcelona International Airport	Barcelona	Spain	BCN	LEBL	Europe/Madrid
1190	Badajoz Airport	Badajoz	Spain	BJZ	LEBZ	Europe/Madrid
1191	A Coruña Airport	La Coruna	Spain	LCG	LECO	Europe/Madrid
1192	Armilla Air Base	Granada	Spain		LEGA	Europe/Madrid
1193	Girona Airport	Gerona	Spain	GRO	LEGE	Europe/Madrid
1194	Federico Garcia Lorca Airport	Granada	Spain	GRX	LEGR	Europe/Madrid
1195	Getafe Air Base	Madrid	Spain		LEGT	Europe/Madrid
1196	Ibiza Airport	Ibiza	Spain	IBZ	LEIB	Europe/Madrid
1197	Jerez Airport	Jerez	Spain	XRY	LEJR	Europe/Madrid
1198	San Javier Airport	Murcia	Spain	MJV	LELC	Europe/Madrid
1199	Adolfo Suárez Madrid–Barajas Airport	Madrid	Spain	MAD	LEMD	Europe/Madrid
1200	Málaga Airport	Malaga	Spain	AGP	LEMG	Europe/Madrid
1201	Menorca Airport	Menorca	Spain	MAH	LEMH	Europe/Madrid
1202	Moron Air Base	Sevilla	Spain	OZP	LEMO	Europe/Madrid
1203	Ocaña Airport	Ocana	Spain		LEOC	Europe/Madrid
1204	Pamplona Airport	Pamplona	Spain	PNA	LEPP	Europe/Madrid
1205	Alcantarilla Air Base	Murcia	Spain		LERI	Europe/Madrid
1206	Reus Air Base	Reus	Spain	REU	LERS	Europe/Madrid
1207	Rota Naval Station Airport	Rota	Spain	ROZ	LERT	Europe/Madrid
1208	Salamanca Airport	Salamanca	Spain	SLM	LESA	Europe/Madrid
1209	Son Bonet Airport	Son Bonet	Spain		LESB	Europe/Madrid
1210	Palma De Mallorca	Palma De Mallorca	Spain		LESJ	Europe/Madrid
1211	San Luis Airport	San Luis	Spain		LESL	Europe/Madrid
1212	San Sebastian Airport	San Sebastian	Spain	EAS	LESO	Europe/Madrid
1213	Santiago de Compostela Airport	Santiago	Spain	SCQ	LEST	Europe/Madrid
1214	Pirineus - la Seu d'Urgel Airport	Seo De Urgel	Spain	LEU	LESU	Europe/Madrid
1215	Torrejón Airport	Madrid	Spain	TOJ	LETO	Europe/Madrid
1216	Valencia Airport	Valencia	Spain	VLC	LEVC	Europe/Madrid
1217	Valladolid Airport	Valladolid	Spain	VLL	LEVD	Europe/Madrid
1218	Cuatro Vientos	Madrid	Spain		LEVS	Europe/Madrid
1219	Vitoria/Foronda Airport	Vitoria	Spain	VIT	LEVT	Europe/Madrid
1220	Vigo Airport	Vigo	Spain	VGO	LEVX	Europe/Madrid
1221	Santander Airport	Santander	Spain	SDR	LEXJ	Europe/Madrid
1222	Zaragoza Air Base	Zaragoza	Spain	ZAZ	LEZG	Europe/Madrid
1223	Sevilla Airport	Sevilla	Spain	SVQ	LEZL	Europe/Madrid
1224	Calais-Dunkerque Airport	Calais	France	CQF	LFAC	Europe/Paris
1225	Péronne-Saint-Quentin Airport	Peronne	France		LFAG	Europe/Paris
1226	Nangis-Les Loges Airport	Nangis	France		LFAI	Europe/Paris
1227	Bagnoles-de-l'Orne-Couterne Airport	Bagnole-de-l'orne	France		LFAO	Europe/Paris
1228	Albert-Bray Airport	Albert	France	BYF	LFAQ	Europe/Paris
1229	Le Touquet-Côte d'Opale Airport	Le Tourquet	France	LTQ	LFAT	Europe/Paris
1230	Valenciennes-Denain Airport	Valenciennes	France	XVS	LFAV	Europe/Paris
1231	Amiens-Glisy Airport	Amiens	France		LFAY	Europe/Paris
1232	Agen-La Garenne Airport	Agen	France	AGF	LFBA	Europe/Paris
1233	Cazaux (BA 120) Air Base	Cazaux	France		LFBC	Europe/Paris
1234	Bordeaux-Mérignac Airport	Bordeaux	France	BOD	LFBD	Europe/Paris
1235	Bergerac-Roumanière Airport	Bergerac	France	EGC	LFBE	Europe/Paris
1236	Toulouse-Francazal (BA 101) Air Base	Toulouse	France		LFBF	Europe/Paris
1237	Cognac-Châteaubernard (BA 709) Air Base	Cognac	France	CNG	LFBG	Europe/Paris
1238	Poitiers-Biard Airport	Poitiers	France	PIS	LFBI	Europe/Paris
1239	Montluçon-Guéret Airport	Montlucon-gueret	France	MCU	LFBK	Europe/Paris
1240	Limoges Airport	Limoges	France	LIG	LFBL	Europe/Paris
1241	Mont-de-Marsan (BA 118) Air Base	Mont-de-marsan	France		LFBM	Europe/Paris
1242	Niort-Souché Airport	Niort	France	NIT	LFBN	Europe/Paris
1243	Toulouse-Blagnac Airport	Toulouse	France	TLS	LFBO	Europe/Paris
1244	Pau Pyrénées Airport	Pau	France	PUF	LFBP	Europe/Paris
1245	Muret-Lherm Airport	La Rochelle	France		LFBR	Europe/Paris
1246	Tarbes-Lourdes-Pyrénées Airport	Tarbes	France	LDE	LFBT	Europe/Paris
1247	Angoulême-Brie-Champniers Airport	Angouleme	France	ANG	LFBU	Europe/Paris
1248	Brive Souillac Airport	Brive	France	BVE	LFSL	Europe/Paris
1249	Périgueux-Bassillac Airport	Perigueux	France	PGX	LFBX	Europe/Paris
1250	Biarritz-Anglet-Bayonne Airport	Biarritz-bayonne	France	BIQ	LFBZ	Europe/Paris
1251	Cahors-Lalbenque Airport	Cahors	France	ZAO	LFCC	Europe/Paris
1252	Saint-Girons-Antichan Airport	St.-girons	France		LFCG	Europe/Paris
1253	Arcachon-La Teste-de-Buch Airport	Arcachon	France		LFCH	Europe/Paris
1254	Albi-Le Séquestre Airport	Albi	France	LBI	LFCI	Europe/Paris
1255	Castres-Mazamet Airport	Castres	France	DCM	LFCK	Europe/Paris
1256	Toulouse-Lasbordes Airport	Toulouse	France		LFCL	Europe/Paris
1257	Millau-Larzac Airfield	Millau	France		LFCM	Europe/Paris
1258	Graulhet-Montdragon Airport	Graulhet	France		LFCQ	Europe/Paris
1259	Rodez-Marcillac Airport	Rodez	France	RDZ	LFCR	Europe/Paris
1260	Ussel-Thalamy Airport	Ussel	France		LFCU	Europe/Paris
1261	Villeneuve-sur-Lot Airport	Villeneuve-sur-lot	France		LFCW	Europe/Paris
1262	Royan-Médis Airport	Royan	France	RYN	LFCY	Europe/Paris
1263	Mimizan Airport	Mimizan	France		LFCZ	Europe/Paris
1264	Aire-sur-l'Adour Airport	Aire-sur-l'adour	France		LFDA	Europe/Paris
1265	Montauban Airport	Montauban	France	XMW	LFDB	Europe/Paris
1266	Auch-Lamothe Airport	Auch	France		LFDH	Europe/Paris
1267	Libourne-Artigues-de-Lussac Airport	Libourne	France		LFDI	Europe/Paris
1268	Pamiers-Les Pujols Airport	Pamiers	France		LFDJ	Europe/Paris
1269	Marmande-Virazeil Airport	Marmande	France		LFDM	Europe/Paris
1270	Rochefort-Saint-Agnant (BA 721) Airport	Rochefort	France	RCO	LFDN	Europe/Paris
1271	Pontivy Airport	Pontivy	France		LFED	Europe/Paris
1272	Aubigny-sur-Nère Airport	Aubigny-sur-nere	France		LFEH	Europe/Paris
1273	Guiscriff Scaer Airport	Guiscriff-scaer	France		LFES	Europe/Paris
1274	Ancenis Airport	Ancenis	France		LFFI	Europe/Paris
1275	Brienne-le-Château Airport	Brienne-le Chateau	France		LFFN	Europe/Paris
1276	Colmar-Houssen Airport	Colmar	France	CMR	LFGA	Europe/Paris
1277	Beaune-Challanges Airport	Beaune	France		LFGF	Europe/Paris
1278	Dole-Tavaux Airport	Dole	France	DLE	LFGJ	Europe/Paris
1279	Joigny Airport	Joigny	France		LFGK	Europe/Paris
1280	Verdun-Le Rozelier Airfield	Verdun	France		LFGW	Europe/Paris
1281	Aubenas-Ardèche Méridional Airport	Aubenas-vals-lanas	France	OBS	LFHO	Europe/Paris
1282	Le Puy-Loudes Airport	Le Puy	France	LPY	LFHP	Europe/Paris
1283	Saint-Flour-Coltines Airport	St.-flour	France		LFHQ	Europe/Paris
1284	Bourg-Ceyzériat Airport	Bourg	France		LFHS	Europe/Paris
1285	Villefranche-Tarare Airport	Vilefrance	France		LFHV	Europe/Paris
1286	Moulins-Montbeugny Airport	Moulins	France		LFHY	Europe/Paris
1287	Saint-Affrique-Belmont Airport	St.-afrique-belmont	France		LFIF	Europe/Paris
1288	Cassagnes-Bégonhès Airport	Cassagnes-beghones	France		LFIG	Europe/Paris
1289	Metz-Nancy-Lorraine Airport	Metz	France	ETZ	LFJL	Europe/Paris
1290	Bastia-Poretta Airport	Bastia	France	BIA	LFKB	Europe/Paris
1291	Calvi-Sainte-Catherine Airport	Calvi	France	CLY	LFKC	Europe/Paris
1292	Figari Sud-Corse Airport	Figari	France	FSC	LFKF	Europe/Paris
1293	Ajaccio-Napoléon Bonaparte Airport	Ajaccio	France	AJA	LFKJ	Europe/Paris
1294	Propriano Airport	Propriano	France	PRP	LFKO	Europe/Paris
1295	Solenzara (BA 126) Air Base	Solenzara	France	SOZ	LFKS	Europe/Paris
1296	Corte Airport	Corte	France		LFKT	Europe/Paris
1297	Auxerre-Branches Airport	Auxerre	France	AUF	LFLA	Europe/Paris
1298	Chambéry-Savoie Airport	Chambery	France	CMF	LFLB	Europe/Paris
1299	Clermont-Ferrand Auvergne Airport	Clermont-Ferrand	France	CFE	LFLC	Europe/Paris
1300	Bourges Airport	Bourges	France	BOU	LFLD	Europe/Paris
1301	Chambéry-Challes-les-Eaux Airport	Chambery	France		LFLE	Europe/Paris
1302	Chalon-Champforgeuil Airport	Chalon	France		LFLH	Europe/Paris
1303	Annemasse Airport	Annemasse	France	QNJ	LFLI	Europe/Paris
1304	Lyon Saint-Exupéry Airport	Lyon	France	LYS	LFLL	Europe/Paris
1305	Mâcon-Charnay Airport	Macon	France		LFLM	Europe/Paris
1306	Saint-Yan Airport	St.-yan	France	SYT	LFLN	Europe/Paris
1307	Roanne-Renaison Airport	Roanne	France	RNE	LFLO	Europe/Paris
1308	Annecy-Haute-Savoie-Mont Blanc Airport	Annecy	France	NCY	LFLP	Europe/Paris
1309	Grenoble-Isère Airport	Grenoble	France	GNB	LFLS	Europe/Paris
1310	Montluçon-Domérat Airport	Montlucon	France		LFLT	Europe/Paris
1311	Valence-Chabeuil Airport	Valence	France	VAF	LFLU	Europe/Paris
1312	Vichy-Charmeil Airport	Vichy	France	VHY	LFLV	Europe/Paris
1313	Aurillac Airport	Aurillac	France	AUR	LFLW	Europe/Paris
1314	Châteauroux-Déols ""Marcel Dassault"" Airport	Chateauroux	France	CHR	LFLX	Europe/Paris
1315	Lyon-Bron Airport	Lyon	France	LYN	LFLY	Europe/Paris
1316	Aix-en-Provence (BA 114) Airport	Aix-les-milles	France		LFMA	Europe/Paris
1317	Le Luc-Le Cannet Airport	Le Luc	France		LFMC	Europe/Paris
1318	Cannes-Mandelieu Airport	Cannes	France	CEQ	LFMD	Europe/Paris
1319	Saint-Étienne-Bouthéon Airport	St-Etienne	France	EBU	LFMH	Europe/Paris
1320	Istres Le Tubé/Istres Air Base (BA 125) Airport	Istres	France		LFMI	Europe/Paris
1321	Carcassonne Airport	Carcassonne	France	CCF	LFMK	Europe/Paris
1322	Marseille Provence Airport	Marseille	France	MRS	LFML	Europe/Paris
1323	Nice-Côte d'Azur Airport	Nice	France	NCE	LFMN	Europe/Paris
1324	Orange-Caritat (BA 115) Air Base	Orange	France	XOG	LFMO	Europe/Paris
1325	Perpignan-Rivesaltes (Llabanère) Airport	Perpignan	France	PGF	LFMP	Europe/Paris
1326	Le Castellet Airport	Le Castellet	France	CTT	LFMQ	Europe/Paris
1327	Alès-Deaux Airport	Ales	France		LFMS	Europe/Paris
1328	Montpellier-Méditerranée Airport	Montpellier	France	MPL	LFMT	Europe/Paris
1329	Béziers-Vias Airport	Beziers	France	BZR	LFMU	Europe/Paris
1330	Avignon-Caumont Airport	Avignon	France	AVN	LFMV	Europe/Paris
1331	Salon-de-Provence (BA 701) Air Base	Salon	France		LFMY	Europe/Paris
1332	Lézignan-Corbières Airfield	Lezignan-corbieres	France		LFMZ	Europe/Paris
1333	Mende-Brenoux Airfield	Mende	France	MEN	LFNB	Europe/Paris
1334	Carpentras Airport	Carpentras	France		LFNH	Europe/Paris
1335	Avord (BA 702) Air Base	Avord	France		LFOA	Europe/Paris
1336	Paris Beauvais Tillé Airport	Beauvais	France	BVA	LFOB	Europe/Paris
1337	Châteaudun (BA 279) Air Base	Chateaudun	France		LFOC	Europe/Paris
1338	Saumur-Saint-Florent Airport	Saumur	France		LFOD	Europe/Paris
1339	Évreux-Fauville (BA 105) Air Base	Evreux	France	EVX	LFOE	Europe/Paris
1340	Le Havre Octeville Airport	Le Havre	France	LEH	LFOH	Europe/Paris
1341	Abbeville	Abbeville	France	XAB	LFOI	Europe/Paris
1342	Orléans-Bricy (BA 123) Air Base	Orleans	France	ORE	LFOJ	Europe/Paris
1343	Châlons-Vatry Airport	Chalons	France	XCR	LFOK	Europe/Paris
1344	Rouen Airport	Rouen	France	URO	LFOP	Europe/Paris
1345	Tours-Val-de-Loire Airport	Tours	France	TUF	LFOT	Europe/Paris
1346	Cholet Le Pontreau Airport	Cholet	France	CET	LFOU	Europe/Paris
1347	Laval-Entrammes Airport	Laval	France	LVA	LFOV	Europe/Paris
1348	Orléans-Saint-Denis-de-l'Hôtel Airport	Orleans	France		LFOZ	Europe/Paris
1349	Paris-Le Bourget Airport	Paris	France	LBG	LFPB	Europe/Paris
1350	Creil Air Base	Creil	France	CSF	LFPC	Europe/Paris
1351	Charles de Gaulle International Airport	Paris	France	CDG	LFPG	Europe/Paris
1352	Coulommiers-Voisins Airport	Coulommiers	France		LFPK	Europe/Paris
1353	Melun-Villaroche Air Base	Melun	France		LFPM	Europe/Paris
1354	Toussus-le-Noble Airport	Toussous-le-noble	France	TNF	LFPN	Europe/Paris
1355	Paris-Orly Airport	Paris	France	ORY	LFPO	Europe/Paris
1356	Pontoise - Cormeilles-en-Vexin Airport	Pontoise	France	POX	LFPT	Europe/Paris
1357	Villacoublay-Vélizy (BA 107) Air Base	Villacoublay	France	VIY	LFPV	Europe/Paris
1358	Reims-Prunay Airport	Reims	France		LFQA	Europe/Paris
1359	Troyes-Barberey Airport	Troyes	France		LFQB	Europe/Paris
1360	Lunéville-Croismare Airport	Luneville	France		LFQC	Europe/Paris
1361	Étain-Rouvres Air Base	Etain	France		LFQE	Europe/Paris
1362	Autun-Bellevue Airport	Autun	France		LFQF	Europe/Paris
1363	Nevers-Fourchambault Airport	Nevers	France	NVS	LFQG	Europe/Paris
1364	Cambrai-Épinoy (BA 103) Air Base	Cambrai	France		LFQI	Europe/Paris
1365	Maubeuge-Élesmes Airport	Maubeuge	France	XME	LFQJ	Europe/Paris
1366	Besançon-La Vèze Airport	Besancon-la-veze	France		LFQM	Europe/Paris
1367	Phalsbourg-Bourscheid Air Base	Phalsbourg	France		LFQP	Europe/Paris
1368	Lille-Lesquin Airport	Lille	France	LIL	LFQQ	Europe/Paris
1369	Merville-Calonne Airport	Merville	France	HZB	LFQT	Europe/Paris
1370	Charleville-Mézières Airport	Charleville	France	XCZ	LFQV	Europe/Paris
1371	Vesoul-Frotey Airport	Vesoul-frotey	France		LFQW	Europe/Paris
1372	Brest Bretagne Airport	Brest	France	BES	LFRB	Europe/Paris
1373	Cherbourg-Maupertus Airport	Cherbourg	France	CER	LFRC	Europe/Paris
1374	Dinard-Pleurtuit-Saint-Malo Airport	Dinard	France	DNR	LFRD	Europe/Paris
1375	La Baule-Escoublac Airport	La Baule	France	LBY	LFRE	Europe/Paris
1376	Granville Airport	Granville	France	GFR	LFRF	Europe/Paris
1377	Deauville-Saint-Gatien Airport	Deauville	France	DOL	LFRG	Europe/Paris
1378	Lorient South Brittany (Bretagne Sud) Airport	Lorient	France	LRT	LFRH	Europe/Paris
1379	La Roche-sur-Yon Airport	La Roche-sur-yon	France	EDM	LFRI	Europe/Paris
1380	Landivisiau Air Base	Landivisiau	France	LDV	LFRJ	Europe/Paris
1381	Caen-Carpiquet Airport	Caen	France	CFR	LFRK	Europe/Paris
1382	Lanvéoc-Poulmic Air Base	Lanvedoc	France		LFRL	Europe/Paris
1383	Le Mans-Arnage Airport	Le Mans	France	LME	LFRM	Europe/Paris
1384	Rennes-Saint-Jacques Airport	Rennes	France	RNS	LFRN	Europe/Paris
1385	Lannion-Côte de Granit Airport	Lannion	France	LAI	LFRO	Europe/Paris
1386	Quimper-Cornouaille Airport	Quimper	France	UIP	LFRQ	Europe/Paris
1387	Nantes Atlantique Airport	Nantes	France	NTE	LFRS	Europe/Paris
1388	Saint-Brieuc-Armor Airport	St.-brieuc Armor	France	SBK	LFRT	Europe/Paris
1389	Morlaix-Ploujean Airport	Morlaix	France	MXN	LFRU	Europe/Paris
1390	Vannes-Meucon Airport	Vannes	France	VNE	LFRV	Europe/Paris
1391	Saint-Nazaire-Montoir Airport	St.-nazaire	France	SNR	LFRZ	Europe/Paris
1392	EuroAirport Basel-Mulhouse-Freiburg Airport	Mulhouse	France	BSL	LFSB	Europe/Paris
1393	Colmar-Meyenheim Air Base	Colmar	France		LFSC	Europe/Paris
1394	Dijon-Bourgogne Airport	Dijon	France	DIJ	LFSD	Europe/Paris
1395	Metz-Frescaty (BA 128) Air Base	Metz	France	MZM	LFSF	Europe/Paris
1396	Épinal-Mirecourt Airport	Epinal	France	EPL	LFSG	Europe/Paris
1397	Haguenau Airport	Haguenau	France		LFSH	Europe/Paris
1398	Saint-Dizier-Robinson (BA 113) Air Base	St.-dizier	France		LFSI	Europe/Paris
1399	Montbéliard-Courcelles Airfield	Montbeliard	France		LFSM	Europe/Paris
1400	Nancy-Essey Airport	Nancy	France	ENC	LFSN	Europe/Paris
1401	Nancy-Ochey (BA 133) Air Base	Nancy	France		LFSO	Europe/Paris
1402	Pontarlier Airport	Pontarlier	France		LFSP	Europe/Paris
1403	Reims-Champagne (BA 112) Air Base	Reims	France	RHE	LFSR	Europe/Paris
1404	Strasbourg Airport	Strasbourg	France	SXB	LFST	Europe/Paris
1405	Luxeuil-Saint-Sauveur (BA 116) Air Base	Luxeuil	France		LFSX	Europe/Paris
1406	Cuers-Pierrefeu Airport	Cuers	France		LFTF	Europe/Paris
1407	Toulon-Hyères Airport	Hyeres	France	TLN	LFTH	Europe/Paris
1408	Nîmes-Arles-Camargue Airport	Nimes	France	FNI	LFTW	Europe/Paris
1409	Miquelon Airport	Miquelon	Saint Pierre and Miquelon	MQC	LFVM	America/Miquelon
1410	St Pierre Airport	St.-pierre	Saint Pierre and Miquelon	FSP	LFVP	America/Miquelon
1411	Ambérieu Air Base (BA 278)	Amberieu	France		LFXA	Europe/Paris
1412	Damblain Airport	Damblain	France		LFYD	Europe/Paris
1413	Andravida Air Base	Andravida	Greece	PYR	LGAD	Europe/Athens
1414	Agrinion Air Base	Agrinion	Greece	AGQ	LGAG	Europe/Athens
1415	Dimokritos Airport	Alexandroupolis	Greece	AXD	LGAL	Europe/Athens
1416	Alexandria Airport	Alexandria	Greece		LGAX	Europe/Athens
1417	Nea Anchialos Airport	Nea Anghialos	Greece	VOL	LGBL	Europe/Athens
1418	Elefsis Airport	Elefsis	Greece		LGEL	Europe/Athens
1419	Chios Island National Airport	Chios	Greece	JKH	LGHI	Europe/Athens
1420	Ioannina Airport	Ioannina	Greece	IOA	LGIO	Europe/Athens
1421	Heraklion International Nikos Kazantzakis Airport	Heraklion	Greece	HER	LGIR	Europe/Athens
1422	Kastoria National Airport	Kastoria	Greece	KSO	LGKA	Europe/Athens
1423	Kithira Airport	Kithira	Greece	KIT	LGKC	Europe/Athens
1424	Kefallinia Airport	Keffallinia	Greece	EFL	LGKF	Europe/Athens
1425	Kalamata Airport	Kalamata	Greece	KLX	LGKL	Europe/Athens
1426	Amigdhaleon Airport	Kavala	Greece		LGKM	Europe/Athens
1427	Kos Airport	Kos	Greece	KGS	LGKO	Europe/Athens
1428	Karpathos Airport	Karpathos	Greece	AOK	LGKP	Europe/Athens
1429	Ioannis Kapodistrias International Airport	Kerkyra/corfu	Greece	CFU	LGKR	Europe/Athens
1430	Kasos Airport	Kasos	Greece	KSJ	LGKS	Europe/Athens
1431	Alexander the Great International Airport	Kavala	Greece	KVA	LGKV	Europe/Athens
1432	Filippos Airport	Kozani	Greece	KZI	LGKZ	Europe/Athens
1433	Leros Airport	Leros	Greece	LRS	LGLE	Europe/Athens
1434	Limnos Airport	Limnos	Greece	LXS	LGLM	Europe/Athens
1435	Larisa Airport	Larissa	Greece	LRA	LGLR	Europe/Athens
1436	Megara Airport	Megara	Greece		LGMG	Europe/Athens
1437	Mikonos Airport	Mykonos	Greece	JMK	LGMK	Europe/Athens
1438	Mytilene International Airport	Mytilini	Greece	MJT	LGMT	Europe/Athens
1439	Aktion National Airport	Preveza	Greece	PVK	LGPZ	Europe/Athens
1440	Maritsa Airport	Rhodos	Greece		LGRD	Europe/Athens
1441	Diagoras Airport	Rhodos	Greece	RHO	LGRP	Europe/Athens
1442	Araxos Airport	Patras	Greece	GPA	LGRX	Europe/Athens
1443	Chania International Airport	Chania	Greece	CHQ	LGSA	Europe/Athens
1444	Skiathos Island National Airport	Skiathos	Greece	JSI	LGSK	Europe/Athens
1445	Samos Airport	Samos	Greece	SMI	LGSM	Europe/Athens
1446	Sparti Airport	Sparti	Greece	SPJ	LGSP	Europe/Athens
1447	Santorini Airport	Thira	Greece	JTR	LGSR	Europe/Athens
1448	Sitia Airport	Sitia	Greece	JSH	LGST	Europe/Athens
1449	Stefanovikion Air Base	Stefanovikion	Greece		LGSV	Europe/Athens
1450	Skiros Airport	Skiros	Greece	SKU	LGSY	Europe/Athens
1451	Tanagra Air Base	Tanagra	Greece		LGTG	Europe/Athens
1452	Kasteli Airport	Kasteli	Greece		LGTL	Europe/Athens
1453	Tripolis Airport	Tripolis	Greece		LGTP	Europe/Athens
1454	Thessaloniki Macedonia International Airport	Thessaloniki	Greece	SKG	LGTS	Europe/Athens
1455	Tatoi Airport	Dekelia	Greece		LGTT	Europe/Athens
1456	Zakynthos International Airport ""Dionysios Solomos	Zakynthos	Greece	ZTH	LGZA	Europe/Athens
1457	Budapest Liszt Ferenc International Airport	Budapest	Hungary	BUD	LHBP	Europe/Budapest
1458	Debrecen International Airport	Debrecen	Hungary	DEB	LHDC	Europe/Budapest
1459	Kecskemét Airport	Kecskemet	Hungary		LHKE	Europe/Budapest
1460	Nyíregyháza Airport	Nyirregyhaza	Hungary		LHNY	Europe/Budapest
1461	Őcsény Airport	Ocseny	Hungary		LHOY	Europe/Budapest
1462	Szentkirályszabadja Airport	Azentkilyszabadja	Hungary		LHSA	Europe/Budapest
1463	Szolnok Air Base	Szolnok	Hungary		LHSN	Europe/Budapest
1464	Amendola Air Base	Amendola	Italy		LIBA	Europe/Rome
1465	Crotone Airport	Crotone	Italy	CRV	LIBC	Europe/Rome
1466	Bari Karol Wojtyła Airport	Bari	Italy	BRI	LIBD	Europe/Rome
1467	Foggia ""Gino Lisa"" Airport	Foggia	Italy	FOG	LIBF	Europe/Rome
1468	Taranto-Grottaglie ""Marcello Arlotta"" Airport	Grottaglie	Italy	TAR	LIBG	Europe/Rome
1469	Lecce Galatina Air Base	Lecce	Italy	LCC	LIBN	Europe/Rome
1470	Pescara International Airport	Pescara	Italy	PSR	LIBP	Europe/Rome
1471	Brindisi – Salento Airport	Brindisi	Italy	BDS	LIBR	Europe/Rome
1472	Gioia Del Colle Air Base	Gioia Del Colle	Italy		LIBV	Europe/Rome
1473	Lamezia Terme Airport	Lamezia	Italy	SUF	LICA	Europe/Rome
1474	Catania-Fontanarossa Airport	Catania	Italy	CTA	LICC	Europe/Rome
1475	Lampedusa Airport	Lampedusa	Italy	LMP	LICD	Europe/Rome
1476	Pantelleria Airport	Pantelleria	Italy	PNL	LICG	Europe/Rome
1477	Falcone–Borsellino Airport	Palermo	Italy	PMO	LICJ	Europe/Rome
1478	Palermo-Boccadifalco Airport	Palermo	Italy		LICP	Europe/Rome
1479	Reggio Calabria Airport	Reggio Calabria	Italy	REG	LICR	Europe/Rome
1480	Vincenzo Florio Airport Trapani-Birgi	Trapani	Italy	TPS	LICT	Europe/Rome
1481	Sigonella Navy Air Base	Sigonella	Italy	NSY	LICZ	Europe/Rome
1482	Alghero-Fertilia Airport	Alghero	Italy	AHO	LIEA	Europe/Rome
1483	Decimomannu Air Base	Decimomannu	Italy	DCI	LIED	Europe/Rome
1484	Cagliari Elmas Airport	Cagliari	Italy	CAG	LIEE	Europe/Rome
1485	Olbia Costa Smeralda Airport	Olbia	Italy	OLB	LIEO	Europe/Rome
1486	Tortolì Airport	Tortoli	Italy	TTB	LIET	Europe/Rome
1487	Torino-Aeritalia Airport	Turin	Italy		LIMA	Europe/Rome
1488	Milano-Bresso Airfield	Milano	Italy		LIMB	Europe/Rome
1489	Malpensa International Airport	Milano	Italy	MXP	LIMC	Europe/Rome
1490	Il Caravaggio International Airport	Bergamo	Italy	BGY	LIME	Europe/Rome
1491	Turin Airport	Torino	Italy	TRN	LIMF	Europe/Rome
1492	Villanova D'Albenga International Airport	Albenga	Italy	ALL	LIMG	Europe/Rome
1493	Genoa Cristoforo Colombo Airport	Genoa	Italy	GOA	LIMJ	Europe/Rome
1494	Milano Linate Airport	Milan	Italy	LIN	LIML	Europe/Rome
1495	Cameri Air Base [MIL]	Cameri	Italy		LIMN	Europe/Rome
1496	Parma Airport	Parma	Italy	PMF	LIMP	Europe/Rome
1497	Piacenza San Damiano Air Base	Piacenza	Italy		LIMS	Europe/Rome
1498	Cuneo International Airport	Cuneo	Italy	CUF	LIMZ	Europe/Rome
1499	Aviano Air Base	Aviano	Italy	AVB	LIPA	Europe/Rome
1500	Bolzano Airport	Bolzano	Italy	BZO	LIPB	Europe/Rome
1501	Cervia Air Base	Cervia	Italy		LIPC	Europe/Rome
1502	Bologna Guglielmo Marconi Airport	Bologna	Italy	BLQ	LIPE	Europe/Rome
1503	Treviso-Sant'Angelo Airport	Treviso	Italy	TSF	LIPH	Europe/Rome
1504	Rivolto Air Base	Rivolto	Italy		LIPI	Europe/Rome
1505	Forlì Airport	Forli	Italy	FRL	LIPK	Europe/Rome
1506	Ghedi Air Base	Ghedi	Italy		LIPL	Europe/Rome
1507	Verona-Boscomantico Airport	Verona	Italy		LIPN	Europe/Rome
1508	Brescia Airport	Brescia	Italy	VBS	LIPO	Europe/Rome
1509	Trieste–Friuli Venezia Giulia Airport	Ronchi De Legionari	Italy	TRS	LIPQ	Europe/Rome
1510	Federico Fellini International Airport	Rimini	Italy	RMI	LIPR	Europe/Rome
1511	Istrana Air Base	Treviso	Italy		LIPS	Europe/Rome
1512	Vicenza Airport	Vicenza	Italy	VIC	LIPT	Europe/Rome
1513	Padova Airport	Padova	Italy	QPA	LIPU	Europe/Rome
1514	Verona Villafranca Airport	Villafranca	Italy	VRN	LIPX	Europe/Rome
1515	Venice Marco Polo Airport	Venice	Italy	VCE	LIPZ	Europe/Rome
1516	Siena-Ampugnano Airport	Siena	Italy	SAY	LIQS	Europe/Rome
1517	Ciampino–G. B. Pastine International Airport	Rome	Italy	CIA	LIRA	Europe/Rome
1518	Pratica Di Mare Air Base	Pratica Di Mare	Italy		LIRE	Europe/Rome
1519	Leonardo da Vinci–Fiumicino Airport	Rome	Italy	FCO	LIRF	Europe/Rome
1520	Guidonia Air Base	Guidonia	Italy		LIRG	Europe/Rome
1521	Marina Di Campo Airport	Marina Di Campo	Italy	EBA	LIRJ	Europe/Rome
1522	Latina Air Base	Latina	Italy	QLT	LIRL	Europe/Rome
1523	Grazzanise Air Base	Grazzanise	Italy		LIRM	Europe/Rome
1524	Naples International Airport	Naples	Italy	NAP	LIRN	Europe/Rome
1525	Pisa International Airport	Pisa	Italy	PSA	LIRP	Europe/Rome
1526	Peretola Airport	Florence	Italy	FLR	LIRQ	Europe/Rome
1527	Grosseto Air Base	Grosseto	Italy	GRS	LIRS	Europe/Rome
1528	Urbe Airport	Rome	Italy		LIRU	Europe/Rome
1529	Viterbo Airport	Viterbo	Italy		LIRV	Europe/Rome
1530	Perugia San Francesco d'Assisi – Umbria International Airport	Perugia	Italy	PEG	LIRZ	Europe/Rome
1531	Cerklje Airport	Cerklje	Slovenia		LJCE	Europe/Ljubljana
1532	Ljubljana Jože Pučnik Airport	Ljubljana	Slovenia	LJU	LJLJ	Europe/Ljubljana
1533	Maribor Airport	Maribor	Slovenia	MBX	LJMB	Europe/Ljubljana
1534	Portoroz Airport	Portoroz	Slovenia	POW	LJPZ	Europe/Ljubljana
1535	Slovenj Gradec Airport	Slovenj Gradec	Slovenia		LJSG	Europe/Ljubljana
1536	České Budějovice Airport	Ceske Budejovice	Czech Republic		LKCS	Europe/Prague
1537	Čáslav Air Base	Caslav	Czech Republic		LKCV	Europe/Prague
1538	Hradec Králové Airport	Hradec Kralove	Czech Republic		LKHK	Europe/Prague
1539	Hořovice Airport	Horovice	Czech Republic		LKHV	Europe/Prague
1540	Kbely Air Base	Praha	Czech Republic		LKKB	Europe/Prague
1541	Kunovice Airport	Kunovice	Czech Republic	UHE	LKKU	Europe/Prague
1542	Karlovy Vary International Airport	Karlovy Vary	Czech Republic	KLV	LKKV	Europe/Prague
1543	Plzeň-Líně Airport	Line	Czech Republic		LKLN	Europe/Prague
1544	Mnichovo Hradiště Airport	Mnichovo Hradiste	Czech Republic		LKMH	Europe/Prague
1545	Ostrava Leos Janáček Airport	Ostrava	Czech Republic	OSR	LKMT	Europe/Prague
1546	Náměšť Air Base	Namest	Czech Republic		LKNA	Europe/Prague
1547	Pardubice Airport	Pardubice	Czech Republic	PED	LKPD	Europe/Prague
1548	Pribram Airport	Pribram	Czech Republic		LKPM	Europe/Prague
1549	Přerov Air Base	Prerov	Czech Republic	PRV	LKPO	Europe/Prague
1550	Václav Havel Airport Prague	Prague	Czech Republic	PRG	LKPR	Europe/Prague
1551	Brno-Tuřany Airport	Brno	Czech Republic	BRQ	LKTB	Europe/Prague
1552	Vodochody Airport	Vodochody	Czech Republic	VOD	LKVO	Europe/Prague
1553	Ben Gurion International Airport	Tel-aviv	Israel	TLV	LLBG	Asia/Jerusalem
1554	Beersheba (Teyman) Airport	Beer-sheba	Israel	BEV	LLBS	Asia/Jerusalem
1555	Tel Nof Air Base	Tel-nof	Israel		LLEK	Asia/Jerusalem
1556	Ein Shemer Airfield	Eyn-shemer	Israel		LLES	Asia/Jerusalem
1557	Eilat Airport	Elat	Israel	ETH	LLET	Asia/Jerusalem
1558	Ein Yahav Airfield	Eyn-yahav	Israel	EIY	LLEY	Asia/Jerusalem
1559	Haifa International Airport	Haifa	Israel	HFA	LLHA	Asia/Jerusalem
1560	Hatzor Air Base	Haztor	Israel		LLHS	Asia/Jerusalem
1561	Ben Ya'akov Airport	Rosh Pina	Israel	RPN	LLIB	Asia/Jerusalem
1562	Megiddo Airport	Megido Airstrip	Israel		LLMG	Asia/Jerusalem
1563	Bar Yehuda Airfield	Metzada	Israel	MTZ	LLMZ	Asia/Jerusalem
1564	Nevatim Air Base	Nevatim	Israel	VTM	LLNV	Asia/Jerusalem
1565	Ovda International Airport	Ovda	Israel	VDA	LLOV	Asia/Jerusalem
1566	Ramat David Air Base	Ramat David	Israel		LLRD	Asia/Jerusalem
1567	Ramon Air Base	Ramon	Israel	MIP	LLRM	Asia/Jerusalem
1568	Sde Dov Airport	Tel-aviv	Israel	SDV	LLSD	Asia/Jerusalem
1569	Malta International Airport	Malta	Malta	MLA	LMML	Europe/Malta
1570	Wiener Neustadt East Airport	Wiener Neustadt Ost	Austria		LOAN	Europe/Vienna
1571	Wels Airport	Wels	Austria		LOLW	Europe/Vienna
1572	Graz Airport	Graz	Austria	GRZ	LOWG	Europe/Vienna
1573	Innsbruck Airport	Innsbruck	Austria	INN	LOWI	Europe/Vienna
1574	Linz Hörsching Airport	Linz	Austria	LNZ	LOWL	Europe/Vienna
1575	Salzburg Airport	Salzburg	Austria	SZG	LOWS	Europe/Vienna
1576	Vienna International Airport	Vienna	Austria	VIE	LOWW	Europe/Vienna
1577	Klagenfurt	Klagenfurt	Austria		LOXK	Europe/Vienna
1578	Hinterstoisser Air Base	Zeltweg	Austria		LOXZ	Europe/Vienna
1579	Alverca Air Base	Alverca	Portugal	AVR	LPAR	Europe/Lisbon
1580	Santa Maria Airport	Santa Maria (island)	Portugal	SMA	LPAZ	Atlantic/Azores
1581	Bragança Airport	Braganca	Portugal	BGC	LPBG	Europe/Lisbon
1582	Beja Airport / Airbase	Beja (madeira)	Portugal	BYJ	LPBJ	Europe/Lisbon
1583	Braga Municipal Aerodrome	Braga	Portugal	BGZ	LPBR	Europe/Lisbon
1584	Aerodromo Municipal de Coimbra	Coimba	Portugal		LPCO	Europe/Lisbon
1585	Cascais Airport	Cascais	Portugal	CAT	LPCS	Europe/Lisbon
1586	Coimbra Hospital Covões Heliport	Covilha	Portugal		LPCV	Europe/Lisbon
1587	Évora Airport	Evora	Portugal		LPEV	Europe/Lisbon
1588	Flores Airport	Flores	Portugal	FLW	LPFL	Atlantic/Azores
1589	Faro Airport	Faro	Portugal	FAO	LPFR	Europe/Lisbon
1590	Graciosa Airport	Graciosa Island	Portugal	GRW	LPGR	Atlantic/Azores
1591	Horta Airport	Horta	Portugal	HOR	LPHR	Atlantic/Azores
1592	Lajes Airport	Lajes (terceira Island)	Portugal	TER	LPLA	Atlantic/Azores
1593	Monte Real Air Base	Monte Real	Portugal	QLR	LPMR	Europe/Lisbon
1594	Montijo Air Base	Montijo	Portugal		LPMT	Europe/Lisbon
1595	Ovar Air Base	Ovar	Portugal		LPOV	Europe/Lisbon
1596	João Paulo II Airport	Ponta Delgada	Portugal	PDL	LPPD	Atlantic/Azores
1597	Pico Airport	Pico	Portugal	PIX	LPPI	Atlantic/Azores
1598	Portimão Airport	Portimao	Portugal	PRM	LPPM	Europe/Lisbon
1599	Francisco de Sá Carneiro Airport	Porto	Portugal	OPO	LPPR	Europe/Lisbon
1600	Porto Santo Airport	Porto Santo	Portugal	PXO	LPPS	Europe/Lisbon
1601	Humberto Delgado Airport (Lisbon Portela Airport)	Lisbon	Portugal	LIS	LPPT	Europe/Lisbon
1602	São Jorge Airport	Sao Jorge Island	Portugal	SJZ	LPSJ	Atlantic/Azores
1603	Sintra Air Base	Sintra	Portugal		LPST	Europe/Lisbon
1604	Tancos Airbase	Tancos	Portugal		LPTN	Europe/Lisbon
1605	Vila Real Airport	Vila Real	Portugal	VRL	LPVR	Europe/Lisbon
1606	Aerodromo Goncalves Lobato (Viseu Airport)	Viseu	Portugal	VSE	LPVZ	Europe/Lisbon
1607	Mostar International Airport	Mostar	Bosnia and Herzegovina	OMO	LQMO	Europe/Sarajevo
1608	Sarajevo International Airport	Sarajevo	Bosnia and Herzegovina	SJJ	LQSA	Europe/Sarajevo
1609	Arad International Airport	Arad	Romania	ARW	LRAR	Europe/Bucharest
1610	Bacău Airport	Bacau	Romania	BCM	LRBC	Europe/Bucharest
1611	Tautii Magheraus Airport	Baia Mare	Romania	BAY	LRBM	Europe/Bucharest
1612	Băneasa International Airport	Bucharest	Romania	BBU	LRBS	Europe/Bucharest
1613	Mihail Kogălniceanu International Airport	Constanta	Romania	CND	LRCK	Europe/Bucharest
1614	Cluj-Napoca International Airport	Cluj-napoca	Romania	CLJ	LRCL	Europe/Bucharest
1615	Caransebeş Airport	Caransebes	Romania	CSB	LRCS	Europe/Bucharest
1616	Craiova Airport	Craiova	Romania	CRA	LRCV	Europe/Bucharest
1617	Iaşi Airport	Iasi	Romania	IAS	LRIA	Europe/Bucharest
1618	Oradea International Airport	Oradea	Romania	OMR	LROD	Europe/Bucharest
1619	Henri Coandă International Airport	Bucharest	Romania	OTP	LROP	Europe/Bucharest
1620	Sibiu International Airport	Sibiu	Romania	SBZ	LRSB	Europe/Bucharest
1621	Satu Mare Airport	Satu Mare	Romania	SUJ	LRSM	Europe/Bucharest
1622	Suceava Stefan cel Mare Airport	Suceava	Romania	SCV	LRSV	Europe/Bucharest
1623	Tulcea Airport	Tulcea	Romania	TCE	LRTC	Europe/Bucharest
1624	Transilvania Târgu Mureş International Airport	Tirgu Mures	Romania	TGM	LRTM	Europe/Bucharest
1625	Timişoara Traian Vuia Airport	Timisoara	Romania	TSR	LRTR	Europe/Bucharest
1626	Les Eplatures Airport	Les Eplatures	Switzerland		LSGC	Europe/Zurich
1627	Geneva Cointrin International Airport	Geneva	Switzerland	GVA	LSGG	Europe/Paris
1628	Saanen Airport	Saanen	Switzerland		LSGK	Europe/Zurich
1629	Sion Airport	Sion	Switzerland	SIR	LSGS	Europe/Zurich
1630	Alpnach Air Base	Alpnach	Switzerland		LSMA	Europe/Zurich
1631	Dübendorf Air Base	Dubendorf	Switzerland		LSMD	Europe/Zurich
1632	Emmen Air Base	Emmen	Switzerland	EML	LSME	Europe/Zurich
1633	Mollis Airport	Mollis	Switzerland		LSMF	Europe/Zurich
1634	Meiringen Airport	Meiringen	Switzerland		LSMM	Europe/Zurich
1635	Payerne Air Base	Payerne	Switzerland		LSMP	Europe/Zurich
1636	Buochs	Buochs	Switzerland		LSMU	Europe/Zurich
1637	Lugano Airport	Lugano	Switzerland	LUG	LSZA	Europe/Zurich
1638	Bern Belp Airport	Bern	Switzerland	BRN	LSZB	Europe/Zurich
1639	Grenchen Airport	Grenchen	Switzerland	ZHI	LSZG	Europe/Zurich
1640	Zürich Airport	Zurich	Switzerland	ZRH	LSZH	Europe/Zurich
2112	Masirah Air Base	Masirah	Oman	MSH	OOMA	Asia/Muscat
1641	St Gallen Altenrhein Airport	Altenrhein	Switzerland	ACH	LSZR	Europe/Zurich
1642	Samedan Airport	Samedan	Switzerland	SMV	LSZS	Europe/Zurich
1643	Güvercinlik Airport	Ankara	Turkey		LTAB	Europe/Istanbul
1644	Esenboğa International Airport	Ankara	Turkey	ESB	LTAC	Europe/Istanbul
1645	Etimesgut Air Base	Ankara	Turkey	ANK	LTAD	Europe/Istanbul
1646	Akıncı Air Base	Ankara	Turkey		LTAE	Europe/Istanbul
1647	Adana Airport	Adana	Turkey	ADA	LTAF	Europe/Istanbul
1648	İncirlik Air Base	Adana	Turkey	UAB	LTAG	Europe/Istanbul
1649	Afyon Airport	Afyon	Turkey	AFY	LTAH	Europe/Istanbul
1650	Antalya International Airport	Antalya	Turkey	AYT	LTAI	Europe/Istanbul
1651	Gaziantep International Airport	Gaziantep	Turkey	GZT	LTAJ	Europe/Istanbul
1652	İskenderun Airport	Iskenderun	Turkey		LTAK	Europe/Istanbul
1653	Konya Airport	Konya	Turkey	KYA	LTAN	Europe/Istanbul
1654	Malatya Tulga Airport	Malatya	Turkey		LTAO	Europe/Istanbul
1655	Amasya Merzifon Airport	Merzifon	Turkey	MZH	LTAP	Europe/Istanbul
1656	Sivas Nuri Demirağ Airport	Sivas	Turkey	VAS	LTAR	Europe/Istanbul
1657	Malatya Erhaç Airport	Malatya	Turkey	MLX	LTAT	Europe/Istanbul
1658	Kayseri Erkilet Airport	Kayseri	Turkey	ASR	LTAU	Europe/Istanbul
1659	Sivrihisar Airport	Sivrihisar	Turkey		LTAV	Europe/Istanbul
1660	Tokat Airport	Tokat	Turkey	TJK	LTAW	Europe/Istanbul
1661	Çardak Airport	Denizli	Turkey	DNZ	LTAY	Europe/Istanbul
1662	Atatürk International Airport	Istanbul	Turkey	ISL	LTBA	Europe/Istanbul
1663	Balıkesir Merkez Airport	Balikesir	Turkey	BZI	LTBF	Europe/Istanbul
1664	Bandırma Airport	Bandirma	Turkey	BDM	LTBG	Europe/Istanbul
1665	Eskişehir Air Base	Eskisehir	Turkey	ESK	LTBI	Europe/Istanbul
1666	Adnan Menderes International Airport	Izmir	Turkey	ADB	LTBJ	Europe/Istanbul
1667	Gaziemir Airport	Izmir	Turkey		LTBK	Europe/Istanbul
1668	Çiğli Airport	Izmir	Turkey	IGL	LTBL	Europe/Istanbul
1669	Isparta Airport	Isparta	Turkey		LTBM	Europe/Istanbul
1670	Kütahya Airport	Kutahya	Turkey		LTBN	Europe/Istanbul
1671	Yalova Airport	Yalova	Turkey		LTBP	Europe/Istanbul
1672	Cengiz Topel Airport	Topel	Turkey	KCO	LTBQ	Europe/Istanbul
1673	Dalaman International Airport	Dalaman	Turkey	DLM	LTBS	Europe/Istanbul
1674	Akhisar Airport	Akhisar	Turkey		LTBT	Europe/Istanbul
1675	Imsık Airport	Bodrum	Turkey	BXN	LTBV	Europe/Istanbul
1676	Samandıra Air Base	Istanbul	Turkey		LTBX	Europe/Istanbul
1677	Elazığ Airport	Elazig	Turkey	EZS	LTCA	Europe/Istanbul
1678	Diyarbakir Airport	Diyabakir	Turkey	DIY	LTCC	Europe/Istanbul
1679	Erzincan Airport	Erzincan	Turkey	ERC	LTCD	Europe/Istanbul
1680	Erzurum International Airport	Erzurum	Turkey	ERZ	LTCE	Europe/Istanbul
1681	Trabzon International Airport	Trabzon	Turkey	TZX	LTCG	Europe/Istanbul
1682	Van Ferit Melen Airport	Van	Turkey	VAN	LTCI	Europe/Istanbul
1683	Batman Airport	Batman	Turkey	BAL	LTCJ	Europe/Istanbul
1684	Siirt Airport	Siirt	Turkey	SXZ	LTCL	Europe/Istanbul
1685	Kaklıç Airport	Izmir	Turkey		LTFA	Europe/Istanbul
1686	Selçuk Efes Airport	Izmir	Turkey		LTFB	Europe/Istanbul
1687	Bălți International Airport	Saltsy	Moldova	BZY	LUBL	Europe/Chisinau
1688	Chişinău International Airport	Chisinau	Moldova	KIV	LUKK	Europe/Chisinau
1689	Ohrid St. Paul the Apostle Airport	Ohrid	Macedonia	OHD	LWOH	Europe/Skopje
1690	Skopje Alexander the Great Airport	Skopje	Macedonia	SKP	LWSK	Europe/Skopje
1691	Gibraltar Airport	Gibraltar	Gibraltar	GIB	LXGB	Europe/Gibraltar
1692	Belgrade Nikola Tesla Airport	Belgrade	Serbia	BEG	LYBE	Europe/Belgrade
1693	Nis Airport	Nis	Serbia	INI	LYNI	Europe/Belgrade
1694	Podgorica Airport	Podgorica	Montenegro	TGD	LYPG	Europe/Podgorica
1695	Priština International Airport	Pristina	Serbia	PRN	BKPR	Europe/Belgrade
1696	Tivat Airport	Tivat	Montenegro	TIV	LYTV	Europe/Podgorica
1697	Vršac International Airport	Vrsac	Serbia		LYVR	Europe/Belgrade
1698	M. R. Štefánik Airport	Bratislava	Slovakia	BTS	LZIB	Europe/Bratislava
1699	Košice Airport	Kosice	Slovakia	KSC	LZKZ	Europe/Bratislava
1700	Kuchyňa Air Base	Malacky	Slovakia		LZMC	Europe/Bratislava
1701	Piešťany Airport	Piestany	Slovakia	PZY	LZPP	Europe/Bratislava
1702	Sliač Airport	Sliac	Slovakia	SLD	LZSL	Europe/Bratislava
1703	Trenčín Airport	Trencin	Slovakia		LZTN	Europe/Bratislava
1704	Poprad-Tatry Airport	Poprad	Slovakia	TAT	LZTT	Europe/Bratislava
1705	North Caicos Airport	North Caicos	Turks and Caicos Islands	NCA	MBNC	America/Grand_Turk
1706	Providenciales Airport	Providenciales	Turks and Caicos Islands	PLS	MBPV	America/Grand_Turk
1707	South Caicos Airport	South Caicos	Turks and Caicos Islands	XSC	MBSC	America/Grand_Turk
1708	Arroyo Barril Airport	Samana	Dominican Republic		MDAB	America/Santo_Domingo
1709	Maria Montez International Airport	Barahona	Dominican Republic	BRX	MDBH	America/Santo_Domingo
1710	Cabo Rojo Airport	Cabo Rojo	Dominican Republic	CBJ	MDCR	America/Santo_Domingo
1711	Casa De Campo International Airport	La Romana	Dominican Republic	LRM	MDLR	America/Santo_Domingo
1712	Punta Cana International Airport	Punta Cana	Dominican Republic	PUJ	MDPC	America/Santo_Domingo
1713	Gregorio Luperon International Airport	Puerto Plata	Dominican Republic	POP	MDPP	America/Santo_Domingo
1714	Las Américas International Airport	Santo Domingo	Dominican Republic	SDQ	MDSD	America/Santo_Domingo
1715	San Isidro Air Base	San Isidoro	Dominican Republic		MDSI	America/Santo_Domingo
1716	Cibao International Airport	Santiago	Dominican Republic	STI	MDST	America/Santo_Domingo
1717	Bananera Airport	Bananera	Guatemala		MGBN	America/Guatemala
1718	Coban Airport	Coban	Guatemala	CBV	MGCB	America/Guatemala
1719	La Aurora Airport	Guatemala City	Guatemala	GUA	MGGT	America/Guatemala
1720	Retalhuleu Airport	Retalhuleu	Guatemala	RER	MGRT	America/Guatemala
1721	San José Airport	San Jose	Guatemala	GSJ	MGSJ	America/Guatemala
1722	Goloson International Airport	La Ceiba	Honduras	LCE	MHLC	America/Tegucigalpa
1723	Ramón Villeda Morales International Airport	San Pedro Sula	Honduras	SAP	MHLM	America/Tegucigalpa
1724	La Laguna Airport	Guanaja	Honduras	GJA	MHNJ	America/Tegucigalpa
1725	Juan Manuel Galvez International Airport	Roatan	Honduras	RTB	MHRO	America/Tegucigalpa
1726	Tela Airport	Tela	Honduras	TEA	MHTE	America/Tegucigalpa
1727	Toncontín International Airport	Tegucigalpa	Honduras	TGU	MHTG	America/Tegucigalpa
1728	Trujillo Airport	Trujillo	Honduras	TJI	MHTJ	America/Tegucigalpa
1729	Boscobel Aerodrome	Ocho Rios	Jamaica	OCJ	MKBS	America/Jamaica
1730	Norman Manley International Airport	Kingston	Jamaica	KIN	MKJP	America/Jamaica
1731	Sangster International Airport	Montego Bay	Jamaica	MBJ	MKJS	America/Jamaica
1732	Ken Jones Airport	Port Antonio	Jamaica	POT	MKKJ	America/Jamaica
1733	Tinson Pen Airport	Kingston	Jamaica	KTP	MKTP	America/Jamaica
1734	General Juan N Alvarez International Airport	Acapulco	Mexico	ACA	MMAA	America/Mexico_City
1735	Del Norte International Airport	Monterrey	Mexico	NTR	MMAN	America/Mexico_City
1736	Jesús Terán Paredo International Airport	Aguascalientes	Mexico	AGU	MMAS	America/Mexico_City
1737	Bahías de Huatulco International Airport	Huatulco	Mexico	HUX	MMBT	America/Mexico_City
1738	General Mariano Matamoros Airport	Cuernavaca	Mexico	CVJ	MMCB	America/Mexico_City
1739	Ciudad Acuña New International Airport	Ciudad Acuna	Mexico	ACN	MMCC	America/Mexico_City
1740	Ciudad del Carmen International Airport	Ciudad Del Carmen	Mexico	CME	MMCE	America/Mexico_City
1741	Nuevo Casas Grandes Airport	Nuevo Casas Grandes	Mexico	NCG	MMCG	America/Mazatlan
1742	Chilpancingo Airport	Chilpancingo	Mexico		MMCH	America/Mexico_City
1743	Bachigualato Federal International Airport	Culiacan	Mexico	CUL	MMCL	America/Mazatlan
1744	Chetumal International Airport	Chetumal	Mexico	CTM	MMCM	America/Cancun
1745	Ciudad Obregón International Airport	Ciudad Obregon	Mexico	CEN	MMCN	America/Hermosillo
1746	Ingeniero Alberto Acuña Ongay International Airport	Campeche	Mexico	CPE	MMCP	America/Mexico_City
1747	Abraham González International Airport	Ciudad Juarez	Mexico	CJS	MMCS	America/Mazatlan
1748	General Roberto Fierro Villalobos International Airport	Chihuahua	Mexico	CUU	MMCU	America/Mazatlan
1749	General Pedro Jose Mendez International Airport	Ciudad Victoria	Mexico	CVM	MMCV	America/Mexico_City
1750	Cozumel International Airport	Cozumel	Mexico	CZM	MMCZ	America/Cancun
1751	General Guadalupe Victoria International Airport	Durango	Mexico	DGO	MMDO	America/Mexico_City
1752	Amado Nervo National Airport	Tepic	Mexico	TPQ	MMEP	America/Mazatlan
1753	Ensenada International Airport	Ensenada	Mexico	ESE	MMES	America/Tijuana
1754	Don Miguel Hidalgo Y Costilla International Airport	Guadalajara	Mexico	GDL	MMGL	America/Mexico_City
1755	General José María Yáñez International Airport	Guaymas	Mexico	GYM	MMGM	America/Hermosillo
1756	Tehuacan Airport	Tehuacan	Mexico	TCN	MMHC	America/Mexico_City
1757	General Ignacio P. Garcia International Airport	Hermosillo	Mexico	HMO	MMHO	America/Hermosillo
1758	Licenciado Miguel de la Madrid Airport	Colima	Mexico	CLQ	MMIA	America/Mexico_City
1759	Isla Mujeres Airport	Isla Mujeres	Mexico	ISJ	MMIM	America/Cancun
1760	Plan De Guadalupe International Airport	Saltillo	Mexico	SLW	MMIO	America/Mexico_City
1761	Ixtepec Airport	Iztepec	Mexico	IZT	MMIT	America/Mexico_City
1762	Lázaro Cárdenas Airport	Lazard Cardenas	Mexico	LZC	MMLC	America/Mexico_City
1763	Valle del Fuerte International Airport	Los Mochis	Mexico	LMM	MMLM	America/Mazatlan
1764	Del Bajío International Airport	Del Bajio	Mexico	BJX	MMLO	America/Mexico_City
1765	Manuel Márquez de León International Airport	La Paz	Mexico	LAP	MMLP	America/Mazatlan
1766	Loreto International Airport	Loreto	Mexico	LTO	MMLT	America/Mazatlan
1767	General Servando Canales International Airport	Matamoros	Mexico	MAM	MMMA	America/Mexico_City
1768	Licenciado Manuel Crescencio Rejon Int Airport	Merida	Mexico	MID	MMMD	America/Mexico_City
1769	General Rodolfo Sánchez Taboada International Airport	Mexicali	Mexico	MXL	MMML	America/Tijuana
1770	General Francisco J. Mujica International Airport	Morelia	Mexico	MLM	MMMM	America/Mexico_City
1771	Minatitlán/Coatzacoalcos National Airport	Minatitlan	Mexico	MTT	MMMT	America/Mexico_City
1772	Monclova International Airport	Monclova	Mexico	LOV	MMMV	America/Mexico_City
1773	Licenciado Benito Juarez International Airport	Mexico City	Mexico	MEX	MMMX	America/Mexico_City
1774	General Mariano Escobedo International Airport	Monterrey	Mexico	MTY	MMMY	America/Mexico_City
1775	General Rafael Buelna International Airport	Mazatlan	Mexico	MZT	MMMZ	America/Mazatlan
1776	Nogales International Airport	Nogales	Mexico	NOG	MMNG	America/Hermosillo
1777	Quetzalcóatl International Airport	Nuevo Laredo	Mexico	NLD	MMNL	America/Mexico_City
1778	Xoxocotlán International Airport	Oaxaca	Mexico	OAX	MMOX	America/Mexico_City
1779	El Tajín National Airport	Poza Rico	Mexico	PAZ	MMPA	America/Mexico_City
1780	Hermanos Serdán International Airport	Puebla	Mexico	PBC	MMPB	America/Mexico_City
1781	Ingeniero Juan Guillermo Villasana Airport	Pachuca	Mexico		MMPC	America/Mexico_City
1782	Mar de Cortés International Airport	Punta Penasco	Mexico	PPE	MMPE	America/Hermosillo
1783	Piedras Negras International Airport	Piedras Negras	Mexico	PDS	MMPG	America/Mexico_City
1784	Licenciado y General Ignacio Lopez Rayon Airport	Uruapan	Mexico	UPN	MMPN	America/Mexico_City
1785	Licenciado Gustavo Díaz Ordaz International Airport	Puerto Vallarta	Mexico	PVR	MMPR	America/Mexico_City
1786	Puerto Escondido International Airport	Puerto Escondido	Mexico	PXM	MMPS	America/Mexico_City
1787	Querétaro Intercontinental Airport	Queretaro	Mexico	QRO	MMQT	America/Mexico_City
1788	General Lucio Blanco International Airport	Reynosa	Mexico	REX	MMRX	America/Mexico_City
1789	Los Cabos International Airport	San Jose Del Cabo	Mexico	SJD	MMSD	America/Mazatlan
1790	San Felipe International Airport	San Filipe	Mexico	SFH	MMSF	America/Tijuana
1791	Ponciano Arriaga International Airport	San Luis Potosi	Mexico	SLP	MMSP	America/Mexico_City
1792	Tlaxcala Airport	Tlaxcala	Mexico		MMTA	America/Mexico_City
1793	Terán Air Base	Tuxtla Gutierrez	Mexico		MMTB	America/Mexico_City
1794	Francisco Sarabia International Airport	Torreon	Mexico	TRC	MMTC	America/Mexico_City
1795	Angel Albino Corzo International Airport	Tuxtla Gutierrez	Mexico	TGZ	MMTG	America/Mexico_City
1796	General Abelardo L. Rodríguez International Airport	Tijuana	Mexico	TIJ	MMTJ	America/Tijuana
1797	General Francisco Javier Mina International Airport	Tampico	Mexico	TAM	MMTM	America/Mexico_City
1798	Tamuin Airport	Tamuin	Mexico	TSL	MMTN	America/Mexico_City
1799	Licenciado Adolfo Lopez Mateos International Airport	Toluca	Mexico	TLC	MMTO	America/Mexico_City
1800	Tapachula International Airport	Tapachula	Mexico	TAP	MMTP	America/Mexico_City
1801	Cancún International Airport	Cancun	Mexico	CUN	MMUN	America/Cancun
1802	Carlos Rovirosa Pérez International Airport	Villahermosa	Mexico	VSA	MMVA	America/Mexico_City
1803	General Heriberto Jara International Airport	Vera Cruz	Mexico	VER	MMVR	America/Mexico_City
1804	General Leobardo C. Ruiz International Airport	Zacatecas	Mexico	ZCL	MMZC	America/Mexico_City
1805	Ixtapa Zihuatanejo International Airport	Zihuatanejo	Mexico	ZIH	MMZH	America/Mexico_City
1806	Zamora Airport	Zamora	Mexico	ZMM	MMZM	America/Mexico_City
1807	Playa De Oro International Airport	Manzanillo	Mexico	ZLO	MMZO	America/Mexico_City
1808	Zapopan Airport	Zapopan	Mexico		MMZP	America/Mexico_City
1809	Bluefields Airport	Bluefields	Nicaragua	BEF	MNBL	America/Managua
1810	Los Brasiles Airport	Los Brasiles	Nicaragua		MNBR	America/Managua
1811	Leon (Fanor Urroz) Airport	Leon	Nicaragua		MNLN	America/Managua
1812	Augusto C. Sandino (Managua) International Airport	Managua	Nicaragua	MGA	MNMG	America/Managua
1813	Puerto Cabezas Airport	Puerto Cabezas	Nicaragua	PUZ	MNPC	America/Managua
1814	Bocas Del Toro International Airport	Bocas Del Toro	Panama	BOC	MPBO	America/Panama
1815	Cap Manuel Niño International Airport	Changuinola	Panama	CHX	MPCH	America/Panama
1816	Enrique Malek International Airport	David	Panama	DAV	MPDA	America/Panama
1817	Panama Pacific International Airport	Howard	Panama	BLB	MPHO	America/Panama
1818	Marcos A. Gelabert International Airport	Panama	Panama	PAC	MPMG	America/Panama
1819	Ruben Cantu Airport	Santiago	Panama	SYP	MPSA	America/Panama
1820	Tocumen International Airport	Panama City	Panama	PTY	MPTO	America/Panama
1821	Buenos Aires Airport	Buenos Aires	Costa Rica	BAI	MRBA	America/Costa_Rica
1822	Coto 47 Airport	Coto 47	Costa Rica	OTR	MRCC	America/Costa_Rica
1823	Chacarita Airport	Chacarita	Costa Rica	JAP	MRCH	America/Costa_Rica
1824	El Carmen de Siquirres Airport	El Carmen	Costa Rica		MREC	America/Costa_Rica
1825	Finca 10 / Nuevo Palmar Sur Airport	Finca 10	Costa Rica		MRFI	America/Costa_Rica
1826	Golfito Airport	Golfito	Costa Rica	GLF	MRGF	America/Costa_Rica
1827	Guapiles Airport	Guapiles	Costa Rica	GPL	MRGP	America/Costa_Rica
1828	Daniel Oduber Quiros International Airport	Liberia	Costa Rica	LIR	MRLB	America/Costa_Rica
1829	Los Chiles Airport	Los Chiles	Costa Rica	LSL	MRLC	America/Costa_Rica
1830	Limon International Airport	Limon	Costa Rica	LIO	MRLM	America/Costa_Rica
1831	Nosara Airport	Nosara Beach	Costa Rica	NOB	MRNS	America/Costa_Rica
1832	Juan Santamaria International Airport	San Jose	Costa Rica	SJO	MROC	America/Costa_Rica
1833	Pandora Airport	Pandora	Costa Rica		MRPD	America/Costa_Rica
1834	Palmar Sur Airport	Palmar Sur	Costa Rica	PMZ	MRPM	America/Costa_Rica
1835	Quepos Managua Airport	Quepos	Costa Rica	XQP	MRQP	America/Costa_Rica
1836	Santa Clara De Guapiles Airport	Santa Clara	Costa Rica		MRSG	America/Costa_Rica
1837	San Vito De Java Airport	San Vito De Jaba	Costa Rica	TOO	MRSV	America/Costa_Rica
1838	Monseñor Óscar Arnulfo Romero International Airport	San Salvador	El Salvador	SAL	MSLP	America/El_Salvador
1839	Ilopango International Airport	San Salvador	El Salvador		MSSS	America/El_Salvador
1840	Les Cayes Airport	Cayes	Haiti	CYA	MTCA	America/Port-au-Prince
1841	Cap Haitien International Airport	Cap Haitien	Haiti	CAP	MTCH	America/Port-au-Prince
1842	Jacmel Airport	Jacmel	Haiti	JAK	MTJA	America/Port-au-Prince
1843	Toussaint Louverture International Airport	Port-au-prince	Haiti	PAP	MTPP	America/Port-au-Prince
1844	Gustavo Rizo Airport	Baracoa Playa	Cuba	BCA	MUBA	America/Havana
1845	Carlos Manuel de Cespedes Airport	Bayamo	Cuba	BYM	MUBY	America/Havana
1846	Maximo Gomez Airport	Ciego De Avila	Cuba	AVI	MUCA	America/Havana
1847	Jardines Del Rey Airport	Cunagua	Cuba	CCC	MUCC	America/Havana
1848	Jaime Gonzalez Airport	Cienfuegos	Cuba	CFG	MUCF	America/Havana
1849	Vilo Acuña International Airport	Cayo Largo del Sur	Cuba	CYO	MUCL	America/Havana
1850	Ignacio Agramonte International Airport	Camaguey	Cuba	CMW	MUCM	America/Havana
1851	Antonio Maceo International Airport	Santiago De Cuba	Cuba	SCU	MUCU	America/Havana
1852	Florida Airport	Florida	Cuba		MUFL	America/Havana
1853	Leeward Point Field	Guantanamo	Cuba	NBW	MUGM	
1854	Mariana Grajales Airport	Guantanamo	Cuba	GAO	MUGT	America/Havana
1855	José Martí International Airport	Havana	Cuba	HAV	MUHA	America/Havana
1856	Frank Pais International Airport	Holguin	Cuba	HOG	MUHG	America/Havana
1857	La Coloma Airport	La Coloma	Cuba	LCL	MULM	America/Havana
1858	Orestes Acosta Airport	Moa	Cuba	MOA	MUMO	America/Havana
1859	Sierra Maestra Airport	Manzanillo	Cuba	MZO	MUMZ	America/Havana
1860	Rafael Cabrera Airport	Nueva Gerona	Cuba	GER	MUNG	America/Havana
1861	Playa Baracoa Airport	Baracoa Playa	Cuba	UPB	MUPB	America/Havana
1862	Pinar Del Rio Airport	Pinar Del Rio Norte	Cuba	QPD	MUPR	America/Havana
1863	San Antonio De Los Banos Airport	San Antonio De Banos	Cuba		MUSA	America/Havana
1864	Abel Santamaria Airport	Santa Clara	Cuba	SNU	MUSC	America/Havana
1865	Joaquín de Agüero Airport	Santa Lucia	Cuba		MUSL	America/Havana
1866	Siguanea Airport	Siguanea	Cuba	SZJ	MUSN	America/Havana
1867	Sancti Spiritus Airport	Sancti Spiritus	Cuba	USS	MUSS	America/Havana
1868	Juan Gualberto Gomez International Airport	Varadero	Cuba	VRA	MUVR	America/Havana
1869	Hermanos Ameijeiras Airport	Las Tunas	Cuba	VTU	MUVT	America/Havana
1870	Gerrard Smith International Airport	Cayman Brac	Cayman Islands	CYB	MWCB	America/Cayman
1871	Owen Roberts International Airport	Georgetown	Cayman Islands	GCM	MWCR	America/Cayman
1872	Clarence A. Bain Airport	Clarence Bain	Bahamas	MAY	MYAB	America/Nassau
1873	Andros Town Airport	Andros Town	Bahamas	ASD	MYAF	America/Nassau
1874	Leonard M Thompson International Airport	Marsh Harbor	Bahamas	MHH	MYAM	America/Nassau
1875	San Andros Airport	San Andros	Bahamas	SAQ	MYAN	America/Nassau
1876	Spring Point Airport	Spring Point	Bahamas	AXP	MYAP	America/Nassau
1877	Sandy Point Airport	Sandy Point	Bahamas		MYAS	America/Nassau
1878	Treasure Cay Airport	Treasure Cay	Bahamas	TCB	MYAT	America/Nassau
1879	Chub Cay Airport	Chub Cay	Bahamas	CCZ	MYBC	America/Nassau
1880	Great Harbour Cay Airport	Bullocks Harbour	Bahamas	GHC	MYBG	America/Nassau
1881	South Bimini Airport	Alice Town	Bahamas	BIM	MYBS	America/Nassau
1882	Exuma International Airport	Great Exuma	Bahamas	GGT	MYEF	America/Nassau
1883	George Town Airport	George Town	Bahamas		MYEG	America/Nassau
1884	North Eleuthera Airport	North Eleuthera	Bahamas	ELH	MYEH	America/Nassau
1885	Governor's Harbour Airport	Governor's Harbor	Bahamas	GHB	MYEM	America/Nassau
1886	Normans Cay Airport	Norman's Cay	Bahamas	NMC	MYEN	America/Nassau
1887	Rock Sound Airport	Rock Sound	Bahamas	RSD	MYER	America/Nassau
1888	Staniel Cay Airport	Staniel Cay	Bahamas	TYM	MYES	America/Nassau
1889	Grand Bahama International Airport	Freeport	Bahamas	FPO	MYGF	America/Nassau
1890	Inagua Airport	Matthew Town	Bahamas	IGA	MYIG	America/Nassau
1891	Deadman's Cay Airport	Dead Man's Cay	Bahamas	LGI	MYLD	America/Nassau
1892	Stella Maris Airport	Stella Maris	Bahamas	SML	MYLS	America/Nassau
1893	Mayaguana Airport	Mayaguana	Bahamas	MYG	MYMM	America/Nassau
1894	Lynden Pindling International Airport	Nassau	Bahamas	NAS	MYNN	America/Nassau
1895	Duncan Town Airport	Duncan Town	Bahamas	DCT	MYRD	America/Nassau
1896	Rum Cay Airport	Port Nelson	Bahamas	RCY	MYRP	America/Nassau
1897	San Salvador Airport	Cockburn Town	Bahamas	ZSA	MYSM	America/Nassau
1898	Philip S. W. Goldson International Airport	Belize City	Belize	BZE	MZBZ	America/Belize
1899	Aitutaki Airport	Aitutaki	Cook Islands	AIT	NCAI	Pacific/Rarotonga
1900	Rarotonga International Airport	Avarua	Cook Islands	RAR	NCRG	Pacific/Rarotonga
1901	Nadi International Airport	Nandi	Fiji	NAN	NFFN	Pacific/Fiji
1902	Nausori International Airport	Nausori	Fiji	SUV	NFNA	Pacific/Fiji
1903	Fua'amotu International Airport	Tongatapu	Tonga	TBU	NFTF	Pacific/Tongatapu
1904	Vava'u International Airport	Vava'u	Tonga	VAV	NFTV	Pacific/Tongatapu
1905	Bonriki International Airport	Tarawa	Kiribati	TRW	NGTA	Pacific/Tarawa
1906	Tabiteuea North Airport	Tabiteuea North	Kiribati	TBF	NGTE	
1907	Hihifo Airport	Wallis	Wallis and Futuna	WLS	NLWW	Pacific/Wallis
1908	Faleolo International Airport	Faleolo	Samoa	APW	NSFA	Pacific/Apia
1909	Pago Pago International Airport	Pago Pago	American Samoa	PPG	NSTU	Pacific/Pago_Pago
1910	Rurutu Airport	Rurutu	French Polynesia	RUR	NTAR	
1911	Tubuai Airport	Tubuai	French Polynesia	TUB	NTAT	Pacific/Tahiti
1912	Anaa Airport	Anaa	French Polynesia	AAA	NTGA	Pacific/Tahiti
1913	Fangatau Airport	Fangatau	French Polynesia	FGU	NTGB	Pacific/Tahiti
1914	Tikehau Airport	Tikehau	French Polynesia	TIH	NTGC	Pacific/Tahiti
1915	Reao Airport	Reao	French Polynesia	REA	NTGE	
1916	Fakarava Airport	Fakarava	French Polynesia	FAV	NTGF	Pacific/Tahiti
1917	Manihi Airport	Manihi	French Polynesia	XMH	NTGI	Pacific/Tahiti
1918	Totegegie Airport	Totegegie	French Polynesia	GMR	NTGJ	Pacific/Gambier
1919	Kaukura Airport	Kaukura Atoll	French Polynesia	KKR	NTGK	Pacific/Tahiti
1920	Makemo Airport	Makemo	French Polynesia	MKP	NTGM	Pacific/Tahiti
1921	Puka Puka Airport	Puka Puka	French Polynesia	PKP	NTGP	Pacific/Tahiti
1922	Takapoto Airport	Takapoto	French Polynesia	TKP	NTGT	Pacific/Tahiti
1923	Arutua Airport	Arutua	French Polynesia	AXR	NTGU	Pacific/Tahiti
1924	Mataiva Airport	Mataiva	French Polynesia	MVT	NTGV	Pacific/Tahiti
1925	Takaroa Airport	Takaroa	French Polynesia	TKX	NTKR	Pacific/Tahiti
1926	Nuku Hiva Airport	Nuku Hiva	French Polynesia	NHV	NTMD	Pacific/Marquesas
1927	Bora Bora Airport	Bora Bora	French Polynesia	BOB	NTTB	Pacific/Tahiti
1928	Rangiroa Airport	Rangiroa	French Polynesia	RGI	NTTG	Pacific/Tahiti
1929	Huahine-Fare Airport	Huahine Island	French Polynesia	HUH	NTTH	Pacific/Tahiti
1930	Moorea Airport	Moorea	French Polynesia	MOZ	NTTM	Pacific/Tahiti
1931	Hao Airport	Hao Island	French Polynesia	HOI	NTTO	
1932	Maupiti Airport	Maupiti	French Polynesia	MAU	NTTP	Pacific/Tahiti
1933	Raiatea Airport	Raiatea Island	French Polynesia	RFP	NTTR	Pacific/Tahiti
1934	Bauerfield International Airport	Port-vila	Vanuatu	VLI	NVVV	Pacific/Efate
1935	Koné Airport	Kone	New Caledonia	KNQ	NWWD	Pacific/Noumea
1936	Koumac Airport	Koumac	New Caledonia	KOC	NWWK	Pacific/Noumea
1937	Lifou Airport	Lifou	New Caledonia	LIF	NWWL	Pacific/Noumea
1938	Nouméa Magenta Airport	Noumea	New Caledonia	GEA	NWWM	Pacific/Noumea
1939	Maré Airport	Mare	New Caledonia	MEE	NWWR	Pacific/Noumea
1940	Touho Airport	Touho	New Caledonia	TOU	NWWU	Pacific/Noumea
1941	Ouvéa Airport	Ouvea	New Caledonia	UVE	NWWV	Pacific/Noumea
1942	La Tontouta International Airport	Noumea	New Caledonia	NOU	NWWW	Pacific/Noumea
1943	Auckland International Airport	Auckland	New Zealand	AKL	NZAA	Pacific/Auckland
1944	Taupo Airport	Taupo	New Zealand	TUO	NZAP	Pacific/Auckland
1945	Ardmore Airport	Ardmore	New Zealand	AMZ	NZAR	Pacific/Auckland
1946	Christchurch International Airport	Christchurch	New Zealand	CHC	NZCH	Pacific/Auckland
1947	Chatham Islands-Tuuta Airport	Chatham Island	New Zealand	CHT	NZCI	Pacific/Chatham
1948	Dunedin Airport	Dunedin	New Zealand	DUD	NZDN	Pacific/Auckland
1949	Gisborne Airport	Gisborne	New Zealand	GIS	NZGS	Pacific/Auckland
1950	Glentanner Airport	Glentanner	New Zealand	GTN	NZGT	Pacific/Auckland
1951	Hokitika Airfield	Hokitika	New Zealand	HKK	NZHK	Pacific/Auckland
1952	Hamilton International Airport	Hamilton	New Zealand	HLZ	NZHN	Pacific/Auckland
1953	Hastings Aerodrome	Hastings	New Zealand		NZHS	Pacific/Auckland
1954	Kerikeri Airport	Kerikeri	New Zealand	KKE	NZKK	Pacific/Auckland
1955	Kaitaia Airport	Kaitaia	New Zealand	KAT	NZKT	Pacific/Auckland
1956	Alexandra Airport	Alexandra	New Zealand	ALR	NZLX	Pacific/Auckland
1957	Mount Cook Airport	Mount Cook	New Zealand	MON	NZMC	Pacific/Auckland
1958	Manapouri Airport	Manapouri	New Zealand	TEU	NZMO	Pacific/Auckland
1959	Hood Airport	Masterton	New Zealand	MRO	NZMS	Pacific/Auckland
1960	New Plymouth Airport	New Plymouth	New Zealand	NPL	NZNP	Pacific/Auckland
1961	Nelson Airport	Nelson	New Zealand	NSN	NZNS	Pacific/Auckland
1962	Invercargill Airport	Invercargill	New Zealand	IVC	NZNV	Pacific/Auckland
1963	RNZAF Base Ohakea	Ohakea	New Zealand	OHA	NZOH	Pacific/Auckland
1964	Oamaru Airport	Oamaru	New Zealand	OAM	NZOU	Pacific/Auckland
1965	Palmerston North Airport	Palmerston North	New Zealand	PMR	NZPM	Pacific/Auckland
1966	Paraparaumu Airport	Paraparaumu	New Zealand	PPQ	NZPP	Pacific/Auckland
1967	Queenstown International Airport	Queenstown International	New Zealand	ZQN	NZQN	Pacific/Auckland
1968	Rotorua Regional Airport	Rotorua	New Zealand	ROT	NZRO	Pacific/Auckland
1969	Waiouru Airport	Waiouru	New Zealand		NZRU	Pacific/Auckland
1970	South Pole Station Airport	Stephen's Island	Antarctica		NZSP	Antarctica/South_Pole
1971	Tauranga Airport	Tauranga	New Zealand	TRG	NZTG	Pacific/Auckland
1972	Timaru Airport	Timaru	New Zealand	TIU	NZTU	Pacific/Auckland
1973	Pukaki Airport	Pukaki	New Zealand	TWZ	NZUK	Pacific/Auckland
1974	Woodbourne Airport	Woodbourne	New Zealand	BHE	NZWB	Pacific/Auckland
1975	Williams Field	Weydon	Antarctica		NZWD	Antarctica/South_Pole
1976	Wanaka Airport	Wanaka	New Zealand	WKA	NZWF	Pacific/Auckland
1977	Wigram Airport	Wigram	New Zealand		NZWG	Pacific/Auckland
1978	Whakatane Airport	Whakatane	New Zealand	WHK	NZWK	Pacific/Auckland
1979	Wellington International Airport	Wellington	New Zealand	WLG	NZWN	Pacific/Auckland
1980	Wairoa Airport	Wairoa	New Zealand	WIR	NZWO	Pacific/Auckland
1981	RNZAF Base Auckland-Whenuapai	Whenuapai	New Zealand		NZWP	Pacific/Auckland
1982	Whangarei Airport	Whangarei	New Zealand	WRE	NZWR	Pacific/Auckland
1983	Westport Airport	Westport	New Zealand	WSZ	NZWS	Pacific/Auckland
1984	Wanganui Airport	Wanganui	New Zealand	WAG	NZWU	Pacific/Auckland
1985	Herat Airport	Herat	Afghanistan	HEA	OAHR	Asia/Kabul
1986	Jalalabad Airport	Jalalabad	Afghanistan	JAA	OAJL	Asia/Kabul
1987	Hamid Karzai International Airport	Kabul	Afghanistan	KBL	OAKB	Asia/Kabul
1988	Kandahar Airport	Kandahar	Afghanistan	KDH	OAKN	Asia/Kabul
1989	Maimana Airport	Maimama	Afghanistan	MMZ	OAMN	Asia/Kabul
1990	Mazar I Sharif Airport	Mazar-i-sharif	Afghanistan	MZR	OAMS	Asia/Kabul
1991	Shindand Airport	Shindand	Afghanistan	OAH	OASD	Asia/Kabul
1992	Sheberghan Airport	Sheberghan	Afghanistan		OASG	Asia/Kabul
1993	Konduz Airport	Kunduz	Afghanistan	UND	OAUZ	Asia/Kabul
1994	Bahrain International Airport	Bahrain	Bahrain	BAH	OBBI	Asia/Bahrain
1995	Sheik Isa Air Base	Bahrain	Bahrain		OBBS	Asia/Bahrain
1996	Abha Regional Airport	Abha	Saudi Arabia	AHB	OEAB	Asia/Riyadh
1997	Al Ahsa Airport	Al-ahsa	Saudi Arabia	HOF	OEAH	Asia/Riyadh
1998	Al Baha Airport	El-baha	Saudi Arabia	ABT	OEBA	Asia/Riyadh
1999	Bisha Airport	Bisha	Saudi Arabia	BHH	OEBH	Asia/Riyadh
2000	Abqaiq Airport	Abqaiq	Saudi Arabia		OEBQ	Asia/Riyadh
2001	King Fahd International Airport	Dammam	Saudi Arabia	DMM	OEDF	Asia/Riyadh
2002	King Abdulaziz Air Base	Dhahran	Saudi Arabia	DHA	OEDR	Asia/Riyadh
2003	Jizan Regional Airport	Gizan	Saudi Arabia	GIZ	OEGN	Asia/Riyadh
2004	Gassim Airport	Gassim	Saudi Arabia	ELQ	OEGS	Asia/Riyadh
2005	Gurayat Domestic Airport	Guriat	Saudi Arabia	URY	OEGT	Asia/Riyadh
2006	Ha'il Airport	Hail	Saudi Arabia	HAS	OEHL	Asia/Riyadh
2007	Jubail Airport	Jubail	Saudi Arabia	QJB	OEJB	Asia/Riyadh
2008	King Faisal Naval Base	Jeddah	Saudi Arabia		OEJF	Asia/Riyadh
2009	King Abdulaziz International Airport	Jeddah	Saudi Arabia	JED	OEJN	Asia/Riyadh
2010	King Khaled Military City Airport	King Khalid Mil.city	Saudi Arabia	KMC	OEKK	Asia/Riyadh
2011	Prince Mohammad Bin Abdulaziz Airport	Madinah	Saudi Arabia	MED	OEMA	Asia/Riyadh
2012	Nejran Airport	Nejran	Saudi Arabia	EAM	OENG	Asia/Riyadh
2013	Al Qaisumah/Hafr Al Batin Airport	Hafr Al-batin	Saudi Arabia	AQI	OEPA	Asia/Riyadh
2014	Pump Station 3 Airport	Petroline 3	Saudi Arabia		OEPC	Asia/Riyadh
2015	Pump Station 6 Airport	Petroline 6	Saudi Arabia		OEPF	Asia/Riyadh
2016	Pump Station 10 Airport	Petroline 10	Saudi Arabia		OEPJ	Asia/Riyadh
2017	Rabigh Airport	Rabigh	Saudi Arabia		OERB	Asia/Riyadh
2018	Rafha Domestic Airport	Rafha	Saudi Arabia	RAH	OERF	Asia/Riyadh
2019	King Khaled International Airport	Riyadh	Saudi Arabia	RUH	OERK	Asia/Riyadh
2020	Ras Mishab Airport	Rash Mishab	Saudi Arabia		OERM	Asia/Riyadh
2021	Arar Domestic Airport	Arar	Saudi Arabia	RAE	OERR	Asia/Riyadh
2022	Ras Tanura Airport	Ras Tanura	Saudi Arabia		OERT	Asia/Riyadh
2023	Sharurah Airport	Sharurah	Saudi Arabia	SHW	OESH	Asia/Riyadh
2024	Sulayel Airport	Sulayel	Saudi Arabia	SLF	OESL	Asia/Riyadh
2025	Tabuk Airport	Tabuk	Saudi Arabia	TUU	OETB	Asia/Riyadh
2026	Ta’if Regional Airport	Taif	Saudi Arabia	TIF	OETF	Asia/Riyadh
2027	Thumamah Airport	Thumamah	Saudi Arabia		OETH	Asia/Riyadh
2028	Ras Tanajib Airport	Ras Tanajib	Saudi Arabia		OETN	Asia/Riyadh
2029	Turaif Domestic Airport	Turaif	Saudi Arabia	TUI	OETR	Asia/Riyadh
2030	Al Wajh Domestic Airport	Wejh	Saudi Arabia	EJH	OEWJ	Asia/Riyadh
2031	Prince Abdulmohsin Bin Abdulaziz Airport	Yenbo	Saudi Arabia	YNB	OEYN	Asia/Riyadh
2032	Abadan Airport	Abadan	Iran	ABD	OIAA	Asia/Tehran
2033	Dezful Airport	Dezful	Iran	DEF	OIAD	Asia/Tehran
2034	Aghajari Airport	Aghajari	Iran	AKW	OIAG	Asia/Tehran
2035	Gachsaran Airport	Gachsaran	Iran	GCH	OIAH	Asia/Tehran
2036	Shahid Asyaee Airport	Masjed Soleiman	Iran		OIAI	Asia/Tehran
2037	Omidiyeh Airport	Omidyeh	Iran	OMI	OIAJ	Asia/Tehran
2038	Mahshahr Airport	Bandar Mahshahr	Iran	MRX	OIAM	Asia/Tehran
2039	Ahwaz Airport	Ahwaz	Iran	AWZ	OIAW	Asia/Tehran
2040	Abu Musa Island Airport	Abumusa I.	Iran	AEU	OIBA	Asia/Tehran
2041	Bushehr Airport	Bushehr	Iran	BUZ	OIBB	Asia/Tehran
2042	Bastak Airport	Bastak	Iran		OIBH	Asia/Tehran
2043	Asaloyeh Airport	Golbandi	Iran		OIBI	Asia/Tehran
2044	Kish International Airport	Kish Island	Iran	KIH	OIBK	Asia/Tehran
2045	Bandar Lengeh Airport	Bandar Lengeh	Iran	BDH	OIBL	Asia/Tehran
2046	Khark Island Airport	Khark Island	Iran	KHK	OIBQ	Asia/Tehran
2047	Sirri Island Airport	Siri Island	Iran	SXI	OIBS	Asia/Tehran
2048	Lavan Island Airport	Lavan Island	Iran	LVP	OIBV	Asia/Tehran
2049	Shahid Ashrafi Esfahani Airport	Bakhtaran	Iran	KSH	OICC	Asia/Tehran
2050	Sanandaj Airport	Sanandaj	Iran	SDG	OICS	Asia/Tehran
2051	Hesa Airport	Daran	Iran	IFH	OIFE	Asia/Tehran
2052	Shahid Vatan Pour Air Base	Esfahan	Iran		OIFH	Asia/Tehran
2053	Kashan Airport	Kashan	Iran	KKS	OIFK	Asia/Tehran
2054	Esfahan Shahid Beheshti International Airport	Esfahan	Iran	IFN	OIFM	Asia/Tehran
2055	Badr Air Base	Sepah	Iran		OIFP	Asia/Tehran
2056	Sardar-e-Jangal Airport	Rasht	Iran	RAS	OIGG	Asia/Tehran
2057	Arak Airport	Arak	Iran	AJK	OIHR	Asia/Tehran
2058	Ghazvin Azadi Airport	Abe-ali	Iran		OIIA	Asia/Tehran
2059	Kushke Nosrat Airport	Kushke Nosrat	Iran		OIIC	Asia/Tehran
2060	Doshan Tappeh Air Base	Teheran	Iran		OIID	Asia/Tehran
2061	Ghale Morghi Airport	Teheran	Iran		OIIG	Asia/Tehran
2062	Mehrabad International Airport	Teheran	Iran	THR	OIII	Asia/Tehran
2063	Qazvin Airport	Ghazvin	Iran	GZW	OIIK	Asia/Tehran
2064	Naja Airport	Khoram Dareh	Iran		OIIM	Asia/Tehran
2065	Bandar Abbas International Airport	Bandar Abbas	Iran	BND	OIKB	Asia/Tehran
2066	Jiroft Airport	Jiroft	Iran	JYR	OIKJ	Asia/Tehran
2067	Kerman Airport	Kerman	Iran	KER	OIKK	Asia/Tehran
2068	Havadarya Airport	Bandar Abbas	Iran	HDR	OIKP	Asia/Tehran
2069	Dayrestan Airport	Gheshm I.	Iran		OIKQ	Asia/Tehran
2070	Sirjan Airport	Sirjan	Iran	SYJ	OIKY	Asia/Tehran
2071	Birjand Airport	Birjand	Iran	XBJ	OIMB	Asia/Tehran
2072	Sarakhs Airport	Sarakhs	Iran	CKT	OIMC	Asia/Tehran
2073	Shahroud Airport	Emam Shahr	Iran	RUD	OIMJ	Asia/Tehran
2074	Tabas Airport	Tabas	Iran	TCX	OIMT	Asia/Tehran
2075	Kalaleh Airport	Kalaleh	Iran	KLM	OINE	Asia/Tehran
2076	Ramsar Airport	Ramsar	Iran	RZR	OINR	Asia/Tehran
2077	Fasa Airport	Fasa	Iran	FAZ	OISF	Asia/Tehran
2078	Jahrom Airport	Jahrom	Iran	JAR	OISJ	Asia/Tehran
2079	Lamerd Airport	Lamerd	Iran	LFM	OISR	Asia/Tehran
2080	Shiraz Shahid Dastghaib International Airport	Shiraz	Iran	SYZ	OISS	Asia/Tehran
2081	Khoy Airport	Khoy	Iran	KHY	OITK	Asia/Tehran
2082	Tabriz International Airport	Tabriz	Iran	TBZ	OITT	Asia/Tehran
2083	Zanjan Airport	Zanjan	Iran	JWN	OITZ	Asia/Tehran
2084	Shahid Sadooghi Airport	Yazd	Iran	AZD	OIYY	Asia/Tehran
2085	Zabol Airport	Zabol	Iran	ACZ	OIZB	Asia/Tehran
2086	Konarak Airport	Chah Bahar	Iran	ZBR	OIZC	Asia/Tehran
2087	Zahedan International Airport	Zahedan	Iran	ZAH	OIZH	Asia/Tehran
2088	Iran Shahr Airport	Iran Shahr	Iran	IHR	OIZI	Asia/Tehran
2089	Saravan Airport	Saravan	Iran		OIZS	Asia/Tehran
2090	Queen Alia International Airport	Amman	Jordan	AMM	OJAI	Asia/Amman
2091	Amman-Marka International Airport	Amman	Jordan	ADJ	OJAM	Asia/Amman
2092	Aqaba King Hussein International Airport	Aqaba	Jordan	AQJ	OJAQ	Asia/Amman
2093	Prince Hassan Air Base	Hotel Four	Jordan		OJHF	Asia/Amman
2094	Jerusalem Airport	Jerusalem	West Bank		OJJR	Asia/Jerusalem
2095	King Hussein Air College	Mafraq	Jordan	OMF	OJMF	Asia/Amman
2096	Kuwait International Airport	Kuwait	Kuwait	KWI	OKBK	Asia/Kuwait
2097	Beirut Rafic Hariri International Airport	Beirut	Lebanon	BEY	OLBA	Asia/Beirut
2098	Rene Mouawad Air Base	Kleiat	Lebanon	KYE	OLKA	Asia/Beirut
2099	Abu Dhabi International Airport	Abu Dhabi	United Arab Emirates	AUH	OMAA	Asia/Dubai
2100	Bateen Airport	Abu Dhabi	United Arab Emirates	AZI	OMAD	Asia/Dubai
2101	Al Hamra Aux Airport	Al Hamra	United Arab Emirates		OMAH	Asia/Dubai
2102	Jebel Dhana Airport	Jebel Dhana	United Arab Emirates		OMAJ	Asia/Dubai
2103	Al Dhafra Air Base	Abu Dhabi	United Arab Emirates	DHF	OMAM	Asia/Dubai
2104	Arzanah Airport	Arzana	United Arab Emirates		OMAR	Asia/Dubai
2105	Das Island Airport	Das Island	United Arab Emirates		OMAS	Asia/Dubai
2106	Zirku Airport	Zirku	United Arab Emirates		OMAZ	Asia/Dubai
2107	Dubai International Airport	Dubai	United Arab Emirates	DXB	OMDB	Asia/Dubai
2108	Fujairah International Airport	Fujeirah	United Arab Emirates	FJR	OMFJ	Asia/Dubai
2109	Ras Al Khaimah International Airport	Ras Al Khaimah	United Arab Emirates	RKT	OMRK	Asia/Dubai
2110	Sharjah International Airport	Sharjah	United Arab Emirates	SHJ	OMSJ	Asia/Dubai
2111	Khasab Air Base	Khasab	Oman	KHS	OOKB	Asia/Muscat
2113	Muscat International Airport	Muscat	Oman	MCT	OOMS	Asia/Muscat
2114	Salalah Airport	Salalah	Oman	SLL	OOSA	Asia/Muscat
2115	Thumrait Air Base	Thumrait	Oman	TTH	OOTH	Asia/Muscat
2116	Bhagatanwala Airport	Bhagtanwala	Pakistan	BHW	OPBG	Asia/Karachi
2117	Faisalabad International Airport	Faisalabad	Pakistan	LYP	OPFA	Asia/Karachi
2118	Gwadar International Airport	Gwadar	Pakistan	GWD	OPGD	Asia/Karachi
2119	Gilgit Airport	Gilgit	Pakistan	GIL	OPGT	Asia/Karachi
2120	Shahbaz Air Base	Jacobsbad	Pakistan	JAG	OPJA	Asia/Karachi
2121	Jinnah International Airport	Karachi	Pakistan	KHI	OPKC	Asia/Karachi
2122	Alama Iqbal International Airport	Lahore	Pakistan	LHE	OPLA	Asia/Karachi
2123	Walton Airport	Lahore	Pakistan		OPLH	Asia/Karachi
2124	Mangla Airport	Mangla	Pakistan	XJM	OPMA	Asia/Karachi
2125	Muzaffarabad Airport	Muzaffarabad	Pakistan	MFG	OPMF	Asia/Karachi
2126	Mianwali Air Base	Mianwali	Pakistan	MWD	OPMI	Asia/Karachi
2127	Moenjodaro Airport	Moenjodaro	Pakistan	MJD	OPMJ	Asia/Karachi
2128	Masroor Air Base	Karachi	Pakistan		OPMR	Asia/Karachi
2129	Multan International Airport	Multan	Pakistan	MUX	OPMT	Asia/Karachi
2130	Shaheed Benazirabad Airport	Nawabshah	Pakistan	WNS	OPNH	Asia/Karachi
2131	Okara Cantonment Airstrip	Okara	Pakistan		OPOK	Asia/Karachi
2132	Panjgur Airport	Panjgur	Pakistan	PJG	OPPG	Asia/Karachi
2133	Pasni Airport	Pasni	Pakistan	PSI	OPPI	Asia/Karachi
2134	Peshawar International Airport	Peshawar	Pakistan	PEW	OPPS	Asia/Karachi
2135	Qasim Airport	Qasim	Pakistan		OPQS	Asia/Karachi
2136	Quetta International Airport	Quetta	Pakistan	UET	OPQT	Asia/Karachi
2137	Shaikh Zaid Airport	Rahim Yar Khan	Pakistan	RYK	OPRK	Asia/Karachi
2138	Benazir Bhutto International Airport	Islamabad	Pakistan		OPRN	Asia/Karachi
2139	Risalpur Air Base	Risalpur	Pakistan		OPRS	Asia/Karachi
2140	Rawalakot Airport	Rawala Kot	Pakistan	RAZ	OPRT	Asia/Karachi
2141	Sukkur Airport	Sukkur	Pakistan	SKZ	OPSK	Asia/Karachi
2142	Saidu Sharif Airport	Saidu Sharif	Pakistan	SDT	OPSS	Asia/Karachi
2143	Sui Airport	Sui	Pakistan	SUL	OPSU	Asia/Karachi
2144	Talhar Airport	Talhar	Pakistan	BDN	OPTH	Asia/Karachi
2145	Wana Airport	Wana	Pakistan	WAF	OPWN	Asia/Karachi
2146	Zhob Airport	Zhob	Pakistan	PZH	OPZB	Asia/Karachi
2147	Basrah International Airport	Basrah	Iraq	BSR	ORMM	Asia/Baghdad
2148	Aleppo International Airport	Aleppo	Syria	ALP	OSAP	Asia/Damascus
2149	Damascus International Airport	Damascus	Syria	DAM	OSDI	Asia/Damascus
2150	Deir ez-Zor Air Base	Deire Zor	Syria	DEZ	OSDZ	Asia/Damascus
2151	Bassel Al-Assad International Airport	Latakia	Syria	LTK	OSLK	Asia/Damascus
2152	Palmyra Airport	Palmyra	Syria	PMS	OSPR	Asia/Damascus
2153	Doha International Airport	Doha	Qatar	DIA	OTBD	Asia/Qatar
2154	Canton Island Airport	Canton Island	Kiribati	CIS	PCIS	Pacific/Enderbury
2155	Rota International Airport	Rota	Northern Mariana Islands	ROP	PGRO	Pacific/Saipan
2156	Saipan International Airport	Saipan	Northern Mariana Islands	SPN	PGSN	Pacific/Saipan
2157	Andersen Air Force Base	Andersen	Guam	UAM	PGUA	Pacific/Guam
2158	Antonio B. Won Pat International Airport	Agana	Guam	GUM	PGUM	Pacific/Guam
2159	Tinian International Airport	West Tinian	Northern Mariana Islands	TIQ	PGWT	Pacific/Saipan
2160	Marshall Islands International Airport	Majuro	Marshall Islands	MAJ	PKMJ	Pacific/Majuro
2161	Dyess Army Air Field	Kwajalein	Marshall Islands		PKRO	Pacific/Majuro
2162	Bucholz Army Air Field	Kwajalein	Marshall Islands	KWA	PKWA	Pacific/Majuro
2163	Cassidy International Airport	Kiritimati	Kiribati	CXI	PLCH	
2164	Henderson Field	Midway	Midway Islands	MDY	PMDY	Pacific/Midway
2165	Chuuk International Airport	Chuuk	Micronesia	TKK	PTKK	Pacific/Truk
2166	Pohnpei International Airport	Pohnpei	Micronesia	PNI	PTPN	Pacific/Ponape
2167	Babelthuap Airport	Babelthuap	Palau	ROR	PTRO	Pacific/Palau
2168	Kosrae International Airport	Kosrae	Micronesia	KSA	PTSA	Pacific/Kosrae
2169	Yap International Airport	Yap	Micronesia	YAP	PTYA	Pacific/Truk
2170	Kinmen Airport	Kinmen	Taiwan	KNH	RCBS	Asia/Taipei
2171	Pingtung South Airport	Pingtung	Taiwan		RCDC	Asia/Taipei
2172	Longtan Air Base	Longtang	Taiwan		RCDI	Asia/Taipei
2173	Taitung Airport	Fengnin	Taiwan	TTT	RCFN	Asia/Taipei
2174	Lyudao Airport	Green Island	Taiwan	GNI	RCGI	Asia/Taipei
2175	Kaohsiung International Airport	Kaohsiung	Taiwan	KHH	RCKH	Asia/Taipei
2176	Chiayi Airport	Chiayi	Taiwan	CYI	RCKU	Asia/Taipei
2177	Lanyu Airport	Lanyu	Taiwan	KYD	RCLY	Asia/Taipei
2178	Taichung Ching Chuang Kang Airport	Taichung	Taiwan	RMQ	RCMQ	Asia/Taipei
2179	Tainan Airport	Tainan	Taiwan	TNN	RCNN	Asia/Taipei
2180	Hsinchu Air Base	Hsinchu	Taiwan	HSZ	RCPO	Asia/Taipei
2181	Makung Airport	Makung	Taiwan	MZG	RCQC	Asia/Taipei
2182	Chihhang Air Base	Taitung	Taiwan		RCQS	Asia/Taipei
2183	Pingtung North Airport	Pingtung	Taiwan	PIF	RCSQ	Asia/Taipei
2184	Taipei Songshan Airport	Taipei	Taiwan	TSA	RCSS	Asia/Taipei
2185	Taiwan Taoyuan International Airport	Taipei	Taiwan	TPE	RCTP	Asia/Taipei
2186	Wang-an Airport	Wang An	Taiwan	WOT	RCWA	Asia/Taipei
2187	Hualien Airport	Hualien	Taiwan	HUN	RCYU	Asia/Taipei
2188	Narita International Airport	Tokyo	Japan	NRT	RJAA	Asia/Tokyo
2189	Matsumoto Airport	Matsumoto	Japan	MMJ	RJAF	Asia/Tokyo
2190	Hyakuri Airport	Ibaraki	Japan	IBR	RJAH	Asia/Tokyo
2191	Minami Torishima Airport	Minami Tori Shima	Japan	MUS	RJAM	Asia/Tokyo
2192	Iwo Jima Airport	Iwojima	Japan	IWO	RJAW	Asia/Tokyo
2193	Nanki Shirahama Airport	Nanki-shirahama	Japan	SHM	RJBD	Asia/Tokyo
2194	Kohnan Airport	Kohnan	Japan		RJBK	Asia/Tokyo
2195	Tokachi-Obihiro Airport	Obihiro	Japan	OBO	RJCB	Asia/Tokyo
2196	New Chitose Airport	Sapporo	Japan	CTS	RJCC	Asia/Tokyo
2197	Hakodate Airport	Hakodate	Japan	HKD	RJCH	Asia/Tokyo
2198	Chitose Air Base	Chitose	Japan		RJCJ	Asia/Tokyo
2199	Memanbetsu Airport	Memanbetsu	Japan	MMB	RJCM	Asia/Tokyo
2200	Nakashibetsu Airport	Nakashibetsu	Japan	SHB	RJCN	Asia/Tokyo
2201	Tokachi Airport	Tokachi	Japan		RJCT	Asia/Tokyo
2202	Wakkanai Airport	Wakkanai	Japan	WKJ	RJCW	Asia/Tokyo
2203	Iki Airport	Iki	Japan	IKI	RJDB	Asia/Tokyo
2204	Yamaguchi Ube Airport	Yamaguchi	Japan	UBJ	RJDC	Asia/Tokyo
2205	Tsushima Airport	Tsushima	Japan	TSJ	RJDT	Asia/Tokyo
2206	Monbetsu Airport	Monbetsu	Japan	MBE	RJEB	Asia/Tokyo
2207	Asahikawa Airport	Asahikawa	Japan	AKJ	RJEC	Asia/Tokyo
2208	Okushiri Airport	Okushiri	Japan	OIR	RJEO	Asia/Tokyo
2209	Rishiri Airport	Rishiri Island	Japan	RIS	RJER	Asia/Tokyo
2210	Ashiya Airport	Ashiya	Japan		RJFA	Asia/Tokyo
2211	Yakushima Airport	Yakushima	Japan	KUM	RJFC	Asia/Tokyo
2212	Fukue Airport	Fukue	Japan	FUJ	RJFE	Asia/Tokyo
2213	Fukuoka Airport	Fukuoka	Japan	FUK	RJFF	Asia/Tokyo
2214	New Tanegashima Airport	Tanegashima	Japan	TNE	RJFG	Asia/Tokyo
2215	Kagoshima Airport	Kagoshima	Japan	KOJ	RJFK	Asia/Tokyo
2216	Miyazaki Airport	Miyazaki	Japan	KMI	RJFM	Asia/Tokyo
2217	Nyutabaru Airport	Nyutabaru	Japan		RJFN	Asia/Tokyo
2218	Oita Airport	Oita	Japan	OIT	RJFO	Asia/Tokyo
2219	Kitakyūshū Airport	Kitakyushu	Japan	KKJ	RJFR	Asia/Tokyo
2220	Kumamoto Airport	Kumamoto	Japan	KMJ	RJFT	Asia/Tokyo
2221	Nagasaki Airport	Nagasaki	Japan	NGS	RJFU	Asia/Tokyo
2222	Kanoya Airport	Kanoya	Japan		RJFY	Asia/Tokyo
2223	Tsuiki Air Field	Tsuiki	Japan		RJFZ	Asia/Tokyo
2224	Amami Airport	Amami	Japan	ASJ	RJKA	Asia/Tokyo
2225	Okierabu Airport	Okierabu	Japan	OKE	RJKB	Asia/Tokyo
2226	Tokunoshima Airport	Tokunoshima	Japan	TKN	RJKN	Asia/Tokyo
2227	Fukui Airport	Fukui	Japan	FKJ	RJNF	Asia/Tokyo
2228	Gifu Airport	Gifu	Japan	QGU	RJNG	Asia/Tokyo
2229	Hamamatsu Airport	Hamamatsu	Japan		RJNH	Asia/Tokyo
2230	Komatsu Airport	Kanazawa	Japan	KMQ	RJNK	Asia/Tokyo
2231	Oki Airport	Oki Island	Japan	OKI	RJNO	Asia/Tokyo
2232	Toyama Airport	Toyama	Japan	TOY	RJNT	Asia/Tokyo
2233	Shizuhama Airport	Yaizu	Japan		RJNY	Asia/Tokyo
2234	Hiroshima Airport	Hiroshima	Japan	HIJ	RJOA	Asia/Tokyo
2235	Okayama Airport	Okayama	Japan	OKJ	RJOB	Asia/Tokyo
2236	Izumo Airport	Izumo	Japan	IZO	RJOC	Asia/Tokyo
2237	Hofu Airport	Hofu	Japan		RJOF	Asia/Tokyo
2238	Miho Yonago Airport	Miho	Japan	YGJ	RJOH	Asia/Tokyo
2239	Iwakuni Mcas	Iwakuni	Japan		IWK	Asia/Tokyo
2240	Kōchi Ryōma Airport	Kochi	Japan	KCZ	RJOK	Asia/Tokyo
2241	Matsuyama Airport	Matsuyama	Japan	MYJ	RJOM	Asia/Tokyo
2242	Osaka International Airport	Osaka	Japan	ITM	RJOO	Asia/Tokyo
2243	Tottori Airport	Tottori	Japan	TTJ	RJOR	Asia/Tokyo
2244	Tokushima Airport/JMSDF Air Base	Tokushima	Japan	TKS	RJOS	Asia/Tokyo
2245	Takamatsu Airport	Takamatsu	Japan	TAK	RJOT	Asia/Tokyo
2246	Yao Airport	Osaka	Japan		RJOY	Asia/Tokyo
2247	Ozuki Airport	Ozuki	Japan		RJOZ	Asia/Tokyo
2248	Aomori Airport	Aomori	Japan	AOJ	RJSA	Asia/Tokyo
2249	Yamagata Airport	Yamagata	Japan	GAJ	RJSC	Asia/Tokyo
2250	Sado Airport	Sado	Japan	SDS	RJSD	Asia/Tokyo
2251	Hachinohe Airport	Hachinoe	Japan	HHE	RJSH	Asia/Tokyo
2252	Hanamaki Airport	Hanamaki	Japan	HNA	RJSI	Asia/Tokyo
2253	Akita Airport	Akita	Japan	AXT	RJSK	Asia/Tokyo
2254	Misawa Air Base	Misawa	Japan	MSJ	RJSM	Asia/Tokyo
2255	Sendai Airport	Sendai	Japan	SDJ	RJSS	Asia/Tokyo
2256	Matsushima Air Base	Matsushima	Japan		RJST	Asia/Tokyo
2257	Atsugi Naval Air Facility	Atsugi	Japan	NJA	RJTA	Asia/Tokyo
2258	Tateyama Airport	Tateyama	Japan		RJTE	Asia/Tokyo
2259	Hachijojima Airport	Hachijojima	Japan	HAC	RJTH	Asia/Tokyo
2260	Iruma Air Base	Iruma	Japan		RJTJ	Asia/Tokyo
2261	Kisarazu Airport	Kisarazu	Japan		RJTK	Asia/Tokyo
2262	Shimofusa Airport	Shimofusa	Japan		RJTL	Asia/Tokyo
2263	Oshima Airport	Oshima	Japan	OIM	RJTO	Asia/Tokyo
2264	Kastner Army Heliport	Zama	Japan		RJTR	Asia/Tokyo
2265	Tokyo Haneda International Airport	Tokyo	Japan	HND	RJTT	Asia/Tokyo
2266	Yokota Air Base	Yokota	Japan	OKO	RJTY	Asia/Tokyo
2267	Gwangju Airport	Kwangju	South Korea	KWJ	RKJJ	Asia/Seoul
2268	Jeon Ju Airport (G-703)	Jhunju	South Korea	CHN	RKJU	Asia/Seoul
2269	Yeosu Airport	Yeosu	South Korea	RSU	RKJY	Asia/Seoul
2270	Sokcho Airport	Sokch'o	South Korea		RKND	Asia/Seoul
2271	Gangneung Airport (K-18)	Kangnung	South Korea	KAG	RKNN	Asia/Seoul
2272	Jeju International Airport	Cheju	South Korea	CJU	RKPC	Asia/Seoul
2273	Jinhae Airbase/Airport (G-813/K-10)	Chinhae	South Korea	CHF	RKPE	Asia/Seoul
2274	Gimhae International Airport	Busan	South Korea	PUS	RKPK	Asia/Seoul
2275	Ulsan Airport	Ulsan	South Korea	USN	RKPU	Asia/Seoul
2276	A 511 Airport	Pyongtaek	South Korea		RKSG	Asia/Seoul
2277	Seoul Air Base (K-16)	Seoul East	South Korea	SSN	RKSM	Asia/Seoul
2278	Osan Air Base	Osan	South Korea	OSN	RKSO	Asia/Seoul
2279	Gimpo International Airport	Seoul	South Korea	GMP	RKSS	Asia/Seoul
2280	Suwon Airport	Suwon	South Korea	SWU	RKSW	Asia/Seoul
2281	Pohang Airport (G-815/K-3)	Pohang	South Korea	KPO	RKTH	Asia/Seoul
2282	Daegu Airport	Taegu	South Korea	TAE	RKTN	Asia/Seoul
2283	Yecheon Airbase	Yechon	South Korea	YEC	RKTY	Asia/Seoul
2284	Naha Airport	Okinawa	Japan	OKA	ROAH	Asia/Tokyo
2285	Ie Shima Auxiliary Air Base	Iejima	Japan		RODE	Asia/Tokyo
2286	Kadena Air Base	Kadena	Japan	DNA	RODN	Asia/Tokyo
2287	New Ishigaki Airport	Ishigaki	Japan	ISG	ROIG	Asia/Tokyo
2288	Kumejima Airport	Kumejima	Japan	UEO	ROKJ	Asia/Tokyo
2289	Minami-Daito Airport	Minami Daito	Japan	MMD	ROMD	Asia/Tokyo
2290	Miyako Airport	Miyako	Japan	MMY	ROMY	Asia/Tokyo
2291	Kitadaito Airport	Kitadaito	Japan	KTD	RORK	Asia/Tokyo
2292	Shimojishima Airport	Shimojishima	Japan	SHI	RORS	Asia/Tokyo
2293	Tarama Airport	Tarama	Japan	TRA	RORT	Asia/Tokyo
2294	Yoron Airport	Yoron	Japan	RNJ	RORY	Asia/Tokyo
2295	Futenma Marine Corps Air Station	Futema	Japan		ROTM	Asia/Tokyo
2296	Yonaguni Airport	Yonaguni Jima	Japan	OGN	ROYN	Asia/Tokyo
2297	Ninoy Aquino International Airport	Manila	Philippines	MNL	RPLL	Asia/Manila
2298	Awang Airport	Cotabato	Philippines	CBO	RPMC	Asia/Manila
2299	Cagayan De Oro Airport	Ladag	Philippines		RPML	Asia/Manila
2300	Pagadian Airport	Pagadian	Philippines	PAG	RPMP	Asia/Manila
2301	General Santos International Airport	Romblon	Philippines	GES	RPMR	Asia/Manila
2302	Zamboanga International Airport	Zamboanga	Philippines	ZAM	RPMZ	Asia/Manila
2303	Loakan Airport	Baguio	Philippines	BAG	RPUB	Asia/Manila
2304	Daet Airport	Daet	Philippines	DTE	RPUD	Asia/Manila
2305	Basa Air Base	Floridablanca	Philippines		RPUF	Asia/Manila
2306	Lingayen Airport	Lingayen	Philippines		RPUG	Asia/Manila
2307	San Jose Airport	San Jose	Philippines	SJI	RPUH	Asia/Manila
2308	Fernando Air Base	Lipa	Philippines		RPUL	Asia/Manila
2309	Mamburao Airport	Mamburao	Philippines	MBO	RPUM	Asia/Manila
2310	Vigan Airport	Vigan	Philippines		RPUQ	Asia/Manila
2311	Dr.Juan C. Angara Airport	Baler	Philippines	BQA	RPUR	Asia/Manila
2312	Bagabag Airport	Bagabag	Philippines		RPUZ	Asia/Manila
2313	Daniel Z. Romualdez Airport	Tacloban	Philippines	TAC	RPVA	Asia/Manila
2314	Bacolod-Silay Airport	Bacolod	Philippines	BCD	RPVB	Asia/Manila
2315	Sibulan Airport	Dumaguete	Philippines	DGT	RPVD	Asia/Manila
2316	Godofredo P. Ramos Airport	Caticlan	Philippines	MPH	RPVE	Asia/Manila
2317	Guiuan Airport	Guiuan	Philippines		RPVG	Asia/Manila
2318	Iloilo International Airport	Iloilo	Philippines	ILO	RPVI	Asia/Manila
2319	Kalibo International Airport	Kalibo	Philippines	KLO	RPVK	Asia/Manila
2320	Puerto Princesa Airport	Puerto Princesa	Philippines	PPS	RPVP	Asia/Manila
2321	Evelio Javier Airport	San Jose	Philippines	EUQ	RPVS	Asia/Manila
2322	Comodoro Pierrestegui Airport	Concordia	Argentina	COC	SAAC	America/Cordoba
2323	Gualeguaychu Airport	Gualeguaychu	Argentina	GHU	SAAG	America/Cordoba
2324	Junin Airport	Junin	Argentina	JNI	SAAJ	America/Buenos_Aires
2325	General Urquiza Airport	Parana	Argentina	PRA	SAAP	America/Cordoba
2326	Islas Malvinas Airport	Rosario	Argentina	ROS	SAAR	America/Cordoba
2327	Sauce Viejo Airport	Santa Fe	Argentina	SFN	SAAV	America/Cordoba
2328	Jorge Newbery Airpark	Buenos Aires	Argentina	AEP	SABE	America/Buenos_Aires
2329	Ingeniero Ambrosio Taravella Airport	Cordoba	Argentina	COR	SACO	America/Cordoba
2330	Chamical Airport	Gobernador Gordillo	Argentina		SACT	America/Argentina/La_Rioja
2331	San Fernando Airport	San Fernando	Argentina	FDO	SADF	America/Buenos_Aires
2332	Mariano Moreno Airport	Jose C. Paz	Argentina		SADJ	America/Buenos_Aires
2333	La Plata Airport	La Plata	Argentina	LPG	SADL	America/Buenos_Aires
2334	Moron Airport	Moron	Argentina		SADM	America/Buenos_Aires
2335	El Palomar Airport	El Palomar	Argentina	EPA	SADP	America/Buenos_Aires
2336	Chos Malal Airport	Chosmadal	Argentina	HOS	SAHC	America/Argentina/Salta
2337	Dr. Arturo H. Illia Airport	Fuerte Gral Roca	Argentina	GNR	SAHR	America/Argentina/Salta
2338	El Plumerillo Airport	Mendoza	Argentina	MDZ	SAME	America/Mendoza
2339	Comodoro D.R. Salomón Airport	Malargue	Argentina	LGS	SAMM	America/Mendoza
2340	Suboficial Ay Santiago Germano Airport	San Rafael	Argentina	AFA	SAMR	America/Mendoza
2341	Catamarca Airport	Catamarca	Argentina	CTC	SANC	America/Catamarca
2342	Vicecomodoro Angel D. La Paz Aragonés Airport	Santiago Del Estero	Argentina	SDE	SANE	America/Cordoba
2343	Tinogasta Airport	Tinogasta	Argentina		SANI	America/Catamarca
2344	Capitan V A Almonacid Airport	La Rioja	Argentina	IRJ	SANL	America/Argentina/La_Rioja
2345	Chilecito Airport	Chilecito	Argentina		SANO	America/Argentina/La_Rioja
2346	Teniente Benjamin Matienzo Airport	Tucuman	Argentina	TUC	SANT	America/Argentina/Tucuman
2347	Domingo Faustino Sarmiento Airport	San Juan	Argentina	UAQ	SANU	America/Argentina/San_Juan
2348	Area De Material Airport	Rio Cuarto	Argentina	RCU	SAOC	America/Cordoba
2349	Villa Dolores Airport	Villa Dolores	Argentina	VDR	SAOD	America/Cordoba
2350	La Quiaca Airport	Laboulaye	Argentina		SAOL	America/Jujuy
2351	Marcos Juarez Airport	Marcos Juarez	Argentina		SAOM	America/Cordoba
2352	Villa Reynolds Airport	Villa Reynolds	Argentina	VME	SAOR	America/Argentina/San_Luis
2353	Brigadier Mayor D Cesar Raul Ojeda Airport	San Luis	Argentina	LUQ	SAOU	America/Argentina/San_Luis
2354	Corrientes Airport	Corrientes	Argentina	CNQ	SARC	America/Cordoba
2355	Resistencia International Airport	Resistencia	Argentina	RES	SARE	America/Cordoba
2356	Formosa Airport	Formosa	Argentina	FMA	SARF	America/Cordoba
2357	Cataratas Del Iguazú International Airport	Iguazu Falls	Argentina	IGR	SARI	America/Cordoba
2358	Paso De Los Libres Airport	Paso De Los Libres	Argentina	AOL	SARL	America/Cordoba
2359	Monte Caseros Airport	Monte Caseros	Argentina	MCS	SARM	America/Cordoba
2360	Libertador Gral D Jose De San Martin Airport	Posadas	Argentina	PSS	SARP	America/Cordoba
2361	Termal Airport	Presidencia R.s.pena	Argentina	PRQ	SARS	America/Cordoba
2362	Martin Miguel De Guemes International Airport	Salta	Argentina	SLA	SASA	America/Argentina/Salta
2363	Gobernador Horacio Guzman International Airport	Jujuy	Argentina	JUJ	SASJ	America/Jujuy
2364	Orán Airport	Oran	Argentina	ORA	SASO	America/Argentina/Salta
2365	Laboulaye Airport	La Quiaca	Argentina		SASQ	America/Cordoba
2366	El Dorado Airport	El Dorado	Argentina	ELO	SATD	America/Cordoba
2367	Goya Airport	Goya	Argentina	OYA	SATG	America/Cordoba
2368	Oberá Airport	Obera	Argentina		SATO	America/Cordoba
2369	Reconquista Airport	Reconquista	Argentina	RCQ	SATR	America/Cordoba
2370	Curuzu Cuatia Airport	Curuzu Cuatia	Argentina	UZU	SATU	America/Cordoba
2371	El Bolson Airport	El Bolson	Argentina	EHL	SAVB	America/Argentina/Salta
2372	General E. Mosconi Airport	Comodoro Rivadavia	Argentina	CRD	SAVC	America/Catamarca
2373	Brigadier Antonio Parodi Airport	Esquel	Argentina	EQS	SAVE	America/Catamarca
2374	Almirante Marco Andres Zar Airport	Trelew	Argentina	REL	SAVT	America/Catamarca
2375	Gobernador Castello Airport	Viedma	Argentina	VDM	SAVV	America/Argentina/Salta
2376	El Tehuelche Airport	Puerto Madryn	Argentina	PMY	SAVY	America/Catamarca
2377	Marambio Base	Marambio Base	Antarctica		SAWB	Antarctica/South_Pole
2378	Puerto Deseado Airport	Puerto Deseado	Argentina	PUD	SAWD	America/Argentina/Rio_Gallegos
2379	Hermes Quijada International Airport	Rio Grande	Argentina	RGA	SAWE	America/Argentina/Ushuaia
2380	Piloto Civil N. Fernández Airport	Rio Gallegos	Argentina	RGL	SAWG	America/Argentina/Rio_Gallegos
2381	Malvinas Argentinas Airport	Ushuaia	Argentina	USH	SAWH	America/Argentina/Ushuaia
2382	Capitan D Daniel Vazquez Airport	San Julian	Argentina	ULA	SAWJ	America/Argentina/Rio_Gallegos
2383	Perito Moreno Airport	Perito Moreno	Argentina	PMQ	SAWP	America/Argentina/Rio_Gallegos
2384	Santa Cruz Airport	Santa Cruz	Argentina	RZA	SAWU	America/Argentina/Rio_Gallegos
2385	Comandante Espora Airport	Bahia Blanca	Argentina	BHI	SAZB	America/Buenos_Aires
2386	Brigadier D.H.E. Ruiz Airport	Colonel Suarez	Argentina	CSZ	SAZC	America/Buenos_Aires
2387	Olavarria Airport	Olavarria	Argentina	OVR	SAZF	America/Buenos_Aires
2388	General Pico Airport	General Pico	Argentina	GPO	SAZG	America/Argentina/Salta
2389	Tres Arroyos Airport	Tres Arroyos	Argentina	OYO	SAZH	America/Buenos_Aires
2390	Bolivar Airport	Bolivar	Argentina		SAZI	America/Buenos_Aires
2391	Ástor Piazzola International Airport	Mar Del Plata	Argentina	MDQ	SAZM	America/Buenos_Aires
2392	Presidente Peron Airport	Neuquen	Argentina	NQN	SAZN	America/Argentina/Salta
2393	Comodoro Pedro Zanni Airport	Pehuajo	Argentina	PEH	SAZP	America/Buenos_Aires
2394	Santa Rosa Airport	Santa Rosa	Argentina	RSA	SAZR	America/Argentina/Salta
2395	San Carlos De Bariloche Airport	San Carlos De Bariloche	Argentina	BRC	SAZS	America/Argentina/Salta
2396	Héroes De Malvinas Airport	Tandil	Argentina	TDL	SAZT	America/Buenos_Aires
2397	Villa Gesell Airport	Villa Gesell	Argentina	VLG	SAZV	America/Buenos_Aires
2398	Cutral-Co Airport	Cutralco	Argentina	CUT	SAZW	America/Argentina/Salta
2399	Aviador C. Campos Airport	San Martin Des Andes	Argentina	CPC	SAZY	America/Argentina/Salta
2400	Conceição do Araguaia Airport	Conceicao Do Araguaia	Brazil	CDJ	SBAA	America/Belem
2401	Campo Délio Jardim de Mattos Airport	Rio De Janeiro	Brazil		SBAF	America/Sao_Paulo
2402	Amapá Airport	Amapa	Brazil		SBAM	America/Fortaleza
2403	Araraquara Airport	Araracuara	Brazil	AQA	SBAQ	America/Sao_Paulo
2404	Santa Maria Airport	Aracaju	Brazil	AJU	SBAR	America/Fortaleza
2405	Assis	Assis	Brazil		SBAS	America/Sao_Paulo
2406	Piloto Osvaldo Marques Dias Airport	Alta Floresta	Brazil	AFL	SBAT	America/Campo_Grande
2407	Araçatuba Airport	Aracatuba	Brazil	ARU	SBAU	America/Sao_Paulo
2408	Val de Cans/Júlio Cezar Ribeiro International Airport	Belem	Brazil	BEL	SBBE	America/Belem
2409	Comandante Gustavo Kraemer Airport	Bage	Brazil	BGX	SBBG	America/Sao_Paulo
2410	Pampulha - Carlos Drummond de Andrade Airport	Belo Horizonte	Brazil	PLU	SBBH	America/Sao_Paulo
2411	Bacacheri Airport	Curitiba	Brazil	BFH	SBBI	America/Sao_Paulo
2412	Major Brigadeiro Doorgal Borges Airport	Barbacena	Brazil		SBBQ	America/Sao_Paulo
2413	Presidente Juscelino Kubistschek International Airport	Brasilia	Brazil	BSB	SBBR	America/Sao_Paulo
2414	Bauru Airport	Bauru	Brazil	BAU	SBBU	America/Sao_Paulo
2415	Atlas Brasil Cantanhede Airport	Boa Vista	Brazil	BVB	SBBV	America/Boa_Vista
2416	Barra do Garças Airport	Barra Do Garcas	Brazil	BPG	SBBW	America/Campo_Grande
2417	Cascavel Airport	Cascavel	Brazil	CAC	SBCA	America/Sao_Paulo
2418	Cachimbo Airport	Itaituba	Brazil		SBCC	America/Belem
2419	Tancredo Neves International Airport	Belo Horizonte	Brazil	CNF	SBCF	America/Sao_Paulo
2420	Campo Grande Airport	Campo Grande	Brazil	CGR	SBCG	America/Campo_Grande
2421	Serafin Enoss Bertaso Airport	Chapeco	Brazil	XAP	SBCH	America/Sao_Paulo
2422	Brig. Lysias Augusto Rodrigues Airport	Carolina	Brazil	CLN	SBCI	America/Fortaleza
2423	Diomício Freitas Airport	Criciuma	Brazil	CCM	SBCM	America/Sao_Paulo
2424	Canoas Air Force Base	Porto Alegre	Brazil		SBCO	America/Sao_Paulo
2425	Bartolomeu Lisandro Airport	Campos	Brazil	CAW	SBCP	America/Sao_Paulo
2426	Corumbá International Airport	Corumba	Brazil	CMG	SBCR	America/Campo_Grande
2427	Afonso Pena Airport	Curitiba	Brazil	CWB	SBCT	America/Sao_Paulo
2428	Caravelas Airport	Caravelas	Brazil	CRQ	SBCV	America/Fortaleza
2429	Hugo Cantergiani Regional Airport	Caxias Do Sul	Brazil	CXJ	SBCX	America/Sao_Paulo
2430	Marechal Rondon Airport	Cuiaba	Brazil	CGB	SBCY	America/Campo_Grande
2431	Cruzeiro do Sul Airport	Cruzeiro do Sul	Brazil	CZS	SBCZ	America/Rio_Branco
2432	Presidente Prudente Airport	President Prudente	Brazil	PPB	SBDN	America/Sao_Paulo
2433	Eduardo Gomes International Airport	Manaus	Brazil	MAO	SBEG	America/Boa_Vista
2434	Jacareacanga Airport	Jacare-acanga	Brazil	JCR	SBEK	America/Belem
2435	São Pedro da Aldeia Airport	Sao Pedro Da Aldeia	Brazil		SBES	America/Sao_Paulo
2436	Cataratas International Airport	Foz Do Iguacu	Brazil	IGU	SBFI	America/Sao_Paulo
2437	Hercílio Luz International Airport	Florianopolis	Brazil	FLN	SBFL	America/Sao_Paulo
2438	Fernando de Noronha Airport	Fernando Do Noronha	Brazil	FEN	SBFN	America/Fortaleza
2439	Fronteira	Fronteira	Brazil		SBFT	America/Sao_Paulo
2440	Furnas Airport	Alpinopolis	Brazil		SBFU	America/Sao_Paulo
4124	Key Field	Meridian	United States	MEI	KMEI	America/Chicago
2441	Pinto Martins International Airport	Fortaleza	Brazil	FOR	SBFZ	America/Fortaleza
2442	Rio Galeão – Tom Jobim International Airport	Rio De Janeiro	Brazil	GIG	SBGL	America/Sao_Paulo
2443	Guajará-Mirim Airport	Guajara-mirim	Brazil	GJM	SBGM	America/Boa_Vista
2444	Santa Genoveva Airport	Goiania	Brazil	GYN	SBGO	America/Sao_Paulo
2445	EMBRAER - Unidade Gavião Peixoto Airport	Macae	Brazil		SBGP	America/Sao_Paulo
2446	Guarulhos - Governador André Franco Montoro International Airport	Sao Paulo	Brazil	GRU	SBGR	America/Sao_Paulo
2447	Guaratinguetá Airport	Guaratingueta	Brazil	GUJ	SBGW	America/Sao_Paulo
2448	Altamira Airport	Altamira	Brazil	ATM	SBHT	America/Belem
2449	Itacoatiara Airport	Itaituba	Brazil	ITA	SBIC	America/Boa_Vista
2450	Itaituba Airport	Itaituba	Brazil	ITB	SBIH	America/Belem
2451	Bahia - Jorge Amado Airport	Ilheus	Brazil	IOS	SBIL	America/Fortaleza
2452	Usiminas Airport	Ipatinga	Brazil	IPN	SBIP	America/Sao_Paulo
2453	Francisco Vilela do Amaral Airport	Itumbiara	Brazil	ITR	SBIT	America/Sao_Paulo
2454	Prefeito Renato Moreira Airport	Imperatriz	Brazil	IMP	SBIZ	America/Fortaleza
2455	Belém/Brigadeiro Protásio de Oliveira Airport	Belem	Brazil		SBJC	America/Belem
2456	Francisco de Assis Airport	Juiz De Fora	Brazil	JDF	SBJF	America/Sao_Paulo
2457	Presidente Castro Pinto International Airport	Joao Pessoa	Brazil	JPA	SBJP	America/Fortaleza
2458	Lauro Carneiro de Loyola Airport	Joinville	Brazil	JOI	SBJV	America/Sao_Paulo
2459	Presidente João Suassuna Airport	Campina Grande	Brazil	CPV	SBKG	America/Fortaleza
2460	Viracopos International Airport	Campinas	Brazil	VCP	SBKP	America/Sao_Paulo
2461	Lages Airport	Lajes	Brazil	LAJ	SBLJ	America/Sao_Paulo
2462	Lins Airport	Lins	Brazil	LIP	SBLN	America/Sao_Paulo
2463	Governador José Richa Airport	Londrina	Brazil	LDB	SBLO	America/Sao_Paulo
2464	Bom Jesus da Lapa Airport	Bom Jesus Da Lapa	Brazil	LAZ	SBLP	America/Fortaleza
2465	Lagoa Santa Airport	Lagoa Santa	Brazil		SBLS	America/Sao_Paulo
2466	João Correa da Rocha Airport	Maraba	Brazil	MAB	SBMA	America/Belem
2467	Monte Dourado Airport	Almeirim	Brazil	MEU	SBMD	America/Belem
2468	Regional de Maringá - Sílvio Nane Junior Airport	Maringa	Brazil	MGF	SBMG	America/Sao_Paulo
2469	Mário Ribeiro Airport	Montes Claros	Brazil	MOC	SBMK	America/Sao_Paulo
2470	Ponta Pelada Airport	Manaus	Brazil	PLL	SBMN	America/Boa_Vista
2471	Zumbi dos Palmares Airport	Maceio	Brazil	MCZ	SBMO	America/Fortaleza
2472	Alberto Alcolumbre Airport	Macapa	Brazil	MCP	SBMQ	America/Fortaleza
2473	Dix-Sept Rosado Airport	Mocord	Brazil	MVF	SBMS	America/Fortaleza
2474	Campo de Marte Airport	Sao Paulo	Brazil		SBMT	America/Sao_Paulo
2475	Manicoré Airport	Manicore	Brazil	MNX	SBMY	America/Boa_Vista
2476	Ministro Victor Konder International Airport	Navegantes	Brazil	NVT	SBNF	America/Sao_Paulo
2477	Santo Ângelo Airport	Santo Angelo	Brazil	GEL	SBNM	America/Sao_Paulo
2478	Governador Aluízio Alves International Airport	Natal	Brazil	NAT	SBSG	America/Fortaleza
2479	Oiapoque Airport	Oioiapoque	Brazil	OYK	SBOI	America/Fortaleza
2480	Salgado Filho Airport	Porto Alegre	Brazil	POA	SBPA	America/Sao_Paulo
2481	Prefeito Doutor João Silva Filho Airport	Parnaiba	Brazil	PHB	SBPB	America/Fortaleza
2482	Poços de Caldas - Embaixador Walther Moreira Salles Airport	Pocos De Caldas	Brazil	POO	SBPC	America/Sao_Paulo
2483	Lauro Kurtz Airport	Passo Fundo	Brazil	PFB	SBPF	America/Sao_Paulo
2484	João Simões Lopes Neto International Airport	Pelotas	Brazil	PET	SBPK	America/Sao_Paulo
2485	Senador Nilo Coelho Airport	Petrolina	Brazil	PNZ	SBPL	America/Fortaleza
2486	Porto Nacional Airport	Porto Nacional	Brazil	PNB	SBPN	America/Fortaleza
2487	Ponta Porã Airport	Ponta Pora	Brazil	PMG	SBPP	America/Campo_Grande
2488	Governador Jorge Teixeira de Oliveira Airport	Porto Velho	Brazil	PVH	SBPV	America/Boa_Vista
2489	Plácido de Castro Airport	Rio Branco	Brazil	RBR	SBRB	America/Rio_Branco
2490	Guararapes - Gilberto Freyre International Airport	Recife	Brazil	REC	SBRF	America/Fortaleza
2491	Rio Grande	Rio Grande	Brazil	RIG	SBRG	America/Sao_Paulo
2492	Santos Dumont Airport	Rio De Janeiro	Brazil	SDU	SBRJ	America/Sao_Paulo
2493	Leite Lopes Airport	Ribeirao Preto	Brazil	RAO	SBRP	America/Sao_Paulo
2494	Santa Cruz Air Force Base	Rio De Janeiro	Brazil	SNZ	SBSC	America/Sao_Paulo
2495	Professor Urbano Ernesto Stumpf Airport	Sao Jose Dos Campos	Brazil	SJK	SBSJ	America/Sao_Paulo
2496	Marechal Cunha Machado International Airport	Sao Luis	Brazil	SLZ	SBSL	America/Fortaleza
2497	Congonhas Airport	Sao Paulo	Brazil	CGH	SBSP	America/Sao_Paulo
2498	Prof. Eribelto Manoel Reino State Airport	Sao Jose Do Rio Preto	Brazil	SJP	SBSR	America/Sao_Paulo
2499	Base Aérea de Santos Airport	Santos	Brazil	SSZ	SBST	America/Sao_Paulo
2500	Deputado Luiz Eduardo Magalhães International Airport	Salvador	Brazil	SSA	SBSV	America/Fortaleza
2501	Trombetas Airport	Oriximina	Brazil	TMT	SBTB	America/Belem
2502	Senador Petrônio Portela Airport	Teresina	Brazil	THE	SBTE	America/Fortaleza
2503	Tefé Airport	Tefe	Brazil	TFF	SBTF	America/Boa_Vista
2504	Tarauacá Airport	Tarauaca	Brazil	TRQ	SBTK	America/Rio_Branco
2505	Telêmaco Borba Airport	Telemaco Borba	Brazil	TEC	SBTL	America/Sao_Paulo
2506	Tiriós Airport	Obidos Tirios	Brazil		SBTS	America/Belem
2507	Tabatinga Airport	Tabatinga	Brazil	TBT	SBTT	America/Boa_Vista
2508	Tucuruí Airport	Tucurui	Brazil	TUR	SBTU	America/Belem
2509	São Gabriel da Cachoeira Airport	Sao Gabriel	Brazil	SJL	SBUA	America/Boa_Vista
2510	Paulo Afonso Airport	Paulo Alfonso	Brazil	PAV	SBUF	America/Fortaleza
2511	Rubem Berta Airport	Uruguaiana	Brazil	URG	SBUG	America/Sao_Paulo
2512	Ten. Cel. Aviador César Bombonato Airport	Uberlandia	Brazil	UDI	SBUL	America/Sao_Paulo
2513	Urubupunga	Castilho	Brazil		SBUP	America/Sao_Paulo
2514	Mário de Almeida Franco Airport	Uberaba	Brazil	UBA	SBUR	America/Sao_Paulo
2515	Major Brigadeiro Trompowsky Airport	Varginha	Brazil	VAG	SBVG	America/Sao_Paulo
2516	Brigadeiro Camarão Airport	Vilhena	Brazil	BVH	SBVH	America/Boa_Vista
2517	Eurico de Aguiar Salles Airport	Vitoria	Brazil	VIX	SBVT	America/Sao_Paulo
2518	Iauaretê Airport	Iauarete	Brazil		SBYA	America/Boa_Vista
2519	Campo Fontenelle Airport	Piracununga	Brazil	QPS	SBYS	America/Sao_Paulo
2520	Chacalluta Airport	Arica	Chile	ARI	SCAR	America/Santiago
2521	Balmaceda Airport	Balmaceda	Chile	BBA	SCBA	America/Santiago
2522	El Bosque Airport	Santiago	Chile		SCBQ	America/Santiago
2523	Chile Chico Airport	Chile Chico	Chile	CCH	SCCC	America/Santiago
2524	El Loa Airport	Calama	Chile	CJC	SCCF	America/Santiago
2525	Gral. Bernardo O´Higgins Airport	Chillan	Chile	YAI	SCCH	America/Santiago
2526	Pdte. Carlos Ibañez del Campo Airport	Punta Arenas	Chile	PUQ	SCCI	America/Santiago
2527	Teniente Vidal Airport	Coyhaique	Chile	GXQ	SCCY	America/Santiago
2528	Diego Aracena Airport	Iquique	Chile	IQQ	SCDA	America/Santiago
2529	Comodoro Arturo Merino Benítez International Airport	Santiago	Chile	SCL	SCEL	America/Santiago
2530	Andrés Sabella Gálvez International Airport	Antofagasta	Chile	ANF	SCFA	America/Santiago
2531	Capitan Fuentes Martinez Airport Airport	Porvenir	Chile	WPR	SCFM	America/Santiago
2532	Futaleufú Airport	Futaleufu	Chile	FFU	SCFT	America/Santiago
2533	María Dolores Airport	Los Angeles	Chile	LSQ	SCGE	America/Santiago
2534	Guardiamarina Zañartu Airport	Puerto Williams	Chile	WPU	SCGZ	America/Santiago
2535	Carriel Sur Airport	Concepcion	Chile	CCP	SCIE	America/Santiago
2536	Mataveri Airport	Easter Island	Chile	IPC	SCIP	Pacific/Easter
2537	Cañal Bajo Carlos - Hott Siebert Airport	Osorno	Chile	ZOS	SCJO	America/Santiago
2538	Vallenar Airport	Vallenar	Chile	VLR	SCLL	America/Santiago
2539	De La Independencia Airport	Rancagua	Chile	QRC	SCRG	America/Santiago
2540	Teniente Rodolfo Marsh Martin Base	Isla Rey Jorge	Antarctica	TNM	SCRM	Antarctica/South_Pole
2541	La Florida Airport	La Serena	Chile	LSC	SCSE	America/Santiago
2542	Eulogio Sánchez Airport	Santiago	Chile		SCTB	America/Santiago
2543	Maquehue Airport	Temuco	Chile	PZS	SCTC	America/Santiago
2544	El Tepual Airport	Puerto Montt	Chile	PMC	SCTE	America/Santiago
2545	Chaitén Airport	Chaiten	Chile	WCH	SCTN	America/Santiago
2546	Pichoy Airport	Valdivia	Chile	ZAL	SCVD	America/Santiago
2547	Chachoán Airport	Ambato	Ecuador	ATF	SEAM	America/Guayaquil
2548	Hacienda Clementina Airport	Clementia	Ecuador		SECM	America/Guayaquil
2549	Francisco De Orellana Airport	Coca	Ecuador	OCC	SECO	America/Guayaquil
2550	Mariscal Lamar Airport	Cuenca	Ecuador	CUE	SECU	America/Guayaquil
2551	Seymour Airport	Galapagos	Ecuador	GPS	SEGS	Pacific/Galapagos
2552	José Joaquín de Olmedo International Airport	Guayaquil	Ecuador	GYE	SEGU	America/Guayaquil
2553	Gualaquiza Airport	Gualaquiza	Ecuador		SEGZ	America/Guayaquil
2554	Atahualpa Airport	Ibarra	Ecuador		SEIB	America/Guayaquil
2555	Km 192 Airport	Km-192	Ecuador		SEKK	America/Guayaquil
2556	Hacienda La Julia Airport	La Julia	Ecuador		SELJ	America/Guayaquil
2557	Cotopaxi International Airport	Latacunga	Ecuador	LTX	SELT	America/Guayaquil
2558	Jose Maria Velasco Ibarra Airport	Macara	Ecuador	MRR	SEMA	America/Guayaquil
2559	Coronel E Carvajal Airport	Macas	Ecuador	XMS	SEMC	America/Guayaquil
2560	General Manuel Serrano Airport	Machala	Ecuador	MCH	SEMH	America/Guayaquil
2561	El Carmen Airport	Montalvo	Ecuador		SEMO	America/Guayaquil
2562	Eloy Alfaro International Airport	Manta	Ecuador	MEC	SEMT	America/Guayaquil
2563	Maragrosa Airport	Maragrosa	Ecuador		SEMX	America/Guayaquil
2564	Amable Calle Gutierrez Airport	Pasaje	Ecuador		SEPS	America/Guayaquil
2565	Reales Tamarindos Airport	Portoviejo	Ecuador	PVO	SEPV	America/Guayaquil
2566	Quevedo Airport	Quevedo	Ecuador		SEQE	America/Guayaquil
2567	Mariscal Sucre International Airport	Quito	Ecuador	UIO	SEQM	America/Guayaquil
2568	Chimborazo Airport	Riobamba	Ecuador		SERB	America/Guayaquil
2569	Santa Rosa International Airport	Santa Rosa	Ecuador	ETR	SERO	America/Guayaquil
2570	General Ulpiano Paez Airport	Salinas	Ecuador	SNC	SESA	America/Guayaquil
2571	Santo Domingo de Los Colorados Airport	Santo Domingo	Ecuador		SESD	America/Guayaquil
2572	Taura Airport	Taura	Ecuador		SETA	America/Guayaquil
2573	Mayor Galo Torres Airport	Tena	Ecuador		SETE	America/Guayaquil
2574	Tarapoa Airport	Tarapoa	Ecuador	TPC	SETR	America/Guayaquil
2575	Teniente Coronel Luis a Mantilla Airport	Tulcan	Ecuador	TUA	SETU	America/Guayaquil
2576	Silvio Pettirossi International Airport	Asuncion	Paraguay	ASU	SGAS	America/Asuncion
2577	Juan De Ayolas Airport	Ayolas	Paraguay	AYO	SGAY	America/Asuncion
2578	Teniente Col Carmelo Peralta Airport	Conception	Paraguay	CIO	SGCO	America/Asuncion
2579	Itaipú Airport	Itaipu	Paraguay		SGIB	America/Asuncion
2580	Dr. Luis Maria Argaña International Airport	Mariscal Estigarribia	Paraguay	ESG	SGME	America/Asuncion
2581	Carlos Miguel Gimenez Airport	Pilar	Paraguay	PIL	SGPI	America/Asuncion
2582	El Eden Airport	Armenia	Colombia	AXM	SKAR	America/Bogota
2583	Tres De Mayo Airport	Puerto Asis	Colombia	PUU	SKAS	America/Bogota
2584	Las Flores Airport	El Banco	Colombia	ELB	SKBC	America/Bogota
2585	Palonegro Airport	Bucaramanga	Colombia	BGA	SKBG	America/Bogota
2586	El Dorado International Airport	Bogota	Colombia	BOG	SKBO	America/Bogota
2587	Ernesto Cortissoz International Airport	Barranquilla	Colombia	BAQ	SKBQ	America/Bogota
2588	José Celestino Mutis Airport	Bahia Solano	Colombia	BSC	SKBS	America/Bogota
2589	Gerardo Tobar López Airport	Buenaventura	Colombia	BUN	SKBU	America/Bogota
2590	Camilo Daza International Airport	Cucuta	Colombia	CUC	SKCC	America/Bogota
2591	Rafael Nuñez International Airport	Cartagena	Colombia	CTG	SKCG	America/Bogota
2592	Alfonso Bonilla Aragon International Airport	Cali	Colombia	CLO	SKCL	America/Bogota
2593	La Florida Airport	Tumaco	Colombia	TCO	SKCO	America/Bogota
2594	Las Brujas Airport	Corozal	Colombia	CZU	SKCZ	America/Bogota
2595	Yariguíes Airport	Barrancabermeja	Colombia	EJA	SKEJ	America/Bogota
2596	Gustavo Artunduaga Paredes Airport	Florencia	Colombia	FLA	SKFL	America/Bogota
2597	Santiago Vila Airport	Girardot	Colombia	GIR	SKGI	America/Bogota
2598	Juan Casiano Airport	Guapi	Colombia	GPI	SKGP	America/Bogota
2599	Guaymaral Airport	Guaymaral	Colombia		SKGY	America/Bogota
2600	Perales Airport	Ibague	Colombia	IBE	SKIB	America/Bogota
2601	San Luis Airport	Ipiales	Colombia	IPI	SKIP	America/Bogota
2602	Antonio Roldan Betancourt Airport	Carepa	Colombia	APO	SKLC	America/Bogota
2603	Jorge Isaac Airport	La Mina	Colombia	MCJ	SKLM	America/Bogota
2604	Alfredo Vásquez Cobo International Airport	Leticia	Colombia	LET	SKLT	America/Bogota
2605	Enrique Olaya Herrera Airport	Medellin	Colombia	EOH	SKMD	America/Bogota
2606	Baracoa Airport	Magangue	Colombia	MGN	SKMG	America/Bogota
2607	Los Garzones Airport	Monteria	Colombia	MTR	SKMR	America/Bogota
2608	Fabio Alberto Leon Bentley Airport	Mitu	Colombia	MVP	SKMU	America/Bogota
2609	La Nubia Airport	Manizales	Colombia	MZL	SKMZ	America/Bogota
2610	Benito Salas Airport	Neiva	Colombia	NVA	SKNV	America/Bogota
2611	Aguas Claras Airport	Ocana	Colombia	OCV	SKOC	America/Bogota
2612	Otu Airport	Otu	Colombia	OTU	SKOT	America/Bogota
2613	Puerto Bolívar Airport	Puerto Bolivar	Colombia		SKPB	America/Bogota
2614	German Olano Airport	Puerto Carreno	Colombia	PCR	SKPC	America/Bogota
2615	Matecaña International Airport	Pereira	Colombia	PEI	SKPE	America/Bogota
2616	Pitalito Airport	Pitalito	Colombia	PTX	SKPI	America/Bogota
2617	Guillermo León Valencia Airport	Popayan	Colombia	PPN	SKPP	America/Bogota
2618	Antonio Narino Airport	Pasto	Colombia	PSO	SKPS	America/Bogota
2619	El Embrujo Airport	Providencia	Colombia	PVA	SKPV	America/Bogota
2620	Mariquita Airport	Mariquita	Colombia	MQU	SKQU	America/Bogota
2621	Jose Maria Córdova International Airport	Rio Negro	Colombia	MDE	SKRG	America/Bogota
2622	Almirante Padilla Airport	Rio Hacha	Colombia	RCH	SKRH	America/Bogota
2623	Jorge E. Gonzalez Torres Airport	San Jose Del Guaviare	Colombia	SJE	SKSJ	America/Bogota
2624	Simón Bolívar International Airport	Santa Marta	Colombia	SMR	SKSM	America/Bogota
2625	Gustavo Rojas Pinilla International Airport	San Andres Island	Colombia	ADZ	SKSP	America/Bogota
2626	Eduardo Falla Solano Airport	San Vincente De Caguan	Colombia	SVI	SKSV	America/Bogota
2627	Gustavo Vargas Airport	Tame	Colombia	TME	SKTM	America/Bogota
2628	Santiago Perez Airport	Arauca	Colombia	AUC	SKUC	America/Bogota
2629	El Caraño Airport	Quibdo	Colombia	UIB	SKUI	America/Bogota
2630	Heriberto Gíl Martínez Airport	Tulua	Colombia	ULQ	SKUL	America/Bogota
2631	Alfonso López Pumarejo Airport	Valledupar	Colombia	VUP	SKVP	America/Bogota
2632	Vanguardia Airport	Villavicencio	Colombia	VVC	SKVV	America/Bogota
2633	Bermejo Airport	Bermejo	Bolivia	BJO	SLBJ	America/La_Paz
2634	Jorge Wilsterman International Airport	Cochabamba	Bolivia	CBB	SLCB	America/La_Paz
2635	Chimore Airport	Chapacura	Bolivia	CCA	SLCH	America/La_Paz
2636	Capitán Aníbal Arab Airport	Cobija	Bolivia	CIJ	SLCO	America/La_Paz
2637	El Alto International Airport	La Paz	Bolivia	LPB	SLLP	America/La_Paz
2638	Juan Mendoza Airport	Oruro	Bolivia	ORU	SLOR	America/La_Paz
2639	Capitan Nicolas Rojas Airport	Potosi	Bolivia	POI	SLPO	America/La_Paz
2640	Capitán Av. Salvador Ogaya G. airport	Puerto Suarez	Bolivia	PSZ	SLPS	America/La_Paz
2641	Santa Ana Del Yacuma Airport	Santa Ana	Bolivia	SBL	SLSA	America/La_Paz
2642	Juana Azurduy De Padilla Airport	Sucre	Bolivia	SRE	SLSU	America/La_Paz
2643	Capitan Oriel Lea Plaza Airport	Tarija	Bolivia	TJA	SLTJ	America/La_Paz
2644	Teniente Av. Jorge Henrich Arauz Airport	Trinidad	Bolivia	TDD	SLTR	America/La_Paz
2645	Teniente Coronel Rafael Pabón Airport	Villa Montes	Bolivia	VLM	SLVM	America/La_Paz
2646	Viru Viru International Airport	Santa Cruz	Bolivia	VVI	SLVR	America/La_Paz
2647	Yacuiba Airport	Yacuiba	Bolivia	BYC	SLYA	America/La_Paz
2648	Johan Adolf Pengel International Airport	Zandery	Suriname	PBM	SMJP	America/Paramaribo
2649	Cayenne-Rochambeau Airport	Cayenne	French Guiana	CAY	SOCA	America/Cayenne
2650	Saint-Georges-de-l'Oyapock Airport	St.-georges Oyapock	French Guiana	OYP	SOOG	America/Cayenne
2651	Huancabamba Airport	Huancabamba	Peru		SPAB	America/Lima
2652	Alferez FAP Alfredo Vladimir Sara Bauer Airport	Andoas	Peru	AOP	SPAS	America/Lima
2653	Teniente General Gerardo Pérez Pinedo Airport	Atalaya	Peru		SPAY	America/Lima
2654	Iberia Airport	Iberia	Peru	IBP	SPBR	America/Lima
2655	Cap FAP David Abenzur Rengifo International Airport	Pucallpa	Peru	PCL	SPCL	America/Lima
2656	Teniente FAP Jaime A De Montreuil Morales Airport	Chimbote	Peru	CHM	SPEO	America/Lima
2657	Puerto Esperanza Airport	Puerto Esperanza	Peru		SPEP	America/Lima
2658	Cesar Torke Podesta Airport	Moquegua	Peru		SPEQ	America/Lima
2659	Capitan FAP Jose A Quinones Gonzales International Airport	Chiclayo	Peru	CIX	SPHI	America/Lima
2660	Coronel FAP Alfredo Mendivil Duarte Airport	Ayacucho	Peru	AYP	SPHO	America/Lima
2661	Andahuaylas Airport	Andahuaylas	Peru	ANS	SPHY	America/Lima
2662	Comandante FAP German Arias Graziani Airport	Anta	Peru	ATA	SPHZ	America/Lima
2663	Jorge Chávez International Airport	Lima	Peru	LIM	SPIM	America/Lima
2664	Juanjui Airport	Juanjui	Peru	JJI	SPJI	America/Lima
2665	Francisco Carle Airport	Jauja	Peru	JAU	SPJJ	America/Lima
2666	Inca Manco Capac International Airport	Juliaca	Peru	JUL	SPJL	America/Lima
2667	Ilo Airport	Ilo	Peru	ILQ	SPLO	America/Lima
2668	Las Palmas Air Base	Las Palmas	Peru		SPLP	America/Lima
2669	Capitan FAP Pedro Canga Rodriguez Airport	Tumbes	Peru	TBP	SPME	America/Lima
2670	Moises Benzaquen Rengifo Airport	Yurimaguas	Peru	YMS	SPMS	America/Lima
2671	Collique Airport	Collique	Peru		SPOL	America/Lima
2672	Chachapoyas Airport	Chachapoyas	Peru	CHH	SPPY	America/Lima
2673	Coronel FAP Francisco Secada Vignetta International Airport	Iquitos	Peru	IQT	SPQT	America/Lima
2674	Rodríguez Ballón International Airport	Arequipa	Peru	AQP	SPQU	America/Lima
2675	Capitán FAP Leonardo Alvariño Herr Airport	San Ramon	Peru		SPRM	America/Lima
2676	Capitan FAP Carlos Martinez De Pinillos International Airport	Trujillo	Peru	TRU	SPRU	America/Lima
2677	Capitán FAP Renán Elías Olivera International Airport	Pisco	Peru	PIO	SPSO	America/Lima
2678	Cadete FAP Guillermo Del Castillo Paredes Airport	Tarapoto	Peru	TPP	SPST	America/Lima
2679	Coronel FAP Carlos Ciriani Santa Rosa International Airport	Tacna	Peru	TCQ	SPTN	America/Lima
2680	Padre Aldamiz International Airport	Puerto Maldonado	Peru	PEM	SPTU	America/Lima
2681	Capitán FAP Guillermo Concha Iberico International Airport	Piura	Peru	PIU	SPUR	America/Lima
2682	Capitan Montes Airport	Talara	Peru	TYL	SPYL	America/Lima
2683	Alejandro Velasco Astete International Airport	Cuzco	Peru	CUZ	SPZO	America/Lima
2684	Angel S Adami Airport	Montevideo	Uruguay		SUAA	America/Montevideo
2685	Santa Bernardina International Airport	Durazno	Uruguay	DZO	SUDU	America/Montevideo
2686	Carrasco International /General C L Berisso Airport	Montevideo	Uruguay	MVD	SUMU	America/Montevideo
2687	Nueva Hesperides International Airport	Salto	Uruguay	STY	SUSO	America/Montevideo
2688	Oswaldo Guevara Mujica Airport	Acarigua	Venezuela	AGV	SVAC	America/Caracas
2689	Anaco Airport	Anaco	Venezuela	AAO	SVAN	America/Caracas
2690	San Fernando de Atabapo Airport	San Fernando Deatabapo	Venezuela		SVAT	America/Caracas
2691	General José Antonio Anzoategui International Airport	Barcelona	Venezuela	BLA	SVBC	America/Caracas
2692	Barinas Airport	Barinas	Venezuela	BNS	SVBI	America/Caracas
2693	El Libertador Airbase	Maracaibo	Venezuela		SVBL	America/Caracas
2694	Barquisimeto International Airport	Barquisimeto	Venezuela	BRM	SVBM	America/Caracas
2695	Aeropuerto ""General Tomas de Heres"". Ciudad Bolivar	Ciudad Bolivar	Venezuela	CBL	SVCB	America/Caracas
2696	Caicara del Orinoco Airport	Caicara De Orinoco	Venezuela	CXA	SVCD	America/Caracas
2697	San Carlos Airport	San Carlos	Venezuela		SVCJ	America/Caracas
2698	Calabozo Airport	Calabozo	Venezuela	CLZ	SVCL	America/Caracas
2699	Canaima Airport	Canaima	Venezuela	CAJ	SVCN	America/Caracas
2700	Carora Airport	Carora	Venezuela	VCR	SVCO	America/Caracas
2701	General Francisco Bermúdez Airport	Carupano	Venezuela	CUP	SVCP	America/Caracas
2702	José Leonardo Chirinos Airport	Coro	Venezuela	CZE	SVCR	America/Caracas
2703	Oscar Machado Zuluaga Airport	Caracas	Venezuela		SVCS	America/Caracas
2704	Cumaná (Antonio José de Sucre) Airport	Cumana	Venezuela	CUM	SVCU	America/Caracas
2705	Capitán Manuel Ríos Airbase	Carrizal	Venezuela		SVCZ	America/Caracas
2706	El Dorado Airport	El Dorado	Venezuela	EOR	SVED	America/Caracas
2707	Elorza Airport	Elorza	Venezuela	EOZ	SVEZ	America/Caracas
2708	Guasdalito Airport	Guasdualito	Venezuela	GDO	SVGD	America/Caracas
2709	Guiria Airport	Guiria	Venezuela	GUI	SVGI	America/Caracas
2710	Guanare Airport	Guanare	Venezuela	GUQ	SVGU	America/Caracas
2711	Higuerote Airport	Higuerote	Venezuela	HGE	SVHG	America/Caracas
2712	Andrés Miguel Salazar Marcano Airport	Isla De Coche	Venezuela	ICC	SVIE	America/Caracas
2713	Josefa Camejo International Airport	Paraguana	Venezuela	LSP	SVJC	America/Caracas
2714	San Juan de Los Morros Airport	San Juan De Los Morros	Venezuela		SVJM	America/Caracas
2715	La Fria Airport	La Fria	Venezuela	LFR	SVLF	America/Caracas
2716	La Orchila Airport	La Orchila	Venezuela		SVLO	America/Caracas
2717	La Chinita International Airport	Maracaibo	Venezuela	MAR	SVMC	America/Caracas
2718	Alberto Carnevalli Airport	Merida	Venezuela	MRD	SVMD	America/Caracas
2719	Del Caribe Santiago Mariño International Airport	Porlamar	Venezuela	PMV	SVMG	America/Caracas
2720	Simón Bolívar International Airport	Caracas	Venezuela	CCS	SVMI	America/Caracas
2721	Maturín Airport	Maturin	Venezuela	MUN	SVMT	America/Caracas
2722	Cacique Aramare Airport	Puerto Ayacucho	Venezuela	PYH	SVPA	America/Caracas
2723	General Bartolome Salom International Airport	Puerto Cabello	Venezuela	PBL	SVPC	America/Caracas
2724	Paramillo Airport	San Cristobal	Venezuela	SCI	SVPM	America/Caracas
2725	General Manuel Carlos Piar International Airport	Guayana	Venezuela	PZO	SVPR	America/Caracas
2726	Palmarito Airport	Palmarito	Venezuela	PTM	SVPT	America/Caracas
2727	San Antonio Del Tachira Airport	San Antonio	Venezuela	SVZ	SVSA	America/Caracas
2728	Santa Bárbara de Barinas Airport	Santa Barbara	Venezuela	SBB	SVSB	America/Caracas
2729	Santa Elena de Uairen Airport	Santa Ana De Uairen	Venezuela	SNV	SVSE	America/Caracas
2730	Mayor Buenaventura Vivas International Airport	Santo Domingo	Venezuela	STD	SVSO	America/Caracas
2731	Sub Teniente Nestor Arias Airport	San Felipe	Venezuela	SNF	SVSP	America/Caracas
2732	San Fernando De Apure Airport	San Fernando De Apure	Venezuela	SFD	SVSR	America/Caracas
2733	San Tomé Airport	San Tome	Venezuela	SOM	SVST	America/Caracas
2734	Santa Bárbara del Zulia Airport	Santa Barbara	Venezuela	STB	SVSZ	America/Caracas
2735	Tucupita Airport	Tucupita	Venezuela	TUV	SVTC	America/Caracas
2736	Tumeremo Airport	Tumeremo	Venezuela	TMO	SVTM	America/Caracas
2737	Arturo Michelena International Airport	Valencia	Venezuela	VLN	SVVA	America/Caracas
2738	Dr. Antonio Nicolás Briceño Airport	Valera	Venezuela	VLV	SVVL	America/Caracas
2739	Valle de La Pascua Airport	Valle De La Pascua	Venezuela	VDP	SVVP	America/Caracas
2740	Linden Airport	Linden	Guyana		SYLD	America/Guyana
2741	Lethem Airport	Lethem	Guyana	LTM	SYLT	America/Guyana
2742	V.C. Bird International Airport	Antigua	Antigua and Barbuda	ANU	TAPA	America/Antigua
2743	Sir Grantley Adams International Airport	Bridgetown	Barbados	BGI	TBPB	America/Barbados
2744	Canefield Airport	Canefield	Dominica	DCF	TDCF	America/Dominica
2745	Douglas-Charles Airport	Dominica	Dominica	DOM	TDPD	America/Dominica
2746	Martinique Aimé Césaire International Airport	Fort-de-france	Martinique	FDF	TFFF	America/Martinique
2747	L'Espérance Airport	St. Martin	Guadeloupe	SFG	TFFG	
2748	Pointe-à-Pitre Le Raizet	Pointe-a-pitre	Guadeloupe	PTP	TFFR	America/Guadeloupe
2749	Point Salines International Airport	Point Salines	Grenada	GND	TGPY	America/Grenada
2750	Cyril E. King Airport	St. Thomas	Virgin Islands	STT	TIST	America/St_Thomas
2751	Henry E Rohlsen Airport	St. Croix Island	Virgin Islands	STX	TISX	America/St_Thomas
2752	Rafael Hernandez Airport	Aguadilla	Puerto Rico	BQN	TJBQ	America/Puerto_Rico
2753	Diego Jimenez Torres Airport	Fajardo	Puerto Rico	FAJ	TJFA	America/Puerto_Rico
2754	Fernando Luis Ribas Dominicci Airport	San Juan	Puerto Rico	SIG	TJIG	America/Puerto_Rico
2755	Eugenio Maria De Hostos Airport	Mayaguez	Puerto Rico	MAZ	TJMZ	America/Puerto_Rico
2756	Mercedita Airport	Ponce	Puerto Rico	PSE	TJPS	America/Puerto_Rico
2757	Luis Munoz Marin International Airport	San Juan	Puerto Rico	SJU	TJSJ	America/Puerto_Rico
2758	Robert L. Bradshaw International Airport	Basse Terre	Saint Kitts and Nevis	SKB	TKPK	America/St_Kitts
2759	George F. L. Charles Airport	Castries	Saint Lucia	SLU	TLPC	America/St_Lucia
2760	Hewanorra International Airport	Hewandorra	Saint Lucia	UVF	TLPL	America/St_Lucia
2761	Queen Beatrix International Airport	Oranjestad	Aruba	AUA	TNCA	America/Aruba
2762	Flamingo International Airport	Kralendijk	Netherlands Antilles	BON	TNCB	America/Curacao
2763	Hato International Airport	Willemstad	Netherlands Antilles	CUR	TNCC	America/Curacao
2764	F. D. Roosevelt Airport	Oranjestad	Netherlands Antilles	EUX	TNCE	America/Curacao
2765	Princess Juliana International Airport	Philipsburg	Netherlands Antilles	SXM	TNCM	America/Curacao
2766	Clayton J Lloyd International Airport	The Valley	Anguilla	AXA	TQPF	America/Anguilla
2767	Tobago-Crown Point Airport	Scarborough	Trinidad and Tobago	TAB	TTCP	America/Port_of_Spain
2768	Piarco International Airport	Port-of-spain	Trinidad and Tobago	POS	TTPP	America/Port_of_Spain
2769	Terrance B. Lettsome International Airport	Tortola	British Virgin Islands	EIS	TUPJ	America/Tortola
2770	Canouan Airport	Canouan Island	Saint Vincent and the Grenadines	CIW	TVSC	America/St_Vincent
2771	Mustique Airport	Mustique	Saint Vincent and the Grenadines	MQS	TVSM	America/St_Vincent
2772	Argyle International Airport	Kingstown	Saint Vincent and the Grenadines	SVD	TVSA	America/St_Vincent
2773	Almaty Airport	Alma-ata	Kazakhstan	ALA	UAAA	Asia/Qyzylorda
2774	Balkhash Airport	Balkhash	Kazakhstan	BXH	UAAH	Asia/Qyzylorda
2775	Astana International Airport	Tselinograd	Kazakhstan	TSE	UACC	Asia/Qyzylorda
2776	Taraz Airport	Dzhambul	Kazakhstan	DMB	UADD	Asia/Qyzylorda
2777	Manas International Airport	Bishkek	Kyrgyzstan	FRU	UAFM	Asia/Bishkek
2778	Osh Airport	Osh	Kyrgyzstan	OSS	UAFO	Asia/Bishkek
2779	Shymkent Airport	Chimkent	Kazakhstan	CIT	UAII	Asia/Qyzylorda
2780	Uralsk Airport	Uralsk	Kazakhstan	URA	UARR	Asia/Oral
2781	Pavlodar Airport	Pavlodar	Kazakhstan	PWQ	UASP	Asia/Qyzylorda
2782	Semipalatinsk Airport	Semiplatinsk	Kazakhstan	PLX	UASS	Asia/Qyzylorda
2783	Aktobe Airport	Aktyubinsk	Kazakhstan	AKX	UATT	Asia/Oral
2784	Heydar Aliyev International Airport	Baku	Azerbaijan	GYD	UBBB	Asia/Baku
2785	Yakutsk Airport	Yakutsk	Russia	YKS	UEEE	Asia/Yakutsk
2786	Mirny Airport	Mirnyj	Russia	MJZ	UERR	Asia/Yakutsk
2787	Ignatyevo Airport	Blagoveschensk	Russia	BQS	UHBB	Asia/Yakutsk
2788	Khabarovsk-Novy Airport	Khabarovsk	Russia	KHV	UHHH	Asia/Vladivostok
2789	Provideniya Bay Airport	Provideniya Bay	Russia	PVS	UHMD	Asia/Anadyr
2790	Sokol Airport	Magadan	Russia	GDX	UHMM	Asia/Srednekolymsk
2791	Pevek Airport	Pevek	Russia	PWE	UHMP	
2792	Yelizovo Airport	Petropavlovsk	Russia	PKC	UHPP	Asia/Anadyr
2793	Yuzhno-Sakhalinsk Airport	Yuzhno-sakhalinsk	Russia	UUS	UHSS	Asia/Srednekolymsk
2794	Vladivostok International Airport	Vladivostok	Russia	VVO	UHWW	Asia/Vladivostok
2795	Chita-Kadala Airport	Chita	Russia	HTA	UIAA	Asia/Yakutsk
2796	Bratsk Airport	Bratsk	Russia	BTK	UIBB	Asia/Irkutsk
2797	Irkutsk Airport	Irkutsk	Russia	IKT	UIII	Asia/Irkutsk
2798	Ulan-Ude Airport (Mukhino)	Ulan-ude	Russia	UUD	UIUU	Asia/Irkutsk
2799	Boryspil International Airport	Kiev	Ukraine	KBP	UKBB	Europe/Kiev
2800	Donetsk International Airport	Donetsk	Ukraine	DOK	UKCC	Europe/Kiev
2801	Dnipropetrovsk International Airport	Dnepropetrovsk	Ukraine	DNK	UKDD	Europe/Kiev
2802	Simferopol International Airport	Simferopol	Ukraine	SIP	UKFF	Europe/Simferopol
2803	Kiev Zhuliany International Airport	Kiev	Ukraine	IEV	UKKK	Europe/Kiev
2804	Lviv International Airport	Lvov	Ukraine	LWO	UKLL	Europe/Kiev
2805	Odessa International Airport	Odessa	Ukraine	ODS	UKOO	Europe/Kiev
2806	Pulkovo Airport	St. Petersburg	Russia	LED	ULLI	Europe/Moscow
2807	Murmansk Airport	Murmansk	Russia	MMK	ULMM	Europe/Moscow
2808	Gomel Airport	Gomel	Belarus	GME	UMGG	Europe/Minsk
2809	Vitebsk Vostochny Airport	Vitebsk	Belarus	VTB	UMII	Europe/Minsk
2810	Khrabrovo Airport	Kaliningrad	Russia	KGD	UMKK	Europe/Kaliningrad
2811	Minsk 1 Airport	Minsk	Belarus	MHP	UMMM	Europe/Minsk
2812	Minsk National Airport	Minsk 2	Belarus	MSQ	UMMS	Europe/Minsk
2813	Abakan Airport	Abakan	Russia	ABA	UNAA	Asia/Krasnoyarsk
2814	Barnaul Airport	Barnaul	Russia	BAX	UNBB	Asia/Krasnoyarsk
2815	Kemerovo Airport	Kemorovo	Russia	KEJ	UNEE	Asia/Krasnoyarsk
2816	Omsk Central Airport	Omsk	Russia	OMS	UNOO	Asia/Omsk
2817	Krasnodar Pashkovsky International Airport	Krasnodar	Russia	KRR	URKK	Europe/Moscow
2818	Uytash Airport	Makhachkala	Russia	MCX	URML	Europe/Moscow
2819	Mineralnyye Vody Airport	Mineralnye Vody	Russia	MRV	URMM	Europe/Moscow
2820	Stavropol Shpakovskoye Airport	Stavropol	Russia	STW	URMT	Europe/Moscow
2821	Platov International Airport	Rostov	Russia	ROV	URRP	Europe/Moscow
2822	Sochi International Airport	Sochi	Russia	AER	URSS	Europe/Moscow
2823	Astrakhan Airport	Astrakhan	Russia	ASF	URWA	Europe/Samara
2824	Volgograd International Airport	Volgograd	Russia	VOG	URWW	Europe/Moscow
2825	Chelyabinsk Balandino Airport	Chelyabinsk	Russia	CEK	USCC	Asia/Yekaterinburg
2826	Magnitogorsk International Airport	Magnetiogorsk	Russia	MQF	USCM	Asia/Yekaterinburg
2827	Nizhnevartovsk Airport	Nizhnevartovsk	Russia	NJC	USNN	Asia/Yekaterinburg
2828	Bolshoye Savino Airport	Perm	Russia	PEE	USPP	Asia/Yekaterinburg
2829	Surgut Airport	Surgut	Russia	SGC	USRR	Asia/Yekaterinburg
2830	Koltsovo Airport	Yekaterinburg	Russia	SVX	USSS	Asia/Yekaterinburg
2831	Ashgabat International Airport	Ashkhabad	Turkmenistan	ASB	UTAA	Asia/Ashgabat
2832	Turkmenbashi Airport	Krasnovodsk	Turkmenistan	KRW	UTAK	Asia/Ashgabat
2833	Turkmenabat Airport	Chardzhou	Turkmenistan	CRZ	UTAV	Asia/Ashgabat
2834	Dushanbe Airport	Dushanbe	Tajikistan	DYU	UTDD	Asia/Dushanbe
2835	Bukhara Airport	Bukhara	Uzbekistan	BHK	UTSB	Asia/Samarkand
2836	Samarkand Airport	Samarkand	Uzbekistan	SKD	UTSS	Asia/Samarkand
2837	Tashkent International Airport	Tashkent	Uzbekistan	TAS	UTTT	Asia/Samarkand
2838	Bryansk Airport	Bryansk	Russia	BZK	UUBP	Europe/Moscow
2839	Sheremetyevo International Airport	Moscow	Russia	SVO	UUEE	Europe/Moscow
2840	Migalovo Air Base	Tver	Russia	KLD	UUEM	Europe/Moscow
2841	Voronezh International Airport	Voronezh	Russia	VOZ	UUOO	Europe/Moscow
2842	Vnukovo International Airport	Moscow	Russia	VKO	UUWW	Europe/Moscow
2843	Syktyvkar Airport	Syktyvkar	Russia	SCW	UUYY	Europe/Moscow
2844	Kazan International Airport	Kazan	Russia	KZN	UWKD	Europe/Moscow
2845	Orenburg Central Airport	Orenburg	Russia	REN	UWOO	Asia/Yekaterinburg
2846	Ufa International Airport	Ufa	Russia	UFA	UWUU	Asia/Yekaterinburg
2847	Kurumoch International Airport	Samara	Russia	KUF	UWWW	Europe/Samara
2848	Sardar Vallabhbhai Patel International Airport	Ahmedabad	India	AMD	VAAH	Asia/Calcutta
2849	Akola Airport	Akola	India	AKD	VAAK	Asia/Calcutta
2850	Aurangabad Airport	Aurangabad	India	IXU	VAAU	Asia/Calcutta
2851	Chhatrapati Shivaji International Airport	Mumbai	India	BOM	VABB	Asia/Calcutta
2852	Bilaspur Airport	Bilaspur	India	PAB	VABI	Asia/Calcutta
2853	Bhuj Airport	Bhuj	India	BHJ	VABJ	Asia/Calcutta
2854	Belgaum Airport	Belgaum	India	IXG	VABM	Asia/Calcutta
2855	Vadodara Airport	Baroda	India	BDQ	VABO	Asia/Calcutta
2856	Raja Bhoj International Airport	Bhopal	India	BHO	VABP	Asia/Calcutta
2857	Bhavnagar Airport	Bhaunagar	India	BHU	VABV	Asia/Calcutta
2858	Daman Airport	Daman	India	NMB	VADN	Asia/Calcutta
2859	Deesa Airport	Deesa	India		VADS	Asia/Calcutta
2860	Guna Airport	Guna	India	GUX	VAGN	Asia/Calcutta
2861	Dabolim Airport	Goa	India	GOI	VAGO	Asia/Calcutta
2862	Devi Ahilyabai Holkar Airport	Indore	India	IDR	VAID	Asia/Calcutta
2863	Jabalpur Airport	Jabalpur	India	JLR	VAJB	Asia/Calcutta
2864	Jamnagar Airport	Jamnagar	India	JGA	VAJM	Asia/Calcutta
2865	Kandla Airport	Kandla	India	IXY	VAKE	Asia/Calcutta
2866	Khajuraho Airport	Khajuraho	India	HJR	VAKJ	Asia/Calcutta
2867	Kolhapur Airport	Kolhapur	India	KLH	VAKP	Asia/Calcutta
2868	Keshod Airport	Keshod	India	IXK	VAKS	Asia/Calcutta
2869	Dr. Babasaheb Ambedkar International Airport	Nagpur	India	NAG	VANP	Asia/Calcutta
2870	Nashik Airport	Nasik Road	India	ISK	VAOZ	Asia/Calcutta
2871	Pune Airport	Pune	India	PNQ	VAPO	Asia/Calcutta
2872	Porbandar Airport	Porbandar	India	PBD	VAPR	Asia/Calcutta
2873	Rajkot Airport	Rajkot	India	RAJ	VARK	Asia/Calcutta
2874	Raipur Airport	Raipur	India	RPR	VARP	Asia/Calcutta
2875	Solapur Airport	Sholapur	India	SSE	VASL	Asia/Calcutta
2876	Surat Airport	Surat	India	STV	VASU	Asia/Calcutta
2877	Maharana Pratap Airport	Udaipur	India	UDR	VAUD	Asia/Calcutta
2878	Bandaranaike International Colombo Airport	Colombo	Sri Lanka	CMB	VCBI	Asia/Colombo
2879	Anuradhapura Air Force Base	Anuradhapura	Sri Lanka	ACJ	VCCA	Asia/Colombo
2880	Batticaloa Airport	Batticaloa	Sri Lanka	BTC	VCCB	Asia/Colombo
2881	Colombo Ratmalana Airport	Colombo	Sri Lanka	RML	VCCC	Asia/Colombo
2882	Ampara Airport	Galoya	Sri Lanka	ADP	VCCG	Asia/Colombo
2883	Kankesanturai Airport	Jaffna	Sri Lanka	JAF	VCCJ	Asia/Colombo
2884	China Bay Airport	Trinciomalee	Sri Lanka	TRR	VCCT	Asia/Colombo
2885	Kampong Chhnang Airport	Kompong Chnang	Cambodia	KZC	VDKH	Asia/Phnom_Penh
2886	Phnom Penh International Airport	Phnom-penh	Cambodia	PNH	VDPP	Asia/Phnom_Penh
2887	Siem Reap International Airport	Siem-reap	Cambodia	REP	VDSR	Asia/Phnom_Penh
2888	Stung Treng Airport	Stung Treng	Cambodia	TNX	VDST	Asia/Phnom_Penh
2889	Along Airport	Along	India	IXV	VEAN	Asia/Calcutta
2890	Agartala Airport	Agartala	India	IXA	VEAT	Asia/Calcutta
2891	Lengpui Airport	Aizwal	India	AJL	VELP	Asia/Calcutta
2892	Bagdogra Airport	Baghdogra	India	IXB	VEBD	Asia/Calcutta
2893	Bokaro Airport	Bokaro	India		VEBK	Asia/Calcutta
2894	Biju Patnaik Airport	Bhubaneswar	India	BBI	VEBS	Asia/Calcutta
2895	Netaji Subhash Chandra Bose International Airport	Kolkata	India	CCU	VECC	Asia/Calcutta
2896	Cooch Behar Airport	Cooch-behar	India	COH	VECO	Asia/Calcutta
2897	Dhanbad Airport	Dhanbad	India	DBD	VEDB	Asia/Calcutta
2898	Gaya Airport	Gaya	India	GAY	VEGY	Asia/Calcutta
2899	Hirakud Airport	Hirakud	India		VEHK	Asia/Calcutta
2900	Imphal Airport	Imphal	India	IMF	VEIM	Asia/Calcutta
2901	Jharsuguda Airport	Jharsuguda	India		VEJH	Asia/Calcutta
2902	Sonari Airport	Jamshedpur	India	IXW	VEJS	Asia/Calcutta
2903	Jorhat Airport	Jorhat	India	JRH	VEJT	Asia/Calcutta
2904	Kailashahar Airport	Kailashahar	India	IXH	VEKR	Asia/Calcutta
2905	Silchar Airport	Silchar	India	IXS	VEKU	Asia/Calcutta
2906	North Lakhimpur Airport	Lilabari	India	IXI	VELR	Asia/Calcutta
2907	Dibrugarh Airport	Mohanbari	India	DIB	VEMN	Asia/Calcutta
2908	Muzaffarpur Airport	Mazuffarpur	India	MZU	VEMZ	Asia/Calcutta
2909	Nawapara Airport	Nawapara	India		VENP	Asia/Calcutta
2910	Panagarh Air Force Station	Panagarh	India		VEPH	Asia/Calcutta
2911	Lok Nayak Jayaprakash Airport	Patina	India	PAT	VEPT	Asia/Calcutta
2912	Purnea Airport	Purnea	India		VEPU	Asia/Calcutta
2913	Birsa Munda Airport	Ranchi	India	IXR	VERC	Asia/Calcutta
2914	Rourkela Airport	Rourkela	India	RRK	VERK	Asia/Calcutta
2915	Utkela Airport	Utkela	India		VEUK	Asia/Calcutta
2916	Vishakhapatnam Airport	Vishakhapatnam	India	VTZ	VEVZ	Asia/Calcutta
2917	Ziro Airport	Zero	India	ZER	VEZO	Asia/Calcutta
2918	Cox's Bazar Airport	Cox's Bazar	Bangladesh	CXB	VGCB	Asia/Dhaka
2919	Shah Amanat International Airport	Chittagong	Bangladesh	CGP	VGEG	Asia/Dhaka
2920	Ishurdi Airport	Ishurdi	Bangladesh	IRD	VGIS	Asia/Dhaka
2921	Jessore Airport	Jessore	Bangladesh	JSR	VGJR	Asia/Dhaka
2922	Shah Mokhdum Airport	Rajshahi	Bangladesh	RJH	VGRJ	Asia/Dhaka
2923	Saidpur Airport	Saidpur	Bangladesh	SPD	VGSD	Asia/Dhaka
2924	Osmany International Airport	Sylhet Osmani	Bangladesh	ZYL	VGSY	Asia/Dhaka
2925	Tejgaon Airport	Dhaka	Bangladesh		VGTJ	Asia/Dhaka
2926	Hazrat Shahjalal International Airport	Dhaka	Bangladesh	DAC	VGZR	Asia/Dhaka
2927	Hong Kong International Airport	Hong Kong	Hong Kong	HKG	VHHH	Asia/Hong_Kong
2928	Shek Kong Air Base	Sek Kong	Hong Kong		VHSK	Asia/Hong_Kong
2929	Agra Airport	Agra	India	AGR	VIAG	Asia/Calcutta
2930	Allahabad Airport	Allahabad	India	IXD	VIAL	Asia/Calcutta
2931	Sri Guru Ram Dass Jee International Airport	Amritsar	India	ATQ	VIAR	Asia/Calcutta
2932	Nal Airport	Bikaner	India	BKB	VIBK	Asia/Calcutta
2933	Bakshi Ka Talab Air Force Station	Bakshi Ka Talab	India		VIBL	Asia/Calcutta
2934	Lal Bahadur Shastri Airport	Varanasi	India	VNS	VIBN	Asia/Calcutta
2935	Kullu Manali Airport	Kulu	India	KUU	VIBR	Asia/Calcutta
2936	Bhatinda Air Force Station	Bhatinda	India	BUP	VIBT	Asia/Calcutta
2937	Bhiwani Airport	Bhiwani	India		VIBW	Asia/Calcutta
2938	Bareilly Air Force Station	Bareilly	India	BEK	VIBY	Asia/Calcutta
2939	Chandigarh Airport	Chandigarh	India	IXC	VICG	Asia/Calcutta
2940	Kanpur Airport	Kanpur	India	KNU	VICX	Asia/Calcutta
2941	Safdarjung Airport	Delhi	India		VIDD	Asia/Calcutta
2942	Dehradun Airport	Dehra Dun	India	DED	VIDN	Asia/Calcutta
2943	Indira Gandhi International Airport	Delhi	India	DEL	VIDP	Asia/Calcutta
2944	Gwalior Airport	Gwalior	India	GWL	VIGR	Asia/Calcutta
2945	Hissar Airport	Hissar	India	HSS	VIHR	Asia/Calcutta
2946	Jhansi Airport	Jhansi	India		VIJN	Asia/Calcutta
2947	Jodhpur Airport	Jodhpur	India	JDH	VIJO	Asia/Calcutta
2948	Jaipur International Airport	Jaipur	India	JAI	VIJP	Asia/Calcutta
2949	Jaisalmer Airport	Jaisalmer	India	JSA	VIJR	Asia/Calcutta
2950	Jammu Airport	Jammu	India	IXJ	VIJU	Asia/Calcutta
2951	Kanpur Civil Airport	Kanpur	India		VIKA	Asia/Calcutta
2952	Kota Airport	Kota	India	KTU	VIKO	Asia/Calcutta
2953	Ludhiana Airport	Ludhiaha	India	LUH	VILD	Asia/Calcutta
2954	Leh Kushok Bakula Rimpochee Airport	Leh	India	IXL	VILH	Asia/Calcutta
2955	Chaudhary Charan Singh International Airport	Lucknow	India	LKO	VILK	Asia/Calcutta
2956	Pathankot Airport	Pathankot	India	IXP	VIPK	Asia/Calcutta
2957	Patiala Airport	Patiala	India		VIPL	Asia/Calcutta
2958	Pantnagar Airport	Nainital	India	PGH	VIPT	Asia/Calcutta
2959	Fursatganj Airport	Raibarelli	India		VIRB	Asia/Calcutta
2960	Sarsawa Air Force Station	Saharanpur	India		VISP	Asia/Calcutta
2961	Sheikh ul Alam Airport	Srinagar	India	SXR	VISR	Asia/Calcutta
2962	Satna Airport	Satna	India	TNI	VIST	Asia/Calcutta
2963	Luang Phabang International Airport	Luang Prabang	Laos	LPQ	VLLB	Asia/Vientiane
2964	Pakse International Airport	Pakse	Laos	PKZ	VLPS	Asia/Vientiane
2965	Phonesavanh Airport	Phong Savanh	Laos		VLPV	Asia/Vientiane
2966	Savannakhet Airport	Savannakhet	Laos	ZVK	VLSK	Asia/Vientiane
2967	Sam Neua Airport	Sam Neua	Laos	NEU	VLSN	Asia/Vientiane
2968	Wattay International Airport	Vientiane	Laos	VTE	VLVT	Asia/Vientiane
2969	Macau International Airport	Macau	Macau	MFM	VMMC	Asia/Macau
2970	Gautam Buddha Airport	Bhairawa	Nepal	BWA	VNBW	Asia/Katmandu
2971	Janakpur Airport	Janakpur	Nepal	JKR	VNJP	Asia/Katmandu
2972	Tribhuvan International Airport	Kathmandu	Nepal	KTM	VNKT	Asia/Katmandu
2973	Pokhara Airport	Pokhara	Nepal	PKR	VNPK	Asia/Katmandu
2974	Simara Airport	Simara	Nepal	SIF	VNSI	Asia/Katmandu
2975	Biratnagar Airport	Biratnagar	Nepal	BIR	VNVT	Asia/Katmandu
2976	Agatti Airport	Agatti Island	India	AGX	VOAT	Asia/Calcutta
2977	Kempegowda International Airport	Bangalore	India	BLR	VOBL	Asia/Calcutta
2978	Bellary Airport	Bellary	India	BEP	VOBI	Asia/Calcutta
2979	Bidar Air Force Station	Bidar	India		VOBR	Asia/Calcutta
2980	Vijayawada Airport	Vijayawada	India	VGA	VOBZ	Asia/Calcutta
2981	Coimbatore International Airport	Coimbatore	India	CJB	VOCB	Asia/Calcutta
2982	Cochin International Airport	Kochi	India	COK	VOCI	Asia/Calcutta
2983	Calicut International Airport	Calicut	India	CCJ	VOCL	Asia/Calcutta
2984	Kadapa Airport	Cuddapah	India	CDP	VOCP	Asia/Calcutta
2985	Car Nicobar Air Force Station	Carnicobar	India	CBD	VOCX	Asia/Calcutta
2986	Dundigul Air Force Academy	Dundigul	India		VODG	Asia/Calcutta
2987	Begumpet Airport	Hyderabad	India	BPM	VOHY	Asia/Calcutta
2988	Madurai Airport	Madurai	India	IXM	VOMD	Asia/Calcutta
2989	Mangalore International Airport	Mangalore	India	IXE	VOML	Asia/Calcutta
2990	Chennai International Airport	Madras	India	MAA	VOMM	Asia/Calcutta
2991	Nagarjuna Sagar Airport	Nagarjunsagar	India		VONS	Asia/Calcutta
2992	Vir Savarkar International Airport	Port Blair	India	IXZ	VOPB	Asia/Calcutta
2993	Pondicherry Airport	Pendicherry	India	PNY	VOPC	Asia/Calcutta
2994	Rajahmundry Airport	Rajahmundry	India	RJA	VORY	Asia/Calcutta
2995	Salem Airport	Salem	India	SXV	VOSM	Asia/Calcutta
2996	Tanjore Air Force Base	Tanjore	India	TJV	VOTJ	Asia/Calcutta
2997	Tirupati Airport	Tirupeti	India	TIR	VOTP	Asia/Calcutta
2998	Tiruchirapally Civil Airport Airport	Tiruchirappalli	India	TRZ	VOTR	Asia/Calcutta
2999	Trivandrum International Airport	Trivandrum	India	TRV	VOTV	Asia/Calcutta
3000	Tambaram Air Force Station	Tambaram	India		VOTX	Asia/Calcutta
3001	Paro Airport	Thimphu	Bhutan	PBH	VQPR	Asia/Thimphu
3002	Malé International Airport	Male	Maldives	MLE	VRMM	Indian/Maldives
3003	Don Mueang International Airport	Bangkok	Thailand	DMK	VTBD	Asia/Bangkok
3004	Kamphaeng Saen Airport	Nakhon Pathom	Thailand	KDT	VTBK	Asia/Bangkok
3005	Khok Kathiam Airport	Lop Buri	Thailand		VTBL	Asia/Bangkok
3006	U-Tapao International Airport	Pattaya	Thailand	UTP	VTBU	Asia/Bangkok
3007	Watthana Nakhon Airport	Prachin Buri	Thailand		VTBW	Asia/Bangkok
3008	Lampang Airport	Lampang	Thailand	LPT	VTCL	Asia/Bangkok
3009	Phrae Airport	Phrae	Thailand	PRH	VTCP	Asia/Bangkok
3010	Hua Hin Airport	Prachuap Khiri Khan	Thailand	HHQ	VTPH	Asia/Bangkok
3011	Takhli Airport	Nakhon Sawan	Thailand	TKH	VTPI	Asia/Bangkok
3012	Sak Long Airport	Phetchabun	Thailand		VTPL	Asia/Bangkok
3013	Nakhon Sawan Airport	Nakhon Sawan	Thailand		VTPN	Asia/Bangkok
3014	Phitsanulok Airport	Phitsanulok	Thailand	PHS	VTPP	Asia/Bangkok
3015	Khunan Phumipol Airport	Tak	Thailand		VTPY	Asia/Bangkok
3016	Khoun Khan Airport	Satun	Thailand		VTSA	Asia/Bangkok
3017	Narathiwat Airport	Narathiwat	Thailand	NAW	VTSC	Asia/Bangkok
3018	Krabi Airport	Krabi	Thailand	KBV	VTSG	Asia/Bangkok
3019	Songkhla Airport	Songkhla	Thailand	SGZ	VTSH	Asia/Bangkok
3020	Pattani Airport	Pattani	Thailand	PAN	VTSK	Asia/Bangkok
3021	Samui Airport	Ko Samui	Thailand	USM	VTSM	Asia/Bangkok
3022	Cha Eian Airport	Nakhon Si Thammarat	Thailand		VTSN	Asia/Bangkok
3023	Phuket International Airport	Phuket	Thailand	HKT	VTSP	Asia/Bangkok
3024	Ranong Airport	Ranong	Thailand	UNN	VTSR	Asia/Bangkok
3025	Hat Yai International Airport	Hat Yai	Thailand	HDY	VTSS	Asia/Bangkok
3026	Trang Airport	Trang	Thailand	TST	VTST	Asia/Bangkok
3027	Udon Thani Airport	Udon Thani	Thailand	UTH	VTUD	Asia/Bangkok
3028	Sakon Nakhon Airport	Sakon Nakhon	Thailand	SNO	VTUI	Asia/Bangkok
3029	Surin Airport	Surin	Thailand	PXR	VTUJ	Asia/Bangkok
3030	Loei Airport	Loei	Thailand	LOE	VTUL	Asia/Bangkok
3031	Khorat Airport	Nakhon Ratchasima	Thailand		VTUN	Asia/Bangkok
3032	Rob Muang Airport	Roi Et	Thailand		VTUR	Asia/Bangkok
3033	Da Nang International Airport	Danang	Vietnam	DAD	VVDN	Asia/Saigon
3034	Gia Lam Air Base	Hanoi	Vietnam		VVGL	Asia/Saigon
3035	Kep Air Base	Kep	Vietnam		VVKP	Asia/Saigon
3036	Noi Bai International Airport	Hanoi	Vietnam	HAN	VVNB	Asia/Saigon
3037	Nha Trang Air Base	Nhatrang	Vietnam	NHA	VVNT	Asia/Saigon
3038	Phu Bai Airport	Hue	Vietnam	HUI	VVPB	Asia/Saigon
3039	Phu Quoc International Airport	Phuquoc	Vietnam	PQC	VVPQ	Asia/Saigon
3040	Tan Son Nhat International Airport	Ho Chi Minh City	Vietnam	SGN	VVTS	Asia/Saigon
3041	Ann Airport	Ann	Burma	VBA	VYAN	Asia/Rangoon
3042	Anisakan Airport	Anisakan	Burma		VYAS	Asia/Rangoon
3043	Bagan Airport	Bagan	Burma	NYU	VYBG	Asia/Rangoon
3044	Coco Island Airport	Coco Island	Burma		VYCI	
3045	Heho Airport	Heho	Burma	HEH	VYHH	Asia/Rangoon
3046	Hommalinn Airport	Hommalin	Burma	HOX	VYHL	Asia/Rangoon
3047	Kengtung Airport	Kengtung	Burma	KET	VYKG	Asia/Rangoon
3048	Kyaukpyu Airport	Kyaukpyu	Burma	KYP	VYKP	Asia/Rangoon
3049	Lashio Airport	Lashio	Burma	LSH	VYLS	Asia/Rangoon
3050	Lanywa Airport	Lanywa	Burma		VYLY	Asia/Rangoon
3051	Mandalay International Airport	Mandalay	Burma	MDL	VYMD	Asia/Rangoon
3052	Myeik Airport	Myeik	Burma	MGZ	VYME	Asia/Rangoon
3053	Myitkyina Airport	Myitkyina	Burma	MYT	VYMK	Asia/Rangoon
3054	Momeik Airport	Momeik	Burma	MOE	VYMO	Asia/Rangoon
3055	Mong Hsat Airport	Mong Hsat	Burma	MOG	VYMS	Asia/Rangoon
3056	Nampong Air Base	Nampong	Burma		VYNP	Asia/Rangoon
3057	Namsang Airport	Namsang	Burma	NMS	VYNS	Asia/Rangoon
3058	Hpa-N Airport	Hpa-an	Burma	PAA	VYPA	Asia/Rangoon
3059	Putao Airport	Putao	Burma	PBU	VYPT	Asia/Rangoon
3060	Pyay Airport	Pyay	Burma	PRU	VYPY	Asia/Rangoon
3061	Shante Air Base	Shante	Burma		VYST	Asia/Rangoon
3062	Sittwe Airport	Sittwe	Burma	AKY	VYSW	Asia/Rangoon
3063	Thandwe Airport	Thandwe	Burma	SNW	VYTD	Asia/Rangoon
3064	Tachileik Airport	Tachilek	Burma	THL	VYTL	Asia/Rangoon
3065	Taungoo Airport	Taungoo	Burma		VYTO	Asia/Rangoon
3066	Yangon International Airport	Yangon	Burma	RGN	VYYY	Asia/Rangoon
3067	Hasanuddin International Airport	Ujung Pandang	Indonesia	UPG	WAAA	Asia/Makassar
3068	Frans Kaisiepo Airport	Biak	Indonesia	BIK	WABB	Asia/Jayapura
3069	Nabire Airport	Nabire	Indonesia	NBX	WABI	Asia/Jayapura
3070	Moses Kilangin Airport	Timika	Indonesia	TIM	WABP	Asia/Jayapura
3071	Sentani International Airport	Jayapura	Indonesia	DJJ	WAJJ	Asia/Jayapura
3072	Wamena Airport	Wamena	Indonesia	WMX	WAJW	Asia/Jayapura
3073	Mopah Airport	Merauke	Indonesia	MKQ	WAKK	Asia/Jayapura
3074	Jalaluddin Airport	Gorontalo	Indonesia	GTO	WAMG	Asia/Makassar
3075	Mutiara Airport	Palu	Indonesia	PLW	WAML	Asia/Makassar
3076	Sam Ratulangi Airport	Manado	Indonesia	MDC	WAMM	Asia/Makassar
3077	Kasiguncu Airport	Poso	Indonesia	PSJ	WAMP	Asia/Makassar
3078	Pitu Airport	Morotai Island	Indonesia	OTI	WAMR	Asia/Jayapura
3079	Sultan Khairun Babullah Airport	Ternate	Indonesia	TTE	WAMT	Asia/Jayapura
3080	Syukuran Aminuddin Amir Airport	Luwuk	Indonesia	LUW	WAMW	Asia/Makassar
3081	Pattimura Airport	Ambon	Ambon	Indonesia	AMQ	N
3082	Fakfak Airport	Fak Fak	Indonesia	FKQ	WASF	Asia/Jayapura
3083	Kaimana Airport	Kaimana	Indonesia	KNG	WASK	Asia/Jayapura
3084	Babo Airport	Babo	Indonesia	BXB	WASO	Asia/Jayapura
3085	Rendani Airport	Manokwari	Indonesia	MKW	WASR	Asia/Jayapura
3086	Dominique Edward Osok Airport	Sorong	Indonesia	SOQ	WAXX	Asia/Jayapura
3087	Bintulu Airport	Bintulu	Malaysia	BTU	WBGB	Asia/Kuala_Lumpur
3088	Kuching International Airport	Kuching	Malaysia	KCH	WBGG	Asia/Kuala_Lumpur
3089	Limbang Airport	Limbang	Malaysia	LMN	WBGJ	Asia/Kuala_Lumpur
3090	Marudi Airport	Marudi	Malaysia	MUR	WBGM	Asia/Kuala_Lumpur
3091	Miri Airport	Miri	Malaysia	MYY	WBGR	Asia/Kuala_Lumpur
3092	Sibu Airport	Sibu	Malaysia	SBW	WBGS	Asia/Kuala_Lumpur
3093	Lahad Datu Airport	Lahad Datu	Malaysia	LDU	WBKD	Asia/Kuala_Lumpur
3094	Kota Kinabalu International Airport	Kota Kinabalu	Malaysia	BKI	WBKK	Asia/Kuala_Lumpur
3095	Labuan Airport	Labuan	Malaysia	LBU	WBKL	Asia/Kuala_Lumpur
3096	Tawau Airport	Tawau	Malaysia	TWU	WBKW	Asia/Kuala_Lumpur
3097	Brunei International Airport	Bandar Seri Begawan	Brunei	BWN	WBSB	Asia/Brunei
3098	Sultan Syarif Kasim Ii (Simpang Tiga) Airport	Pekanbaru	Indonesia	PKU	WIBB	Asia/Jakarta
3099	Pinang Kampai Airport	Dumai	Indonesia	DUM	WIBD	Asia/Jakarta
3100	Soekarno-Hatta International Airport	Jakarta	Indonesia	CGK	WIII	Asia/Jakarta
3101	Binaka Airport	Gunung Sitoli	Indonesia	GNS	WIMB	Asia/Jakarta
3102	Aek Godang Airport	Padang Sidempuan	Indonesia	AEG	WIME	Asia/Jakarta
3103	Minangkabau International Airport	Padang	Indonesia	PDG	WIPT	Asia/Jakarta
3104	Soewondo Air Force Base	Medan	Indonesia	MES	WIMK	Asia/Jakarta
3105	Dr Ferdinand Lumban Tobing Airport	Sibolga	Indonesia	FLZ	WIMS	Asia/Jakarta
3106	Nanga Pinoh Airport	Nangapinoh	Indonesia	NPO	WIOG	Asia/Jakarta
3107	Ketapang(Rahadi Usman) Airport	Ketapang	Indonesia	KTG	WIOK	Asia/Jakarta
3108	Supadio Airport	Pontianak	Indonesia	PNK	WIOO	Asia/Jakarta
3109	Sultan Thaha Airport	Jambi	Indonesia	DJB	WIPA	Asia/Jakarta
3110	Fatmawati Soekarno Airport	Bengkulu	Indonesia	BKS	WIPL	Asia/Jakarta
3111	Sultan Mahmud Badaruddin II Airport	Palembang	Indonesia	PLM	WIPP	Asia/Jakarta
3112	Japura Airport	Rengat	Indonesia	RGT	WIPR	Asia/Jakarta
3113	Lhok Sukon Airport	Lhok Sukon	Indonesia	LSX	WITL	Asia/Jakarta
3114	Sultan Iskandar Muda International Airport	Banda Aceh	Indonesia	BTJ	WITT	Asia/Jakarta
3115	Kluang Airport	Kluang	Malaysia		WMAP	Asia/Kuala_Lumpur
3116	Sultan Abdul Halim Airport	Alor Setar	Malaysia	AOR	WMKA	Asia/Kuala_Lumpur
3117	Butterworth Airport	Butterworth	Malaysia	BWH	WMKB	Asia/Kuala_Lumpur
3118	Sultan Ismail Petra Airport	Kota Bahru	Malaysia	KBR	WMKC	Asia/Kuala_Lumpur
3119	Kuantan Airport	Kuantan	Malaysia	KUA	WMKD	Asia/Kuala_Lumpur
3120	Kerteh Airport	Kerteh	Malaysia	KTE	WMKE	Asia/Kuala_Lumpur
3121	Simpang Airport	Simpang	Malaysia		WMKF	Asia/Kuala_Lumpur
3122	Sultan Azlan Shah Airport	Ipoh	Malaysia	IPH	WMKI	Asia/Kuala_Lumpur
3123	Senai International Airport	Johor Bahru	Malaysia	JHB	WMKJ	Asia/Kuala_Lumpur
3124	Kuala Lumpur International Airport	Kuala Lumpur	Malaysia	KUL	WMKK	Asia/Kuala_Lumpur
3125	Langkawi International Airport	Langkawi	Malaysia	LGK	WMKL	Asia/Kuala_Lumpur
3126	Malacca Airport	Malacca	Malaysia	MKZ	WMKM	Asia/Kuala_Lumpur
3127	Sultan Mahmud Airport	Kuala Terengganu	Malaysia	TGG	WMKN	Asia/Kuala_Lumpur
3128	Penang International Airport	Penang	Malaysia	PEN	WMKP	Asia/Kuala_Lumpur
3129	Suai Airport	Suai	East Timor	UAI	WPDB	Asia/Dili
3130	Presidente Nicolau Lobato International Airport	Dili	East Timor	DIL	WPDL	Asia/Dili
3131	Cakung Airport	Baucau	East Timor	BCH	WPEC	Asia/Dili
3132	Sembawang Air Base	Sembawang	Singapore		WSAG	Asia/Singapore
3133	Paya Lebar Air Base	Paya Lebar	Singapore	QPG	WSAP	Asia/Singapore
3134	Tengah Air Base	Tengah	Singapore	TGA	WSAT	Asia/Singapore
3135	Seletar Airport	Singapore	Singapore	XSP	WSSL	Asia/Singapore
3136	Singapore Changi Airport	Singapore	Singapore	SIN	WSSS	Asia/Singapore
3137	Brisbane Archerfield Airport	Brisbane	Australia	ACF	YBAF	Australia/Brisbane
3138	Northern Peninsula Airport	Amberley	Australia	ABM	YBAM	Australia/Brisbane
3139	Alice Springs Airport	Alice Springs	Australia	ASP	YBAS	Australia/Darwin
3140	Brisbane International Airport	Brisbane	Australia	BNE	YBBN	Australia/Brisbane
3141	Gold Coast Airport	Coolangatta	Australia	OOL	YBCG	Australia/Brisbane
3142	Cairns International Airport	Cairns	Australia	CNS	YBCS	Australia/Brisbane
3143	Charleville Airport	Charlieville	Australia	CTL	YBCV	Australia/Brisbane
3144	Mount Isa Airport	Mount Isa	Australia	ISA	YBMA	Australia/Brisbane
3145	Sunshine Coast Airport	Maroochydore	Australia	MCY	YBMC	Australia/Brisbane
3146	Mackay Airport	Mackay	Australia	MKY	YBMK	Australia/Brisbane
3147	Proserpine Whitsunday Coast Airport	Prosserpine	Australia	PPP	YBPN	Australia/Brisbane
3148	Rockhampton Airport	Rockhampton	Australia	ROK	YBRK	Australia/Brisbane
3149	Townsville Airport	Townsville	Australia	TSV	YBTL	Australia/Brisbane
3150	Weipa Airport	Weipa	Australia	WEI	YBWP	Australia/Brisbane
3151	Avalon Airport	Avalon	Australia	AVV	YMAV	Australia/Hobart
3152	Albury Airport	Albury	Australia	ABX	YMAY	Australia/Sydney
3153	Melbourne Essendon Airport	Melbourne	Australia	MEB	YMEN	Australia/Hobart
3154	RAAF Base East Sale	East Sale	Australia		YMES	Australia/Hobart
3155	Hobart International Airport	Hobart	Australia	HBA	YMHB	Australia/Melbourne
3156	Launceston Airport	Launceston	Australia	LST	YMLT	Australia/Melbourne
3157	Melbourne Moorabbin Airport	Melbourne	Australia	MBW	YMMB	Australia/Hobart
3158	Melbourne International Airport	Melbourne	Australia	MEL	YMML	Australia/Hobart
3159	RAAF Williams	Point Cook Base	Point Cook	Australia		O
3160	Adelaide International Airport	Adelaide	Australia	ADL	YPAD	Australia/Adelaide
3161	RAAF Base Edinburgh	Edinburgh	Australia		YPED	Australia/Adelaide
3162	Perth Jandakot Airport	Perth	Australia	JAD	YPJT	Australia/Perth
3163	Karratha Airport	Karratha	Australia	KTA	YPKA	Australia/Perth
3164	Kalgoorlie Boulder Airport	Kalgoorlie	Australia	KGI	YPKG	Australia/Perth
3165	Kununurra Airport	Kununurra	Australia	KNX	YPKU	Australia/Perth
3166	Learmonth Airport	Learmonth	Australia	LEA	YPLM	Australia/Perth
3167	Port Hedland International Airport	Port Hedland	Australia	PHE	YPPD	Australia/Perth
3168	Adelaide Parafield Airport	Adelaide	Australia		YPPF	Australia/Adelaide
3169	Perth International Airport	Perth	Australia	PER	YPPH	Australia/Perth
3170	Woomera Airfield	Woomera	Australia	UMR	YPWR	Australia/Adelaide
3171	Christmas Island Airport	Christmas Island	Christmas Island	XCH	YPXM	Indian/Christmas
3172	Sydney Bankstown Airport	Sydney	Australia	BWU	YSBK	Australia/Sydney
3173	Canberra International Airport	Canberra	Australia	CBR	YSCB	Australia/Sydney
3174	Coffs Harbour Airport	Coff's Harbour	Australia	CFS	YSCH	Australia/Sydney
3175	Camden Airport	Camden	Australia	CDU	YSCN	Australia/Sydney
3176	Dubbo City Regional Airport	Dubbo	Australia	DBO	YSDU	Australia/Sydney
3177	Norfolk Island International Airport	Norfolk Island	Norfolk Island	NLK	YSNF	Pacific/Norfolk
3178	RAAF Base Richmond	Richmond	Australia	XRH	YSRI	Australia/Sydney
3179	Sydney Kingsford Smith International Airport	Sydney	Australia	SYD	YSSY	Australia/Sydney
3180	Tamworth Airport	Tamworth	Australia	TMW	YSTW	Australia/Sydney
3181	Wagga Wagga City Airport	Wagga Wagga	Australia	WGA	YSWG	Australia/Sydney
3182	Beijing Capital International Airport	Beijing	China	PEK	ZBAA	Asia/Shanghai
3183	Dongshan Airport	Hailar	China	HLD	ZBLA	Asia/Shanghai
3184	Tianjin Binhai International Airport	Tianjin	China	TSN	ZBTJ	Asia/Shanghai
3185	Taiyuan Wusu Airport	Taiyuan	China	TYN	ZBYN	Asia/Shanghai
3186	Guangzhou Baiyun International Airport	Guangzhou	China	CAN	ZGGG	Asia/Shanghai
3187	Changsha Huanghua International Airport	Changcha	China	CSX	ZGHA	Asia/Shanghai
3188	Guilin Liangjiang International Airport	Guilin	China	KWL	ZGKL	Asia/Shanghai
3189	Nanning Wuxu Airport	Nanning	China	NNG	ZGNN	Asia/Shanghai
3190	Shenzhen Bao'an International Airport	Shenzhen	China	SZX	ZGSZ	Asia/Shanghai
3191	Zhengzhou Xinzheng International Airport	Zhengzhou	China	CGO	ZHCC	Asia/Shanghai
3192	Wuhan Tianhe International Airport	Wuhan	China	WUH	ZHHH	Asia/Shanghai
3193	Pyongyang Sunan International Airport	Pyongyang	North Korea	FNJ	ZKPY	Asia/Pyongyang
3194	Lanzhou Zhongchuan Airport	Lanzhou	China	LHW	ZLLL	Asia/Shanghai
3195	Xi'an Xianyang International Airport	Xi'an	China	XIY	ZLXY	Asia/Shanghai
3196	Chinggis Khaan International Airport	Ulan Bator	Mongolia	ULN	ZMUB	Asia/Ulaanbaatar
3197	Xishuangbanna Gasa Airport	Jinghonggasa	China	JHG	ZPJH	Asia/Shanghai
3198	Kunming Changshui International Airport	Kunming	China	KMG	ZPPP	Asia/Shanghai
3199	Xiamen Gaoqi International Airport	Xiamen	China	XMN	ZSAM	Asia/Shanghai
3200	Nanchang Changbei International Airport	Nanchang	China	KHN	ZSCN	Asia/Shanghai
3201	Fuzhou Changle International Airport	Fuzhou	China	FOC	ZSFZ	Asia/Shanghai
3202	Hangzhou Xiaoshan International Airport	Hangzhou	China	HGH	ZSHC	Asia/Shanghai
3203	Ningbo Lishe International Airport	Ninbo	China	NGB	ZSNB	Asia/Shanghai
3204	Nanjing Lukou Airport	Nanjing	China	NKG	ZSNJ	Asia/Shanghai
3205	Hefei Luogang International Airport	Hefei	China	HFE	ZSOF	Asia/Shanghai
3206	Liuting Airport	Qingdao	China	TAO	ZSQD	Asia/Shanghai
3207	Shanghai Hongqiao International Airport	Shanghai	China	SHA	ZSSS	Asia/Shanghai
3208	Yantai Laishan Airport	Yantai	China	YNT	ZSYT	Asia/Shanghai
3209	Chongqing Jiangbei International Airport	Chongqing	China	CKG	ZUCK	Asia/Shanghai
3210	Longdongbao Airport	Guiyang	China	KWE	ZUGY	Asia/Shanghai
3211	Chengdu Shuangliu International Airport	Chengdu	China	CTU	ZUUU	Asia/Shanghai
3212	Xichang Qingshan Airport	Xichang	China	XIC	ZUXC	Asia/Shanghai
3213	Kashgar Airport	Kashi	China	KHG	ZWSH	Asia/Shanghai
3214	Hotan Airport	Hotan	China	HTN	ZWTN	Asia/Shanghai
3215	Ürümqi Diwopu International Airport	Urumqi	China	URC	ZWWW	Asia/Shanghai
3216	Taiping Airport	Harbin	China	HRB	ZYHB	Asia/Shanghai
3217	Mudanjiang Hailang International Airport	Mudanjiang	China	MDG	ZYMD	Asia/Shanghai
3218	Zhoushuizi Airport	Dalian	China	DLC	ZYTL	Asia/Shanghai
3219	Shanghai Pudong International Airport	Shanghai	China	PVG	ZSPD	Asia/Shanghai
3220	Pulau Tioman Airport	Tioman	Malaysia	TOD	WMBT	Asia/Kuala_Lumpur
3221	Sultan Abdul Aziz Shah International Airport	Kuala Lumpur	Malaysia	SZB	WMSA	Asia/Kuala_Lumpur
3222	Noto Airport	Wajima	Japan	NTQ	RJNW	Asia/Tokyo
3223	Borg El Arab International Airport	Alexandria	Egypt	HBE	HEBA	Africa/Cairo
3224	Barter Island LRRS Airport	Barter Island	United States	BTI	PABA	America/Anchorage
3225	Wainwright Air Station	Fort Wainwright	United States		PAWT	America/Anchorage
3226	Cape Lisburne LRRS Airport	Cape Lisburne	United States	LUR	PALU	America/Anchorage
3227	Point Lay LRRS Airport	Point Lay	United States	PIZ	PPIZ	America/Anchorage
3228	Hilo International Airport	Hilo	United States	ITO	PHTO	Pacific/Honolulu
3229	Orlando Executive Airport	Orlando	United States	ORL	KORL	America/New_York
3230	Bettles Airport	Bettles	United States	BTT	PABT	America/Anchorage
3231	Clear Airport	Clear Mews	United States		PACL	America/Anchorage
3232	Indian Mountain LRRS Airport	Indian Mountains	United States	UTO	PAIM	America/Anchorage
3233	Fort Yukon Airport	Fort Yukon	United States	FYU	PFYU	America/Anchorage
3234	Sparrevohn LRRS Airport	Sparrevohn	United States	SVW	PASV	America/Anchorage
3235	Bryant Army Heliport	Fort Richardson	United States	FRN	PAFR	America/Anchorage
3236	Tatalina LRRS Airport	Tatalina	United States	TLJ	PATL	America/Anchorage
3237	Cape Romanzof LRRS Airport	Cape Romanzof	United States	CZF	PACZ	America/Anchorage
3238	Laurence G Hanscom Field	Bedford	United States	BED	KBED	America/New_York
3239	St Paul Island Airport	St. Paul Island	United States	SNP	PASN	America/Anchorage
3240	Cape Newenham LRRS Airport	Cape Newenham	United States	EHM	PAEH	America/Anchorage
3241	St George Airport	Point Barrow	United States	STG	PAPB	America/Anchorage
3242	Iliamna Airport	Iliamna	United States	ILI	PAIL	America/Anchorage
3243	Platinum Airport	Port Moller	United States	PTU	PAPM	America/Anchorage
3244	Big Mountain Airport	Big Mountain	United States	BMX	PABM	America/Anchorage
3245	Oscoda Wurtsmith Airport	Oscoda	United States	OSC	KOSC	America/New_York
3246	Marina Municipal Airport	Fort Ord	United States	OAR	KOAR	America/Los_Angeles
3247	Sacramento Mather Airport	Sacramento	United States	MHR	KMHR	America/Los_Angeles
3248	Bicycle Lake Army Air Field	Fort Irwin	United States	BYS	KBYS	America/Los_Angeles
3249	Twentynine Palms (Self) Airport	Twenty Nine Palms	United States		KNXP	America/Los_Angeles
3250	Fort Smith Regional Airport	Fort Smith	United States	FSM	KFSM	America/Chicago
3251	Merrill Field	Anchorage	United States	MRI	PAMR	America/Anchorage
3252	Grants-Milan Municipal Airport	Grants	United States	GNT	KGNT	America/Denver
3253	Ponca City Regional Airport	Ponca City	United States	PNC	KPNC	America/Chicago
3254	Hunter Army Air Field	Hunter Aaf	United States	SVN	KSVN	America/New_York
3255	Grand Forks International Airport	Grand Forks	United States	GFK	KGFK	America/Chicago
3256	Pine Bluff Regional Airport	Grider Field	Pine Bluff	United States	PBF	A
3257	Whiting Field Naval Air Station - North	Milton	United States	NSE	KNSE	America/Chicago
3258	Hana Airport	Hana	United States	HNM	PHHN	Pacific/Honolulu
3259	Ernest A. Love Field	Prescott	United States	PRC	KPRC	America/Phoenix
3260	Trenton Mercer Airport	Trenton	United States	TTN	KTTN	America/New_York
3261	General Edward Lawrence Logan International Airport	Boston	United States	BOS	KBOS	America/New_York
3262	Travis Air Force Base	Fairfield	United States	SUU	KSUU	America/Los_Angeles
3263	Griffiss International Airport	Rome	United States	RME	KRME	America/New_York
3264	Wendover Airport	Wendover	United States	ENV	KENV	America/Denver
3265	Mobile Downtown Airport	Mobile	United States	BFM	KBFM	America/Chicago
3266	Metropolitan Oakland International Airport	Oakland	United States	OAK	KOAK	America/Los_Angeles
3267	Eppley Airfield	Omaha	United States	OMA	KOMA	America/Chicago
3268	Port Angeles Cgas Airport	Port Angeles	United States		KNOW	America/Los_Angeles
3269	Kahului Airport	Kahului	United States	OGG	PHOG	Pacific/Honolulu
3270	Wichita Eisenhower National Airport	Wichita	United States	ICT	KICT	America/Chicago
3271	Kansas City International Airport	Kansas City	United States	MCI	KMCI	America/Chicago
3272	Dane County Regional Truax Field	Madison	United States	MSN	KMSN	America/Chicago
3273	Dillingham Airport	Dillingham	United States	DLG	PADL	America/Anchorage
3274	Boone County Airport	Harrison	United States	HRO	KHRO	America/Chicago
3275	Phoenix Sky Harbor International Airport	Phoenix	United States	PHX	KPHX	America/Phoenix
3276	Bangor International Airport	Bangor	United States	BGR	KBGR	America/New_York
3277	Fort Lauderdale Executive Airport	Fort Lauderdale	United States	FXE	KFXE	America/New_York
3278	East Texas Regional Airport	Longview	United States	GGG	KGGG	America/Chicago
3279	Anderson Regional Airport	Andersen	United States	AND	KAND	America/New_York
3280	Spokane International Airport	Spokane	United States	GEG	KGEG	America/Los_Angeles
3281	North Perry Airport	Hollywood	United States	HWO	KHWO	America/New_York
3282	San Francisco International Airport	San Francisco	United States	SFO	KSFO	America/Los_Angeles
3283	Cut Bank International Airport	Cutbank	United States	CTB	KCTB	America/Denver
3284	Acadiana Regional Airport	Louisiana	United States	ARA	KARA	America/Chicago
3285	Gainesville Regional Airport	Gainesville	United States	GNV	KGNV	America/New_York
3286	Memphis International Airport	Memphis	United States	MEM	KMEM	America/Chicago
3287	Bisbee Douglas International Airport	Douglas	United States	DUG	KDUG	America/Phoenix
3288	Allen Army Airfield	Delta Junction	United States	BIG	PABI	America/Anchorage
3289	TSTC Waco Airport	Waco	United States	CNW	KCNW	America/Chicago
3290	Annette Island Airport	Annette Island	United States	ANN	PANT	America/Anchorage
3291	Caribou Municipal Airport	Caribou	United States	CAR	KCAR	America/New_York
3292	Little Rock Air Force Base	Jacksonville	United States	LRF	KLRF	America/Chicago
3293	Redstone Army Air Field	Redstone	United States	HUA	KHUA	America/Chicago
3294	Pope Field	Fort Bragg	United States	POB	KPOB	America/New_York
3295	Dalhart Municipal Airport	Dalhart	United States	DHT	KDHT	America/Chicago
3296	DLF Airport	Del Rio	United States	DLF	KDLF	America/Chicago
3297	Los Angeles International Airport	Los Angeles	United States	LAX	KLAX	America/Los_Angeles
3298	Anniston Regional Airport	Anniston	United States	ANB	KANB	America/Chicago
3299	Cleveland Hopkins International Airport	Cleveland	United States	CLE	KCLE	America/New_York
3300	Dover Air Force Base	Dover	United States	DOV	KDOV	America/New_York
3301	Cincinnati Northern Kentucky International Airport	Cincinnati	United States	CVG	KCVG	America/New_York
3302	Tipton Airport	Fort Meade	United States	FME	KFME	America/New_York
3303	China Lake Naws (Armitage Field) Airport	China Lake	United States		KNID	America/Los_Angeles
3304	Huron Regional Airport	Huron	United States	HON	KHON	America/Chicago
3305	Juneau International Airport	Juneau	United States	JNU	PAJN	America/Anchorage
3306	Lafayette Regional Airport	Lafayette	United States	LFT	KLFT	America/Chicago
3307	Newark Liberty International Airport	Newark	United States	EWR	KEWR	America/New_York
3308	Boise Air Terminal/Gowen Field	Boise	United States	BOI	KBOI	America/Denver
3309	Creech Air Force Base	Indian Springs	United States	INS	KINS	America/Los_Angeles
3310	Garden City Regional Airport	Garden City	United States	GCK	KGCK	America/Chicago
3311	Minot International Airport	Minot	United States	MOT	KMOT	America/Chicago
3312	Wheeler Army Airfield	Wahiawa	United States	HHI	PHHI	Pacific/Honolulu
3313	Maxwell Air Force Base	Montgomery	United States	MXF	KMXF	America/Chicago
3314	Robinson Army Air Field	Robinson	United States		KRBM	America/Chicago
3315	Dallas Love Field	Dallas	United States	DAL	KDAL	America/Chicago
3316	Butts AAF (Fort Carson) Air Field	Fort Carson	United States	FCS	KFCS	America/Denver
3317	Helena Regional Airport	Helena	United States	HLN	KHLN	America/Denver
3318	Miramar Marine Corps Air Station - Mitscher Field	Miramar	United States	NKX	KNKX	America/Los_Angeles
3319	Luke Air Force Base	Phoenix	United States	LUF	KLUF	America/Phoenix
3320	Hurlburt Field	Mary Esther	United States		KHRT	America/Chicago
3321	Jack Northrop Field Hawthorne Municipal Airport	Hawthorne	United States	HHR	KHHR	America/Los_Angeles
3322	Houlton International Airport	Houlton	United States	HUL	KHUL	America/New_York
3323	Vance Air Force Base	Enid	United States	END	KEND	America/Chicago
3324	Point Mugu Naval Air Station (Naval Base Ventura Co)	Point Mugu	United States	NTD	KNTD	America/Los_Angeles
3325	Edwards Air Force Base	Edwards Afb	United States	EDW	KEDW	America/Los_Angeles
3326	Lake Charles Regional Airport	Lake Charles	United States	LCH	KLCH	America/Chicago
3327	Ellison Onizuka Kona International At Keahole Airport	Kona	United States	KOA	PHKO	Pacific/Honolulu
3328	Myrtle Beach International Airport	Myrtle Beach	United States	MYR	KMYR	America/New_York
3329	Lemoore Naval Air Station (Reeves Field) Airport	Lemoore	United States	NLC	KNLC	America/Los_Angeles
3330	Nantucket Memorial Airport	Nantucket	United States	ACK	KACK	America/New_York
3331	Felker Army Air Field	Fort Eustis	United States	FAF	KFAF	America/New_York
3332	Campbell AAF (Fort Campbell) Air Field	Hopkinsville	United States	HOP	KHOP	America/Chicago
3333	Ronald Reagan Washington National Airport	Washington	United States	DCA	KDCA	America/New_York
3334	Patuxent River Naval Air Station (Trapnell Field)	Patuxent River	United States	NHK	KNHK	America/New_York
3335	Palacios Municipal Airport	Palacios	United States	PSX	KPSX	America/Chicago
3336	Arkansas International Airport	Blytheville	United States	BYH	KBYH	America/Chicago
3337	Atlantic City International Airport	Atlantic City	United States	ACY	KACY	America/New_York
3338	Tinker Air Force Base	Oklahoma City	United States	TIK	KTIK	America/Chicago
3339	Elizabeth City Regional Airport & Coast Guard Air Station	Elizabeth City	United States	ECG	KECG	America/New_York
3340	Pueblo Memorial Airport	Pueblo	United States	PUB	KPUB	America/Denver
3341	Northern Maine Regional Airport at Presque Isle	Presque Isle	United States	PQI	KPQI	America/New_York
3342	Kirtland Air Force Base	Kirtland A.f.b.	United States	IKR	KIKR	America/Denver
3343	Gray Army Air Field	Fort Lewis	United States	GRF	KGRF	America/Los_Angeles
3344	Kodiak Airport	Kodiak	United States	ADQ	PADQ	America/Anchorage
3345	Upolu Airport	Opolu	United States	UPP	PHUP	Pacific/Honolulu
3346	Fort Lauderdale Hollywood International Airport	Fort Lauderdale	United States	FLL	KFLL	America/New_York
3347	Muskogee-Davis Regional Airport	Muskogee	United States		KMKO	America/Chicago
3348	Falls International Airport	International Falls	United States	INL	KINL	America/Chicago
3349	Salt Lake City International Airport	Salt Lake City	United States	SLC	KSLC	America/Denver
3350	Childress Municipal Airport	Childress	United States	CDS	KCDS	America/Chicago
3351	Keesler Air Force Base	Biloxi	United States	BIX	KBIX	America/Chicago
3352	Lawson Army Air Field (Fort Benning)	Fort Benning	United States	LSF	KLSF	America/New_York
3353	Kingsville Naval Air Station	Kingsville	United States	NQI	KNQI	America/Chicago
3354	Marshall Army Air Field	Fort Riley	United States	FRI	KFRI	America/Chicago
3355	Harrisburg International Airport	Harrisburg	United States	MDT	KMDT	America/New_York
3356	Lincoln Airport	Lincoln	United States	LNK	KLNK	America/Chicago
3357	Capital City Airport	Lansing	United States	LAN	KLAN	America/New_York
3358	Waimea Kohala Airport	Kamuela	United States	MUE	PHMU	Pacific/Honolulu
3359	Massena International Richards Field	Massena	United States	MSS	KMSS	America/New_York
3360	Hickory Regional Airport	Hickory	United States	HKY	KHKY	America/New_York
3361	Albert Whitted Airport	St. Petersburg	United States	SPG	KSPG	America/New_York
3362	Page Field	Fort Myers	United States	FMY	KFMY	America/New_York
3363	George Bush Intercontinental Houston Airport	Houston	United States	IAH	KIAH	America/Chicago
3364	Millinocket Municipal Airport	Millinocket	United States		KMLT	America/New_York
3365	Joint Base Andrews	Camp Springs	United States	ADW	KADW	America/New_York
3366	Smith Reynolds Airport	Winston-salem	United States	INT	KINT	America/New_York
3367	Southern California Logistics Airport	Victorville	United States	VCV	KVCV	America/Los_Angeles
3368	Bob Sikes Airport	Crestview	United States	CEW	KCEW	America/Chicago
3369	Wheeler Sack Army Air Field	Fort Drum	United States		KGTB	America/New_York
3370	St Clair County International Airport	Port Huron	United States	PHN	KPHN	America/New_York
3371	Meadows Field	Bakersfield	United States	BFL	KBFL	America/Los_Angeles
3372	El Paso International Airport	El Paso	United States	ELP	KELP	America/Denver
3373	Valley International Airport	Harlingen	United States	HRL	KHRL	America/Chicago
3374	Columbia Metropolitan Airport	Columbia	United States	CAE	KCAE	America/New_York
3375	Davis Monthan Air Force Base	Tucson	United States	DMA	KDMA	America/Phoenix
3376	Pensacola Naval Air Station/Forrest Sherman Field	Pensacola	United States	NPA	KNPA	America/Chicago
3377	Pensacola Regional Airport	Pensacola	United States	PNS	KPNS	America/Chicago
3378	Grand Forks Air Force Base	Red River	United States	RDR	KRDR	America/Chicago
3379	William P Hobby Airport	Houston	United States	HOU	KHOU	America/Chicago
3380	Buckley Air Force Base	Buckley	United States	BFK	KBKF	America/Denver
3381	Northway Airport	Northway	United States	ORT	PAOR	America/Anchorage
3382	Warren ""Bud"" Woods Palmer Municipal Airport	Palmer	United States	PAQ	PAAQ	America/Anchorage
3383	Pittsburgh International Airport	Pittsburgh	United States	PIT	KPIT	America/New_York
3384	Wiley Post Will Rogers Memorial Airport	Barrow	United States	BRW	PABR	America/Anchorage
3385	Ellington Airport	Houston	United States	EFD	KEFD	America/Chicago
3386	Whidbey Island Naval Air Station (Ault Field)	Whidbey Island	United States	NUW	KNUW	America/Los_Angeles
3387	Alice International Airport	Alice	United States	ALI	KALI	America/Chicago
3388	Moody Air Force Base	Valdosta	United States	VAD	KVAD	America/New_York
3389	Miami International Airport	Miami	United States	MIA	KMIA	America/New_York
3390	Seattle Tacoma International Airport	Seattle	United States	SEA	KSEA	America/Los_Angeles
3391	Lovell Field	Chattanooga	United States	CHA	KCHA	America/New_York
3392	Igor I Sikorsky Memorial Airport	Stratford	United States	BDR	KBDR	America/New_York
3393	Jackson-Medgar Wiley Evers International Airport	Jackson	United States	JAN	KJAN	America/Chicago
3394	Scholes International At Galveston Airport	Galveston	United States	GLS	KGLS	America/Chicago
3395	Long Beach /Daugherty Field/ Airport	Long Beach	United States	LGB	KLGB	America/Los_Angeles
3396	Dillingham Airfield	Dillingham	United States	HDH	PHDH	Pacific/Honolulu
3397	Williamsport Regional Airport	Williamsport	United States	IPT	KIPT	America/New_York
3398	Indianapolis International Airport	Indianapolis	United States	IND	KIND	America/New_York
3399	Whiteman Air Force Base	Knobnoster	United States	SZL	KSZL	America/Chicago
3400	Akron Fulton International Airport	Akron	United States	AKC	KAKR	America/New_York
3401	Greenwood–Leflore Airport	Greenwood	United States	GWO	KGWO	America/Chicago
3402	Westchester County Airport	White Plains	United States	HPN	KHPN	America/New_York
3403	Francis S Gabreski Airport	West Hampton Beach	United States	FOK	KFOK	America/New_York
3404	Jonesboro Municipal Airport	Jonesboro	United States	JBR	KJBR	America/Chicago
3405	Tonopah Test Range Airport	Tonopah	United States	XSD	KTNX	America/Los_Angeles
3406	Palm Beach County Park Airport	West Palm Beach	United States	LNA	KLNA	America/New_York
3407	North Island Naval Air Station-Halsey Field	San Diego	United States	NZY	KNZY	America/Los_Angeles
3408	Biggs Army Air Field (Fort Bliss)	El Paso	United States	BIF	KBIF	America/Denver
3409	Yuma MCAS/Yuma International Airport	Yuma	United States	YUM	KNYL	America/Phoenix
3410	Cavern City Air Terminal	Carlsbad	United States	CNM	KCNM	America/Denver
3411	Duluth International Airport	Duluth	United States	DLH	KDLH	America/Chicago
3412	Bethel Airport	Bethel	United States	BET	PABE	America/Anchorage
3413	Bowman Field	Louisville	United States	LOU	KLOU	America/New_York
3414	Sierra Vista Municipal Libby Army Air Field	Fort Huachuca	United States	FHU	KFHU	America/Phoenix
3415	Lihue Airport	Lihue	United States	LIH	PHLI	Pacific/Honolulu
3416	Terre Haute Regional Airport	Hulman Field	Terre Haute	United States	HUF	A
3417	Havre City County Airport	Havre	United States	HVR	KHVR	America/Denver
3418	Grant County International Airport	Grant County Airport	United States	MWH	KMWH	America/Los_Angeles
3419	Edward F Knapp State Airport	Montpelier	United States	MPV	KMPV	America/New_York
3420	San Nicolas Island Nolf Airport	San Nicolas Island	United States		KNSI	America/Los_Angeles
3421	Richmond International Airport	Richmond	United States	RIC	KRIC	America/New_York
3422	Shreveport Regional Airport	Shreveport	United States	SHV	KSHV	America/Chicago
3423	Merle K (Mudhole) Smith Airport	Cordova	United States	CDV	PACV	America/Anchorage
3424	Norfolk International Airport	Norfolk	United States	ORF	KORF	America/New_York
3425	Southeast Texas Regional Airport	Beaumont	United States	BPT	KBPT	America/Chicago
3426	Savannah Hilton Head International Airport	Savannah	United States	SAV	KSAV	America/New_York
3427	Hill Air Force Base	Ogden	United States	HIF	KHIF	America/Denver
3428	Nome Airport	Nome	United States	OME	PAOM	America/Anchorage
3429	Scappoose Industrial Airpark	San Luis	United States		KSPB	America/Los_Angeles
3430	St Petersburg Clearwater International Airport	St. Petersburg	United States	PIE	KPIE	America/New_York
3431	Menominee Regional Airport	Macon	United States	MNM	KMNM	America/Chicago
3432	Conroe-North Houston Regional Airport	Conroe	United States	CXO	KCXO	America/Chicago
3433	Deadhorse Airport	Deadhorse	United States	SCC	PASC	America/Anchorage
3434	San Antonio International Airport	San Antonio	United States	SAT	KSAT	America/Chicago
3435	Greater Rochester International Airport	Rochester	United States	ROC	KROC	America/New_York
3436	Patrick Air Force Base	Coco Beach	United States	COF	KCOF	America/New_York
3437	Teterboro Airport	Teterboro	United States	TEB	KTEB	America/New_York
3438	Ellsworth Air Force Base	Rapid City	United States	RCA	KRCA	America/Denver
3439	Raleigh Durham International Airport	Raleigh-durham	United States	RDU	KRDU	America/New_York
3440	James M Cox Dayton International Airport	Dayton	United States	DAY	KDAY	America/New_York
3441	Kenai Municipal Airport	Kenai	United States	ENA	PAEN	America/Anchorage
3442	Mc Alester Regional Airport	Mcalester	United States	MLC	KMLC	America/Chicago
3443	Niagara Falls International Airport	Niagara Falls	United States	IAG	KIAG	America/New_York
3444	Coulter Field	Bryan	United States	CFD	KCFD	America/Chicago
3445	Wright AAF (Fort Stewart)/Midcoast Regional Airport	Wright	United States	LIY	KLHW	America/New_York
3446	Newport News Williamsburg International Airport	Newport News	United States	PHF	KPHF	America/New_York
3447	Esler Regional Airport	Alexandria	United States	ESF	KESF	America/Chicago
3448	Altus Air Force Base	Altus	United States	LTS	KLTS	America/Chicago
3449	Tucson International Airport	Tucson	United States	TUS	KTUS	America/Phoenix
3450	Minot Air Force Base	Minot	United States	MIB	KMIB	America/Chicago
3451	Beale Air Force Base	Marysville	United States	BAB	KBAB	America/Los_Angeles
3452	Greater Kankakee Airport	Kankakee	United States	IKK	KIKK	America/Chicago
3453	Seymour Johnson Air Force Base	Goldsboro	United States	GSB	KGSB	America/New_York
3454	Theodore Francis Green State Airport	Providence	United States	PVD	KPVD	America/New_York
3455	Salisbury Ocean City Wicomico Regional Airport	Salisbury	United States	SBY	KSBY	America/New_York
3456	Rancho Murieta Airport	Rancho Murieta	United States		KRIU	America/Los_Angeles
3457	Bob Hope Airport	Burbank	United States	BUR	KBUR	America/Los_Angeles
3458	Detroit Metropolitan Wayne County Airport	Detroit	United States	DTW	KDTW	America/New_York
3459	Tampa International Airport	Tampa	United States	TPA	KTPA	America/New_York
3460	Pembina Municipal Airport	Pembina	United States	PMB	KPMB	America/Chicago
3461	Polk Army Air Field	Fort Polk	United States	POE	KPOE	America/Chicago
3462	Eielson Air Force Base	Fairbanks	United States	EIL	PAEI	America/Anchorage
3463	Range Regional Airport	Hibbing	United States	HIB	KHIB	America/Chicago
3464	Angelina County Airport	Lufkin	United States	LFK	KLFK	America/Chicago
3465	Midland International Airport	Midland	United States	MAF	KMAF	America/Chicago
3466	Austin Straubel International Airport	Green Bay	United States	GRB	KGRB	America/Chicago
3467	Ardmore Municipal Airport	Ardmore	United States	ADM	KADM	America/Chicago
3468	Mc Guire Air Force Base	Wrightstown	United States	WRI	KWRI	America/New_York
3469	Cherry Point MCAS /Cunningham Field/	Cherry Point	United States		KNKT	America/New_York
3470	Emanuel County Airport	Santa Barbara	United States		KSBO	America/New_York
3471	Augusta Regional At Bush Field	Bush Field	United States	AGS	KAGS	America/New_York
3472	Sloulin Field International Airport	Williston	United States	ISN	KISN	America/Chicago
3473	Bill & Hillary Clinton National Airport/Adams Field	Little Rock	United States	LIT	KLIT	America/Chicago
3474	Stewart International Airport	Newburgh	United States	SWF	KSWF	America/New_York
3475	Baudette International Airport	Baudette	United States	BDE	KBDE	America/Chicago
3476	Sacramento Executive Airport	Sacramento	United States	SAC	KSAC	America/Los_Angeles
3477	Homer Airport	Homer	United States	HOM	PAHO	America/Anchorage
3478	Waynesville-St. Robert Regional Forney field	Fort Leonardwood	United States	TBN	KTBN	America/Chicago
3479	Dobbins Air Reserve Base	Marietta	United States	MGE	KMGE	America/New_York
3480	Fairchild Air Force Base	Spokane	United States	SKA	KSKA	America/Los_Angeles
3481	Roscommon County - Blodgett Memorial Airport	Houghton Lake	United States	HTL	KHTL	America/New_York
3482	Tyndall Air Force Base	Panama City	United States	PAM	KPAM	America/Chicago
3483	Dallas Fort Worth International Airport	Dallas-Fort Worth	United States	DFW	KDFW	America/Chicago
3484	Melbourne International Airport	Melbourne	United States	MLB	KMLB	America/New_York
3485	McChord Air Force Base	Tacoma	United States	TCM	KTCM	America/Los_Angeles
3486	Austin Bergstrom International Airport	Austin	United States	AUS	KAUS	America/Chicago
3487	Rickenbacker International Airport	Columbus	United States	LCK	KLCK	America/New_York
3488	Sawyer International Airport	Gwinn	United States	MQT	KSAW	America/New_York
3489	McGhee Tyson Airport	Knoxville	United States	TYS	KTYS	America/New_York
3490	Hood Army Air Field	Fort Hood	United States	HLR	KHLR	America/Chicago
3491	St Louis Lambert International Airport	St. Louis	United States	STL	KSTL	America/Chicago
3492	Millville Municipal Airport	Millville	United States	MIV	KMIV	America/New_York
3493	Sheppard Air Force Base-Wichita Falls Municipal Airport	Wichita Falls	United States	SPS	KSPS	America/Chicago
3494	Cincinnati Municipal Airport Lunken Field	Cincinnati	United States	LUK	KLUK	America/New_York
3495	Hartsfield Jackson Atlanta International Airport	Atlanta	United States	ATL	KATL	America/New_York
3496	Castle Airport	Merced	United States	MER	KMER	America/Los_Angeles
3497	Mc Clellan Airfield	Sacramento	United States	MCC	KMCC	America/Los_Angeles
3498	Gerald R. Ford International Airport	Grand Rapids	United States	GRR	KGRR	America/New_York
3499	Winkler County Airport	Wink	United States	INK	KINK	America/Chicago
3500	Fresno Yosemite International Airport	Fresno	United States	FAT	KFAT	America/Los_Angeles
3501	Vero Beach Regional Airport	Vero Beach	United States	VRB	KVRB	America/New_York
3502	Imperial County Airport	Imperial	United States	IPL	KIPL	America/Los_Angeles
3503	Nashville International Airport	Nashville	United States	BNA	KBNA	America/Chicago
3504	Laredo International Airport	Laredo	United States	LRD	KLRD	America/Chicago
3505	Elmendorf Air Force Base	Anchorage	United States	EDF	PAED	America/Anchorage
3506	Ralph Wien Memorial Airport	Kotzebue	United States	OTZ	PAOT	America/Anchorage
3507	Altoona Blair County Airport	Altoona	United States	AOO	KAOO	America/New_York
3508	Dyess Air Force Base	Abilene	United States	DYS	KDYS	America/Chicago
3509	South Arkansas Regional At Goodwin Field	El Dorado	United States	ELD	KELD	America/Chicago
3510	La Guardia Airport	New York	United States	LGA	KLGA	America/New_York
3511	Tallahassee Regional Airport	Tallahassee	United States	TLH	KTLH	America/New_York
3512	Dupage Airport	West Chicago	United States	DPA	KDPA	America/Chicago
3513	Waco Regional Airport	Waco	United States	ACT	KACT	America/Chicago
3514	Augusta State Airport	Augusta	United States	AUG	KAUG	America/New_York
3515	Hillsboro Municipal Airport	Hillsboro	United States		KINJ	America/Chicago
3516	Jacksonville Naval Air Station (Towers Field)	Jacksonville	United States	NIP	KNIP	America/New_York
3517	McKellar-Sipes Regional Airport	Jackson	United States	MKL	KMKL	America/Chicago
3518	Molokai Airport	Molokai	United States	MKK	PHMK	Pacific/Honolulu
3519	Godman Army Air Field	Fort Knox	United States	FTK	KFTK	America/New_York
3520	New River MCAS /H/ /Mccutcheon Fld/ Airport	Jacksonville	United States		KNCA	America/New_York
3521	San Angelo Regional Mathis Field	San Angelo	United States	SJT	KSJT	America/Chicago
3522	Calexico International Airport	Calexico	United States	CXL	KCXL	America/Los_Angeles
3523	Chico Municipal Airport	Chico	United States	CIC	KCIC	America/Los_Angeles
3524	Burlington International Airport	Burlington	United States	BTV	KBTV	America/New_York
3525	Jacksonville International Airport	Jacksonville	United States	JAX	KJAX	America/New_York
3526	Durango La Plata County Airport	Durango	United States	DRO	KDRO	America/Denver
3527	Washington Dulles International Airport	Washington	United States	IAD	KIAD	America/New_York
3528	Easterwood Field	College Station	United States	CLL	KCLL	America/Chicago
3529	Felts Field	Spokane	United States	SFF	KSFF	America/Los_Angeles
3530	General Mitchell International Airport	Milwaukee	United States	MKE	KMKE	America/Chicago
3531	Abilene Regional Airport	Abilene	United States	ABI	KABI	America/Chicago
3532	Columbia Regional Airport	Columbia	United States	COU	KCOU	America/Chicago
3533	Portland International Airport	Portland	United States	PDX	KPDX	America/Los_Angeles
3534	Dade Collier Training and Transition Airport	Miami	United States	TNT	KTNT	America/New_York
3535	Palm Beach International Airport	West Palm Beach	United States	PBI	KPBI	America/New_York
3536	Fort Worth Meacham International Airport	Fort Worth	United States	FTW	KFTW	America/Chicago
3537	Ogdensburg International Airport	Ogdensburg	United States	OGS	KOGS	America/New_York
3538	Cape Cod Coast Guard Air Station	Falmouth	United States	FMH	KFMH	America/New_York
3539	Boeing Field King County International Airport	Seattle	United States	BFI	KBFI	America/Los_Angeles
3540	Lackland Air Force Base	San Antonio	United States	SKF	KSKF	America/Chicago
3541	Daniel K Inouye International Airport	Honolulu	United States	HNL	PHNL	Pacific/Honolulu
3542	Des Moines International Airport	Des Moines	United States	DSM	KDSM	America/Chicago
3543	Coastal Carolina Regional Airport	New Bern	United States	EWN	KEWN	America/New_York
3544	San Diego International Airport	San Diego	United States	SAN	KSAN	America/Los_Angeles
3545	Monroe Regional Airport	Monroe	United States	MLU	KMLU	America/Chicago
3546	Shaw Air Force Base	Sumter	United States	SSC	KSSC	America/New_York
3547	Ontario International Airport	Ontario	United States	ONT	KONT	America/Los_Angeles
3548	Majors Airport	Greenvile	United States	GVT	KGVT	America/Chicago
3549	Roswell International Air Center Airport	Roswell	United States	ROW	KROW	America/Denver
3550	Coleman A. Young Municipal Airport	Detroit	United States	DET	KDET	America/New_York
3551	Brownsville South Padre Island International Airport	Brownsville	United States	BRO	KBRO	America/Chicago
3552	Dothan Regional Airport	Dothan	United States	DHN	KDHN	America/Chicago
3553	Cape May County Airport	Wildwood	United States	WWD	KWWD	America/New_York
3554	Fallon Naval Air Station	Fallon	United States	NFL	KNFL	America/Los_Angeles
3555	Selfridge Air National Guard Base Airport	Mount Clemens	United States	MTC	KMTC	America/New_York
3556	Four Corners Regional Airport	Farmington	United States	FMN	KFMN	America/Denver
3557	Corpus Christi International Airport	Corpus Christi	United States	CRP	KCRP	America/Chicago
3558	Syracuse Hancock International Airport	Syracuse	United States	SYR	KSYR	America/New_York
3559	Naval Air Station Key West/Boca Chica Field	Key West	United States	NQX	KNQX	America/New_York
3560	Chicago Midway International Airport	Chicago	United States	MDW	KMDW	America/Chicago
3561	Norman Y. Mineta San Jose International Airport	San Jose	United States	SJC	KSJC	America/Los_Angeles
3562	Lea County Regional Airport	Hobbs	United States	HOB	KHOB	America/Denver
3563	Northeast Philadelphia Airport	Philadelphia	United States	PNE	KPNE	America/New_York
3564	Denver International Airport	Denver	United States	DEN	KDEN	America/Denver
3565	Philadelphia International Airport	Philadelphia	United States	PHL	KPHL	America/New_York
3566	Sioux Gateway Col. Bud Day Field	Sioux City	United States	SUX	KSUX	America/Chicago
3567	Middle Georgia Regional Airport	Macon	United States	MCN	KMCN	America/New_York
3568	Truth Or Consequences Municipal Airport	Truth Or Consequences	United States	TCS	KTCS	America/Denver
3569	Palmdale Regional/USAF Plant 42 Airport	Palmdale	United States	PMD	KPMD	America/Los_Angeles
3570	Randolph Air Force Base	San Antonio	United States	RND	KRND	America/Chicago
3571	El Centro NAF Airport (Vraciu Field)	El Centro	United States	NJK	KNJK	America/Los_Angeles
3572	John Glenn Columbus International Airport	Columbus	United States	CMH	KCMH	America/New_York
3573	Drake Field	Fayetteville	United States	FYV	KFYV	America/Chicago
3574	Henry Post Army Air Field (Fort Sill)	Fort Sill	United States	FSI	KFSI	America/Chicago
3575	Princeton Municipal Airport	Princeton	United States		KPNM	America/Chicago
3576	Wright-Patterson Air Force Base	Dayton	United States	FFO	KFFO	America/New_York
3577	Edward G. Pitka Sr Airport	Galena	United States	GAL	PAGA	America/Anchorage
3578	Chandler Municipal Airport	Chandler	United States		KCHD	America/Phoenix
3579	Mineral Wells Airport	Mineral Wells	United States	MWL	KMWL	America/Chicago
3580	Mc Connell Air Force Base	Wichita	United States	IAB	KIAB	America/Chicago
3581	New Orleans NAS JRB/Alvin Callender Field	New Orleans	United States	NBG	KNBG	America/Chicago
3582	Beaufort County Airport	Beaufort	United States	BFT	KARW	America/New_York
3583	Texarkana Regional Webb Field	Texarkana	United States	TXK	KTXK	America/Chicago
3584	Plattsburgh International Airport	Plattsburgh	United States	PBG	KPBG	America/New_York
3585	Phillips Army Air Field	Aberdeen	United States	APG	KAPG	America/New_York
3586	Tucumcari Municipal Airport	Tucumcari	United States	TCC	KTCC	America/Denver
3587	Ted Stevens Anchorage International Airport	Anchorage	United States	ANC	PANC	America/Anchorage
3588	Robert Gray  Army Air Field Airport	Killeen	United States	GRK	KGRK	America/Chicago
3589	Black Rock Airport	Zuni Pueblo	United States		KZUN	America/Denver
3590	Bellingham International Airport	Bellingham	United States	BLI	KBLI	America/Los_Angeles
3591	Millington-Memphis Airport	Millington	United States	NQA	KNQA	America/Chicago
3592	Elkins-Randolph Co-Jennings Randolph Field	Elkins	United States	EKN	KEKN	America/New_York
3593	Hartford Brainard Airport	Hartford	United States	HFD	KHFD	America/New_York
3594	North Central State Airport	Smithfield	United States	SFZ	KSFZ	America/New_York
3595	Mobile Regional Airport	Mobile	United States	MOB	KMOB	America/Chicago
3596	Moffett Federal Airfield	Mountain View	United States	NUQ	KNUQ	America/Los_Angeles
3597	Santa Fe Municipal Airport	Santa Fe	United States	SAF	KSAF	America/Denver
3598	Barking Sands Airport	Barking Sands	United States	BKH	PHBK	Pacific/Honolulu
3599	Beauregard Regional Airport	Deridder	United States	DRI	KDRI	America/Chicago
3600	Bradshaw Army Airfield	Bradshaw Field	United States	BSF	PHSF	Pacific/Honolulu
3601	Nogales International Airport	Nogales	United States	OLS	KOLS	America/Phoenix
3602	Mac Dill Air Force Base	Tampa	United States	MCF	KMCF	America/New_York
3603	Scott AFB/Midamerica Airport	Belleville	United States	BLV	KBLV	America/Chicago
3604	Opa-locka Executive Airport	Miami	United States	OPF	KOPF	America/New_York
3605	Del Rio International Airport	Del Rio	United States	DRT	KDRT	America/Chicago
3606	Southwest Florida International Airport	Fort Myers	United States	RSW	KRSW	America/New_York
3607	King Salmon Airport	King Salmon	United States	AKN	PAKN	America/Anchorage
3608	Muir Army Air Field (Fort Indiantown Gap) Airport	Muir	United States	MUI	KMUI	America/New_York
3609	Kapalua Airport	Lahania-kapalua	United States	JHM	PHJH	Pacific/Honolulu
3610	John F Kennedy International Airport	New York	United States	JFK	KJFK	America/New_York
3611	Homestead ARB Airport	Homestead	United States	HST	KHST	America/New_York
3612	Riverside Municipal Airport	Riverside	United States	RAL	KRAL	America/Los_Angeles
3613	Sherman Army Air Field	Fort Leavenworth	United States	FLV	KFLV	America/Chicago
3614	Wallops Flight Facility Airport	Wallops Island	United States	WAL	KWAL	America/New_York
3615	Holloman Air Force Base	Alamogordo	United States	HMN	KHMN	America/Denver
3616	Willow Grove Naval Air Station/Joint Reserve Base	Willow Grove	United States	NXX	KNXX	America/New_York
3617	Cheyenne Regional Jerry Olson Field	Cheyenne	United States	CYS	KCYS	America/Denver
3618	Stockton Metropolitan Airport	Stockton	United States	SCK	KSCK	America/Los_Angeles
3619	Charleston Air Force Base-International Airport	Charleston	United States	CHS	KCHS	America/New_York
3620	Reno Tahoe International Airport	Reno	United States	RNO	KRNO	America/Los_Angeles
3621	Ketchikan International Airport	Ketchikan	United States	KTN	PAKT	America/Anchorage
3622	Willow Run Airport	Detroit	United States	YIP	KYIP	America/New_York
3623	Vandenberg Air Force Base	Lompoc	United States	VBG	KVBG	America/Los_Angeles
3624	Birmingham-Shuttlesworth International Airport	Birmingham	United States	BHM	KBHM	America/Chicago
3625	Lakehurst Maxfield Field Airport	Lakehurst	United States	NEL	KNEL	America/New_York
3626	Eareckson Air Station	Shemya	United States	SYA	PASY	America/Adak
3627	Nellis Air Force Base	Las Vegas	United States	LSV	KLSV	America/Los_Angeles
3628	March ARB Airport	Riverside	United States	RIV	KRIV	America/Los_Angeles
3629	Modesto City Co-Harry Sham Field	Modesto	United States	MOD	KMOD	America/Los_Angeles
3630	Sacramento International Airport	Sacramento	United States	SMF	KSMF	America/Los_Angeles
3631	Waukegan National Airport	Chicago	United States	UGN	KUGN	America/Chicago
3632	City of Colorado Springs Municipal Airport	Colorado Springs	United States	COS	KCOS	America/Denver
3633	Buffalo Niagara International Airport	Buffalo	United States	BUF	KBUF	America/New_York
3634	Griffing Sandusky Airport	Sandusky	United States	SKY	KSKY	America/New_York
3635	Snohomish County (Paine Field) Airport	Everett	United States	PAE	KPAE	America/Los_Angeles
3636	Mountain Home Air Force Base	Mountain Home	United States	MUO	KMUO	America/Denver
3637	Cedar City Regional Airport	Cedar City	United States	CDC	KCDC	America/Denver
3638	Bradley International Airport	Windsor Locks	United States	BDL	KBDL	America/New_York
3639	Mc Allen Miller International Airport	Mcallen	United States	MFE	KMFE	America/Chicago
3640	Norfolk Naval Station (Chambers Field)	Norfolk	United States	NGU	KNGU	America/New_York
3641	Westover ARB/Metropolitan Airport	Chicopee Falls	United States	CEF	KCEF	America/New_York
3642	Lubbock Preston Smith International Airport	Lubbock	United States	LBB	KLBB	America/Chicago
3643	Chicago O'Hare International Airport	Chicago	United States	ORD	KORD	America/Chicago
3644	Boca Raton Airport	Boca Raton	United States	BCT	KBCT	America/New_York
3645	Fairbanks International Airport	Fairbanks	United States	FAI	PAFA	America/Anchorage
3646	Quantico MCAF /Turner field	Quantico	United States		KNYG	America/New_York
3647	Cannon Air Force Base	Clovis	United States	CVS	KCVS	America/Denver
3648	Kaneohe Bay MCAS (Marion E. Carl Field) Airport	Kaneohe Bay	United States	NGF	PHNG	Pacific/Honolulu
3649	Offutt Air Force Base	Omaha	United States	OFF	KOFF	America/Chicago
3650	Gulkana Airport	Gulkana	United States	GKN	PAGK	America/Anchorage
3651	Watertown International Airport	Watertown	United States	ART	KART	America/New_York
3652	Palm Springs International Airport	Palm Springs	United States	PSP	KPSP	America/Los_Angeles
3653	Rick Husband Amarillo International Airport	Amarillo	United States	AMA	KAMA	America/Chicago
3654	Fort Dodge Regional Airport	Fort Dodge	United States	FOD	KFOD	America/Chicago
3655	Barksdale Air Force Base	Shreveport	United States	BAD	KBAD	America/Chicago
3656	Topeka Regional Airport - Forbes Field	Topeka	United States	FOE	KFOE	America/Chicago
3657	Cotulla-La Salle County Airport	Cotulla	United States	COT	KCOT	America/Chicago
3658	Wilmington International Airport	Wilmington	United States	ILM	KILM	America/New_York
3659	Baton Rouge Metropolitan Airport	Baton Rouge	United States	BTR	KBTR	America/Chicago
3660	Meridian Naval Air Station	Meridian	United States		KNMM	America/Chicago
3661	Tyler Pounds Regional Airport	Tyler	United States	TYR	KTYR	America/Chicago
3662	Baltimore/Washington International Thurgood Marshall Airport	Baltimore	United States	BWI	KBWI	America/New_York
3663	Hobart Regional Airport	Hobart	United States	HBR	KHBR	America/Chicago
3664	Lanai Airport	Lanai	United States	LNY	PHNY	Pacific/Honolulu
3665	Alexandria International Airport	Alexandria	United States	AEX	KAEX	America/Chicago
3666	Condron Army Air Field	White Sands	United States	WSD	KWSD	America/Denver
3667	Cold Bay Airport	Cold Bay	United States	CDB	PACD	America/Anchorage
3668	Tulsa International Airport	Tulsa	United States	TUL	KTUL	America/Chicago
3669	Sitka Rocky Gutierrez Airport	Sitka	United States	SIT	PASI	America/Anchorage
3670	Long Island Mac Arthur Airport	Islip	United States	ISP	KISP	America/New_York
3671	Minneapolis-St Paul International/Wold-Chamberlain Airport	Minneapolis	United States	MSP	KMSP	America/Chicago
3672	New Castle Airport	Wilmington	United States	ILG	KILG	America/New_York
3673	Unalaska Airport	Unalaska	United States	DUT	PADU	America/Anchorage
3674	Louis Armstrong New Orleans International Airport	New Orleans	United States	MSY	KMSY	America/Chicago
3675	Portland International Jetport Airport	Portland	United States	PWM	KPWM	America/New_York
3676	Will Rogers World Airport	Oklahoma City	United States	OKC	KOKC	America/Chicago
3677	Albany International Airport	Albany	United States	ALB	KALB	America/New_York
3678	Valdez Pioneer Field	Valdez	United States	VDZ	PAVD	America/Anchorage
3679	Langley Air Force Base	Hampton	United States	LFI	KLFI	America/New_York
3680	John Wayne Airport-Orange County Airport	Santa Ana	United States	SNA	KSNA	America/Los_Angeles
3681	Columbus Air Force Base	Colombus	United States	CBM	KCBM	America/Chicago
3682	Kendall-Tamiami Executive Airport	Kendall-tamiami	United States	TMB	KTMB	America/New_York
3683	Oceana Naval Air Station	Oceana	United States	NTU	KNTU	America/New_York
3684	Grissom Air Reserve Base	Peru	United States	GUS	KGUS	America/New_York
3685	Casper-Natrona County International Airport	Casper	United States	CPR	KCPR	America/Denver
3686	Destin-Ft Walton Beach Airport	Valparaiso	United States	VPS	KVPS	America/Chicago
3687	Craig Field	Selma	United States	SEM	KSEM	America/Chicago
3688	Key West International Airport	Key West	United States	EYW	KEYW	America/New_York
3689	Charlotte Douglas International Airport	Charlotte	United States	CLT	KCLT	America/New_York
3690	McCarran International Airport	Las Vegas	United States	LAS	KLAS	America/Los_Angeles
3691	Orlando International Airport	Orlando	United States	MCO	KMCO	America/New_York
3692	Florence Regional Airport	Florence	United States	FLO	KFLO	America/New_York
3693	Great Falls International Airport	Great Falls	United States	GTF	KGTF	America/Denver
3694	Youngstown Warren Regional Airport	Youngstown	United States	YNG	KYNG	America/New_York
3695	Ladd AAF Airfield	Fort Wainwright	United States	FBK	PAFB	America/Anchorage
3696	Mc Minnville Municipal Airport	Mackminnville	United States		KMMV	America/Los_Angeles
3697	Robins Air Force Base	Macon	United States	WRB	KWRB	America/New_York
3698	Suvarnabhumi Airport	Bangkok	Thailand	BKK	VTBS	Asia/Bangkok
3699	Naha Airport	Naha	Indonesia	NAH	WAMH	Asia/Makassar
3700	Andi Jemma Airport	Masamba	Indonesia	MXB	WAWM	Asia/Makassar
3701	Soroako Airport	Soroako	Indonesia	SQR	WAWS	Asia/Makassar
3702	Pongtiku Airport	Makale	Indonesia	TTR	WAWT	Asia/Makassar
3703	Wolter Monginsidi Airport	Kendari	Indonesia	KDI	WAWW	Asia/Makassar
3704	Maimun Saleh Airport	Sabang	Indonesia	SBG	WITB	Asia/Jakarta
3705	Cibeureum Airport	Tasikmalaya	Indonesia	TSY	WICM	Asia/Jakarta
3706	Iswahyudi Airport	Madiun	Indonesia		WARI	Asia/Jakarta
3707	Abdul Rachman Saleh Airport	Malang	Indonesia	MLG	WARA	Asia/Jakarta
3708	Budiarto Airport	Tangerang	Indonesia		WICB	Asia/Jakarta
3709	Husein Sastranegara International Airport	Bandung	Indonesia	BDO	WICC	Asia/Jakarta
3710	Penggung Airport	Cirebon	Indonesia	CBN	WICD	Asia/Jakarta
3711	Adi Sutjipto International Airport	Yogyakarta	Indonesia	JOG	WARJ	Asia/Jakarta
3712	Tunggul Wulung Airport	Cilacap	Indonesia	CXP	WIHL	Asia/Jakarta
3713	Pondok Cabe Air Base	Jakarta	Indonesia	PCB	WIHP	Asia/Jakarta
3714	Achmad Yani Airport	Semarang	Indonesia	SRG	WARS	Asia/Jakarta
3715	Hang Nadim International Airport	Batam	Indonesia	BTH	WIDD	Asia/Jakarta
3716	Buluh Tumbang (H A S Hanandjoeddin) Airport	Tanjung Pandan	Indonesia	TJQ	WIOD	Asia/Jakarta
3717	Pangkal Pinang (Depati Amir) Airport	Pangkal Pinang	Indonesia	PGK	WIPK	Asia/Jakarta
3718	Raja Haji Fisabilillah International Airport	Tanjung Pinang	Indonesia	TNJ	WIDN	Asia/Jakarta
3719	Dabo Airport	Singkep	Indonesia	SIQ	WIDS	Asia/Jakarta
3720	Syamsudin Noor Airport	Banjarmasin	Indonesia	BDJ	WAOO	Asia/Makassar
3721	Batu Licin Airport	Batu Licin	Indonesia	BTW	WAOC	Asia/Makassar
3722	Iskandar Airport	Pangkalan Bun	Indonesia	PKN	WAOI	Asia/Jakarta
3723	Tjilik Riwut Airport	Palangkaraya	Indonesia	PKY	WAOP	Asia/Jakarta
3724	Maumere(Wai Oti) Airport	Maumere	Indonesia	MOF	WATC	Asia/Makassar
3725	Ende (H Hasan Aroeboesman) Airport	Ende	Indonesia	ENE	WATE	Asia/Makassar
3726	Frans Sales Lega Airport	Ruteng	Indonesia	RTG	WATG	Asia/Makassar
3727	El Tari Airport	Kupang	Indonesia	KOE	WATT	Asia/Makassar
3728	Komodo Airport	Labuhan Bajo	Indonesia	LBJ	WATO	Asia/Makassar
3729	Sultan Aji Muhamad Sulaiman Airport	Balikpapan	Indonesia	BPN	WALL	Asia/Makassar
3730	Juwata Airport	Taraken	Indonesia	TRK	WALR	Asia/Makassar
3731	Temindung Airport	Samarinda	Indonesia	SRI	WALS	Asia/Makassar
3732	Tanjung Santan Airport	Tanjung Santan	Indonesia	TSX	WALT	Asia/Makassar
3733	Selaparang Airport	Mataram	Indonesia	AMI	WADA	Asia/Makassar
3734	Muhammad Salahuddin Airport	Bima	Indonesia	BMU	WADB	Asia/Makassar
3735	Umbu Mehang Kunda Airport	Waingapu	Indonesia	WGP	WADW	Asia/Makassar
3736	Juanda International Airport	Surabaya	Indonesia	SUB	WARR	Asia/Jakarta
3737	Adi Sumarmo Wiryokusumo Airport	Solo City	Indonesia	SOC	WARQ	Asia/Jakarta
3738	Incheon International Airport	Seoul	South Korea	ICN	RKSI	Asia/Seoul
3739	Chiang Mai International Airport	Chiang Mai	Thailand	CNX	VTCC	Asia/Bangkok
3740	Chiang Rai International Airport	Chiang Rai	Thailand	CEI	VTCT	Asia/Bangkok
3741	Nakhon Si Thammarat Airport	Nakhon Si Thammarat	Thailand	NST	VTSF	Asia/Bangkok
3742	Nakhon Ratchasima Airport	Nakhon Ratchasima	Thailand	NAK	VTUQ	Asia/Bangkok
3743	Nakhon Phanom Airport	Nakhon Phanom	Thailand	KOP	VTUW	Asia/Bangkok
3744	Ubon Ratchathani Airport	Ubon Ratchathani	Thailand	UBP	VTUU	Asia/Bangkok
3745	Khon Kaen Airport	Khon Kaen	Thailand	KKC	VTUK	Asia/Bangkok
3746	Sukhothai Airport	Sukhothai	Thailand	THS	VTPO	Asia/Bangkok
3747	Ngurah Rai (Bali) International Airport	Denpasar	Indonesia	DPS	WADD	Asia/Makassar
3748	Eleftherios Venizelos International Airport	Athens	Greece	ATH	LGAV	Europe/Athens
3749	Chubu Centrair International Airport	Nagoya	Japan	NGO	RJGG	Asia/Tokyo
3750	Kobe Airport	Kobe	Japan	UKB	RJBE	Asia/Tokyo
3751	Pullman Moscow Regional Airport	Pullman	United States	PUW	KPUW	America/Los_Angeles
3752	Lewiston Nez Perce County Airport	Lewiston	United States	LWS	KLWS	America/Los_Angeles
3753	Elmira Corning Regional Airport	Elmira	United States	ELM	KELM	America/New_York
3754	Ithaca Tompkins Regional Airport	Ithaca	United States	ITH	KITH	America/New_York
3755	Monterey Peninsula Airport	Monterey	United States	MRY	KMRY	America/Los_Angeles
3756	Santa Barbara Municipal Airport	Santa Barbara	United States	SBA	KSBA	America/Los_Angeles
3757	Daytona Beach International Airport	Daytona Beach	United States	DAB	KDAB	America/New_York
3758	Liepāja International Airport	Liepaja	Latvia	LPX	EVLA	Europe/Riga
3759	Riga International Airport	Riga	Latvia	RIX	EVRA	Europe/Riga
3760	Šiauliai International Airport	Siauliai	Lithuania	SQQ	EYSA	Europe/Vilnius
3761	Barysiai Airport	Barysiai	Lithuania	HLJ	EYSB	Europe/Vilnius
3762	Kaunas International Airport	Kaunas	Lithuania	KUN	EYKA	Europe/Vilnius
3763	S. Darius and S. Girėnas Airfield	Kaunas	Lithuania		EYKS	Europe/Vilnius
3764	Palanga International Airport	Palanga	Lithuania	PLQ	EYPA	Europe/Vilnius
3765	Vilnius International Airport	Vilnius	Lithuania	VNO	EYVI	Europe/Vilnius
3766	Panevėžys Air Base	Panevezys	Lithuania	PNV	EYPP	Europe/Vilnius
3767	Erebuni Airport	Yerevan	Armenia		UDYE	Asia/Yerevan
3768	Stepanavan Airport	Stepanavan	Armenia		UDLS	Asia/Yerevan
3769	Zvartnots International Airport	Yerevan	Armenia	EVN	UDYZ	Asia/Yerevan
3770	Gyumri Shirak Airport	Gyumri	Armenia	LWN	UDSG	Asia/Yerevan
3771	Assab International Airport	Assab	Eritrea	ASA	HHSB	Africa/Asmera
3772	Asmara International Airport	Asmara	Eritrea	ASM	HHAS	Africa/Asmera
3773	Massawa International Airport	Massawa	Eritrea	MSW	HHMS	Africa/Asmera
3774	Yasser Arafat International Airport	Gaza	Palestine	GZA	LVGZ	Asia/Gaza
3775	Batumi International Airport	Batumi	Georgia	BUS	UGSB	Asia/Tbilisi
3776	Kopitnari Airport	Kutaisi	Georgia	KUT	UGKO	Asia/Tbilisi
3777	Tbilisi International Airport	Tbilisi	Georgia	TBS	UGTB	Asia/Tbilisi
3778	Mukalla International Airport	Mukalla	Yemen	RIY	OYRN	Asia/Aden
3779	Ta'izz International Airport	Taiz	Yemen	TAI	OYTZ	Asia/Aden
3780	Hodeidah International Airport	Hodeidah	Yemen	HOD	OYHD	Asia/Aden
3781	Aden International Airport	Aden	Yemen	ADE	OYAA	Asia/Aden
3782	Ataq Airport	Ataq	Yemen	AXK	OYAT	Asia/Aden
3783	Al Ghaidah International Airport	Al Ghaidah Intl	Yemen	AAY	OYGD	Asia/Aden
3784	Sana'a International Airport	Sanaa	Yemen	SAH	OYSN	Asia/Aden
3785	Beihan Airport	Beihan	Yemen	BHN	OYBN	Asia/Aden
3786	Socotra International Airport	Socotra	Yemen	SCT	OYSQ	Asia/Aden
3787	Al Badie Airport	Al Badie	Yemen		OYBA	Asia/Aden
3788	Memmingen Allgau Airport	Memmingen	Germany	FMM	EDJA	Europe/Berlin
3789	Nevşehir Kapadokya Airport	Nevsehir	Turkey	NAV	LTAZ	Europe/Istanbul
3790	Ministro Pistarini International Airport	Buenos Aires	Argentina	EZE	SAEZ	America/Buenos_Aires
3791	Erbil International Airport	Erbil	Iraq	EBL	ORER	Asia/Baghdad
3792	Emerald Airport	Emerald	Australia	EMD	YEML	Australia/Brisbane
3793	Athen Helenikon Airport	Athens	Greece	HEW	LGAT	Europe/Athens
3794	Kansai International Airport	Osaka	Japan	KIX	RJBB	Asia/Tokyo
3795	Downtown-Manhattan/Wall St Heliport	New York	United States	JRB	KJRB	America/New_York
3796	Tagbilaran Airport	Tagbilaran	Philippines	TAG	RPVT	Asia/Manila
3797	Ilulissat Airport	Ilulissat	Greenland	JAV	BGJN	America/Godthab
3798	Qasigiannguit Heliport	Qasigiannguit	Greenland	JCH	BGCH	America/Godthab
3799	Aasiaat Airport	Aasiaat	Greenland	JEG	BGAA	America/Godthab
3800	Palma De Mallorca Airport	Palma de Mallorca	Spain	PMI	LEPA	Europe/Madrid
3801	Darwin International Airport	Darwin	Australia	DRW	YPDN	Australia/Darwin
3802	Surat Thani Airport	Surat Thani	Thailand	URT	VTSB	Asia/Bangkok
3803	Bagan Intl	Nyuang U	Burma		VYBR	Asia/Rangoon
3804	Godofredo P	Caticlan	Philippines		RPXE	Asia/Manila
3805	Bimini North Seaplane Base	Bimini	Bahamas	NSB		America/Nassau
3806	Talkeetna Airport	Talkeetna	United States	TKA	PATK	America/Anchorage
3807	Xewkija Heliport	Gozo	Malta	GZM	LMMG	Europe/Malta
3808	Tweed New Haven Airport	New Haven	United States	HVN	KHVN	America/New_York
3809	Asheville Regional Airport	Asheville	United States	AVL	KAVL	America/New_York
3810	Piedmont Triad International Airport	Greensboro	United States	GSO	KGSO	America/New_York
3811	Joe Foss Field Airport	Sioux Falls	United States	FSD	KFSD	America/Chicago
3812	Ayers Rock Connellan Airport	Uluru	Australia	AYQ	YAYE	Australia/Darwin
3813	Manchester-Boston Regional Airport	Manchester NH	United States	MHT	KMHT	America/New_York
3814	Naples Municipal Airport	Naples	United States	APF	KAPF	America/New_York
3815	LTS Pulau Redang Airport	Redang	Malaysia	RDN	WMPR	Asia/Kuala_Lumpur
3816	Louisville International Standiford Field	Louisville	United States	SDF	KSDF	America/New_York
3817	Charlottesville Albemarle Airport	Charlottesville VA	United States	CHO	KCHO	America/New_York
3818	Roanoke–Blacksburg Regional Airport	Roanoke VA	United States	ROA	KROA	America/New_York
3819	Blue Grass Airport	Lexington KY	United States	LEX	KLEX	America/New_York
3820	Evansville Regional Airport	Evansville	United States	EVV	KEVV	America/Chicago
3821	Albuquerque International Sunport	Albuquerque	United States	ABQ	KABQ	America/Denver
3822	Gallatin Field	Bozeman	United States	BZN	KBZN	America/Denver
3823	Billings Logan International Airport	Billings	United States	BIL	KBIL	America/Denver
3824	Bert Mooney Airport	Butte	United States	BTM	KBTM	America/Denver
3825	Cherry Capital Airport	Traverse City	United States	TVC	KTVC	America/New_York
3826	Mundo Maya International Airport	Flores	Guatemala	FRS	MGTK	America/Guatemala
3827	Hancock County-Bar Harbor Airport	Bar Harbor	United States	BHB	KBHB	America/New_York
3828	Knox County Regional Airport	Rockland	United States	RKD	KRKD	America/New_York
3829	Jackson Hole Airport	Jacksn Hole	United States	JAC	KJAC	America/Denver
3830	Chicago Rockford International Airport	Rockford	United States	RFD	KRFD	America/Chicago
3831	Domodedovo International Airport	Moscow	Russia	DME	UUDD	Europe/Moscow
3832	Sanya Phoenix International Airport	Sanya	China	SYX	ZJSY	Asia/Shanghai
3833	Milford Sound Airport	Milford Sound	New Zealand	MFN	NZMF	Pacific/Auckland
3834	East 34th Street Heliport	New York	United States	TSS	NONE	America/New_York
3835	Lijiang Airport	Lijiang	China	LJG	ZPLJ	Asia/Shanghai
3836	Greenville Spartanburg International Airport	Greenville	United States	GSP	KGSP	America/New_York
3837	Cologne Railway	Cologne	Germany	QKL		Europe/Berlin
3838	Stuttgart Railway Station	Stuttgart	Germany	ZWS		Europe/Berlin
3839	Central Illinois Regional Airport at Bloomington-Normal	Bloomington	United States	BMI	KBMI	America/Chicago
3840	Gulfport Biloxi International Airport	Gulfport	United States	GPT	KGPT	America/Chicago
3841	Kalamazoo Battle Creek International Airport	Kalamazoo	United States	AZO	KAZO	America/New_York
3842	Toledo Express Airport	Toledo	United States	TOL	KTOL	America/New_York
3843	Fort Wayne International Airport	Fort Wayne	United States	FWA	KFWA	America/New_York
3844	Decatur Airport	Decatur	United States	DEC	KDEC	America/Chicago
3845	The Eastern Iowa Airport	Cedar Rapids	United States	CID	KCID	America/Chicago
3846	La Crosse Municipal Airport	La Crosse	United States	LSE	KLSE	America/Chicago
3847	Central Wisconsin Airport	Wassau	United States	CWA	KCWA	America/Chicago
3848	General Wayne A. Downing Peoria International Airport	Peoria	United States	PIA	KPIA	America/Chicago
3849	Appleton International Airport	Appleton	United States	ATW	KATW	America/Chicago
3850	Rochester International Airport	Rochester	United States	RST	KRST	America/Chicago
3851	University of Illinois Willard Airport	Champaign	United States	CMI	KCMI	America/Chicago
3852	Manhattan Regional Airport	Manhattan	United States	MHK	KMHK	America/Chicago
3853	Kingscote Airport	Kingscote	Australia	KGC	YKSC	Australia/Adelaide
3854	Hervey Bay Airport	Hervey Bay	Australia	HVB	YHBA	Australia/Brisbane
3855	EuroAirport Basel-Mulhouse-Freiburg	Basel	Switzerland			Europe/Paris
3856	Dali Airport	Dali	China	DLU	ZPDL	Asia/Shanghai
3857	Jinghong	Jinghong	China			Asia/Shanghai
3858	Mulu Airport	Mulu	Malaysia	MZV	WBMU	Asia/Kuala_Lumpur
3859	Sharm El Sheikh International Airport	Sharm El Sheikh	Egypt	SSH	HESH	Africa/Cairo
3860	Venango Regional Airport	Franklin	United States	FKL	KFKL	America/New_York
3861	Jomo Kenyatta International Airport	Nairobi	Kenya	NBO	HKJK	Africa/Nairobi
3862	Seronera Airport	Seronera	Tanzania	SEU	HTSN	Africa/Dar_es_Salaam
3863	El Calafate Airport	El Calafate	Argentina	FTE	SAWC	America/Argentina/Rio_Gallegos
3864	Armidale Airport	Armidale	Australia	ARM	YARM	Australia/Sydney
3865	Grand Junction Regional Airport	Grand Junction	United States	GJT	KGJT	America/Denver
3866	St George Municipal Airport	Saint George	United States	SGU	KSGU	America/Denver
3867	David Wayne Hooks Memorial Airport	Houston	United States	DWH	KDWH	America/Chicago
3868	Port O'Connor Private Heliport	Port O\\\\'Connor	United States		XS46	America/Chicago
3869	Sarasota Bradenton International Airport	Sarasota	United States	SRQ	KSRQ	America/New_York
3870	L.F. Wade International International Airport	Bermuda	Bermuda	BDA	TXKF	Atlantic/Bermuda
3871	Arthur Dunn Airpark	Titusville	United States	X21		America/New_York
3872	Van Nuys Airport	Van Nuys	United States	VNY	KVNY	America/Los_Angeles
3873	Quad City International Airport	Moline	United States	MLI	KMLI	America/Chicago
3874	Panama City-Bay Co International Airport	Panama City	United States	PFN	KPFN	America/Chicago
3875	Honiara International Airport	Honiara	Solomon Islands	HIR	AGGH	Pacific/Guadalcanal
3876	Faa'a International Airport	Papeete	French Polynesia	PPT	NTAA	Pacific/Tahiti
3877	Nauru International Airport	Nauru	Nauru	INU	ANYN	Pacific/Nauru
3878	Funafuti International Airport	Funafuti	Tuvalu	FUN	NGFU	Pacific/Funafuti
3879	Tolmachevo Airport	Novosibirsk	Russia	OVB	UNNT	Asia/Krasnoyarsk
3880	Orlando	Orlando	United States	DWS		America/New_York
3881	Samsø Airport	Samsoe	Denmark		EKSS	Europe/Copenhagen
3882	Xieng Khouang Airport	Phon Savan	Laos	XKH	VLXK	Asia/Vientiane
3883	Phu Bai	Hue	Vietnam			Asia/Saigon
3884	Bismarck Municipal Airport	Bismarck	United States	BIS	KBIS	America/Chicago
3885	Telluride Regional Airport	Telluride	United States	TEX	KTEX	America/Denver
3886	Yinchuan Airport	Yinchuan	China		ZLIC	Asia/Shanghai
3887	Mae Hong Son Airport	Mae Hong Son	Thailand	HGN	VTCH	Asia/Bangkok
3888	Rapid City Regional Airport	Rapid City	United States	RAP	KRAP	America/Denver
3889	Mc Clellan-Palomar Airport	Carlsbad	United States	CLD	KCRQ	America/Los_Angeles
3890	Bishop International Airport	Flint	United States	FNT	KFNT	America/New_York
3891	Francisco Bangoy International Airport	Davao	Philippines	DVO	RPMD	Asia/Manila
3892	Madeira Airport	Funchal	Portugal	FNC	LPMA	Europe/Lisbon
3893	Maestro Wilson Fonseca Airport	Santarem	Brazil	STM	SBSN	America/Belem
3894	Sihanoukville International Airport	Sihanoukville	Cambodia	KOS	VDSV	Asia/Phnom_Penh
3895	Ekati Airport	Ekati	Canada	YOA	CYOA	America/Edmonton
3896	Hawke's Bay Airport	NAPIER	New Zealand	NPE	NZNR	Pacific/Auckland
3897	Levuka Airfield	Levuka	Fiji	LEV	NFNB	Pacific/Fiji
3898	Lhasa Gonggar Airport	Lhasa	China	LXA	ZULS	Asia/Shanghai
3899	Redding Municipal Airport	Redding	United States	RDD	KRDD	America/Los_Angeles
3900	Mahlon Sweet Field	Eugene	United States	EUG	KEUG	America/Los_Angeles
3901	Idaho Falls Regional Airport	Idaho Falls	United States	IDA	KIDA	America/Denver
3902	Rogue Valley International Medford Airport	Medford	United States	MFR	KMFR	America/Los_Angeles
3903	Kaikoura Airport	Kaikoura	New Zealand	KBZ	NZKI	Pacific/Auckland
3904	Roberts Field	Redmond-Bend	United States	RDM	KRDM	America/Los_Angeles
3905	Picton Aerodrome	Picton	New Zealand	PCN	NZPN	Pacific/Auckland
3906	Hosea Kutako International Airport	Windhoek	Namibia	WDH	FYWH	Africa/Windhoek
3907	Victoria Harbour Seaplane Base	Victoria	Canada	YWH	CYWH	America/Vancouver
3908	Coal Harbour Seaplane Base	Vancouver	Canada		CAQ3	America/Vancouver
3909	Yaoqiang Airport	Jinan	China	TNA	ZSJN	Asia/Shanghai
3910	Changzhou Benniu Airport	Changzhou	China	CZX	ZSCG	Asia/Shanghai
3911	Yibin Caiba Airport	Yibin	China	YBP	ZUYB	Asia/Shanghai
3912	Roshchino International Airport	Tyumen	Russia	TJM	USTR	Asia/Yekaterinburg
3913	Akron Canton Regional Airport	Akron	United States	CAK	KCAK	America/New_York
3914	Huntsville International Carl T Jones Field	Huntsville	United States	HSV	KHSV	America/Chicago
3915	Mid Ohio Valley Regional Airport	PARKERSBURG	United States	PKB	KPKB	America/New_York
3916	Montgomery Regional (Dannelly Field) Airport	MONTGOMERY	United States	MGM	KMGM	America/Chicago
3917	Tri-Cities Regional TN/VA Airport	BRISTOL	United States	TRI	KTRI	America/New_York
3918	Barkley Regional Airport	PADUCAH	United States	PAH	KPAH	America/Chicago
3919	Kurumoch	Samara	Russia			Europe/Samara
3920	Djibouti-Ambouli Airport	Djibouti	Djibouti	JIB	HDAM	Africa/Djibouti
3921	Haikou Meilan International Airport	Haikou	China	HAK	ZJHK	Asia/Shanghai
3922	Mafia Island Airport	Mafia Island	Tanzania	MFA	HTMA	Africa/Dar_es_Salaam
3923	Mtemere Airstrip	Selous	Tanzania			Africa/Dar_es_Salaam
3924	Page Municipal Airport	Page	United States	PGA	KPGA	America/Phoenix
3925	Utila Airport	Utila	Honduras	UII	MHUT	America/Tegucigalpa
3926	Santa Elena Airport	Santa Elena de Uairen	Venezuela			America/Caracas
3927	Glacier Park International Airport	Kalispell	United States	FCA	KGPI	America/Denver
3928	MBS International Airport	Saginaw	United States	MBS	KMBS	America/New_York
3929	Greater Binghamton/Edwin A Link field	Binghamton	United States	BGM	KBGM	America/New_York
3930	Baghdad International Airport	Baghdad	Iraq	BGW	ORBI	Asia/Baghdad
3931	Nan Airport	Nan	Thailand	NNT	VTCN	Asia/Bangkok
3932	Roi Et Airport	Roi Et	Thailand	ROI	VTUV	Asia/Bangkok
3933	Buri Ram Airport	Buri Ram	Thailand	BFV	VTUO	Asia/Bangkok
3934	Ranong	Ranong	Thailand			Asia/Bangkok
3935	Trat Airport	Trat	Thailand	TDX	VTBO	Asia/Bangkok
3936	Blythe Airport	Blythe	United States	BLH	KBLH	America/Los_Angeles
3937	Al Asad Air Base	Al Asad	Iraq	IQA	ORAA	Asia/Baghdad
3938	Al Taqaddum Air Base	Al Taqaddum	Iraq	TQD	ORAT	Asia/Baghdad
3939	Joint Base Balad	Al Bakr	Iraq	XQC	ORBD	Asia/Baghdad
3940	Diosdado Macapagal International Airport	Angeles City	Philippines	CRK	RPLC	Asia/Manila
3941	Sandakan Airport	Sandakan	Malaysia	SDK	WBKS	Asia/Kuala_Lumpur
3942	Luang Namtha Airport	Luang Namtha	Laos	LXG	VLLN	Asia/Vientiane
3943	Oudomsay Airport	Muang Xay	Laos	ODY	VLOS	Asia/Vientiane
3944	Taoxian Airport	Shenyang	China	SHE	ZYTX	Asia/Shanghai
3945	Dongying Shengli Airport	Dongying	China	DOY	ZSDY	Asia/Shanghai
3946	John A. Osborne Airport	Geralds	Montserrat	MNI	TRPG	America/Montserrat
3947	Petersburg James A Johnson Airport	Petersburg	United States	PSG	PAPG	America/Anchorage
3948	Luoyang Airport	Luoyang	China	LYA	ZHLY	Asia/Shanghai
3949	Xuzhou Guanyin Airport	Xuzhou	China	XUZ	ZSXZ	Asia/Shanghai
3950	Esfahan Shahid Beheshti Intl	Isfahan	Iran			Asia/Tehran
3951	Magway Airport	Magwe	Burma	MWQ	VYMW	Asia/Rangoon
3952	Kanti Airport	Khamti	Burma	KHM	VYKI	Asia/Rangoon
3953	Lien Khuong Airport	Dalat	Vietnam	DLI	VVDL	Asia/Saigon
3954	Dong Hoi Airport	Dong Hoi	Vietnam	VDH	VVDH	Asia/Saigon
3955	Rach Gia Airport	Rach Gia	Vietnam	VKG	VVRG	Asia/Saigon
3956	Cà Mau Airport	Ca Mau	Vietnam	CAH	VVCM	Asia/Saigon
3957	Chu Lai International Airport	Chu Lai	Vietnam	VCL	VVCA	Asia/Saigon
3958	Dong Tac Airport	Tuy Hoa	Vietnam	TBB	VVTH	Asia/Saigon
3959	Mae Hong Son Airport	Pai	Thailand	PYY	VTCI	Asia/Bangkok
3960	Bol Airport	Brac	Croatia	BWK	LDSB	Europe/Zagreb
3961	Yaoundé Nsimalen International Airport	Yaounde	Cameroon	NSI	FKYS	Africa/Douala
3962	Conakry International Airport	Conakry	Guinea	CKY	GUCY	Africa/Conakry
3963	Bergrestaurant	Trogen	Switzerland			Europe/Zurich
3964	Uetliberg	Zuerich	Switzerland			Europe/Zurich
3965	Aachen-Merzbrück Airport	Aachen	Germany	AAH	EDKA	Europe/Berlin
3966	Karlsruhe Baden-Baden Airport	Karlsruhe/Baden-Baden	Germany	FKB	EDSB	Europe/Berlin
3967	Orlando Sanford International Airport	Sanford	United States	SFB	KSFB	America/New_York
3968	Duong Dong Airport	Phu Quoc	Vietnam			Asia/Saigon
3969	John Murtha Johnstown Cambria County Airport	Johnstown	United States	JST	KJST	America/New_York
3970	Lukla Airport	Lukla	Nepal	LUA	VNLK	Asia/Katmandu
3971	Bhojpur Airport	Bhojpur	Nepal	BHP	VNBJ	Asia/Katmandu
3972	Lamidanda Airport	Lamidanda	Nepal	LDN	VNLD	Asia/Katmandu
3973	Jomsom Airport	Jomsom	Nepal	JMO	VNJS	Asia/Katmandu
3974	Manang Airport	Manang	Nepal	NGX	VNMA	Asia/Katmandu
3975	Phaplu Airport	Phaplu	Nepal	PPL	VNPL	Asia/Katmandu
3976	Thamkharka	Thamkharka	Nepal	TMK		Asia/Katmandu
3977	Rumjatar Airport	Rumjatar	Nepal	RUM	VNRT	Asia/Katmandu
3978	Tulsipur Airport	Dang	Nepal	DNP	VNDG	Asia/Katmandu
3979	Rukum Chaurjahari Airport	Rukumkot	Nepal	RUK	VNRK	Asia/Katmandu
3980	Jumla Airport	Jumla	Nepal	JUM	VNJL	Asia/Katmandu
3981	Chaurjhari	Chaurjhari	Nepal	HRJ	VNCJ	Asia/Katmandu
3982	Taplejung Airport	Taplejung	Nepal	TPJ	VNTJ	Asia/Katmandu
3983	Tumling Tar Airport	Tumling Tar	Nepal	TMI	VNTR	Asia/Katmandu
3984	Surkhet Airport	Surkhet	Nepal	SKH	VNSK	Asia/Katmandu
3985	Simikot Airport	Simikot	Nepal	IMK	VNST	Asia/Katmandu
3986	Dolpa Airport	Dolpa	Nepal	DOP	VNDP	Asia/Katmandu
3987	Bajhang Airport	Bajhang	Nepal	BJH	VNBG	Asia/Katmandu
3988	Dhangarhi Airport	Dhangarhi	Nepal	DHI	VNDH	Asia/Katmandu
3989	Muan International Airport	Muan	South Korea	MWX	RKJB	Asia/Seoul
3990	Astypalaia Airport	Astypalaia	Greece	JTY	LGPL	Europe/Athens
3991	Ikaria Airport	Ikaria	Greece	JIK	LGIK	Europe/Athens
3992	Kalymnos Airport	Kalymnos	Greece	JKL	LGKY	Europe/Athens
3993	Milos Airport	Milos	Greece	MLO	LGML	Europe/Athens
3994	Naxos Airport	Cyclades Islands	Greece	JNX	LGNX	Europe/Athens
3995	Paros National Airport	Paros	Greece	PAS	LGPA	Europe/Athens
3996	Kastelorizo Airport	Kastelorizo	Greece	KZS	LGKJ	Europe/Athens
3997	Marsa Alam International Airport	Marsa Alam	Egypt	RMF	HEMA	Africa/Cairo
3998	Weeze Airport	Weeze	Germany	NRN	EDLV	Europe/Berlin
3999	Francisco B. Reyes Airport	Busuanga	Philippines	USU	RPVV	Asia/Manila
4000	Bancasi Airport	Butuan	Philippines	BXU	RPME	Asia/Manila
4001	Dipolog Airport	Dipolog	Philippines	DPL	RPMG	Asia/Manila
4002	Laoag International Airport	Laoag	Philippines	LAO	RPLI	Asia/Manila
4003	Legazpi City International Airport	Legazpi	Philippines	LGP	RPLP	Asia/Manila
4004	Labo Airport	Ozamis	Philippines	OZC	RPMO	Asia/Manila
4005	Mactan Cebu International Airport	Cebu	Philippines	CEB	RPVM	Asia/Manila
4006	Norden-Norddeich Airport	Norden	Germany	NOD	EDWS	Europe/Berlin
4007	Juist Airport	Juist	Germany	JUI	EDWJ	Europe/Berlin
4008	Porto Seguro Airport	Porto Seguro	Brazil	BPS	SBPS	America/Fortaleza
4009	Gounda Airport	Gounda	Central African Republic	GDA		Africa/Bangui
4010	Heliport Hotel das Cataratas	Cataratas National Park	Brazil			America/Cordoba
4011	Iguatu Airport	Iguatu	Brazil	QIG	SNIG	America/Fortaleza
4012	Brigadeiro Lysias Rodrigues Airport	Palmas	Brazil	PMW	SBPJ	America/Fortaleza
4013	Nelson Ribeiro Guimarães Airport	Caldas Novas	Brazil	CLV	SBCN	America/Sao_Paulo
4014	Missoula International Airport	Missoula	United States	MSO	KMSO	America/Denver
4015	Blackall Airport	Blackall	Australia	BKQ	YBCK	Australia/Brisbane
4016	Bundaberg Airport	Bundaberg	Australia	BDB	YBUD	Australia/Brisbane
4017	Grand Canyon National Park Airport	Grand Canyon	United States	GCN	KGCN	America/Phoenix
4018	Sugar Land Regional Airport	Sugar Land	United States	SGR	KSGR	America/Chicago
4019	Hayman Island Heliport	Hayman Island	Australia		YHYN	Australia/Brisbane
4020	Centennial Airport	Denver	United States	APA	KAPA	America/Denver
4021	Clovis Municipal Airport	Clovis	United States	CVN	KCVN	America/Denver
4022	Fort Stockton Pecos County Airport	Fort Stockton	United States	FST	KFST	America/Chicago
4023	Las Vegas Municipal Airport	Las Vegas	United States	LVS	KLVS	America/Denver
4024	West Houston Airport	Houston	United States	IWS	KIWS	America/Chicago
4025	La Junta Municipal Airport	La Junta	United States		KLHX	America/Denver
4026	Las Cruces International Airport	Las Cruces	United States	LRU	KLRU	America/Denver
4027	Stephens County Airport	Breckenridge	United States	BKD	KBKD	America/Chicago
4028	Draughon Miller Central Texas Regional Airport	Temple	United States	TPL	KTPL	America/Chicago
4029	Ozona Municipal Airport	Ozona	United States	OZA	KOZA	America/Chicago
4030	Hong Kong Kai Tak	Hong Kong	Hong Kong		VHXX	Asia/Hong_Kong
4031	Kaadedhdhoo Airport	Kaadedhdhoo	Maldives	KDM	VRMT	Indian/Maldives
4032	Aklavik/Freddie Carmichael Airport	Aklavik	Canada	LAK	CYKD	America/Edmonton
4033	Déline Airport	Deline	Canada	YWJ	CYWJ	America/Edmonton
4034	Tulita Airport	Tulita	Canada	ZFN	CZFN	America/Edmonton
4035	Fort Good Hope Airport	Fort Good Hope	Canada	YGH	CYGH	America/Edmonton
4036	Inuvik Town	Inuvik	Canada			America/Edmonton
4037	INAWR	Inuvik	Canada			America/Edmonton
4038	Tanna Airport	Tanna	Vanuatu	TAH	NVVW	Pacific/Efate
4039	Paulatuk (Nora Aliqatchialuk Ruben) Airport	Paulatuk	Canada	YPC	CYPC	America/Edmonton
4040	Nicholson Peninsula	Nicholson Peninsula	Canada		YUCX	America/Edmonton
4041	El Trompillo Airport	Santa Cruz	Bolivia	SRZ	SLET	America/La_Paz
4042	Kulusuk	Kulusuk	Greenland	KUS		America/Godthab
4043	Juancho E. Yrausquin Airport	Saba	Netherlands Antilles	SAB	TNCS	America/Curacao
4044	Eagle County Regional Airport	Vail	United States	EGE	KEGE	America/Denver
4045	Stapleton	Denver	United States			America/Denver
4046	Stokmarknes Skagen Airport	Stokmarknes	Norway	SKN	ENSK	Europe/Oslo
4047	Cuyahoga County Airport	Richmond Heights	United States	CGF	KCGF	America/New_York
4048	Mansfield Lahm Regional Airport	Mansfield	United States	MFD	KMFD	America/New_York
4049	Columbus Metropolitan Airport	Columbus	United States	CSG	KCSG	America/New_York
4050	Lawton Fort Sill Regional Airport	Lawton	United States	LAW	KLAW	America/Chicago
4051	Northern Colorado Regional Airport	Fort Collins	United States	FNL	KFNL	America/Denver
4052	Flagstaff Pulliam Airport	Flagstaff	United States	FLG	KFLG	America/Phoenix
4053	Lake Tahoe Airport	South Lake Tahoe	United States	TVL	KTVL	America/Los_Angeles
4054	Joslin Field Magic Valley Regional Airport	Twin Falls	United States	TWF	KTWF	America/Denver
4055	Monaco	Monaco	Monaco	MCM		Europe/Monaco
4056	Martha's Vineyard Airport	Vineyard Haven MA	United States	MVY	KMVY	America/New_York
4057	Newport State	Newport RI	United States	UUU		America/New_York
4058	Hartness State	Springfield VT	United States	VSF		America/New_York
4059	Concord Municipal Airport	Concord NH	United States	CON	KCON	America/New_York
4060	Sanford Regional	Sanford ME	United States	SFM		America/New_York
4061	Groton New London Airport	Groton CT	United States	GON	KGON	America/New_York
4062	St Cloud Regional Airport	Saint Cloud	United States	STC	KSTC	America/Chicago
4063	Qinhuangdao Beidaihe Airport	Bagan	Burma	BPE	ZBDH	Asia/Shanghai
4064	Golden Triangle Regional Airport	Columbus Mississippi	United States	GTR	KGTR	America/Chicago
4065	Nizhny Novgorod Strigino International Airport	Nizhniy Novgorod	Russia	GOJ	UWGG	Europe/Moscow
4066	Bowerman Airport	Hoquiam	United States	HQM	KHQM	America/Los_Angeles
4067	Erie International Tom Ridge Field	Erie	United States	ERI	KERI	America/New_York
4068	Conrad Maldives Resort	Rangali Island	Maldives			Indian/Maldives
4069	Barnstable Municipal Boardman Polando Field	Barnstable	United States	HYA	KHYA	America/New_York
4070	San Pedro Airport	San Pedro	Belize	SPR	MZSP	America/Belize
4071	Sedona Airport	Sedona	United States	SDX	KSEZ	America/Phoenix
4072	Dry Tortugas	Dry Tortugas	United States			America/New_York
4073	Dry Tortugas	Dry Tortugas	United States			Africa/Tripoli
4074	Dry Tortugas	Dry Tortugas	United States			Asia/Calcutta
4075	Morgantown Municipal Walter L. Bill Hart Field	Morgantown	United States	MGW	KMGW	America/New_York
4076	Yeager Airport	Charleston	United States	CRW	KCRW	America/New_York
4077	Wilkes Barre Scranton International Airport	Scranton	United States	AVP	KAVP	America/New_York
4078	Bemidji Regional Airport	Bemidji	United States	BJI	KBJI	America/Chicago
4079	Heydar Aliyev	Baku	Azerbaijan	BAK		Asia/Baku
4080	Thangool Airport	Biloela	Australia	THG	YTNG	Australia/Brisbane
4081	Fagali'i Airport	Apia	Samoa	FGI	NSFI	Pacific/Apia
4082	Ballina Byron Gateway Airport	Ballina Byron Bay	Australia	BNK	YBNA	Australia/Sydney
4083	Hector International Airport	Fargo	United States	FAR	KFAR	America/Chicago
4084	Charles B. Wheeler Downtown Airport	Kansas City	United States	MKC	KMKC	America/Chicago
4085	Ratanakiri Airport	Ratanakiri	Cambodia	RBE	VDRK	Asia/Phnom_Penh
4086	Gillette Campbell County Airport	Gillette	United States	GCC	KGCC	America/Denver
4087	Bogashevo Airport	Tomsk	Russia	TOF	UNTT	Asia/Krasnoyarsk
4088	El Toro Marine Corps Air Station	Santa Ana	United States	NZJ	KNZJ	America/Los_Angeles
4089	Phetchabun Airport	Phetchabun	Thailand	PHY	VTPB	Asia/Bangkok
4090	Chumphon Airport	Chumphon	Thailand	CJM	VTSE	Asia/Bangkok
4091	Jiuzhai Huanglong Airport	Jiuzhaigou	China	JZH	ZUJZ	Asia/Shanghai
4092	Jieyang Chaoshan International Airport	Shantou	China	SWA	ZGOW	Asia/Shanghai
4093	Enghien Moisselles Airfield	Enghien-moisselles	France		LFFE	Europe/Paris
4094	Cheddi Jagan International Airport	Georgetown	Guyana	GEO	SYCJ	America/Guyana
4095	Guarani International Airport	Ciudad del Este	Paraguay	AGT	SGES	America/Asuncion
4096	Eugene F. Correira International Airport	Georgetown	Guyana	OGL	SYGO	America/Guyana
4097	Kaieteur International Airport	Kaieteur	Guyana	KAI	PKSA	America/Guyana
4098	Dunhuang Airport	Dunhuang	China	DNH	ZLDH	Asia/Shanghai
4099	Ancona Falconara Airport	Ancona	Italy	AOI	LIPY	Europe/Rome
4100	Samjiyon	Samjiyon	South Korea		ZZ04	Asia/Shanghai
4101	Chamonate Airport	Copiapo	Chile		SCHA	America/Santiago
4102	Taba International Airport	Taba	Egypt	TCP	HETB	Africa/Cairo
4103	Edward Bodden Airfield	Little Cayman	Cayman Islands	LYB	MWCL	America/Cayman
4104	Milas Bodrum International Airport	Bodrum	Turkey	BJV	LTFE	Europe/Istanbul
4105	Tabarka 7 Novembre Airport	Tabarka	Tunisia	TBJ	DTKA	Africa/Tunis
4106	Sabiha Gökçen International Airport	Istanbul	Turkey	SAW	LTFJ	Europe/Istanbul
4107	University Park Airport	State College Pennsylvania	United States	SCE	KUNV	America/New_York
4108	Broome International Airport	Broome	Australia	BME	YBRM	Australia/Perth
4109	Newcastle Airport	Newcastle	Australia	NTL	YWLM	Australia/Sydney
4110	Bakki Airport	Bakki	Iceland		BIBA	Atlantic/Reykjavik
4111	Klagenfurt Airport	Klagenfurt	Austria	KLU	LOWK	Europe/Vienna
4112	General Manuel Carlos Piar	Ciudad Guayana	Venezuela	CGU		America/Caracas
4113	Flugplatz Hoepen	Schneverdingen	Germany			Europe/Berlin
4114	Hammerfest Airport	Hammerfest	Norway	HFT	ENHF	Europe/Oslo
4115	Valan Airport	Honningsvag	Norway	HVG	ENHV	Europe/Oslo
4116	Mehamn Airport	Mehamn	Norway	MEH	ENMH	Europe/Oslo
4117	Vadsø Airport	Vadsø	Norway	VDS	ENVD	Europe/Oslo
4118	Riem	Munich	Germany		MUCX	Europe/Berlin
4119	Imam Khomeini International Airport	Tehran	Iran	IKA	OIIE	Asia/Tehran
4120	Mashhad International Airport	Mashhad	Iran	MHD	OIMM	Asia/Tehran
4121	Egelsbach	Egelsbach	Germany			Europe/Berlin
4122	Ust-Ilimsk Airport	Ust Ilimsk	Russia	UIK	UIBS	Asia/Irkutsk
4123	Mudanjiang	Mudanjiang	China			Asia/Shanghai
4125	Abraham Lincoln Capital Airport	Springfield	United States	SPI	KSPI	America/Chicago
4126	Uzundzhovo	Haskovo	Bulgaria	HKV	LB14	Europe/Sofia
4127	Cortez Municipal Airport	Cortez	United States	CEZ	KCEZ	America/Denver
4128	Yampa Valley Airport	Hayden	United States	HDN	KHDN	America/Denver
4129	Gallup Municipal Airport	Gallup	United States	GUP	KGUP	America/Denver
4130	Liberal Mid-America Regional Airport	Liberal	United States	LBL	KLBL	America/Chicago
4131	Lamar Municipal Airport	Lamar	United States	LAA	KLAA	America/Denver
4132	Renner Field-Goodland Municipal Airport	Goodland	United States	GLD	KGLD	America/Denver
4133	Yellowstone Regional Airport	Cody	United States	COD	KCOD	America/Denver
4134	Ørsta-Volda Airport	Hovden	Orsta-Volda	Norway	HOV	E
4135	RNAS WATTON	WATTON	United Kingdom		EGYR	Europe/London
4136	St. Mary's Airport	ST MARY\\\\'S	United Kingdom	ISC	EGHE	Europe/London
4137	Springfield Branson National Airport	Springfield	United States	SGF	KSGF	America/Chicago
4138	Narvik Framnes Airport	Narvik	Norway	NVK	ENNK	Europe/Oslo
4139	Berlevåg Airport	Berlevag	Norway	BVG	ENBV	Europe/Oslo
4140	Oslo	Fornebu Airport	Oslo	Norway	FBU	E
4141	Norilsk-Alykel Airport	Norilsk	Russia	NSK	UOOO	Asia/Krasnoyarsk
4142	Anapa Vityazevo Airport	Anapa	Russia	AAQ	URKA	Europe/Moscow
4143	Joplin Regional Airport	Joplin	United States	JLN	KJLN	America/Chicago
4144	Lehigh Valley International Airport	Allentown	United States	ABE	KABE	America/New_York
4145	Northwest Arkansas Regional Airport	Bentonville	United States	XNA	KXNA	America/Chicago
4146	Atyrau Airport	Atyrau	Kazakhstan	GUW	UATG	Asia/Oral
4147	Kzyl-Orda Southwest Airport	Kzyl-Orda	Kazakhstan	KZO	UAOO	Asia/Qyzylorda
4148	South Bend Regional Airport	South Bend	United States	SBN	KSBN	America/New_York
4149	Bykovo Airport	Moscow	Russia	BKA	UUBB	Europe/Moscow
4150	Chintheche	Chintheche	Malawi		FWCC	Africa/Blantyre
4151	Talagi Airport	Arkhangelsk	Russia	ARH	ULAA	Europe/Moscow
4152	Saratov Central Airport	Saratov	Russia	RTW	UWSS	Europe/Moscow
4153	Novy Urengoy Airport	Novy Urengoy	Russia	NUX	USMU	Asia/Yekaterinburg
4154	Noyabrsk Airport	Noyabrsk	Russia	NOJ	USRO	Asia/Yekaterinburg
4155	Aktau Airport	Aktau	Kazakhstan	SCO	UATE	Asia/Oral
4156	Ukhta Airport	Ukhta	Russia	UCT	UUYH	Europe/Moscow
4157	Usinsk Airport	Usinsk	Russia	USK	UUYS	Europe/Moscow
4158	Pechora Airport	Pechora	Russia	PEX	UUYP	Europe/Moscow
4159	Naryan Mar Airport	Naryan-Mar	Russia	NNM	ULAM	Europe/Moscow
4160	Pskov Airport	Pskov	Russia	PKV	ULOO	Europe/Moscow
4161	Kogalym International Airport	Kogalym	Russia	KGP	USRK	Asia/Yekaterinburg
4162	Yemelyanovo Airport	Krasnoyarsk	Russia	KJA	UNKL	Asia/Krasnoyarsk
4163	Sary-Arka Airport	Karaganda	Kazakhstan	KGF	UAKK	Asia/Qyzylorda
4164	Novosibirsk North Airport	Novosibirsk	Russia		UNCC	Asia/Krasnoyarsk
4165	Uray Airport	Uraj	Russia	URJ	USHU	Asia/Yekaterinburg
4166	Turkmenabat	Turkmenabat	Turkmenistan			Asia/Ashgabat
4167	Ivanovo South Airport	Ivanovo	Russia	IWA	UUBI	Europe/Moscow
4168	Longjia Airport	Changchun	China	CGQ	ZYCC	Asia/Shanghai
4169	Niigata Airport	Niigata	Japan	KIJ	RJSN	Asia/Tokyo
4170	Johnston Atoll Airport	Johnston Island	Johnston Atoll	JON	PJON	Pacific/Johnston
4171	Smith Field	Fort Wayne IN	United States	SMD	KSMD	America/New_York
4172	California Redwood Coast-Humboldt County Airport	Arcata CA	United States	ACV	KACV	America/Los_Angeles
4173	Camp Mabry Austin City	Austin TX	United States	ATT	KATT	America/Chicago
4174	Albert J Ellis Airport	Jacksonville NC	United States	OAJ	KOAJ	America/New_York
4175	Tuscaloosa Regional Airport	Tuscaloosa AL	United States	TCL	KTCL	America/Chicago
4176	Dubuque Regional Airport	Dubuque IA	United States	DBQ	KDBQ	America/Chicago
4177	Forde Bringeland	Forde	Norway	FDE		Europe/Oslo
4178	Shun Tak Heliport	Hong Kong	Hong Kong	HHP	VHST	Asia/Hong_Kong
4179	Uru Harbour Airport	Atoifi	Solomon Islands	ATD	AGAT	Pacific/Guadalcanal
4180	Gwaunaru'u Airport	Auki	Solomon Islands	AKS	AGGA	Pacific/Guadalcanal
4181	Ballalae Airport	Ballalae	Solomon Islands	BAS	AGGE	Pacific/Guadalcanal
4182	Fera/Maringe Airport	Fera Island	Solomon Islands	FRE	AGGF	Pacific/Guadalcanal
4183	Babanakira Airport	Mbambanakira	Solomon Islands	MBU	AGGI	Pacific/Guadalcanal
4184	Ngorangora Airport	Kirakira	Solomon Islands	IRA	AGGK	Pacific/Guadalcanal
4185	Santa Cruz/Graciosa Bay/Luova Airport	Santa Cruz/Graciosa Bay/Luova	Solomon Islands	SCZ	AGGL	Pacific/Guadalcanal
4186	Munda Airport	Munda	Solomon Islands	MUA	AGGM	Pacific/Guadalcanal
4187	Nusatupe Airport	Gizo	Solomon Islands	GZO	AGGN	Pacific/Guadalcanal
4188	Mono Airport	Stirling Island	Solomon Islands	MNY	AGGO	Pacific/Guadalcanal
4189	Rennell/Tingoa Airport	Rennell Island	Solomon Islands	RNL	AGGR	Pacific/Guadalcanal
4190	Marau Airport	Marau	Solomon Islands	RUS	AGGU	Pacific/Guadalcanal
4191	Suavanao Airport	Suavanao	Solomon Islands	VAO	AGGV	Pacific/Guadalcanal
4192	Kaghau Airport	Kagau Island	Solomon Islands	KGE	AGKG	Pacific/Guadalcanal
4193	Ramata Airport	Ramata	Solomon Islands	RBV	AGRM	Pacific/Guadalcanal
4194	Buka Airport	Buka Island	Papua New Guinea	BUA	AYBK	Pacific/Port_Moresby
4195	Chimbu Airport	Kundiawa	Papua New Guinea	CMU	AYCH	Pacific/Port_Moresby
4196	Daru Airport	Daru	Papua New Guinea	DAU	AYDU	Pacific/Port_Moresby
4197	Gurney Airport	Gurney	Papua New Guinea	GUR	AYGN	Pacific/Port_Moresby
4198	Girua Airport	Girua	Papua New Guinea	PNP	AYGR	Pacific/Port_Moresby
4199	Kimbe Airport	Hoskins	Papua New Guinea	HKN	AYHK	Pacific/Port_Moresby
4200	Kiunga Airport	Kiunga	Papua New Guinea	UNG	AYKI	Pacific/Port_Moresby
4201	Kikori Airport	Kikori	Papua New Guinea	KRI	AYKK	Pacific/Port_Moresby
4202	Kerema Airport	Kerema	Papua New Guinea	KMA	AYKM	Pacific/Port_Moresby
4203	Kavieng Airport	Kavieng	Papua New Guinea	KVG	AYKV	Pacific/Port_Moresby
4204	Mendi Airport	Mendi	Papua New Guinea	MDU	AYMN	Pacific/Port_Moresby
4205	Momote Airport	Momote	Papua New Guinea	MAS	AYMO	Pacific/Port_Moresby
4206	Moro Airport	Moro	Papua New Guinea	MXH	AYMR	Pacific/Port_Moresby
4207	Misima Island Airport	Misima Island	Papua New Guinea	MIS	AYMS	Pacific/Port_Moresby
4208	Tari Airport	Tari	Papua New Guinea	TIZ	AYTA	Pacific/Port_Moresby
4209	Tabubil Airport	Tabubil	Papua New Guinea	TBG	AYTB	Pacific/Port_Moresby
4210	Tokua Airport	Tokua	Papua New Guinea	RAB	AYTK	Pacific/Port_Moresby
4211	Vanimo Airport	Vanimo	Papua New Guinea	VAI	AYVN	Pacific/Port_Moresby
4212	Wapenamanda Airport	Wapenamanda	Papua New Guinea	WBM	AYWD	Pacific/Port_Moresby
4213	Alluitsup Paa Heliport	Alluitsup Paa	Greenland	LLU	BGAP	America/Godthab
4214	Neerlerit Inaat Airport	Neerlerit Inaat	Greenland	CNP	BGCO	America/Scoresbysund
4215	Paamiut Heliport	Paamiut	Greenland	JFR	BGFH	America/Godthab
4216	Qeqertarsuaq Heliport	Qeqertarsuaq Airport	Greenland	JGO	BGGN	America/Godthab
4217	Qaqortoq Heliport	Qaqortoq	Greenland	JJU	BGJH	America/Godthab
4218	Maniitsoq Airport	Maniitsoq	Greenland	JSU	BGMQ	America/Godthab
4219	Nanortalik Heliport	Nanortalik	Greenland	JNN	BGNN	America/Godthab
4220	Narsaq Heliport	Narsaq	Greenland	JNS	BGNS	America/Godthab
4221	Qaanaaq Airport	Qaanaaq	Greenland	NAQ	BGQQ	America/Thule
4222	Sisimiut Airport	Sisimiut	Greenland	JHS	BGSS	America/Godthab
4223	Upernavik Airport	Upernavik	Greenland	JUV	BGUK	America/Godthab
4224	Qaarsut Airport	Uummannaq	Greenland	JQA	BGUQ	America/Godthab
4225	Grímsey Airport	Grímsey	Iceland	GRY	BIGR	Atlantic/Reykjavik
4226	Thorshofn Airport	Thorshofn	Iceland	THO	BITN	Atlantic/Reykjavik
4227	Vopnafjörður Airport	Vopnafjörður	Iceland	VPN	BIVO	Atlantic/Reykjavik
4228	Caye Caulker Airport	Caye Caulker	Belize	CUK		America/Belize
4229	Punta Gorda Airport	Punta Gorda	Belize	PND		America/Belize
4230	Whistler/Green Lake Water Aerodrome	Whistler	Canada	YWS	CAE5	America/Vancouver
4231	Anahim Lake Airport	Anahim Lake	Canada	YAA	CAJ4	America/Vancouver
4232	Williams Harbour Airport	Williams Harbour	Canada	YWM	CCA6	America/St_Johns
4233	St. Lewis (Fox Harbour) Airport	St. Lewis	Canada	YFX	CCK4	America/St_Johns
4234	Port Hope Simpson Airport	Port Hope Simpson	Canada	YHA	CCP4	America/St_Johns
4235	Rigolet Airport	Rigolet	Canada	YRG	CCZ2	America/Halifax
4236	Colville Lake Airport	Colville Lake	Canada	YCK	CEB3	America/Edmonton
4237	Whatì Airport	Whatì	Canada	YLE	CEM3	America/Edmonton
4238	Summer Beaver Airport	Summer Beaver	Canada	SUR	CJV7	America/Toronto
4239	Wapekeka Airport	Angling Lake	Canada	YAX	CKB6	America/Winnipeg
4240	Wunnumin Lake Airport	Wunnumin Lake	Canada	WNN	CKL3	America/Toronto
4241	North Spirit Lake Airport	North Spirit Lake	Canada	YNO	CKQ3	America/Winnipeg
4242	Bearskin Lake Airport	Bearskin Lake	Canada	XBE	CNE3	America/Winnipeg
4243	Kingfisher Lake Airport	Kingfisher Lake	Canada	KIF	CNM5	America/Toronto
4244	Ogoki Post Airport	Ogoki Post	Canada	YOG	CNT3	America/Toronto
4245	Poplar Hill Airport	Poplar Hill	Canada	YHP	CPV7	America/Winnipeg
4246	Chisasibi Airport	Chisasibi	Canada	YKU	CSU2	America/Toronto
4247	Tête-à-la-Baleine Airport	Tête-à-la-Baleine	Canada	ZTB	CTB6	America/Blanc-Sablon
4248	La Tabatière Airport	La Tabatière	Canada	ZLT	CTU5	America/Blanc-Sablon
4249	Nantong Airport	Nantong	China	NTG		Asia/Shanghai
4250	Apartadó Airport	Apartadó	Colombia			America/Bogota
4251	Tarapacá Airport	Tarapacá	Colombia	TCD		America/Bogota
4252	Cat Lake Airport	Cat Lake	Canada	YAC	CYAC	America/Winnipeg
4253	Fort Frances Municipal Airport	Fort Frances	Canada	YAG	CYAG	America/Winnipeg
4254	Kasabonika Airport	Kasabonika	Canada	XKS	CYAQ	America/Toronto
4255	Kangirsuk Airport	Kangirsuk	Canada	YKG	CYAS	America/Toronto
4256	Attawapiskat Airport	Attawapiskat	Canada	YAT	CYAT	America/Toronto
4257	Lac Du Bonnet Airport	Lac Du Bonnet	Canada		CYAX	America/Winnipeg
4258	Uranium City Airport	Uranium City	Canada	YBE	CYBE	America/Regina
4259	Lourdes de Blanc Sablon Airport	Lourdes-De-Blanc-Sablon	Canada	YBX	CYBX	America/Blanc-Sablon
4260	Cartwright Airport	Cartwright	Canada	YRF	CYCA	America/Halifax
4261	Chesterfield Inlet Airport	Chesterfield Inlet	Canada	YCS	CYCS	America/Winnipeg
4262	Nain Airport	Nain	Canada	YDP	CYDP	America/Halifax
4263	Fort Severn Airport	Fort Severn	Canada	YER	CYER	America/Toronto
4264	Fort Albany Airport	Fort Albany	Canada	YFA	CYFA	America/Toronto
4265	Fort Hope Airport	Fort Hope	Canada	YFH	CYFH	America/Toronto
4266	Makkovik Airport	Makkovik	Canada	YMN	CYFT	America/Halifax
4267	Texada Gillies Bay Airport	Texada	Canada	YGB	CYGB	America/Vancouver
4268	Gods Lake Narrows Airport	Gods Lake Narrows	Canada	YGO	CYGO	America/Winnipeg
4269	Igloolik Airport	Igloolik	Canada	YGT	CYGT	America/Toronto
4270	Kuujjuarapik Airport	Kuujjuarapik	Canada	YGW	CYGW	America/Toronto
4271	Gillam Airport	Gillam	Canada	YGX	CYGX	America/Winnipeg
4272	Grise Fiord Airport	Grise Fiord	Canada	YGZ	CYGZ	America/Toronto
4273	Quaqtaq Airport	Quaqtaq	Canada	YQC	CYHA	America/Toronto
4274	Vancouver Harbour Water Aerodrome	Vancouver	Canada	CXH	CYHC	America/Vancouver
4275	Nemiscau Airport	Nemiscau	Canada	YNS	CYHH	America/Toronto
4276	Hopedale Airport	Hopedale	Canada	YHO	CYHO	America/Halifax
4277	Chevery Airport	Chevery	Canada	YHR	CYHR	America/Blanc-Sablon
4278	Ivujivik Airport	Ivujivik	Canada	YIK	CYIK	America/Toronto
4279	Island Lake Airport	Island Lake	Canada	YIV	CYIV	America/Winnipeg
4280	Akulivik Airport	Akulivik	Canada	AKV	CYKO	America/Toronto
4281	Waskaganish Airport	Waskaganish	Canada	YKQ	CYKQ	America/Toronto
4282	Aupaluk Airport	Aupaluk	Canada	YPJ	CYLA	America/Toronto
4283	Kimmirut Airport	Kimmirut	Canada	YLC	CYLC	America/Toronto
4284	Lansdowne House Airport	Lansdowne House	Canada	YLH	CYLH	America/Toronto
4285	St Georges Airport	Lutselk'e	Canada		CYSG	America/Toronto
4286	Kangiqsualujjuaq (Georges River) Airport	Kangiqsualujjuaq	Canada	XGR	CYLU	America/Toronto
4287	Mary's Harbour Airport	Mary's Harbour	Canada	YMH	CYMH	America/St_Johns
4288	Chapais Airport	Chibougamau	Canada	YMT	CYMT	America/Toronto
4289	Umiujaq Airport	Umiujaq	Canada	YUD	CYMU	America/Toronto
4290	Wemindji Airport	Wemindji	Canada	YNC	CYNC	America/Toronto
4291	Norway House Airport	Norway House	Canada	YNE	CYNE	America/Winnipeg
4292	Points North Landing Airport	Points North Landing	Canada	YNL	CYNL	America/Regina
4293	Oxford House Airport	Oxford House	Canada	YOH	CYOH	America/Winnipeg
4294	Inukjuak Airport	Inukjuak	Canada	YPH	CYPH	America/Toronto
4295	Pikangikum Airport	Pikangikum	Canada	YPM	CYPM	America/Winnipeg
4296	Peawanuck Airport	Peawanuck	Canada	YPO	CYPO	America/Toronto
4297	Powell River Airport	Powell River	Canada	YPW	CYPW	America/Vancouver
4298	The Pas Airport	The Pas	Canada	YQD	CYQD	America/Winnipeg
4299	Nakina Airport	Nakina	Canada	YQN	CYQN	America/Toronto
4300	Rae Lakes Airport	Gamètì	Canada	YRA	CYRA	America/Edmonton
4301	Red Lake Airport	Red Lake	Canada	YRL	CYRL	America/Winnipeg
4302	Stony Rapids Airport	Stony Rapids	Canada	YSF	CYSF	America/Regina
4303	Sanikiluaq Airport	Sanikiluaq	Canada	YSK	CYSK	
4304	St. Theresa Point Airport	St. Theresa Point	Canada	YST	CYST	America/Winnipeg
4305	Big Trout Lake Airport	Big Trout Lake	Canada	YTL	CYTL	America/Winnipeg
4306	Deer Lake Airport	Deer Lake	Canada	YVZ	CYVZ	America/Winnipeg
4307	Webequie Airport	Webequie	Canada	YWP	CYWP	America/Toronto
4308	Whale Cove Airport	Whale Cove	Canada	YXN	CYXN	America/Winnipeg
4309	Salluit Airport	Salluit	Canada	YZG	CYZG	America/Toronto
4310	York Landing Airport	York Landing	Canada	ZAC	CZAC	America/Winnipeg
4311	Ilford Airport	Ilford	Canada	ILF	CZBD	America/Winnipeg
4312	Bathurst Airport	Bathurst	Canada	ZBF	CZBF	America/Halifax
4313	Eastmain River Airport	Eastmain River	Canada	ZEM	CZEM	America/Toronto
4314	Fond-Du-Lac Airport	Fond-Du-Lac	Canada	ZFD	CZFD	America/Regina
4315	Gods River Airport	Gods River	Canada	ZGI	CZGI	America/Winnipeg
4316	Swan River Airport	Swan River	Canada	ZJN	CZJN	America/Winnipeg
4317	Kashechewan Airport	Kashechewan	Canada	ZKE	CZKE	America/Toronto
4318	Muskrat Dam Airport	Muskrat Dam	Canada	MSA	CZMD	America/Winnipeg
4319	Masset Airport	Masset	Canada	ZMT	CZMT	America/Vancouver
4320	Sachigo Lake Airport	Sachigo Lake	Canada	ZPB	CZPB	America/Winnipeg
4321	Round Lake (Weagamow Lake) Airport	Round Lake	Canada	ZRJ	CZRJ	America/Winnipeg
4322	Sandy Lake Airport	Sandy Lake	Canada	ZSJ	CZSJ	America/Winnipeg
4323	Shamattawa Airport	Shamattawa	Canada	ZTM	CZTM	America/Winnipeg
4324	Churchill Falls Airport	Churchill Falls	Canada	ZUM	CZUM	America/Halifax
4325	Wollaston Lake Airport	Wollaston Lake	Canada	ZWL	CZWL	America/Regina
4326	Batna Airport	Batna	Algeria	BLJ	DABT	Africa/Algiers
4327	Béchar Boudghene Ben Ali Lotfi Airport	Béchar	Algeria	CBH	DAOR	Africa/Algiers
4328	Bordj Badji Mokhtar Airport	Bordj Badji Mokhtar	Algeria	BMW	DATM	Africa/Algiers
4329	Guemar Airport	Guemar	Algeria	ELU	DAUO	Africa/Algiers
4330	Kumasi Airport	Kumasi	Ghana	KMS	DGSI	Africa/Accra
4331	Heringsdorf Airport	Heringsdorf	Germany	HDF	EDAH	Europe/Berlin
4332	Heide-Büsum Airport	Büsum	Germany	HEI	EDXB	Europe/Berlin
4333	Helgoland-Düne Airport	Helgoland	Germany	HGL	EDXH	Europe/Berlin
4334	Seinäjoki Airport	Seinäjoki / Ilmajoki	Finland	SJY	EFSI	Europe/Helsinki
4335	Nottingham Airport	Nottingham	United Kingdom	NQT	EGBN	Europe/London
4336	Robin Hood Doncaster Sheffield Airport	Doncaster	Sheffield	United Kingdom	DSA	E
4337	Campbeltown Airport	Campbeltown	United Kingdom	CAL	EGEC	Europe/London
4338	Eday Airport	Eday	United Kingdom	EOI	EGED	Europe/London
4339	Fair Isle Airport	Fair Isle	United Kingdom	FIE	EGEF	Europe/London
4340	North Ronaldsay Airport	North Ronaldsay	United Kingdom	NRL	EGEN	Europe/London
4341	Papa Westray Airport	Papa Westray	United Kingdom	PPW	EGEP	Europe/London
4342	Stronsay Airport	Stronsay	United Kingdom	SOY	EGER	Europe/London
4343	Sanday Airport	Sanday	United Kingdom	NDY	EGES	Europe/London
4344	Lerwick / Tingwall Airport	Lerwick	United Kingdom	LWK	EGET	Europe/London
4345	Westray Airport	Westray	United Kingdom	WRY	EGEW	Europe/London
4346	Land's End Airport	Land's End	United Kingdom	LEQ	EGHC	Europe/London
4347	Penzance Heliport	Penzance	United Kingdom	PZE	EGHK	Europe/London
4348	Anglesey Airport	Angelsey	United Kingdom	VLY	EGOV	Europe/London
4349	Barra Airport	Barra	United Kingdom	BRR	EGPR	Europe/London
4350	Donegal Airport	Dongloe	Ireland	CFN	EIDL	Europe/Dublin
4351	Weston Airport	Leixlip	Ireland		EIWT	Europe/Dublin
4352	Sindal Airport	Sindal	Denmark	CNL	EKSN	Europe/Copenhagen
4353	Leknes Airport	Leknes	Norway	LKN	ENLK	Europe/Oslo
4354	Namsos Høknesøra Airport	Namsos	Norway	OSY	ENNM	Europe/Oslo
4355	Mo i Rana Airport	Røssvoll	Mo i Rana	Norway	MQN	E
4356	Rørvik Airport	Ryum	Rørvik	Norway	RVK	E
4357	Røst Airport	Røst	Norway	RET	ENRS	Europe/Oslo
4358	Sandane Airport (Anda)	Sandane	Norway	SDN	ENSD	Europe/Oslo
4359	Sogndal Airport	Sogndal	Norway	SOG	ENSG	Europe/Oslo
4360	Svolvær Helle Airport	Svolvær	Norway	SVJ	ENSH	Europe/Oslo
4361	Sørkjosen Airport	Sorkjosen	Norway	SOJ	ENSR	Europe/Oslo
4362	Vardø Airport	Svartnes	Vardø	Norway	VAW	E
4363	Værøy Heliport	Værøy	Norway	VRY	ENVR	Europe/Oslo
4364	Bydgoszcz Ignacy Jan Paderewski Airport	Bydgoszcz	Poland	BZG	EPBY	Europe/Warsaw
4365	Łódź Władysław Reymont Airport	Lodz	Poland	LCJ	EPLL	Europe/Warsaw
4366	Åre Östersund Airport	Östersund	Sweden	OSD	ESNZ	Europe/Stockholm
4367	Hagfors Airport	Hagfors	Sweden	HFS	ESOH	Europe/Stockholm
4368	Karlstad Airport	Karlstad	Sweden	KSD	ESOK	Europe/Stockholm
4369	Torsby Airport	Torsby	Sweden	TYF	ESST	Europe/Stockholm
4370	Ängelholm-Helsingborg Airport	Ängelholm	Sweden	AGH	ESTA	Europe/Stockholm
4371	Storuman Airport	Mohed	Sweden	SQO	ESUD	Europe/Stockholm
4372	Hemavan Airport	Hemavan	Sweden	HMV	ESUT	Europe/Stockholm
4373	Shilavo Airport	Shilavo	Ethiopia	HIL		Africa/Addis_Ababa
4374	Shire Inda Selassie Airport	Shire Indasilase	Ethiopia	SHC		Africa/Addis_Ababa
4375	Ventspils International Airport	Ventspils	Latvia	VNT	EVVA	Europe/Riga
4376	Rand Airport	Johannesburg	South Africa	QRA	FAGM	Africa/Johannesburg
4377	Kruger Mpumalanga International Airport	Mpumalanga	South Africa	MQP	FAKN	Africa/Johannesburg
4378	Malamala Airport	Malamala	South Africa	AAM	FAMD	Africa/Johannesburg
4379	Mmabatho International Airport	Mafeking	South Africa	MBD	FAMM	Africa/Johannesburg
4380	Ghanzi Airport	Ghanzi	Botswana	GNZ	FBGZ	Africa/Gaborone
4381	Orapa Airport	Orapa	Botswana	ORP	FBOR	Africa/Gaborone
4382	Shakawe Airport	Shakawe	Botswana	SWX	FBSW	Africa/Gaborone
4383	Limpopo Valley Airport	Tuli Lodge	Botswana	TLD	FBTL	Africa/Gaborone
4384	Ngot Nzoungou Airport	Loubomo	Congo (Brazzaville)	DIS	FCPL	Africa/Brazzaville
4385	Chipata Airport	Chipata	Zambia	CIP	FLCP	Africa/Lusaka
4386	Los Alamitos Army Air Field	Solwesi	Zambia		KSLI	America/Los_Angeles
4387	Iconi Airport	Moroni	Comoros	YVA	FMCN	Indian/Comoro
4388	Antsalova Airport	Antsalova	Madagascar	WAQ	FMMG	Indian/Antananarivo
4389	Ankavandra Airport	Ankavandra	Madagascar	JVA	FMMK	Indian/Antananarivo
4390	Belo sur Tsiribihina Airport	Belo sur Tsiribihina	Madagascar	BMD	FMML	Indian/Antananarivo
4391	Maintirano Airport	Maintirano	Madagascar	MXT	FMMO	Indian/Antananarivo
4392	Morafenobe Airport	Morafenobe	Madagascar	TVA	FMMR	Indian/Antananarivo
4393	Tambohorano Airport	Tambohorano	Madagascar	WTA	FMMU	Indian/Antananarivo
4394	Tsiroanomandidy Airport	Tsiroanomandidy	Madagascar	WTS	FMMX	Indian/Antananarivo
4395	Ambatondrazaka Airport	Ambatondrazaka	Madagascar	WAM	FMMZ	Indian/Antananarivo
4396	Port Bergé Airport	Port Bergé	Madagascar	WPB	FMNG	Indian/Antananarivo
4397	Ambanja Airport	Ambanja	Madagascar		FMNJ	Indian/Antananarivo
4398	Soalala Airport	Soalala	Madagascar	DWB	FMNO	Indian/Antananarivo
4399	Mampikony Airport	Mampikony	Madagascar	WMP	FMNP	Indian/Antananarivo
4400	Nasa Shuttle Landing Facility Airport	Tsaratanana	Madagascar		KTTS	America/New_York
4401	Mandritsara Airport	Mandritsara	Madagascar	WMA	FMNX	Indian/Antananarivo
4402	Manja Airport	Manja	Madagascar	MJA	FMSJ	Indian/Antananarivo
4403	Catumbela Airport	Catumbela	Angola	CBT	FNCT	Africa/Luanda
4404	Dundo Airport	Dundo	Angola	DUE	FNDU	Africa/Luanda
4405	Ngjiva Pereira Airport	Ondjiva	Angola	VPE	FNGI	Africa/Luanda
4406	Namibe Airport	Mocamedes	Angola	MSZ	FNMO	Africa/Luanda
4407	Koulamoutou Mabimbi Airport	Koulamoutou	Gabon	KOU	FOGK	Africa/Libreville
4408	Mouilla Ville Airport	Mouila	Gabon	MJL	FOGM	Africa/Libreville
4409	Tchibanga Airport	Tchibanga	Gabon	TCH	FOOT	Africa/Libreville
4410	Chimoio Airport	Chimoio	Mozambique	VPY	FQCH	Africa/Maputo
4411	Croisette Heliport	Cannes	France	JCA		Europe/Paris
4412	Sarh Airport	Sarh	Chad	SRH	FTTA	Africa/Ndjamena
4413	Club Makokola Airport	Club Makokola	Malawi	CMK	FWCM	Africa/Blantyre
4414	Luderitz Airport	Luderitz	Namibia	LUD	FYLZ	Africa/Windhoek
4415	Ondangwa Airport	Ondangwa	Namibia	OND	FYOA	Africa/Windhoek
4416	Oranjemund Airport	Oranjemund	Namibia	OMD	FYOG	Africa/Windhoek
4417	Swakopmund Airport	Swakopmund	Namibia	SWP	FYSM	Africa/Windhoek
4418	Eros Airport	Windhoek	Namibia	ERS	FYWE	Africa/Windhoek
4419	Boma Airport	Boma	Congo (Kinshasa)	BOA	FZAJ	Africa/Kinshasa
4420	Tshimpi Airport	Matadi	Congo (Kinshasa)	MAT	FZAM	Africa/Kinshasa
4421	Inongo Airport	Inongo	Congo (Kinshasa)	INO	FZBA	Africa/Kinshasa
4422	Nioki Airport	Nioki	Congo (Kinshasa)	NIO	FZBI	Africa/Kinshasa
4423	Basango Mboliasa Airport	Kiri	Congo (Kinshasa)	KRZ	FZBT	Africa/Kinshasa
4424	Basankusu Airport	Basankusu	Congo (Kinshasa)	BSU	FZEN	Africa/Kinshasa
4425	Tshikapa Airport	Tshikapa	Congo (Kinshasa)	TSH	FZUK	Africa/Lubumbashi
4426	Lodja Airport	Lodja	Congo (Kinshasa)	LJA	FZVA	Africa/Lubumbashi
4427	Ilebo Airport	Ilebo	Congo (Kinshasa)	PFR	FZVS	Africa/Lubumbashi
4428	Gamba	Gamba	Gabon	GAX		Africa/Libreville
4429	Foula Airport	Foula	United Kingdom	FOA		Europe/London
4430	Outer Skerries Airport	Outer Skerries	United Kingdom	OUK	EGOU	Europe/London
4431	Papa Stour Airport	Papa Stour	United Kingdom	PSV		Europe/London
4432	La Gomera Airport	La Gomera	Spain	GMZ	GCGM	Atlantic/Canary
4433	Lauriston Airport	Carriacou Island	Grenada	CRU		America/Grenada
4434	Ceuta Heliport	Ceuta	Spain	JCU	GECT	Europe/Madrid
4435	Sherbro International Airport	Bonthe	Sierra Leone	BTE	GFBN	Africa/Freetown
4436	Bo Airport	Bo	Sierra Leone	KBS	GFBO	Africa/Freetown
4437	Kenema Airport	Kenema	Sierra Leone	KEN	GFKE	Africa/Freetown
4438	Osvaldo Vieira International Airport	Bissau	Guinea-Bissau	OXB	GGOV	Africa/Bissau
4439	Groennedal Heliport	Groennedal	Greenland	JGR		America/Godthab
4440	Akunnaaq Heliport	Akunnaaq	Greenland	QCU		America/Godthab
4441	Iginniarfik Heliport	Iginniarfik	Greenland	QFI		America/Godthab
4442	Smara Airport	Smara	Western Sahara	SMW	GMMA	Africa/El_Aaiun
4443	Dakhla Airport	Dakhla	Western Sahara	VIL	GMMH	Africa/El_Aaiun
4444	Mogador Airport	Essadouira	Morocco	ESU	GMMI	Africa/Casablanca
4445	Hassan I Airport	El Aaiún	Western Sahara	EUN	GMML	Africa/El_Aaiun
4446	Nador International Airport	El Aroui	Morocco	NDR	GMMW	Africa/Casablanca
4447	Praia International Airport	Praia	Santiago Island	Cape Verde	RAI	U
4448	São Filipe Airport	Sao Filipe	Fogo Island	Cape Verde	SFL	U
4449	Baco Airport	Baco	Ethiopia	BCO	HABC	Africa/Addis_Ababa
4450	Beica Airport	Beica	Ethiopia	BEI	HABE	Africa/Addis_Ababa
4451	Combolcha Airport	Dessie	Ethiopia	DSE	HADC	Africa/Addis_Ababa
4452	Dembidollo Airport	Dembidollo	Ethiopia	DEM	HADD	Africa/Addis_Ababa
4453	Gode Airport	Gode	Ethiopia	GDE	HAGO	Africa/Addis_Ababa
4454	Gore Airport	Gore	Ethiopia	GOR	HAGR	Africa/Addis_Ababa
4455	Kabri Dehar Airport	Kabri Dehar	Ethiopia	ABK	HAKD	Africa/Addis_Ababa
4456	Mizan Teferi Airport	Mizan Teferi	Ethiopia	MTF	HAMT	Africa/Addis_Ababa
4457	Tippi Airport	Tippi	Ethiopia	TIE	HATP	Africa/Addis_Ababa
4458	Alula Airport	Alula	Somalia	ALU	HCMA	Africa/Mogadishu
4459	Bosaso Airport	Bosaso	Somalia	BSA	HCMF	Africa/Mogadishu
4460	Aden Adde International Airport	Mogadishu	Somalia	MGQ	HCMM	Africa/Mogadishu
4461	Galcaio Airport	Galcaio	Somalia	GLK	HCMR	Africa/Mogadishu
4462	Burao Airport	Burao	Somalia	BUO	HCMV	Africa/Mogadishu
4463	El Arish International Airport	El Arish	Egypt	AAC	HEAR	Africa/Cairo
4464	Assiut International Airport	Asyut	Egypt	ATZ	HEAT	Africa/Cairo
4465	Amboseli Airport	Amboseli National Park	Kenya	ASV	HKAM	Africa/Nairobi
4466	Lokichoggio Airport	Lokichoggio	Kenya	LKG	HKLK	Africa/Nairobi
4467	Malindi Airport	Malindi	Kenya	MYD	HKML	Africa/Nairobi
4468	Nanyuki Airport	Nanyuki	Kenya	NYK	HKNY	Africa/Nairobi
4469	Gardabya Airport	Sirt	Libya	SRX	HLGD	Africa/Tripoli
4470	Gamal Abdel Nasser Airport	Tobruk	Libya	TOB	HLGN	Africa/Tripoli
4471	Mitiga Airport	Tripoli	Libya	MJI	HLLM	Africa/Tripoli
4472	La Abraq Airport	Al Bayda'	Libya	LAQ	HLLQ	Africa/Tripoli
4473	Atbara Airport	Atbara	Sudan	ATB	HSAT	Africa/Khartoum
4474	Nyala Airport	Nyala	Sudan	UYL	HSNN	Africa/Khartoum
4475	Port Sudan New International Airport	Port Sudan	Sudan	PZU	HSPN	Africa/Khartoum
4476	Bukoba Airport	Bukoba	Tanzania	BKZ	HTBU	Africa/Dar_es_Salaam
4477	Kigoma Airport	Kigoma	Tanzania	TKQ	HTKA	Africa/Dar_es_Salaam
4478	Lindi Airport	Lindi	Tanzania	LDI	HTLI	Africa/Dar_es_Salaam
4479	Musoma Airport	Musoma	Tanzania	MUZ	HTMU	Africa/Dar_es_Salaam
4480	Shinyanga Airport	Shinyanga	Tanzania	SHY	HTSY	Africa/Dar_es_Salaam
4481	Tabora Airport	Tabora	Tanzania	TBO	HTTB	Africa/Dar_es_Salaam
4482	Arua Airport	Arua	Uganda	RUA	HUAR	Africa/Kampala
4483	Gulu Airport	Gulu	Uganda	ULU	HUGU	Africa/Kampala
4484	Diu Airport	Diu	India	DIU	VA1P	Asia/Calcutta
4485	Gheshm Airport	Gheshm	Iran			Asia/Tehran
4486	San Domino Island Heliport	Tremiti Islands	Italy	TQR		Europe/Rome
4487	Aberdeen Regional Airport	Aberdeen	United States	ABR	KABR	America/Chicago
4488	Southwest Georgia Regional Airport	Albany	United States	ABY	KABY	America/New_York
4489	Athens Ben Epps Airport	Athens	United States	AHN	KAHN	America/New_York
4490	Alamogordo White Sands Regional Airport	Alamogordo	United States	ALM	KALM	America/Denver
4491	Waterloo Regional Airport	Waterloo	United States	ALO	KALO	America/Chicago
4492	Walla Walla Regional Airport	Walla Walla	United States	ALW	KALW	America/Los_Angeles
4493	Alpena County Regional Airport	Alpena	United States	APN	KAPN	America/New_York
4494	Watertown Regional Airport	Watertown	United States	ATY	KATY	America/Chicago
4495	Bradford Regional Airport	Bradford	United States	BFD	KBFD	America/New_York
4496	Western Neb. Rgnl/William B. Heilig Airport	Scottsbluff	United States	BFF	KBFF	America/Denver
4497	Raleigh County Memorial Airport	Beckley	United States	BKW	KBKW	America/New_York
4498	Brunswick Golden Isles Airport	Brunswick	United States	BQK	KBQK	America/New_York
4499	Southeast Iowa Regional Airport	Burlington	United States	BRL	KBRL	America/Chicago
4500	Jack Mc Namara Field Airport	Crescent City	United States	CEC	KCEC	America/Los_Angeles
4501	Cape Girardeau Regional Airport	Cape Girardeau	United States	CGI	KCGI	America/Chicago
4502	Chippewa County International Airport	Sault Ste Marie	United States	CIU	KCIU	America/New_York
4503	North Central West Virginia Airport	Clarksburg	United States	CKB	KCKB	America/New_York
4504	William R Fairchild International Airport	Port Angeles	United States	CLM	KCLM	America/Los_Angeles
4505	Houghton County Memorial Airport	Hancock	United States	CMX	KCMX	America/New_York
4506	Dodge City Regional Airport	Dodge City	United States	DDC	KDDC	America/Chicago
4507	DuBois Regional Airport	Du Bois	United States	DUJ	KDUJ	America/New_York
4508	Chippewa Valley Regional Airport	Eau Claire	United States	EAU	KEAU	America/Chicago
4509	Elko Regional Airport	Elko	United States	EKO	KEKO	America/Los_Angeles
4510	New Bedford Regional Airport	New Bedford	United States	EWB	KEWB	America/New_York
4511	Fayetteville Regional Grannis Field	Fayetteville	United States	FAY	KFAY	America/New_York
4512	Wokal Field Glasgow International Airport	Glasgow	United States	GGW	KGGW	America/Denver
4513	Central Nebraska Regional Airport	Grand Island	United States	GRI	KGRI	America/Chicago
4514	Memorial Field	Hot Springs	United States	HOT	KHOT	America/Chicago
4515	Tri-State/Milton J. Ferguson Field	Huntington	United States	HTS	KHTS	America/New_York
4516	Kili Airport	Kili Island	Marshall Islands	KIO	Q51	Pacific/Majuro
4517	Kirksville Regional Airport	Kirksville	United States	IRK	KIRK	America/Chicago
4518	Jamestown Regional Airport	Jamestown	United States	JMS	KJMS	America/Chicago
4519	Laramie Regional Airport	Laramie	United States	LAR	KLAR	America/Denver
4520	Arnold Palmer Regional Airport	Latrobe	United States	LBE	KLBE	America/New_York
4521	North Platte Regional Airport Lee Bird Field	North Platte	United States	LBF	KLBF	America/Chicago
4522	Lebanon Municipal Airport	Lebanon	United States	LEB	KLEB	America/New_York
4523	Crater Lake-Klamath Regional Airport	Klamath Falls	United States	LMT	KLMT	America/Los_Angeles
4524	Lancaster Airport	Lancaster	United States	LNS	KLNS	America/New_York
4525	Lewistown Municipal Airport	Lewistown	United States	LWT	KLWT	America/Denver
4526	Lynchburg Regional Preston Glenn Field	Lynchburg	United States	LYH	KLYH	America/New_York
4527	Muskegon County Airport	Muskegon	United States	MKG	KMKG	America/New_York
4528	Frank Wiley Field	Miles City	United States	MLS	KMLS	America/Denver
4529	Northwest Alabama Regional Airport	Muscle Shoals	United States	MSL	KMSL	America/Chicago
4530	Southwest Oregon Regional Airport	North Bend	United States	OTH	KOTH	America/Los_Angeles
4531	Owensboro Daviess County Airport	Owensboro	United States	OWB	KOWB	America/Chicago
4532	Hattiesburg Laurel Regional Airport	Hattiesburg/Laurel	United States	PIB	KPIB	America/Chicago
4533	Pocatello Regional Airport	Pocatello	United States	PIH	KPIH	America/Denver
4534	Pierre Regional Airport	Pierre	United States	PIR	KPIR	America/Chicago
4535	Pellston Regional Airport of Emmet County Airport	Pellston	United States	PLN	KPLN	America/New_York
4536	Portsmouth International at Pease Airport	Portsmouth	United States	PSM	KPSM	America/New_York
4537	Reading Regional Carl A Spaatz Field	Reading	United States	RDG	KRDG	America/New_York
4538	Rhinelander Oneida County Airport	Rhinelander	United States	RHI	KRHI	America/Chicago
4539	Southwest Wyoming Regional Airport	Rock Springs	United States	RKS	KRKS	America/Denver
4540	Rutland - Southern Vermont Regional Airport	Rutland	United States	RUT	KRUT	America/New_York
4541	San Luis County Regional Airport	San Luis Obispo	United States	SBP	KSBP	America/Los_Angeles
4542	Sheridan County Airport	Sheridan	United States	SHR	KSHR	America/Denver
4543	Adirondack Regional Airport	Saranac Lake	United States	SLK	KSLK	America/New_York
4544	Salina Municipal Airport	Salina	United States	SLN	KSLN	America/Chicago
4545	Santa Maria Pub/Capt G Allan Hancock Field	Santa Maria	United States	SMX	KSMX	America/Los_Angeles
4546	Tupelo Regional Airport	Tupelo	United States	TUP	KTUP	America/Chicago
4547	Quincy Regional Baldwin Field	Quincy	United States	UIN	KUIN	America/Chicago
4548	Victoria Regional Airport	Victoria	United States	VCT	KVCT	America/Chicago
4549	Valdosta Regional Airport	Valdosta	United States	VLD	KVLD	America/New_York
4550	Worland Municipal Airport	Worland	United States	WRL	KWRL	America/Denver
4551	Kiwayu (Mkononi) Airport	Kiwayu	Kenya	KWY		Africa/Nairobi
4552	Yakima Air Terminal McAllister Field	Yakima	United States	YKM	KYKM	America/Los_Angeles
4553	Ercan International Airport	Nicosia	Cyprus	ECN	LCEN	Asia/Nicosia
4554	Logroño-Agoncillo Airport	Logroño-Agoncillo	Spain	RJL	LELO	Europe/Madrid
4555	Île d'Yeu Airport	Île d'Yeu	France	IDY	LFEY	Europe/Paris
4556	Angers-Loire Airport	Angers/Marcé	France	ANE	LFJR	Europe/Paris
4557	La Môle Airport	La Môle	France	LTT	LFTZ	Europe/Paris
4558	Syros Airport	Syros Island	Greece	JSY	LGSO	Europe/Athens
4559	Pécs-Pogány Airport	Pécs-Pogány	Hungary	PEV	LHPP	Europe/Budapest
4560	Győr-Pér International Airport	Győr	Hungary		LHPR	Europe/Budapest
4561	Sármellék International Airport	Sármellék	Hungary	SOB	LHSM	Europe/Budapest
4562	Aosta Airport	Aosta	Italy	AOT	LIMW	Europe/Rome
4563	Salerno Costa d'Amalfi Airport	Salerno	Italy	QSR	LIRI	Europe/Rome
4564	Corvo Airport	Corvo	Portugal	CVU	LPCR	Atlantic/Azores
4565	Banja Luka International Airport	Banja Luka	Bosnia and Herzegovina	BNX	LQBK	Europe/Sarajevo
4566	Uşak Airport	Usak	Turkey	USQ	LTBO	Europe/Istanbul
4567	Kars Airport	Kars	Turkey	KSY	LTCF	Europe/Istanbul
4568	Şanlıurfa Airport	Sanliurfa	Turkey	SFQ	LTCH	Europe/Istanbul
4569	Kahramanmaraş Airport	Kahramanmaras	Turkey	KCM	LTCN	Europe/Istanbul
4570	Ağrı Airport	Agri	Turkey	AJI	LTCO	Europe/Istanbul
4571	Adıyaman Airport	Adiyaman	Turkey	ADF	LTCP	Europe/Istanbul
4572	Süleyman Demirel International Airport	Isparta	Turkey	ISE	LTFC	Europe/Istanbul
4573	Balıkesir Körfez Airport	Balikesir Korfez	Turkey	EDO	LTFD	Europe/Istanbul
4574	Samsun Çarşamba Airport	Samsun	Turkey	SZF	LTFH	Europe/Istanbul
4575	Misratah Airport	Misratah	Libya	MRA		Africa/Tripoli
4576	Ubari Airport	Ubari	Libya	QUB		Africa/Tripoli
4577	Žilina Airport	Žilina	Slovakia	ILZ	LZZI	Europe/Bratislava
4578	JAGS McCartney International Airport	Cockburn Town	Turks and Caicos Islands	GDT	MBGT	America/Grand_Turk
4579	Middle Caicos Airport	Middle Caicos	Turks and Caicos Islands	MDS	MBMC	America/Grand_Turk
4580	Salt Cay Airport	Salt Cay	Turks and Caicos Islands	SLX	MBSY	America/Grand_Turk
4581	Samaná El Catey International Airport	Samana	Dominican Republic	AZS	MDCY	America/Santo_Domingo
4582	La Isabela International Airport	La Isabela	Dominican Republic	JBQ	MDJB	America/Santo_Domingo
4583	Puerto Barrios Airport	Puerto Barrios	Guatemala	PBR	MGPB	America/Guatemala
4584	Quezaltenango Airport	Quezaltenango	Guatemala	AAZ	MGQZ	America/Guatemala
4585	Utirik Airport	Utirik Island	Marshall Islands	UTK	03N	Pacific/Majuro
4586	Ailuk Airport	Ailuk Island	Marshall Islands	AIM		Pacific/Majuro
4587	Aur Island Airport	Aur Atoll	Marshall Islands	AUL		Pacific/Majuro
4588	Enyu Airfield	Bikini Atoll	Marshall Islands	BII		Pacific/Majuro
4589	Jabot Airport	Ailinglapalap Atoll	Marshall Islands	JAT		Pacific/Majuro
4590	Jeh Airport	Ailinglapalap Atoll	Marshall Islands	JEJ		Pacific/Majuro
4591	Kaben Airport	Kaben	Marshall Islands	KBT		Pacific/Majuro
4592	Likiep Airport	Likiep Island	Marshall Islands	LIK		Pacific/Majuro
4593	Maloelap Island Airport	Maloelap Island	Marshall Islands	MAV		Pacific/Majuro
4594	Mejit Atoll Airport	Mejit Atoll	Marshall Islands	MJB	Q30	Pacific/Majuro
4595	Majkin Airport	Majkin	Marshall Islands	MJE		Pacific/Majuro
4596	Namorik Atoll Airport	Namorik Atoll	Marshall Islands	NDK	3N0	Pacific/Majuro
4597	Rongelap Island Airport	Rongelap Island	Marshall Islands	RNP		Pacific/Majuro
4598	Jaluit Airport	Jabor Jaluit Atoll	Marshall Islands	UIT	N55	Pacific/Majuro
4599	Woja Airport	Majuro Atoll	Marshall Islands	WJA		Pacific/Majuro
4600	Wotje Atoll Airport	Wotje Atoll	Marshall Islands	WTE	N36	Pacific/Majuro
4601	Wotho Island Airport	Wotho Island	Marshall Islands	WTO		Pacific/Majuro
4602	Ahuas Airport	Ahuas	Honduras	AHS	MHAH	America/Tegucigalpa
4603	Puerto Lempira Airport	Puerto Lempira	Honduras	PEU	MHPL	America/Tegucigalpa
4604	Mili Island Airport	Mili Island	Marshall Islands	MIJ	MLIP	Pacific/Majuro
4605	Captain Rogelio Castillo National Airport	Celaya	Mexico	CYW	MMCY	America/Mexico_City
4606	Ciudad Constitución Airport	Ciudad Constitución	Mexico	CUA	MMDA	America/Mazatlan
4607	Guerrero Negro Airport	Guerrero Negro	Mexico	GUB	MMGR	America/Tijuana
4608	El Lencero Airport	Jalapa	Mexico	JAL	MMJA	America/Mexico_City
4609	Alonso Valderrama Airport	Chitré	Panama	CTD	MPCE	America/Panama
4610	Enrique Adolfo Jimenez Airport	Colón	Panama	ONX	MPEJ	America/Panama
4611	Jaqué Airport	Jaqué	Panama	JQE	MPJE	America/Panama
4612	Captain Ramon Xatruch Airport	La Palma	Panama	PLP	MPLP	America/Panama
4613	Aerotortuguero Airport	Roxana	Costa Rica	TTQ	MRAO	America/Costa_Rica
4614	Barra del Colorado Airport	Pococi	Costa Rica	BCL	MRBC	America/Costa_Rica
4615	Cabo Velas Airport	Nicoya	Costa Rica		MRCV	America/Costa_Rica
4616	Islita Airport	Nandayure	Costa Rica	PBP	MRIA	America/Costa_Rica
4617	Puerto Jimenez Airport	Puerto Jimenez	Costa Rica	PJM	MRPJ	America/Costa_Rica
4618	Tobias Bolanos International Airport	San Jose	Costa Rica	SYQ	MRPV	America/Costa_Rica
4619	(Duplicate) Playa Samara Airport	Playa Samara	Costa Rica		MRSR	America/Costa_Rica
4620	Jérémie Airport	Jeremie	Haiti	JEE	MTJE	America/Port-au-Prince
4621	Port-de-Paix Airport	Port-de-Paix	Haiti	PAX	MTPX	America/Port-au-Prince
4622	Cayo Coco Airport	Cayo Coco	Cuba		MUOC	America/Havana
4623	Alberto Delgado Airport	Trinidad	Cuba	TND	MUTD	America/Havana
4624	Salina Cruz Naval Air Station	Salina Cruz	Mexico	SCX	MM57	America/Mexico_City
4625	Long Banga Airport	Long Banga	Malaysia	LBP		Asia/Kuala_Lumpur
4626	Congo Town Airport	Andros	Bahamas	COX	MYAK	America/Nassau
4627	Arthur's Town Airport	Arthur's Town	Bahamas	ATC	MYCA	America/Nassau
4628	New Bight Airport	Cat Island	Bahamas	TBI	MYCB	America/Nassau
4629	Colonel Hill Airport	Colonel Hill	Bahamas	CRI	MYCI	America/Nassau
4630	Nassau Paradise Island Airport	Nassau	Bahamas	PID	MYPI	America/Nassau
4631	Enua Airport	Atiu Island	Cook Islands	AIU	NCAT	Pacific/Rarotonga
4632	Mangaia Island Airport	Mangaia Island	Cook Islands	MGS	NCMG	Pacific/Rarotonga
4633	Manihiki Island Airport	Manihiki Island	Cook Islands	MHX	NCMH	Pacific/Rarotonga
4634	Mauke Airport	Mauke Island	Cook Islands	MUK	NCMK	Pacific/Rarotonga
4635	Mitiaro Island Airport	Mitiaro Island	Cook Islands	MOI	NCMR	Pacific/Rarotonga
4636	Tongareva Airport	Penrhyn Island	Cook Islands	PYE	NCPY	Pacific/Rarotonga
4637	Cicia Airport	Cicia	Fiji	ICI	NFCI	Pacific/Fiji
4638	Malolo Lailai Island Airport	Malolo Lailai Island	Fiji	PTF	NFFO	Pacific/Fiji
4639	Vunisea Airport	Vunisea	Fiji	KDV	NFKD	Pacific/Fiji
4640	Mana Island Airport	Mana Island	Fiji	MNF	NFMA	Pacific/Fiji
4641	Moala Airport	Moala	Fiji	MFJ	NFMO	Pacific/Fiji
4642	Ngau Airport	Ngau	Fiji	NGI	NFNG	Pacific/Fiji
4643	Lakeba Island Airport	Lakeba Island	Fiji	LKB	NFNK	Pacific/Fiji
4644	Labasa Airport	Lambasa	Fiji	LBS	NFNL	Pacific/Fiji
4645	Matei Airport	Matei	Fiji	TVU	NFNM	Pacific/Fiji
4646	Koro Island Airport	Koro Island	Fiji	KXF	NFNO	Pacific/Fiji
4647	Rotuma Airport	Rotuma	Fiji	RTA	NFNR	Pacific/Fiji
4648	Savusavu Airport	Savusavu	Fiji	SVU	NFNS	Pacific/Fiji
4649	Kaufana Airport	Eua Island	Tonga	EUA	NFTE	Pacific/Tongatapu
4650	Lifuka Island Airport	Lifuka	Tonga	HPA	NFTL	Pacific/Tongatapu
4651	Mata'aho Airport	Angaha	Niuafo'ou Island	Tonga	NFO	U
4652	Kuini Lavenia Airport	Niuatoputapu	Tonga	NTT	NFTP	Pacific/Tongatapu
4653	Vanua Balavu Airport	Vanua Balavu	Fiji	VBV	NFVB	Pacific/Fiji
4654	Niue International Airport	Alofi	Niue	IUE	NIUE	Pacific/Niue
4655	Pointe Vele Airport	Futuna Island	Wallis and Futuna	FUT	NLWF	Pacific/Wallis
4656	Mountain Airport	Mountain	Nepal	MWP		Asia/Katmandu
4657	Maota Airport	Savaii Island	Samoa	MXS	NSMA	Pacific/Apia
4658	Apataki Airport	Apataki	French Polynesia	APK	NTGD	Pacific/Tahiti
4659	Ahe Airport	Ahe	French Polynesia	AHE	NTHE	Pacific/Tahiti
4660	Hiva Oa-Atuona Airport	Hiva-oa	French Polynesia	AUQ	NTMN	Pacific/Marquesas
4661	Ua Pou Airport	Ua Pou	French Polynesia	UAP	NTMP	Pacific/Marquesas
4662	Ua Huka Airport	Ua Huka	French Polynesia	UAH	NTMU	Pacific/Marquesas
4663	Mota Lava Airport	Ablow	Vanuatu	MTV	NVSA	Pacific/Efate
4664	Sola Airport	Sola	Vanuatu	SLH	NVSC	Pacific/Efate
4665	Torres Airstrip	Loh/Linua	Vanuatu	TOH	NVSD	Pacific/Efate
4666	Siwo Airport	Sangafa	Vanuatu	EAE	NVSE	Pacific/Efate
4667	Craig Cove Airport	Craig Cove	Vanuatu	CCV	NVSF	Pacific/Efate
4668	Longana Airport	Longana	Vanuatu	LOD	NVSG	Pacific/Efate
4669	Sara Airport	Pentecost Island	Vanuatu	SSR	NVSH	Pacific/Efate
4670	Tavie Airport	Paama Island	Vanuatu	PBJ	NVSI	Pacific/Efate
4671	Lamap Airport	Lamap	Vanuatu	LPM	NVSL	Pacific/Efate
4672	Lamen Bay Airport	Lamen Bay	Vanuatu	LNB	NVSM	Pacific/Efate
4673	Maewo-Naone Airport	Maewo Island	Vanuatu	MWF	NVSN	Pacific/Efate
4674	Lonorore Airport	Lonorore	Vanuatu	LNE	NVSO	Pacific/Efate
4675	Norsup Airport	Norsup	Vanuatu	NUS	NVSP	Pacific/Efate
4676	Gaua Island Airport	Gaua Island	Vanuatu	ZGU	NVSQ	Pacific/Efate
4677	Redcliffe Airport	Redcliffe	Vanuatu	RCL	NVSR	Pacific/Efate
4678	Santo Pekoa International Airport	Santo	Vanuatu	SON	NVSS	Pacific/Efate
4679	Tongoa Airport	Tongoa Island	Vanuatu	TGH	NVST	Pacific/Efate
4680	Uléi Airport	Ambryn Island	Vanuatu	ULB	NVSU	Pacific/Efate
4681	Valesdir Airport	Valesdir	Vanuatu	VLS	NVSV	Pacific/Efate
4682	Southwest Bay Airport	Malekula Island	Vanuatu	SWJ	NVSX	Pacific/Efate
4683	North West Santo Airport	Olpoi	Vanuatu	OLJ	NVSZ	Pacific/Efate
4684	Aneityum Airport	Anelghowhat	Vanuatu	AUY	NVVA	Pacific/Efate
4685	Aniwa Airport	Aniwa	Vanuatu	AWD	NVVB	Pacific/Efate
4686	Dillon's Bay Airport	Dillon's Bay	Vanuatu	DLY	NVVD	Pacific/Efate
4687	Futuna Airport	Futuna Island	Vanuatu	FTA	NVVF	Pacific/Efate
4688	Ipota Airport	Ipota	Vanuatu	IPA	NVVI	Pacific/Efate
4689	Tiga Airport	Tiga	New Caledonia	TGJ	NWWA	Pacific/Noumea
4690	Île Art - Waala Airport	Waala	New Caledonia	BMY	NWWC	Pacific/Noumea
4691	Île des Pins Airport	Île des Pins	New Caledonia	ILP	NWWE	Pacific/Noumea
4692	Fayzabad Airport	Faizabad	Afghanistan	FBD	OAFZ	Asia/Kabul
4693	Dawadmi Domestic Airport	Dawadmi	Saudi Arabia		OEDW	Asia/Riyadh
4694	Al-Jawf Domestic Airport	Al-Jawf	Saudi Arabia	AJF	OESK	Asia/Riyadh
4695	Wadi Al Dawasir Airport	Wadi-al-dawasir	Saudi Arabia	WAE	OEWD	Asia/Riyadh
4696	Khoram Abad Airport	Khorram Abad	Iran	KHD	OICK	Asia/Tehran
4697	Bam Airport	Bam	Iran	BXR	OIKM	Asia/Tehran
4698	Rafsanjan Airport	Rafsanjan	Iran	RJN	OIKR	Asia/Tehran
4699	Bojnord Airport	Bojnourd	Iran	BJB	OIMN	Asia/Tehran
4700	Sabzevar National Airport	Sabzevar	Iran	AFZ	OIMS	Asia/Tehran
4701	Noshahr Airport	Noshahr	Iran	NSH	OINN	Asia/Tehran
4702	Dasht-e Naz Airport	Dasht-e-naz	Iran	SRY	OINZ	Asia/Tehran
4703	Lar Airport	Lar	Iran	LRR	OISL	Asia/Tehran
4704	Ardabil Airport	Ardabil	Iran	ADU	OITL	Asia/Tehran
4705	Urmia Airport	Uromiyeh	Iran	OMH	OITR	Asia/Tehran
4706	Al Ain International Airport	Al Ain	United Arab Emirates	AAN	OMAL	Asia/Dubai
4707	Bannu Airport	Bannu	Pakistan	BNP	OPBN	Asia/Karachi
4708	Bahawalpur Airport	Bahawalpur	Pakistan	BHV	OPBW	Asia/Karachi
4709	Chitral Airport	Chitral	Pakistan	CJL	OPCH	Asia/Karachi
4710	Dalbandin Airport	Dalbandin	Pakistan	DBA	OPDB	Asia/Karachi
4711	Dera Ghazi Khan Airport	Dera Ghazi Khan	Pakistan	DEA	OPDG	Asia/Karachi
4712	Dera Ismael Khan Airport	Dera Ismael Khan	Pakistan	DSK	OPDI	Asia/Karachi
4713	Jiwani Airport	Jiwani	Pakistan	JIW	OPJI	Asia/Karachi
4714	Hyderabad Airport	Hyderabad	Pakistan	HDD	OPKD	Asia/Karachi
4715	Khuzdar Airport	Khuzdar	Pakistan	KDD	OPKH	Asia/Karachi
4716	Ormara Airport	Ormara Raik	Pakistan	ORW	OPOR	Asia/Karachi
4717	Parachinar Airport	Parachinar	Pakistan	PAJ	OPPC	Asia/Karachi
4718	Skardu Airport	Skardu	Pakistan	KDU	OPSD	Asia/Karachi
4719	Sehwan Sharif Airport	Sehwan Sharif	Pakistan	SYW	OPSN	Asia/Karachi
4720	Turbat International Airport	Turbat	Pakistan	TUK	OPTU	Asia/Karachi
4721	Sulaymaniyah International Airport	Sulaymaniyah	Iraq	ISU	ORSU	Asia/Baghdad
4722	Kamishly Airport	Kamishly	Syria	KAC	OSKL	Asia/Damascus
4723	Sayun International Airport	Sayun Intl	Yemen	GXF	OYSY	Asia/Aden
4724	Bahia Piña Airport	Bahia Piña	Panama	BFQ		America/Panama
4725	EL Real Airport	El Real	Panama	ELE		America/Panama
4726	Contadora Airport	Contadora Island	Panama	OTD		America/Panama
4727	Sambu Airport	Boca de Sábalo	Panama	SAX		America/Panama
4728	Adak Airport	Adak Island	United States	ADK	PADK	America/Adak
4729	Gustavus Airport	Gustavus	United States	GST	PAGS	America/Anchorage
4730	Skagway Airport	Skagway	United States	SGY	PAGY	America/Anchorage
4731	Holy Cross Airport	Holy Cross	United States	HCR	PAHC	America/Anchorage
4732	Haines Airport	Haines	United States	HNS	PAHN	America/Anchorage
4733	Kalskag Airport	Kalskag	United States	KLG	PALG	America/Anchorage
4734	McGrath Airport	Mcgrath	United States	MCG	PAMC	America/Anchorage
4735	Mountain Village Airport	Mountain Village	United States	MOU	PAMO	America/Anchorage
4736	Aniak Airport	Aniak	United States	ANI	PANI	America/Anchorage
4737	Chevak Airport	Chevak	United States	VAK	PAVA	America/Anchorage
4738	Wrangell Airport	Wrangell	United States	WRG	PAWG	America/Anchorage
4739	Tadji Airport	Aitape	Papua New Guinea	ATP		Pacific/Port_Moresby
4740	Gasmata Island Airport	Gasmata Island	Papua New Guinea	GMI		Pacific/Port_Moresby
4741	Ihu Airport	Ihu	Papua New Guinea	IHU		Pacific/Port_Moresby
4742	Nissan Island Airport	Nissan Island	Papua New Guinea	IIS		Pacific/Port_Moresby
4743	Jacquinot Bay Airport	Jacquinot Bay	Papua New Guinea	JAQ		Pacific/Port_Moresby
4744	Kandrian Airport	Kandrian	Papua New Guinea	KDR		Pacific/Port_Moresby
4745	Kokoda Airport	Kokoda	Papua New Guinea	KKD		Pacific/Port_Moresby
4746	Kamusi Airport	Kamusi	Papua New Guinea	KUY		Pacific/Port_Moresby
4747	Lake Murray Airport	Lake Murray	Papua New Guinea	LMY		Pacific/Port_Moresby
4748	Londolovit Airport	Londolovit	Papua New Guinea	LNV		Pacific/Port_Moresby
4749	Losuia Airport	Losuia	Papua New Guinea	LSA		Pacific/Port_Moresby
4750	Obo Airport	Obo	Papua New Guinea	OBX		Pacific/Port_Moresby
4751	Balimo Airport	Balimo	Papua New Guinea	OPU	AYBM	Pacific/Port_Moresby
4752	Suki Airport	Suki	Papua New Guinea	SKC		Pacific/Port_Moresby
4753	Tufi Airport	Tufi	Papua New Guinea	TFI		Pacific/Port_Moresby
4754	Nuku Airport	Nuku	Papua New Guinea	UKU		Pacific/Port_Moresby
4755	Baimuru Airport	Baimuru	Papua New Guinea	VMU	AYBA	Pacific/Port_Moresby
4756	Wipim Airport	Wipim	Papua New Guinea	WPM		Pacific/Port_Moresby
4757	El Nido Airport	El Nido	Philippines	ENI		Asia/Manila
4758	Kalaupapa Airport	Molokai	United States	LUP	PHLU	Pacific/Honolulu
4759	Eniwetok Airport	Eniwetok Atoll	Marshall Islands	ENT	PKMA	Pacific/Majuro
4760	Matsu Nangan Airport	Matsu Islands	Taiwan	LZN	RCFG	Asia/Taipei
4761	Hengchun Airport	Hengchun	Taiwan	HCN	RCKW	Asia/Taipei
4762	Matsu Beigan Airport	Matsu Islands	Taiwan	MFK	RCMT	Asia/Taipei
4763	Kushiro Airport	Kushiro	Japan	KUH	RJCK	Asia/Tokyo
4764	Okadama Airport	Sapporo	Japan	OKD	RJCO	Asia/Tokyo
4765	Saga Airport	Saga	Japan	HSG	RJFS	Asia/Tokyo
4766	Nagoya Airport	Nagoya	Japan	NKM	RJNA	Asia/Tokyo
4767	Iwami Airport	Iwami	Japan	IWJ	RJOW	Asia/Tokyo
4768	Fukushima Airport	Fukushima	Japan	FKS	RJSF	Asia/Tokyo
4769	Odate Noshiro Airport	Odate Noshiro	Japan	ONJ	RJSR	Asia/Tokyo
4770	Shonai Airport	Shonai	Japan	SYO	RJSY	Asia/Tokyo
4771	Miyakejima Airport	Miyakejima	Japan	MYE	RJTQ	Asia/Tokyo
4772	Kunsan Air Base	Kunsan	South Korea	KUV	RKJK	Asia/Seoul
4773	Mokpo Heliport	Mokpo	South Korea	MPK	RKJM	Asia/Seoul
4774	Wonju/Hoengseong Air Base (K-38/K-46)	Wonju	South Korea	WJU	RKNW	Asia/Seoul
4775	Yangyang International Airport	Sokcho / Gangneung	South Korea	YNY	RKNY	Asia/Seoul
4776	Sacheon Air Base/Airport	Sacheon	South Korea	HIN	RKPS	Asia/Seoul
4777	Cheongju International Airport/Cheongju Air Base (K-59/G-513)	Chongju	South Korea	CJJ	RKTU	Asia/Seoul
4778	Subic Bay International Airport	Olongapo City	Philippines	SFS	RPLB	Asia/Manila
4779	Cuyo Airport	Cuyo	Philippines	CYU	RPLO	Asia/Manila
4780	Rajah Buayan Air Base	General Santos City	Philippines		RPMB	Asia/Manila
4781	Camiguin Airport	Camiguin	Philippines	CGM	RPMH	Asia/Manila
4782	Jolo Airport	Jolo	Philippines	JOL	RPMJ	Asia/Manila
4783	Sanga Sanga Airport	Sanga Sanga	Philippines	TWT	RPMN	Asia/Manila
4784	Surigao Airport	Sangley Point	Philippines	SUG	RPMS	Asia/Manila
4785	Tandag Airport	Tandag	Philippines	TDG	RPMW	Asia/Manila
4786	Naga Airport	Naga	Philippines	WNP	RPUN	Asia/Manila
4787	Basco Airport	Basco	Philippines	BSO	RPUO	
4788	San Fernando Airport	San Fernando	Philippines	SFE	RPUS	Asia/Manila
4789	Tuguegarao Airport	Tuguegarao	Philippines	TUG	RPUT	Asia/Manila
4790	Virac Airport	Virac	Philippines	VRC	RPUV	Asia/Manila
4791	Calbayog Airport	Calbayog City	Philippines	CYP	RPVC	Asia/Manila
4792	Catarman National Airport	Catarman	Philippines	CRM	RPVF	Asia/Manila
4793	Moises R. Espinosa Airport	Masbate	Philippines	MBT	RPVJ	Asia/Manila
4794	Roxas Airport	Roxas City	Philippines	RXS	RPVR	Asia/Manila
4795	General Enrique Mosconi Airport	Tartagal	Argentina	TTG	SAST	America/Argentina/Salta
4796	Las Heras Airport	Las Heras	Argentina	LHS	SAVH	America/Argentina/Rio_Gallegos
4797	Antoine de Saint Exupéry Airport	San Antonio Oeste	Argentina	OES	SAVN	America/Argentina/Salta
4798	Lago Argentino Airport	El Calafate	Argentina	ING	SAWA	America/Argentina/Rio_Gallegos
4799	Gobernador Gregores Airport	Gobernador Gregores	Argentina	GGS	SAWR	America/Argentina/Rio_Gallegos
4800	Santa Teresita Airport	Santa Teresita	Argentina	SST	SAZL	America/Buenos_Aires
4801	Necochea Airport	Necochea	Argentina	NEC	SAZO	America/Buenos_Aires
4802	Orlando Bezerra de Menezes Airport	Juazeiro Do Norte	Brazil	JDO	SBJU	America/Fortaleza
4803	Coronel Horácio de Mattos Airport	Lençóis	Brazil	LEC	SBLE	America/Fortaleza
4804	Macaé Airport	Macaé	Brazil	MEA	SBME	America/Sao_Paulo
4805	Frank Miloye Milenkowichi–Marília State Airport	Marília	Brazil	MII	SBML	America/Sao_Paulo
4806	Vitória da Conquista Airport	Vitória Da Conquista	Brazil	VDC	SBQV	America/Fortaleza
4807	Santa Maria Airport	Santa Maria	Brazil	RIA	SBSM	America/Sao_Paulo
4808	Toledo Airport	Toledo	Brazil	TOW	SBTD	America/Sao_Paulo
4809	Ricardo García Posada Airport	El Salvador	Chile	ESR	SCES	America/Santiago
4810	Pucón Airport	Pucon	Chile	ZPC	SCPC	America/Santiago
4811	Sorocaba Airport	Sorocaba	Brazil	SOD	SDCO	America/Sao_Paulo
4812	San Cristóbal Airport	San Cristóbal	Ecuador	SCY	SEST	Pacific/Galapagos
4813	Camilo Ponce Enriquez Airport	La Toma (Catamayo)	Ecuador	LOH	SETM	America/Guayaquil
4814	General Rivadeneira Airport	Esmeraldas	Ecuador	ESM	SETN	America/Guayaquil
4815	Port Stanley Airport	Stanley	Falkland Islands	PSY	SFAL	Atlantic/Stanley
4816	Santa Ana Airport	Cartago	Colombia	CRC	SKGO	America/Bogota
4817	La Jagua Airport	Garzón	Colombia		SKGZ	America/Bogota
4818	Caucaya Airport	Puerto Leguízamo	Colombia	LQM	SKLG	America/Bogota
4819	La Pedrera Airport	La Pedrera	Colombia	LPD	SKLP	America/Bogota
4820	Reyes Murillo Airport	Nuquí	Colombia	NQU	SKNQ	America/Bogota
4821	Obando Airport	Puerto Inírida	Colombia	PDA	SKPD	America/Bogota
4822	El Yopal Airport	Yopal	Colombia	EYP	SKYP	America/Bogota
4823	Capitán de Av. Emilio Beltrán Airport	Guayaramerín	Bolivia	GYA	SLGY	America/La_Paz
4824	Puerto Rico Airport	Puerto Rico/Manuripi	Bolivia	PUR	SLPR	America/La_Paz
4825	Capitán Av. Selin Zeitun Lopez Airport	Riberalta	Bolivia	RIB	SLRI	America/La_Paz
4826	Reyes Airport	Reyes	Bolivia	REY	SLRY	America/La_Paz
4827	Capitán Av. German Quiroga G. Airport	San Borja	Bolivia	SRJ	SLSB	America/La_Paz
4828	Zorg en Hoop Airport	Paramaribo	Suriname	ORG	SMZO	America/Paramaribo
4829	Mucuri Airport	Mucuri	Brazil	MVS	SNMU	America/Fortaleza
4830	Boorama Airport	Boorama	Somalia	BXX		Africa/Mogadishu
4831	Gatokae Airport	Gatokae	Solomon Islands	GTA		Pacific/Guadalcanal
4832	Caballococha Airport	Caballococha	Peru		SPBC	America/Lima
4833	Mayor General FAP Armando Revoredo Iglesias Airport	Cajamarca	Peru	CJA	SPJR	America/Lima
4834	Alferez Fap David Figueroa Fernandini Airport	Huánuco	Peru	HUU	SPNC	America/Lima
4835	Maria Reiche Neuman Airport	Nazca	Peru	NZC	SPZA	America/Lima
4836	Santa Rosa Airport	Santa Rosa	Brazil	SRA	SSZR	America/Sao_Paulo
4837	El Jagüel / Punta del Este Airport	Maldonado	Uruguay		SUPE	America/Montevideo
4838	Escuela Mariscal Sucre Airport	Maracay	Venezuela	MYC	SVBS	America/Caracas
4839	Juan Pablo Pérez Alfonso Airport	El Vigía	Venezuela	VIG	SVVG	America/Caracas
4840	Ji-Paraná Airport	Ji-Paraná	Brazil	JPR	SWJI	America/Boa_Vista
4841	Codrington Airport	Codrington	Antigua and Barbuda	BBQ	TAPH	America/Antigua
4842	La Désirade Airport	Grande Anse	Guadeloupe	DSD	TFFA	America/Guadeloupe
4843	Baillif Airport	Basse Terre	Guadeloupe	BBR	TFFB	America/Guadeloupe
4844	St-François Airport	St-François	Guadeloupe	SFC	TFFC	America/Guadeloupe
4845	Les Bases Airport	Grand Bourg	Guadeloupe	GBJ	TFFM	America/Guadeloupe
4846	Vance W. Amory International Airport	Charlestown	Saint Kitts and Nevis	NEV	TKPN	America/St_Kitts
4847	Virgin Gorda Airport	Spanish Town	British Virgin Islands	VIJ	TUPW	America/Tortola
4848	J F Mitchell Airport	Bequia	Saint Vincent and the Grenadines	BQU	TVSB	America/St_Vincent
4849	Union Island International Airport	Union Island	Saint Vincent and the Grenadines	UNI	TVSU	America/St_Vincent
4850	Kokshetau Airport	Kokshetau	Kazakhstan	KOV	UACK	Asia/Qyzylorda
4851	Petropavlosk South Airport	Petropavlosk	Kazakhstan	PPK	UACP	Asia/Qyzylorda
4852	Zhezkazgan Airport	Zhezkazgan	Kazakhstan	DZN	UAKD	Asia/Qyzylorda
4853	Ust-Kamennogorsk Airport	Ust Kamenogorsk	Kazakhstan	UKK	UASK	Asia/Qyzylorda
4854	Kostanay West Airport	Kostanay	Kazakhstan	KSN	UAUU	Asia/Qyzylorda
4855	Ganja Airport	Ganja	Azerbaijan	KVD	UBBG	Asia/Baku
4856	Nakhchivan Airport	Nakhchivan	Azerbaijan	NAJ	UBBN	Asia/Baku
4857	Chulman Airport	Neryungri	Russia	NER	UELL	Asia/Yakutsk
4858	Polyarny Airport	Yakutia	Russia	PYJ	UERP	Asia/Yakutsk
4859	Chokurdakh Airport	Chokurdah	Russia	CKH	UESO	Asia/Srednekolymsk
4860	Cherskiy Airport	Cherskiy	Russia	CYX	UESS	Asia/Srednekolymsk
4861	Tiksi Airport	Tiksi	Russia	IKS	UEST	Asia/Yakutsk
4862	Moyo Airport	Moyo	Uganda	OYG		Africa/Kampala
4863	Komsomolsk-on-Amur Airport	Komsomolsk-on-Amur	Russia	KXK	UHKK	Asia/Vladivostok
4864	Ugolny Airport	Anadyr	Russia	DYR	UHMA	Asia/Anadyr
4865	Okhotsk Airport	Okhotsk	Russia	OHO	UHOO	Asia/Vladivostok
4866	Ujae Atoll Airport	Ujae Atoll	Marshall Islands	UJE	UJAP	Pacific/Majuro
4867	Mariupol International Airport	Mariupol International	Ukraine	MPW	UKCM	Europe/Kiev
4868	Luhansk International Airport	Lugansk	Ukraine	VSG	UKCW	Europe/Kiev
4869	Zaporizhzhia International Airport	Zaporozhye	Ukraine	OZH	UKDE	Europe/Kiev
4870	Kryvyi Rih International Airport	Krivoy Rog	Ukraine	KWG	UKDR	Europe/Kiev
4871	Kharkiv International Airport	Kharkov	Ukraine	HRK	UKHH	Europe/Kiev
4872	Ivano-Frankivsk International Airport	Ivano-Frankivsk	Ukraine	IFO	UKLI	Europe/Kiev
4873	Chernivtsi International Airport	Chernovtsk	Ukraine	CWC	UKLN	Europe/Kiev
4874	Rivne International Airport	Rivne	Ukraine	RWN	UKLR	Europe/Kiev
4875	Uzhhorod International Airport	Uzhgorod	Ukraine	UDJ	UKLU	Europe/Kiev
4876	Solovki Airport	Solovetsky Islands	Russia	CSH	ULAS	Europe/Moscow
4877	Cherepovets Airport	Cherepovets	Russia	CEE	ULBC	Europe/Moscow
4878	Amderma Airport	Amderma	Russia	AMV	ULDD	Europe/Moscow
4879	Kotlas Airport	Kotlas	Russia	KSZ	ULKK	Europe/Moscow
4880	Petrozavodsk Airport	Petrozavodsk	Russia	PES	ULPB	Europe/Moscow
4881	Hrodna Airport	Hrodna	Belarus	GNA	UMMG	Europe/Minsk
4882	Mogilev Airport	Mogilev	Belarus	MVQ	UMOO	Europe/Minsk
4883	Yeniseysk Airport	Yeniseysk	Russia	EIE	UNII	Asia/Krasnoyarsk
4884	Kyzyl Airport	Kyzyl	Russia	KYZ	UNKY	Asia/Krasnoyarsk
4885	Spichenkovo Airport	Novokuznetsk	Russia	NOZ	UNWW	Asia/Krasnoyarsk
4886	Khatanga Airport	Khatanga	Russia	HTG	UOHH	Asia/Krasnoyarsk
4887	Igarka Airport	Igarka	Russia	IAA	UOII	Asia/Krasnoyarsk
4888	Khankala Air Base	Grozny	Russia		URMG	Europe/Moscow
4889	Nalchik Airport	Nalchik	Russia	NAL	URMN	Europe/Moscow
4890	Beslan Airport	Beslan	Russia	OGZ	URMO	Europe/Moscow
4891	Elista Airport	Elista	Russia	ESL	URWI	Europe/Moscow
4892	Aleknagik / New Airport	Aleknagik	United States	WKK	5A8	America/Anchorage
4893	Brookings Regional Airport	Brookings	United States	BKX	BKX	America/Chicago
4894	Mercer County Airport	Bluefield	United States	BLF	KBLF	America/New_York
4895	Kearney Municipal Airport	Kearney	United States	EAR	EAR	America/Chicago
4896	Mid Delta Regional Airport	Greenville	United States	GLH	KGLH	America/Chicago
4897	Laughlin-Bullhead Intl	Bullhead	United States	IFP	IFP	America/Phoenix
4898	Kingman Airport	Kingman	United States	IGM	IGM	America/Phoenix
4899	Tri Cities Airport	Pasco	United States	PSC	KPSC	America/Los_Angeles
4900	Akutan Seaplane Base	Akutan	United States	KQA	KQA	America/Anchorage
4901	Grant County Airport	Silver City	United States	SVC	SVC	America/Denver
4902	Lopez Island Airport	Lopez	United States	LPS	S31	America/Los_Angeles
4903	Salekhard Airport	Salekhard	Russia	SLY	USDD	Asia/Yekaterinburg
4904	Khanty Mansiysk Airport	Khanty-Mansiysk	Russia	HMA	USHH	Asia/Yekaterinburg
4905	Nyagan Airport	Nyagan	Russia	NYA	USHN	Asia/Yekaterinburg
4906	Sovetskiy Airport	Sovetskiy	Russia	OVS	USHS	Asia/Yekaterinburg
4907	Izhevsk Airport	Izhevsk	Russia	IJK	USII	Europe/Samara
4908	Pobedilovo Airport	Kirov	Russia	KVX	USKK	Europe/Moscow
4909	Nadym Airport	Nadym	Russia	NYM	USMM	Asia/Yekaterinburg
4910	Raduzhny Airport	Raduzhnyi	Russia	RAT	USNR	Asia/Yekaterinburg
4911	Nefteyugansk Airport	Nefteyugansk	Russia	NFG	USRN	Asia/Yekaterinburg
4912	Kurgan Airport	Kurgan	Russia	KRO	USUU	Asia/Yekaterinburg
4913	Khudzhand Airport	Khudzhand	Tajikistan	LBD	UTDL	Asia/Dushanbe
4914	Andizhan Airport	Andizhan	Uzbekistan	AZN	UTKA	Asia/Samarkand
4915	Fergana International Airport	Fergana	Uzbekistan	FEG	UTKF	Asia/Samarkand
4916	Namangan Airport	Namangan	Uzbekistan	NMA	UTKN	Asia/Samarkand
4917	Nukus Airport	Nukus	Uzbekistan	NCU	UTNN	Asia/Samarkand
4918	Urgench Airport	Urgench	Uzbekistan	UGC	UTNU	Asia/Samarkand
4919	Karshi Khanabad Airport	Khanabad	Uzbekistan	KSQ	UTSL	Asia/Samarkand
4920	Termez Airport	Termez	Uzbekistan	TMJ	UTST	Asia/Samarkand
4921	Staroselye Airport	Rybinsk	Russia	RYB	UUBK	Europe/Moscow
4922	Belgorod International Airport	Belgorod	Russia	EGO	UUOB	Europe/Moscow
4923	Kursk East Airport	Kursk	Russia	URS	UUOK	Europe/Moscow
4924	Lipetsk Airport	Lipetsk	Russia	LPK	UUOL	Europe/Moscow
4925	Vorkuta Airport	Vorkuta	Russia	VKT	UUYW	Europe/Moscow
4926	Bugulma Airport	Bugulma	Russia	UUA	UWKB	Europe/Moscow
4927	Yoshkar-Ola Airport	Yoshkar-Ola	Russia	JOK	UWKJ	Europe/Moscow
4928	Cheboksary Airport	Cheboksary	Russia	CSY	UWKS	Europe/Moscow
4929	Ulyanovsk East Airport	Ulyanovsk	Russia	ULY	UWLW	Europe/Samara
4930	Orsk Airport	Orsk	Russia	OSW	UWOR	Asia/Yekaterinburg
4931	Penza Airport	Penza	Russia	PEZ	UWPP	Europe/Moscow
4932	Saransk Airport	Saransk	Russia	SKX	UWPS	Europe/Moscow
4933	Balakovo Airport	Balakovo	Russia	BWO	UWSB	Europe/Moscow
4934	Hubli Airport	Hubli	India	HBX	VAHB	Asia/Calcutta
4935	Koggala Airport	Koggala	Sri Lanka	KCT	VCCK	Asia/Colombo
4936	Weerawila Airport	Wirawila	Sri Lanka	WRZ	VCCW	Asia/Colombo
4937	Battambang Airport	Battambang	Cambodia	BBM	VDBG	Asia/Phnom_Penh
4938	Shillong Airport	Shillong	India	SHL	VEBI	Asia/Calcutta
4939	Lokpriya Gopinath Bordoloi International Airport	Guwahati	India	GAU	VEGT	Asia/Calcutta
4940	Dimapur Airport	Dimapur	India	DMU	VEMR	Asia/Calcutta
4941	Tezpur Airport	Tezpur	India	TEZ	VETZ	Asia/Calcutta
4942	Barisal Airport	Barisal	Bangladesh	BZL	VGBR	Asia/Dhaka
4943	Ban Huoeisay Airport	Huay Xai	Laos	HOE	VLHS	Asia/Vientiane
4944	Kontum Airport	Kontum	Vietnam	KON		Asia/Saigon
4945	Bharatpur Airport	Bharatpur	Nepal	BHR	VNBP	Asia/Katmandu
4946	Bhadrapur Airport	Chandragarhi	Nepal	BDP	VNCG	Asia/Katmandu
4947	Meghauli Airport	Meghauli	Nepal	MEY	VNMG	Asia/Katmandu
4948	Nepalgunj Airport	Nepalgunj	Nepal	KEP	VNNG	Asia/Katmandu
4949	Gan International Airport	Gan Island	Maldives	GAN	VRMG	Indian/Maldives
4950	Hanimaadhoo Airport	Haa Dhaalu Atoll	Maldives	HAQ	VRMH	Indian/Maldives
4951	Kadhdhoo Airport	Laamu Atoll	Maldives	KDO	VRMK	Indian/Maldives
4952	Mae Sot Airport	Tak	Thailand	MAQ	VTPM	Asia/Bangkok
4953	Buon Ma Thuot Airport	Buonmethuot	Vietnam	BMV	VVBM	Asia/Saigon
4954	Cat Bi International Airport	Haiphong	Vietnam	HPH	VVCI	Asia/Saigon
4955	Cam Ranh Airport	Nha Trang	Vietnam	CXR	VVCR	Asia/Saigon
4956	Co Ong Airport	Conson	Vietnam	VCS	VVCS	Asia/Saigon
4957	Can Tho International Airport	Can Tho	Vietnam	VCA	VVCT	Asia/Saigon
4958	Dien Bien Phu Airport	Dienbienphu	Vietnam	DIN	VVDB	Asia/Saigon
4959	Phu Cat Airport	Phucat	Vietnam	UIH	VVPC	Asia/Saigon
4960	Pleiku Airport	Pleiku	Vietnam	PXU	VVPK	Asia/Saigon
4961	Vinh Airport	Vinh	Vietnam	VII	VVVH	Asia/Saigon
4962	Banmaw Airport	Banmaw	Burma	BMO	VYBM	Asia/Rangoon
4963	Dawei Airport	Dawei	Burma	TVY	VYDW	Asia/Rangoon
4964	Kawthoung Airport	Kawthoung	Burma	KAW	VYKT	Asia/Rangoon
4965	Loikaw Airport	Loikaw	Burma	LIW	VYLK	Asia/Rangoon
4966	Mawlamyine Airport	Mawlamyine	Burma	MNU	VYMM	Asia/Rangoon
4967	Pathein Airport	Pathein	Burma	BSX	VYPN	Asia/Rangoon
4968	Pakhokku Airport	Pakhokku	Burma	PKK	VYPU	Asia/Rangoon
4969	Sumbawa Besar Airport	Sumbawa Island	Indonesia	SWQ	WADS	Asia/Makassar
4970	Tambolaka Airport	Waikabubak-Sumba Island	Indonesia	TMC	WADT	Asia/Makassar
4971	Bokondini Airport	Bokondini-Papua Island	Indonesia	BUI	WAJB	Asia/Jayapura
4972	Senggeh Airport	Senggeh-Papua Island	Indonesia	SEH	WAJS	Asia/Jayapura
4973	Tanjung Harapan Airport	Tanjung Selor-Borneo Island	Indonesia	TJS	WALG	Asia/Makassar
4974	Datadawai Airport	Datadawai-Borneo Island	Indonesia	DTD	WALJ	Asia/Makassar
4975	Kalimarau Airport	Tanjung Redep-Borneo Island	Indonesia	BEJ	WALK	Asia/Makassar
4976	Warukin Airport	Tanjung-Borneo Island	Indonesia	TJG	WAON	Asia/Makassar
4977	Sampit(Hasan) Airport	Sampit-Borneo Island	Indonesia	SMQ	WAOS	Asia/Jakarta
4978	Dumatumbun Airport	Langgur-Kei Islands	Indonesia	LUV	WAPL	Asia/Jayapura
4979	Mali Airport	Alor Island	Indonesia	ARD	WATM	Asia/Makassar
4980	Belaga Airport	Belaga	Malaysia	BLG	WBGC	Asia/Kuala_Lumpur
4981	Long Lellang Airport	Long Datih	Malaysia	LGL	WBGF	Asia/Kuala_Lumpur
4982	Long Seridan Airport	Long Seridan	Malaysia	ODN	WBGI	Asia/Kuala_Lumpur
4983	Mukah Airport	Mukah	Malaysia	MKM	WBGK	Asia/Kuala_Lumpur
4984	Bakalalan Airport	Bakalalan	Malaysia	BKM	WBGQ	Asia/Kuala_Lumpur
4985	Lawas Airport	Lawas	Malaysia	LWY	WBGW	Asia/Kuala_Lumpur
4986	Bario Airport	Bario	Malaysia	BBN	WBGZ	Asia/Kuala_Lumpur
4987	Tomanggong Airport	Tomanggong	Malaysia	TMG	WBKM	Asia/Kuala_Lumpur
4988	Kudat Airport	Kudat	Malaysia	KUD	WBKT	Asia/Kuala_Lumpur
4989	Radin Inten II (Branti) Airport	Bandar Lampung-Sumatra Island	Indonesia	TKG	WIAT	Asia/Jakarta
4990	Halim Perdanakusuma International Airport	Jakarta	Indonesia	HLP	WIHH	Asia/Jakarta
4991	Ranai Airport	Ranai-Natuna Besar Island	Indonesia	NTX	WION	Asia/Jakarta
4992	Pangsuma Airport	Putussibau-Borneo Island	Indonesia	PSU	WIOP	Asia/Jakarta
4993	Sintang(Susilo) Airport	Sintang-Borneo Island	Indonesia	SQG	WIOS	Asia/Jakarta
4994	Pendopo Airport	Talang Gudang-Sumatra Island	Indonesia	PDO	WIPQ	Asia/Jakarta
4995	Malikus Saleh Airport	Lhok Seumawe-Sumatra Island	Indonesia	LSW	WITM	Asia/Jakarta
4996	Pulau Pangkor Airport	Pangkor Island	Malaysia	PKG	WMPA	Asia/Kuala_Lumpur
4997	Stagen Airport	Laut Island	Indonesia	KBU	WRBK	Asia/Makassar
4998	Long Bawan Airport	Long Bawan-Borneo Island	Indonesia	LBW	WRLB	Asia/Makassar
4999	Nunukan Airport	Nunukan-Nunukan Island	Indonesia	NNX	WRLF	Asia/Makassar
5000	Long Apung Airport	Long Apung-Borneo Island	Indonesia	LPU	WRLP	Asia/Makassar
5001	Albany Airport	Albany	Australia	ALH	YABA	Australia/Perth
5002	Argyle Airport	Argyle	Australia	GYL	YARG	Australia/Perth
5003	Aurukun Airport	Aurukun	Australia	AUU	YAUR	Australia/Brisbane
5004	Barcaldine Airport	Barcaldine	Australia	BCI	YBAR	Australia/Brisbane
5005	Badu Island Airport	Badu Island	Australia	BDD	YBAU	Australia/Brisbane
5006	Birdsville Airport	Birdsville	Australia	BVI	YBDV	Australia/Brisbane
5007	Broken Hill Airport	Broken Hill	Australia	BHQ	YBHI	Australia/Adelaide
5008	Hamilton Island Airport	Hamilton Island	Australia	HTI	YBHM	Australia/Brisbane
5009	Bedourie Airport	Bedourie	Australia	BEU	YBIE	Australia/Brisbane
5010	Bourke Airport	Bourke	Australia	BRK	YBKE	Australia/Sydney
5011	Burketown Airport	Burketown	Australia	BUC	YBKT	Australia/Brisbane
5012	Boigu Airport	Boigu	Australia	GIC	YBOI	Australia/Brisbane
5013	Oakey Airport	Oakey	Australia	OKY	YBOK	Australia/Brisbane
5014	Boulia Airport	Boulia	Australia	BQL	YBOU	Australia/Brisbane
5015	Bathurst Airport	Bathurst	Australia	BHS	YBTH	Australia/Sydney
5016	Blackwater Airport	Blackwater	Australia	BLT	YBTR	Australia/Brisbane
5017	Carnarvon Airport	Carnarvon	Australia	CVQ	YCAR	Australia/Perth
5018	Cobar Airport	Cobar	Australia	CAZ	YCBA	Australia/Sydney
5019	Coober Pedy Airport	Coober Pedy	Australia	CPD	YCBP	Australia/Adelaide
5020	Coconut Island Airport	Coconut Island	Australia	CNC	YCCT	Australia/Brisbane
5021	Cloncurry Airport	Cloncurry	Australia	CNJ	YCCY	Australia/Brisbane
5022	Ceduna Airport	Ceduna	Australia	CED	YCDU	Australia/Adelaide
5023	Cooktown Airport	Cooktown	Australia	CTN	YCKN	Australia/Brisbane
5024	Cunnamulla Airport	Cunnamulla	Australia	CMA	YCMU	Australia/Brisbane
5025	Coonamble Airport	Coonamble	Australia	CNB	YCNM	Australia/Sydney
5026	Coen Airport	Coen	Australia	CUQ	YCOE	Australia/Brisbane
5027	Cooma Snowy Mountains Airport	Cooma	Australia	OOM	YCOM	Australia/Sydney
5028	Doomadgee Airport	Doomadgee	Australia	DMD	YDMG	Australia/Brisbane
5029	Darnley Island Airport	Darnley Island	Australia	NLF	YDNI	Australia/Brisbane
5030	Devonport Airport	Devonport	Australia	DPO	YDPO	Australia/Melbourne
5031	Elcho Island Airport	Elcho Island	Australia	ELC	YELD	Australia/Darwin
5032	Esperance Airport	Esperance	Australia	EPR	YESP	Australia/Perth
5033	Flinders Island Airport	Flinders Island	Australia	FLS	YFLI	Australia/Melbourne
5034	Geraldton Airport	Geraldton	Australia	GET	YGEL	Australia/Perth
5035	Gladstone Airport	Gladstone	Australia	GLT	YGLA	Australia/Brisbane
5036	Groote Eylandt Airport	Groote Eylandt	Australia	GTE	YGTE	Australia/Darwin
5037	Griffith Airport	Griffith	Australia	GFF	YGTH	Australia/Sydney
5038	Horn Island Airport	Horn Island	Australia	HID	YHID	Australia/Brisbane
5039	Hooker Creek Airport	Hooker Creek	Australia	HOK	YHOO	Australia/Darwin
5040	Mount Hotham Airport	Mount Hotham	Australia	MHU	YHOT	Australia/Hobart
5041	Hughenden Airport	Hughenden	Australia	HGD	YHUG	Australia/Brisbane
5042	Julia Creek Airport	Julia Creek	Australia	JCK	YJLC	Australia/Brisbane
5043	Kalbarri Airport	Kalbarri	Australia	KAX	YKBR	Australia/Perth
5044	King Island Airport	King Island	Australia	KNS	YKII	Australia/Melbourne
5045	Kalkgurung Airport	Kalkgurung	Australia	KFG	YKKG	Australia/Darwin
5046	Karumba Airport	Karumba	Australia	KRB	YKMB	Australia/Brisbane
5047	Kowanyama Airport	Kowanyama	Australia	KWM	YKOW	Australia/Brisbane
5048	Kubin Airport	Kubin	Australia	KUG	YKUB	Australia/Brisbane
5049	Leonora Airport	Leonora	Australia	LNO	YLEO	Australia/Perth
5050	Lake Evella Airport	Lake Evella	Australia	LEL	YLEV	Australia/Darwin
5051	Lord Howe Island Airport	Lord Howe Island	Australia	LDH	YLHI	Australia/Lord_Howe
5052	Lockhart River Airport	Lockhart River	Australia	IRG	YLHR	Australia/Brisbane
5053	Lismore Airport	Lismore	Australia	LSY	YLIS	Australia/Sydney
5054	Lightning Ridge Airport	Lightning Ridge	Australia	LHG	YLRD	Australia/Sydney
5055	Longreach Airport	Longreach	Australia	LRE	YLRE	Australia/Brisbane
5056	Leinster Airport	Leinster	Australia	LER	YLST	Australia/Perth
5057	Laverton Airport	Laverton	Australia	LVO	YLTN	Australia/Perth
5058	Mabuiag Island Airport	Mabuiag Island	Australia	UBB	YMAA	Australia/Brisbane
5059	Meekatharra Airport	Meekatharra	Australia	MKR	YMEK	Australia/Perth
5060	Merimbula Airport	Merimbula	Australia	MIM	YMER	Australia/Sydney
5061	Milingimbi Airport	Milingimbi	Australia	MGT	YMGB	Australia/Darwin
5062	Maningrida Airport	Maningrida	Australia	MNG	YMGD	Australia/Darwin
5063	McArthur River Mine Airport	McArthur River Mine	Australia	MCV	YMHU	Australia/Darwin
5064	Mildura Airport	Mildura	Australia	MQL	YMIA	Australia/Hobart
5065	Mount Magnet Airport	Mount Magnet	Australia	MMG	YMOG	Australia/Perth
5066	Moree Airport	Moree	Australia	MRZ	YMOR	Australia/Sydney
5067	Moranbah Airport	Moranbah	Australia	MOV	YMRB	Australia/Brisbane
5068	Moruya Airport	Moruya	Australia	MYA	YMRY	Australia/Sydney
5069	Mount Gambier Airport	Mount Gambier	Australia	MGB	YMTG	Australia/Adelaide
5070	Mornington Island Airport	Mornington Island	Australia	ONG	YMTI	Australia/Brisbane
5071	Murray Island Airport	Murray Island	Australia	MYI	YMUI	Australia/Brisbane
5072	Maryborough Airport	Maryborough	Australia	MBH	YMYB	Australia/Brisbane
5073	Narrandera Airport	Narrandera	Australia	NRA	YNAR	Australia/Sydney
5074	Narrabri Airport	Narrabri	Australia	NAA	YNBR	Australia/Sydney
5075	Normanton Airport	Normanton	Australia	NTN	YNTN	Australia/Brisbane
5076	Newman Airport	Newman	Australia	ZNE	YNWN	Australia/Perth
5077	Olympic Dam Airport	Olympic Dam	Australia	OLP	YOLD	Australia/Adelaide
5078	Port Augusta Airport	Argyle	Australia	PUG	YPAG	Australia/Adelaide
5079	Palm Island Airport	Palm Island	Australia	PMK	YPAM	Australia/Brisbane
5080	Paraburdoo Airport	Paraburdoo	Australia	PBO	YPBO	Australia/Perth
5081	Cocos (Keeling) Islands Airport	Cocos Keeling Island	Cocos (Keeling) Islands	CCK	YPCC	Indian/Cocos
5082	Gove Airport	Gove	Australia	GOV	YPGV	Australia/Darwin
5083	Parkes Airport	Parkes	Australia	PKE	YPKS	Australia/Sydney
5084	Port Lincoln Airport	Port Lincoln	Australia	PLO	YPLC	Australia/Adelaide
5085	Pormpuraaw Airport	Pormpuraaw	Australia	EDR	YPMP	Australia/Brisbane
5086	Port Macquarie Airport	Port Macquarie	Australia	PQQ	YPMQ	Australia/Sydney
5087	Portland Airport	Portland	Australia	PTJ	YPOD	Australia/Hobart
5088	Quilpie Airport	Quilpie	Australia	ULP	YQLP	Australia/Brisbane
5089	Ramingining Airport	Ramingining	Australia	RAM	YRNG	Australia/Darwin
5090	Roma Airport	Roma	Australia	RMA	YROM	Australia/Brisbane
5091	St George Airport	St George	Australia	SGO	YSGE	Australia/Brisbane
5092	Shark Bay Airport	Shark Bay	Australia	MJK	YSHK	Australia/Perth
5093	Saibai Island Airport	Saibai Island	Australia	SBR	YSII	Australia/Brisbane
5094	Strahan Airport	Strahan	Australia	SRN	YSRN	Australia/Melbourne
5095	Thargomindah Airport	Thargomindah	Australia	XTG	YTGM	Australia/Brisbane
5096	Tennant Creek Airport	Tennant Creek	Australia	TCA	YTNK	Australia/Darwin
5097	Victoria River Downs Airport	Victoria River Downs	Australia	VCD	YVRD	Australia/Darwin
5098	Warraber Island Airport	Sue Islet	Australia	SYU	YWBS	Australia/Brisbane
5099	Windorah Airport	Windorah	Australia	WNR	YWDH	Australia/Brisbane
5100	Whyalla Airport	Whyalla	Australia	WYA	YWHA	Australia/Adelaide
5101	Wiluna Airport	Wiluna	Australia	WUN	YWLU	Australia/Perth
5102	Wollongong Airport	Wollongong	Australia	WOL	YWOL	Australia/Sydney
5103	Winton Airport	Winton	Australia	WIN	YWTN	Australia/Brisbane
5104	Wynyard Airport	Burnie	Australia	BWT	YWYY	Australia/Melbourne
5105	Yorke Island Airport	Yorke Island	Australia	OKR	YYKI	Australia/Brisbane
5106	Yam Island Airport	Yam Island	Australia	XMY	YYMI	Australia/Brisbane
5107	Beijing Nanyuan Airport	Beijing	China	NAY	ZBNY	Asia/Shanghai
5108	Chifeng Airport	Chifeng	China	CIF	ZBCF	Asia/Shanghai
5109	Changzhi Airport	Changzhi	China	CIH	ZBCZ	Asia/Shanghai
5110	Datong Airport	Datong	China	DAT	ZBDT	Asia/Shanghai
5111	Baita International Airport	Hohhot	China	HET	ZBHH	Asia/Shanghai
5112	Baotou Airport	Baotou	China	BAV	ZBOW	Asia/Shanghai
5113	Shijiazhuang Daguocun International Airport	Shijiazhuang	China	SJW	ZBSJ	Asia/Shanghai
5114	Tongliao Airport	Tongliao	China	TGO	ZBTL	Asia/Shanghai
5115	Ulanhot Airport	Ulanhot	China	HLH	ZBUL	Asia/Shanghai
5116	Xilinhot Airport	Xilinhot	China	XIL	ZBXH	Asia/Shanghai
5117	Beihai Airport	Beihai	China	BHY	ZGBH	Asia/Shanghai
5118	Changde Airport	Changde	China	CGD	ZGCD	Asia/Shanghai
5119	Dayong Airport	Dayong	China	DYG	ZGDY	Asia/Shanghai
5120	Meixian Airport	Meixian	China	MXZ	ZGMX	Asia/Shanghai
5121	Zhuhai Jinwan Airport	Zhuhai	China	ZUH	ZGSD	Asia/Shanghai
5122	Liuzhou Bailian Airport	Liuzhou	China	LZH	ZGZH	Asia/Shanghai
5123	Zhanjiang Airport	Zhanjiang	China	ZHA	ZGZJ	Asia/Shanghai
5124	Enshi Airport	Enshi	China	ENH	ZHES	Asia/Shanghai
5125	Nanyang Jiangying Airport	Nanyang	China	NNY	ZHNY	Asia/Shanghai
5126	Xiangyang Liuji Airport	Xiangfan	China	XFN	ZHXF	Asia/Shanghai
5127	Yichang Sanxia Airport	Yichang	China	YIH	ZHYC	Asia/Shanghai
5128	Ankang Wulipu Airport	Ankang	China	AKA	ZLAK	Asia/Shanghai
5129	Golmud Airport	Golmud	China	GOQ	ZLGM	Asia/Shanghai
5130	Hanzhong Chenggu Airport	Hanzhong	China	HZG	ZLHZ	Asia/Shanghai
5131	Qingyang Airport	Qingyang	China	IQN	ZLQY	Asia/Shanghai
5132	Xining Caojiabu Airport	Xining	China	XNN	ZLXN	Asia/Shanghai
5133	Yan'an Ershilipu Airport	Yan'an	China	ENY	ZLYA	Asia/Shanghai
5134	Yulin Yuyang Airport	Yulin	China	UYN	ZLYL	Asia/Shanghai
5135	Arvaikheer Airport	Arvaikheer	Mongolia	AVK	ZMAH	Asia/Ulaanbaatar
5136	Altai Airport	Altai	Mongolia	LTI	ZMAT	Asia/Ulaanbaatar
5137	Bayankhongor Airport	Bayankhongor	Mongolia	BYN	ZMBH	Asia/Ulaanbaatar
5138	Dalanzadgad Airport	Dalanzadgad	Mongolia	DLZ	ZMDZ	Asia/Ulaanbaatar
5139	Khovd Airport	Khovd	Mongolia	HVD	ZMKD	Asia/Hovd
5140	Mörön Airport	Muren	Mongolia	MXV	ZMMN	Asia/Ulaanbaatar
5141	Diqing Airport	Shangri-La	China	DIG	ZPDQ	Asia/Shanghai
5142	Mangshi Airport	Luxi	China	LUM	ZPLX	Asia/Shanghai
5143	Pu'er Simao Airport	Simao	China	SYM	ZPSM	Asia/Shanghai
5144	Zhaotong Airport	Zhaotong	China	ZAT	ZPZT	Asia/Shanghai
5145	Ganzhou Airport	Ganzhou	China	KOW	ZSGZ	Asia/Shanghai
5146	Jingdezhen Airport	Jingdezhen	China	JDZ	ZSJD	Asia/Shanghai
5147	Jiujiang Lushan Airport	Jiujiang	China	JIU	ZSJJ	Asia/Shanghai
5148	Quzhou Airport	Quzhou	China	JUZ	ZSJU	Asia/Shanghai
5149	Lianyungang Airport	Lianyungang	China	LYG	ZSLG	Asia/Shanghai
5150	Huangyan Luqiao Airport	Huangyan	China	HYN	ZSLQ	Asia/Shanghai
5151	Shubuling Airport	Linyi	China	LYI	ZSLY	Asia/Shanghai
5152	Quanzhou Jinjiang International Airport	Quanzhou	China	JJN	ZSQZ	Asia/Shanghai
5153	Tunxi International Airport	Huangshan	China	TXN	ZSTX	Asia/Shanghai
5154	Weifang Airport	Weifang	China	WEF	ZSWF	Asia/Shanghai
5155	Weihai Airport	Weihai	China	WEH	ZSWH	Asia/Shanghai
5156	Sunan Shuofang International Airport	Wuxi	China	WUX	ZSWX	Asia/Shanghai
5157	Nanping Wuyishan Airport	Wuyishan	China	WUS	ZSWY	Asia/Shanghai
5158	Wenzhou Longwan International Airport	Wenzhou	China	WNZ	ZSWZ	Asia/Shanghai
5159	Yancheng Airport	Yancheng	China	YNZ	ZSYN	Asia/Shanghai
5160	Yiwu Airport	Yiwu	China	YIW	ZSYW	Asia/Shanghai
5161	Zhoushan Airport	Zhoushan	China	HSN	ZSZS	Asia/Shanghai
5162	Qamdo Bangda Airport	Bangda	China	BPX	ZUBD	Asia/Shanghai
5163	Dachuan Airport	Dazhou	China	DAX	ZUDX	Asia/Shanghai
5164	Guangyuan Airport	Guangyuan	China	GYS	ZUGU	Asia/Shanghai
5165	Luzhou Airport	Luzhou	China	LZO	ZULZ	Asia/Shanghai
5166	Mianyang Airport	Mianyang	China	MIG	ZUMY	Asia/Shanghai
5167	Nanchong Airport	Nanchong	China	NAO	ZUNC	Asia/Shanghai
5168	Nyingchi Airport	Nyingchi	China	LZY	ZUNZ	Asia/Shanghai
5169	Wanxian Airport	Wanxian	China	WXN	ZUWX	Asia/Shanghai
5170	Aksu Airport	Aksu	China	AKU	ZWAK	Asia/Shanghai
5171	Qiemo Yudu Airport	Qiemo	China	IQM	ZWCM	Asia/Shanghai
5172	Kuqa Airport	Kuqa	China	KCA	ZWKC	Asia/Shanghai
5173	Korla Airport	Korla	China	KRL	ZWKL	Asia/Shanghai
5174	Karamay Airport	Karamay	China	KRY	ZWKM	Asia/Shanghai
5175	Yining Airport	Yining	China	YIN	ZWYN	Asia/Shanghai
5176	Heihe Airport	Heihe	China	HEK	ZYHE	Asia/Shanghai
5177	Jiamusi Airport	Jiamusi	China	JMU	ZYJM	Asia/Shanghai
5178	Jinzhou Airport	Jinzhou	China	JNZ	ZYJZ	Asia/Shanghai
5179	Qiqihar Sanjiazi Airport	Qiqihar	China	NDG	ZYQQ	Asia/Shanghai
5180	Yanji Chaoyangchuan Airport	Yanji	China	YNJ	ZYYJ	Asia/Shanghai
5181	Waikoloa Heliport	Waikoloa Village	United States	WKL	HI07	Pacific/Honolulu
5182	Athen Helenikon Airport	Athens	Greece			Europe/Athens
5183	Valletta Sea Plane Terminal	Valletta	Malta			Europe/Malta
5184	Gozo Sea Plane Terminal	Mgarr	Malta			Europe/Malta
5185	Mount Keith Airport	Mount Keith	Australia	WME	YMNE	Australia/Perth
5186	Los Roques Airport	Los Roques	Venezuela	LRV	SVRS	America/Caracas
5187	Inishmore Aerodrome	Inis Mor	Ireland	IOR	EIIM	Europe/Dublin
5188	Connemara Regional Airport	Indreabhan	Ireland	NNR	EICA	Europe/Dublin
5189	Rügen Airport	Ruegen	Germany	GTI	EDCG	Europe/Berlin
5190	Berezovo Airport	Berezovo	Russia	EZV	USHB	Asia/Yekaterinburg
5191	Szczecin-Dąbie Airport	Szczecin	Poland		EPSD	Europe/Warsaw
5192	Worcester Regional Airport	Worcester	United States	ORH	KORH	America/New_York
5193	Anqing Tianzhushan Airport	Anqing	China	AQG	ZSAQ	Asia/Shanghai
5194	Jing Gang Shan Airport	Ji An	China			Asia/Shanghai
5195	Shanhaiguan Airport	Qinhuangdao	China	SHP	ZBSH	Asia/Shanghai
5196	Yuncheng Guangong Airport	Yuncheng	China	YCU	ZBYC	Asia/Shanghai
5197	Lanzhou City Airport	Lanzhou	China		ZLAN	Asia/Shanghai
5198	Jiayuguan Airport	Jiayuguan	China	JGN	ZLJQ	Asia/Shanghai
5199	Dandong Airport	Dandong	China	DDG	ZYDD	Asia/Shanghai
5200	Ordos Ejin Horo Airport	Dongsheng	China	DSN	ZBDS	Asia/Shanghai
5201	Bao'anying Airport	Panzhihua	China	PZI	ZUZH	Asia/Shanghai
5202	Grytviken	Grytviken	South Georgia and the Islands			Atlantic/South_Georgia
5203	South Shetland	South Shetland	Antarctica			
5204	South Shetland	South Shetland	Antarctica			Antarctica/South_Pole
5205	New Rochelle Amtrak Station	New Rochelle	United States			America/New_York
5206	New Haven Rail Station	New Haven	United States	ZVE		America/New_York
5207	Chicago Union Station	Chicago	United States			America/Chicago
5208	Dibrugarh Airport	Dibrugarh	India			Asia/Calcutta
5209	Doha Free Zone Airport	Doha	Qatar	XOZ		Asia/Qatar
5210	Bremerton National Airport	Bremerton	United States	PWT	KPWT	America/Los_Angeles
5211	Spencer Municipal Airport	Spencer	United States	SPW	KSPW	America/Chicago
5212	Jefferson City Memorial Airport	Jefferson City	United States	JEF	KJEF	America/Chicago
5213	Grand Canyon West Airport	Grand Canyon West	United States	GCW		America/Phoenix
5214	Boulder City Municipal Airport	Boulder City	United States	BLD	KBVU	America/Phoenix
5215	Tannheim Airfield	Tannheim	Germany		EDMT	Europe/Berlin
5216	Glenview Amtrak Station	Glenview	United States			America/Chicago
5217	Baltimore Penn Station	Baltimore	United States			America/New_York
5218	Summit Camp	Ice Cap	Greenland			America/Danmarkshavn
5219	Unst Airport	Unst	United Kingdom	UNT	EGPW	Europe/London
5220	Berkley Structures Heliport	Pagerungan	Indonesia		WA19	America/Los_Angeles
5221	Provincetown Municipal Airport	Provincetown	United States	PVC	KPVC	America/New_York
5222	Kenmore Air Harbor Seaplane Base	Seattle	United States	LKE	KW55	America/Los_Angeles
5223	Anduki Airport	Seria	Brunei		WBAK	Asia/Brunei
5224	Magas	Nazran	Russia	%u0	%u04	Europe/Moscow
5225	Gustaf III Airport	Gustavia	France	SBH	TFFJ	
5226	Morro de Sao Paulo	Morro de Sao Paulo	Brazil			
5227	Morro de Sao Paulo	Morro de Sao Paulo	Brazil			America/Fortaleza
5228	Belize City Municipal Airport	Belize	Belize	TZA		America/Belize
5229	Kostroma Sokerkino Airport	Kostroma	Russia	KMW	UUBA	Europe/Moscow
5230	Sukhumi Dranda Airport	Sukhumi	Georgia	SUI	UGSS	Asia/Tbilisi
5231	Donskoye Airport	Tambow	Russia	TBW	UUOT	Europe/Moscow
5232	Oban Airport	North Connel	United Kingdom	OBN	EGEO	Europe/London
5233	Vilamendhoo	Vilamendhoo	Maldives			Arctic/Longyearbyen
5234	Vilamendhoo	Vilamendhoo	Maldives			Indian/Maldives
5235	Vilamendhoo	Vilamendhoo	Maldives			Indian/Maldives
5236	Vilamendhoo	Vilamendhoo	Maldives			
5237	Aaa	Aaa	Maldives			
5238	Vilamendhoo	Vilamendhoo	Maldives			
5239	Vilamendhoo	Vilamendhoo	Maldives			Indian/Maldives
5240	Sharya	Sharya	Russia			Europe/Moscow
5241	Mt. Fuji Shizuoka Airport	Shizuoka	Japan	FSZ	RJNS	Asia/Tokyo
5242	Erechim Airport	Erechim	Brazil	ERM	SSER	America/Sao_Paulo
5243	La Côte Airport	Prangins	Switzerland		LSGP	Europe/Zurich
5244	Courchevel Airport	Courcheval	France	CVF	LFLJ	Europe/Paris
5245	Fullerton Municipal Airport	Fullerton	United States	FUL	KFUL	America/Los_Angeles
5246	Concord-Padgett Regional Airport	Concord	United States	USA	KJQF	America/New_York
5247	Isle of Wight / Sandown Airport	Isle Of Wight	United Kingdom		EGHN	Europe/London
5248	Fort William Heliport	Fort William	United Kingdom	FWM		Europe/London
5249	Navoi Airport	Navoi	Uzbekistan	NVI	UTSA	Asia/Samarkand
5250	La Defense Heliport	Paris	France	JPU		Europe/Paris
5251	Andernos Les Bains Airport	Andernos-Les-Bains	France		LFCD	Europe/Paris
5252	Ronda Airport	Ronda	Spain	RRA		Europe/Madrid
5253	Bienenfarm Airport	Nauen	Germany		EDOI	Europe/Berlin
5254	Champion-7	Champion-7	Brunei			
5255	Ain Arnat Airport	Setif	Algeria	QSF	DAAS	Africa/Algiers
5256	La Rochelle-Île de Ré Airport	La Rochelle	France	LRH	LFBH	Europe/Paris
5257	Friedman Memorial Airport	Hailey	United States	SUN	KSUN	America/Denver
5258	Balkhash Airport	Balkhash	Kazakhstan			Asia/Qyzylorda
5259	Yverdon-les-Bains Airport	Yverdon-Les-Bains	Switzerland		LSGY	Europe/Zurich
5260	Portsmouth Airport	Portsmouth	United Kingdom	PME		Europe/London
5261	Bielsko Biala Airport	Bielsko-Biala	Poland		EPBA	Europe/Warsaw
5262	Mason City Municipal Airport	Mason City	United States	MCW	KMCW	America/Chicago
5263	Salar de Uyuni	Salar de Uyuni	Bolivia			America/La_Paz
5264	Isla Pescado	Isla Pescado	Bolivia			America/La_Paz
5265	Toro Toro	Toro Toro	Bolivia			America/La_Paz
5266	Phoenix-Mesa-Gateway Airport	Mesa	United States	AZA	KIWA	America/Phoenix
5267	Saúl Airport	Saul	French Guiana	XAU	SOOS	America/Cayenne
5268	Fremont Airport	Fremont	United States			America/New_York
5269	Washington Union Station	Washington	United States	ZWU		America/New_York
5270	Sun Island	Sun Island	Maldives			Indian/Maldives
5271	Zweibruecken	Zweibruecken	Germany			Europe/Berlin
5272	Tekapo Aerodrome	Lake Tekapo	New Zealand		NZTL	Pacific/Auckland
5273	QTHRL	Queenstown	New Zealand			Pacific/Auckland
5274	QTHRS	Queenstown	New Zealand			Pacific/Auckland
5275	Helirafting Start	Queenstown	New Zealand			Pacific/Auckland
5276	Helirafting Landung	Queenstown	New Zealand			Pacific/Auckland
5277	Jomo Kenyatta	Nairobi	Kenya			Africa/Nairobi
5278	DWEST	DWEST	Germany			Europe/Berlin
5279	Niederoeblarn Airport	Niederoeblarn	Austria		LOGO	Europe/Vienna
5280	Vöslau Airport	Bad Voeslau	Austria		LOAV	Europe/Vienna
5281	Arekuna Camp	Arekuna	Venezuela			America/Caracas
5282	Uetersen/Heist Airport	Uetersen	Germany		EDHE	Europe/Berlin
5283	HLP1 HS-16	Salzwedel	Germany			Europe/Berlin
5284	HLP2 HS-16	Nordhausen	Germany			Europe/Berlin
5285	HLP HQ GT	Paetz	Germany			Europe/Berlin
5286	Anaktuvuk Pass Airport	Anaktuvuk Pass	United States	AKP	PAKP	America/Anchorage
5287	Anvik Airport	Anvik	United States	ANV	PANV	America/Anchorage
5288	Atqasuk Edward Burnell Sr Memorial Airport	Atqasuk	United States	ATK	PATQ	America/Anchorage
5289	Gambell Airport	Gambell	United States	GAM	PAGM	America/Anchorage
5290	Hooper Bay Airport	Hooper Bay	United States	HPB	PAHP	America/Anchorage
5291	Kaltag Airport	Kaltag	United States	KAL	PAKV	America/Anchorage
5292	St Mary's Airport	St Mary's	United States	KSM	PASM	America/Anchorage
5293	Kivalina Airport	Kivalina	United States	KVL	PAVL	America/Anchorage
5294	Mekoryuk Airport	Mekoryuk	United States	MYU	PAMY	America/Anchorage
5295	Point Hope Airport	Point Hope	United States	PHO	PPHO	America/Anchorage
5296	Ruby Airport	Ruby	United States	RBY	PARY	America/Anchorage
5297	Shishmaref Airport	Shishmaref	United States	SHH	PASH	America/Anchorage
5298	Savoonga Airport	Savoonga	United States	SVA	PASA	America/Anchorage
5299	Noatak Airport	Noatak	United States	WTK	PAWN	America/Anchorage
5300	Ormoc Airport	Ormoc City	Philippines	OMC	RPVO	Asia/Manila
5301	Puvirnituq Airport	Puvirnituq	Canada	YPX	CYPX	America/Toronto
5302	Tasiujaq Airport	Tasiujaq	Canada	YTQ	CYTQ	America/Toronto
5303	Arctic Village Airport	Arctic Village	United States	ARC	PARC	America/Anchorage
5304	Sam Mbakwe International Airport	Imo	Nigeria	QOW	DNIM	Africa/Lagos
5305	Arenal Airport	La Fortuna/San Carlos	Costa Rica	FON	MRAN	America/Costa_Rica
5306	Tambor Airport	Nicoya	Costa Rica	TMU	MRTR	America/Costa_Rica
5307	Cauayan Airport	Cauayan	Philippines	CYZ	RPUY	Asia/Manila
5308	Kirovsk-Apatity Airport	Apatity	Russia	KVK	ULMK	Europe/Moscow
5309	Coronel Altino Machado de Oliveira Airport	Governador Valadares	Brazil	GVR	SBGV	America/Sao_Paulo
5310	Port Clarence Coast Guard Station	Port Clarence	United States	KPC	PAPC	America/Anchorage
5311	Pajala Airport	Pajala	Sweden	PJA	ESUP	Europe/Stockholm
5312	Bella Coola Airport	Bella Coola	Canada	QBC	CYBD	America/Vancouver
5313	Hagerstown Regional Richard A Henson Field	Hagerstown	United States	HGR	KHGR	America/New_York
5314	Araracuara Airport	Araracuara	Colombia	ACR	SKAC	America/Bogota
5315	Gorakhpur Airport	Gorakhpur	India	GOP	VEGK	Asia/Calcutta
5316	Sand Point Airport	Sand Point	United States	SDP	PASD	America/Anchorage
5317	Hami Airport	Hami	China	HMI	ZWHM	Asia/Shanghai
5318	Wuzhou Changzhoudao Airport	Wuzhou	China	WUZ	ZGWZ	Asia/Shanghai
5319	Tugdan Airport	Romblon	Philippines	TBH	RPVU	Asia/Manila
5320	Sahand Airport	Maragheh	Iran	ACP	OITM	Asia/Tehran
5321	Gorgan Airport	Gorgan	Iran	GBT	OING	Asia/Tehran
5322	Ilam Airport	Ilam	Iran	IIL	OICI	Asia/Tehran
5323	Parsabade Moghan Airport	Parsabad	Iran	PFQ	OITP	Asia/Tehran
5324	Nueva Loja Airport	Lago Agrio	Ecuador	LGQ	SELA	America/Guayaquil
5325	Tocache Airport	Tocache	Peru		SPCH	America/Lima
5326	Tacheng Airport	Tacheng	China	TCG	ZWTC	Asia/Shanghai
5327	Mardin Airport	Mardin	Turkey	MQM	LTCR	Europe/Istanbul
5328	Sugraly Airport	Zarafshan	Uzbekistan	AFS	UTSN	Asia/Samarkand
5329	Deering Airport	Deering	United States	DRG	PADE	America/Anchorage
5330	Leon Airport	Leon	Spain	LEN	LELN	Europe/Madrid
5331	Burgos Airport	Burgos	Spain	RGS	LEBG	Europe/Madrid
5332	Sege Airport	Sege	Solomon Islands	EGM	AGGS	Pacific/Guadalcanal
5333	Shahrekord Airport	Shahre Kord	Iran	CQD	OIFS	Asia/Tehran
5334	Kangra Airport	Kangra	India	DHM	VIGG	Asia/Calcutta
5335	Nanded Airport	Nanded	India	NDC	VAND	Asia/Calcutta
5336	Shimla Airport	Shimla	India	SLV	VISM	Asia/Calcutta
5337	Igiugig Airport	Igiugig	United States	IGG	PAIG	America/Anchorage
5338	New Stuyahok Airport	New Stuyahok	United States	KNW	PANW	America/Anchorage
5339	King Cove Airport	King Cove	United States	KVC	PAVC	America/Anchorage
5340	Port Heiden Airport	Port Heiden	United States	PTH	PAPH	America/Anchorage
5341	Togiak Airport	Togiak Village	United States	TOG	PATG	America/Anchorage
5342	Geneina Airport	Geneina	Sudan	EGN	HSGN	Africa/Khartoum
5343	Long Akah Airport	Long Akah	Malaysia	LKH	WBGL	Asia/Kuala_Lumpur
5344	Tanjung Manis Airport	Tanjung Manis	Malaysia	TGC	WBTM	Asia/Kuala_Lumpur
5345	Walaha Airport	Walaha	Vanuatu	WLH	NVSW	Pacific/Efate
5346	Chaoyang Airport	Chaoyang	China	CHG	ZYCY	Asia/Shanghai
5347	Buffalo Spring	Samburu South	Kenya	UAS	HKSB	Africa/Nairobi
5348	Brus Laguna Airport	Brus Laguna	Honduras	BHG	MHBL	America/Tegucigalpa
5349	Bonaventure Airport	Bonaventure	Canada	YVB	CYVB	America/Toronto
5350	Sialkot Airport	Sialkot	Pakistan	SKT	OPST	Asia/Karachi
5351	Capitan Corbeta CA Curbelo International Airport	Punta del Este	Uruguay	PDP	SULS	America/Montevideo
5352	Walvis Bay Airport	Walvis Bay	Namibia	WVB	FYWB	Africa/Windhoek
5353	Katima Mulilo Airport	Mpacha	Namibia	MPA	FYKM	Africa/Windhoek
5354	Anadolu Airport	Eskissehir	Turkey	AOE	LTBY	Europe/Istanbul
5355	Çanakkale Airport	Canakkale	Turkey	CKZ	LTBH	Europe/Istanbul
5356	Muş Airport	Mus	Turkey	MSR	LTCK	Europe/Istanbul
5357	Sinop Airport	Sinop	Turkey	NOP	LTCM	Europe/Istanbul
5358	Tekirdağ Çorlu Airport	Çorlu	Turkey	TEQ	LTBU	Europe/Istanbul
5359	Bursa Yenişehir Airport	Yenisehir	Turkey	YEI	LTBR	Europe/Istanbul
5360	Terre-de-Haut Airport	Les Saintes	Guadeloupe	LSS	TFFS	America/Guadeloupe
5361	Kalay Airport	Kalemyo	Myanmar	KMV	VYKL	Asia/Rangoon
5362	Vieques Airport	Vieques Island	Puerto Rico	VQS	TJCG	America/Puerto_Rico
5363	St Augustin Airport	St-Augustin	Canada	YIF	CYIF	America/Blanc-Sablon
5364	Hamadan Airport	Hamadan	Iran	HDM	OIHH	Asia/Tehran
5365	Marinduque Airport	Gasan	Philippines	MRQ	RPUW	Asia/Manila
5366	Grafton Airport	Grafton	Australia	GFN	YGFN	Australia/Sydney
5367	Orange Airport	Orange	Australia	OAG	YORG	Australia/Sydney
5368	Taree Airport	Taree	Australia	TRO	YTRE	Australia/Sydney
5369	Choibalsan Airport	Choibalsan	Mongolia	COQ	ZMCD	Asia/Ulaanbaatar
5370	Hohenems-Dornbirn Airport	Hohenems	Austria	HOH	LOIH	Europe/Vienna
5371	Weser-Wümme Airport	Hellwege	Germany		EDWM	Europe/Berlin
5372	Krems Airport	Krems	Austria		LOAG	Europe/Vienna
5373	Delta County Airport	Escanaba	United States	ESC	KESC	America/New_York
5374	Lauf-Lillinghof	Lillinghof	Germany			Europe/Berlin
5375	Yakutat Airport	Yakutat	United States	YAK	PAYA	America/Anchorage
5376	Torp	Sandefjord	Norway			Europe/Oslo
5377	Goulburn Airport	Goulburn	Australia	GUL	YGLB	Australia/Sydney
5378	Cessnock Airport	Cessnock	Australia	CES	YCNK	Australia/Sydney
5379	Scone Airport	Scone	Australia	NSO	YSCO	Australia/Sydney
5380	Mudgee Airport	Mudgee	Australia	DGE	YMDG	Australia/Sydney
5381	Maitland Airport	Maitland	Australia	MTL	YMND	Australia/Sydney
5382	EuroAirport	Mulhouse	France	EAP		Europe/Paris
5383	South Ari Atoll	Paradies Island	Maldives		ARIA	Indian/Maldives
5384	Susse	Kangia	Greenland			America/Godthab
5385	Benjamin Rivera Noriega Airport	Culebra Island	Puerto Rico	CPX	TJCP	America/Puerto_Rico
5386	Raron Airport	Raron	Switzerland		LSTA	Europe/Zurich
5387	Hongyuan Airfield	Hongyuan	China			Asia/Shanghai
5388	Balti International Airport	Strymba	Moldova			Europe/Chisinau
5389	Borovaya Airfield	Minsk	Belarus		UMMB	Europe/Minsk
5390	Mukachevo	Mukacheve	Ukraine			Europe/Kiev
5391	Mukachevo Air Base	Mukacheve	Ukraine			Europe/Kiev
5392	Militaerlager	S-Chanf	Switzerland			Europe/Zurich
5393	Amlikon Glider Airport	Amlikon	Switzerland		LSPA	Europe/Zurich
5394	Lommis Airfield	Lommis	Switzerland		LSZT	Europe/Zurich
5395	Williamson County Regional Airport	Marion	United States	MWA	KMWA	America/Chicago
5396	Burnet Municipal Kate Craddock Field	Bamburi	Kenya		KBMQ	America/Chicago
5397	Namanga	Namanga	Kenya			Africa/Dar_es_Salaam
5398	Mara Lodges	Mara Lodges	Kenya			Africa/Nairobi
5399	Oceanside Municipal Airport	Fraser Island	Australia	OCN	KOKB	America/Los_Angeles
5400	Flugplatz Finsterwalde/Heinrichsruh	Finsterwalde	Germany		EDAS	Europe/Berlin
5401	Nastaetten	Nastaetten	Germany			Europe/Berlin
5402	Kirkuk Air Base	Kirkuk	Iraq	KIK	ORKK	Asia/Baghdad
5403	Al Udeid Air Base	Doha	Qatar	XJD	OTBH	Asia/Qatar
5404	Great Barrier Aerodrome	Claris	New Zealand	GBZ	NZGB	Pacific/Auckland
5405	Gouvia Marina	Gouvia	Greece			Europe/Athens
5406	Paxos Marina	Paxos	Greece			Europe/Athens
5407	Ford Airport	Iron Mountain	United States	IMT	KIMT	America/Chicago
5408	Marquette Airport	Marquette	United States		KMQT	America/New_York
5409	Allakaket Airport	Allakaket	United States	AET	PFAL	America/Anchorage
5410	Dinslaken/Schwarze Heide Airport	Dinslaken	Germany		EDLD	Europe/Berlin
5411	Höxter-Holzminden Airport	Hoexter Holzminden	Germany		EDVI	Europe/Berlin
5412	East Glacier Park Amtrak Station	East Glacier	United States			America/Denver
5413	Niijima Airport	Niijima	Japan		RJAN	Asia/Tokyo
5414	Michigan City Municipal Airport	Michigan City	United States	MGC	KMGC	America/Chicago
5415	Seward Airport	Seward	United States	SWD	PAWD	America/Anchorage
5416	McCarthy Airport	McCarthy	United States	MXY		America/Anchorage
5417	Silverton	Silverton	United States			America/Denver
5418	Porter County Municipal Airport	Valparaiso	United States	NPZ		America/Chicago
5419	Grand Marais Cook County Airport	Grand Marais	United States	GRM	KCKC	America/Chicago
5420	Mackinac Island Airport	Mackinac Island	United States	MCD		America/New_York
5421	Gogebic Iron County Airport	Ironwood	United States	IWD		America/Chicago
5422	Portage Municipal Airport	Portage	United States	C47		America/Chicago
5423	Wausau Downtown Airport	Wausau	United States	AUW	KAUW	America/Chicago
5424	Gardermoen Airport	Oslo	Norway	GEN		Europe/Oslo
5425	Kalundborg Airport	Kalundborg	Denmark		EKKL	Europe/Copenhagen
5426	Solio Ranch Airport	Solio	Kenya			Africa/Nairobi
5427	Kimana	Kimana	Kenya			Africa/Nairobi
5428	Crocodile Camp	Tsavo East	Kenya			Africa/Nairobi
5429	Mary Airport	Mary	Turkmenistan	MYP	UTAM	Asia/Ashgabat
5430	Bungle Bungle Airport	Bungle Bungle	Australia		YBUU	Australia/Perth
5431	Macomb Municipal Airport	Macomb	United States	MQB		America/Chicago
5432	Sazená Airport	Sazena	Czech Republic		LKSZ	Europe/Prague
5433	RK Heliplex	Panorama	Canada			America/Edmonton
5434	Point Roberts Airpark	Point Roberts	United States	1RL	K1RL	America/Los_Angeles
5435	Lyon Part-Dieu Railway	Lyon	France	XYD		Europe/Paris
5436	Spray View Airport	Spray View	Zimbabwe		FVSV	Africa/Harare
5437	Reykjahlíð Airport	Myvatn	Iceland	MVA	BIRL	Atlantic/Reykjavik
5438	Sabadell Airport	Sabadell	Spain	QSA	LELL	Europe/Madrid
5439	Aeropuerto de Rafaela	Rafaela	Argentina	RAF		America/Cordoba
5440	Whitsunday Island Airport	Airlie Beach	Australia	WSY	YWHI	Australia/Brisbane
5441	Delaware County Johnson Field	Muncie	United States	MIE	KMIE	America/New_York
5442	Miami University Airport	Oxford	United States	OXD		America/New_York
5443	Purdue University Airport	Lafayette	United States	LAF	KLAF	America/New_York
5444	De Kalb Taylor Municipal Airport	De Kalb	United States	DKB		America/Chicago
5445	Grand Geneva Resort Airport	Lake Geneva	United States	C02		America/Chicago
5446	Brown County Airport	Georgetown	United States		KGEO	America/New_York
5447	North Las Vegas Airport	Las Vegas	United States	VGT	KVGT	America/Los_Angeles
5448	Kenosha Regional Airport	Kenosha	United States	ENW	KENW	America/Chicago
5449	Clow International Airport	Bolingbrook	United States	1CS		America/Chicago
5450	Montrose Regional Airport	Montrose CO	United States	MTJ	KMTJ	America/Denver
5451	Riverton Regional Airport	Riverton WY	United States	RIW	KRIW	America/Denver
5452	Tyonek Airport	Tyonek	United States	TYE		America/Anchorage
5453	Eastern Oregon Regional At Pendleton Airport	Pendleton	United States	PDT	KPDT	America/Los_Angeles
5454	Shoestring Aviation Airfield	Stewartstown	United States	0P2		America/New_York
5455	Door County Cherryland Airport	Sturgeon Bay	United States	SUE		America/Chicago
5456	Lympne Airport	Lympne	United Kingdom	LYM	EGMK	Europe/London
5457	Porto Cheli Airport	Porto Heli	Greece	PKH	LGHL	Europe/Athens
5458	Dusseldorf Hauptbahnhof	Dusseldorf	Germany	QDU		Europe/Berlin
5459	Cambridge Municipal Airport	Cambridge	United States	CDI		America/New_York
5460	Dowagiac Municipal Airport	Dowagiac	United States	C91		America/New_York
5461	Putnam County Airport	Greencastle	United States	4I7		America/New_York
5462	Everglades Airpark	Everglades	United States	X01		America/New_York
5463	Galt Field Airport	Greenwood	United States	10C		America/Chicago
5464	Zell Am See Airport	Zell am See	Austria		LOWZ	Europe/Vienna
5465	Geiranger	Geiranger	Norway		GEIR	Europe/Oslo
5466	RAAF Base Amberley	Amberley	Australia		YAMB	Australia/Brisbane
5467	Tindal Airport	Katherine	Australia	KTR	YPTN	Australia/Darwin
5468	RAAF Williams	Laverton Base	Laverton	Australia		O
5469	Nowra Airport	Nowra	Australia	NOA	YSNW	Australia/Sydney
5470	Limerick	Limerick	Ireland			Europe/Dublin
5471	Thurles	Thurles	Ireland			Europe/Dublin
5472	Ronda	Ronda	Spain			Europe/Madrid
5473	Waukesha County Airport	Waukesha	United States	UES		America/Chicago
5474	Southwest Michigan Regional Airport	Benton Harbor	United States	BEH		America/New_York
5475	Lutsk Airport	Lutsk	Ukraine	UCK	UKLC	Europe/Kiev
5476	Chernihiv Shestovitsa Airport	Chernigov	Ukraine	CEJ	UKRR	Europe/Kiev
5477	Ternopil International Airport	Ternopol	Ukraine		UKLT	Europe/Kiev
5478	Brest Airport	Brest	Belarus	BQT	UMBB	Europe/Minsk
5479	Wittman Regional Airport	Oshkosh	United States	OSH	KOSH	America/Chicago
5480	Harle Airport	Harlesiel	Germany		EDXP	Europe/Berlin
5481	Wangerooge Airport	Wangerooge	Germany	AGE	EDWG	Europe/Berlin
5482	Aeroporto Prefeito Octavio de Almeida Neves	Sao Joao del Rei	Brazil	JDR		America/Sao_Paulo
5483	RAAF Base Pearce	Perth	Australia		YPEA	Australia/Perth
5484	Bendigo Airport	Bendigo	Australia	BXG	YBDG	Australia/Hobart
5485	Pangborn Memorial Airport	Wenatchee	United States	EAT	KEAT	America/Los_Angeles
5486	Antonio Nery Juarbe Pol Airport	Arecibo	Puerto Rico	ARE	TJAB	America/Puerto_Rico
5487	Ringi Cove Airport	Ringi Cove	Solomon Islands	RIN	AGRC	Pacific/Guadalcanal
5488	Bellona	Bellona	Solomon Islands	BNY		Pacific/Guadalcanal
5489	Bellona	Bellona	Solomon Islands	BN1		Africa/Nouakchott
5490	Fortman Airport	St. Marys	United States	1OH		America/New_York
5491	Kirensk Airport	Kirensk	Russia	KCK	UIKK	Asia/Irkutsk
5492	Kavalerovo	Kavalerovo	Russia			Asia/Vladivostok
5493	Ust-Kut Airport	Ust-Kut	Russia	UKX	UITT	Asia/Irkutsk
5494	Ust-Ilimsk	Ust-Ilimsk	Russia			Asia/Irkutsk
5495	Rimatara Airport	Rimatara	French Polynesia	RMT	NTAM	
5496	Triengen Airport	Triengen	Switzerland		LSPN	Europe/Zurich
5497	Lausanne-Blécherette Airport	Lausanne	Switzerland	QLS	LSGL	Europe/Zurich
5498	Speck-Fehraltorf Airport	Fehraltorf	Switzerland		LSZK	Europe/Zurich
5499	Locarno Airport	Locarno	Switzerland	ZJI	LSZL	Europe/Zurich
5500	Neuchatel Airport	Neuchatel	Switzerland	QNC	LSGN	Europe/Zurich
5501	Taganrog Yuzhny Airport	Taganrog	Russia	TGK	URRT	Europe/Moscow
5502	Gelendzhik Airport	Gelendzhik	Russia	GDZ	URKG	Europe/Moscow
5503	Zhukovsky International Airport	Ramenskoe	Russia	ZIA	UUBW	Europe/Moscow
5504	Irkutsk Northwest Airport	Irkutsk	Russia		UIIR	Asia/Irkutsk
5505	Khabarovsk Airport	Khabarovsk	Russia		UHHT	Asia/Vladivostok
5506	Dzemgi Airport	Komsomolsk-on-Amur	Russia		UHKD	Asia/Vladivostok
5507	Borisoglebskoe	Kazan	Russia			Europe/Moscow
5508	Belaya Air Base	Sredniiy	Russia		UIIB	Asia/Irkutsk
5509	Tunoshna Airport	Yaroslavl	Russia	IAR	UUDL	Europe/Moscow
5510	Byron Airport	Byron	United States			America/Los_Angeles
5511	Daqing Saertu Airport	Daqing	China	DAQ		Asia/Shanghai
5512	Gu-Lian Airport	Mohe County	China	OHE	ZYMH	Asia/Shanghai
5513	Jining Qufu Airport	Jining	China	JNG	ZLJN	Asia/Shanghai
5514	Drake Bay Airport	Puntarenas	Costa Rica	DRK	MRDK	America/Costa_Rica
5515	Altay Air Base	Altay	China	AAT	ZWAT	Asia/Shanghai
5516	Tuzla International Airport	Null	Bosnia and Herzegovina	TZL	LQTZ	Europe/Sarajevo
5517	NAS Fort Worth JRB/Carswell Field	Dallas	United States	FWH	KNFW	America/Chicago
5518	Naypyidaw Airport	Naypyidaw	Burma	NYT	VYEL	Asia/Rangoon
5519	Kyaukhtu South Airport	Kyauktu	Burma		VYXG	Asia/Rangoon
5520	Jan Mayensfield	Jan Mayen	Norway		ENJA	Arctic/Longyearbyen
5521	Bokpyinn Airport	Bokepyin	Burma	VBP	VYBP	Asia/Rangoon
5522	Huanghua Intl	Changsha	China	HHA		Asia/Shanghai
5523	Manzhouli Xijiao Airport	Manzhouli	China	NZH	ZBMZ	Asia/Shanghai
5524	Wuhai Airport	Wuhai	China	WUA	ZBUH	Asia/Shanghai
5525	Gary Chicago International Airport	Gary	United States	GYY	KGYY	America/Chicago
5526	Brainerd Lakes Regional Airport	Brainerd	United States	BRD	KBRD	America/Chicago
5527	Greenbrier Valley Airport	Lewisburg	United States	LWB	KLWB	America/New_York
5528	Pitt Greenville Airport	Greenville	United States	PGV	KPGV	America/New_York
5529	Chefornak Airport	Chefornak	United States	CYF	PACK	America/Anchorage
5530	Oxnard Airport	Oxnard	United States	OXR	KOXR	America/Los_Angeles
5531	Branson Airport	Branson	United States	BKG	KBBG	America/Chicago
5532	Tongren Fenghuang Airport	Tongren	China	TEN	ZUTR	Asia/Shanghai
5533	Jinggangshan Airport	Jian	China	JGS	ZSJA	Asia/Shanghai
5534	Penn Station	Baltimore	United States	ZBP		America/New_York
5535	Penn Station	New York	United States	ZYP		America/New_York
5536	Naiu Airport	Niau	French Polynesia	NIU	NTKN	Pacific/Tahiti
5537	Schenectady County Airport	Scotia NY	United States	SCH	KSCH	America/New_York
5538	Begishevo Airport	Nizhnekamsk	Russia	NBC	UWKE	Europe/Moscow
5539	Bogovarovo	Bogovarovo	Russia			Europe/Moscow
5540	Summit Camp	Greenland Ice Cap	Greenland		GSUM	America/Danmarkshavn
5541	Warri Airport	Osubi	Nigeria	QRW	DNSU	Africa/Lagos
5542	Volkel Air Base	Volkel	Netherlands		EHVK	Europe/Amsterdam
5543	Siargao Airport	Siargao	Philippines	IAO	RPNS	Asia/Manila
5544	Langeoog Airport	Langeoog	Germany	LGO	EDWL	Europe/Berlin
5545	Fane Airport	Fane	Papua New Guinea	FNE		Pacific/Port_Moresby
5546	Itokama Airport	Itokama	Papua New Guinea	ITK		Pacific/Port_Moresby
5547	Ononge Airport	Ononge	Papua New Guinea	ONB		Pacific/Port_Moresby
5548	Tapini Airport	Tapini	Papua New Guinea	TPI		Pacific/Port_Moresby
5549	Wanigela Airport	Wanigela	Papua New Guinea	AGL		Pacific/Port_Moresby
5550	Woitape Airport	Woitape	Papua New Guinea	WTP		Pacific/Port_Moresby
5551	Awaba Airport	Awaba	Papua New Guinea	AWB		Pacific/Port_Moresby
5552	Telefomin Airport	Telefomin	Papua New Guinea	TFM		Pacific/Port_Moresby
5553	Biel-Kappelen Airport	Biel	Switzerland		LSZP	Europe/Zurich
5554	Nelspruit Airport	Nelspruit	South Africa	NLP	FANS	Africa/Johannesburg
5555	Cherkasy International Airport	Cherkassy	Ukraine	CKC	UKKE	Europe/Kiev
5556	Gotska Sandon Heliport	Gotland	Sweden			Europe/Stockholm
5557	Lauterhorn	Faro	Sweden			Europe/Stockholm
5558	Northeast Florida Regional Airport	St. Augustine Airport	United States	UST	KSGJ	America/New_York
5559	Mykolaiv International Airport	Nikolayev	Ukraine	NLV	UKON	Europe/Kiev
5560	Ramechhap Airport	Ramechhap	Nepal	RHP	VNRC	Asia/Katmandu
5561	Charles M. Schulz Sonoma County Airport	Santa Rosa	United States	STS	KSTS	America/Los_Angeles
5562	Kissimmee Gateway Airport	Kissimmee	United States	ISM	KISM	America/New_York
5563	Lake City Gateway Airport	Lake City	United States	LCQ	KLCQ	America/New_York
5564	Deland Municipal Sidney H Taylor Field	DeLand	United States		KDED	America/New_York
5565	Haller Airpark	Green Cove Springs	United States		7FL4	America/New_York
5566	Palmar Airport	Santa Lucia	Peru		SLPA	America/La_Paz
5567	Logan-Cache Airport	Logan	United States	LGU	KLGU	America/Denver
5568	Brigham City Regional Airport	Brigham City	United States	BMC	KBMC	America/Denver
5569	Malad City Airport	Malad City	United States		KMLD	America/Denver
5570	Aspen-Pitkin Co/Sardy Field	Aspen	United States	ASE	KASE	America/Denver
5571	Hilton Head	Hilton Head	United States		KHHH	America/New_York
5572	Ulyanovsk Baratayevka Airport	Ulyanovsk	Russia	ULV	UWLL	Europe/Samara
5573	Horog	Horog	Tajikistan		UTOD	Asia/Kabul
5574	Sabi Sabi Airport	Sabi Sabi	South Africa	GSS		Africa/Johannesburg
5575	Philadelphia 30th St Station	Philadelphia	United States	ZFV		America/New_York
5576	KBWD	Brownwood	United States	BWD		America/Chicago
5577	Mexia - Limestone County Airport	Mexia	United States	LXY		America/Chicago
5578	Kerrville Municipal Louis Schreiner Field	Kerrville	United States	ERV	KERV	America/Chicago
5579	Birrfeld Airport	Birrfeld	Switzerland		LSZF	Europe/Zurich
5580	Sussex County Airport	Georgetown	United States	GED	KGED	America/New_York
5581	Prince Rupert/Seal Cove Seaplane Base	Prince Rupert	Canada	ZSW	CZSW	America/Vancouver
5582	Great Bend Municipal Airport	Great Bend	United States	GBD	KGBD	America/Chicago
5583	Hays Regional Airport	Hays	United States	HYS	KHYS	America/Chicago
5584	Spirit of St Louis Airport	Null	United States	SUS	KSUS	America/Chicago
5585	Ely Municipal Airport	Ely	United States	LYU	KELO	America/Chicago
5586	Grand Rapids Itasca Co-Gordon Newstrom field	Grand Rapids MN	United States	GPZ	KGPZ	America/Chicago
5587	Thief River Falls Regional Airport	Thief River Falls	United States	TVF	KTVF	America/Chicago
5588	Eagle River Union Airport	Eagle River	United States	EGV	KEGV	America/Chicago
5589	Lakeland-Noble F. Lee Memorial field	Minocqua - Woodruff	United States	ARV	KARV	America/Chicago
5590	Ankeny Regional Airport	Ankeny	United States		KIKV	America/Chicago
5591	Berens River Airport	Berens River	Canada	YBV	CYBV	America/Winnipeg
5592	Corpus Christi Naval Air Station/Truax Field	Corpus Christi	United States		KNGP	America/Chicago
5593	Seaplane Base	Port Simpson	Canada	YPI	CYPI	America/Vancouver
5594	Catalina Airport	Catalina Island	United States	AVX	KAVX	America/Los_Angeles
5595	Mojave Airport	Mojave	United States	MHV	KMHV	America/Los_Angeles
5596	Interlaken Air Base	Interlaken	Switzerland	ZIN	LSMI	Europe/Zurich
5597	Kenmore Air Harbor Inc Seaplane Base	Kenmore	United States	KEH		America/Los_Angeles
5598	Municipal	Corozal	Belize	CZH		America/Belize
5599	Inisheer Aerodrome	Inisheer	Ireland	INQ	EIIR	Europe/Dublin
5600	Winterlandeplatz	Maennlichen	Switzerland			Europe/Zurich
5601	Paketzentrum	Ostermundigen	Switzerland			Europe/Zurich
5602	Strezhevoy Airport	Strezhevoy	Russia	SWT	UNSS	Asia/Krasnoyarsk
5603	Cashel	Cashel	Ireland			Europe/Dublin
5604	Hutchinson Municipal Airport	Hutchinson	United States	HUT	KHUT	America/Chicago
5605	Bagram Air Base	Kabul	Afghanistan	OAI	OAIX	Asia/Kabul
5606	Prince Sultan Air Base	Al Kharj	Saudi Arabia	AKH	OEPS	Asia/Riyadh
5607	Eagle County Airport	Eagle	United States	EGA		America/Denver
5608	Oak Lawn Train Station	Oak Lawn	United States			America/Chicago
5609	Wrigleyville	Chicago	United States			America/Chicago
5610	Gelendzik	Gelendzik	Russia			Europe/Moscow
5611	Rosecrans Memorial Airport	Rosecrans	United States	STJ	KSTJ	America/Chicago
5612	Hartford Union Station	Hartford	United States	ZRT		America/New_York
5613	Stamford Amtrak Station	Stamford	United States	ZTF		America/New_York
5614	Newark Penn Station	Newark	United States	ZRP		America/New_York
5615	Pápa Air Base	Papa	Hungary		LHPA	Europe/Budapest
5616	Whiting Field Naval Air Station South Airport	Cuxhaven	Germany		KNDZ	America/Chicago
5617	Volk Field	Camp Douglas	United States	VOK	KVOK	America/Chicago
5618	Adana-Incirlik Airbase	Adana	Turkey		KUAB	Europe/Istanbul
5619	Gunnison Crested Butte Regional Airport	Gunnison	United States	GUC	KGUC	America/Denver
5620	Xi'an Xiguan Airport	Xi\\\\'AN	China	SIA	ZLSN	Asia/Shanghai
5621	Zamperini Field	Torrance	United States	TOA	KTOA	America/Los_Angeles
5622	Manistee Co Blacker Airport	Manistee	United States	MBL	KMBL	America/New_York
5623	Hickam Air Force Base	Honolulu	United States		PHIK	Pacific/Honolulu
5624	Charlotte County Airport	Punta Gorda	United States	PGD	KPGD	America/New_York
5625	Grand Canyon Heliport	Grand Canyon	United States	JGC		America/Phoenix
5626	Northern Aroostook Regional Airport	Frenchville	United States	WFK	KFVE	America/New_York
5627	Chautauqua County-Jamestown Airport	Jamestown	United States	JHW	KJHW	America/New_York
5628	La Macaza / Mont-Tremblant International Inc Airport	Mont-Tremblant	Canada	YTM	CYFJ	America/Toronto
5629	Lake Cumberland Regional Airport	Somerset	United States	SME	KSME	America/New_York
5630	Shenandoah Valley Regional Airport	Weyers Cave	United States	SHD	KSHD	America/New_York
5631	Devils Lake Regional Airport	Devils Lake	United States	DVL	KDVL	America/Chicago
5632	Dickinson Theodore Roosevelt Regional Airport	Dickinson	United States	DIK	KDIK	America/Denver
5633	Sidney - Richland Regional Airport	Sidney	United States	SDY	KSDY	America/Denver
5634	Chadron Municipal Airport	Chadron	United States	CDR	KCDR	America/Denver
5635	Alliance Municipal Airport	Alliance	United States	AIA	KAIA	America/Denver
5636	Mc Cook Ben Nelson Regional Airport	McCook	United States	MCK	KMCK	America/Chicago
5637	The Florida Keys Marathon Airport	Marathon	United States	MTH	KMTH	America/New_York
5638	Dawson Community Airport	Glendive	United States	GDV	KGDV	America/Denver
5639	L M Clayton Airport	Wolf Point	United States	OLF	KOLF	America/Denver
5640	Yellowstone Airport	West Yellowstone	United States	WYS	KWYS	America/Denver
5641	San Luis Valley Regional Bergman Field	Alamosa	United States	ALS	KALS	America/Denver
5642	Canyonlands Field	Moab	United States	CNY	KCNY	America/Denver
5643	Ely Airport Yelland Field	Ely	United States	ELY	KELY	America/Los_Angeles
5644	Vernal Regional Airport	Vernal	United States	VEL	KVEL	America/Denver
5645	Sierra Blanca Regional Airport	Ruidoso	United States	RUI	KSRR	America/Denver
5646	Show Low Regional Airport	Show Low	United States	SOW	KSOW	America/Phoenix
5647	McCall Municipal Airport	McCall	United States	MYL	KMYL	America/Denver
5648	Lemhi County Airport	Salmon	United States	SMN	KSMN	America/Denver
5649	Mammoth Yosemite Airport	Mammoth Lakes	United States	MMH	KMMH	America/Los_Angeles
5650	Friday Harbor Airport	Friday Harbor	United States	FRD	KFHR	America/Los_Angeles
5651	Orcas Island Airport	Eastsound	United States	ESD	KORS	America/Los_Angeles
5652	Anacortes Airport	Anacortes	United States	OTS		America/Los_Angeles
5653	Astoria Regional Airport	Astoria	United States	AST	KAST	America/Los_Angeles
5654	Newport Municipal Airport	Newport	United States	ONP	KONP	America/Los_Angeles
5655	Emmonak Airport	Emmonak	United States	EMK	PAEM	America/Anchorage
5656	Unalakleet Airport	Unalakleet	United States	UNK	PAUN	America/Anchorage
5657	Ugnu-Kuparuk Airport	Kuparuk	United States	UUK	PAKU	America/Anchorage
5658	Shageluk Airport	Shageluk	United States	SHX	PAHX	America/Anchorage
5659	Chuathbaluk Airport	Chuathbaluk	United States	CHU	PACH	America/Anchorage
5660	Nuiqsut Airport	Nuiqsut	United States	NUI	PAQT	America/Anchorage
5661	Eek Airport	Eek	United States	EEK	PAEE	America/Anchorage
5662	Kasigluk Airport	Kasigluk	United States	KUK	PFKA	America/Anchorage
5663	Kwethluk Airport	Kwethluk	United States	KWT	PFKW	America/Anchorage
5664	Kwigillingok Airport	Kwigillingok	United States	KWK	PAGG	America/Anchorage
5665	Marshall Don Hunter Sr Airport	Marshall	United States	MLL	PADM	America/Anchorage
5666	Russian Mission Airport	Russian Mission	United States	RSH	PARS	America/Anchorage
5667	Tuntutuliak Airport	Tuntutuliak	United States	WTL		America/Anchorage
5668	Ekwok Airport	Ekwok	United States	KEK		America/Anchorage
5669	Koliganek Airport	Koliganek	United States	KGK	PAJZ	America/Anchorage
5670	Levelock Airport	Levelock	United States	KLL		America/Anchorage
5671	Manokotak Airport	Manokotak	United States	KMO	PAMB	America/Anchorage
5672	Twin Hills Airport	Twin Hills	United States	TWA		America/Anchorage
5673	Chalkyitsik Airport	Chalkyitsik	United States	CIK	PACI	America/Anchorage
5674	Eagle Airport	Eagle	United States	EAA	PAEG	America/Anchorage
5675	Hughes Airport	Hughes	United States	HUS	PAHU	America/Anchorage
5676	Huslia Airport	Huslia	United States	HSL	PAHL	America/Anchorage
5677	Livingood Airport	Livingood	United States	LIV		America/Anchorage
5678	Minto Airport	Minto	United States	MNT		America/Anchorage
5679	Nulato Airport	Nulato	United States	NUL	PANU	America/Anchorage
5680	Rampart Airport	Rampart	United States	RMP		America/Anchorage
5681	Tanana Airport	Tanana	United States	TAL		America/Anchorage
5682	Venetie Airport	Venetie	United States	VEE	PAVE	America/Anchorage
5683	Beaver Airport	Beaver	United States	WBQ	PAWB	America/Anchorage
5684	Central Airport	Central	United States	CEM	PACE	America/Anchorage
5685	Shungnak Airport	Shungnak	United States	SHG	PAGH	America/Anchorage
5686	Birch Creek Airport	Brich Creek	United States	KBC		America/Anchorage
5687	Coldfoot Airport	Coldfoot	United States	CXF		America/Anchorage
5688	Inyokern Airport	Inyokern	United States	IYK	KIYK	America/Los_Angeles
5689	Visalia Municipal Airport	Visalia	United States	VIS	KVIS	America/Los_Angeles
5690	Merced Regional Macready Field	Merced	United States	MCE	KMCE	America/Los_Angeles
5691	Laguna de Los Patos International Airport	Colonia	Uruguay	CYR	SUCA	America/Montevideo
5692	Camelo	Camelo	Uruguay		SULO	America/Montevideo
5693	Amarais Airport	Campinas	Brazil	CPQ	SDAM	America/Sao_Paulo
5694	Phoenix Goodyear Airport	Goodyear	United States	GYR	KGYR	America/Phoenix
5695	Park City	Park City	United States			America/Denver
5696	Toowoomba Airport	Toowoomba	Australia	TWB	YTWB	Australia/Brisbane
5697	Ballera Airport	Ballera	Australia	BBL	YLLE	Australia/Brisbane
5698	Gatton Campus Airport	Gatton	Australia		YGAT	Australia/Brisbane
5699	Arkalyk North Airport	Arkalyk	Kazakhstan	AYK	UAUR	Asia/Qyzylorda
5700	Hamburger Hafen	Hamburg	Germany		ZZ06	Europe/Berlin
5701	Flugplatz Fehmarn-Neujellingsdorf	Neujellingsdorf	Germany		ZZ05	Europe/Berlin
5702	Nabern/Teck Airport	Kirchheim-Teck	Germany		EDTN	Europe/Berlin
5703	Angoon Seaplane Base	Angoon	United States	AGN	PAGN	America/Anchorage
5704	Elfin Cove Seaplane Base	Elfin Cove	United States	ELV	PAEL	America/Anchorage
5705	Tenakee Seaplane Base	Tenakee Springs	United States	TKE		America/Anchorage
5706	Pelican Seaplane Base	Pelican	United States	PEC		America/Anchorage
5707	Chatham Seaplane Base	Sitka	United States	CYM		America/Anchorage
5708	Funter Bay Seaplane Base	Funter Bay	United States	FNR	PANR	America/Anchorage
5709	Excursion Inlet Seaplane Base	Excursion Inlet	United States	EXI		America/Anchorage
5710	Hoonah Airport	Hoonah	United States	HNH	PAOH	America/Anchorage
5711	Kake Airport	Kake	United States		PAFE	America/Anchorage
5712	Craig Seaplane Base	Craig	United States	CGA		America/Anchorage
5713	Hollis Seaplane Base	Hollis	United States	HYL		America/Anchorage
5714	Metlakatla Seaplane Base	Metakatla	United States	MTM	PAMM	America/Anchorage
5715	Thorne Bay Seaplane Base	Thorne Bay	United States	KTB		America/Anchorage
5716	Hydaburg Seaplane Base	Hydaburg	United States	HYG	PAHY	America/Anchorage
5717	Hyder Seaplane Base	Hyder	United States	WHD		America/Vancouver
5718	Point Baker Seaplane Base	Point Baker	United States	KPB		America/Anchorage
5719	Port Protection Seaplane Base	Port Protection	United States	PPV		America/Anchorage
5720	North Whale Seaplane Base	North Whale Pass	United States	WWP		America/Anchorage
5721	Chignik Lake Airport	Chignik Lake	United States	KCQ		America/Anchorage
5722	Egegik Airport	Egegik	United States	EGX	PAII	America/Anchorage
5723	Chignik Lagoon Airport	Chignik Lagoon	United States	KCL		America/Anchorage
5724	Chignik Bay Seaplane Base	Chignik	United States	KBW		America/Anchorage
5725	Perryville Airport	Perryville	United States	KPV	PAPE	America/Anchorage
5726	Pilot Point Airport	Pilot Point	United States	PIP	PAPN	America/Anchorage
5727	South Naknek Nr 2 Airport	South Naknek	United States	WSN	PFWS	America/Anchorage
5728	Akhiok Airport	Akhiok	United States	AKK	PAKH	America/Anchorage
5729	Karluk Airport	Karluk	United States	KYK	PAKY	America/Anchorage
5730	Larsen Bay Airport	Larsen Bay	United States	KLN	PALB	America/Anchorage
5731	Old Harbor Airport	Old Harbor	United States	OLH		America/Anchorage
5732	Ouzinkie Airport	Ouzinkie	United States	KOZ		America/Anchorage
5733	Port Lions Airport	Port Lions	United States	ORI		America/Anchorage
5734	Alitak Seaplane Base	Lazy Bay	United States	ALZ		America/Anchorage
5735	Amook Bay Seaplane Base	Amook Bay	United States	AOS		America/Anchorage
5736	Kitoi Bay Seaplane Base	Kitoi Bay	United States	KKB		America/Anchorage
5737	Moser Bay Seaplane Base	Moser Bay	United States	KMY		America/Anchorage
5738	Olga Bay Seaplane Base	Olga Bay	United States	KOY		America/Anchorage
5739	Port Bailey Seaplane Base	Port Bailey	United States	KPY		America/Anchorage
5740	Port Williams Seaplane Base	Port Williams	United States	KPR		America/Anchorage
5741	Seal Bay Seaplane Base	Seal Bay	United States	SYB		America/Anchorage
5742	San Juan - Uganik Seaplane Base	San Juan	United States	WSJ		America/Anchorage
5743	West Point Village Seaplane Base	West Point	United States	KWP		America/Anchorage
5744	Zachar Bay Seaplane Base	Zachar Bay	United States	KZB		America/Anchorage
5745	Ambler Airport	Ambler	United States	ABL	PAFM	America/Anchorage
5746	Buckland Airport	Buckland	United States	BKC	PABL	America/Anchorage
5747	Bob Baker Memorial Airport	Kiana	United States	IAN	PAIK	America/Anchorage
5748	Kobuk Airport	Kobuk	United States	OBU	PAOB	America/Anchorage
5749	Robert (Bob) Curtis Memorial Airport	Noorvik	United States	ORV	PFNO	America/Anchorage
5750	Selawik Airport	Selawik	United States	WLK	PASK	America/Anchorage
5751	Brevig Mission Airport	Brevig Mission	United States	KTS	PFKT	America/Anchorage
5752	Elim Airport	Elim	United States	ELI	PFEL	America/Anchorage
5753	Golovin Airport	Golovin	United States	GLV	PAGL	America/Anchorage
5754	Teller Airport	Teller	United States	TLA	PATE	America/Anchorage
5755	Wales Airport	Wales	United States	WAA	PAIW	America/Anchorage
5756	White Mountain Airport	White Mountain	United States	WMO	PAWM	America/Anchorage
5757	Council Airport	Council	United States	CIL		America/Anchorage
5758	Koyuk Alfred Adams Airport	Koyuk	United States	KKA	PAKK	America/Anchorage
5759	St Michael Airport	St. Michael	United States	SMK	PAMK	America/Anchorage
5760	Shaktoolik Airport	Shaktoolik	United States	SKK	PFSH	America/Anchorage
5761	Stebbins Airport	Stebbins	United States	WBB		America/Anchorage
5762	Tin City Long Range Radar Station Airport	Tin City	United States	TNC	PATC	America/Anchorage
5763	Atka Airport	Atka	United States	AKB	PAAK	America/Adak
5764	Nikolski Air Station	Nikolski	United States	IKO	PAKO	America/Anchorage
5765	Icy Bay Airport	Icy Bay	United States	ICY		America/Anchorage
5766	Yakataga Airport	Yakataga	United States	CYT	PACY	America/Anchorage
5767	Alakanuk Airport	Alakanuk	United States	AUK	PAUK	America/Anchorage
5768	Sheldon Point Airport	Nunam Iqua	United States	SXP		America/Anchorage
5769	Kipnuk Airport	Kipnuk	United States	KPN	PAKI	America/Anchorage
5770	False Pass Airport	False Pass	United States	KFP	PAKF	America/Anchorage
5771	Nelson Lagoon Airport	Nelson Lagoon	United States	NLG	PAOU	America/Anchorage
5772	Port Moller Airport	Cold Bay	United States	PML	PAAL	America/Anchorage
5773	Klawock Airport	Klawock	United States	KLW	PAKW	America/Anchorage
5774	Quinhagak Airport	Quinhagak	United States	KWN	PAQH	America/Anchorage
5775	Kotlik Airport	Kotlik	United States	KOT	PFKO	America/Anchorage
5776	Koyukuk Airport	Koyukuk	United States	KYU	PFKU	America/Anchorage
5777	Scammon Bay Airport	Scammon Bay	United States	SCM	PACM	America/Anchorage
5778	Nondalton Airport	Nondalton	United States	NNL	PANO	America/Anchorage
5779	Pedro Bay Airport	Pedro Bay	United States	PDB		America/Anchorage
5780	Nunapitchuk Airport	Nunapitchuk	United States	NUP		America/Anchorage
5781	Kongiganak Airport	Kongiganak	United States	KKH	PADY	America/Anchorage
5782	Nikolai Airport	Nikolai	United States	NIB	PAFS	America/Anchorage
5783	Takotna Airport	Takotna	United States	TCT		America/Anchorage
5784	Pilot Station Airport	Pilot Station	United States	PQS		America/Anchorage
5785	Akiak Airport	Akiak	United States	AKI	PFAK	America/Anchorage
5786	Tuluksak Airport	Tuluksak	United States	TLT		America/Anchorage
5787	Grayling Airport	Grayling	United States	KGX		America/Anchorage
5788	Wainwright Airport	Wainwright	United States	AIN	PAWI	America/Anchorage
5789	Zapala Airport	ZAPALA	Argentina	APZ	SAHZ	America/Argentina/Salta
5790	Rincon De Los Sauces Airport	Rincon de los Sauces	Argentina	RDS	SAHS	America/Argentina/Salta
5791	Colonia Sarmiento	Colonia Sarmiento	Argentina	OLN		America/Catamarca
5792	Grytvyken	Grytvyken	South Georgia and the Islands			Atlantic/South_Georgia
5793	Rio Turbio	Rio Turbio	Argentina	RYO		America/Argentina/Rio_Gallegos
5794	Tte. Julio Gallardo Airport	Puerto Natales	Chile	PNT	SCNT	America/Santiago
5795	Caleta Olivia	Caleta Olivia	Argentina	CVI		America/Argentina/Rio_Gallegos
5796	Fitz Roy	El Chalten	Argentina			America/Argentina/Rio_Gallegos
5797	Sierra Grande Airport	Sierra Grande	Argentina	SGV	SAVS	America/Argentina/Salta
5798	Cabo F.A.A. H. R. Bordón Airport	Ingeniero Jacobacci	Argentina	IGB	SAVJ	America/Argentina/Salta
5799	Lago Posadas	Lago Posadas	Argentina			America/Argentina/Rio_Gallegos
5800	El Chalten	El Chalten	Argentina	ELX		America/Argentina/Rio_Gallegos
5801	Chenega Bay Airport	Chenega	United States	NCN	PFCB	America/Anchorage
5802	Chisana Airport	Chisana	United States	CZN		America/Anchorage
5803	Tok Junction Airport	Tok	United States	TKJ	PFTO	America/Anchorage
5804	Circle City /New/ Airport	Circle	United States	IRC	PACR	America/Anchorage
5805	Coffman Cove Seaplane Base	Coffman Cove	United States	KCC		America/Anchorage
5806	Crooked Creek Airport	Crooked Creek	United States	CKD		America/Anchorage
5807	Red Devil Airport	Red Devil	United States	RDV		America/Anchorage
5808	Sleetmute Airport	Sleetmute	United States	SLQ	PASL	America/Anchorage
5809	Stony River 2 Airport	Stony River	United States	SRV		America/Anchorage
5810	Healy River Airport	Healy	United States		PAHV	America/Anchorage
5811	Kake Seaplane Base	Kake	United States	KAE		America/Anchorage
5812	Klawock Seaplane Base	Klawock	United States		PAQC	America/Anchorage
5813	Minchumina Airport	Lake Minchumina	United States	LMA	PAMH	America/Anchorage
5814	Manley Hot Springs Airport	Manley Hot Springs	United States	MLY	PAML	America/Anchorage
5815	St. George Airport	St. George	United States			America/Anchorage
5816	Tatitlek Airport	Tatitlek	United States	TEK		America/Anchorage
5817	Ketchikan harbor Seaplane Base	Ketchikan	United States	WFB		America/Anchorage
5818	Fox Harbour Airport	Fox Harbour	Canada			America/Halifax
5819	Natuashish Airport	Natuashish	Canada	YNP	CNH2	America/Halifax
5820	Postville Airport	Postville	Canada	YSO	CCD4	America/Halifax
5821	Kangiqsujuaq (Wakeham Bay) Airport	Kangiqsujuaq	Canada	YWB	CYKG	America/Toronto
5822	Alma Airport	Alma	Canada	YTF	CYTF	America/Toronto
5823	Havre St Pierre Airport	Havre-Saint-Pierre	Canada	YGV	CYGV	America/Toronto
5824	Rimouski Airport	Rimouski	Canada	YXK	CYXK	America/Toronto
5825	Vakarufahli Island	Vakarufahli Island	Maldives			Indian/Maldives
5826	Vakarufalhi Island	Vakarufalhi Island	Maldives			Indian/Maldives
5827	Tadoule Lake Airport	Tadoule Lake	Canada	XTL	CYBQ	America/Winnipeg
5828	Lac Brochet Airport	Lac Brochet	Canada	XLB	CZWH	America/Winnipeg
5829	South Indian Lake Airport	South Indian Lake	Canada	XSI	CZSN	America/Winnipeg
5830	Brochet Airport	Brochet	Canada	YBT	CYBT	America/Winnipeg
5831	Little Grand Rapids Airport	Little Grand Rapids	Canada	ZGR	CZGR	America/Winnipeg
5832	Cross Lake (Charlie Sinclair Memorial) Airport	Cross Lake	Canada	YCR	CYCR	America/Winnipeg
5833	Red Sucker Lake Airport	Red Sucker Lake	Canada	YRS	CYRS	America/Winnipeg
5834	Rainbow Lake Airport	Rainbow Lake	Canada	YOP	CYOP	America/Edmonton
5835	Bonnyville Airport	Bonnyville	Canada	YBY	CYBF	America/Edmonton
5836	Nanaimo Harbour Water Airport	Nanaimo	Canada	ZNA	CAC8	America/Vancouver
5837	Ganges Seaplane Base	Ganges	Canada	YGG	CAX6	America/Vancouver
5838	Bedwell Harbour Water Aerdrome	Bedwell Harbour	Canada			America/Vancouver
5839	Qualicum Beach Airport	Qualicum Beach	Canada	XQU		America/Vancouver
5840	Fort St James Airport	Fort St. James	Canada		CYJM	America/Vancouver
5841	Boundary Bay Airport	Boundary Bay	Canada	YDT	CZBB	America/Vancouver
5842	Langley Airport	Langley Township	Canada	YLY	CYNJ	America/Vancouver
5843	Denny Island Airport	Bella Bella	Canada		CYJQ	America/Vancouver
5844	Sechelt Aerodrome	Sechelt-Gibsons	Canada	YHS		America/Vancouver
5845	Wekweètì Airport	Wekweeti	Canada	YFJ	CFJ2	America/Edmonton
5846	Camaguey-Campo Cuatro Milpas Airport	Guasave	Mexico		MM52	America/Mazatlan
5847	Isla de Cedros Airport	Cedros	Mexico		MMCD	America/Tijuana
5848	Cabo San Lucas International Airport	Cabo San Lucas	Mexico		MMSL	America/Mazatlan
5849	Bahia Tortugas Airfield	Bahia Tortugas	Mexico			America/Mazatlan
5850	Palo Verde Airport	San Bruno	Mexico	PVP		America/Mazatlan
5851	Ziyaraifushi	Ziyaraifushi	Maldives			Indian/Maldives
5852	Brussels Gare du Midi	Brussels	Belgium	ZYR		Europe/Brussels
5853	Caye Chapel Airport	Caye Chapel	Belize	CYC		America/Belize
5854	Big Creek Airport	Big Creek	Belize	BGK		America/Belize
5855	Dangriga Airport	Dangriga	Belize	DGA		America/Belize
5856	Placencia Airport	Placencia	Belize	PLJ		America/Belize
5857	Sartaneja Airport	Sarteneja	Belize	SJX		America/Belize
5858	Huehuetenango Airport	Huehuetenango	Guatemala			America/Guatemala
5859	Corn Island	Corn Island	Nicaragua	RNI	MNCI	America/Managua
5860	San Pedro Airport	Bonanza	Nicaragua	BZA	MNBZ	America/Managua
5861	Rosita Airport	Rosita	Nicaragua	RFS	MNRT	America/Managua
5862	Siuna	Siuna	Nicaragua	SIU	MNSI	America/Managua
5863	Waspam Airport	Waspam	Nicaragua	WSP	MNWP	America/Managua
5864	San Carlos	San Carlos	Nicaragua	NCR	MNSC	America/Managua
5865	Playa Samara/Carrillo Airport	Carrillo	Costa Rica	PLD	MRCR	America/Costa_Rica
5866	Fussen	Fussen	Germany	FUS	FUSS	Europe/Berlin
5867	John A. Osborne Airport	Montserrat	Montserrat			America/Montserrat
5868	Monte Plata Batley Juan Sanchez Field	Monte Plata	Dominican Republic		MDJS	America/Santo_Domingo
5869	Constanza - Expedición 14 de Junio National Airport	Constanza	Dominican Republic	COZ	MDCZ	America/Santo_Domingo
5870	Negril Airport	Negril	Jamaica	NEG	MKNG	America/Jamaica
5871	Bochum Railway	Bochum	Germany	EBO		Europe/Berlin
5872	Fliegerhost 	Kaufbeuren	Germany	KFB		Europe/Berlin
5873	Munich Railway	Munich	Germany	ZMU		Europe/Berlin
5874	Nuernberg Railway	Nuernberg	Germany	ZAQ		Europe/Berlin
5875	José Aponte de la Torre Airport	Ceiba	Puerto Rico	NRR	TJRV	America/Puerto_Rico
5876	Aeropuerto Internacional Valle del Conlara	Merlo	Argentina	RLO		America/Argentina/San_Luis
5877	Charlotte Amalie Harbor Seaplane Base	Charlotte Amalie	Virgin Islands	SPB	VI22	America/St_Thomas
5878	Christiansted Harbor Seaplane Base	Christiansted	Virgin Islands	SSB		America/St_Thomas
5879	D. Casimiro Szlapelis Airport	Alto Rio Senguer	Argentina	ARR	SAVR	America/Catamarca
5880	Jose De San Martin Airport	Jose de San Martin	Argentina	JSM	SAWS	America/Catamarca
5881	Uyuni Airport	Uyuni	Bolivia	UYU	SLUY	America/La_Paz
5882	Augsburg Railway	Augsburg	Germany	ZAU		Europe/Berlin
5883	Mannheim Railway	Mannheim	Germany	ZMA		Europe/Berlin
5884	Essen Railway	Essen	Germany	ZES		Europe/Berlin
5885	Rurenabaque Airport	Rerrenabaque	Bolivia	RBQ	SLRQ	America/La_Paz
5886	Lancaster Amtrak Station	Lancaster	United States			America/New_York
5887	Ardmore Amtrak Station	Ardmore	United States			America/New_York
5888	Abaiang Airport	Abaiang Atoll	Kiribati	ABF	NGAB	Pacific/Tarawa
5889	Metropark Amtrak Station	Iselin	United States			America/New_York
5890	St. Louis Downtown Airport	East St. Louis	United States	CPS		America/Chicago
5891	Afobakka Airstrip	Afobaka	Suriname		SMAF	America/Paramaribo
5892	Alalapadu Airstrip	Alapadu	Suriname		SMDU	America/Paramaribo
5893	Albina Airport	Albina	Suriname	ABN	SMBN	America/Paramaribo
5894	Lawa Anapaike Airstrip	Anapaike	Suriname		SMLA	America/Paramaribo
5895	Apetina Airstrip	Apetina	Suriname		SMPT	America/Paramaribo
5896	Botopassi Airstrip	Botopasi	Suriname	BTO		America/Paramaribo
5897	Djoemoe Airstrip	Djoemoe	Suriname	DOE		America/Paramaribo
5898	Drietabbetje Airport	Drietabbetje	Suriname	DRJ	SMDA	America/Paramaribo
5899	Kabalebo Airport	Kabalebo	Suriname		SMKA	America/Paramaribo
5900	Kayser Airport	Kayser	Suriname		SMKE	America/Paramaribo
5901	Kwamalasoemoetoe Airport	Kwamelasemoetoe	Suriname		SMSM	America/Paramaribo
5902	Moengo Airstrip	Moengo	Suriname	MOJ	SMMO	America/Paramaribo
5903	Nieuw Nickerie Airport	Nieuw Nickerie	Suriname	ICK	SMNI	America/Paramaribo
5904	Vincent Fayks Airport	Paloemeu	Suriname	OEM	SMPA	America/Paramaribo
5905	Sarakreek Airstrip	Sarakreek	Suriname		SMSK	America/Paramaribo
5906	Sipaliwini Airport	Sipaliwini	Suriname		SMSI	America/Paramaribo
5907	Stoelmanseiland Airport	Stoelmans Eiland	Suriname	SMZ	SMST	America/Paramaribo
5908	Totness Airport	Totness	Suriname	TOT	SMCO	America/Paramaribo
5909	Wageningen Airstrip	Wageningen	Suriname	AGI	SMWA	America/Paramaribo
5910	Kaieteur International Airport	Kaieteur Falls	Guyana	KIA	PSKA	America/Guyana
5911	Codela Airport	Guapiles	Costa Rica		MRCA	America/Costa_Rica
5912	Newport News Amtrak Station	Newport News	United States			America/New_York
5913	Portland Union Station	Portland	United States			America/Los_Angeles
5914	Orinduik Airport	Orinduik	Guyana	ORJ	SYOR	America/Guyana
5915	Annai Airport	Annai	Guyana	NAI	SYAN	America/Guyana
5916	Apoteri Airport	Apoteri	Guyana		SYAP	America/Guyana
5917	Imbaimadai Airport	Imbaimadai	Guyana	IMB	SYIB	America/Guyana
5918	Kamarang Airport	Kamarang	Guyana	KAR	SYKM	America/Guyana
5919	Mabaruma Airport	Mabaruma	Guyana	USI	SYMB	America/Guyana
5920	Mahdia Airport	Mahdia	Guyana	MHA	SYMD	America/Guyana
5921	Dr Augusto Roberto Fuster International Airport	Pedro Juan Caballero	Paraguay	PJC	SGPJ	America/Asuncion
5922	Alcides Fernández Airport	Acandi	Colombia	ACD	SKAD	America/Bogota
5923	Los Colonizadores Airport	Saravena	Colombia	RVE	SKSA	America/Bogota
5924	La Chorrera Airport	La Chorrera	Colombia	LCR		America/Bogota
5925	Batagay Airport	Batagay	Russia	BQJ	UEBB	Asia/Vladivostok
5926	La Macarena	La Macarena	Colombia	LMC		America/Bogota
5927	Villa Garzón Airport	Villa Garzon	Colombia	VGZ	SKVG	America/Bogota
5928	El Bagre Airport	El Bagre	Colombia	EBG	SKEB	America/Bogota
5929	Juan H White Airport	Caucasia	Colombia	CAQ	SKCU	America/Bogota
5930	Mandinga Airport	Condoto	Colombia	COG	SKCD	America/Bogota
5931	Golfo de Morrosquillo Airport	Tolu	Colombia	TLU	SKTL	America/Bogota
5932	Cabo Frio Airport	Cabo Frio	Brazil	CFB	SBCB	America/Sao_Paulo
5933	Westport Amtrak Station	Westport	United States			America/New_York
5934	Trenton Amtrak Station	Trenton	United States			America/New_York
5935	Presidente João Batista Figueiredo Airport	Sinop	Brazil	OPS	SWSI	America/Campo_Grande
5936	Gurupi Airport	Gurupi	Brazil	GRP	SWGI	America/Fortaleza
5937	Santana do Araguaia Airport	Santana do Araguaia	Brazil	CMP	SNKE	America/Belem
5938	Breves Airport	Breves	Brazil	BVS	SNVS	America/Belem
5939	Soure Airport	Soure	Brazil	SFK	SNSW	America/Belem
5940	Parintins Airport	Parintins	Brazil	PIN	SWPI	America/Boa_Vista
5941	Barreiras Airport	Barreiras	Brazil	BRA	SNBR	America/Fortaleza
5942	Santa Terezinha Airport	Santa Terezinha	Brazil	STZ	SWST	America/Campo_Grande
5943	Minaçu Airport	Minacu	Brazil	MQH	SBMC	America/Sao_Paulo
5944	Araguaína Airport	Araguaina	Brazil	AUX	SWGN	America/Fortaleza
5945	Novo Aripuanã Airport	Novo Aripuana	Brazil	NVP	SWNA	America/Boa_Vista
5946	Fazenda Colen Airport	Lucas do Rio Verde	Brazil		SWFE	America/Campo_Grande
5947	Tenente Lund Pressoto Airport	Franca	Brazil	FRC	SIMK	America/Sao_Paulo
5948	Dourados Airport	Dourados	Brazil	DOU	SSDO	America/Campo_Grande
5949	Lábrea Airport	Labrea	Brazil	LBR	SWLB	America/Boa_Vista
5950	Maestro Marinho Franco Airport	Rondonopolis	Brazil	ROO	SWRD	America/Campo_Grande
5951	Tancredo Thomas de Faria Airport	Guarapuava	Brazil	GPB	SBGU	America/Sao_Paulo
5952	Santa Terezinha Airport	Joacaba	Brazil	JCB	SSJA	America/Sao_Paulo
5953	North Philadelphia Amtrak Station	Philadelphia	United States			America/New_York
5954	Aberdeen Railway Station	Aberdeen	United Kingdom			Europe/London
5955	Glasgow Railway Station	Glasgow	United Kingdom			Europe/London
5956	Edinburgh Waverly Station	Edinburgh	United Kingdom	ZXE		Europe/London
5957	Newcastle Railway Station	Newcastle Upon Tyne	United Kingdom			Europe/London
5958	Leeds Railway Station	Leeds	United Kingdom			Europe/London
5959	Manchester Picadilly Station	Manchester	United Kingdom			Europe/London
5960	Liverpool Railway Station	Liverpool	United Kingdom			Europe/London
5961	London Euston Railway Station	London	United Kingdom			Europe/London
5962	General Leite de Castro Airport	Rio Verde	Brazil	RVD	SWLC	America/Sao_Paulo
5963	Romeu Zema Airport	Araxa	Brazil	AAX	SBAX	America/Sao_Paulo
5964	Maués Airport	Maues	Brazil	MBZ	SWMW	America/Boa_Vista
5965	Borba Airport	Borba	Brazil	RBB	SWBR	America/Boa_Vista
5966	Coari Airport	Coari	Brazil	CIZ	SWKO	America/Boa_Vista
5967	Barcelos Airport	Barcelos	Brazil	BAZ	SWBC	America/Boa_Vista
5968	Herbert Glacier	Juneau	United States			America/Anchorage
5969	Seattle Cruise Terminal	Seattle	United States			America/Los_Angeles
5970	Juneau Cruise Pier	Juneau	United States			America/Anchorage
5971	Skagway Cruise Pier	Skagway	United States			America/Anchorage
5972	Ketchikan Cruise Pier	Ketchikan 	United States			America/Anchorage
5973	Victoria Cruise Pier	Victoria	Canada			America/Vancouver
5974	Diamantino Airport	Diamantino	Brazil	DMT	SWDM	America/Campo_Grande
5975	Guanambi Airport	Guanambi	Brazil	GNM	SNGI	America/Fortaleza
5976	Tsletsi Airport	Djelfa	Algeria	QDJ	DAFI	Africa/Algiers
5977	Nzagi Airport	Nzagi	Angola	NZA	FNZG	Africa/Luanda
5978	Catoca Airport	Catoca	Angola			Africa/Luanda
5979	Lucapa Airport	Lucapa	Angola	LBZ	FNLK	Africa/Luanda
5980	Capanda Airport	Kapanda	Angola	KNP	FNCP	Africa/Luanda
5981	Am Timan Airport	Am Timan	Chad	AMC	FTTN	Africa/Ndjamena
5982	Shark El Oweinat International Airport	Sharq Al-Owainat	Egypt	GSQ	HEOW	Africa/Cairo
5983	Eastern WV Regional Airport/Shepherd Field	Martinsburg	United States	MRB	KMRB	America/New_York
5984	Awassa Airport	Awasa	Ethiopia	AWA	HALA	Africa/Addis_Ababa
5985	Wilwal International Airport	Jijiga	Ethiopia	JIJ	HAJJ	Africa/Addis_Ababa
5986	Mekane Selam Airport	Mekane Selam	Ethiopia	MKS	HAMA	Africa/Addis_Ababa
5987	Debra Marcos Airport	Debre Marqos	Ethiopia	DBM	HADM	Africa/Addis_Ababa
5988	Debre Tabor Airport	Debre Tabor	Ethiopia	DBT	HADT	Africa/Addis_Ababa
5989	Harar Meda Airport	Debre Zeyit	Ethiopia	QHR	HAHM	Africa/Addis_Ababa
5990	Robe Airport	Goba	Ethiopia	GOB	HAGB	Africa/Addis_Ababa
5991	Mayumba Airport	Mayumba	Gabon	MYB	FOOY	Africa/Libreville
5992	Mara Serena Lodge Airstrip	Masai Mara	Kenya	MRE	HKMS	Africa/Nairobi
5993	Lewa Airport	Lewa	Kenya			Africa/Nairobi
5994	Mulika Lodge Airport	Meru National Park	Kenya	JJM	HKMK	Africa/Nairobi
5995	Rumbek Airport	Rumbek	Sudan	RBX	HSMK	Africa/Juba
5996	Yei Airport	Yei	Sudan		HSYE	Africa/Juba
5997	Cape Palmas Airport	Greenville	Liberia	CPA	GLCP	Africa/Monrovia
5998	Ambatomainty Airport	Ambatomainty	Madagascar	AMY		Indian/Antananarivo
5999	Kyoto	Kyoto	Japan	UKY		Asia/Tokyo
6000	Ecuvillens Airport	Ecuvillens	Switzerland		LSGE	Europe/Zurich
6001	Andermatt	Andermatt	Switzerland			Europe/Zurich
6002	Wohlen Airfield	Wohlen bei Bern	Switzerland			Europe/Zurich
6003	Bazaruto Island Airport	Bazaruto Island	Mozambique	BZB		Africa/Maputo
6004	Benguera Island Airport	Benguera Island	Mozambique	BCW		Africa/Maputo
6005	Inhaca Airport	Inhaca	Mozambique	IHC	FQIA	Africa/Maputo
6006	Indigo Bay Lodge Airport	Indigo Bay Lodge	Mozambique	IBL		Africa/Maputo
6007	Gombe Lawanti International Airport	Gombe	Nigeria			Africa/Lagos
6008	Akwa Ibom International Airport	Uyo	Nigeria			Africa/Lagos
6009	Katsina Airport	Katsina	Nigeria			Africa/Lagos
6010	Ouro Sogui Airport	Matam	Senegal	MAX	GOSM	Africa/Dakar
6011	Bird Island Airport	Bird Island	Seychelles	BDI	FSSB	
6012	K50 Airport	Mogadishu	Somalia			Africa/Mogadishu
6013	El Daein	El Daein	Sudan			Africa/Khartoum
6014	Wadi Halfa Airport	Wadi Halfa	Sudan	WHF	HSSW	Africa/Khartoum
6015	Enfidha - Hammamet International Airport	Enfidha	Tunisia	NBE	DTNH	Africa/Tunis
6016	Kidepo Airport	Kidepo	Uganda		HUKD	Africa/Kampala
6017	Kitgum Airport	Kitgum	Uganda		HUKT	Africa/Kampala
6018	Bugungu Airport	Pakuba	Uganda		HUPA	Africa/Kampala
6019	Svea Airport	Sveagruva	Svalbard		ENSA	Arctic/Longyearbyen
6020	Ny-Ålesund Airport (Hamnerabben)	Ny-Alesund	Svalbard		ENAS	Arctic/Longyearbyen
6021	Hatay Airport	Hatay	Turkey	HTY	LTDA	Europe/Istanbul
6022	Kihnu Airfield	Kihnu	Estonia		EEKU	Europe/Tallinn
6023	Ruhnu Airfield	Ruhnu	Estonia		EERU	Europe/Tallinn
6024	Raivavae Airport	Raivavae	French Polynesia	RVV	NTAV	Pacific/Tahiti
6025	Foshan Shadi Airport	Foshan	China	FUO	ZGFS	Asia/Shanghai
6026	Huizhou Airport	Huizhou	China	HUZ	ZGHZ	Asia/Shanghai
6027	Lleida-Alguaire Airport	Lleida	Spain	ILD	LEDA	Europe/Madrid
6028	Aeropuerto Capitan Fuentes Martinez	Porvenir	Chile			America/Santiago
6029	Ouessant Airport	Ouessant	France		LFEC	Europe/Paris
6030	Central Railway Station	Montreal	Canada	YMY		America/Toronto
6031	Union Station	Toronto	Canada	YBZ		America/Toronto
6032	Bildudalur Airport	Bildudalur	Iceland	BIU	BIBD	Atlantic/Reykjavik
6033	Gjögur Airport	Gjogur	Iceland	GJR	BIGJ	Atlantic/Reykjavik
6034	Sauðárkrókur Airport	Saudarkrokur	Iceland	SAK	BIKR	Atlantic/Reykjavik
6035	Selfoss Airport	Selfoss	Iceland		BISF	Atlantic/Reykjavik
6036	Inishmaan Aerodrome	Inishmaan	Ireland	IIA	EIMN	Europe/Dublin
6037	Ak Bashat Airport	Taldykorgan	Kazakhstan		UAAT	Asia/Bishkek
6038	Ulgii Mongolei Airport	Olgii	Mongolia	ULG	ZMUL	Asia/Hovd
6039	Lille	Lille	France	XDB		Europe/Paris
6040	Qurghonteppa International Airport	Kurgan Tyube	Tajikistan	KQT	UTDT	Asia/Dushanbe
6041	Vologda Airport	Vologda	Russia	VGD	ULWW	Europe/Moscow
6042	Severo-Evensk Airport	Evensk	Russia		UHMW	Asia/Srednekolymsk
6043	Olenyok Airport	Olenyok	Russia	ONK	UERO	Asia/Yakutsk
6044	Saskylakh Airport	Saskylakh	Russia	SYS	UERS	Asia/Yakutsk
6045	Lensk Airport	Lensk	Russia			Asia/Yakutsk
6046	Burevestnik Airport	Iturup Island	Russia	BVV		Asia/Srednekolymsk
6047	Okha Airport	Okha	Russia	OHH		Asia/Srednekolymsk
6048	Leshukonskoye Airport	Arkhangelsk	Russia	LDG	ULAL	Europe/Moscow
6049	Nizhneangarsk Airport	Nizhneangarsk	Russia		UIUN	Asia/Irkutsk
6050	Taksimo Airport	Taksimo	Russia			Asia/Irkutsk
6051	Vanavara Airport	Vanavara	Russia		UNIW	Asia/Krasnoyarsk
6052	Aykhal Airport	Aykhal	Russia		UERA	Asia/Yakutsk
6053	Uktus Airport	Yekaterinburg	Russia		USSK	Asia/Yekaterinburg
6054	Baykit Airport	Baykit	Russia		UNIB	Asia/Krasnoyarsk
6055	Biysk Airport	Biysk	Russia		UNBI	Asia/Krasnoyarsk
6056	Huesca/Pirineos Airport	Huesca	Spain	HSK	LEHC	Europe/Madrid
6057	Ciudad Real Central Airport	Ciudad Real	Spain	CQM	LERL	Europe/Madrid
6058	Al Najaf International Airport	Najaf	Iraq	NJF	ORNI	Asia/Baghdad
6059	Hilversum Railway Station	Hilversum	Netherlands	QYI		Europe/Amsterdam
6060	Colonsay Airstrip	Colonsay	United Kingdom	CSA	EGEY	Europe/London
6061	Coll Airport	Coll	United Kingdom	COL		Europe/London
6062	Rock Hill - York County Airport	Rock Hill	United States	RKH	KUZA	America/New_York
6063	Allegheny County Airport	Pittsburgh	United States	AGC	KAGC	America/New_York
6064	Cecil Airport	Jacksonville	United States	VQQ	KVQQ	America/New_York
6065	Fulton County Airport Brown Field	Atlanta	United States	FTY	KFTY	America/New_York
6066	Tresco Heliport	Tresco	United Kingdom		EGHT	Europe/London
6067	Tarin Kowt Airport	Tarin Kowt	Afghanistan	TII	OATN	Asia/Kabul
6068	Zaranj Airport	Zaranj	Afghanistan	ZAJ	OAZJ	Asia/Kabul
6069	Chakcharan Airport	Chaghcharan	Afghanistan	CCN	OACC	Asia/Kabul
6070	Four Corners	Four Corners	United States			America/Denver
6071	Fuyang Xiguan Airport	Fuyang	China	FUG	ZSFY	Asia/Shanghai
6072	Longyan Guanzhishan Airport	Longyan	China	LCX	ZSLD	Asia/Shanghai
6073	Baoshan Yunduan Airport	Baoshan	China	BSD	ZPBS	Asia/Shanghai
6074	Xingyi Airport	Xingyi	China	ACX	ZUYI	Asia/Shanghai
6075	Macau Ferry Pier	Macau	Macau	XZM		Asia/Macau
6076	Liping Airport	Liping	China	HZH	ZUNP	Asia/Shanghai
6077	Odell Williamson Municipal	Ocean Isle Beach	United States	60J		America/New_York
6078	Stepanakert Air Base	Stepanakert	Azerbaijan		UB13	Asia/Baku
6079	The Ohio State University Airport - Don Scott Field	Columbus	United States	OSU	KOSU	America/New_York
6080	Addison Airport	Addison	United States	ADS	KADS	America/Chicago
6081	Destin Executive Airport	Destin	United States	DSI	KDTS	America/Chicago
6082	Fort Jefferson	Fort Jefferson - Dry Tortugas	United States	RBN		America/New_York
6083	Kherson International Airport	Kherson	Ukraine	KHE	UKOH	Europe/Kiev
6084	Ryan's Creek Aerodrome	Stewart Island	New Zealand	SZS	NZRC	Pacific/Auckland
6085	Assumption Island Airport	Assumption Island	Seychelles		FSAS	Indian/Mahe
6086	Zhijiang Airport	Zhijiang	China	HJJ	ZGCJ	Asia/Shanghai
6087	Aldabra	Assumption Island	Seychelles			Indian/Mahe
6088	Yarmouth Airport	Yarmouth	Canada	YQI	CYQI	America/Halifax
6089	Kinston Regional Jetport At Stallings Field	Kinston	United States	ISO	KISO	America/New_York
6090	First Flight Airport	Kill Devil Hills	United States	FFA	KFFA	America/New_York
6091	Pebble Island Airstrip	Pebble Island Settlement	Falkland Islands			Atlantic/Stanley
6092	Sea Lion Island Landing Strip	Sea Lion Island	Falkland Islands			Atlantic/Stanley
6093	Lively Settlement Airstrip	Lively Island	Falkland Islands			Atlantic/Stanley
6094	Lintsang Airfield	Lincang	China	LNJ	ZPLC	Asia/Shanghai
6095	Wenshan Airport	Wenshan	China	WNH		Asia/Shanghai
6096	Ponta Pelada Airport	Manaus	Brazil			America/Boa_Vista
6097	Sao Gabriel da Cachoeira Airport	Sao Gabriel da Cachoeira	Brazil			America/Boa_Vista
6098	Maturacá Airport	Maturaca	Brazil		SWMK	America/Boa_Vista
6099	Carajás Airport	Parauapebas	Brazil	CKS	SBCJ	America/Belem
6100	Centro de Lançamento de Alcântara Airport	Alcantara	Brazil		SNCW	America/Fortaleza
6101	Cachimbo	Itaituba	Brazil			America/Belem
6102	Latur Airport	Latur	India	LTU		Asia/Calcutta
6103	Tarempa Airport	Anambas Islands	Indonesia	MWK	WIOM	Asia/Jakarta
6104	Mainz Finthen	Mainz	Germany	QFZ		
6105	Würzburg-Schenkenturm Airport	Wuerzburg	Germany		EDFW	Europe/Berlin
6106	Mainz	Mainz	Germany	QMZ		Europe/Berlin
6107	Berlin Gatow	Berlin	Germany	GWW		Europe/Berlin
6108	Rheine Bentlage	Rheine	Germany	ZPQ		Europe/Berlin
6109	São Jacinto Airport	Aveiro	Portugal		LPAV	Europe/Lisbon
6110	Tana Toraja Airport	Toraja	Indonesia			Asia/Makassar
6111	Hopsten Air Base	Hopsten	Germany		ETNP	Europe/Berlin
6112	Jose Aponte De La Torre Airport	Ceiba	Puerto Rico		TJNR	America/Puerto_Rico
6113	Persian Gulf International Airport	Khalije Fars	Iran	PGU	OIBP	Asia/Tehran
6114	Yasouj Airport	Yasuj	Iran	YES	OISY	Asia/Tehran
6115	Mosul International Airport	Mosul	Iraq	OSM	ORBM	Asia/Baghdad
6116	Tajima Airport	Toyooka	Japan	TJH	RJBT	Asia/Tokyo
6117	Amakusa Airport	Amakusa	Japan	AXJ	RJDA	Asia/Tokyo
6118	Kikai Airport	Kikai	Japan	KKX	RJKI	Asia/Tokyo
6119	Aguni Airport	Aguni	Japan	AGJ	RORA	Asia/Tokyo
6120	Chongjin Airport	Chongjin	North Korea			Asia/Pyongyang
6121	Haeju Airport	Haeju	North Korea	HAE		Asia/Pyongyang
6122	Layang Layang Airport	Layang Layang Atoll	Malaysia	LAC		
6123	Donoi Airport	Uliastai	Mongolia	ULZ	ZMDN	Asia/Ulaanbaatar
6124	Bulgan Airport	Bulgan	Mongolia	UGA	ZMBN	Asia/Ulaanbaatar
6125	Ulaangom Airport	Ulaangom	Mongolia	ULO	ZMUG	Asia/Hovd
6126	Borongan Airport	Borongan	Philippines		RPVW	Asia/Manila
6127	Lubang Airport	Lubang	Philippines	LBX	RPLU	Asia/Manila
6128	Bentota Airport	Bentota	Sri Lanka	BJT		Asia/Colombo
6129	Dickwella Airport	Dickwella	Sri Lanka	DIW		Asia/Colombo
6130	Kulob Airport	Kulyab	Tajikistan	TJU	UTDK	Asia/Dushanbe
6131	Chi Mei Airport	Cimei	Taiwan	CMJ	RCCM	Asia/Taipei
6132	Daşoguz Airport	Dasoguz	Turkmenistan	TAZ	UTAT	Asia/Ashgabat
6133	Barrow Island Airport	Barrow Island	Australia	BWB	YBWX	Australia/Perth
6134	Morawa Airport	Morawa	Australia	MWB		Australia/Perth
6135	Exmouth Airport	Exmouth	Australia	EXM		Australia/Perth
6136	Derby Airport	Derby	Australia	DRB	YDBY	Australia/Perth
6137	Walgett Airport	Walgett	Australia	WGE	YWLG	Australia/Sydney
6138	Bathurst Island Airport	Bathurst Island	Australia	BRT	YBTI	Australia/Darwin
6139	Dunk Island Airport	Dunk Island	Australia	DKI	YDKI	Australia/Brisbane
6140	Lizard Island Airport	Lizard Island	Australia	LZR	YLZI	Australia/Brisbane
6141	Hamilton Airport	Hamilton	Australia	HLT	YHML	Australia/Hobart
6142	Halls Creek Airport	Halls Creek	Australia	HCQ	YHLC	Australia/Perth
6143	Fitzroy Crossing Airport	Fitzroy Crossing	Australia	FIZ	YFTZ	Australia/Perth
6144	Ravensthorpe Airport	Ravensthorpe	Australia	RVT	YNRV	Australia/Perth
6145	Wilkins Runway	Budd Coast	Antarctica		YWKS	Antarctica/South_Pole
6146	Provo Municipal Airport	Provo	United States	PVU	KPVU	America/Denver
6147	Steamboat Springs Bob Adams Field	Steamboat Springs	United States	SBS	KSBS	America/Denver
6148	Delta Municipal Airport	Delta	United States	DTA	KDTA	America/Denver
6149	Richfield Municipal Airport	Richfield	United States		KRIF	America/Denver
6150	Carbon County Regional/Buck Davis Field	Price	United States	PUC	KPUC	America/Denver
6151	Los Alamos Airport	Los Alamos	United States	LAM	KLAM	America/Denver
6152	Borrego Valley Airport	Borrego Springs	United States	BXS	KBXS	America/Los_Angeles
6153	Lake Havasu City Airport	Lake Havasu City	United States	HII	KHII	America/Phoenix
6154	Winslow Lindbergh Regional Airport	Winslow	United States	INW	KINW	America/Phoenix
6155	Douglas Municipal Airport	Douglas	United States	DGL	KDGL	America/Phoenix
6156	Marakei Airport	Marakei	Kiribati	MZK	NGMK	Pacific/Tarawa
6157	Abemama Atoll Airport	Abemama	Kiribati	AEA	NGTB	Pacific/Tarawa
6158	Buariki Airport	Buariki	Kiribati	AAK	NGUK	
6159	Kuria Airport	Kuria	Kiribati	KUC	NGKT	Pacific/Tarawa
6160	Arorae Island Airport	Arorae	Kiribati	AIS	NGTR	Pacific/Tarawa
6161	Tamana Island Airport	Tamana	Kiribati	TMN	NGTM	Pacific/Tarawa
6162	Beru Airport	Beru Island	Kiribati	BEZ	NGBR	Pacific/Tarawa
6163	Nikunau Airport	Nikunau	Kiribati	NIG	NGNU	Pacific/Tarawa
6164	Butaritari Atoll Airport	Butaritari	Kiribati	BBG	NGTU	Pacific/Tarawa
6165	Makin Island Airport	Makin	Kiribati	MTK	NGMN	Pacific/Tarawa
6166	Maiana Airport	Maiana	Kiribati	MNK	NGMA	Pacific/Tarawa
6167	Nonouti Airport	Nonouti	Kiribati	NON	NGTO	Pacific/Tarawa
6168	Tabiteuea South Airport	Tabiteuea	Kiribati	TSU	NGTS	Pacific/Tarawa
6169	Bosset Airport	Bosset	Papua New Guinea	BOT		Pacific/Port_Moresby
6170	Ine Airport	Ine	Marshall Islands	IMI		Pacific/Majuro
6171	Tinak Airport	Tinak	Marshall Islands	TIC		Pacific/Majuro
6172	Ebon Airport	Ebon	Marshall Islands			Pacific/Majuro
6173	Elenak Airport	Elenak	Marshall Islands	EAL		Pacific/Majuro
6174	Lae Airport	Lae	Marshall Islands	LML		Pacific/Majuro
6175	Airok Airport	Airok	Marshall Islands	AIC		Pacific/Majuro
6176	Enejit Airport	Enejit	Marshall Islands	EJT		Pacific/Majuro
6177	Whitianga Airport	Whitianga	New Zealand	WTZ	NZWT	Pacific/Auckland
6178	Takaka Airport	Takaka	New Zealand	KTF	NZTK	Pacific/Auckland
6179	Peleliu Airfield	Peleliu	Palau	C23		Pacific/Palau
6180	Angaur Airstrip	Angaur	Palau			Pacific/Palau
6181	Asau Airport	Savai\\\\'i	Samoa	AAU		Pacific/Apia
6182	Afutara Aerodrome	Afutara	Solomon Islands	AFT	AGAF	Pacific/Guadalcanal
6183	Ulawa Airport	Ulawa	Solomon Islands	RNA	AGAR	Pacific/Guadalcanal
6184	Choiseul Bay Airport	Choiseul Bay	Solomon Islands	CHY	AGGC	Pacific/Guadalcanal
6185	Santa Ana Airport	Santa Ana	Solomon Islands	NNB	AGGT	Pacific/Guadalcanal
6186	Yandina Airport	Yandina	Solomon Islands	XYA	AGGY	Pacific/Guadalcanal
6187	Batuna Aerodrome	Batuna	Solomon Islands	BPF	AGBT	Pacific/Guadalcanal
6188	Bartow Municipal Airport	Bartow	United States	BOW	KBOW	America/New_York
6189	Dyagilevo Air Base	Kostroma	Russia		UUBD	Europe/Moscow
6190	Yuryevets	Yuryevets	Russia			Europe/Moscow
6191	Ozerny	Ozerny	Russia			Asia/Irkutsk
6192	Enkheluk	Enkheluk	Russia			Asia/Irkutsk
6193	Khakusy	Khakusy	Russia			Asia/Irkutsk
6194	Fitiuta Airport	Fiti\\\\'uta	American Samoa	FTI	NSFQ	Pacific/Pago_Pago
6195	Ofu Airport	Ofu	American Samoa	OFU		Pacific/Pago_Pago
6196	Livermore Municipal Airport	Livermore	United States	LVK	KLVK	America/Los_Angeles
6197	Mariposa Yosemite Airport	Mariposa	United States	RMY	KMPI	America/Los_Angeles
6198	Grootfontein Airport	Grootfontein	Namibia	GFY	FYGF	Africa/Windhoek
6199	Rundu Airport	Rundu	Namibia	NDU	FYRU	Africa/Windhoek
6200	Beppu Airport	Beppu	Japan	BPU		Asia/Tokyo
6201	Heron Island	Heron Island	Australia	HRN		Australia/Brisbane
6202	Lady Elliot Island	Lady Elliot Island	Australia	LYT		Australia/Brisbane
6203	Orpheus Island	Orpheus Island	Australia	ORS		Australia/Brisbane
6204	Paddington Station	London	United Kingdom	QQP		Europe/London
6205	Liskeard Station	Liskeard	United States			Europe/London
6206	Port du Bloscon	Roscoff	France			Europe/Paris
6207	Tasiilaq Heliport	Angmagssalik	Greenland		BGAM	America/Godthab
6208	Neets Bay	Ketchikan	United States			America/Anchorage
6209	Fraser Railroad Station	Fraser BC	Canada			America/Vancouver
6210	Carcross	Carcross YT	Canada			America/Vancouver
6211	Jacqueline Cochran Regional Airport	Palm Springs	United States	TRM	KTRM	America/Los_Angeles
6212	Santa Monica Municipal Airport	Santa Monica	United States	SMO	KSMO	America/Los_Angeles
6213	Bermuda Dunes Airport	Palm Springs	United States	UDD	KUDD	America/Los_Angeles
6214	Scottsdale Airport	Scottsdale	United States	SCF	KSDL	America/Phoenix
6215	Olympia Regional Airport	Olympia	United States	OLM	KOLM	America/Los_Angeles
6216	Yolo County Davis Woodland Winters Airport	Davis-Woodland-Winters	United States		KDWA	America/Los_Angeles
6217	Garfield County Regional Airport	Rifle	United States	RIL	KRIL	America/Denver
6218	Shively Field	SARATOGA	United States	SAA	KSAA	America/Denver
6219	DeKalb Peachtree Airport	Atlanta	United States	PDK	KPDK	America/New_York
6220	Monroe County Airport	Bloomington	United States	BMG	KBMG	America/New_York
6221	Witham Field	Stuart	United States	SUA	KSUA	America/New_York
6222	Morristown Municipal Airport	Morristown	United States	MMU	KMMU	America/New_York
6223	Napa County Airport	Napa	United States	APC	KAPC	America/Los_Angeles
6224	Brown Field Municipal Airport	San Diego	United States	SDM	KSDM	America/Los_Angeles
6225	Wangen-Lachen Airport	Wangen-Lachen	Switzerland		LSPV	Europe/Zurich
6226	Pahokee Airport	Pahokee	United States			America/New_York
6227	Venice Municipal Airport	Venice	United States	VNC	KVNC	America/New_York
6228	Palm Beach County Glades Airport	Pahokee	United States	PHK	KPHK	America/New_York
6229	Kineshma	Kineshma	Russia			Europe/Moscow
6230	Nezhitino	Nezhitino	Russia	NEZ		Europe/Moscow
6231	Glasgow Buchanan Bus Station	Glasgow	United Kingdom			Europe/London
6232	London Victoria Bus Station	London	United Kingdom			Europe/London
6233	Machu Pichu Airport	Machu Pichu	Peru	MFT		America/Lima
6234	Northwest Florida Beaches International Airport	Panama City	United States	ECP	KECP	America/Chicago
6235	San Bernardino International Airport	San Bernardino	United States	SBD	KSBD	America/Los_Angeles
6236	Valença Airport	Valenca	Brazil	VAL	SNVB	America/Fortaleza
6237	Dix Sept Rosado Airport	Mossoro	Brazil		SBMW	America/Fortaleza
6238	Caruaru Airport	Caruaru	Brazil	CAU	SNRU	America/Fortaleza
6239	Wake Island Airfield	Wake island	Wake Island	AWK	PWAK	Pacific/Johnston
6240	Aeroclube Airport	Nova Iguacu	Brazil	QNV	SDNY	America/Sao_Paulo
6241	Gare du Nord	Paris	France	XPG		Europe/Paris
6242	Gare Montparnasse	Paris	France	XGB		Europe/Paris
6243	Saint-Pierre-des-Corps	Tours	France	XSH		Europe/Paris
6244	Darsena Norte	Buenos Aires	Argentina			America/Buenos_Aires
6245	Casa Central	Montevideo	Uruguay			America/Montevideo
6246	Puerto Franco	Colonia del Sacramento	Uruguay			America/Montevideo
6247	Tres Cruces	Montevideo	Uruguay			America/Montevideo
6248	San Carlos Airport	San Carlos	United States	SQL	KSQL	America/Los_Angeles
6249	Courtelary Airport	Courtelary 	Switzerland		LSZJ	Europe/Zurich
6250	Lotnisko Korne	Koszalin	Poland		EPKO	Europe/Warsaw
6251	Camp Okavango Airport	Okavango Delta	Botswana		FBCO	Africa/Gaborone
6252	Dujiangyan	Dujiangyan	China			Asia/Shanghai
6253	Maiwa	Maiwa	China			Asia/Shanghai
6254	Lelystad Airport	Lelystad	Netherlands			Europe/Amsterdam
6255	Rocky Mount Wilson Regional Airport	Rocky Mount	United States	RWI	KRWI	America/New_York
6256	Whittier Airport	Whittier	United States		PAWR	America/Anchorage
6257	Soldotna Airport	Soldotna	United States	SXQ	PASX	America/Anchorage
6258	Gillespie Field	El Cajon	United States	SEE	KSEE	America/Los_Angeles
6259	San Clemente Island Naval Auxiliary Landing Field	San Clemente Island	United States		KNUC	America/Los_Angeles
6260	Cotopaxi International Airport	Latacunga	Ecuador			America/Guayaquil
6261	London St Pancras	London	United Kingdom			Europe/London
6262	Amsterdam Centraal	Amsterdam	Netherlands	ZYA		Europe/Amsterdam
6263	Mammy Yoko Heliport	Freetown	Sierra Leone	JMY		Africa/Freetown
6264	Shearwater Heliport	Victoria Falls	Zimbabwe			Africa/Harare
6265	Phan Rang Airport	Phan Rang	Vietnam	PHA	VVPR	Asia/Saigon
6266	Na-San Airport	Son-La	Vietnam	SQH	VVNS	Asia/Saigon
6267	Truckee Tahoe Airport	Truckee	United States	TKF	KTRK	America/Los_Angeles
6268	Fréjus Airport	Frejus	France	FRJ	LFTU	Europe/Paris
6269	Geelong Airport	Geelong	Australia	GEX	YGLG	Australia/Hobart
6270	Detroit Amtrak Station	Detroit	United States			America/New_York
6271	Ventura Amtrak	Ventura	United States			America/Los_Angeles
6272	Berlin Hauptbahnhof	Berlin	Germany	QPP		Europe/Berlin
6273	Mezen Airport	Mezen	Russia		ULAE	Europe/Moscow
6274	Vaskovo Airport	Arkhangelsk	Russia		ULAH	Europe/Moscow
6275	Cobb County-Mc Collum Field	Atlanta	United States		KRYY	America/New_York
6276	Oneonta Municipal Airport	Oneonta	United States	ONH		America/New_York
6277	Brumowski  Air Base	Tulln	Austria		LOXT	Europe/Vienna
6278	Wideawake Field	Georgetown Acension Island Santa Helena	United Kingdom			Atlantic/St_Helena
6279	Dell Flight Strip	Dell	United States		K4U9	America/Denver
6280	Mission Field	Livingston-Montana	United States	LVM	KLVM	America/Denver
6281	Kota Kinabalu Airport	Kota Kinabalu	Malaysia	ZWR		Africa/Lagos
6282	Valetta Waterfront	Valetta	Malta			Europe/Malta
6283	Big Timber Airport	Big Timber	United States		K6S0	America/Denver
6284	Tulip City Airport	Holland	United States		KBIV	America/New_York
6285	London Heliport	London	United Kingdom		EGLW	Europe/London
6286	Venice-Lido Airport	Venice	Italy		LIPV	Europe/Rome
6287	Tallinn Linnahall Heliport	Tallinn	Estonia		EECL	Europe/Tallinn
6288	Hernesaari Heliport	Helsinki	Finland		EFHE	Europe/Helsinki
6289	Linkenheim Airport	Linkenheim	Germany		EDRI	Europe/Berlin
6290	Monument Valley Airport	Monument Valley	United States	GMV	UT25	America/Denver
6291	Hilversum Airfield	Hilversum	Netherlands		EHHV	Europe/Amsterdam
6292	West 30th St. Heliport	New York	United States	JRA	KJRA	America/New_York
6293	Texel Airfield	Texel	Netherlands		EHTX	Europe/Amsterdam
6294	La Cerdanya Airport	Das i Fontanals de Cerdanya	Spain		LECD	Europe/Madrid
6295	Lakeland Linder International Airport	Lakeland	United States	LAL	KLAL	America/New_York
6296	Valetta Grand Harbour	Valetta	Malta			Africa/Khartoum
6297	Mgarr Seaplane Base	Mgarr	Malta			Europe/Malta
6298	Bangkok	Bangkok	Thailand			Asia/Bangkok
6299	Soneva Fushi	Baa Atoll	Maldives			Indian/Maldives
6300	Jebel Ali Seaplane Base	Jebel Ali Golf Resort	United Arab Emirates			Asia/Dubai
6301	Stary Oskol Airport	Stary Oskol	Russia		UUOS	Europe/Moscow
6302	Savona Cruise Terminal	Savona	Italy			Europe/Rome
6303	Barcelona Cruise Terminal	Barcelona	Spain			Europe/Madrid
6304	Casablanca Harbor	Casablanca	Morocco			Africa/Casablanca
6305	Lanzarote Arrecife Cruise Terminal	Arrecife Lanzarote	Spain			Atlantic/Canary
6306	Tenerife Cruise Terminal	Santa Cruz de Tenerife	Spain			Atlantic/Canary
6307	Funchal Cruise Terminal	Funchal Madeira	Portugal			Europe/Lisbon
6308	Malaga Cruise Terminal	Malaga	Spain			Europe/Madrid
6309	Ponta Delgada Cruise Terminal	Ponta Delgada Acores	Portugal			Atlantic/Azores
6310	Vigo Cruise Terminal	Vigo	Spain			Europe/Madrid
6311	Fort Lauderdale Cruise Terminal	Fort Lauderdale	United States			America/New_York
6312	Southampton Cruise Terminal	Southampton	United Kingdom			Europe/London
6313	Miami Cruise Terminal	Miami	United States			America/New_York
6314	Nassau Cruise Terminal	Nassau	Bahamas			America/Nassau
6315	Lisbon Cruise Terminal	Lisbon	Portugal			Europe/Lisbon
6316	Cadiz Cruise Terminal	Cadiz	Spain			Europe/Madrid
6317	Marseille Cruise Terminal	Marseille	France			Europe/Paris
6318	Los Angeles San Pedro Cruise Terminal	Los Angeles	United States			America/Los_Angeles
6319	Kailua Kona Harbor	Kailua Kona Hawaii	United States			Pacific/Honolulu
6320	Kauai Cruise Terminal Nawiliwili	Nawiliwili Kauai Hawaii	United States			Pacific/Honolulu
6321	Hilo Cruise Terminal Hawaii	Hilo Hawaii	United States			Pacific/Honolulu
6322	Honolulu Cruise Terminal Oahu	Honolulu Oahu	United States			Pacific/Honolulu
6323	Lahaina Harbor Maui Hawaii	Lahaina Maui Hawaii	United States			Pacific/Honolulu
6324	Ensenada Cruise Terminal	Ensenada	Mexico			America/Tijuana
6325	Nanaimo Train Station	Nanaimo Station British Columbia	Canada			America/Vancouver
6326	Victoria Rail Station British Columbia	Victoria Station British Columbia	Canada			America/Vancouver
6327	Vancouver Cruise Terminal	Vancouver BC	Canada			America/Vancouver
6328	Seattle Cruise Terminal	Seattle WA	United States			America/Los_Angeles
6329	Syangboche Airport	Syangboche	Nepal	SYH	VNSB	Asia/Katmandu
6330	Indianola Municipal Airport	New York	United States		KIDL	America/Chicago
6331	Cheremshanka Airport	Krasnoyarsk	Russia		UNKM	Asia/Krasnoyarsk
6332	French Valley Airport	Murrieta-Temecula	United States	RBK	KF70	America/Los_Angeles
6333	Anchorage Main Station	Anchorage Alaska	United States			America/Anchorage
6334	Seward Train Station	Seward Alaska	United States			America/Anchorage
6335	Oristano-Fenosu Airport	Oristano	Italy	FNU	LIER	Europe/Rome
6336	White Waltham Airfield	Maidenhead	United Kingdom		EGLM	Europe/London
6337	Mysore Airport	Mysore	India	MYQ	VOMY	Asia/Calcutta
6338	Carl R Keller Field	Port Clinton	United States		KPCW	America/New_York
6339	Dayton-Wright Brothers Airport	Dayton	United States	MGY	KMGY	America/New_York
6340	Richmond Municipal Airport	Richmond	United States		KRID	America/New_York
6341	Findlay Airport	Findley	United States	FDY	KFDY	America/New_York
6342	Niagara Falls Station	Niagara Falls	Canada		NIAG	America/New_York
6343	Burlington Executive	Burlington	Canada		CZBA	America/Toronto
6344	Baganara Island	Baganara	Guyana			America/Guyana
6345	Penneshaw Airport	Penneshaw	Australia	PEA	YPSH	Australia/Adelaide
6346	Matamanoa Helipad	Matamanoa	Fiji			Pacific/Fiji
6347	Kaufbeuren BF	Kaufbeuren	Germany	KFX	KAUF	Europe/Berlin
6348	Munich HBF	Munich	Germany	MUQ	MUNI	Europe/Berlin
6349	Nurnberg HBF	Nurnberg	Germany	NUR	NURN	Europe/Berlin
6350	Engels heliport	Ebenhofen	Germany		EBEN	Europe/Brussels
6351	Augsburg HBF	Augsburg	Germany	AUB	AUGS	Europe/Berlin
6352	Biessenhofen BF	Biessenhofen	Germany	BIE	BIES	Europe/Berlin
6353	Buchloe BF	Buchloe	Germany	BUH	BUCH	Europe/Berlin
6354	Fussen BF	Fussen	Germany	FUX	FUSN	Europe/Berlin
6355	Emporia Municipal Airport	Kempten	Germany	EMP	KEMP	America/Chicago
6356	Aiome	Aiome	Papua New Guinea	AIE		Pacific/Port_Moresby
6357	Simbai	Simbai	Papua New Guinea	SIM		Pacific/Port_Moresby
6358	Ambunti	Ambunti	Papua New Guinea	AUJ		Pacific/Port_Moresby
6359	Gunns Camp	Okavango	Botswana			Africa/Gaborone
6360	Sossusvlei	Sossusvlei	Namibia			Africa/Windhoek
6361	Marktoberdorf BF	Marktoberdorf	Germany		MARK	Europe/Berlin
6362	Marktoberdorf Schule	Marktoberdorf	Germany	MOS	MARO	Europe/Berlin
6363	Skå-Edeby Airport	Essen	Germany		ESSE	Europe/Stockholm
6364	Bochum HBF	Bochum	Germany			Europe/Berlin
6365	Koln HBF	Koln	Germany		KOLN	Europe/Berlin
6366	Mannheim HBF	Mannheim	Germany			Europe/Berlin
6367	Wycombe Air Park	Wycombe	United Kingdom	HYC	EGTB	Europe/London
6368	Bembridge Airport	Bembridge	United Kingdom	BBP	EGHJ	Europe/London
6369	Waterville / Kings County Municipal Airport	Waterville	Canada		CCW3	America/Halifax
6370	Chojna Air Base	Chojna	Poland			Europe/Warsaw
6371	Leuterschach BF	Leuterschach	Germany	LES	LEUT	Europe/Berlin
6372	Black Hills Airport-Clyde Ice Field	Spearfish-South Dakota	United States	SPF	KSPF	America/Denver
6373	Westkapelle heliport	Knokke	Belgium		EBKW	Europe/Brussels
6374	Redcliffe Airport	Rothwell	Australia		YRED	Australia/Brisbane
6375	Oksywie Military Air Base	Gdynia	Poland	QYD	EPOK	Europe/Warsaw
6376	Malbork Military Air Base	Malbork	Poland		EPMB	Europe/Warsaw
6377	Lask Military Air Base	Lask	Poland		EPLK	Europe/Warsaw
6378	Miroslawiec Military Air Base	Miroslawiec	Poland		EPMI	Europe/Warsaw
6379	Krzesiny Military Air Base	Poznan	Poland		EPKS	Europe/Warsaw
6380	Olive Branch Airport	Olive Branch	United States	OLV	KOLV	America/Chicago
6381	Viña del mar Airport	Vina del Mar	Chile	KNA	SCVM	America/Santiago
6382	Bangkok Intl closed	Bangkok	Thailand		BKKX	Asia/Bangkok
6383	Brampton Airport	Brampton	Canada		CNC3	America/Toronto
6384	Zonguldak Airport	Zonguldak	Turkey	ONQ	LTAS	Europe/Istanbul
6385	Rocky Mountain Metropolitan Airport	Broomfield-CO	United States	BJC	KBJC	America/Denver
6386	Minot Train Station	Minot	United States			America/Chicago
6387	Havre Train Station	Havre	United States			America/Denver
6388	Wishram Train Station	Wishram	United States			America/Los_Angeles
6389	Salem Municipal Airport/McNary Field	Salem	United States	SLE	KSLE	America/Los_Angeles
6390	Tunica Municipal Airport	Tunica	United States	UTM	KUTA	America/Chicago
6391	Batken Airport	Batken	Kyrgyzstan		UA30	Asia/Bishkek
6392	Sun Island	Sun Island	Maldives			Indian/Maldives
6393	Kasaba Bay Airport	Kasaba Bay	Zambia	ZKB	FLKY	Africa/Lusaka
6394	Hunt Field	Lindau	Germany	LND	KLND	America/Denver
6395	Guardiamarina Zanartu Airport	Puerto Williams	Chile			America/Santiago
6396	Volkel AB	Volkel	Netherlands	UDE		Europe/Amsterdam
6397	Hoogeveen Airfield	Hoogeveen	Netherlands		EHHO	Europe/Amsterdam
6398	Teuge Airport	Deventer	Netherlands		EHTE	Europe/Amsterdam
6399	Midden-Zeeland Airport	Middelburg	Netherlands		EHMZ	Europe/Amsterdam
6400	Ameland Airfield	Ameland	Netherlands		EHAL	Europe/Amsterdam
6401	Saint-Cyr-l'École Airport	Saint-Cyr	France		LFPZ	Europe/Paris
6402	Lawrence J Timmerman Airport	Milwaukee	United States	MWC	KMWC	America/Chicago
6403	Southern Wisconsin Regional Airport	Janesville	United States	JVL	KJVL	America/Chicago
6404	Mantsonyane Airport	Mantsonyane	Lesotho		FXMN	Africa/Maseru
6405	Hatfield	Hatfield	United Kingdom	HTF		Europe/London
6406	Burswood Park Helipad	Perth	Australia			Australia/Perth
6407	Toronto Coach Terminal	Toronto	Canada		TRTO	America/Toronto
6408	Montreal Central Bus Station	Montreal	Canada		MTRL	America/Toronto
6409	Arlington Municipal Airport	Arlington	United States		KGKY	America/Chicago
6410	Gwinnett County Briscoe Field	Lawrenceville	United States	LZU	KLZU	America/New_York
6411	Bowling Green Warren County Regional Airport	Bowling Green	United States	BWG	KBWG	America/Chicago
6412	Richard Lloyd Jones Jr Airport	Tulsa	United States	RVS	KRVS	America/Chicago
6413	Emeryville Amtrak Station	Emeryville	United States			America/Los_Angeles
6414	Bakersfield Amtrak Station	Bakersfield	United States			America/Los_Angeles
6415	Krymsk	Novorossiysk	Russia	NOI		
6416	Al Minhad Air Base	Minhad AB	United Arab Emirates	NHD	OMDM	Asia/Dubai
6417	Kirovograd Airport	Kirovograd	Ukraine	KGO	UKKG	Europe/Kiev
6418	Roitzschjora Airfield	Roitzschjora	Germany		EDAW	Europe/Berlin
6419	El Alamein International Airport	Dabaa City	Egypt	DBB	HEAL	Africa/Cairo
6420	Bryce Canyon Airport	Bryce Canyon	United States	BCE	KBCE	America/Denver
6421	Heidelberg	Heidelberg	Germany	HDB	EDIU	Europe/Berlin
6422	Burlington Alamance Regional Airport	Burlington	United States		KBUY	America/New_York
6423	Deputatsky	Deputatsky	Russia		UEVD	Asia/Vladivostok
6424	Chkalovskiy Air Base	Shchyolkovo	Russia	CKL	UUMU	Europe/Moscow
6425	Tengchong Tuofeng Airport	Tengchong	China	TCZ	ZUTC	Asia/Shanghai
6426	Belbek Airport	Sevastopol	Ukraine	UKS	UKFB	Europe/Simferopol
6427	Paradise Island Seaplane Base	Nassau	Bahamas	WZY		America/Nassau
6428	Selous Siwandu	Selous National Park	Tanzania			Africa/Dar_es_Salaam
6429	De Peel Air Base	Deurne	Netherlands		EHDP	Europe/Amsterdam
6430	Camp Bastion Airport	Camp Bastion	Afghanistan	OAZ	OAZI	Asia/Kabul
6431	New Century Aircenter Airport	Olathe	United States	JCI	KIXD	America/Chicago
6432	Easton Newnam Field	Easton	United States	ESN	KESN	America/New_York
6433	Stafsberg Airport	Hamar	Norway	HMR	ENHA	Europe/Oslo
6434	Ringebu Airfield Frya	Frya	Norway		ENRI	Europe/Oslo
6435	Starmoen	Elverum	Norway		ENSM	Europe/Oslo
6436	Ferry County Airport	Republic	United States	R49		America/Los_Angeles
6437	Yuba County Airport	Yuba City	United States	MYV	KMYV	America/Los_Angeles
6438	Basel SBB	Basel	Switzerland			Europe/Zurich
6439	Stockholm Cruise Port	Stockholm	Sweden	STO		Europe/Stockholm
6440	Helsingborg Cruise Port	Helsingborg	Sweden	JHE		Europe/Stockholm
6441	Phillip Island Airport	Phillip Island	Australia		YPID	Australia/Hobart
6442	Halliburton Field	Duncan	United States	DUC	KDUC	America/Chicago
6443	Port Authority Bus Terminal	New York	United States		NYPA	America/New_York
6444	Filitheyo	N.Nilandhoo Atoll	Maldives			Indian/Maldives
6445	Helsinki Cruise Port	Helsinki	Finland		HELC	Europe/Helsinki
6446	Chinle Municipal Airport	Chinle	United States	E91		America/Denver
6447	Garner Field	Uvalde	United States	UVA	KUVA	America/Chicago
6448	Lewis University Airport	Lockport	United States	LOT	KLOT	America/Chicago
6449	Frasca Field	Urbana	United States	C16		America/Chicago
6450	Buchanan Field	Concord	United States	CCR	KCCR	America/Los_Angeles
6451	Ocean Reef Club Airport	Ocean Reef Club Airport	United States	OCA	07FA	America/New_York
6452	Denver Union Station	Denver	United States			America/Denver
6453	DELETE	DELETE	United States			
6454	Strasbourg Neuhof Airfield	Strasbourg Neudorf	France		LFGC	Europe/Paris
6455	Nannhausen Airport	Nannhausen	Germany		EDRN	Europe/Berlin
6456	Yushu Batang Airport	Yushu	China	YUS	ZYLS	Asia/Shanghai
6457	Playon Chico	Playon Chico	Panama	PYC		America/Panama
6458	Ustupo	Ustupo	Panama	UTU		America/Panama
6459	Mamitupo	Mamitupo	Panama	MPU		America/Panama
6460	Lianshui Airport	Huai An	China	HIA	ZSSH	Asia/Shanghai
6461	Mureck	Mureck	Austria			Europe/Vienna
6462	Guessing	Guessing	Austria			Europe/Vienna
6463	El Porvenir	El Porvenir	Panama	PVE		America/Panama
6464	Toronto/Oshawa Executive Airport	Oshawa	Canada	YOO	CYOO	America/Toronto
6465	Marl-Loemühle Airfield	Recklinghausen	Germany		EDLM	Europe/Berlin
6466	Färila Air Base	Farila	Sweden		ESNF	Europe/Stockholm
6467	Lahr Airport	Lahr	Germany	LHA	EDTL	Europe/Berlin
6468	Monywar Airport	Monywa	Burma	NYW	VYMY	Asia/Rangoon
6469	Ohio University Snyder Field	Athens	United States	ATO	KUNI	America/New_York
6470	Springfield-Beckley Municipal Airport	Springfield	United States	SGH	KSGH	America/New_York
6471	Sun Island Resort and SPA	South Aari Atoll	Maldives			America/Sao_Paulo
6472	Fes Sefrou Airport	Fes	Morocco		GMFU	Africa/Casablanca
6473	Herrera Airport	Santo Domingo	Dominican Republic	HEX	MDHE	America/Santo_Domingo
6474	Cooinda Airport	Cooinda	Australia	CDA	YCOO	Australia/Darwin
6475	Jabiru Airport	Jabiru	Australia	JAB	YJAB	Australia/Darwin
6476	Pitt Island Airport	Pitt Island	New Zealand		PITT	Pacific/Chatham
6477	Plattling Bahnhof	Plattling	Germany			Europe/Berlin
6478	Osterhofen Bahnhof	Osterhofen Niederbayern	Germany			Europe/Berlin
6479	Passau Hbf	Passau	Germany			Europe/Berlin
6480	Regensburg-Oberhub Airport	Regensburg	Germany		EDNR	Europe/Berlin
6481	Regensburg HBF	Regensburg	Germany	RGB	REGE	Europe/Berlin
6482	Treuchtlingen BF	Treuchtlingen	Germany	TLG	TREU	Europe/Berlin
6483	Rivera Intl.	Rivera	Uruguay			
6484	Rio Sidra	Rio Sidra	Panama	RSI		America/Panama
6485	Miami Seaplane Base	Miami	United States	MPB		America/New_York
6486	Hastings Airport	Freetown	Sierra Leone	HGS	GFHA	Africa/Freetown
6487	Philip Billard Municipal Airport	Topeka	United States	TOP	KTOP	America/Chicago
6488	Grumeti Airstrip	Serengeti National Park	Tanzania			Africa/Dar_es_Salaam
6489	Emporia Municipal Airport	Emporia	United States			America/Chicago
6490	Benson Airstrip	Uvalde	United States		2XS8	America/Chicago
6491	Rough River State Park Airport	Null	United States		K2I3	America/Chicago
6492	Smyrna Airport	Smyrna	United States	MQY	KMQY	America/Chicago
6493	Franklin County Airport	Sewanee	United States	UOS	KUOS	America/Chicago
6494	Ngari Gunsa Airport	Shiquanhe	China	NGQ	ZUAL	Asia/Shanghai
6495	Cochstedt Airport	Cochstedt	Germany	CSO	EDBC	Europe/Berlin
6496	Wurzburg HBF	Wurzburg	Germany	WZB	WURZ	Europe/Berlin
6497	Collin County Regional At Mc Kinney Airport	DALLAS	United States		KTKI	America/Chicago
6498	Chicago Executive Airport	Chicago-Wheeling	United States	PWK	KPWK	America/Chicago
6499	Ol Kiombo Airstrip	Masai Mara National Park	Kenya			Africa/Nairobi
6500	Southwest Washington Regional Airport	Kelso	United States	KLS	KKLS	America/Los_Angeles
6501	Benešov Airport	Benesov	Czech Republic		LKBE	Europe/Prague
6502	Put-in-Bay Airport	Put-in-Bay	United States	3W2		America/New_York
6503	Bougouni Airport	Bougouni	Mali		GABG	Africa/Bamako
6504	Glenwood Springs Train Station	Glenwood Springs	United States			America/Denver
6505	Grand Junction Train Station	Grand Junction	United States			America/Denver
6506	Reno Amtrak Station	Reno	United States			America/Los_Angeles
6507	Sacramento Amtrak Station	Sacramento	United States			America/Los_Angeles
6508	Tureia Airport	Tureia	French Polynesia	ZTA	NTGY	
6509	McMurdo Station Ice Runway	Ross Island	Antarctica		NZIR	Antarctica/South_Pole
6510	Keekorok Airport	Keekorok	Kenya		HKKE	Africa/Nairobi
6511	Ol Kiombo	Mara Intrepids	Kenya			Africa/Nairobi
6512	Ol Kiombo	Mara Intrepids	Kenya			Africa/Nairobi
6513	Kichwa Tembo	Kichwa Tembo	Kenya			Africa/Nairobi
6514	Busan	Busan	South Korea			Asia/Seoul
6515	Busan	Busan	South Korea			Asia/Seoul
6516	Gare de Marne-la-Vallee	Chessy	France			Europe/Paris
6517	Jefferson County Intl	Port Townsend	United States	TWD		America/Los_Angeles
6518	Lynden Airport	Lynden	United States	38W		America/Los_Angeles
6519	Jefferson County Intl	Port Townsend	United States	0S9		America/Los_Angeles
6520	Savut	Savut	Botswana			
6521	Xakan	Xakan	Botswana			
6522	Xakan	Xakan	Botswana			
6523	Xugan	Xugan	Botswana			
6524	Puerto Obaldia Airport	Puerto Obaldia	Panama	PUE	MPOA	America/Panama
6525	Kerch Airport	Kerch	Ukraine	KHC	UKFK	Europe/Simferopol
6526	Khao Sok National Park	Surat Thani	Thailand			Asia/Bangkok
6527	Khao Sok National Park	Surat Thani	Thailand			Asia/Bangkok
6528	Boston South Station	Boston	United States		BOST	America/New_York
6529	Tarifa	Tarifa	Spain			Europe/Madrid
6530	Train Station	Ottawa	Canada	XDS		America/Toronto
6531	Train Station	Belleville	Canada	XVV		America/Toronto
6532	Train Station	Edmonton	Canada	XZL		America/Edmonton
6533	Train Station	Richmond	United States	ZRD		America/New_York
6534	Sentral	Kuala Lumpur	Malaysia	XKL		Asia/Kuala_Lumpur
6535	Train Station	Churchill	Canada	XAD		America/Winnipeg
6536	Train Station	Winnipeg	Canada	XEF		America/Winnipeg
6537	Kingston VIA Station	Kingston	Canada			America/Toronto
6538	Ukunda Airstrip	Ukunda	Kenya	UKA	HKUK	Africa/Nairobi
6539	Whitehaven Beach	Whitsunday Island	Australia			Australia/Brisbane
6540	Wilmington Airpark	Wilmington	United States	ILN	KILN	America/New_York
6541	Marana Regional Airport	Tucson	United States	AVW	KAVQ	America/Phoenix
6542	Casa Grande Municipal Airport	Casa Grande	United States	CGZ	KCGZ	America/Phoenix
6543	Mobile Airport	Mobile	United States		1AZ0	America/Phoenix
6544	Buckeye Municipal Airport	Buckeye	United States	BXK	KBXK	America/Phoenix
6545	Gila Bend Municipal Airport	Gila Bend	United States		KE63	America/Phoenix
6546	McMinn County Airport	Athens	United States	MMI	KMMI	America/New_York
6547	Sterling Municipal Airport	Sterling	United States	STK	KSTK	America/Denver
6548	Rawlins Municipal Airport/Harvey Field	Rawlins	United States	RWL	KRWL	America/Denver
6549	Mackenzie Airport	Mackenzie British Columbia	Canada		CYZY	America/Vancouver
6550	JALOU	Jalu	Libya			Africa/Tripoli
6551	JALOU	Jalu	Libya			Africa/Tripoli
6552	Essex County Airport	Caldwell	United States	CDW	KCDW	America/New_York
6553	Lee C Fine Memorial Airport	Kaiser Lake Ozark	United States	AIZ	KAIZ	America/Chicago
6554	Yuryevets	Yuryevets	Russia			Europe/Moscow
6555	Big Bear City	Big Bear	United States	L35		America/Los_Angeles
6556	KIEV  INTERNATIONAL AIRPORT	KIEV	Ukraine	KIP	KIEV	Europe/Kiev
6557	Los Angeles Union Station	Los Angeles	United States			America/Los_Angeles
6558	Bamberg BF	Bamberg	Germany	BAM	BAMB	Europe/Berlin
6559	Ingolstadt BF	Ingolstadt	Germany		INGS	Europe/Berlin
6560	Thomasville Regional Airport	Thomasville	United States	TVI	KTVI	America/New_York
6561	Henderson Executive Airport	Henderson	United States	HSH	KHND	America/Los_Angeles
6562	Gostomel Airport	Kiev	Ukraine	GML	UKKM	Europe/Kiev
6563	Zuoying Station	Kaohsiung	Taiwan			Asia/Taipei
6564	Taipei Station	Taipei	Taiwan			Asia/Taipei
6565	Donghae	Donghae	South Korea			Asia/Seoul
6566	Sakaiminato Port	Sakaiminato	Japan			Asia/Tokyo
6567	Henry Tift Myers Airport	Tifton	United States	TMA	KTMA	America/New_York
6568	Landshut Airport	Landshut	Germany		EDML	Europe/Berlin
6569	Itzehoe/Hungriger Wolf Airport	Itzehoe	Germany		EDHF	Europe/Berlin
6570	Savannah Cruise Terminal	Savannah	United States			America/New_York
6571	CHARLESTON CRUISE TERMINAL	CHARLESTON	United States			America/New_York
6572	NEW YORK CRUISE TERMINAL PIER 92	NEW YORK	United States			America/New_York
6573	Navy Dockyard Hamilton Bermuda	HAMILTON	Bermuda			Atlantic/Bermuda
6574	Tokyo Station	Tokyo	Japan			Asia/Tokyo
6575	Shin-Osaka Station	Osaka	Japan			Asia/Tokyo
6576	Hiroshima Station	Hiroshima	Japan			Asia/Tokyo
6577	Frankfurt-Main Hauptbahnhof	Frankfurt	Germany	ZRB		Europe/Berlin
6578	Amsterdam Amstel Station	Amsterdam	Netherlands			Europe/Amsterdam
6579	Florenc Central Bus Station	Prague	Czech Republic			Europe/Prague
6580	Wien Sudbahnhof	Vienna	Austria			Europe/Vienna
6581	Praha hlavni nadrazi	Prague	Czech Republic	XYG		Europe/Prague
6582	Wien Westbahnhof	Vienna	Austria			Europe/Vienna
6583	Venezia Santa Lucia	Venice	Italy			Europe/Rome
6584	Firenze Santa Maria Novella	Florence	Italy	ZMS		Europe/Rome
6585	Roma Termini	Rome	Italy			Europe/Rome
6586	St Pancras Railway Station	London	United Kingdom	QQS		Europe/London
6587	Chitabe Airstrip	Chitabe	Botswana			Africa/Gaborone
6588	Fish River Canyon Lodge Airstrip	Fish River Canyon	Namibia			Africa/Windhoek
6589	Sossusvlei Desert Lodge Airstrip	Sossusvlei	Namibia			Africa/Windhoek
6590	Ulusaba Airstrip	Ulusaba	Namibia	ULX		Africa/Johannesburg
6591	Radom Airport	RADOM	Poland	RDO	EPRA	Europe/Warsaw
6592	Phoenix Deer Valley Airport	Phoenix 	United States	DVT	KDVT	America/Phoenix
6593	Calgary / Springbank Airport	Calgary	Canada		CYBW	America/Edmonton
6594	Golden Airport	Golden	Canada		CYGE	America/Edmonton
6595	Revelstoke Airport	Revelstoke	Canada	YRV	CYRV	America/Vancouver
6596	Republic Airport	Farmingdale	United States	FRG	KFRG	America/New_York
6597	Allstedt Airport	Allstedt	Germany		EDBT	Europe/Berlin
6598	BWKAM	Amberg	Germany			Europe/Berlin
6599	Glindbruchkippe	Peine	Germany		KIPP	Europe/Berlin
6600	General Freire Airport	Curico	Chile		SCIC	America/Santiago
6601	Peine-Eddesse Airport	Peine	Germany		EDVP	Europe/Berlin
6602	Seattle King Street Station	Seattle	United States			America/Los_Angeles
6603	Tula	Tula	Russia	TYA		Europe/Moscow
6604	South Texas Regional Airport at Hondo	Hondo	United States		KHDO	America/Chicago
6605	Zhongwei Shapotou Airport	Zhongwei	China	ZHY	ZLZW	Asia/Shanghai
6606	Milwaukee Airport Station	Milwaukee	United States			America/Chicago
6607	Springfield IL Amtrak	Springfield	United States			America/Chicago
6608	St. Louis Amtrak - old	St. Louis	United States			America/Chicago
6609	Camarillo Amtrak	Camarillo	United States			America/Los_Angeles
6610	Seattle Pier 52	Seattle	United States			America/Los_Angeles
6611	Bremerton Terminal	Bremerton	United States			America/Los_Angeles
6612	McKinley National Park Airport	McKinley Park	United States	MCL	PAIN	America/Anchorage
6613	Lake Hood Airport	Anchorage	United States		PALH	America/Anchorage
6614	Prospect Creek Airport	Prospect Creek	United States	PPC	PAPR	America/Anchorage
6615	Khwai River Lodge Airport	Khwai River	Botswana	KHW	FBKR	Africa/Gaborone
6616	Spremberg-Welzow Airport	Welzow	Germany		EDCY	Europe/Berlin
6617	Taichung Airport	Taichung	Taiwan	TXG	RCLG	Asia/Taipei
6618	Columbia County	Hudson NY	United States	HCC		America/New_York
6619	Sasovo	Sasovo	Russia			Europe/Moscow
6620	Hong Kong Macau Ferry Terminal	Hong Kong	Hong Kong			Asia/Hong_Kong
6621	Hong Kong Macau Ferry Terminal	Hong Kong	Hong Kong			Asia/Hong_Kong
6622	Macau Taipa Ferry Terminal	Macau	Macau			Asia/Macau
6623	Macau Taipa Ferry Terminal	Macau	Macau			Asia/Macau
6624	Wheeling Ohio County Airport	Wheeling	United States	HLG	KHLG	America/New_York
6625	Fitzgerald Municipal Airport	Fitzgerald	United States		KFZG	America/New_York
6626	Perry-Foley Airport	Perry	United States	40J		America/New_York
6627	Cairo-Grady County Airport	Cairo	United States	70J		America/New_York
6628	Pacific Station	Vancouver	Canada			America/Vancouver
6629	Tamar Mepe Airport	Mestia	Georgia			Asia/Tbilisi
6630	Samsun 	Samsun	Turkey	SSX		Europe/Istanbul
6631	Ye Airport	Ye	Burma	XYE	VYYE	Asia/Rangoon
6632	Isla San Felix Airport	Isla San Felix	Chile		SCFX	America/Santiago
6633	Kingston Train Station	Kingston	Canada	XEG	KGST	America/Toronto
6634	Dorval Railway Station	Dorval	Canada	XAX		America/Toronto
6635	Brockville Megabus Stop	Brockville	Canada		BRKM	America/Toronto
6636	Brockville VIA Station	Brockville	Canada		BRKV	America/Toronto
6637	Shaibah Airport	Shaybah	Saudi Arabia		OESB	Asia/Riyadh
6638	Al Maktoum International Airport	Dubai	United Arab Emirates	DWC	OMDW	Asia/Dubai
6639	Aransas County Airport	Rockport	United States	RKP	KRKP	America/Chicago
6640	Bandanaira Airport	Bandanaira-Naira Island	Indonesia	NDA		
6641	Megève Airport	Verdun	France	MVV	LFHM	Europe/Paris
6642	Méribel Altiport	Ajaccio	France	MFX	LFKX	Europe/Paris
6643	Oldbury	Oldbury	United Kingdom			Europe/London
6644	Baise Youjiang Airport	Baise	China	AEB	ZGBS	Asia/Shanghai
6645	Okaukuejo Airport	Okaukuejo	Namibia	OKF	FYOO	Africa/Windhoek
6646	Mokuti Lodge Airport	Mokuti Lodge	Namibia	OKU	FYMO	Africa/Windhoek
6647	Rotenburg (Wümme) Airport	Rotenburg Wuemme	Germany		EDXQ	Europe/Berlin
6648	Wipperfürth-Neye Airport	Wipperfuerth	Germany		EDKN	Europe/Berlin
6649	Osnabrück-Atterheide Airport	Osnabrueck	Germany		EDWO	Europe/Berlin
6650	Flugplatz Ballenstedt	Ballenstedt	Germany		EDCB	Europe/Berlin
6651	Flugplatz Hartenholm	Hasenmoor	Germany		EDHM	Europe/Berlin
6652	Ganderkesee Atlas Airfield	Ganderkesee	Germany		EDWQ	Europe/Berlin
6653	Nienburg-Holzbalge Airport	Nienburg Weser	Germany		EDXI	Europe/Berlin
6654	Damme Airfield	Damme	Germany		EDWC	Europe/Berlin
6655	Borkenberge Airport	Duelmen	Germany		EDLB	Europe/Berlin
6656	Obermehler-Schlotheim Airport	Obermehler	Germany		EDCO	Europe/Berlin
6657	Hodenhagen Airport	Hodenhagen	Germany		EDVH	Europe/Berlin
6658	Grube Airport	Grube	Germany		EDHB	Europe/Berlin
6659	Tønder Airport	Toender	Denmark		EKTD	Europe/Copenhagen
6660	Celle-Arloh Airport	Celle	Germany		EDVC	Europe/Berlin
6661	Uelzen Airport	Uelzen	Germany		EDVU	Europe/Berlin
6662	Hamm-Lippewiesen Airport	Hamm	Germany		EDLH	Europe/Berlin
6663	Lüsse Airport	Luesse	Germany		EDOJ	Europe/Berlin
6664	Porta Westfalica Airport	Bad Oeynhausen	Germany		EDVY	Europe/Berlin
6665	Brilon/Hochsauerlandkreis Airfield	Brilon	Germany		EDKO	Europe/Berlin
6666	Hameln-Pyrmont Airport	Bad Pyrmont	Germany		EDVW	Europe/Berlin
6667	Nordholz-Spieka Airfield	Cuxhaven	Germany		EDXN	Europe/Berlin
6668	Köthen Airport	Koethen	Germany	KOQ	EDCK	Europe/Berlin
6669	St. Michaelisdonn Airport	Sankt Michaelisdonn	Germany		EDXM	Europe/Berlin
6670	Salzgitter-Drütte Airport	Salzgitter	Germany		EDVS	Europe/Berlin
6671	Karlshöfen Airport	Karlshoefen	Germany		EDWK	Europe/Berlin
6672	Oldenburg-Hatten Airfield	Oldenburg	Germany		EDWH	Europe/Berlin
6673	Rinteln Airport	Rinteln	Germany		EDVR	Europe/Berlin
6674	Münster-Telgte Airport	Muenster	Germany		EDLT	Europe/Berlin
6675	St. Peter-Ording Airport	Sankt Peter-Ording	Germany	PSH	EDXO	Europe/Berlin
6676	Lüchow-Rehbeck Airport	Luechow	Germany		EDHC	Europe/Berlin
6677	Klietz/Scharlibbe Airport	Scharlibbe	Germany		EDCL	Europe/Berlin
6678	Burg Airport	Burg	Germany		EDBG	Europe/Berlin
6679	Crisp County Cordele Airport	Cordele	United States		KCKF	America/New_York
6680	Ormond Beach Municipal Airport	Ormond Beach	United States		KOMN	America/New_York
6681	Bad Neuenahr-Ahrweiler Airfield	Bad Neuenahr	Germany		EDRA	Europe/Berlin
6682	Bad Dürkheim Airport	Bad Duerkheim	Germany		EDRF	Europe/Berlin
6683	Portland Troutdale Airport	Troutdale	United States	TTD	KTTD	America/Los_Angeles
6684	Portland Hillsboro Airport	Hillsboro	United States	HIO	KHIO	America/Los_Angeles
6685	One Police Plaza Heliport	New York	United States		NK39	America/New_York
6686	Leverkusen Airport	Leverkusen	Germany		EDKL	Europe/Berlin
6687	Suwannee County Airport	Live Oak	United States	24J		America/New_York
6688	Wershofen/Eifel Airfield	Wershofen	Germany		EDRV	Europe/Berlin
6689	Khost Airport	Khost	Afghanistan	KHT	OAKS	Asia/Kabul
6690	TCO	Tengiz	Kazakhstan			Asia/Oral
6691	TCO	Tengiz	Kazakhstan			Asia/Oral
6692	Namtu Airport	Naypyidaw	Burma	NMT	VYNT	Asia/Rangoon
6693	Nguma Island Lodge Airstrip	Etsha 13	Botswana			Africa/Gaborone
6694	Maramba Aerodrome	Livingstone	Zambia			Africa/Lusaka
6695	Bend Municipal Airport	Bend	United States		KBDN	America/Los_Angeles
6696	Christmas Valley Airport	Christmas Valley	United States		K62S	America/Los_Angeles
6697	Burns Municipal Airport	Burns	United States	BNO	KBNO	America/Los_Angeles
6698	Prineville Airport	Prineville	United States	PRZ	KS39	America/Los_Angeles
6699	Red Bluff Municipal Airport	Red Bluff	United States	RBL	KRBL	America/Los_Angeles
6700	Marin County Airport - Gnoss Field	Novato	United States	NOT	KDVO	America/Los_Angeles
6701	Lake County Airport	Lakeview	United States	LKV	KLKV	America/Los_Angeles
6702	Tillamook Airport	Tillamook	United States	OTK	KTMK	America/Los_Angeles
6703	Ontario Municipal Airport	Ontario	United States	ONO	KONO	America/Denver
6704	Columbia Gorge Regional the Dalles Municipal Airport	The Dalles	United States	DLS	KDLS	America/Los_Angeles
6705	Montgomery County Airpark	Gaithersburg	United States	GAI	KGAI	America/New_York
6706	Cincinnati Union Terminal	Cincinnati	United States			America/New_York
6707	FOB Sharana	Sharan	Afghanistan			Asia/Kabul
6708	Sharana Airstrip	Sharona	Afghanistan	OAS	OASA	Asia/Kabul
6709	Pembroke Airport	Pembroke	Canada	YTA	CYTA	America/Toronto
6710	Tsumeb Airport	Tsumeb	Namibia	TSB	FYTM	Africa/Windhoek
6711	Suffield Heliport	Suffield	Canada	YSD	CYSD	America/Edmonton
6712	Field 21	Wainwright	Canada			America/Edmonton
6713	Field 21	Wainwright	Canada			America/Edmonton
6714	Blumenau Airport	BLUMENAU	Brazil	BNU	SSBL	America/Sao_Paulo
6715	Aeroclub Mures	Targu Mures	Romania		LRMS	Europe/Bucharest
6716	Aeroclub Sibiu	Sibiu	Romania			Europe/Bucharest
6717	Aeroclub Sibiu	Sibiu	Romania	SIB		Europe/Bucharest
6718	Bolshoye Gryzlovo Airfield	Stupino	Russia		UUDG	Europe/Moscow
6719	Aerodrom Cioca	Timisoara	Romania			Europe/Bucharest
6720	Aeroclub Cioca	Timisoara	Romania		LRT2	Europe/Bucharest
6721	Crocodile Camp Air Strip	Tsavo East	Kenya			Africa/Nairobi
6722	Crocodile Camp Air Strip	Tsavo East	Kenya			Africa/Nairobi
6723	Cleveland Clinic	Cleveland	United States		CCLN	America/New_York
6724	Charlevoix Municipal Airport	Charelvoix	United States		KCVX	America/New_York
6725	Quincy Municipal Airport	Quincy	United States	2J9		America/New_York
6726	Pferdsfeld	Pferdsfeld	Germany		ETSP	Europe/Berlin
6727	Mykines Heliport	Mykines	Faroe Islands		EKMS	Atlantic/Faeroe
6728	V-A Waterfront	Cape Town	South Africa			Africa/Johannesburg
6729	Steenberg Helipad	Cape Town	South Africa			Africa/Johannesburg
6730	Steenberg Helipad	Cape Town	South Africa			Africa/Johannesburg
6731	Moultrie Municipal Airport	Moultrie	United States	MGR		America/New_York
6732	Roche Harbor Seaplane Base	Roche Harbor	United States	RCE		America/Los_Angeles
6733	Blakely Island Airport	Blakely Island	United States	BYW		America/Los_Angeles
6734	Rosario Seaplane Base	Rosario	United States	RSJ		America/Los_Angeles
6735	Westsound Seaplane Base	Westsound	United States	WSX		America/Los_Angeles
6736	Friday Harbor Seaplane Base	Friday Harbor	United States	FBS		America/Los_Angeles
6737	Big Bay Water Aerodrome	Big Bay	Canada	YRR		America/Vancouver
6738	Furnace Creek	Death Valley National Park	United States	L06		America/Los_Angeles
6739	Cornwall Regional Airport	Cornwall	Canada	YCC	CYCC	America/Toronto
6740	Seppe Airfield	Bosschenhoofd	Netherlands		EHSE	Europe/Amsterdam
6741	St Stephan Airport	St.Stephan	Switzerland		LSTS	Europe/Zurich
6742	Zona da Mata Regional Airport	Juiz de Fora	Brazil	IZA	SDZY	America/Sao_Paulo
6743	IAR Gimbav Heliport	Brasov	Romania		LRBG	Europe/Bucharest
6744	Flagler Executive Airport	Flagler	United States		KXFL	America/New_York
6745	Aeroclub Deva	Deva	Romania	DVA		Europe/Bucharest
6746	Aeroclub Cluj	Dezmir	Romania	DZM		Europe/Bucharest
6747	Antarctica	Antarctica	Antarctica			Antarctica/South_Pole
6748	Antarctica	Antarctica	Antarctica			Antarctica/South_Pole
6749	Morrisville Stowe State Airport	Morrisville	United States	MVL	KMVL	America/New_York
6750	Dallas Executive Airport	Dallas	United States	RBD	KRBD	America/Chicago
6751	Como (Idroscalo - Water Ad) Hidroport	Como	Italy		LILY	Europe/Rome
6752	Superficie Cielo Blu	Vellezzo Bellini	Italy			Europe/Rome
6753	Welke Airport	Beaver Island	United States	6Y8		America/New_York
6754	Krainiy Airport	Baikonur	Kazakhstan	BXY	UAOL	Asia/Qyzylorda
6755	MOW	Moscow	Russia	MOW		Europe/Moscow
6756	Westerly State Airport	Washington County	United States	WST	KWST	America/New_York
6757	Block Island State Airport	Block Island	United States	BID	KBID	America/New_York
6758	Atmautluak Airport	Atmautluak	United States			America/Anchorage
6759	Atmautluak Airport	Atmautluak	United States			America/Anchorage
6760	Atmautluak Airport	Atmautluak	United States	369		America/Anchorage
6761	Nightmute Airport	Nightmute	United States	NME	PAGT	America/Anchorage
6762	Toksook Bay Airport	Toksook Bay	United States	OOK	PAOO	America/Anchorage
6763	Tununak Airport	Tununak	United States	TNK		America/Anchorage
6764	Goodnews Airport	Goodnews Bay	United States	GNU		America/Anchorage
6765	Newtok Airport	Newtok	United States	WWT		America/Anchorage
6766	Achutupo Airport	Achutupo	Panama	ACU		America/Panama
6767	Tubuala Airport	Tubuala	Panama	TUW		America/Panama
6768	Garachine Airport	Garachine	Panama	GHE		America/Panama
6769	Mulatupo Airport	Mulatupo	Panama	MPP		America/Panama
6770	Ittoqqortoormiit Heliport	Ittoqqortoormiit	Greenland	OBY	BGSC	America/Scoresbysund
6771	Vinnytsia/Gavyryshivka Airport	Vinnitsa	Ukraine	VIN	UKWW	Europe/Kiev
6772	Gent Sint-Pieters	Gent	Belgium			Europe/Brussels
6773	Brugge	Bruges	Belgium			Europe/Brussels
6774	Brugge	Bruges	Belgium			Europe/Brussels
6775	Shin-yokohama-eki	Yokohama	Japan			Asia/Tokyo
6776	Angers St Laud	Angers	France	QXG		Europe/Paris
6777	Decatur County Industrial Air Park	Bainbridge	United States	BGE	KBGE	America/New_York
6778	La Romaine Airport	La Romaine	Canada	ZGS	CTT5	America/Blanc-Sablon
6779	Kegaska Airport	Kegaska	Canada	ZKG	CTK6	America/Blanc-Sablon
6780	Black Tickle Airport	Black Tickle	Canada	YBI	CCE4	America/Halifax
6781	Silver Springs Airport	Silver Springs	United States		KSPZ	America/Los_Angeles
6782	Whiteman Airport	Los Angeles	United States	WHP	KWHP	America/Los_Angeles
6783	Madera Municipal Airport	Madera	United States	MAE	KMAE	America/Los_Angeles
6784	Mountain Home Municipal Airport	Mountain Home	United States	U76		America/Denver
6785	Trail Airport	Trail	Canada	YZZ	CAD4	America/Vancouver
6786	Victoria Airport	Patricia Bay	Canada		CAP5	America/Vancouver
6787	Old Arctic Bay Airport	Arctic Bay	Canada	YAB	CJX7	America/Winnipeg
6788	Hope Bay Aerodrome	Hope Bay	Canada		CHB3	America/Edmonton
6789	Birchwood Airport	Belmopan	Belize		PABV	America/Anchorage
6790	Grand-Santi Airport	Grand-Santi	French Guiana	GSI	SOGS	America/Cayenne
6791	Maripasoula Airport	Maripasoula	French Guiana	MPY	SOOA	America/Cayenne
6792	Saint-Laurent-du-Maroni Airport	Saint-Laurent-du-Maroni	French Guiana	LDX	SOOM	America/Cayenne
6793	Cayana Airstrip	Cayana	Suriname	AAJ		America/Paramaribo
6794	Laduani Airstrip	Laduani	Suriname	LDO		America/Paramaribo
6795	Kanas Airport	Burqin	China	KJI	ZWKN	Asia/Shanghai
6796	Capurganá Airport	Capurgana	Colombia	CPB	SKCA	America/Bogota
6797	Sohag International Airport	Sohag	Egypt	HMB	HEMK	Africa/Cairo
6798	Presidente General Don Oscar D. Gestido International Airport	Rivera	Uruguay	RVY	SURV	America/Montevideo
6799	Patos de Minas Airport	Patos de Minas	Brazil	POJ	SNPD	America/Sao_Paulo
6800	Bauru - Arealva Airport	Bauru	Brazil	JTC	SJTC	America/Sao_Paulo
6801	Ourilândia do Norte Airport	Ourilandia do Norte	Brazil	OIA	SDOW	America/Belem
6802	Redenção Airport	Redencao	Brazil	RDC	SNDC	America/Belem
6803	São Félix do Xingu Airport	Sao Felix do Xingu	Brazil	SXX	SNFX	America/Belem
6804	Bonito Airport	Bointo	Brazil	BYO	SJDB	America/Campo_Grande
6805	São Félix do Araguaia Airport	Sao Felix do Araguaia	Brazil	SXO	SWFX	America/Campo_Grande
6806	Caçador Airport	Cacador	Brazil	CFC	SBCD	America/Sao_Paulo
6807	Carauari Airport	Carauari	Brazil	CAF	SWCA	America/Boa_Vista
6808	Urucu Airport	Porto Urucu	Brazil		SWUY	America/Boa_Vista
6809	Eirunepé Airport	Eirunepe	Brazil	ERN	SWEI	America/Boa_Vista
6810	Concórdia Airport	Concordia	Brazil	CCI	SSCK	America/Sao_Paulo
6811	Francisco Beltrão Airport	Francisco Beltrao	Brazil	FBE	SSFB	America/Sao_Paulo
6812	Confresa Airport	Confresa	Brazil	CFO	SJHG	America/Campo_Grande
6813	Jackson County Airport	Jefferson	United States	19A		America/New_York
6814	Apalachicola Regional Airport	Apalachicola	United States	AAF	KAAF	America/New_York
6815	Umuarama Airport	Umuarama	Brazil	UMU	SSUM	America/Sao_Paulo
6816	Diamantina Airport	Diamantina	Brazil	DTI	SNDT	America/Sao_Paulo
6817	Fonte Boa Airport	Fonte Boa	Brazil	FBA	SWOB	America/Boa_Vista
6818	Senadora Eunice Micheles Airport	Sao Paulo de Olivenca	Brazil	OLC	SDCG	America/Boa_Vista
6819	Humaitá Airport	Humaita	Brazil	HUW	SWHT	America/Boa_Vista
6820	Tapuruquara Airport	Santa Isabel do Rio Negro	Brazil	IRZ	SWTP	America/Boa_Vista
6821	Oriximiná Airport	Oriximina	Brazil	ORX	SNOX	America/Belem
6822	Hotel Transamérica Airport	Una	Brazil	UNA	SBTC	America/Fortaleza
6823	Algeciras Heliport	Algeciras	Spain			Europe/Madrid
6824	Algeciras Heliport	Algeciras	Spain			Europe/Madrid
6825	Kai Tak International Airport 	Hong Kong	Hong Kong			Asia/Hong_Kong
6826	Kai Tak International Airport 	Hong Kong	Hong Kong			Asia/Hong_Kong
6827	Telfer Airport	Telfer	Australia	TEF	YTEF	Australia/Perth
6828	Gazipaşa Airport	Alanya	Turkey	GZP	LTGP	Europe/Istanbul
6829	Shank Air Base	Shank	Afghanistan	OAA	OASH	Asia/Kabul
6830	St. Augustine Airport	St. Augustine	United States	SGJ		America/New_York
6831	Londolozi	Londolozi	South Africa	LDZ		Africa/Johannesburg
6832	Singita Sabi Sands	Sabi Sands	South Africa			Africa/Johannesburg
6833	Singita Sabi Sands	Sabi Sands	South Africa			Africa/Johannesburg
6834	Singita Sabi Sands	Sabi Sands	South Africa	INY		Africa/Johannesburg
6835	Douglas Municipal Airport	Douglas	United States		KDQH	America/New_York
6836	St Lucie County International Airport	Fort Pierce	United States	FPR	KFPR	America/New_York
6837	Taunton Municipal King Field	Taunton	United States		KTAN	America/New_York
6838	Plymouth Municipal Airport	Plymouth	United States	PYM	KPYM	America/New_York
6839	Quonset State Airport	North Kingstown	United States	NCO	KOQU	America/New_York
6840	Mansfield Municipal	Mansfield	United States	1B9		America/New_York
6841	Norwood Memorial Airport	Norwood	United States	OWD	KOWD	America/New_York
6842	Westfield-Barnes Regional Airport	Westfield	United States	BAF	KBAF	America/New_York
6843	Windham Airport	Willimantic	United States		KIJD	America/New_York
6844	Orange County Airport	Montgomery	United States	MGJ	KMGJ	America/New_York
6845	Capital City Airport	Harrisburg	United States	HAR	KCXY	America/New_York
6846	Marshfield Municipal George Harlow Field	Marshfield	United States		KGHG	America/New_York
6847	Danbury Municipal Airport	Danbury	United States	DXR	KDXR	America/New_York
6848	Boire Field	Nashua	United States	ASH	KASH	America/New_York
6849	Lawrence Municipal Airport	Lawrence	United States	LWM	KLWM	America/New_York
6850	Waterbury Oxford Airport	Oxford	United States	OXC	KOXC	America/New_York
6851	Fitchburg Municipal Airport	Fitchburg	United States		KFIT	America/New_York
6852	Earl L. Small Jr. Field/Stockmar Airport	Villa Rica	United States		20GA	America/New_York
6853	Cartersville Airport	Cartersville	United States		KVPC	America/New_York
6854	Centre-Piedmont-Cherokee County Regional Airport	Centre	United States		KPYP	America/Chicago
6855	Richard B Russell Airport	Rome	United States	RMG	KRMG	America/New_York
6856	Northeast Alabama Regional Airport	Gadsden	United States	GAD	KGAD	America/Chicago
6857	Knoxville Downtown Island Airport	Knoxville	United States		KDKX	America/New_York
6858	Barrow County Airport	Winder	United States	WDR	KWDR	America/New_York
6859	Plantation Airpark	Sylvania	United States		KJYL	America/New_York
6860	Dalton Municipal Airport	Dalton	United States	DNN	KDNN	America/New_York
6861	West Georgia Regional O V Gray Field	Carrollton	United States		KCTJ	America/New_York
6862	Isbell Field Airport	Fort Payne	United States	4A9		America/Chicago
6863	LaGrange Callaway Airport	LaGrange	United States	LGC	KLGC	America/New_York
6864	Baldwin County Regional Airport	Milledgeville	United States		KMLJ	America/New_York
6865	Polk County Airport - Cornelius Moore Field	Cedartown	United States	4A4		America/New_York
6866	Harris County Airport	Pine Mountain	United States	PIM	KPIM	America/New_York
6867	Peachtree City Falcon Field	Atlanta	United States		KFFC	America/New_York
6868	Covington Municipal Airport	Covington	United States	9A1		America/New_York
6869	Lee Gilmer Memorial Airport	Gainesville	United States	GVL	KGVL	America/New_York
6870	Cherokee County Airport	Canton	United States		KCNI	America/New_York
6871	DeFuniak Springs Airport	DeFuniak Springs	United States	54J		America/Chicago
6872	Barwick Lafayette Airport	LaFayette	United States	9A5		America/New_York
6873	Harry Clever Field	New Philadelpha	United States	PHD	KPHD	America/New_York
6874	Darlington County Airport	Darlington	United States		KUDG	America/New_York
6875	Hilton Head Airport	Hilton Head Island	United States	HHH	KHXD	America/New_York
6876	Gilmer County Airport	Ellijay	United States	49A		America/New_York
6877	Elizabethton Municipal Airport	Elizabethton	United States	0A9		America/New_York
6878	Moton Field Municipal Airport	Tuskegee	United States	06A		America/Chicago
6879	Daniel Field	Augusta	United States	DNL	KDNL	America/New_York
6880	Foothills Regional Airport	Morganton	United States	MRN	KMRN	America/New_York
6881	Pike County-Hatcher Field	Pikeville	United States	PVL	KPBX	America/New_York
6882	Mallards Landing Airport	Locust Grove	United States		GA04	America/New_York
6883	Toccoa Airport - R.G. Letourneau Field	Toccoa	United States	TOC	KTOC	America/New_York
6884	Compton Abbas Aerodrome	Shaftesbury	United Kingdom		EGHA	Europe/London
6885	SCC4	MFO	Egypt			Asia/Jerusalem
6886	SCC4	MFO	Egypt			Asia/Jerusalem
6887	SCC4	MFO	Egypt			Asia/Jerusalem
6888	SCC4	MFO	Egypt			Asia/Jerusalem
6889	Suprunovka Airport	Poltava	Ukraine	PLV	UKHP	Europe/Kiev
6890	Ferry Port	Calais	France			Europe/Paris
6891	Ferry Port	Dover	United Kingdom			Europe/London
6892	Aweil Airport	Aweil	Sudan		HSAW	Africa/Juba
6893	Wau Airport	Wau	Sudan	WUU	HSWW	Africa/Juba
6894	Humera Airport	Humera	Ethiopia	HUE	HAHU	Africa/Addis_Ababa
6895	Moyale Airport	Moyale	Kenya	OYL	HKMY	Africa/Nairobi
6896	Zagora Airport	Zagora	Morocco	OZG	GMAZ	Africa/Casablanca
6897	Yengema Airport	Yengema	Sierra Leone	WYE	GFYE	Africa/Freetown
6898	Gbangbatok Airport	Gbangbatok	Sierra Leone	GBK	GFGK	Africa/Freetown
6899	Hong Kong China Ferry Terminal	Hong Kong	Hong Kong			Asia/Hong_Kong
6900	Tampa Executive Airport	Tampa	United States	VDF		America/New_York
6901	Turukhansk Airport	Turukhansk	Russia	THX	UOTT	Asia/Krasnoyarsk
6902	Podkamennaya Tunguska Airport	Bor	Russia	TGP	UNIP	Asia/Krasnoyarsk
6903	Fort Worth Alliance Airport	Fort Worth	United States	AFW	KAFW	America/Chicago
6904	East Troy Municipal Airport	East Troy	United States		K57C	America/Chicago
6905	Kolpashevo Airport	Kolpashevo	Russia		UNLL	Asia/Krasnoyarsk
6906	Montgomery Field	San Diego	United States	MYF	NULL	Asia/Shanghai
6907	Gimpo International Airpot	Seoul	South Korea	SEL		Asia/Seoul
6908	Ali Al Salem Air Base	Kuwait	Kuwait		OKAS	Asia/Kuwait
6909	Renmark Airport	Renmark	Australia	RMK	YREN	Australia/Adelaide
6910	Leigh Creek Airport	Leigh Creek	Australia	LGH	YLEC	Australia/Adelaide
6911	Warburton Airport	Warburton Community	Australia		YWBR	Australia/Perth
6912	Cunderdin Airport	Cunderdin	Australia		YCUN	Australia/Perth
6913	Rottnest Island Airport	Rottnest Island	Australia	RTS	YRTI	Australia/Perth
6914	Forrest Airport	Forrest	Australia	FOS	YFRT	Australia/Perth
6915	Ballarat Airport	Ballarat	Australia		YBLT	Australia/Hobart
6916	Keewaywin Airport	Keewaywin	Canada	KEW	CPV8	America/Winnipeg
6917	Marathon Airport	Marathon	Canada	YSP	CYSP	America/Toronto
6918	Hearst René Fontaine Municipal Airport	Hearst	Canada	YHF	CYHF	America/Toronto
6919	Hornepayne Municipal Airport	Hornepayne	Canada	YHN	CYHN	America/Toronto
6920	Kirkland Lake Airport	Kirkland Lake	Canada	YKX	CYKX	America/Toronto
6921	Manitouwadge Airport	Manitouwadge	Canada	YMG	CYMG	America/Toronto
6922	Wawa Airport	Wawa	Canada	YXZ	CYXZ	America/Toronto
6923	Manitoulin East Municipal Airport	Manitowaning	Canada	YEM	CYEM	America/Toronto
6924	Slate Falls Airport	Slate Falls	Canada		CKD9	America/Winnipeg
6925	Collingwood Airport	Collingwood	Canada		CNY3	America/Toronto
6926	Brantford Municipal Airport	Brantford	Canada		CYFD	America/Toronto
6927	Lawrence Municipal Airport	Lawrence	United States	LWC	KLWC	America/Chicago
6928	Wellington Municipal Airport	Wellington	United States		KEGT	America/Chicago
6929	Isla San Jose	Isla San Jose	Panama			America/Panama
6930	Griffin-Spalding County Airport	Griffin	United States	6A2		America/New_York
6931	Dieu Merci	Saint-Elie	French Guiana			America/Cayenne
6932	DEGRA	REMIRE-MONTJOLY	French Guiana			
6933	Herapel	Morsbach	France			Europe/Paris
6934	Degrad des Cannes	REMIRE-MONTJOLY	French Guiana			America/Cayenne
6935	Elysee	Elysee	French Guiana			America/Cayenne
6936	Citron	Citron	French Guiana			America/Cayenne
6937	Yaou	Maripasoula	French Guiana			America/Cayenne
6938	Helicojyp	REMIRE-MONTJOLY	French Guiana			America/Cayenne
6939	Nicosia International Airport	Nicosia	Cyprus	NIC		Asia/Nicosia
6940	Pompano Beach Airpark	Pompano Beach	United States	PPM	KPMP	America/New_York
6941	Mallacoota Airport	Mallacoota	Australia	XMC	YMCO	Australia/Hobart
6942	Majeed Bin Abdulaziz Airport	Al-Ula	Saudi Arabia	ULH	OEAO	Asia/Riyadh
6943	Pogapa Airstrip	Pogapa	Indonesia			Asia/Jayapura
6944	Pogapa Airstrip	Pogapa	Indonesia			Asia/Jayapura
6945	Greyhound Station	Washington DC	United States		DCBS	America/New_York
6946	Roma Street Railway Station	Brisbane	Australia			
6947	Roma Street Railway Station	Brisbane	Australia			Australia/Brisbane
6948	Rockhampton Railway Station	Rockhampton	Australia			Australia/Brisbane
6949	Sydney Terminal Railway Station	Sydney	Australia			Australia/Sydney
6950	Melbourne Southern Cross Railway Station	Melbourne	Australia			Australia/Hobart
6951	Nambour Railway Station	Nambour	Australia			Australia/Brisbane
6952	Bundaberg Railway Station	Bundaberg	Australia			Australia/Brisbane
6953	Hung Hom Railway Station	Hong Kong	Hong Kong			Asia/Hong_Kong
6954	Hong Kong Railway Station	Hong Kong	Hong Kong			Asia/Hong_Kong
6955	Shelby County Airport	Alabaster	United States		KEET	America/Chicago
6956	Yuendumu Airport	Yuendumu 	Australia	YUE	YYND	Australia/Darwin
6957	Gare de Strasbourg	Strasbourg	France	XWG		Europe/Paris
6958	Sky Ranch At Carefree Airport	Carefree	United States		18AZ	America/Phoenix
6959	St Peter and St Paul Fortress	St. Petersburg	Russia			Europe/Moscow
6960	Guangzhou South Railway Station	Guangzhou	China	GZS		Asia/Shanghai
6961	Oddballs Camp Private Airstrip	Okavango Oddballs Camp	Botswana			Africa/Gaborone
6962	Lombok International Airport	Praya	Indonesia	LOP	WADL	Asia/Makassar
6963	Marmul	Marmul	Oman	OMM	OONR	Asia/Muscat
6964	One Hundred Mile House Airport	One Hundred Mile House	Canada		CAV3	America/Vancouver
6965	South Cariboo Region / 108 Mile Airport	108 Mile Ranch	Canada	ZMH	CZML	America/Vancouver
6966	Glasgow City Heliport	Glasgow	United Kingdom		EGEG	Europe/London
6967	Yarram Airport	Yarram	Australia		YYRM	Australia/Hobart
6968	Handan Airport	Handan	China	HDG	ZBHD	Asia/Shanghai
6969	Jade Mountain Helipad	Soufriere	Saint Lucia			America/St_Lucia
6970	Indianapolis Metropolitan Airport	Indianapolis	United States		KUMP	America/New_York
6971	London-Corbin Airport/Magee Field	London	United States	LOZ	KLOZ	America/New_York
6972	Camden Station	Baltimore	United States			America/New_York
6973	Simmons Army Air Field	Fredericksburg	United States	FBG	KFBG	America/New_York
6974	Pamalican Airstrip	Cuyo	Philippines			Asia/Manila
6975	Modlin Airport	Warsaw	Poland	WMI	EPMO	Europe/Warsaw
6976	Buffalo Bus Terminal	Buffalo	United States		BBUF	America/New_York
6977	Twelve Apostles Heliport	Princetown	Australia			Australia/Hobart
6978	Jixi Xingkaihu Airport	Jixi	China	JXA	ZYJX	Asia/Shanghai
6979	King St Station	Seattle	United States		SEAT	America/Los_Angeles
6980	Jeongseok Airport	Seogwipo	South Korea	JDG	RKPD	Asia/Seoul
6981	Berlin Brandenburg Willy Brandt	Berlin	Germany	BER		Europe/Berlin
6982	Taoyuan Station	Zhongli	Taiwan			Asia/Taipei
6983	Palatka Amtrak Station	Palatka	United States			America/New_York
6984	Gimli Industrial Park Airport	Gimli	Canada	YGM	CYGM	America/Winnipeg
6985	Matheson Island Airport	Matheson Island	Canada			America/Winnipeg
6986	Matheson Island Airport	Matheson Island	Canada			America/Winnipeg
6987	Matheson Island Airport	Matheson Island	Canada		CJT2	America/Winnipeg
6988	Tura Mountain Airport	Tura	Russia		UNIT	Asia/Krasnoyarsk
6989	Beloyarskiy Airport	Beloyarsky	Russia	EYK	USHY	Asia/Yekaterinburg
6990	Ypenburg	Ypenburg	Netherlands		EHYB	Europe/Amsterdam
6991	John H Batten Airport	Racine	United States	RAC	KRAC	America/Chicago
6992	Cesar Lim Rodriguez Airport	Taytay	Philippines	RZP	RPSD	Asia/Manila
6993	Gera-Leumnitz Airfield	Gera	Germany		EDAJ	Europe/Berlin
6994	Gera Leumnitz	Gera	Germany			Europe/Berlin
6995	Mira Flores	Mira Flores	Colombia			America/Bogota
6996	Kasimovo Airfield	Saint-Petersburg	Russia		XLLN	Europe/Moscow
6997	Otaru	Otaru	Japan	QOT		Asia/Tokyo
6998	Noboribetsu	Noboribetsu	Japan			Asia/Tokyo
6999	Terlet Glider Field	Arnhem	Netherlands		EHTL	Europe/Amsterdam
7000	Schaffen Diest	Schaffen	Belgium			Europe/Brussels
7001	Blomberg 3GGW	Blomberg	Germany			Europe/Berlin
7002	Buckeburg	Buckeburg	Germany			Europe/Berlin
7003	Shigatse Air Base	Shigatse	China	RKZ	ZURK	Asia/Shanghai
7004	Redlands Municipal Airport	Redlands	United States		KREI	America/Los_Angeles
7005	Chemehuevi Valley	Chemehuevi Valley	United States	49X		America/Los_Angeles
7006	Flabob Airport	Riverside	United States		KRIR	America/Los_Angeles
7007	Tacoma Narrows Airport	Tacoma	United States	TIW	KTIW	America/Los_Angeles
7008	Tampa North Aero Park	Tampa	United States	X39		America/New_York
7009	Athuruga	Athuruga	Maldives			Indian/Maldives
7010	Athuruga	Athuruga	Maldives			Indian/Maldives
7011	Athuruga	Athuruga	Maldives			Indian/Maldives
7012	STROE KAZERNE	STROE	Netherlands			Europe/Amsterdam
7013	\\\\'t Harde	Oldebroek	Netherlands			Europe/Amsterdam
7014	WERL KAZERNE	WERL	Germany			Europe/Berlin
7015	SZEGED	SZEGED	Hungary			Europe/Budapest
7016	LAKE WANNSEE	BERLIN	Germany			Europe/Berlin
7017	Tenkiller Lake Airpark	COOKSON	United States			America/Chicago
7018	HOEVENEN	HOEVENEN	Belgium			Europe/Brussels
7019	GRAS	HARREVELD	Netherlands			Europe/Amsterdam
7020	Oerlinghausen Airport	TELGTE	Germany		EDLO	Europe/Berlin
7021	Jack Edwards Airport	Gulf Shores	United States	GUF	KJKA	America/Chicago
7022	General Villamil Airport	Isabela	Ecuador	IBB	SEII	Pacific/Galapagos
7023	Balzers Heliport	Balzers	Switzerland		LSXB	Europe/Vaduz
7024	Vieste Heliport	Vieste	Italy	VIF		Europe/Rome
7025	Alpha	Cork	Ireland			
7026	Gogld	Island of Gogland	Russia			
7027	HIBER	Offshore	Mexico			
7028	Flugplatz Punitz	Punitz-Guessing	Austria		LOGG	Europe/Vienna
7029	Khmelnytskyi Airport	Khmeinitskiy	Ukraine	HMJ	UKLH	Europe/Kiev
7030	Hiroshimanishi Airport	Hiroshima	Japan	HIW	RJBH	Asia/Tokyo
7031	Annapolis	Annapolis	United States		ANNA	America/New_York
7032	High River Regional Airport	High River	Canada			America/Edmonton
7033	Yalata Mission Airport	Yalata	Australia	KYI	YYTA	Australia/Adelaide
7034	Hazleton Municipal Airport	Hazleton	United States	HZL	KHZL	America/New_York
7035	Greater Cumberland Regional Airport	Cumberland	United States	CBE	KCBE	America/New_York
7036	Sugar Loaf Shores Airport	Key West	United States		7FA1	America/New_York
7037	Wyndham Airport	Wyndham	Australia	WYN	YWYM	Australia/Perth
7038	Bob Quinn Lake Airport	Bob Quinn Lake	Canada	YBO	CBW4	America/Vancouver
7039	Songo Songo	Songo Songo Island	Tanzania			Africa/Dar_es_Salaam
7040	Jongomero Camp	Ruaha National Park	Tanzania			Africa/Dar_es_Salaam
7041	Msembe Airport	Msembe	Tanzania		HTMR	Africa/Dar_es_Salaam
7042	Fox Glacier Airstrip	Fox Glacier	New Zealand	FGL		Pacific/Auckland
7043	Grabtsevo Airport	Kaluga	Russia	KLF	UUBC	Europe/Moscow
7044	Reykjahlid	Reykjahlid	Iceland			Atlantic/Reykjavik
7045	Central Station	Stockholm	Sweden	XEV		Europe/Stockholm
7046	Central Station	Uppsala	Sweden	QYX		Europe/Stockholm
7047	Centraal	Rotterdam	Netherlands	QRH		Europe/Amsterdam
7048	Holesovice	Praha	Czech Republic	XYJ		Europe/Prague
7049	Hauptbahnhof	Bonn	Germany			Europe/Berlin
7050	Central	Copenhagen	Denmark	ZGH		Europe/Copenhagen
7051	Hauptbahnhof	Salzburg	Austria	ZSB		Europe/Vienna
7052	Centraal	Antwerp	Belgium	ZWE		Europe/Brussels
7053	Ellisras	Lephalale	South Africa	ELL	FAEA	Africa/Johannesburg
7054	Tri-County Regional Airport	Lone Rock	United States	LNR	KLNR	America/Chicago
7055	Price County Airport	Phillips	United States		KPBH	America/Chicago
7056	Monroe Municipal Airport	Monroe	United States		KEFT	America/Chicago
7057	Joliet Regional Airport	Joliet	United States	JOT	KJOT	America/Chicago
7058	Illinois Valley Regional Airport-Walter A Duncan Field	Peru	United States	VYS	KVYS	America/Chicago
7059	Dirk Hartog Island	Dirk Hartog Island	Australia		YDHD	Australia/Perth
7060	Jackson County Reynolds Field	Jackson	United States	JXN	KJXN	America/New_York
7061	Fuerstenwalde Airport	Furstenwalde	Germany		EDAL	Europe/Berlin
7062	Eberswalde-Finow Airport	Eberswalde	Germany		EDAV	Europe/Berlin
7063	Joseph A. Hardy Connellsville Airport	Connellsville	United States		KVVS	America/New_York
7064	Bedford County Airport	Bedford	United States		KHMZ	America/New_York
7065	Wings Field	Philadelphia	United States	BBX	KLOM	America/New_York
7066	Okeechobee County Airport	Okeechobee	United States	OBE	KOBE	America/New_York
7067	Sebring Regional Airport	Sebring	United States	SEF	KSEF	America/New_York
7068	Avon Park Executive Airport	Avon Park	United States	AVO	KAVO	America/New_York
7069	Winter Haven Regional Airport - Gilbert Field	Winter Haven	United States	GIF	KGIF	America/New_York
7070	Zephyrhills Municipal Airport	Zephyrhills	United States	ZPH	KZPH	America/New_York
7071	Ocala International Airport - Jim Taylor Field	Ocala	United States	OCF	KOCF	America/New_York
7072	Jesup Wayne County Airport	Jesup	United States		KJES	America/New_York
7073	Madison Municipal Airport	Madison	United States		K52A	America/New_York
7074	Newnan Coweta County Airport	Newnan	United States		KCCO	America/New_York
7075	Thomson-McDuffie County Airport	Thomson	United States		KHQU	America/New_York
7076	Aiken Regional Airport	Aiken	United States	AIK	KAIK	America/New_York
7077	Woodward Field	Camden	United States	CDN	KCDN	America/New_York
7078	Lumberton Regional Airport	Lumberton	United States	LBT	KLBT	America/New_York
7079	Ridgeland Airport	Ridgeland	United States	3J1		America/New_York
7080	Moore County Airport	Pinehurst-Southern Pines	United States	SOP	KSOP	America/New_York
7081	Richmond County Airport	Rockingham	United States		KRCZ	America/New_York
7082	Bamberg County Airport	Bamberg	United States	99N		America/New_York
7083	Richland Airport	Richland Center	United States	93C		America/Chicago
7084	Municipal Airport	Viroqua	United States	Y51		America/Chicago
7085	Baraboo Wisconsin Dells Airport	Baraboo	United States		KDLL	America/Chicago
7086	Foster Field	Apple River	United States	7A4		America/Chicago
7087	Statesville Regional Airport	Statesville	United States	SVH	KSVH	America/New_York
7088	Sylvania Airport	Sturtevant	United States	C89		America/Chicago
7089	Burlington Municipal Airport	Burlington	United States		KBUU	America/Chicago
7090	Stroudsburg-Pocono Airport	East Stroudsburg	United States	N53		America/New_York
7091	Spring Hill Airport	Sterling	United States	70N		America/New_York
7092	Randall Airport	Middletown	United States	06N		America/New_York
7093	William T. Piper Memorial Airport	Lock Haven	United States	LHV	KLHV	America/New_York
7094	Grove City Airport	Grove City	United States	29D		America/New_York
7095	Lansdowne Airport	Youngstown	United States	04G		America/New_York
7096	Wadsworth Municipal	Wadsworth	United States	3G3		America/New_York
7097	Ashland County Airport	Ashland	United States	3G4		America/New_York
7098	Pittsburgh-Monroeville Airport	Monroeville	United States	4G0		America/New_York
7099	Zelienople Municipal Airport	Zelienople	United States		KPJC	America/New_York
7100	Somerset County Airport	Somerset	United States	2G9		America/New_York
7101	Youngstown Elser Metro Airport	Youngstown	United States	4G4		America/New_York
7102	Braceville Airport	Braceville	United States	41N		America/New_York
7103	Lorain County Regional Airport	Lorain-Elyria	United States		KLPR	America/New_York
7104	Germack Airport	Geneva	United States	7D9		America/New_York
7105	Burke Lakefront Airport	Cleveland	United States	BKL	KBKL	America/New_York
7106	Chautauqua County-Dunkirk Airport	Dunkirk	United States	DKK	KDKK	America/New_York
7107	Hamburg Inc Airport	Hamburg	United States	4G2		America/New_York
7108	Trenton-Robbinsville Airport	Trenton	United States	N87		America/New_York
7109	South Jersey Regional Airport	Mount Holly	United States	LLY	KVAY	America/New_York
7110	Spitfire Aerodrome	Pedricktown	United States	7N7		America/New_York
7111	Linden Airport	Linden	United States	LDJ	KLDJ	America/New_York
7112	Morgantown Airport	Morgantown	United States	O03		America/New_York
7113	Harford County Airport	Churchville	United States	0W3		America/New_York
7114	Tri State Steuben County Airport	Angola	United States	ANQ	KANQ	America/New_York
7115	Plymouth Municipal Airport	Plymouth	United States	C65		America/New_York
7116	Warsaw Municipal Airport	Warsaw	United States		KASW	America/New_York
7117	Van Wert County Airport	Van Wert	United States		KVNW	America/New_York
7118	Port Bucyrus-Crawford County Airport	Bucyrus	United States	17G		America/New_York
7119	Lake Wales Municipal Airport	Lake Wales	United States	X07		America/New_York
7120	Brooks Field	Marshall	United States		KRMY	America/New_York
7121	Genesee County Airport	Batavia	United States		KGVQ	America/New_York
7122	Finger Lakes Regional Airport	Seneca Falls	United States	0G7		America/New_York
7123	Stormville Airport	Stormville	United States	N69		America/New_York
7124	Robertson Field	Plainville	United States	4B8		America/New_York
7125	Williams County Airport	Bryan	United States	0G6		America/New_York
7126	Clearwater Air Park	Clearwater	United States	CLW	KCLW	America/New_York
7127	South Lakeland Airport	Lakeland	United States	X49		America/New_York
7128	Scatsta Airport	Scatsta	United Kingdom			Europe/London
7129	North Sea	Buchan Alpha	United Kingdom			
7130	North Sea	Buchan Alpha	United Kingdom			
7131	North Sea	Claymore	United Kingdom		CLAA	
7132	North Sea	FPSO Anasuria	United Kingdom		ANAS	
7133	North Sea	BP Bruce	United Kingdom		BRU1	
7134	North Sea	Buchan Alpha	United Kingdom		BUCA	
7135	North Sea	Buzzard	United Kingdom		BUZZ	
7136	North Sea	Clyde	United Kingdom		CLY1	
7137	North Sea	Cormorant Alpha	United Kingdom		COA1	
7138	Orlampa Inc Airport	Forties Alpha	United Kingdom		FA08	America/New_York
7139	North Sea	Forties Charlie	United Kingdom		FC08	
7140	North Sea	Fulmar	United Kingdom		FUA1	
7141	North Sea	Gannet Alpha	United Kingdom		GAA1	
7142	North Sea	Montrose Alpha	United Kingdom		MOA1	
7143	North Sea	Tern	United Kingdom		TEA1	
7144	Atlantic Ocean	FPSO Xikomba	Angola		XKSO	
7145	Zoo	Berlin	Germany	QWC		Europe/Berlin
7146	Frankfurt Oder Hbf	Frankfurt Oder	Germany	ZFR		Europe/Berlin
7147	Gare de Lyon	Paris	France	PLY		Europe/Paris
7148	Gare de LEst	Paris	France	XHP		Europe/Paris
7149	All Airports	Paris	France	PAR		Europe/Paris
7150	Ostbahnhof	Berlin	Germany	BHF		Europe/Berlin
7151	All Airports	London	United Kingdom	LON		Europe/London
7152	All Airports	New York	United States	NYC		America/New_York
7153	All Airports	Chicago	United States	CHI		America/Chicago
7154	Chicago Meigs Airport	Chicago	United States	CGX	KCGX	America/Chicago
7155	All Airports	Tokyo	Japan	TYO		Asia/Tokyo
7156	All Airports	Beijing	China	BJS		Asia/Shanghai
7157	All Airports	Milan	Italy	MIL		Europe/Rome
7158	All Airports	Washington	United States	WAS		America/New_York
7159	All Airports	Montreal	Canada	YMQ		America/Toronto
7160	All Airports	Toronto	Canada	YTO		America/Toronto
7161	Longhua Airport	Shanghai	China		ZSSL	Asia/Shanghai
7162	Pickens County Airport	Jasper	United States		KJZP	America/New_York
7163	Gesundbrunnen	Berlin	Germany	BGS		Europe/Berlin
7164	Saarmund Airport	Saarmund	Germany		EDCS	Europe/Berlin
7165	Grand Strand Airport	North Myrtle Beach	United States	CRE	KCRE	America/New_York
7166	Sun Moon Lake Airport	Sun Moon Lake	Taiwan			Asia/Taipei
7167	Lansing Municipal Airport	Lansing	United States		KIGQ	America/Chicago
7168	Bloyer Field	Tomah	United States	Y72		America/Chicago
7169	Ramona Airport	Ramona	United States		KRNM	America/Los_Angeles
7170	Pont Sur Yonne Airfield	Pont Sur Yonne	France		LFGO	Europe/Paris
7171	St Florentin Cheu Airfield	St Florentin Cheu	France		LFGP	Europe/Paris
7172	Saulieu Liernais Airfield	Saulieu	France		LFEW	Europe/Paris
7173	Olten Airport	Olten	Switzerland		LSPO	Europe/Zurich
7174	Buochs Airport	Buochs	Switzerland	BXO	LSZC	Europe/Zurich
7175	Ambri Airport	Quinto	Switzerland		LSPM	Europe/Zurich
7176	Lodrino Air Base	Lodrino	Switzerland		LSML	Europe/Zurich
7177	Roudnice Airport	Roudnice nad Lebem	Czech Republic		LKRO	Europe/Prague
7178	Usti Nad Labem Airfield	Usti Nad Labem	Czech Republic		LKUL	Europe/Prague
7179	Mauterndorf Airport	Mauterndorf	Austria		LOSM	Europe/Vienna
7180	Nötsch Im Gailtal Airport	Notsch Im Gailtal	Austria		LOKN	Europe/Vienna
7181	Sinsheim Airfield	Karlsruhe	Germany		EDTK	Europe/Berlin
7182	Weinheim/Bergstraße Airport	Weinheim	Germany		EDGZ	Europe/Berlin
7183	Meaux Esbly Airport	Meaux	France		LFPE	Europe/Paris
7184	Château-Thierry - Belleau Airfield	Chateau-Thierry	France		LFFH	Europe/Paris
7185	Branch County Memorial Airport	Coldwater	United States		KOEB	America/New_York
7186	Wilkes Barre Wyoming Valley Airport	Wilkes-Barre	United States	WBW	KWBW	America/New_York
7187	Willoughby Lost Nation Municipal Airport	Willoughby	United States	LNN	KLNN	America/New_York
7188	Taoyuan Air Base	Taoyuan	Taiwan		RCGM	Asia/Taipei
7189	Uummannaq Heliport	Uummannaq	Greenland	UMD	BGUM	America/Godthab
7190	Civitavecchia	Civitavecchia	Italy			Europe/Rome
7191	Bayannur Tianjitai Airport	Bayannur	China	RLK	ZBYZ	Asia/Shanghai
7192	Capital City Airport	Frankfort	United States	FFT	KFFT	America/New_York
7193	Auburn Lewiston Municipal Airport	Lewiston	United States	LEW	KLEW	America/New_York
7194	Inowroclaw Military Air Base	Inowroclaw	Poland		EPIR	Europe/Warsaw
7195	Pruszcz Gdanski Air Base	Pruszcz Gdansk	Poland		EPPR	Europe/Warsaw
7196	Florence	Florence	United States	6S2		America/Los_Angeles
7197	Martin Campbell Field Airport	Copperhead	United States	1A3		America/New_York
7198	Sudkreuz	Berlin	Germany		BPAP	Europe/Berlin
7199	Naval Air Station	Glenview	United States	NBU	KNBU	America/Chicago
7200	Bloyer Field	Tomah	United States		KY72	America/Chicago
7201	Yongning Air Base	Beijing	China		CN-0	Asia/Shanghai
7202	Marco Island Executive Airport	Marco Island Airport	United States	MRK	KMKY	America/New_York
7203	Boipeba	Boipeba Island	Brazil			America/Fortaleza
7204	Boipeba	Boipeba Island	Brazil			America/Fortaleza
7205	Drummond Island Airport	Drummond Island	United States	DRE	KDRM	America/New_York
7206	Garland Airport	Lewiston	United States	8M8		America/New_York
7207	Gladwin Zettel Memorial Airport	Gladwin	United States	GDW	KGDW	America/New_York
7208	Lowell City Airport	Lowell	United States	24C		America/New_York
7209	South Haven Area Regional Airport	South Haven	United States		KLWA	America/New_York
7210	Schaumburg Regional	Schaumburg	United States	06C		America/Chicago
7211	Khulna Seaplane Landing Site	Khulna	Bangladesh			Asia/Dhaka
7212	Khulna Seaplane Landing Site	Khulna	Bangladesh			Asia/Dhaka
7213	Khulna Seaplane Landing Site	Khulna	Bangladesh			Asia/Dhaka
7214	Marshfield Municipal Airport	Marshfield	United States	MFI	KMFI	America/Chicago
7215	Alexander Field South Wood County Airport	Wisconsin Rapids	United States	ISW	KISW	America/Chicago
7216	Clinton Municipal Airport	Clinton	United States	CWI	KCWI	America/Chicago
7217	Wiescheid	Langenfeld	Germany			Europe/Berlin
7218	Wadi Rum	Wadi Rum Desert	Jordan			Asia/Amman
7219	Beverly Municipal Airport	Beverly	United States	BVY	KBVY	America/New_York
7220	Priob\\\\'e	Priob\\\\'e	Russia			Asia/Yekaterinburg
7221	Nagaur Airport	Nagaur	India		VI73	Asia/Calcutta
7222	Ostafyevo International Airport	Moscow	Russia	OSF	UUMO	Europe/Moscow
7223	Oakdale Airport	Oakdale	United States	O27		America/Los_Angeles
7224	Trois-Rivières Airport	Trois Rivieres	Canada	YRQ	CYRQ	America/Toronto
7225	Poplar Bluff Municipal Airport	Poplar Bluff	United States	POF	KPOF	America/Chicago
7226	Somerset Airport	Somerville	United States		KSMQ	America/New_York
7227	Eastport Municipal Airport	Eastport	United States		KEPM	America/New_York
7228	Keokuk Municipal Airport	Keokuk	United States	EOK	KEOK	America/Chicago
7229	Banks Airport	Swans Island	United States	ME5		America/New_York
7230	Perth/Scone Airport	Perth	United Kingdom	PSL	EGPT	Europe/London
7231	Caernarfon Airport	Caernarfon	United Kingdom		EGCK	Europe/London
7232	Grefrath-Niershorst Airport	Grefrath	Germany		EDLF	Europe/Berlin
7233	Offenburg	Offenburg	Germany			Europe/Berlin
7234	Oberwolfach	Oberwolfach	Germany			Europe/Berlin
7235	Karlsruhe Hbf	Karlsruhe	Germany			Europe/Berlin
7236	Lichtenwalde	Lichtenwalde	Germany			Europe/Berlin
7237	Karlsruhe	Karlsruhe	Germany			Europe/Berlin
7238	Holzhau	Holzhau	Germany			Europe/Berlin
7239	Porto	Porto	Portugal			Europe/Rome
7240	Lisboa-Oriente	Lisboa	Portugal			
7241	Bad Herrenalb	Bad Herrenalb	Germany			Europe/Berlin
7242	St Paul Downtown Holman Field	St. Paul	United States	STP	KSTP	America/Chicago
7243	Söderhamn Airport	Soderhamn	Sweden	SOO	ESNY	Europe/Stockholm
7244	Newcastle Aerodrome	Newcastle	Ireland		EINC	Europe/Dublin
7245	Saravane Airport	Saravane	Laos	VNA	VLSV	Asia/Vientiane
7246	Lisboa-Oriente	Lisboa	Portugal			
7247	Lisboa-Oriente	Lisboa-Oriente	Portugal			Europe/Lisbon
7248	Zurich	Zurich	Switzerland			Europe/Zurich
7249	Bagdad Airport	Bagdad	United States	E51		America/Phoenix
7250	Segeletz Airport	Segeletz	Germany		EDAI	Europe/Berlin
7251	Fuentemilanos Airport	Segovia	Spain		LEFM	Europe/Madrid
7252	Akeno Airport	Akeno	Japan		RJOE	Asia/Tokyo
7253	Ust-Kamchatsk Airport	Ust Kamchatsk	Russia		UHPK	Asia/Anadyr
7254	Oconomowoc Airport	Oconomowoc	United States		0WI8	America/Chicago
7255	Kozyrevsk Airport	Kozyrevsk	Russia		UHPO	Asia/Anadyr
7256	Dikson Airport	Dikson	Russia	DKS	UODD	Asia/Krasnoyarsk
7257	Beverley Airport	Mine Site	Australia		YBEE	Australia/Adelaide
7258	Bogande Airport	Bogande	Canada	XBG		America/Toronto
7259	Bantry Aerodrome	Bantry	Ireland	BYT	EIBN	Europe/Dublin
7260	Reeroe Airport	Caherciveen	Ireland	CHE		Europe/Dublin
7261	Aliwal North Airport	Aliwal North	South Africa		FAAN	Africa/Johannesburg
7262	Alkantpan Copper Airport	Alkantpan	South Africa		FACO	Africa/Johannesburg
7263	Alldays Airport	Alldays	South Africa	ADY	FAAL	Africa/Johannesburg
7264	Bredasdorp Airport	Barberton	South Africa		FABR	Africa/Johannesburg
7265	Ocean Ridge Airport	Gualala	United States	E55		America/Los_Angeles
7266	Kent State Airport	Kent	United States	1G3		America/New_York
7267	Butler Co Regional Airport - Hogan Field	Hamilton	United States	HAO	KHAO	America/New_York
7268	Bungoma Airport	Bungoma	Kenya		HKBU	Africa/Nairobi
7269	Bura East Airport	Bura	Kenya		HKBR	Africa/Nairobi
7270	Busia Airport	Busia	Kenya		HKBA	Africa/Nairobi
7271	Embu Airport	Embu	Kenya		HKEM	Africa/Nairobi
7272	Garba Tula Airport	Garba Tula	Kenya		HKGT	Africa/Nairobi
7273	Garissa Airport	Garissa	Kenya	GAS	HKGA	Africa/Nairobi
7274	Hola Airport	Hola	Kenya	HOA	HKHO	Africa/Nairobi
7275	Homa Bay Airport	Homa Bay	Kenya		HKHB	Africa/Nairobi
7276	Isiolo Airport	Isiolo	Kenya		HKIS	Africa/Nairobi
7277	Kalokol	Kalokol	Kenya	KLK	HYFG	Africa/Nairobi
7278	Kericho Airport	Kericho	Kenya	KEY	HKKR	Africa/Nairobi
7279	Kilaguni Airport	Kilaguni	Kenya	ILU	HKKL	Africa/Nairobi
7280	Kerio Valley	Kimwarer	Kenya	KRV		Africa/Nairobi
7281	Andavadoaka	Andavadoaka	Madagascar	DVD		Indian/Antananarivo
7282	Antsirabe Airport	Antsirabe	Madagascar	ATJ	FMME	Indian/Antananarivo
7283	Bekily Airport	Bekily	Madagascar	OVA	FMSL	Indian/Antananarivo
7284	Ust-Tsylma Airport	Ust-Tsylma	Russia	UTS	UUYX	Europe/Moscow
7285	Atlantic City Rail Terminal	Atlantic City NJ	United States	ZRA		America/New_York
7286	Springfield Amtrak Station	Springfield MA	United States	ZSF		America/New_York
7287	Amherst Amtrak Station AMM	Amherst MA	United States	XZK		America/New_York
7288	Cape May Ferry Terminal	Cape May NJ	United States			America/New_York
7289	Lewes Ferry Terminal	Lewes DE	United States			America/New_York
7290	Bar Harbor Yarmouth Ferry Terminal	Bar Harbor ME	United States			America/New_York
7291	Yarmouth Ferry Terminal	Yarmouth NS	Canada			America/Halifax
7292	Gare de Montreux Railway Station	Montreux	Switzerland			Europe/Zurich
7293	London - Kings Cross	London	United Kingdom	QQK		Europe/London
7294	Stevenage Railway Station	Stevenage	United Kingdom	XVJ		Europe/London
7295	Peterborough Railway Station	Peterborough	United Kingdom	XVH		Europe/London
7296	Pomalaa	Pomalaa	Indonesia	PUM		Asia/Makassar
7297	St. Ignace Ferry Dock	St. Ignace MI	United States			America/New_York
7298	Mackinac Island Dock	Mackinac Island MI	United States			America/New_York
7299	YUR'EVETS	YUR'EVETS	Russia		UUIC	Europe/Moscow
7300	Whittlesford Parkway Rail Station	Whittlesford	United Kingdom	WLF		Europe/London
7301	Gorno-Altaysk Airport	Gorno-Altaysk	Russia	RGK	UNBG	Asia/Krasnoyarsk
7302	Gryzliny - Lansk	Gryzliny	Poland		EPGR	Europe/Warsaw
7303	Fond du Lac County Airport	Fond du Lac	United States	FLD	KFLD	America/Chicago
7304	Waupaca Municipal Airport	Waupaca	United States		KPCZ	America/Chicago
7305	Stevens Point Municipal Airport	Stevens Point	United States	STE	KSTE	America/Chicago
7306	Mys Shmidta Airport	Mys Shmidta	Russia		UHMI	Asia/Anadyr
7307	Moma Airport	Honuu	Russia	MQJ	UEMA	Asia/Srednekolymsk
7308	Luce County Airport	Newberry	United States		KERY	America/New_York
7309	Forest Lake Airport	Forest Lake	United States	25D		America/Chicago
7310	Hannover Messe-Heliport	Hannover	Germany	ZVM		Europe/Berlin
7311	Peenemünde Airport	Peenemunde	Germany	PEF	EDCP	Europe/Berlin
7312	Góraszka Airport	Goraszka	Poland		EPGO	Europe/Warsaw
7313	Nusawiru Airport	Nusawiru	Indonesia	CJN	WI1A	Asia/Jakarta
7314	Pom Pom Camp	Pom Pom	Botswana			Africa/Gaborone
7315	Moremi Crossing	Moremi	Botswana			Africa/Gaborone
7316	New Delhi Train Station	New Delhi	India			Asia/Calcutta
7317	Agra Cantonment Railway Station	Agra	India			Asia/Calcutta
7318	Urumqi Railway Station	Urumqi	China			Asia/Shanghai
7319	Turpan Railway Station	Turpan	China			Asia/Shanghai
7320	Galion Municipal Airport	Galion	United States	GQQ	KGQQ	America/New_York
7321	Musiara Airstrip	Musiara	Kenya		HKMZ	Africa/Nairobi
7322	Tiputini Airport	Tiputini	Ecuador	TPN	SETI	America/Guayaquil
7323	Rio Amazonas Airport	Pastaza	Ecuador	PTZ	SESM	America/Guayaquil
7324	Clarksville–Montgomery County Regional Airport	Clarksville	United States	CKV	KCKV	America/Chicago
7325	Oban Rail Station	Oban	United Kingdom			Europe/London
7326	Memmingen Rail Station	Memmingen	Germany			Europe/Berlin
7327	Ulm Railway Station	Ulm	Germany			Europe/Berlin
7328	Aachen HBF	Aachen	Germany			Europe/Berlin
7329	Liege-Guillemins Railway Station	Liege	Belgium	XHN		Europe/Brussels
7330	Bruxelles-Central	Brussels	Belgium		FBCL	Europe/Brussels
7331	Wyk auf Foehr	Wyk	Germany	OHR		Europe/Berlin
7332	Lompoc Airport	Lompoc	United States	LPC	KLPC	America/Los_Angeles
7333	Chester County G O Carlson Airport	Coatesville	United States	CTH	KMQS	America/New_York
7334	Bost Airport	Lashkar Gah	Afghanistan	BST	OABT	Asia/Kabul
7335	Lankaran International Airport	Lankaran	Azerbaijan	LLK	UBBL	Asia/Baku
7336	Gabala International Airport	Qabala	Azerbaijan	GBB	UBBQ	Asia/Baku
7337	Zaqatala International Airport	Zaqatala	Azerbaijan	ZTU	UBBY	Asia/Baku
7338	Lake Placid Airport	Lake Placid	United States	LKP	KLKP	America/New_York
7339	Long Lake	Long Lake	United States	NY9		America/New_York
7340	Typliy Klyuch Airport	Khandyga	Russia	KDY	UEMH	Asia/Yakutsk
7341	Magan Airport	Yakutsk	Russia	GYG	UEMM	Asia/Yakutsk
7342	Qianjiang Wulingshan Airport	Qianjiang	China	JIQ	ZUQJ	Asia/Shanghai
7343	Cooma Hospital Helipad	Yuzhno-Kurilsk	Russia		YXCM	Australia/Sydney
7344	Wishram Amtrak Station	Wishram	United States	WIH		America/Los_Angeles
7345	Lima Allen County Airport	Lima	United States	AOH	KAOH	America/New_York
7346	Sondok Airport	Hamhung	North Korea	DSO	ZKSD	Asia/Pyongyang
7347	Samjiyon Airport	Samjiyon	North Korea	YJS		Asia/Pyongyang
7348	Geiranger	Geiranger Fjord	Norway			Europe/Oslo
7349	Gangtok Helipad	Gangtok	India			Asia/Calcutta
7350	Malcolm McKinnon Airport	Brunswick	United States	SSI	KSSI	America/New_York
7351	Beaver County Airport	Beaver Falls	United States	BFP	KBVI	America/New_York
7352	Seaplane Base	Winterhaven	United States	F57		America/New_York
7353	Georgetown County Airport	Georgetown	United States	GGE	KGGE	America/New_York
7354	Hardwick Field	Cleveland	United States	HDI	KHDI	America/New_York
7355	Mark Anton Airport	Dayton	United States	2A0		America/New_York
7356	Jefferson County Airpark	Steubenville	United States	2G2		America/New_York
7357	Renton Municipal Airport	Renton	United States	RNT	KRNT	America/Los_Angeles
7358	Brackett Field	La Verne	United States	POC	KPOC	America/Los_Angeles
7359	Jekyll Island Airport	Jekyll Island	United States	09J		America/New_York
7360	CedarKey	Cedar Key	United States	CDK	KCDK	America/New_York
7361	Cross City Airport	Cross City	United States	CTY	KCTY	America/New_York
7362	Oconee County Regional Airport	Clemson	United States	CEU	KCEU	America/New_York
7363	Heber City Municipal Airport	Heber	United States	36U		America/Denver
7364	Beech Factory Airport	Wichita	United States	BEC	KBEC	America/Chicago
7365	Cherokee County Airport	Canton	United States	47A		America/New_York
7366	Fernandina Beach Municipal Airport	Fernandina Beach	United States	55J		America/New_York
7367	Tabing Airport	Padang	Indonesia		WIMG	Asia/Jakarta
7368	Tom B. David Field	Calhoun	United States		KCZL	America/New_York
7369	Habersham County Airport	Cornelia	United States		KAJR	America/New_York
7370	Hamburg Hbf	Hamburg	Germany	ZMB		Europe/Berlin
7371	Georgetown Municipal Airport	Georgetown	United States		KGTU	America/Chicago
7372	Old Rhinebeck Airport	Rhinebeck	United States		NY94	America/New_York
7373	Duxford Aerodrome	Duxford	United Kingdom	QFO	EGSU	Europe/London
7374	BLABU	Blankenburg	Germany			Europe/Berlin
7375	Sidney Municipal-Lloyd W Carr Field	Sidney	United States	SNY	KSNY	America/Denver
7376	Newnan Hospital Heliport	Bengassi	Mali		GA46	Africa/Bamako
7377	Schofields Aerodrome	Schofields	Australia			Australia/Sydney
7378	Luray Caverns Airport	Luray	United States		KLUA	America/New_York
7379	Eagle's Nest Airport	Waynesboro	United States	W13		America/New_York
7380	Great Keppel Is Airport	Great Keppel Island	Australia	GKL	YGKL	Australia/Brisbane
7381	Roper Bar Airport	Roper Bar	Australia	RPB	YRRB	Australia/Darwin
7382	Mount Garnet Airport	Mount Garnet	Australia		YMRT	Australia/Brisbane
7383	Innisfail Airport	Innisfail	Australia	IFL	YIFL	Australia/Brisbane
7384	Kalaeloa Airport	Kapolei	United States	JRF	PHJR	Pacific/Honolulu
7385	Bamiyan Airport	Bamyan	Afghanistan	BIN	OABN	Asia/Kabul
7386	Changbaishan Airport	Baishan	China	NBS	ZYBS	Asia/Shanghai
7387	SFO Helicopter	Sausalito	United States			America/Los_Angeles
7388	Lewa Airport	Lewa Downs	Kenya			Africa/Nairobi
7389	Huaorani Ecolodge	Huaorani	Ecuador			America/Guayaquil
7390	Orang Airport	Chongjin	North Korea	RGO	ZKHM	Asia/Pyongyang
7391	Moomba Airport	Moomba	Australia	MOO	YOOM	Australia/Adelaide
7392	Lublin Airport	Lublin	Poland	LUZ	EPLB	Europe/Warsaw
7393	Iosco County Airport	East Tawas	United States	ECA	K6D9	America/New_York
7394	Madison County Executive Airport-Tom Sharp Jr Field	Huntsville	United States		KMDQ	America/Chicago
7395	Leesburg Executive Airport	Leesburg	United States		KJYO	America/New_York
7396	CNC4	Guelph	Canada			America/Toronto
7397	CNC4	Geulph	Canada			America/Toronto
7398	Anoka County-Blaine (Janes Field) Airport	Anoka	United States		KANE	America/Chicago
7399	Robinson Crusoe Airport	San Juan Bautista	Chile		SCIR	America/Santiago
7400	Villa Airport	Maamigili	Maldives	VAM	VRMV	Indian/Maldives
7401	Hilton Iru fushi	Maldives Hilton Iru fushi	Maldives	IRU	IRUF	Indian/Maldives
7402	Dhigurah Centara Grand Maldives	Dhigurah	Maldives	DHG	DHGU	Indian/Maldives
7403	Beijing Railway Station	Beijing	China			Asia/Shanghai
7404	Chengde Railway Station	Chengde	China			Asia/Shanghai
7405	Lingling Airport	Yongzhou	China	LLF	ZGLG	Asia/Shanghai
7406	Lošinj Island Airport	Mali Losinj	Croatia	LSZ	LDLO	Europe/Zagreb
7407	Onslow Airport	Onslow	Australia	ONS	YOLW	Australia/Perth
7408	Theodore Airport	Theodore	Australia	TDR	YTDR	Australia/Brisbane
7409	RUDNIKI 	RUDNIKI	Poland	CZW	EPRU	Europe/Warsaw
7410	Williamson Sodus Airport	Williamson	United States		KSDC	America/New_York
7411	Clear Lake Metroport	Clear Lake City	United States	CLC		America/Chicago
7412	Gilberto Lavaque	Cafayate	Argentina	CFX	SASC	America/Argentina/Salta
7413	Fairoaks Airport	Fairoaks	United Kingdom		EGTF	Europe/London
7414	Boulder Municipal Airport	Boulder	United States	WBU	KBDU	America/Denver
7415	Neustadt-Glewe Airport	Neustadt-Glewe	Germany		EDAN	Europe/Berlin
7416	Berchtesgarden BKS	Bischofswiesen	Germany			Europe/Berlin
7417	Hohe Duene	Warnemuende	Germany		ETMW	Europe/Berlin
7418	Sannvhe	Tangshan	China	TVS	ZBSN	Asia/Shanghai
7419	Goetsenhoven Air Base	GOETSENHOVEN	Belgium		EBTN	Europe/Brussels
7420	Tutow Airport	Wildenrath	Germany		EDUW	Europe/Berlin
7421	Bremgarten Airport	Bremgarten	Germany		EDTG	Europe/Berlin
7422	Bitburg Airport	Birburg	Germany	BBJ	EDRB	Europe/Berlin
7423	Toul AB closed	Toul	France			Europe/Paris
7424	Palo Alto Airport of Santa Clara County	Palo Alto	United States	PAO	KPAO	America/Los_Angeles
7425	Dubai Cruise Terminal	Dubai	United Arab Emirates			Asia/Dubai
7426	Ust-Nera Airport	Ust-Nera	Russia	USR	UEMT	Asia/Vladivostok
7427	Letiště Vysoké Mýto	Vysoke Myto	Czech Republic		LKVM	Europe/Prague
7428	Spa (la Sauvenière) Airfield	Spa	Belgium		EBSP	Europe/Brussels
7429	Falcon Field	Mesa	United States	MSC	KFFZ	America/Phoenix
7430	Coolidge Municipal Airport	Cooldige	United States		KP08	America/Phoenix
7431	Cottonwood Airport	Cottonwood	United States		KP52	America/Phoenix
7432	Namur-Suarlée Airfield	Namur	Belgium		EBNM	Europe/Brussels
7433	Kiewit Airfield Hasselt	Hasselt	Belgium		EBZH	Europe/Brussels
7434	Ak-Chin Regional Airport	Phoenix	United States		KA39	America/Phoenix
7435	Wickenburg Municipal Airport	Wickenburg	United States		KE25	America/Phoenix
7436	Yangzhou Taizhou Airport	Yangzhou	China	YTY	ZSYA	Asia/Shanghai
7437	Oakland County International Airport	Pontiac	United States	PTK	KPTK	America/New_York
7438	Fuzhou Railway Station	Fuzhou	China			Asia/Shanghai
7439	Xiamen Railway Station	Xiamen	China			Asia/Shanghai
7440	Kissidougou Airport	Kissidougou	Guinea	KSI	GUKU	Africa/Conakry
7441	Pecs	Pecs	Hungary	QPJ		Europe/Budapest
7442	Neuwied	Neuwied	Germany			Europe/Berlin
7443	Castelnuovo di Garfagnana	Castelnuovo di Garfagnana	Italy			Europe/Rome
7444	Portovenere	Portovenere	Italy			Europe/Rome
7445	Amsterdam Zuid WTC	Amsterdam	Netherlands			Europe/Amsterdam
7446	Budapest Keteli	Budapest	Hungary			Europe/Budapest
7447	Zagreb Glavni Kolod.	Zagreb	Croatia			Europe/Zagreb
7448	Dillant Hopkins Airport	Keene	United States	EEN	KEEN	America/New_York
7449	Tianshui Maijishan Airport	Tianshui	China	THQ	ZLTS	Asia/Shanghai
7450	Kawama Airport	Kawama	Cuba	VRO	MUKW	America/Havana
7451	Yumuri Valley	Yumuri Valley	Cuba			America/Havana
7452	Kooddoo Airport	Kooddoo	Maldives	GKK	VRMO	Indian/Maldives
7453	Glasgow Industrial Airport	Glasgow	United States		07MT	America/Denver
7454	Rochester Airport	Rochester	United Kingdom	RCS	EGTO	Europe/London
7455	Den Haag Centraal	Den Haag	Netherlands			Europe/Amsterdam
7456	Paris Nord	Paris	France			Europe/Paris
7457	Venlo railway station	Venlo	Netherlands			Europe/Amsterdam
7458	Monchengladbach Central Station	Monchengladbach	Germany			Europe/Berlin
7459	Utrecht Centraal	Utrecht 	Netherlands			Europe/Amsterdam
7460	Rensselaer Rail Station	Albany	United States			America/New_York
7461	Amtrak Station	Tacoma	United States			America/Los_Angeles
7462	Amtrak Station	Orlando	United States			America/New_York
7463	Denali Rail	Healy	United States			America/Anchorage
7464	Albian Aerodrome	Wood Buffalo	Canada	JHL		America/Edmonton
7465	Monroe Reqional Airport	Charlotte	United States	EQY		America/New_York
7466	Station Aare	Aare	Sweden			Europe/Stockholm
7467	Villach Hauptbahnhof	Villach	Austria			Europe/Vienna
7468	Krakow Glowny	Krakow	Poland			Europe/Warsaw
7469	Wien Meidling	Vienna	Austria			Europe/Vienna
7470	Roma Termini	Rome	Italy			Europe/Rome
7471	Napoli Centrale	Naples	Italy			Europe/Rome
7472	Euston Station	London	United Kingdom			Europe/London
7473	Kankan	Kankan	Guinea	KNN	GUXD	Africa/Conakry
7474	Termas de Río Hondo international Airport	Rio Hondo	Argentina	RHD	SANR	America/Cordoba
7475	Guangzhou Railway Station	Guangzhou	China			Asia/Shanghai
7476	Shenzhen West Railway Station	Shenzhen	China			Asia/Shanghai
7477	Shenzhen North Railway Station	Shenzhen	China			Asia/Shanghai
7478	Keetmanshoop Airport	Keetmanshoop	Namibia	KMP	FYKT	Africa/Windhoek
7479	Shekou Ferry Terminal	Shenzhen	China			Asia/Shanghai
7480	Zhuhai-Jiuzhou Port	Zhuhai	China			Asia/Shanghai
7481	Kangding Airport	Kangding	China	KGT	ZUKD	Asia/Shanghai
7482	Train Station	Aranyaprathet	Thailand			Asia/Bangkok
7483	Train Station	Nha Trang	Vietnam			Asia/Saigon
7484	Velikiy Ustyug Airport	Veliky Ustyug	Russia	VUS	ULWU	Europe/Moscow
7485	Iowa City Municipal Airport	Iowa City	United States	IOW	KIOW	America/Chicago
7486	Turpan Jiaohe Airport	Turpan	China	TLQ	ZWTP	Asia/Shanghai
7487	Lorenzo Airport	Morro de Sao Paulo	Brazil		SNCL	America/Fortaleza
7488	Windom Municipal Airport	Windom	United States		KMWM	America/Chicago
7489	Sasakwa Airstrip	Sasakwa	Tanzania			Africa/Dar_es_Salaam
7490	Yabuli	Yabuli Town	China			Asia/Shanghai
7491	Longview Ranch Airport	Longview	United States		OG39	America/Los_Angeles
7492	Rothera Research Station	Rothera Research Station	United Kingdom		EGAR	Antarctica/South_Pole
7493	Sortavala Airport	Sortavala	Russia		ULPW	Europe/Moscow
7494	Valaam	Valaam	Russia			Europe/Moscow
7495	Lee Airport	Annapolis	United States	ANP	KANP	America/New_York
7496	Songshan Train Station	Taipei	Taiwan			Asia/Taipei
7497	Kaohsiung Station	Kaohsiung	Taiwan			Asia/Taipei
7498	Hualien Station	Hualien	Taiwan			Asia/Taipei
7499	El Merk	El Merk	Algeria			Africa/Algiers
7500	Budapest Keleti pu.	Budapest	Hungary			
7501	Bratislava hl. st.	Bratislava	Slovakia			
7502	Ndutu	Ndutu	Tanzania	DUU	HTND	Africa/Dar_es_Salaam
7503	Cuamba Airport	Cuamba	Mozambique	FXO	FQCB	Africa/Maputo
7504	Bodaybo Airport	Bodaibo	Russia	ODO	UIKB	Asia/Irkutsk
7505	Berdoba Airport	Berdoba	Chad			Africa/Ndjamena
7506	Zhytomyr Airport	Zhytomyr	Ukraine	ZTR	UKKV	Europe/Kiev
7507	Mozyr	Mozyr	Belarus		UMGM	Europe/Minsk
7508	Paluknys Airport	Paluknys	Lithuania		EYVP	Europe/Vilnius
7509	Mattala Rajapaksa International Airport	Mattala	Sri Lanka	HRI	VCRI	Asia/Colombo
7510	Pecos Municipal Airport	Pecos	United States	PEQ	KPEQ	America/Chicago
7511	Hattiesburg Bobby L Chain Municipal Airport	Hattiesburg	United States	HBG	KHBG	America/Chicago
7512	Botucatu - Tancredo de Almeida Neves Airport	Botucatu	Brazil	QCJ	SDBK	America/Sao_Paulo
7513	Base Aérea Airport	Anapolis	Brazil		SBAN	America/Sao_Paulo
7514	Mário Pereira Lopes–São Carlos Airport	Sao Carlos	Brazil	QSC	SDSC	America/Sao_Paulo
7515	Byron Airport	Byron Bay	Australia			
7516	Grindelwald	Grindelwald	Switzerland			Europe/Zurich
7517	Grindelwald	Grindelwald	Switzerland			Europe/Zurich
7518	Chan Gurney Municipal Airport	Yankton	United States	YKN	KYKN	America/Chicago
7519	Selfield Airport	Selma Alabama	United States	SES	KSES	America/Chicago
7520	Linkwasha Airfield	Hwange National Park	Zimbabwe			Africa/Harare
7521	Sir Bani Yas Airport	Sir Bani Yas Island	United Arab Emirates	XSB	OMBY	Asia/Dubai
7522	Dalma Airport	Dalma Island	United Arab Emirates	ZDY		Asia/Dubai
7523	Bromont (Roland Desourdy) Airport	Bromont	Canada	ZBM	CZBM	America/Toronto
7524	Playa del Carmen Airport	Playa del Carmen	Mexico	PCM		America/Cancun
7525	Beccles Airport	Beccles	United Kingdom		EGSM	Europe/London
7526	Kratie Airport	Kratie	Cambodia	KTI	VDKT	Asia/Phnom_Penh
7527	Caldera Airport	Caldera	Chile		SCCL	America/Santiago
7528	San Pedro de Atacama Airport	San Pedro de Atacama	Chile		SCPE	America/Santiago
7529	Copacabana Airport	Copacabana	Bolivia		SLCC	America/La_Paz
7530	Havelock Island Seaport	Havelock Island	India			Asia/Calcutta
7531	Guyuan Liupanshan Airport	Guyuan	China	GYU	ZLGY	Asia/Shanghai
7532	RAF Brawdy	Brawdy	United Kingdom		EGDA	Europe/London
7533	Gaios Bay	Paxi	Greece			Europe/Athens
7534	Changhai Airport	Changhai	China	CNI	ZYCH	Asia/Shanghai
7535	Redhill Aerodrome	Redhill	United Kingdom	KRH	EGKR	Europe/London
7536	Bahnhof	Bad Gastein	Austria			Europe/Vienna
7537	Acquafredda Station	Maratea	Italy			Europe/Rome
7538	Victoria Station	London	United Kingdom			Europe/London
7539	Jiagedaqi Airport	Jiagedaqi District	China	JGD	ZYJD	Asia/Shanghai
7540	Chinchilla Airport	Chinchilla	Australia	CCL	YCCA	Australia/Brisbane
7541	Frazier Lake Airpark	Hollister	United States	1C9		America/Vancouver
7542	Hayward Executive Airport	Hayward	United States	HWD	KHWD	America/Los_Angeles
7543	Motueka Airport	Motueka	New Zealand	MZP	NZMK	Pacific/Auckland
7544	Shute Harbour Airport	Shute Harbour	Australia	JHQ	YSHR	Australia/Brisbane
7545	Enstone Aerodrome	Enstone	United Kingdom		EGTN	Europe/London
7546	Portoferrario Cruise Terminal	Portoferrario	Italy			Europe/Rome
7547	Pittsburgh Amtrak	Pittsburgh	United States			America/New_York
7548	Raton Amtrak	Raton	United States			America/Denver
7549	Ann Arbor Municipal Airport	Ann Arbor	United States	ARB	KARB	America/New_York
7550	Myrdal Station	Myrdal	Norway			Europe/Oslo
7551	Flam Station	Flam	Norway			Europe/Oslo
7552	Leikanger Terminal	Leikanger	Norway			Europe/Oslo
7553	North Sea	Gryphon FPSO	United Kingdom		GRY1	
7554	Shepparton Airport	Shepparton	Australia	SHT	YSHT	Australia/Hobart
7555	Temora Airport	Temora	Australia	TEM	YTEM	Australia/Sydney
7556	Gayndah Airport	Gayndah	Australia	GAH	YGAY	Australia/Brisbane
7557	Popondetta	Popondetta	Papua New Guinea	EIA		Pacific/Port_Moresby
7558	Wilcannia Airport	Wilcannia	Australia	WIO	YWCA	Australia/Sydney
7559	Bollards Lagoon	Bollards Lagoon Station	Australia			Australia/Adelaide
7560	Delamere Range	Delamere Range	Australia			Australia/Darwin
7561	Ivanhoe Airport	Ivanhoe	Australia		YIVO	Australia/Sydney
7562	Menindee Airport	Menindee	Australia		YMED	Australia/Sydney
7563	Naduri	Naduri	Papua New Guinea			Pacific/Port_Moresby
7564	Pooncarie Airport	Pooncarie	Australia		YPCE	Australia/Sydney
7565	Wiawera Station	Wiawera station	Australia			Australia/Adelaide
7566	Tilpa Airport	Tilpa	Australia		YTLP	Australia/Sydney
7567	Yarramba Station	Yarramba Station	Australia			Australia/Adelaide
7568	Reichenbach Air Base	Reichenbach im Kandertal	Switzerland		LSGR	Europe/Zurich
7569	Takayama Station	Takayama	Japan			Asia/Tokyo
7570	Himeji Station	Himeji	Japan			Asia/Tokyo
7571	Miyajimaguchi Station	Miyajimaguchi	Japan			Asia/Tokyo
7572	Miyajima Port	Miyajima	Japan			Asia/Tokyo
7573	Brown Bluff Port	Brown Bluff	Antarctica			Antarctica/South_Pole
7574	Devil Island Port	Devil Island	Antarctica			Antarctica/South_Pole
7575	Gourdin Island Port	Gourdin Island	Antarctica			Antarctica/South_Pole
7576	Cuverville Island Port	Cuverville Island	Antarctica			Antarctica/South_Pole
7577	Neko Harbor	Neko Harbor	Antarctica			Antarctica/South_Pole
7578	Port Lockroy	Port Lockroy	Antarctica			Antarctica/South_Pole
7579	Walker Bay	Walker Bay	Antarctica			Antarctica/South_Pole
7580	Whalers Bay	Deception Island	Antarctica			Antarctica/South_Pole
7581	Labadee Port	Labadee	Haiti			America/Port-au-Prince
7582	Lagos Lagoon	Lekki	Nigeria			Africa/Lagos
7583	Escravos	Escravos	Nigeria			Africa/Lagos
7584	Volosovo	Volosovo	Russia		XUMW	Europe/Moscow
7585	Bijie Feixiong Airport	Bijie	China	BFJ	ZUBJ	Asia/Shanghai
7586	Lensk Airport	Lensk	Russia	ULK	UERL	Asia/Yakutsk
7587	Fairbanks Train Depot	Fairbanks	United States			America/Anchorage
7588	Denali Train Depot	Denali	United States			America/Anchorage
7589	Talkeetna Train Depot	Talkeetna	United States			America/Anchorage
7590	Anchorage Rail Depot	Anchorage	United States			America/Anchorage
7591	Whittier Port	Whittier	United States			America/Anchorage
7592	Qingdao Railway Station	Qingdao	China			Asia/Shanghai
7593	Beijing South Railway Station	Beijing	China			Asia/Shanghai
7594	Shanghai Railway Station	Shanghai	China			Asia/Shanghai
7595	Suzhou Railway Station	Suzhou	China			Asia/Shanghai
7596	Biluty	Khamar-Daban	Russia			Asia/Irkutsk
7597	Shumak	Khamar-Daban	Russia			Asia/Irkutsk
7598	Shumak	Khamar-Daban	Russia			Asia/Irkutsk
7599	Kitoi	Khamar-Daban	Russia			Asia/Irkutsk
7600	Kitoi	Khamar-Daban	Russia			Asia/Irkutsk
7601	Angasolka	Baikal	Russia			Asia/Irkutsk
7602	Kavalerovo Airport	Kavalerovo	Russia	KVR	UHWK	Asia/Vladivostok
7603	Iğdır Airport	Igdir	Turkey	IGD	LTCT	Europe/Istanbul
7604	Şanlıurfa GAP Airport	Sanliurfa	Turkey	GNY	LTCS	Europe/Istanbul
7605	Zafer Airport	Kutahya	Turkey	KZR	LTBZ	Europe/Istanbul
7606	Barentsburg	Barentsburg	Svalbard			Arctic/Longyearbyen
7607	Piramida	Piramida	Svalbard			Arctic/Longyearbyen
7608	Velikiye Luki Airport	Velikiye Luki	Russia	VLU	ULOL	Europe/Moscow
7609	Boston Back Bay Station	Boston	United States	ZTY		America/New_York
7610	Burlington GO Station	Burlington	Canada			America/Toronto
7611	Niagra Falls Railway Station	Niagra Falls	Canada			America/New_York
7612	Niagara Falls Station	Niagara Falls	United States			America/New_York
7613	Yelahanka Air Force Station	Bangalore	India		VOYK	Asia/Calcutta
7614	Yeltsovka Airport	Novosibirsk	Russia		UNNE	Asia/Krasnoyarsk
7615	Veligandu Resort	Veligandu	Maldives			Indian/Maldives
7616	Kuramathi	Kuramathi	Maldives			Indian/Maldives
7617	Olkiombo Airstrip	Masai Mara	Kenya		HKOK	Africa/Nairobi
7618	Shanghai South Railway Station	Shanghai	China			Asia/Shanghai
7619	Suzhou North Railway Station	Suzhou	China			Asia/Shanghai
7620	Ulithi	Ulithi	Micronesia	ULI		Pacific/Truk
7621	Mar-Kuel	Mar-Kuel	Russia		UHHK	Asia/Vladivostok
7622	Kodinsk Airport	Kodinsk	Russia		UNKI	Asia/Krasnoyarsk
7623	Nanjing Railway Station	Nanjing	China			Asia/Shanghai
7624	Balkanabat	Balkanabat	Turkmenistan	BKN		Asia/Ashgabat
7625	Lake Macquarie Airport	Lake Macquarie	Australia	BEO	YPEC	Australia/Sydney
7626	Henry County Airport	Hampton	United States		K4A7	America/New_York
7627	Stapleton International Airport	Denver	United States		DENX	America/Denver
7628	Brampton Island Airport	Brampton Island	Australia	BMP	YBPI	Australia/Brisbane
7629	Shanghai Maglev Long Yang Road Station	Shanghai	China			Asia/Shanghai
7630	Nuernberg Port	Nuernberg	Germany			Europe/Berlin
7631	Alameda Naval Air Station	Alameda	United States	NGZ	KNGZ	America/Los_Angeles
7632	Stein	Stein	Germany			Europe/Berlin
7633	Dippenricht Heliport	Dippenricht	Germany			Europe/Berlin
7634	Lagoon Cove water aerodrome	Lagoon Cove	Canada			America/Vancouver
7635	Endelave Flyveplads	Endelage	Denmark		EKEL	Europe/Copenhagen
7636	St. Johann In Tirol Airport	St. Johann in Tirol	Austria		LOIJ	Europe/Vienna
7637	Echo Bay water aerodrome	Echo Bay	Canada			America/Vancouver
7638	Kingcome water aerodrome	Kingcome	Canada			America/Vancouver
7639	Thalmässing-Waizenhofen Airport	Thalmaessing	Germany		EDPW	Europe/Berlin
7640	Tcentralny	Taganrog	Russia		XRRC	Europe/Moscow
7641	Buffalo Exchange Street Station	Buffalo	United States			America/New_York
7642	Wilmington Amtrak Station	Wilmington	United States	ZWI		America/New_York
7643	Vagaru Island	Viceroy Resort	Maldives			Indian/Maldives
7644	Fort McMurray - Mildred Lake Airport	Fort McMurray	Canada	NML		America/Edmonton
7645	Genoa Cruise Terminal	Genova	Italy			Europe/Rome
7646	Suzhou Industrial Park Railway Station	Suzhou	China			Asia/Shanghai
7647	Elkhart Municipal	Elkhart	United States			America/New_York
7648	Cochrane Airport	Cochrane	Canada	YCN	CYCN	America/Toronto
7649	Estadual Arthur Siqueira Airport	Braganca Paulista	Brazil	BJP	SBBP	America/Sao_Paulo
7650	Busselton Regional Airport	Brusselton	Australia	BQB	YBLN	Australia/Perth
7651	Srednekolymsk Airport	Srednekolymsk	Russia	SEK	UESK	Asia/Srednekolymsk
7652	Garowe - International	Garowe	Somalia	GGR		Africa/Mogadishu
7653	Comarapa Airport	Salt Lake City	United States		SLCR	America/La_Paz
7654	Thorny Bush Game Lodge Airport	Hoedspruit	South Africa			Africa/Johannesburg
7655	Inverell Airport	Inverell	Australia	IVR	YIVL	Australia/Sydney
7656	Glen Innes Airport	Glen Innes	Australia	GLI	YGLI	Australia/Sydney
7657	Hangzhou Railway Station	Hangzhou	China			Asia/Shanghai
7658	Sorrento Valley Station	San Diego	United States			America/Los_Angeles
7659	San Diego Union Station	San Diego	United States			America/Los_Angeles
7660	Ansbach-Petersdorf Airport	Ansbach	Germany		EDQF	Europe/Berlin
7661	Venice-Venezia Mestre	Venice	Italy			Europe/Rome
7662	Immokalee Regional Airport	Immokalee 	United States	IMM	KIMM	America/New_York
7663	Maranggo Airport	Sulawesi Tenggara	Indonesia	TQQ	WA44	Asia/Makassar
7664	Rancho San Simeon Airport	Cambria	United States		66CA	America/Los_Angeles
7665	Port Canaveral	Brevard County	United States			America/New_York
7666	Cococay	Ragged Island	Bahamas			America/Nassau
7667	Yichun Mingyueshan Airport	Yichun	China	YIC	ZSYC	Asia/Shanghai
7668	Costa maya port	Costa maya	Mexico			America/Cancun
7669	Costa maya port	Costa maya	Mexico			America/Cancun
7670	Fajardo	Fajardo	Puerto Rico			America/Puerto_Rico
7671	Billings field	Essex	Canada			America/Toronto
7672	Hiberico Offshore Platform	Cuidad del Carmen	Mexico			
7673	Alpha offshore platform	Cork	Ireland			
7674	Peterhof Helicopter Landing area	Saint-Petersburg	Russia			Europe/Moscow
7675	Gogland Helicopter Landing	Gogland Island	Russia			
7676	New Carrollton Rail Station	New Carrollton	United States	ZRZ		America/New_York
7677	Ship Channel Cay	Ship Channel Cay	Bahamas			America/Nassau
7678	Walkersville Train Depot	Walkersville	United States			America/New_York
7679	Seattle Pier 69 - Victoria Clipper	Seattle	United States			America/Los_Angeles
7680	Dinwiddie County Airport	Petersburg	United States	PTB	KPTB	America/New_York
7681	Mount Aso helipad	Aso	Japan			Asia/Tokyo
7682	Mount Aso helipad	Aso	Japan			Asia/Tokyo
7683	Kasongo Airport	Kasongo	Congo (Kinshasa)		FZOK	Africa/Lubumbashi
7684	McMurdo Station Pegasus Field	McMurdo Station	Antarctica		NZPG	Antarctica/South_Pole
7685	Klatovy Airport	Klatovy	Czech Republic		LKKT	Europe/Prague
7686	Sheboygan County Memorial Airport	Sheboygan	United States	SBM	KSBM	America/Chicago
7687	Fortescue - Dave Forrest Aerodrome	Cloudbreak	Australia	KFE	YFDF	Australia/Perth
7688	Ephraim-Gibraltar Airport	Ephraim	United States	3D2		America/Chicago
7689	Kangel Danda Airport	Kangel Danda	Nepal		VNKL	Asia/Katmandu
7690	Man Maya Airport	Khanidanda	Nepal		VNKD	Asia/Katmandu
7691	Talcha Airport	Rara National Park	Nepal		VNT1	Asia/Katmandu
7692	Bajura Airport	Bajura	Nepal	BJU	VNBR	Asia/Katmandu
7693	Walkersville Turnaround	Frederick	United States			America/New_York
7694	Chara Airport	Chara	Russia		UIAR	Asia/Yakutsk
7695	Tho Xuan Airport	Thanh Hoa	Vietnam	THD		Asia/Saigon
7696	Herning Airport	Herning	Denmark		EKHG	Europe/Copenhagen
7697	Oberschleißheim Airfield	Schleissheim	Germany		EDNX	Europe/Berlin
7698	Pinal Airpark	Marana	United States	MZJ	KMZJ	America/Phoenix
7699	Glendale Municipal Airport	Glendale	United States		KGEU	America/Phoenix
7700	Safford Regional Airport	Safford	United States	SAD	KSAD	America/Phoenix
7701	Verden-Scharnhorst Airfield	Verden	Germany		EDWV	Europe/Berlin
7702	Mara North	Masai Mara	Kenya			Africa/Nairobi
7703	Fort Lauderdale-Hollywood International Airport Station at Dania Beach	Dania Beach	United States			America/New_York
7704	Deerfield Beach Station	Deerfield Beach	United States			America/New_York
7705	Lecheo	Korinthos	Greece			Europe/Athens
7706	Solomon Airport	Solomon	Australia	SLJ	YSOL	Australia/Perth
7707	Nittenau-Bruck Airport	Nittenau	Germany		EDNM	Europe/Berlin
7708	Kerama Airport	Kerama	Japan	KJP	ROKR	Asia/Tokyo
7709	Americana Airport	Americana	Brazil		SDAI	America/Sao_Paulo
7710	Brussels Gare Centrale	Brussels	Belgium			Europe/Brussels
7711	Comino Airport	Comino	Malta	JCO		Europe/Malta
7712	Udine stazione	Udine	Italy			Europe/Rome
7713	Bratislava Hlavna Stanica	Bratislava	Slovakia			Europe/Bratislava
7714	Depati Parbo Airport	Sungai Penuh	Indonesia			Asia/Jakarta
7715	Kolosovka	Kolosovka	Russia			Asia/Omsk
7716	Ekibastuz Airport	Ekibastuz	Kazakhstan	EKB	UASB	Asia/Qyzylorda
7717	Znamenka airport	Znamenskoe	Russia			Asia/Omsk
7718	Tevriz airport	Tevriz	Russia			Asia/Omsk
7719	Bestobe airport	Bestobe	Kazakhstan			Asia/Qyzylorda
7720	Stepnogorsk airport	Stepnogorsk	Kazakhstan			Asia/Qyzylorda
7721	Bekdash airport	Karabogaz	Turkmenistan			Asia/Ashgabat
7722	Adamovka	Adamovka	Russia		UWOD	Asia/Yekaterinburg
7723	Kvarkeno	Kvarkeno	Russia		UWOH	Asia/Yekaterinburg
7724	Sikeston Memorial Municipal Airport	Sikeston	United States	SIK	KSIK	America/Chicago
7725	Nynashamnterminalen	Nynashamn	Sweden			Europe/Stockholm
7726	Rodby Port	Rodby	Denmark			Europe/Copenhagen
7727	Puttgarden	Puttgarden	Germany	QUA		Europe/Berlin
7728	Sonevafushi	Sonevafushi	Maldives			Indian/Maldives
7729	Royal Island Resort	Royal Island Resort	Maldives			Indian/Maldives
7730	Royal Island Resort	Royal Island Resort	Maldives			Indian/Maldives
7731	Port of Belfast	Belfast	United Kingdom	BE2		Europe/London
7732	Stranraer Ferry Port	Stranraer	United Kingdom	SR2		Europe/London
7733	Oceano County Airport	Oceano	United States	L52	KL52	America/Los_Angeles
7734	Eupen - Rail	Eupen	Belgium			Europe/Brussels
7735	Tetiaroa Airport	Tetiaroa	French Polynesia	TTI	NTTE	Pacific/Tahiti
7736	Osnabrueck Hbf	Osnabrueck	Germany			Europe/Berlin
7737	Hannover Hbf	Hannover	Germany			Europe/Berlin
7738	Floyd Bennett Memorial Airport	Queensbury	United States	GFL	KGFL	America/New_York
7739	Saratoga County Airport	Ballston Spa	United States		K5B2	America/New_York
7740	Burrello-Mechanicville Airport	Mechanicville	United States	K27		America/New_York
7741	Tampa Padang	Mamuju	Indonesia	MJU	WAWJ	Asia/Makassar
7742	Crystal River Airport	Crystal River	United States		KCGC	America/New_York
7743	Martin State Airport	Baltimore	United States	MTN	KMTN	America/New_York
7744	Lincoln Regional Karl Harder Field	Lincoln	United States		KLHM	America/Los_Angeles
7745	Fostoria Metropolitan Airport	Fostoria	United States		KFZI	America/New_York
7746	Eastern Slopes Regional Airport	Fryeburg	United States	FRY	KIZG	America/New_York
7747	Coral Creek Airport	Placida	United States		FA54	America/New_York
7748	Lakefront Airport	New Orleans	United States	NEW	KNEW	America/Chicago
7749	Coeur D'Alene - Pappy Boyington Field	Coeur d'Alene	United States	COE	KCOE	America/Los_Angeles
7750	Beaumont Municipal Airport	Beaumont	United States	BMT	KBMT	America/Chicago
7751	Vermilion Regional Airport	Danville	United States	DNV	KDNV	America/Chicago
7752	Varberg Railway Station	Varberg	Sweden			Europe/Stockholm
7753	Coonabarabran Airport	Coonabarabran	Australia	COJ	YCBB	Australia/Sydney
7754	Toronto Union Station	Toronto	Canada			America/Toronto
7755	Windsor Station	Windsor	Canada			America/Toronto
7756	Dearborn Amtrak Station	Dearborn	United States			America/New_York
7757	Merritt Island Airport	Cocoa	United States	COI		America/New_York
7758	Valkaria Municipal	Valkaria	United States	X59		America/New_York
7759	Space Coast Regional Airport	Titusville	United States	TIX	KTIX	America/New_York
7760	Sebastian Municipal	Sebastian	United States	X26		America/New_York
7761	Terrace Bay	Terrace Bay	Namibia	TCY		Africa/Windhoek
7762	Nxabega Airstrip	Nxabega	Botswana		FB57	Africa/Gaborone
7763	Kelani River-Peliyagoda Waterdrome	Colombo	Sri Lanka	KEZ		Asia/Colombo
7764	Polgolla Reservoir	Kandy	Sri Lanka	KDZ		Asia/Colombo
7765	Bumi Airport	Bumi Hills	Zimbabwe	BZH	FVBM	Africa/Harare
7766	Priv	Lagos	Portugal			Europe/Lisbon
7767	Warnervale Airport	Warnervale Airport	Australia		YWVA	Australia/Sydney
7768	Boat	Hati	Haiti			America/Port-au-Prince
7769	Boat	Hati	Haiti			America/Port-au-Prince
7770	Cartitas	Hati	Haiti			America/Port-au-Prince
7771	Boat	Hati	Haiti			America/Port-au-Prince
7772	Hospital	Port Au Prince	Haiti			America/Port-au-Prince
7773	Clinic	Saint Marc	Haiti			America/Port-au-Prince
7774	Village	Dodard	Haiti			America/Port-au-Prince
7775	Bouarfa Airport	Bouarfa	Morocco	UAR	GMFB	Africa/Casablanca
7776	Beijing West Railway Station	Beijing	China			Asia/Shanghai
7777	Hung Hom Railway Station	Hong Kong	Hong Kong			Asia/Hong_Kong
7778	Nyeri Airport	NYERI	Kenya	NYE	HKNI	Africa/Nairobi
7779	Angaga Seaplane Dock	Alifu Dhaalu Atoll	Maldives			Indian/Maldives
7780	Madoogali Seaplane Dock	Alifu Atoll	Maldives			Indian/Maldives
7781	Effingham Memorial Airport	Effingham	United States	1H2	KEFH	America/Chicago
7782	Stoke	Stoke-on-Trent	United Kingdom			
7783	Tobermory Dock	Tobermory	Canada			America/Toronto
7784	South Baymouth Docks	South Baymouth	Canada			America/Toronto
7785	Andrau Airpark	Houston	United States	AAP	KAAP	America/Chicago
7786	Flying Cloud Airport	Eden Prairie	United States	FCM	KFCM	America/Chicago
7787	Likoma Island Airport	Likoma Island	Malawi	LIX	FWLK	Africa/Blantyre
7788	Johnson County Executive Airport	Olathe	United States	OJC	KOJC	America/Chicago
7789	Sigiriya Air Force Base	Sigiriya	Sri Lanka	GIU	VCCS	Asia/Colombo
7790	Westbahnhoff	Vienna	Austria	XWW		Europe/Vienna
7791	York Mills GO Bus Terminal	Toronto	Canada			America/Toronto
7792	Neumünster Airport	Neumuenster	Germany	EUM	EDHN	Europe/Berlin
7793	Tak Airport	Tak	Thailand	TKT	VTPT	Asia/Bangkok
7794	Marshall Aiport	Marshall	United States			Asia/Ulaanbaatar
7795	Meedhuffushi Seaplane dock	Meedhuffushi Island	Maldives			Indian/Maldives
7796	Barrie-Orillia (Lake Simcoe Regional Airport)	Barrie-Orillia	Canada	YLK	CYLS	America/Toronto
7797	Huronia Airport	Midland	Canada		CYEE	America/Toronto
7798	Markham Airport	Markham	Canada		CNU8	America/Toronto
7799	Stanhope Municipal Airport	Haliburton	Canada		CND4	America/Toronto
7800	Kawartha Lakes (Lindsay) Airport	Lindsay	Canada		CNF4	America/Toronto
7801	Niagara District Airport	Saint Catherines	Canada	YCM	CYSN	America/Toronto
7802	Apopka	Orlando	United States	X04		America/New_York
7803	Edenvale Aerodrome	Edenvale	Canada		CNV8	America/Toronto
7804	Orillia Airport	Orillia	Canada		CNJ4	America/Toronto
7805	Holland Landing Airpark	Holland Landing	Canada		CLA4	America/Toronto
7806	Kent	Chatham	Canada	XCM	CNZ3	America/Toronto
7807	Parry Sound Area Municipal Airport	Parry Sound	Canada	YPD	CNK4	America/Toronto
7808	Hanover / Saugeen Municipal Airport	Hanover	Canada		CYHS	America/Toronto
7809	Brandywine Airport	West Goshen Township	United States		KOQN	America/New_York
7810	Batoka	Livingston	Zambia			Africa/Lusaka
7811	Manassas Regional Airport/Harry P. Davis Field	Manassas	United States	MNZ	KHEF	America/New_York
7812	Texas Gulf Coast Regional Airport	Angleton	United States	LJN	KLBX	America/Chicago
7813	Bubovice Airport	Bubovice	Czech Republic		LKBU	Europe/Prague
7814	Shenzhen Railway Station	Shenzhen	China			Asia/Hong_Kong
7815	Rakkestad Astorp Airport	Rakkestad	Norway		ENRK	Europe/Oslo
7816	Johnstown Amtrak	Johnstown	United States			America/New_York
7817	Harvey Field S43	Snohomish WA	United States			America/Los_Angeles
7818	Urgup	Urgup	Turkey			Europe/Istanbul
7819	Dolo Ado	Dolo Ado	Ethiopia			Africa/Addis_Ababa
7820	AYaou	Yaou	French Guiana			America/Cayenne
7821	Camop	Camopi	French Guiana			America/Cayenne
7822	CApat	Croisee d Apatou	French Guiana			America/Cayenne
7823	Citro	Citron	French Guiana			America/Cayenne
7824	DieuM	Dieu Merci	French Guiana			America/Cayenne
7825	Dorli	Dorlin	French Guiana			America/Cayenne
7826	Elyse	Elysee	French Guiana			America/Cayenne
7827	Herap	Morsbach	France			Europe/Paris
7828	OSMSE	Saint Elie	French Guiana			America/Cayenne
7829	Prevo	Remire	French Guiana			America/Cayenne
7830	Sisli Belediyesi Evlendirme Dairesi Heliport	Istanbul	Turkey			Europe/Istanbul
7831	Kadikoy Ispark Heliport	Istanbul	Turkey			Europe/Istanbul
7832	Bingöl Çeltiksuyu Airport	Bingol	Turkey	BGG	LTCU	Europe/Istanbul
7833	Kastamonu Airport	Kastamonu	Turkey	KFS	LTAL	Europe/Istanbul
7834	Okawango Lodge	Okawango	Botswana			Africa/Gaborone
7835	Kai Tak	Hong Kong	Hong Kong		HKGX	Asia/Hong_Kong
7836	Elstree Airfield	Elstree	United Kingdom		EGTR	Europe/London
7837	Sandtoft Airfield	Sandtoft	United Kingdom		EGCF	Europe/London
7838	Bourne Park	Hurtsbourne Tarrant	United Kingdom			Europe/London
7839	Hite Airport	Hanksville	United States	UT3		America/Denver
7840	Dieppe Ferry Port	Dieppe	France			Europe/Paris
7841	Newhaven Ferry Port	Newhaven	United Kingdom			Europe/London
7842	Ollantaytambo Train Station	Ollantaytambo	Peru			America/Lima
7843	Aguas Calientes Train Station	Aguas Calientes	Peru			America/Lima
7844	Poroy Train Station	Cusco	Peru			America/Lima
7845	Aberdeen Harbour	Aberdeen	United Kingdom			Europe/London
7846	Lerwick Harbour	Lerwick	United Kingdom			Europe/London
7847	Torshavn Harbour	Torshavn	Faroe Islands			Atlantic/Faeroe
7848	Seydisfjordur	Seydisfjordur	Iceland			Atlantic/Reykjavik
7849	Queen Street Station	Glasgow	United Kingdom	GLQ		Europe/London
7850	Torit Airport	Torit	South Sudan		HSTR	Africa/Juba
7851	Falmouth Port	Falmouth	Jamaica			America/Jamaica
7852	Cozumel Port	Cozumel	Mexico			America/Cancun
7853	Philipsburg Port	Philipsburg	Netherlands Antilles			America/Curacao
7854	Basseterre Port	Basseterre	Saint Kitts and Nevis			America/St_Kitts
7855	Charlotte Amalie Port	Charlotte Amalie	Virgin Islands			America/St_Thomas
7856	San Juan Port	San Juan	Puerto Rico			America/Puerto_Rico
7857	Santa Barbara Train Station	Santa Barbara	United States			America/Los_Angeles
7858	Eugene Amtrak Station	Eugene	United States			America/Los_Angeles
7859	Lincolnville GO Station	Stouffville	Canada			America/Toronto
7860	Mormugao-Goa Port	Mormugao	India			Asia/Calcutta
7861	Cochin Port	Cochin	India			Asia/Calcutta
7862	Penang Cruise Terminal	Penang	Malaysia			Asia/Kuala_Lumpur
7863	Port Klang-Kuala Lumpur Cruise Terminal	Port Klang	Malaysia			Asia/Kuala_Lumpur
7864	Singapore Cruise Terminal	Singapore	Singapore			Asia/Singapore
7865	Shelby County Airport	Shelbyville	United States		K2H0	America/Chicago
7866	Illinois Terminal	Champaign	United States			America/Chicago
7867	Mattoon Amtrak	Mattoon	United States			America/Chicago
7868	Lüliang Airport	Lvliang	China	LLV	ZBLL	Asia/Shanghai
7869	Delft Central	Delft	Netherlands			Europe/Amsterdam
7870	Daocheng Yading Airport	Daocheng	China	DCY	ZUDC	Asia/Shanghai
7871	Gannan Xiahe Airport	Xiahe city	China	GXH	ZLXH	Asia/Shanghai
7872	Komandoo	Komandoo	Maldives			Indian/Maldives
7873	Komandoo	Komandoo	Maldives			Indian/Maldives
7874	Meck Island Airstrip	Meck Island	Marshall Islands			Pacific/Majuro
7875	Sormovo	Nizhny Novgorod	Russia		XUDS	Europe/Moscow
7876	Grand Canyon West Airport	Peach Springs	United States	1G4		America/Phoenix
7877	Vängsö Airport	Vangso	Sweden		ESSZ	Europe/Stockholm
7878	Yaroslavsky Station	Moscow	Russia			Europe/Moscow
7879	Railway Station	Perm	Russia			Asia/Yekaterinburg
7880	Railway Station	Novosibirsk	Russia			Asia/Krasnoyarsk
7881	Railway Station	Ulan Bator	Mongolia			Asia/Ulaanbaatar
7882	Main Station	Beijing	China			Asia/Shanghai
7883	Railway Station	Irkutsk	Russia			Asia/Irkutsk
7884	Kuredu 	Kuredu	Maldives			Indian/Maldives
7885	Heliport NUS	Umea	Sweden			Europe/Stockholm
7886	Heliport SU	Sundsvall	Sweden			Europe/Stockholm
7887	Comiso Airport	Comiso	Italy	CIY	LICB	Europe/Rome
7888	Leroo La Tau	Leroo La Tau	Botswana			Africa/Gaborone
7889	Xaxanaka	Xaxanaka	Botswana			Africa/Gaborone
7890	Xugana	Xugana	Botswana			Africa/Gaborone
7891	Nxamaseri	Nxamaseri	Botswana			Africa/Gaborone
7892	Kwando	Kwando	Botswana			Africa/Gaborone
7893	Boston North Station	Boston	United States			America/New_York
7894	Rockport Station	Rockport	United States			America/New_York
7895	Salem Station	Salem	United States			America/New_York
7896	Salem Ferry Dock	Salem	United States			America/New_York
7897	Long Wharf	Boston	United States			America/New_York
7898	Joliet Union Station	Joliet	United States			America/Chicago
7899	Laraway Road	New Lenox	United States			America/Chicago
7900	Lasalle Station	Chicago	United States			America/Chicago
7901	Waterloo International	London	United Kingdom			Europe/London
7902	Norfolk Station	Norfolk	United States			America/New_York
7903	London Railway Station	London	Canada			America/Toronto
7904	Gloucester Station	Gloucester	United States			America/New_York
7905	Kitchener Bus Terminal	Kitchener	Canada			America/Toronto
7906	Gare du Palais	Quebec	Canada			America/Toronto
7907	Johnstown Amtrak	Johnstown	United States			America/New_York
7908	Enumclaw Airport	Enumclaw	United States		WA77	America/Los_Angeles
7909	Rock Airport	Tarentum	United States	9G1		America/New_York
7910	Grand Central Terminal	New York	United States			America/New_York
7911	Tremont	New York	United States			America/New_York
7912	Plum Island Airport	Newburyport	United States	2B2		America/New_York
7913	Brooks Camp	Brooks Camp	United States			America/Anchorage
7914	Kulik Lake Airport	Kulik Lake	United States	LKK		America/Anchorage
7915	Central Station	Glasgow	United Kingdom	ZGG		Europe/London
7916	Euston Station	London	United Kingdom	QQU		Europe/London
7917	Waterloo International	London	United Kingdom	QQW		Europe/London
7918	Belorussky Station	Moscow	Russia			Europe/Moscow
7919	Railway Station	Omsk	Russia			Asia/Omsk
7920	Railway Station	Krasnoyarsk	Russia			Asia/Krasnoyarsk
7921	Railway Station	Naushki	Russia			Asia/Irkutsk
7922	Railway Station	Erlian	China			Asia/Shanghai
7923	Guangzhoudong Railway Station	Guangzhou	China			Asia/Shanghai
7924	Domodedovo	Moscow	Russia			Europe/Moscow
7925	Levashovo	St. Petersburg	Russia		XLLV	Europe/Moscow
7926	Kettle Falls Lodge	Minaki	Canada			America/Winnipeg
7927	Severobajkalsk Port	Severobajkalsk	Russia			Asia/Irkutsk
7928	Vanino-Port	Vanino	Russia			Asia/Vladivostok
7929	Holmsk-Port	Holmsk	Russia			Asia/Srednekolymsk
7930	Nogliki	Nogliki	Russia			Asia/Srednekolymsk
7931	Markovo Airport	Markovo	Russia	KVM	UHMO	Asia/Anadyr
7932	Seymchan Airport	Seymchan	Russia		UHMS	Asia/Srednekolymsk
7933	Zyryanka Airport	Zyryanka	Russia	ZKP	UESU	Asia/Srednekolymsk
7934	Susuman Airport	Susuman	Russia		UHMH	Asia/Srednekolymsk
7935	OYMYAKON	OYMYAKON	Russia		UEMY	Asia/Vladivostok
7936	Ust-Maya Airport	Ust-Maya	Russia	UMS	UEMU	Asia/Yakutsk
7937	Aldan Airport	Aldan	Russia	ADH	UEEA	Asia/Yakutsk
7938	Olyokminsk Airport	Olekminsk	Russia	OLZ	UEMO	Asia/Yakutsk
7939	Vitim Airport	Vitim	Russia		UERT	Asia/Yakutsk
7940	Pellworm Field	Pellworm	Germany		EDHP	Europe/Berlin
7941	Tynda	Tynda	Russia			Asia/Yakutsk
7942	Tommot	Tommot	Russia			Asia/Yakutsk
7943	Etretat	Etretat	France			Europe/Paris
7944	Le Havre	Le Havre	France			Europe/Paris
7945	Weimar	Weimar	Germany			Europe/Berlin
7946	Xinyuan Nalati Airport	Xinyuan	China	NLT	ZWNL	Asia/Shanghai
7947	Port Alsworth Airport	Port alsworth	United States	PTA	PALJ	America/Anchorage
7948	Fontaine Airport	Belfort	France	BOR	LFSQ	Europe/Paris
7949	Pampulha	Belo Horizonte	Brazil	BHZ		America/Sao_Paulo
7950	Fairfield County Airport	Winnsboro	United States		KFDW	America/New_York
7951	Obock Airport	Obock	Djibouti	OBC	HDOB	Africa/Djibouti
7952	Tadjoura Airport	Tadjoura	Djibouti	TDJ	HDTJ	Africa/Djibouti
7953	Santa Cruz del Quiche Airport	Santa Cruz des Quiche	Guatemala	AQB	MGQC	America/Guatemala
7954	Norðfjörður Airport	Nordfjordur	Iceland	NOR	BINF	Atlantic/Reykjavik
7955	Bursa Airport	Bursa	Turkey	BTZ	LTBE	Europe/Istanbul
7956	Skyhaven Airport	Rochester	United States		KDAW	America/New_York
7957	Waris Airport	Waris-Papua Island	Indonesia	WAR	WAJR	Asia/Jayapura
7958	Port Oceanic Airport	Port Oceanic	United States	PRL		America/Anchorage
7959	Newton City-County Airport	Newton	United States	EWK	KEWK	America/Chicago
7960	La Ferté Alais Airfield	La Ferte Alais	France		LFFQ	Europe/Paris
7961	Angguruk airstrip	Angguruk	Indonesia			Asia/Jayapura
7962	Bairnsdale Airport	Bairnsdale	Australia	BSJ	YBNS	Australia/Hobart
7963	Taszár Air Base	Columbus	United States	TZR	LHTA	Europe/Budapest
7964	Ocean Shores Municipal	Ocean Shores	United States	W04	KW04	America/Los_Angeles
7965	Packwood	Packwood	United States	55S	K55S	America/Los_Angeles
7966	Fort Bridger Airport	Fort Bridger	United States	FBR	KFBR	America/Denver
7967	Prosser Airport	Prosser	United States		KS40	America/Los_Angeles
7968	Chehalis Centralia Airport	Chehalis	United States	CLS	KCLS	America/Los_Angeles
7969	Desert Aire Regional Airport	Mattawa	United States		KM94	America/Los_Angeles
7970	Lebanon State	Lebanon	United States	S30	KS30	America/Los_Angeles
7971	Evanston-Uinta County Airport-Burns Field	Evanston	United States	EVW	KEVW	America/Denver
7972	Sabetha Municipal Airport	Sabetha	United States		KK83	America/Chicago
7973	Mt Pleasant Regional-Faison field	Mount Pleasant	United States		KLRO	America/New_York
7974	Jimmy Carter Regional Airport	Americus	United States		KACJ	America/New_York
7975	Weedon Field	Eufala	United States	EUF	KEUF	America/Chicago
7976	Saluda County Airport	Saluda	United States		K6J4	America/New_York
7977	Dare County Regional Airport	Manteo	United States	MEO	KMQI	America/New_York
7978	Auburn University Regional Airport	Auburn	United States	AUO	KAUO	America/Chicago
7979	Tri Cities Airport	Endicott	United States		KCZG	America/New_York
7980	Isla Culebrita	Culebrita	Puerto Rico			America/Puerto_Rico
7981	Culebrita	Isla Culebrita	Puerto Rico			America/Puerto_Rico
7982	Apollo Bay	Apollo Bay	Australia			Australia/Hobart
7983	Zabrat	Baku	Azerbaijan		ZABR	Asia/Baku
7984	Chirag	Caspian Sea	Azerbaijan		CHIR	
7985	Kendal Glider Port	Kendall	United States			America/New_York
7986	Lipa Noi Pier	Lipa Noi	Thailand			Asia/Bangkok
7987	Don Sak Pier	Don Sak	Thailand			Asia/Bangkok
7988	Bessemer Airport	Bessemer	United States		KEKY	America/Chicago
7989	Colorado Springs East Airport	Ellicott	United States		KA50	America/Denver
7990	Olds Didsbury Airport	Didsbury	Canada			America/Edmonton
7991	Sundre Airport	Sundre	Canada			America/Edmonton
7992	Buffalo-Depew Station	Depew	United States			America/New_York
7993	South Bend Station	South Bend	United States			America/New_York
7994	Carroll Avenue NICTD Station	Michigan City	United States			America/Chicago
7995	Chicago Millennium Station	Chicago	United States			America/Chicago
7996	St. Louis Gateway Transportation Center	St. Louis	United States			America/Chicago
7997	Kansas City Union Station	Kansas City	United States			America/Chicago
7998	Alvarado Transportation Center	Albuquerque	United States			America/Denver
7999	San Francisco 4th and King St. Station	San Francisco	United States			America/Los_Angeles
8000	Oakland Jack London Square Station	Oakland	United States			America/Los_Angeles
8001	Downtown Mountain View Station	Mountain View	United States			America/Los_Angeles
8002	San Mateo Station	San Mateo	United States			America/Los_Angeles
8003	Sunnyvale Station	Sunnyvale	United States			America/Los_Angeles
8004	Millbrae Intermodal Terminal	Millbrae	United States			America/Los_Angeles
8005	Cleveland Greyhound Station	Cleveland	United States			America/New_York
8006	Issyk-Kul International Airport	Tamchy	Kyrgyzstan	ИКУ	UCFL	Asia/Bishkek
8007	Crystal Airport	Crystal	United States		KMIC	America/Chicago
8008	Clarke County Airport	Quitman	United States		K23M	America/Chicago
8009	Ellaidhoo	Ellaidhoo	Maldives			Indian/Maldives
8010	W H 'Bud' Barron Airport	Dublin	United States	DBN	KDBN	America/New_York
8011	Port Authority	New York	United States			America/New_York
8012	Bus Terminal	Allentown	United States		ATWN	America/New_York
8013	Binghamton Bus Terminal	Binghamton	United States		BING	America/New_York
8014	William F. Walsh Regional Transportation Center	Syracuse	United States		SYTC	America/New_York
8015	Union Station	Utica	United States	UCA		America/New_York
8016	Clinton Bus Stop	Clinton	United States		CLTN	America/New_York
8017	Heuston Station	Dublin	Ireland			Europe/Dublin
8018	Killarney Station	Killarney	Ireland			Europe/Dublin
8019	Susquehanna Trailways Terminal	Williamsport	United States		WSPT	America/New_York
8020	Martz Trailways Bus Terminal	Wilkes-Barre	United States		WKBR	America/New_York
8021	Hazelton Bus Station	Hazelton	United States		HZLT	America/New_York
8022	Lewisburg Bus Stop	Lewisburg	United States		LWSB	America/New_York
8023	Madison NJT Station	Madison	United States		MDSN	America/New_York
8024	Maplewood NJT Station	Maplewood	United States		MPLD	America/New_York
8025	Harrisburg Transportation Center	Harrisburg	United States		HBRG	America/New_York
8026	Metro-North Station	Poughkeepsie	United States		PKPS	America/New_York
8027	Port Everglades	Fort Lauderdale	United States		FTLD	America/New_York
8028	Crown Bay	Charlotte Amalie	Virgin Islands		STCB	America/St_Thomas
8029	Cruise Ship Dock	Roseau	Dominica		RSAU	America/Dominica
8030	Grenada Port Authority Cruise Ship Terminal	St. George's	Grenada		GREN	America/Grenada
8031	Martinique Cruise Terminal	Fort de France	Martinique		MTQE	America/Martinique
8032	Dr AC Wathey Cruise Pier	Philipsburg	Netherlands Antilles		PHBG	America/Curacao
8033	Half Moon Cay	Little San Salvador Island	Bahamas		HMCY	America/Nassau
8034	Pukarua Airport	Pukarua	French Polynesia	PUK	NTGQ	
8035	Kabale Airport	Kabale	Uganda		HUKB	Africa/Kampala
8036	Cruz Bay Ferry Dock	Cruz Bay	Virgin Islands		CBFD	America/St_Thomas
8037	Red Hook Bay Ferry Dock	Red Hook	Virgin Islands		RHVI	America/St_Thomas
8038	Gare Routiere de Fort-de-France	Fort-de-France	Martinique		FDFM	America/Martinique
8039	Saint Pierre	Saint Pierre	Martinique		SPMQ	America/Martinique
8040	Philipsburg Bus Stop	Philipsburg	Netherlands Antilles		PHSM	America/Curacao
8041	Guatuso Airport	Marigot	France		MRGT	America/Costa_Rica
8042	Summit NJT Station	Summit	United States		SMMT	America/New_York
8043	Batoka Airfield	Dambwa - Livingstone	Zambia			Africa/Lusaka
8044	Central Bolívar Airport	Sevilla	Spain		SVSJ	America/Caracas
8045	Cordoba Station	Cordoba	Spain		CRDB	Europe/Madrid
8046	Granada Station	Granada	Spain		GRND	Europe/Madrid
8047	Atocha	Madrid	Spain		MDAT	Europe/Madrid
8048	Corvallis Municipal Airport	Corvallis	United States	CVO	KCVO	America/Los_Angeles
8049	Helipad of Viraj Group	Boisar	India			Asia/Calcutta
8050	Heydar Aliyev	Caspian Sea	Azerbaijan		HEYD	
8051	Phantom Lake	Phantom Lake	Canada			America/Vancouver
8052	Tuzla Romania Airport	Tuzla	Romania		LRTZ	Europe/Bucharest
8053	Toledo Railway Station	Toledo	Spain		TLDO	Europe/Madrid
8054	Chamartin Station	Madrid	Spain		MADC	Europe/Madrid
8055	Abando	Bilbao	Spain		BLBO	Europe/Madrid
8056	Aeroport	Barcelona	Spain		ARPT	Europe/Madrid
8057	Passeig de Gracia	Barcelona	Spain		PGRC	Europe/Madrid
8058	Sants	Barcelona	Spain		BSNT	Europe/Madrid
8059	Railway Station	Figueres	Spain		FGRS	Europe/Madrid
8060	El Almendro Airport	Scranton	United States		SCRT	America/Santiago
8061	New Brunswick Station	New Brunswick	United States		NBWK	America/New_York
8062	Trenton Transit Center	Trenton	United States		TRTC	America/New_York
8063	Holmesburg Jct Station	Philadelphia	United States		HOLM	America/New_York
8064	White Plains	White Plains	United States		WPLN	America/New_York
8065	Southeast	Southeast	United States		STHT	America/New_York
8066	B Street Cruise Terminal	San Diego	United States		SANB	America/Los_Angeles
8067	Terminal Maritima	Puerto Vallarta	Mexico		PRTV	America/Mexico_City
8068	Bahia San Lucas	Cabo San Lucas	Mexico		CABO	America/Mazatlan
8069	Ferry Terminal	Anacortes	United States		ACRT	America/Los_Angeles
8070	Ferry Dock	Friday Harbor	United States		FRID	America/Los_Angeles
8071	San Agustin Airport	Morristown	United States		MRST	America/Costa_Rica
8072	Port of Seattle	Seattle	United States		PSEA	America/Los_Angeles
8073	Ferry Terminal	Whittier	United States		WHIT	America/Anchorage
8074	Ferry Terminal	Valdez	United States		VLDZ	America/Anchorage
8075	Gare Routiere	Saint-Louis	Reunion		STLS	Indian/Reunion
8076	Bus Stop	La Riviere	Reunion		LRIV	Indian/Reunion
8077	Bus Stop	Cilaos	Reunion		CILS	Indian/Reunion
8078	Bus Stop	Hell-Bourg	Reunion		HLBG	Indian/Reunion
8079	Bus Stop	Salazie	Reunion		SLZI	Indian/Reunion
8080	Gare	St Andre	Reunion		ANDR	Indian/Reunion
8081	Samambaia Heliport	Saint Denis	Reunion		SDNS	America/Sao_Paulo
8082	Gare Routiere	Saint Pierre	Reunion		STPR	Indian/Reunion
8083	Baie Ste Anne	Praslin	Seychelles		PLIN	Indian/Mahe
8084	La Passe	La Digue	Seychelles		LADG	Indian/Mahe
8085	Ferry Dock	Bainbridge Island	United States		BAIN	America/Los_Angeles
8086	Bus	Phnom Penh	Cambodia		PNMP	Asia/Phnom_Penh
8087	Bus	Siem Reap	Cambodia		SMRP	Asia/Phnom_Penh
8088	Fazenda Campo Verde Airport	Sihanoukville	Cambodia		SNKV	America/Fortaleza
8089	Bus	Kampot	Cambodia		KMPT	Asia/Phnom_Penh
8090	Bus	Kep	Cambodia		KEPC	Asia/Phnom_Penh
8091	Main Station	Taipei	Taiwan		TPEI	Asia/Taipei
8092	Prominent Hill Airport	Prominent Hill	Australia	PXH	YPMH	Australia/Adelaide
8093	Cowra Airport	Chatsworth	Australia	CWT	YCWR	Australia/Sydney
8094	Algerciras Port	Algerciras	Spain			Europe/Madrid
8095	Ganges Water Aerodrome	Ganges	Canada			America/Vancouver
8096	Pender Harbour Water Aerodrome	Pender Harbour	Canada	YPT		America/Vancouver
8097	Mansons Landing Water Aerodrome	Mansons Landing	Canada	YMU		America/Vancouver
8098	Port McNeill Airport	Port McNeill	Canada	YMP		America/Vancouver
8099	Sullivan Bay Water Aerodrome	Sullivan Bay	Canada	YTG		America/Vancouver
8100	Deer Harbor Seaplane	Deer Harbor	United States	DHB		America/Los_Angeles
8101	San Diego Old Town Transit Center	San Diego	United States	OLT		America/Los_Angeles
8102	Coral Bay Airport	Coral Bay	Australia		YCOY	Australia/Perth
8103	Ogden Hinckley Airport	Ogden	United States	OGD	KOGD	America/Denver
8104	Lake Country Regional Airport	Clarksville	United Arab Emirates		KW63	America/New_York
8105	Robert S Kerr Airport	Poteau	United States		KRKR	America/Chicago
8106	Colorado Plains Regional Airport	Akron	United States	AKO	KAKO	America/Denver
8107	Sanderson Field	Shelton	United States	SHN	KSHN	America/Los_Angeles
8108	Union Station	Erie	United States			America/New_York
8109	Cleveland Lakefront Station	Cleveland	United States			America/New_York
8110	Elkhart Station	Elkhart	United States			America/New_York
8111	Waterloo Station	Waterloo	United States			America/New_York
8112	Martin Luther King Jr. Plaza	Toledo	United States			America/New_York
8113	Sandusky Station	Sandusky	United States			America/New_York
8114	Elyria Station	Elyria	United States			America/New_York
8115	Alliance Station	Alliance	United States			America/New_York
8116	Paoli Station	Paoli	United States			America/New_York
8117	Elizabethtown Station	Elizabethtown	United States			America/New_York
8118	Lewiston Station	Lewiston	United States			America/New_York
8119	Huntingdon Station	Huntingdon	United States			America/New_York
8120	Tyrone Station	Tyrone	United States			America/New_York
8121	Altoona Transportation Center	Altoona	United States			America/New_York
8122	Latrobe Station	Latrobe	United States			America/New_York
8123	Greensburg Station	Greensburg	United States			America/New_York
8124	Williamsburg Station	Williamsburg	United States			America/New_York
8125	Richmond Staples Mill Road Station	Richmond	United States			America/New_York
8126	Ashland Virgina Station	Ashland	United States			America/New_York
8127	Quantico Station	Quantico	United States			America/New_York
8128	Alexandria Union Station	Alexandria	United States			America/New_York
8129	Roma Ostiense	Rome	Italy		ROMO	Europe/Rome
8130	Milano Porta Garibaldi	Milan	Italy		MLPG	Europe/Rome
8131	Port Jefferson Ferry Dock	Port Jefferson	United States			America/New_York
8132	Bridgeport Ferry Dock	Bridgeport	United States			America/New_York
8133	Bridgeport Station	Bridgeport	United States			America/New_York
8134	Stratford Station	Stratford	United States			America/New_York
8135	Milford Station	Milford	United States			America/New_York
8136	West Haven Station	West Haven	United States			America/New_York
8137	Fairfield Metro Station	Fairfield	United States			America/New_York
8138	Fairfield Station	Fairfield	United States			America/New_York
8139	Saugatuck Staiton	Westport	United States			America/New_York
8140	South Norwalk Station	Norwalk	United States			America/New_York
8141	Darien Station	Darien	United States			America/New_York
8142	Harlem-125th Street Station	New York	United States			America/New_York
8143	Hammond-Whiting Station	Hammond	United States			America/Chicago
8144	Michigan City Amtrak Station	Michigan City	United States			America/Chicago
8145	New Buffalo Station	New Buffalo	United States			America/New_York
8146	Niles Station	Niles	United States			America/New_York
8147	Dowagiac Station	Dowagiac	United States			America/New_York
8148	Kalamazoo Transportation Center	Kalamazoo	United States			America/New_York
8149	Battle Creek Station	Battle Creek	United States			America/New_York
8150	Jackson MI Station	Jackson	United States			America/New_York
8151	Ann Arbor Station	Ann Arbor	United States			America/New_York
8152	Gdansk Glowny	Gdansk	Poland			Europe/Warsaw
8153	Poznan Glowny	Poznan	Poland			Europe/Warsaw
8154	Luebeck Hauptbahnhof	Luebeck	Germany			Europe/Berlin
8155	Cardiff Central	Cardiff	United Kingdom			Europe/London
8156	Stavanger Byterminalen	Stavanger	Norway			Europe/Oslo
8157	Bergen Busstasjonen	Bergen	Norway			Europe/Oslo
8158	Geneva Cornavin	Geneva	Switzerland			Europe/Zurich
8159	Budapest Nepliget Coach Station	Budapest	Hungary			Europe/Budapest
8160	Lviv Central Railway Station	Lviv	Ukraine			Europe/Kiev
8161	Gara de Nord	Bucharest	Romania			Europe/Bucharest
8162	Gara Sighisoara	Sighisoara	Romania			Europe/Bucharest
8163	Raleigh Amtrak Station	Raleigh	United States			America/New_York
8164	Toulouse Matabiau Station	Toulouse	France			Europe/Paris
8165	Bordeaux Saint Jean Station	Bordeaux	France	ZFQ		Europe/Paris
8166	Carcassonne Station	Carcassonne	France			Europe/Paris
8167	Bristol Temple Meads Railway Station	Bristol	United Kingdom			Europe/London
8168	Dresden Hauptbahnhof	Dresden	Germany			Europe/Berlin
8169	Budapest Deli Station	Budapest	Hungary			Europe/Budapest
8170	Szczecin Glowny Station	Szczecin	Poland			Europe/Warsaw
8171	Luxembourg Railway Station	Luxembourg City	Luxembourg			Europe/Luxembourg
8172	Milano Centrale Railway Station	Milan	Italy			Europe/Rome
8173	Bologna Centrale Railway Station	Bologna	Italy			Europe/Rome
8174	Rimini Railway Station	Rimini	Italy			Europe/Rome
8175	Oxford Railway Station	Oxford	United Kingdom			Europe/London
8176	Wigan Wallgate Railway Station	Wigan	United Kingdom			Europe/London
8177	Aarhus Central Station	Aarhus	Denmark			Europe/Copenhagen
8178	Oskarshamnterminalen	Oskarshamn	Sweden			Europe/Stockholm
8179	Oslo Central Station	Oslo	Norway	XZO		Europe/Oslo
8180	Bergen Railway Station	Bergen	Norway	QFV		Europe/Oslo
8181	Nimes Railway Station	Nimes	France	ZYN		Europe/Paris
8182	Avignon TGV Station	Avignon	France	XZN		Europe/Paris
8183	Aachen Hauptbahnhof	Aachen	Germany	XHJ		Europe/Berlin
8184	Vilnius Railway Station	Vilnius	Lithuania			Europe/Vilnius
8185	Visbyterminalen	Visby	Sweden			Europe/Stockholm
8186	Torino Porta Nuova Railway Station	Turin	Italy	TPY		Europe/Rome
8187	Nice Railway Station	Nice	France			Europe/Paris
8188	Ruzomberok Hlavna stanica	Ruzomberok	Slovakia			Europe/Bratislava
8189	Budapest Keleti palyaudvar	Budapest	Hungary			Europe/Budapest
8190	Kyoto Station	Kyoto	Japan			Asia/Tokyo
8191	Nagoya Station	Nagoya	Japan			Asia/Tokyo
8192	Nara Station	Nara	Japan			Asia/Tokyo
8193	Montreux Railway Station	Montreux	Switzerland			Europe/Zurich
8194	's-Hertogenbosch Railway Station	's-Hertogenbosch	Netherlands			Europe/Amsterdam
8195	Istanbul Esenler Otogari Bus Terminal	Istanbul	Turkey			Europe/Istanbul
8196	Sofia Central Bus Station	Sofia	Bulgaria			Europe/Sofia
8197	Riga Central Station	Riga	Latvia			Europe/Riga
8198	Brussels Nord	Brussels	Belgium			Europe/Brussels
8199	Bilbao Termibus	Bilbao	Spain			Europe/Madrid
8200	San Sebastian Railway Station	San Sebastian	Spain	YJH		Europe/Madrid
8201	Pamplona Railway Station	Pamplona	Spain	EEP		Europe/Madrid
8202	Andorra Estacio D'Autobuses	Andorra la Vella	Spain			Europe/Andorra
8203	Ljubljana Railway Station	Ljubljana	Slovenia			Europe/Ljubljana
8204	Szeged Railway Station	Szeged	Hungary			Europe/Budapest
8205	Debrecen Railway Station	Debrecen	Hungary			Europe/Budapest
8206	Brno Hlavni Nadrazi Station	Brno	Czech Republic			Europe/Prague
8207	Lausanne Railway Station	Lausanne	Switzerland			Europe/Zurich
8208	Maastricht Station	Maastricht	Netherlands			Europe/Amsterdam
8209	York Railway Station	York	United Kingdom	QQY		Europe/London
8210	Birmingham New Street Railway Station	Birmingham	United Kingdom	QQN		Europe/London
8211	Cesky Krumlov Station	Cesky Krumlov	Czech Republic			Europe/Prague
8212	Bayreuth Hauptbahnhof	Bayreuth	Germany			Europe/Berlin
8213	Bahnhof Bamberg	Bamberg	Germany			Europe/Berlin
8214	Bahnhof Rothenburg ob der Tauber 	Rothenburg ob der Tauber	Germany			Europe/Berlin
8215	Bahnhof Donauwoerth	Donauwoerth	Germany			Europe/Berlin
8216	Bahnhof Noerdlingen	Noerdlingen	Germany			Europe/Berlin
8217	Taichung Station	Taichung	Taiwan			Asia/Taipei
8218	Pisa Centrale	Pisa	Italy			Europe/Rome
8219	Vernazza Station	Vernazza	Italy			Europe/Rome
8220	Copan Ruinas	Copan Ruinas	Honduras			America/Tegucigalpa
8221	Water Taxi Terminal	Belize City	Belize			America/Belize
8222	Water Taxi Terminal	Caye Caulker	Belize			America/Belize
8223	Las Vegas Greyhound Bus Station	Las Vegas	United States			America/Los_Angeles
8224	Irvine Transportation Center	Irvine	United States			America/Los_Angeles
8225	Gateway Multimodal Transportation Center	St. Louis	United States			America/Chicago
8226	Baldur Ferry Terminal	Stykkisholmur	Iceland			Atlantic/Reykjavik
8227	Kotor Cruise Port	Kotor	Montenegro			Europe/Podgorica
8228	Mostar Railway Station	Mostar	Bosnia and Herzegovina			Europe/Sarajevo
8229	Prizren	Prizren	Serbia			Europe/Belgrade
8230	Asheville Greyhound Station	Asheville	United States			America/New_York
8231	Granada	Granada	Nicaragua			America/Managua
8232	Inverness Railway Station	Inverness	United Kingdom	ZIV		Europe/London
8233	Portree	Portree	United Kingdom			Europe/London
8234	Aberdeen Railway Station	Aberdeen	United Kingdom	ZXA		Europe/London
8235	Petra	Petra	Jordan			Asia/Amman
8236	Key West Cruise Port	Key West	United States			America/New_York
8237	Skagen	Skagen	Denmark			Europe/Copenhagen
8238	Mons Klint	Mon	Denmark			Europe/Copenhagen
8239	Meteora	Meteora	Greece			Europe/Athens
8240	Port of Piran	Piran	Slovenia			Europe/Ljubljana
8241	Dare County Regional Airport	Manteo	United States			America/New_York
8242	Zeleznicka Stanica Railway Station	Novi Sad	Serbia			Europe/Belgrade
8243	Kosice Railway Station	Kosice	Slovakia			Europe/Bratislava
8244	Gare de Metz-Ville	Metz	France			Europe/Paris
8245	Siofok Vasutallomas Train Station	Siofok	Hungary			Europe/Budapest
8246	Malmo Central Station	Malmo	Sweden	XFP		Europe/Stockholm
8247	Lund Central Station	Lund	Sweden	XGC		Europe/Stockholm
8248	Helsingor Station	Helsingor	Denmark			Europe/Copenhagen
8249	Odense Station	Odense	Denmark			Europe/Copenhagen
8250	Tokaj Vasutallomas Station	Tokaj	Hungary			Europe/Budapest
8251	Chopok Ski Resort	Chopok	Slovakia			Europe/Bratislava
8252	Brugge Railway Station	Bruges	Belgium			Europe/Brussels
8253	Gare de Coo	Coo	Belgium			Europe/Brussels
8254	Knokke Station	Knokke	Belgium			Europe/Brussels
8255	Kortrijk Station	Kortrijk	Belgium			Europe/Brussels
8256	Ieper Station	Ypres	Belgium			Europe/Brussels
8257	Gare de Dinant	Dinant	Belgium			Europe/Brussels
8258	Port of Valparaiso	Valparaiso	Chile			America/Santiago
8259	Pecs Vasutallomas Station	Pecs	Hungary			Europe/Budapest
8260	Kaposvar Vasutallomas Station	Kaposvar	Hungary			Europe/Budapest
8261	Sopron Vasutallomas Station	Sopron	Hungary			Europe/Budapest
8262	Gyor Vasutallomas Station	Gyor	Hungary			Europe/Budapest
8263	Bahla	Bahla	Oman			Asia/Muscat
8264	Lukang	Lukang	Taiwan			Asia/Taipei
8265	Chiayi Station	Chiayi	Taiwan			Asia/Taipei
8266	Kenting National Park	Kenting	Taiwan			Asia/Taipei
8267	Tainan Station	Tainan	Taiwan			Asia/Taipei
8268	Amalfi	Amalfi	Italy			Europe/Rome
8269	Positano	Positano	Italy			Europe/Rome
8270	Sorrento	Sorrento	Italy			Europe/Rome
8271	Salerno Central Station	Salerno	Italy			Europe/Rome
8272	Ventimiglia Railway Station	Ventimiglia	Italy			Europe/Rome
8273	Stirling Railway Station	Stirling	United Kingdom			Europe/London
8274	Bothwell Railway Station	Bothwell	United Kingdom			Europe/London
8275	Lisbon Rossio Station	Lisbon	Portugal			Europe/Lisbon
8276	Sintra Station	Sintra	Portugal			Europe/Lisbon
8277	Gniezno Station	Gniezno	Poland			Europe/Warsaw
8278	Malbork Railway Station	Malbork	Poland			Europe/Warsaw
8279	Tau Ferry Terminal	Tau	Norway			Europe/Oslo
8280	Stavanger Ferry Terminal	Stavanger	Norway			Europe/Oslo
8281	Halhjem Ferry Terminal	Halhjem	Norway			Europe/Oslo
8282	Sandviksvag Ferry Terminal	Sandviksvag	Norway			Europe/Oslo
8283	Arsvagen Ferry Terminal	Arsvagen	Norway			Europe/Oslo
8284	Mortavika Ferry Terminal	Mortavika	Norway			Europe/Oslo
8285	Schaan-Vaduz Railway Station	Vaduz	Switzerland			Europe/Vaduz
8286	Snowshoe Mountain Ski Resort	Snowshoe	United States			America/New_York
8287	Winterplace Ski Resort	Ghent	United States			America/New_York
8288	Nantahala Outdoor Center	Bryson City	United States			America/New_York
8289	Hillerod Station	Hillerod	Denmark			Europe/Copenhagen
8290	Roskilde Station	Roskilde	Denmark			Europe/Copenhagen
8291	Mount Samat National Shrine	Mount Samat	Philippines			Asia/Manila
8292	Bermeo Station	Bermeo	Spain			Europe/Madrid
8293	Bilbao Atxuri Station	Bilbao	Spain			Europe/Madrid
8294	Gernika Station	Gernika	Spain			Europe/Madrid
8295	Waterloo Station	Waterloo	Belgium			Europe/Brussels
8296	Donovaly Ski Resort	Donovaly	Slovakia			Europe/Bratislava
8297	Esztergom Vasutallomas Station	Esztergom	Hungary			Europe/Budapest
8298	Calella Station	Calella	Spain			Europe/Madrid
8299	Napakiak Airport	Napakiak	United States	WNA	PANA	America/Anchorage
8300	Delta Junction Airport	Delta Junction	United States	DJN		America/Anchorage
8301	Stevens Village Airport	Stevens Village	United States	SVS		America/Anchorage
8302	Akiachak Airport	Akiachak	United States	KKI		America/Anchorage
8303	Atmautluak Airport	Atmautluak	United States	4A2		America/Anchorage
8304	Napaskiak Airport	Napaskiak	United States	PKA	PAPK	America/Anchorage
8305	Chignik Fisheries Airport	Chignik	United States	KCG		America/Anchorage
8306	Tok Airport	Tok	United States		PATJ	America/Anchorage
8307	Klemtu Airport	Klemtu	Canada	YKT		America/Vancouver
8308	Wekweeti Airport	Wekweeti	Canada		CYWE	America/Edmonton
8309	Bedwell Harbour Seaplane Base	Bedwell Harbour	Canada	YBW	CAB3	America/Vancouver
8310	Maya Flats Airstrip	San Ignacio	Belize	CYD		America/Belize
8311	Washabo Airport	Washabo	Suriname	WSO	SMWS	America/Paramaribo
8312	Rockford Van Galder Terminal	Rockford	United States			America/Chicago
8313	Popham Airfield	Popham	United Kingdom		EGHP	Europe/London
8314	Causey Airport	Liberty	United States		K2A5	America/New_York
8315	Zhuhai Railway Station	Zhuhai	China			Asia/Macau
8316	Silver Creek Airport	Stann Creek	Belize	SVK		America/Belize
8317	Independence Airport	Independence	Belize	INB		America/Belize
8318	Corazon de Jesus Airport	Corazon de Jesus	Panama	CZJ		America/Panama
8319	Abaco I Walker C Airport	Walker's Cay	Bahamas	WKR	MYAW	
8320	Black Point Airstrip	Black Point	Bahamas		MYEB	America/Nassau
8321	Bartica A Airport	Bartica	Guyana	GFO	SYBT	America/Guyana
8322	Puerto Ayora	Santa Cruz	Ecuador			Pacific/Galapagos
8323	Doylestown Airport	Doylestown	United States	DYL	KDYL	America/New_York
8324	Stroudsburg Pocono	East Stroudsburg	United States	ESP		America/New_York
8325	Sky Manor	Pittstown	United States	N40		America/New_York
8326	Cape Town Waterfort Heliport	Cap Town	South Africa		FADW	Africa/Johannesburg
8327	Jao Airstrip Private	Jao	Botswana			Africa/Gaborone
8328	Tingo Maria Airport	Tingo Maria	Peru	TGI	SPGM	America/Lima
8329	Plínio Alarcom Airport	Tres Lagoas	Brazil	TJL	SSTL	America/Campo_Grande
8330	Zhangye Ganzhou Airport	Zhangye	China	YZY	ZLZY	Asia/Shanghai
8331	Cacoal Airport	Cacoal	Brazil	OAL	SSKW	America/Boa_Vista
8332	Warren Field	Washington	United States	OCW	KOCW	America/New_York
8333	Hyde County Airport	Engelhard	United States		K7W6	America/New_York
8334	Mocopulli Airport	Castro	Chile	MHC	SCPQ	America/Santiago
8335	Taximo	Taximo	Russia		UIKG	Asia/Irkutsk
8336	Stillwater Regional Airport	Stillwater	United States	SWO	KSWO	America/Chicago
8337	Okmulgee Regional Airport	Okmulgee	United States	OKM	KOKM	America/Chicago
8338	Cushing Municipal Airport	Cushing	United States	CUH	KCUH	America/Chicago
8339	Clinton Sherman Airport	Clinton	United States	CSM	KCSM	America/Chicago
8340	Strother Field	Winfield	United States	WLD	KWLD	America/Chicago
8341	Wiley Post Airport	Oklahoma City	United States	PWA	KPWA	America/Chicago
8342	Shreveport Downtown Airport	Shreveport	United States	DTN	KDTN	America/Chicago
8343	Stephenville Clark Regional Airport	Stephenville	United States	SEP	KSEP	America/Chicago
8344	Perry Municipal Airport	Perry	United States		KF22	America/Chicago
8345	Goldthwaite	Goldthwaite	United States		KT37	America/Chicago
8346	Hamilton Municipal Airport	Hamilton	United States		KMNZ	America/Chicago
8347	Ada Regional Airport	Ada	United States	ADT	KADH	America/Chicago
8348	Mesquite Metro Airport	Misquite	United States		KHQZ	America/Chicago
8349	Denton Municipal Airport	Denton	United States		KDTO	America/Chicago
8350	Austin Executive Airport	Austin	United States		KEDC	America/Chicago
8351	Lago Vista Tx Rusty Allen Airport	Lago Vista	United States		KRYW	America/Chicago
8352	Brenham Municipal Airport	Brenham	United States		K11R	America/Chicago
8353	Lakeway Airpark	Lakeway	United States		K3R9	America/Chicago
8354	Iraan Municipal Airport	Iraan	United States	IRB	K2F0	America/Chicago
8355	Kestrel Airpark	San Antonio	United States		K1T7	America/Chicago
8356	Elliot Lake Municipal Airport	ELLIOT LAKE	Canada	YEL	CYEL	America/Toronto
8357	Wilkes County Airport	North Wilkesboro	United States	IKB	KUKF	America/New_York
8358	Charleston Executive Airport	Charleston	United States		KJZI	America/New_York
8359	Danville Regional Airport	Danville	United States	DAN	KDAN	America/New_York
8360	Brookneal/Campbell County Airport	Brookneal	United States		K0V4	America/New_York
8361	Spokane Amtrak Station	Spokane	United States			America/Los_Angeles
8362	Lewistown Amtrak Station	Lewistown	United States			America/New_York
8363	Valladolid Bus Station	Valladolid	Spain	XJN		Europe/Madrid
8364	Soria Bus Station	Soria	Spain	XJO		Europe/Madrid
8365	Yerbogachen Airport	Yerbogachen	Russia	ERG	UIKE	Asia/Irkutsk
8366	Cheraw Municipal Airport/Lynch Bellinger Field	Cheraw	United States	HCW	KCQW	America/New_York
8367	Arcadia Municipal Airport	Arcadia	United States	X06		America/New_York
8368	Wauchula Municipal Airport	Wuchula	United States		KCHN	America/New_York
8369	River Ranch Resort Airport	River Ranch	United States	2RR		America/New_York
8370	Belle Glade State Municipal Airport	Belle Galdes	United States	X10		America/New_York
8371	Homestead General Aviation Airport	Homestead	United States	X51		America/New_York
8372	Massey Ranch Airpark Airport	Edgewater	United States	X50		America/New_York
8373	North Palm Beach County General Aviation Airport	Palm Beach Gardens	United States	F45		America/New_York
8374	Airglades Airport	Clewiston	United States	2IS		America/New_York
8375	Chagual	Chagual	Peru		SPGL	America/Lima
8376	Strasbourg Bus Station	Strasbourg	France	XER		Europe/Paris
8377	Tanda Tula Airstrip	Timbavati	South Africa			Africa/Johannesburg
8378	Lilydale Airport	Lilydale	Australia		YLIL	Australia/Hobart
8379	Beni Mellal Airport	Beni Mellal	Morocco	BEM	GMMD	Africa/Casablanca
8380	Şırnak Şerafettin Elçi Airport	Cizre	Turkey	NKT	LTCV	Europe/Istanbul
8381	Suntar Airport	Suntar	Russia	SUY	UENS	Asia/Yakutsk
8382	Srednekolymsk Airport	Srednekolymsk	Russia			Asia/Srednekolymsk
8383	Goulimime Airport	Goulimime	Morocco	GLN		Africa/Casablanca
8384	Tazadit Airport	Zouerat	Mauritania	OUZ	GQPZ	Africa/Nouakchott
8385	Asaba International Airport	Asaba	Nigeria	ABB	DNAS	Africa/Lagos
8386	Akwa Ibom International Airport	Uyo	Nigeria	QUO	DNAI	Africa/Lagos
8387	Semera Airport	Semera	Ethiopia	SZE		Africa/Addis_Ababa
8388	Kasama Airport	Kasama	Zambia	KAA	FLKS	Africa/Lusaka
8389	Mbeya Airport	Mbeya	Tanzania		HTMB	Africa/Dar_es_Salaam
8390	Mpanda Airport	Mpanda	Tanzania		HTMP	Africa/Dar_es_Salaam
8391	Songea Airport	Songea	Tanzania	SGX	HTSO	Africa/Dar_es_Salaam
8392	Morogoro Airport	Morogoro	Tanzania		HTMG	Africa/Dar_es_Salaam
8393	Kirawira Aerodrome	Grumeti Game Reserve	Tanzania	GTZ		Africa/Dar_es_Salaam
8394	Kogatende Airstrip	Kogatende	Tanzania			Africa/Dar_es_Salaam
8395	Lobo Airstrip	Lobo	Tanzania		HTLO	Africa/Dar_es_Salaam
8396	Serengeti South Airfield	Serengeti South	Tanzania		HTST	Africa/Dar_es_Salaam
8397	Chiasso Railway Station	Chiasso	Switzerland			Europe/Zurich
8398	Etihad Travel Mall	Dubai	United Arab Emirates	XNB		Asia/Dubai
8399	Port of liverpool	Liverpool	United Kingdom			Europe/London
8400	Port of montreal	Montreal	Canada			America/Toronto
8401	Zaysan Airport	Zaysan	Kazakhstan	SZI		Asia/Qyzylorda
8402	Tuticorin Airport	Thoothukudi	India	TCR		Asia/Calcutta
8403	Jiuhuashan Airport	Chizhou	China	JUH	ZSJH	Asia/Shanghai
8404	Anshan Air Base	Anshan	China	AOG	ZYAS	Asia/Shanghai
8405	Saertu Airport	Daqing	China	DQA	ZYDQ	Asia/Shanghai
8406	Zunyi Xinzhou Airport	Zunyi	China	ZYI	ZUZY	Asia/Shanghai
8407	Conway Horry County Airport	Conway	United States		KHYW	America/New_York
8408	Lindu Airport	Yinchun	China	LDS	ZYLD	Asia/Shanghai
8409	Anshun Huangguoshu Airport	Anshun	China	AVA	ZUAS	Asia/Shanghai
8410	Sikasso Airport	Sikasso	Mali	KSS	GASK	Africa/Bamako
8411	LUX Maldives	Dhidhoofinolhu Island	Maldives			Indian/Maldives
8412	Mushimasgali	Mushimasgali	Maldives			Indian/Maldives
8413	Toowoomba Wellcamp Airport	Toowoomba	Australia	WTB	YBWW	Australia/Brisbane
8414	Tonghua Sanyuanpu Airport	Tonghua	China	TNH	ZYTN	Asia/Shanghai
8415	Central Azeri	Caspian Sea	Azerbaijan		CENA	
8416	Kunshan South Railway Station	Kunshan	China	KVN		Asia/Shanghai
8417	Suzhou Guangfu Airport	Suzhou	China	SZV	ZSSZ	Asia/Shanghai
8418	Falwell	Lynchburg	United States	W24	KW24	America/New_York
8419	Conrad Maldives Resort	Rangali Island	Maldives			Indian/Maldives
8420	City Airport Manchester	Manchester	United Kingdom		EGCB	Europe/London
8421	Sleap Airport	Shrewsbury	United Kingdom		EGCV	Europe/London
8422	Tatenhill Airfield	Burton-on-Trent	United Kingdom		EGBM	Europe/London
8423	Full Sutton Airfield	York	United Kingdom		EGNU	Europe/London
8424	Sherburn-In-Elmet Airfield	Leeds	United Kingdom		EGCJ	Europe/London
8425	Haliwen Airport	Atambua	Indonesia	ABU	WATA	Asia/Makassar
8426	Beringin Airport	Muara Teweh	Indonesia		WAOM	Asia/Jakarta
8427	Kasonaweja Airstrip	Kasonaweja	Indonesia	KAS	WZ31	Asia/Jayapura
8428	Mulia Airport	Mulia	Indonesia	LII	WAJM	Asia/Jayapura
8429	Wonopito Airport	Lewoleba	Indonesia	LWE		Asia/Makassar
8430	Tardamu Airport	Savu Island	Indonesia	SAU	WATS	Asia/Makassar
8431	Robert Atty Bessing Airport	Malinau	Indonesia		WALM	Asia/Makassar
8432	Stenkol Airport	Bintuni	Indonesia	NTI	WASB	Asia/Jayapura
8433	Wasior Airport	Wasior	Indonesia	WSR	WASW	Asia/Jayapura
8434	Silangit Airport	Siborong-Borong	Indonesia	DTB	WIMN	Asia/Jakarta
8435	Lasikin Airport	Sinabang	Indonesia		WITG	Asia/Jakarta
8436	Youngstown Federal Station	Youngstown	United States			America/New_York
8437	Metrorail Transfer Station	Hialeah	United States			America/New_York
8438	Opa-locka Station	Opa-locka	United States			America/New_York
8439	Golden Glades Station	Golden Glades	United States			America/New_York
8440	Hollywood Station	Hollywood	United States			America/New_York
8441	Sheridan Street Station	Hollywood	United States			America/New_York
8442	Fort Lauderdale Station	Fort Lauderdale	United States			America/New_York
8443	Cypress Creek Station	Fort Lauderdale	United States			America/New_York
8444	Pompano Beach Station	Pompano Beach	United States			America/New_York
8445	Nikolayevka	Nikolayevka	Russia		УУЬН	Asia/Anadyr
8446	Seunagan Airport	Nagan Raya	Indonesia	MEQ	WITC	
8447	Betoambari Airport	Bau-Bau	Indonesia	BUW	WAWB	
8448	Kao Airport	Kao	Indonesia	KAZ	WAMK	
8449	Melangguane Airport	Melonguane	Indonesia	MNA	WAMN	
8450	Sanggata/Sangkimah Airport	Sanggata	Indonesia	SGQ	WRLA	
8451	Muara Bungo Airport	Muara Bungo	Indonesia	BUU	WIPI	
8452	Selayar/Aroepala Airport	Selayar	Indonesia		WAWH	
8453	Kuala Kurun Airport	Kuala Kurun	Indonesia		WT81	
8454	Puruk Cahu Airport	Puruk Cahu	Indonesia	PCU		
8455	Melalan Airport	Melak	Indonesia	MLK	WRLE	
8456	Dekai Airport	Dekai	Indonesia	DEK	WX67	
8457	Illaga Airport	Illaga	Indonesia	ILA	WABL	
8458	Oksibil Airport	Oksibil	Indonesia	OKL	WAJO	
8459	Kokonau Airport	Kokonau	Indonesia	KOX	WABN	
8460	Kenyam Airport	Keneyan	Indonesia	KNY	WZ41	
8461	Clermont Airport	Clermont	Australia	CMQ	YCMT	
8462	Warrnambool Airport	Warrnambool	Australia	WMB	YWBL	
8463	Bloomfield Airport	Bloomfield	Australia	BFC		
8464	Richmond Airport	Richmond	Australia	RCM	YRMD	
8465	RAAF Base Curtin	Derby	Australia	DCN	YCIN	
8466	Fleetwood	Fleetwood	United Kingdom			
8467	Arnoldstein	Arnoldstein	Austria			
8468	Lucerne	Lucerne	Switzerland			
8469	Wolfach	Wolfach	Germany			
8470	Kalispell	Kalispell	United States			
8471	Banff	Banff	Canada			
8472	Jasper	Jasper	Canada			
8473	Terrace Bay	Terrace Bay	Canada			
8474	Ayr	Ayr	Canada			
8475	Edmundston	Edmundston	Canada			
8476	St. Andrews	St. Andrews	Canada			
8477	Pinery	Pinery	Canada			
8478	Gananoque	Gananoque	Canada			
8479	Riviere-du-Loup	Riviere-du-Loup	Canada			
8480	Campbells Cove Provincial Park	Campbells Cove Provincial Park	Canada			
8481	Twin Shores Camping Area	Twin Shores Camping Area	Canada			
8482	Oka	Oka	Canada			
8483	Hudson	Hudson	Canada			
8484	Inverhuron	Inverhuron	Canada			
8485	Kill Bear	Kill Bear	Canada			
8486	Long Sault	Long Sault	Canada			
8487	L Etete	L Etete	Canada			
8488	Deer Is	Deer Is	Canada			
8489	Deer Is Point	Dear Is Point	Canada			
8490	Blacks Harbour	Blacks Harbour	Canada			
8491	North Head	North Head	Canada			
8492	Ingalls Head	Ingalls Head	Canada			
8493	White Head Is	White Head Is	Canada			
8494	Cornwall Wallmart	Cornwall Wallmart	Canada			
8495	Kualanamu International Airport	Medan	Indonesia	KNO	WIMM	Asia/Jakarta
8496	Jasper Railway Station	Jasper	Canada	XDH		
8497	Gratiot Community Airport	Kamloops	Canada	AMN	KAMN	
8498	Asheboro Regional Airport	Asheboro	United States		KHBI	
8499	Seosan Air Base	Seosan	South Korea	HMY	RKTP	
8500	Andorra La Vella	Andorra La Vella	Spain	ALV		
8501	Ngala Airport	Ngala	South Africa	NGL		
8502	Henderson Field	Wallace	United States		KACZ	
8503	Emporia Greensville Regional Airport	Emporia	United States		KEMV	
8504	Sainte-Foy Railway Station	Sainte-Foy	Canada			
8505	Drummondville Railway Station	Drummondville	Canada			
8506	Saint Lambert Railway Station	Saint Lambert	Canada			
8507	Rochester Station	Rochester	United States			
8508	Rome Amtrak Station	Rome	United States			
8509	Amsterdam Amtrak Station	Amsterdam	United States			
8510	Schenectady Amtrak Station	Schenectady	United States			
8511	Hudson Amtrak Station	Hudson	United States			
8512	Rhinecliff-Kingston Amtrak Station	Rhinebeck	United States			
8513	Croton-Harmon Station	Croton-on-Hudson	United States			
8514	Naperville Station	Naperville	United States			
8515	Mendota Union Depot	Mendota	United States			
8516	Princeton Station	Princeton	United States			
8517	Galesburg Station	Galesburg	United States			
8518	Fort Madison Station	Fort Madison	United States			
8519	La Plata Station	La Plata	United States			
8520	Lawrence Station	Lawrence	United States			
8521	Topeka Station	Topeka	United States			
8522	Newton Station	Newton	United States			
8523	Hutchinson Station	Hutchinson	United States			
8524	Dodge City Station	Dodge City	United States			
8525	Garden City Station	Garden City	United States			
8526	Lamar Station	Lamar	United States			
8527	La Junta Station	La Junta	United States			
8528	Trinidad Station	Trinidad	United States			
8529	22nd St. Station	San Francisco	United States			
8530	Bayshore Station	San Francisco	United States			
8531	South San Francisco Station	South San Francisco	United States			
8532	San Bruno Station	San Bruno	United States			
8533	Broadway Station	Burlingame	United States			
8534	Burlingame Station	Burlingame	United States			
8535	Hayward Park Station	San Mateo	United States			
8536	Hillsdale Station	San Mateo	United States			
8537	Belmont Station	Belmont	United States			
8538	San Carlos Station	San Carlos	United States			
8539	Redwood City Station	Redwood City	United States			
8540	Atherton Station	Atherton	United States			
8541	Menlo Park Station	Menlo Park	United States			
8542	Palo Alto Station	Palo Alto	United States			
8543	California Ave. Station	Palo Alto	United States			
8544	San Antonio Station	Mountain View	United States			
8545	Oakville Station	Oakville	Canada			
8546	Aldershot Station	Burlington	Canada			
8547	Grimsby Station	Grimsby	Canada			
8548	St. Catharines Station	St. Catharines	Canada			
8549	Brantford Railway Station	Brantford	Canada			
8550	Woodstock Railway Station	Woodstock	Canada			
8551	Ingersoll Station	Ingersoll	Canada			
8552	Glencoe Railway Station	Glencoe	Canada			
8553	Chatham Railway Station	Chatham	Canada			
8554	Niagara Falls - Hwy 420 at Stanley	Niagara Falls	Canada			
8555	St. Catharines Fairview Mall	St. Catharines	Canada			
8556	Grimsby GO Bus Stop	Grimsby	Canada			
8557	Stoney Creek GO Bus Stop	Stoney Creek	Canada			
8558	Appleby GO Station	Burlington	Canada			
8559	Bronte GO Station	Oakville	Canada			
8560	Clarkson GO Station	Mississauga	Canada			
8561	Port Credit GO Station	Mississauga	Canada			
8562	Long Branch GO Station	Toronto	Canada			
8563	Mimco GO Station	Toronto	Canada			
8564	Exhibition GO Station	Toronto	Canada			
8565	Stouffville GO Station	Stouffville	Canada			
8566	Mount Joy GO Station	Markham	Canada			
8567	Markham GO Station	Markham	Canada			
8568	Centennial GO Station	Markham	Canada			
8569	Unionville GO Station	Markham	Canada			
8570	Millikin GO Station	Toronto	Canada			
8571	Agincourt GO Station	Toronto	Canada			
8572	Kennedy GO Station	Toronto	Canada			
8573	Yorkdale Bus Terminal	Toronto	Canada			
8574	Keele and Highway 401	Toronto	Canada			
8575	Dixon and Martin Grove	Toronto	Canada			
8576	Huggins Memorial	Timmonsville	United States	58J		
8577	San Gabriel Valley Airport	El Monte	United States	EMT	KEMT	
8578	Regina	Regina	French Guiana			
8579	Croisee d Apatou	Apatou	French Guiana			
8580	SMSE	Saint Elie	French Guiana			
8581	Carrirere Prevot	Remire	French Guiana			
8582	Reid Hillview	San Jose	United States			
8583	Hollister	Hollister	United States			
8584	King City	King City	United States			
8585	Placerville	Placerville	United States			
8586	Blue Canyon	Blue Canyon	United States			
8587	Lee Vining	Lee Vining	United States			
8588	Jackpot	Jackpot	United States			
8589	Arco	Arco	United States			
8590	Bountiful	Bountiful	United States			
8591	Battle Mountain	Battle Mountain	United States			
8592	Bishop	Bishop	United States			
8593	Needle	Needle	United States			
8594	Agua Dulce	Agua Dulce	United States			
8595	Tonopah	Tonopah	United States			
8596	Mount Laurel Greyhound Station	Mount Laurel	United States			
8597	Wyandanch Station	Wyandanch	United States			
8598	Pinelawn Station	Melville	United States			
8599	Farmingdale Station	Farmingdale	United States			
8600	Bethpage Station	Bethpage	United States			
8601	Hicksville Station	Hicksville	United States			
8602	Jamaica Station	New York	United States			
8603	Woodside Station	New York	United States			
8604	Kiama Train Station	Kiama	Australia			
8605	Katoomba Train Station	Katoomba	Australia			
8606	Terminal Bersepadu Selatan	Kuala Lumpur	Malaysia			
8607	Melaka Sentral	Malacca	Malaysia			
8608	Chelsea Station	Chelsea	United States			
8609	Central Square - Lynn Station	Lynn	United States			
8610	Swampscott Railroad Depot	Swampscott	United States			
8611	Beverly Depot	Beverly	United States			
8612	Montserrat Station	Beverly	United States			
8613	Beverly Farms Station	Beverly	United States			
8614	Manchester by the Sea Station	Manchester by the Sea	United States			
8615	West Gloucester Station	Gloucester	United States			
8616	Gloucester Station	Gloucester	United States			
8617	Farah Airport	Farah	Afghanistan	FAH	OAFR	
8618	Gare d'autocars de Sainte-Foy	Sainte-Foy	Canada			
8619	Terminus Intermodal de Longueuil	Longueuil	Canada			
8620	DWG	Caspian Sea	Azerbaijan		DWG1	
8621	Pasighat Airport	Pasighat	India	IXT	VEPG	
8622	Kee Field	Pineville	United States		KI16	
8623	Fordham Station	New York	United States			
8624	Greenwich Station	Greenwich	United States			
8625	Tsigaro Airport	Tsigaro	Botswana		FB81	
8626	Kuramathi	Kuramathi	Maldives			
8627	New Haven State Street Station	New Haven	United States			
8628	Albany-Rennselaer Amtrak Station	Rennselaer	United States	ZLY		
8629	Kramatorsk Airport	Kramatorsk	Ukraine	KRQ	UKCK	
8630	Port Jefferson Station	Port Jefferson	United States			
8631	Stony Brook Station	Stony Brook	United States			
8632	St. James Station	St. James	United States			
8633	Smithtown Station	Smithtown	United States			
8634	Kings Park Station	Kings Park	United States			
8635	Northport Station	East Northport	United States			
8636	Greenlawn Station	Greenlawn	United States			
8637	Huntington NY Station	Huntington	United States			
8638	Sigernessjoen	Sigernessjoen	Norway			
8639	Setten	Setten	Norway			
8640	Kautokeino Air Base	Kautokeino	Norway	QKX	ENKA	
8641	Cold Spring Harbor Station	Cold Spring Harbor	United States			
8642	Syosset Station	Syosset	United States			
8643	Westbury Station	Westbury	United States			
8644	Carle Place Station	Carle Place	United States			
8645	Mineola Station	Mineola	United States			
8646	Merillon Avenue Station	Garden City	United States			
8647	New Hyde Park Station	New Hyde Park	United States			
8648	Constance Halaveli	Halaveli	Maldives	HAL		
8649	Lille/Marcq-en-Baroeul Airport	Marcq En Baroeul	France		LFQO	
8650	Knucle Reef	Knucle Reef	Australia		XXXA	
8651	Nika Resort Island	Nika Resort Island	Maldives		XXXB	
8652	W retreat and spa resort	W retreat and spa resort	Maldives		XXXC	
8653	Heli 1	Heli 1	United States		XXX1	
8654	Heli 2	Heli 2	United States		XXX2	
8655	Kawass Airport	Kamsar	Guinea		GUKR	
8656	Homewood Station	Homewood	United States			
8657	Kankakee Station	Kankakee	United States			
8658	Gilman Station	Gilman	United States			
8659	Rantoul Station	Rantoul	United States			
8660	French Valley Airport	Murrieta	United States	F70		
8661	Stinson Municipal Airport	Stinson	United States	SSF	KSSF	
8662	Sallisaw Municipal Airport	Sallisaw	United States		KJSV	
8663	Jasper County Airport-Bell Field	Jasper	United States	JAS	KJAS	
8664	El Dorado Springs Memorial Airport	El dorado springs	United States		K87K	
8665	Marfa Municipal Airport	Marfa	United States	MRF	KMRF	
8666	Alpine Casparis Municipal Airport	Alpine	United States	ALE	KE38	
8667	Sea Lion Island	Sea Lion Island	Falkland Islands		SFSL	
8668	Bleaker Island Airport	Bleaker Island	Falkland Islands		SFBI	
8669	Bubaque Airport	Bubaque	Guinea-Bissau	BQE	GGBU	
8670	Oshawa Station	Oshawa	Canada			
8671	Coburg Station	Coburg	Canada			
8672	Fallowfield Station	Ottawa	Canada			
8673	Chichen Itza International Airport	Chichen Itza	Mexico	CZA	MMCT	America/Mexico_City
8674	GulfofMexico	Gulf of Mexico - Noble Sam Croft	United States			
8675	Bunbury Airport	Bunbury	Australia	BUY	YBUN	
8676	Cable Airport	Upland	United States	CCB	KCCB	
8677	Verona Porta Nuova	Verona	Italy			
8678	Fuvahmulah Airport	Fuvahmulah	Maldives	FVM		
8679	Sri Jayawardenepura Kotte	Colombo	Sri Lanka	DWO		
8680	Mount Sterling Montgomery County Airport	Mount Sterling	United States		KIOB	
8681	Elkhart Municipal Airport	Elkhart	United States	EKI	KEKM	
8682	Nappanee Municipal Airport	Nappanee 	United States		KC03	
8683	South Goulburn Island	Warruwi	Australia		YGBL	
8684	Borroloola	Borroloola	Ashmore and Cartier Islands			
8685	Manchester Picadilly Station	Manchester	United Kingdom	QQM		
8686	Abu Rudeis Airport 	Abu Rudeis	Egypt	AUE		
8687	Jim Hamilton L.B. Owens Airport	Columbia	United States	CUB	KCUB	
8688	Grove Municipal Airport	Grove	United States		KGMJ	
8689	Mc Pherson Airport	Mc Pherson	United States		KMPR	
8690	Donaldson Field Airport	Greenville	United States	GDC	KGYH	
8691	Perry Houston County Airport	Perry	United States		KPXE	
8692	Hartsville Regional Airport	Hartsville	United States	HVS	KHVS	
8693	Horace Williams Airport	Chapel Hill	United States		KIGX	
8694	San Cristobal de las Casas Airport	San Cristobal de las Casas	Mexico	SZT	MMSC	America/Mexico_City
8695	Hot Springs Cove Aerodrome	Hot Springs Cove	Canada			
8696	Dunnville Airport	Dunnville	Canada	DU9	CDU9	
8697	Brunswick County Airport	Oak Island	United States		KSUT	
8698	Chesterfield County Airport	Richmond	United States		KFCI	
8699	Atherton Airport	Atherton	Australia		YATN	
8700	Bagdarin Airport	Bagdarin	Russia		UIUB	Asia/Irkutsk
8701	Scarlett Martinez International Airport	Rio Hato	Panama	RIH	MPRH	
8702	Dubai Creek SeaWings Base	Dubai	United Arab Emirates			
8703	Henderson Oxford Airport	Oxford	United States		KHNZ	
8704	Leesburg International Airport	Leesburg	United States	LEE	KLEE	
8705	NIK	NIK	Juan de Nova Island	XIK	XNIK	
8706	Semyazino Airport	Vladimir	Russia		UUBL	Europe/Moscow
8707	Witberg Tswalu Airport	Dedeben	South Africa		FATW	
8708	Grand Cache	Grand Cache	Canada	YGC		
8709	Mana Pools Airport	Mana Pools	Zimbabwe		FVMN	
8710	Hazrat Nizamuddin	Delhi	India		HZRT	
8711	Phi Phi	Ko Phi Phi	Thailand			
8712	Pouso Alegre Airport	Pouso Alegre	Brazil	PPY	SNZA	
8713	Brigadeiro Cabral Airport	Divinopolis	Brazil	DIQ	SNDV	
8714	Yeysk Airport	Eysk	Russia	EIK	URKE	Europe/Moscow
8715	Berdyansk Airport	Berdyansk	Ukraine	ERD	UKDB	
8716	Blimbingsari Airport	Banyuwangi	Indonesia	BWX	WARB	
8717	Koltur	Koltur	Faroe Islands			
8718	Erenhot Saiwusu International Airport	Erenhot	China	ERL	ZBER	
8719	Shobdon Aerodrome	Shobdon	United Kingdom		EGBS	
8720	Chino Airport	Chino	United States	CNO	KCNO	
8721	Kamigoto Airport	Shin-kamigoto	Japan		RJDK	
8722	Ojika Airport	Odika	Japan		RJDO	
8723	Chofu Airport	Tokyo	Japan		RJTF	
8724	Hateruma Airport	Taketomi	Japan	HTR	RORH	
8725	Buchs	Buchs	Switzerland			
8726	Sargans	Sargans	Switzerland			
8727	Madison County Airport	London	United States		KUYF	
8728	Playa Baracoa	Havana	Cuba		CUPB	
8729	Las Brujas Airport	Cayo Santa Maria	Cuba	BWW	MUBR	
8730	Long Beach	Long Beach	United States		LBNY	
8731	Digby (General Hospital) Heliport	Tremblay-en-France	France		CDG2	
8732	Gare de Chatelet - Les Halles	Paris	France		CHLH	
8733	Aeroport Charles de Gaulle 1	Mauregard	France		CDG1	
8734	Gare de Saint Michel - Notre Dame	Paris	France		SMND	
8735	Versaille-Chateau	Versaille	France		VRSI	
8736	Thun Airport	Thun	Switzerland		LSZW	
8737	Mount Vernon	Mount Vernon	United States			
8738	Durham Amtrak Station	Durham	United States			
8739	Plaunt Ferry Terminal	Cheboygan	United States			
8740	Bois Blanc Island Ferry Terminal	Bois Blanc Island	United States			
8741	Bois Blanc Island Airport	Bois Blanc Island	United States	6Y1		
8742	Lavrentiya Airport	Lavrentiya	Russia		UHML	Asia/Anadyr
8743	Paso Robles Municipal Airport	Paso Robles	United States	PRB	KPRB	
8744	N 104 Helipad	Ulleung	South Korea		RKDU	
8745	Tai'an	Tai'an	China			
8746	Phan Thiet	Phan Thiet	Vietnam			
8747	Gudvangen	Gudvangen	Norway	GUD		
8748	Taiwan High Speed Rail Station	Hsinchu	Taiwan			
8749	High Speed Rail Station	Tainan	Taiwan			
8750	Thingvellir National Park	Selfoss	Iceland	TNP		
8751	Goteborgs Centralstation	Gothenburg	Sweden			
8752	Stockholms Centralstation	Stockholm	Sweden			
8753	St Ignace Ferry Terminal	St Ignace 	United States			
8754	Le Port de Toulon	Toulon	France			
8755	Taiwan High Speed Rail Station	Taichung	Taiwan			
8756	Taiwan High Speed Rail Station	Chiayi	Taiwan			
8757	Hsinchu Station	Hsinchu	Taiwan			
8758	Phaya Thai Station	Bangkok	Thailand			
8759	Britomart Transport Centre	Auckland	New Zealand			
8760	Johannesburg Park Station	Johannesburg	South Africa			
8761	Bryan Station	Bryan	United States			
8762	Seoul Station	Seoul	South Korea			
8763	Tianjin Railway Station	Tianjin	China			
8764	Tianjin South Railway Station	Tianjin	China			
8765	Tianjin West Railway Station	Tianjin	China			
8766	Dongzhimen Station	Beijing	China			
8767	Beijing Daxing International Airport	Beijing	China	PKX	ZBAD	
8768	Kanpur Central Railway Station	Kanpur	India			
8769	Lucknow NR Railway Station	Lucknow	India			
8770	Varanasi Junction Railway Station	Varanasi	India			
8771	Gaya Junction Railway Station	Gaya	India			
8772	Sealdah Railway Station	Kolkata	India			
8773	Mumbai Central Railway Station	Mumbai	India			
8774	Bangalore City Railway Station	Bangalore	India			
8775	Luz Station	Sao Paulo	Brazil			
8776	Wien Hauptbahnhof	Vienna	Austria			
8777	Gare de Chartres	Chartres	France			
8778	Gare de Nogent-le-Rotrou	Nogent-le-Rotrou	France			
8779	Guilin Railway Station	Guilin	China			
8780	Zurich-HB	Zurich	Switzerland			
8781	Ogilvie Transportation Center	Chicago	United States			
8782	Potsdam Hauptbahnhof	Potsdam	Germany			
8783	Oak Park Station	Oak Park	United States			
8784	River Forest Station	River Forest	United States			
8785	Brandenburg Hbf	Brandenburg	Germany			
8786	Magdeburg Hbf	Magdeburg	Germany			
8787	Dessau Hauptbahnhof	Dessau	Germany			
8788	Gare de Lille Europe	Lille	France			
8789	Gare de Calais-Frethun	Calais	France	XFF		
8790	Melrose Park Station	Melrose Park	United States			
8791	Bellwood Station	Bellwood	United States			
8792	Berkeley METRA Station	Berkeley	United States			
8793	Elmhurst Station	Elmhurst	United States			
8794	Villa Park Station	Villa Park	United States			
8795	Lombard Station	Lombard	United States			
8796	Glen Ellyn Station	Glen Ellyn	United States			
8797	College Avenue Station	Wheaton	United States			
8798	Wheaton Station	Wheaton	United States			
8799	Winfield Station	Winfield	United States			
8800	West Chicago Station	West Chicago	United States			
8801	Geneva Station	Geneva	United States			
8802	Milwaukee Intermodal Station	Milwaukee	United States			
8803	Pennsylvania Railroad Station	Fort Wayne	United States			
8804	Helsinki Central Railway Station	Helsinki	Finland	HEC		
8805	Nanjing South Railway Station	Nanjing	China	NKJ		
8806	Ashford International Railway Station	Ashford	United Kingdom	QDH		
8807	Lucerne Railway Station	Lucerne	Switzerland	QLJ		
8808	Doncaster Railway Station	Doncaster	United Kingdom			
8809	Leipzig Hauptbahnhof	Leipzig	Germany	XIT		
8810	Niagara Falls Station	Niagara Falls	Canada	XLV		
8811	Ebbsfleet International Railway Station	Ebbsfleet Valley	United Kingdom	XQE		
8812	Stratford International Station	London	United Kingdom			
8813	Clybourn Station	Chicago	United States			
8814	Ravenswood Station	Chicago	United States			
8815	Rogers Park Station	Chicago	United States			
8816	Evanston Main Street Station	Evanston	United States			
8817	Badu Station	Keelung	Taiwan			
8818	Keelung Station	Keelung	Taiwan			
8819	Yilan Station	Yilan	Taiwan			
8820	Ruifang Station	Ruifang	Taiwan			
8821	Taoyuan Station	Taoyuan	Taiwan			
8822	Zhongli Station	Taoyuan	Taiwan			
8823	Zhunan Station	Zhunan	Taiwan			
8824	Miaoli Station	Miaoli	Taiwan			
8825	Fengyuan Station	Fengyuan	Taiwan			
8826	Changhua Station	Changhua	Taiwan			
8827	Yuanlin Station	Yuanlin	Taiwan			
8828	Douliu Station	Douliu	Taiwan			
8829	Dounan Station	Dounan	Taiwan			
8830	Jingtong Station	Jingtong	Taiwan			
8831	Jiufen Bus Station	Jiufen	Taiwan			
8832	Tamsui Station	Taipei	Taiwan			
8833	Luodong Station	Luodong	Taiwan			
8834	Su'ao Station	Su'ao	Taiwan			
8835	Yingge Station	Yingge	Taiwan			
8836	Banqiao Station	Banqiao	Taiwan			
8837	Shatin Station	Hong Kong	Hong Kong			
8838	Aberdeen Station	Hong Kong	Hong Kong			
8839	Star Ferry Pier-Central	Hong Kong	Hong Kong			
8840	Tsim Sha Tsui Ferry Pier	Hong Kong	Hong Kong			
8841	Kowloon Station-MTR	Hong Kong	Hong Kong			
8842	Tsing Yi Station	Hong Kong	Hong Kong			
8843	Olympic Station	Hong Kong	Hong Kong			
8844	Tung Chung Station	Hong Kong	Hong Kong			
8845	Futian Railway Station	Shenzhen	China			
8846	Marlboro Gautrain Station	Johannesburg	South Africa			
8847	Barajas Station	Madrid	Spain			
8848	Sant Cugat Station	Sant Cugat del Valles	Spain			
8849	Gare de Reims	Reims	France			
8850	Saint Paul Union Depot	Saint Paul	United States			
8851	Daly City BART Station	Daly City	United States			
8852	Yongphulla Airport	Yongphulla	Bhutan	YON	VQTY	
8853	Kymi Airport	Kotka	Finland		EFKY	
8854	Elizabeth Field	Southold	United States	FID		
8855	Richmond Valley Staten Island Railway Station	New York	United States			
8856	Grasmere Staten Island Railway Station	New York	United States			
8857	Bay Ridge 95th Street Station	New York	United States			
8858	Parkchester Station	New York	United States			
8859	George Washington Bridge Bus Station	New York	United States			
8860	Providence Station	Providence	United States	ZRV		
8861	Attleboro MBTA Station	Attleboro	United States			
8862	North Falmouth Railroad Station	North Falmouth	United States			
8863	Woods Hole Railroad Station	Woods Hole	United States			
8864	Buzzards Bay Train Station	Buzzards Bay	United States			
8865	Old Saybrook Amtrak Station	Old Saybrook	United States			
8866	Schenectady Amtrak Station	Schenectady	United States	ZTD		
8867	Danyang Railway Station	Danyang	China	DYN		
8868	Tikkurila Railway Station	Helsinki	Finland	HVT		
8869	Gare de Champagne-Ardenne TGV	Reims	France	XIZ		
8870	Sundsvall Railway Station	Sundsvall	Sweden	XXZ		
8871	Haparanda Railway Station	Haparanda	Sweden			
8872	Tornio Railway Station	Tornio	Finland			
8873	Kemi Railway Station	Kemi	Finland			
8874	Oulu Railway Station	Oulu	Finland			
8875	Vartahamnen	Stockholm	Sweden			
8876	Olympia Terminal	Helsinki	Finland			
8877	Suomenlinna	Helsinki	Finland			
8878	Market Square	Helsinki	Finland			
8879	Hangzhou East Railway Station	Hangzhou	China			
8880	Gare du Creusot TGV	Le Creusot	France			
8881	Gare de Macon Loche TGV	Macon	France			
8882	Gare du Nord	Mulhouse	France			
8883	Egerkingen Bahnhof	Egerkingen	Switzerland			
8884	Pratteln Bahnhof	Pratteln	Switzerland			
8885	Aarburg-Oftringen Bahnhof	Aarburg-Oftringen	Switzerland			
8886	Amersfoort Railway Station	Amersfoort	Netherlands			
8887	Apeldoorn Railway Station	Apeldoorn	Netherlands			
8888	Deventer Railway Station	Deventer	Netherlands			
8889	Almelo Railway Station	Almelo	Netherlands			
8890	Hengelo Railway Station	Hengelo	Netherlands			
8891	Rheine Railway Station	Rheine	Germany			
8892	Hilversum Railway Station	Hilversum	Netherlands			
8893	Amsterdam Sloterdijk	Amsterdam	Netherlands			
8894	Leiden Centraal	Leiden	Netherlands			
8895	Den Haag HS	Den Haag	Netherlands			
8896	Schiedam Centrum	Schiedam	Netherlands			
8897	Rotterdam Zuid	Rotterdam	Netherlands			
8898	Zwijndrecht Railway Station	Zwijndrecht	Netherlands			
8899	Roosendaal Railway Station	Roosendaal	Netherlands			
8900	Antwerpen-Luchtbal	Antwerpen	Belgium			
8901	Mechelen Railway Station	Mechelen	Belgium			
8902	Gare de Schaerbeek	Brussels	Belgium			
8903	Puhinui Railway Station	Auckland	New Zealand			
8904	Hardy Reef	Airlie Beach	Australia			
8905	Hamburg-Bergedorf Station	Hamburg	Germany			
8906	Schwarzenbek Bahnhof	Schwarzenbek	Germany			
8907	Buchen Bahnhof	Buchen	Germany			
8908	Schwanheide Bahnhof	Schwanheide	Germany			
8909	Boizenburg Bahnhof	Boizenburg	Germany			
8910	Hagenow Bahnhof	Hagenow	Germany			
8911	Ludwigslust Bahnhof	Ludwigslust	Germany			
8912	Wittenberge Bahnhof	Wittenberge	Germany			
8913	Neustadt Dosse Bahnhof	Neustadt	Germany			
8914	Falkensee Bahnhof	Falkensee	Germany			
8915	Spandau Bahnhof	Berlin	Germany			
8916	Nauen Bahnhof	Nauen	Germany			
8917	Westkreuz	Berlin	Germany			
8918	Half Moon Bay Airport	Half Moon Bay	United States	HAF	KHAF	
8919	Woodside Sta.	Woodside	United States			
8920	Ocean Beach Muni Metro Station	San Francisco	United States			
8921	Hechi Jinchengjiang Airport	Hechi	China	HCJ	ZGHC	
8922	Sunshine Railway Station	Melbourne	Australia			
8923	Plaza de los Virreyes Station	Buenos Aires	Argentina			
8924	Beusselstrasse Station	Berlin	Germany			
8925	Fulong Station	Fulong	Taiwan			
8926	Nan-ao Station	Nan-ao	Taiwan			
8927	Genthin Bahnhof	Genthin	Germany			
8928	Kadina Airport	Kadina	Australia		YKDI	
8929	General WM J Fox Airfield	Lancaster	United States	WJF	KWJF	
8930	Kern Valley Airport	Kernville	United States	L05		
8931	Chapman River Wines Airstrip	Penneshaw	Australia			
8932	Wilpena Pound Resort Airstrip	Wilpena	Australia			
8933	Dupont-Lapeer	Lapeer  MI 	United States	D95		
8934	Osloer Strasse	Berlin	Germany			
8935	Xinwuri Station	Taichung	Taiwan			
8936	Coondewanna Airport	Coondewanna	Australia	CJF	YCWA	
8937	Gdynia Glowna	Gdynia	Poland			
8938	Sopot Railway Station	Sopot	Poland			
8939	Marlboro Gautrain Station	Johannesburg	South Africa			
8940	Ershui Station	Ershui	Taiwan			
8941	Tianzhong Station	Tianzhong	Taiwan			
8942	Houli Station	Houli	Taiwan			
8943	Sanyi Station	Sanyi	Taiwan			
8944	Tongluo Station	Tongluo	Taiwan			
8945	Shulin Station	Taipei	Taiwan			
8946	Banqiao Station	Taipei	Taiwan			
8947	Wanhua Station	Taipei	Taiwan			
8948	Hukou Station	Hukou	Taiwan			
8949	Yangmei Station	Yangmei	Taiwan			
8950	Chenggong Station	Taichung	Taiwan			
8951	Mets Willets Point Station	New York City	United States			
8952	BWI Rail Station	Baltimore	United States			
8953	Tysons Corner Station	Washington	United States			
8954	Erkner Bahnhof	Erkner	Germany			
8955	Pankow-Heinersdorf Bahnhof	Berlin	Germany			
8956	Hohenschonhausen Bahnhof	Berlin	Germany			
8957	Wuhlheide Bahnhof	Berlin	Germany			
8958	Blankenfelde Bahnhof	Berlin	Germany			
8959	Bad Belzig Bahnhof	Bad Belzig	Germany			
8960	Cottbuser Bahnhof	Grossenhain	Germany			
8961	Pirna Bahnhof	Pirna	Germany			
8962	Hlavni Nadrazi	Decin	Czech Republic			
8963	Usti nad Labem Hlavni Nadrazi	Usti nad Labem	Czech Republic			
8964	Lovosice Hlavni Nad.	Lovosice	Czech Republic			
8965	Roudnice nad Labem Hlavni Nad.	Roudnice nad Labem	Czech Republic			
8966	Kralupy nad Vltavou Hlavni Nad.	Kralupy nad Vltavou	Czech Republic			
8967	Neustadt Bahnhof	Dresden	Germany			
8968	Furstenwalde Bahnhof	Furstenwalde	Germany			
8969	Dworzec Kolejowy	Inowroclaw	Poland			
8970	Bydgoszcz Glowna	Bydgoszcz	Poland			
8971	Dworzec PKP	Tczew	Poland			
8972	Dunbar Railway Station	Dunbar	United Kingdom			
8973	Berwick-upon-Tweed Railway Station	Berwick-upon-Tweed	United Kingdom			
8974	Chathill Railway Station	Chathill	United Kingdom			
8975	Motherwell Railway Station	Motherwell	United Kingdom			
8976	Wishaw Railway Station	Wishaw	United Kingdom			
8977	Carluke Railway Station	Carluke	United Kingdom			
8978	Haymarket Railway Station	Edinburgh	United Kingdom			
8979	Carstairs Railway Station	Carstairs	United Kingdom			
8980	Musselburgh Railway Station	Musselburgh	United Kingdom			
8981	Wallyford Railway Station	Wallyford	United Kingdom			
8982	Prestonpans Railway Station	Prestonpans	United Kingdom			
8983	Longniddry Railway Station	Longniddry	United Kingdom			
8984	Drem Railway Station	Drem	United Kingdom			
8985	North Berwick Railway Station	North Berwick	United Kingdom			
8986	Alnmouth Railway station	Alnmouth	United Kingdom			
8987	Acklington Railway Station	Acklington	United Kingdom			
8988	Widdrington Railway Station	Widdrington	United Kingdom			
8989	Pegswood Railway Station	Pegswood	United Kingdom			
8990	Morpeth Railway Station	Morpeth	United Kingdom			
8991	Cramlington Railway Station	Cramlington	United Kingdom			
8992	Manors Railway Station	Newcastle Upon Tyne	United Kingdom			
8993	Chester-le-Street Railway Station	Chester-le-Street	United Kingdom			
8994	Durham Railway Station	Durham	United Kingdom			
8995	Darlington Railway Station	Darlington	United Kingdom			
8996	Northallerton Railway Station	Northallerton	United Kingdom			
8997	Thirsk Railway Station	Thirsk	United Kingdom			
8998	Retford Railway Station	Retford	United Kingdom			
8999	North Gate Railway Station	Newark	United Kingdom			
9000	Grantham Railway Station	Grantham	United Kingdom			
9001	Huntingdon Railway Station	Huntingdon	United Kingdom			
9002	St. Neots Railway Station	St. Neots	United Kingdom			
9003	Sandy Railway Station	Sandy	United Kingdom			
9004	Biggleswade Railway Station	Biggleswade	United Kingdom			
9005	Arlesey Railway Station	Arlesey	United Kingdom			
9006	Hitchin Railway Station	Hitchin	United Kingdom			
9007	Knebworth Railway Station	Knebworth	United Kingdom			
9008	Welwyn North Railway Station	Welwyn	United Kingdom			
9009	Welwyn Garden City Railway Station	Welwyn Garden City	United Kingdom			
9010	Hatfield Railway Station	Hatfield	United Kingdom			
9011	Welham Green Railway Station	Welham Green	United Kingdom			
9012	Brookmans Park Railway Station	Brookmans Park	United Kingdom			
9013	Hadley Wood Railway Station	Hadley Wood	United Kingdom			
9014	New Barnet Railway Station	Barnet	United Kingdom			
9015	Oakleigh Park Railway Station	Oakleigh Park	United Kingdom			
9016	New Southgate Railway Station	Enfield	United Kingdom			
9017	Alexandra Palace Railway Station	Haringey	United Kingdom			
9018	Hornsey Railway Station	Haringey	United Kingdom			
9019	Harringay Railway Station	Harringay	United Kingdom			
9020	Ealing Broadway Station	Ealing	United Kingdom			
9021	West Ealing Railway Station	West Ealing	United Kingdom			
9022	Hanwell Railway Station	Hanwell	United Kingdom			
9023	Southall Railway Station	Southall	United Kingdom			
9024	Hayes and Harlington Railway Station	Hayes	United Kingdom			
9025	Heathrow Junction Railway Station	Hillingdon	United Kingdom			
9026	Gare TGV Haute-Picardie	Haute-Picardie	France			
9027	Dagenham Dock Railway Station	Dagenham	United Kingdom			
9028	Rainham Essex Railway Station	Rainham Essex	United Kingdom			
9029	63rd - CTA Station	Chicago	United States			
9030	Adam Benjamin Metro Center	Gary	United States			
9031	Harpers Ferry Train Station	Harpers Ferry	United States			
9032	Cumberland Amtrak Station	Cumberland	United States			
9033	Connellsville Amtrak Station	Connellsville	United States			
9034	Petersburg Amtrak	Petersburg	United States			
9035	Rocky Mount Amtrak Station	Rocky Mount	United States			
9036	Columbia Amtrak Station	Columbia	United States			
9037	Savannah Amtrak Station	Savannah	United States			
9038	Jacksonville Station	Jacksonville	United States			
9039	Union Station	Ocala	United States			
9040	Lakeland Amtrak	Lakeland	United States			
9041	Winter Haven Amtrak Station	Winter Haven	United States			
9042	Sebring Station	Sebring	United States			
9043	Okeechobee Amtrak Station	Okeechobee	United States			
9044	West Palm Beach Station	West Palm Beach	United States			
9045	Boynton Beach Station	Boynton Beach	United States			
9046	Sturtevant Amtrak Station	Sturtevant	United States			
9047	Battersea Park Railway Station	London	United Kingdom			
9048	Clapham Junction Railway Station	London	United Kingdom			
9049	Wandsworth Common Railway Station	London	United Kingdom			
9050	Balham Station	London	United Kingdom			
9051	Streatham Common Railway Station	London	United Kingdom			
9052	Norbury Railway Station	Croydon	United Kingdom			
9053	Thornton Heath Railway Station	Croydon	United Kingdom			
9054	Selhurst Railway Station	Croydon	United Kingdom			
9055	East Croydon Station	Croydon	United Kingdom			
9056	South Croydon Railway Station	Croydon	United Kingdom			
9057	Purley Oaks Railway Station	Croydon	United Kingdom			
9058	Purley Railway Station	Croydon	United Kingdom			
9059	Coulsdon South Railway Station	Croydon	United Kingdom			
9060	Merstham Railway Station	Merstham	United Kingdom			
9061	Redhill Railway Station	Redhill	United Kingdom			
9062	Earlswood Railway Station	Earlswood	United Kingdom			
9063	Salfords Railway Station	Salfords	United Kingdom			
9064	Horley Railway Station	Horley	United Kingdom			
9065	Gatwick Airport Railway Station	Crawley	United Kingdom			
9066	Acton Main Line Railway Station	London	United Kingdom			
9067	Heathrow Central Railway Station	Hillingdon	United Kingdom			
9068	Aeroport Charles de Gaulle 2 TGV	Tremblay-en-France	France			
9069	Orlyval Sud Station	Orly	France			
9070	Glasgow Airport Railway Station	Glasgow	United Kingdom			
9071	Brussels Airport Zaventem Railway Station	Brussels	Belgium			
9072	Airport - Rodalies de Catalunya	El Prat	Spain			
9073	Aeroporto Railway Station	Malpensa	Italy			
9074	Aeroporto Railway Station	Fiumicino	Italy			
9075	Zurich Airport Railway Station	Kloten	Switzerland			
9076	Airport Terminal Station	Freising	Germany			
9077	Flughafen Wien Railway Station	Schwechat	Austria			
9078	Nyugati Railway Terminal	Budapest	Hungary			
9079	Ferihegy Railway Station	Ferihegy	Hungary			
9080	Flughafen U-Bahn	Nuremberg	Germany			
9081	Airport Regional Station	Frankfurt	Germany			
9082	Dusseldorf Airport Station	Dusseldorf	Germany			
9083	Hamburg Airport Station	Fuhlsbuttel	Germany			
9084	Kastrup Airport Station	Kastrup	Denmark			
9085	Schonefeld Flughafen Station	Schonefeld	Germany			
9086	Brandenburg Airport Railway Station	Schonefeld	Germany			
9087	Loughborough Station	Loughborough	United Kingdom			
9088	Castaway Cay	Castaway Cay	Bahamas			
9089	Station van Leuven	Leuven	Belgium			
9090	Hineno Station	Izumisano	Japan			
9091	Mikunigaoka Station	Sakai-ku	Japan			
9092	Tennoji Station	Osaka	Japan			
9093	Shin-Imamiya Station	Osaka	Japan			
9094	Imamiya Station	Osaka	Japan			
9095	Taisho Station	Osaka	Japan			
9096	Bentencho Station	Osaka	Japan			
9097	Nishikujo Station	Osaka	Japan			
9098	Osaka Station	Osaka	Japan			
9099	Yokohama Station	Yokohama	Japan			
9100	Shinagawa Station	Tokyo	Japan			
9101	Kawasaki Station	Kawasaki	Japan			
9102	Guarapari Airport	Guarapari	Brazil	GUZ	SNGA	
9103	Ubatuba Airport	Ubatuba	Brazil	UBT	SDUB	
9104	Port of Algeciras	Algeciras	Spain			
9105	Keiseinarita Station	Narita	Japan			
9106	Narita Station	Narita	Japan			
9107	Shisui Station	Shisui	Japan			
9108	Sakura Station Chiba	Sakura	Japan			
9109	Yotsukaido Station	Yotsukaido	Japan			
9110	Chiba Station	Chiba	Japan			
9111	Tsudanuma Station	Narashino	Japan			
9112	Nishi-Funabashi Station	Funabashi	Japan			
9113	Ichikawa Station	Ichikawa	Japan			
9114	Kameido Station	Tokyo	Japan			
9115	Narita Airport Terminal 2 Station	Narita	Japan			
9116	Haneda Airport International Terminal Station	Tokyo	Japan			
9117	Haneda Airport Terminal 2 Station	Tokyo	Japan			
9118	Haneda Airport Terminal 1 Station	Tokyo	Japan			
9119	Kansai Airport Station	Tajiri	Japan			
9120	Incheon International Airport Station	Incheon	South Korea			
9121	Gimpo International Airport Station	Seoul	South Korea			
9122	Hong Kong International Airport Station	Hong Kong	Hong Kong			
9123	Hong Kong Boundary Crossing Facilities	Hong Kong	Hong Kong			
9124	Dulles International Airport Station	Chantilly	United States			
9125	Airport MBTA Station	East Boston	United States			
9126	Reagan National Airport Station	Arlington	United States			
9127	King Street-Old Town Station	Arlington	United States			
9128	Airport MARTA Station	Atlanta	United States			
9129	Peachtree Center MARTA Station	Atlanta	United States			
9130	Lenox MARTA Station	Atlanta	United States			
9131	Seattle Center Monorail	Seattle	United States			
9132	Westlake Center Monorail	Seattle	United States			
9133	WSF Terminal Pier 52	Seattle	United States			
9134	Court Square	New York	United States			
9135	Chambers Street - World Trade Center - Park Place	New York	United States			
9136	Secaucus Junction	Secaucus	United States			
9137	Prospect Ave. BMT 4th Ave. Line	New York	United States			
9138	Union Passenger Terminal	New Orleans	United States			
9139	Canal at Carondelet Streetcar Stop	New Orleans	United States			
9140	St. Charles at Lee Circle Streetcar Stop	New Orleans	United States			
9141	St. Charles at Louisiana Streetcar Stop	New Orleans	United States			
9142	St. Charles at Jefferson Streetcar Stop	New Orleans	United States			
9143	St. Charles at S. Carrollton Streetcar Stop	New Orleans	United States			
9144	S. Carrollton at S. Claiborne Streetcar Stop	New Orleans	United States			
9145	Union Station	Indianapolis	United States			
9146	Albion Amtrak Station	Albion	United States			
9147	Racine North Shore Station	Racine	United States			
9148	La Crosse Amtrak Station	La Crosse	United States			
9149	Wisconsin Dells Amtrak Station	Wisconsin Dells	United States			
9150	Portage Amtrak Station	Portage	United States			
9151	Richland Center Station	Richland Center	United States			
9152	SFO BART Station	Millbrae	United States			
9153	Embarcadero Station	San Francisco	United States			
9154	San Bruno BART Station	San Bruno	United States			
9155	Ashby BART Station	Berkeley	United States			
9156	Blake Knolls	Blake Knolls	United States			
9157	Aeropuerto T4 Madrid Metro	Madrid	Spain			
9158	Barajas Station Madrid Metro	Barajas	Spain			
9159	St. Polten Hauptbahnhof	St. Polten	Austria			
9160	Bahnhof Amstetten	Amstetten	Austria			
9161	Linz Hauptbahnhof	Linz	Austria			
9162	Wels Hauptbahnhof	Wels	Austria			
9163	Bahnhof Attnang-Puchheim	Attnang-Puchheim	Austria			
9164	Innsbruck Hauptbahnhof	Innsbruck	Austria			
9165	Bahnhof Bludenz	Bludenz	Austria			
9166	Bahnhof Feldkirch	Feldkirch	Austria			
9167	Buchs SG Bahnhof	Buchs SG	Switzerland			
9168	Bahnhof Sargans	Sargans	Switzerland			
9169	Ali Air Base	Nasiriyah	Iraq		ORTL	
9170	Yangcheng Lake Railway Station	Kunshan	China			
9171	Huaqiao Railway Station	Kunshan	China			
9172	Anting North Railway Station	Jiading	China			
9173	Nanxiang North Railway Station	Jiading	China			
9174	Shanghai West Railway Station	Shanghai	China			
9175	Ota Air Base	Ota	Portugal		LPOT	
9176	Borroloola Airport	Borroloola	Australia	BOX	YBRL	
9177	Songjiang South Railway Station	Shanghai	China			
9178	Jinshan North Railway Station	Jinshan	China			
9179	Jiashan South Railway Station	Jiashan	China			
9180	Jiaxing South Railway Station	Jiaxing	China			
9181	Tongxiang Railway Station	Tongxiang	China			
9182	Haining West Railway Station	Haining	China			
9183	Yuhang Railway Station	Hangzhou	China			
9184	Hangzhou South Railway Station	Hangzhou	China			
9185	Suvarnabhumi Station	Bangkok	Thailand			
9186	Lat Krabang Station	Bangkok	Thailand			
9187	Ban Thap Chang Station	Bangkok	Thailand			
9188	Hua Mak Station	Bangkok	Thailand			
9189	Ramkhamhaeng Station	Bangkok	Thailand			
9190	City Air Terminal	Bangkok	Thailand			
9191	Ratchaprarop Station	Bangkok	Thailand			
9192	Tambo Int'l. Airport Gautrain Station	Kempton Park	South Africa			
9193	Rhodesfield Gautrain Station	Kempton Park	South Africa			
9194	Sandton Gautrain Station	Johannesburg	South Africa			
9195	Rosebank Gautrain Station	Johannesburg	South Africa			
9196	Sydney International Airport Station	Mascot	Australia			
9197	Sydney Domestic Airport Station	Mascot	Australia			
9198	Mascot Railway Station	Mascot	Australia			
9199	Green Square Railway Station	Green Square	Australia			
9200	Mangonia Park Station	Mangonia Park	United States			
9201	Lake Worth Station	Lake Worth	United States			
9202	Delray Beach Station	Delray Beach	United States			
9203	Boca Raton Station	Boca Raton	United States			
9204	New London Union Station	New London	United States			
9205	Howrah Junction Railway Station	Howrah	India			
9206	Asansol Railway Station	Asansol	India			
9207	Mughalsarai Junction Railway Station	Mughalsarai	India			
9208	Allahabad Junction Railway Station	Allahabad	India			
9209	Delhi Airport Metro Station	Delhi	India			
9210	Delhi Aerocity Metro Station	Delhi	India			
9211	Dhaula Kuan Metro Station	Delhi	India			
9212	Shivaji Stadium Metro Station	Delhi	India			
9213	Santacruz Railway Station	Mumbai	India			
9214	Airport Road Metro Station	Mumbai	India			
9215	Andheri Railway Station	Mumbai	India			
9216	Bandra Railway Station	Mumbai	India			
9217	Dadar Railway Station	Mumbai	India			
9218	Vadala Road Railway Station	Mumbai	India			
9219	Chhatrapati Shivaji Terminus	Mumbai	India			
9220	Bhabua Road Railway Station	Bhabua	India			
9221	Dehri-on-Sone Railway Station	Dehri	India			
9222	Koderma Railway Station	Koderma	India			
9223	Parasnath Railway Station	Isri	India			
9224	Dhanbad Junction Railway Station	Dhanbad	India			
9225	Durgapur Railway Station	Durgapur	India			
9226	Barddhaman Junction Railway Station	Barddhaman	India			
9227	Hazrat Nizamuddin Railway Station	New Delhi	India			
9228	Faridabad Railway Station	Faridabad	India			
9229	Mathura Junction Railway Station	Mathura	India			
9230	Yamuna Bridge Railway Station	Etmaddoula	India			
9231	Tundla Junction Railway Station	Tundla	India			
9232	Firozabad Railway Station	Firozabad	India			
9233	Shikohabad Railway Station	Shikohabad	India			
9234	Etawah Railway Station	Etawah	India			
9235	Unnao Junction Railway Station	Unnao	India			
9236	Incheon Airport Cargo Terminal Station	Incheon	South Korea			
9237	Unseo Station	Incheon	South Korea			
9238	Cheongna International City Station	Incheon	South Korea			
9239	Geomam Station	Incheon	South Korea			
9240	Gyeyang Station	Incheon	South Korea			
9241	Magongnaru Station	Seoul	South Korea			
9242	Digital Media City Station	Seoul	South Korea			
9243	Hongik University Station	Seoul	South Korea			
9244	Gongdeok Station	Seoul	South Korea			
9245	Yizhuang Railway Station	Beijing	China			
9246	Yongle Railway Station	Yongle	China			
9247	Wuqing Railway Station	Wuqing	China			
9248	Huangcun Railway Station	Beijing	China			
9249	Fengtai Railway Station	Beijing	China			
9250	Langfang North Railway Station	Langfang	China			
9251	Dongmajuanzhen Railway Station	Wuqing	China			
9252	Yangcun Railway Station	Wuqing	China			
9253	Tianjin North Railway Station	Tianjin	China			
9254	Aeroport Charles de Gaulle 1 RER	Tremblay-en-France	France			
9255	Gare de La Plaine-Stade de France RER	Saint-Denis	France			
9256	Gare du Bourget	Le Bourget	France			
9257	Gare Aulnay-sous-Bois	Aulnay-sous-Bois	France			
9258	Parc des Expositions RER	Villepinte	France			
9259	Auckland Ferry Terminal	Auckland	New Zealand			
9260	Mount Eden Railway Station	Mount Eden	New Zealand			
9261	North Melbourne Railway Station	Melbourne	Australia			
9262	South Kensington Railway Station	Kensington	Australia			
9263	Footscray Railway Station	Footscray	Australia			
9264	Middle Footscray Railway Station	Footscray	Australia			
9265	West Footscray Railway Station	Footscray	Australia			
9266	Tottenham Railway Station	Tottenham	Australia			
9267	Albion Railway Station Melbourne	Melbourne	Australia			
9268	Guangzhou East Railway Station	Guangzhou	China			
9269	Shenzhen East Railway Station	Shenzhen	China			
9270	Airport South Station	Guangzhou	China			
9271	Airport East Station	Shenzhen	China			
9272	Futian Checkpoint Station	Shenzhen	China			
9273	Lok Ma Chau Station	Hong Kong	Hong Kong			
9274	Lo Wu Station	Hong Kong	Hong Kong			
9275	University Station MTR	Hong Kong	Hong Kong			
9276	Tai Wai Station MTR	Hong Kong	Hong Kong			
9277	Tung Chung Station	Hong Kong	Hong Kong			
9278	Tanah Merah MRT Station	Singapore	Singapore			
9279	Changi Airport MRT Station	Singapore	Singapore			
9280	Cham	Cham	Germany			
9281	Elsenthal Grafe Airport	Elsenthal	Germany		EDNF	
9282	Qingsheng Station	Qingsheng	China			
9283	Humen Railway Station	Dongguan	China			
9284	Guangmingcheng Station	Guangming	China			
9285	Capital Intl Terminal 2 Station	Beijing	China			
9286	Capital Intl Terminal 3 Station	Beijing	China			
9287	Sanyuanqiao Station	Beijing	China			
9288	Zhongguancun Station	Beijing	China			
9289	Pudong Intl Airport Station	Shanghai	China			
9290	Hangjin Road Station	Shanghai	China			
9291	Xujiahui Station	Shanghai	China			
9292	Hailun Road Station	Shanghai	China			
9293	Binhaiguojijichang Station	Tianjin	China			
9294	Songshan Airport Station	Taipei	Taiwan			
9295	Kaohsiung Intl Airport KMRT Station	Kaohsiung	Taiwan			
9296	Marina Bay MRT Station	Singapore	Singapore			
9297	Midway CTA Station	Chicago	United States			
9298	Caspian Sea	Shah Deniz	Azerbaijan		SDA0	
9299	Eindhoven Station	Eindhoven	Netherlands			
9300	Anaheim Regional Transportation Intermodal Center	Anaheim	United States			
9301	Simi Valley Train Station	Simi Valley	United States			
9302	Newtownards Airport	Newtownards	United Kingdom		EGAD	
9303	Lashenden (Headcorn) Airfield	Headcorn	United Kingdom		EGKH	
9304	Panshanger Aerodrome	Panshanger	United Kingdom		EGLG	
9305	Thurrock Airfield	Thurrock	United Kingdom		EGMT	
9306	Stapleford Aerodrome	Stapleford	United Kingdom		EGSG	
9307	Meppershall	Meppershall	United Kingdom		MEPP	
9308	HAL Airport	Bangalore	India		VOBG	
9309	Chichester/Goodwood Airport	Goodwood	United Kingdom	QUG	EGHR	
9310	Omarama Glider Airport	Omarama	New Zealand		NZOA	
9311	Haast Aerodrome	Haast	New Zealand		NZHT	
9312	Estacio Station	Rio de Janeiro	Brazil			
9313	Wuzhou Avenue Station	Shanghai	China			
9314	Waigaoqiao FTZ South Station	Shanghai	China			
9315	Disney Resort Station	Shanghai	China			
9316	Saint Paul Union Depot	St. Paul	United States			
9317	Target Field Metro Transit Station	Minneapolis	United States			
9318	Mall of America Metro Transit Station	Bloomington	United States			
9319	Terminal 1 Lindbergh Metro Transit Station	Hennepin County	United States			
9320	Terminal 2 Humphrey Metro Transit Station	Hennepin County	United States			
9321	Ferno-Lonate Pozzolo Railway Station	Ferno	Italy			
9322	Busto Arsizio Nord Railway Station	Busto Arsizio	Italy			
9323	Saronno Railway Station	Saronno	Italy			
9324	Milano Bovisa-Politecnico Railway Station	Milan	Italy			
9325	Milano Lambrate Railway Station	Milan	Italy			
9326	Milano Rogoredo Railway Station	Milan	Italy			
9327	Reggio Emilia AV Mediopadana Railway Station	Reggio Emilia	Italy			
9328	Campo di Marte Railway Station	Florence	Italy			
9329	Roma Tiburtina Railway Station	Rome	Italy			
9330	Gare de Rambouillet	Rambouillet	France			
9331	Gare de La Verriere	La Verriere	France			
9332	Gare de Saint-Quentin-en-Yvelines	Saint-Quentin-en-Yvelines	France			
9333	Gare de Versailles-Chantiers	Versailles	France			
9334	Meschede-Schüren Airport	Meschede	Germany		EDKM	
9335	Bahnhof Zurich Oerlikon	Zurich	Switzerland			
9336	Devinska Nova Ves	Bratislava	Slovakia			
9337	Huangcun Railway Station	Beijing	China			
9338	Lichterfelde Ost station	Berlin	Germany			
9339	Wunsdorf-Waldstadt Station	Wunsdorf	Germany			
9340	Doberlug-Kirchhain Station	Doberlug-Kirchhain	Germany			
9341	Kopenick Station	Berlin	Germany			
9342	Friedrichshagen Station	Berlin	Germany			
9343	Ostkreuz Station	Berlin	Germany			
9344	Treptower Park Station	Berlin	Germany			
9345	Planterwald Railway Station	Berlin	Germany			
9346	Adlershof Station	Berlin	Germany			
9347	Storkower Strasse Station	Berlin	Germany			
9348	Schonhauser Allee Station	Berlin	Germany			
9349	Gov Joao Durval Carneiro Airport	Feira de Santana	Brazil	FEC	SBFE	
9350	Jumandy Airport	Tena	Ecuador	TNW	SEJD	
9351	Chitina Airport	Chitina	United States	CXC		
9352	Morro da Urca Heliport	Rio de Janeiro	Brazil		SDHU	
9353	Neufahrn Station	Neufahrn bei Freising	Germany			
9354	Oberschleissheim Station	Oberschleissheim	Germany			
9355	Moosach Station	Munich	Germany			
9356	Laim Station	Munich	Germany			
9357	Marienplatz Station	Munich	Germany			
9358	Dongji Aiport	Fuyuan	China	FYJ	ZYFY	
9359	Como San Giovanni Railway Station	Como	Italy		COMO	
9360	Skúvoy Heliport	Skuvoy	Faroe Islands		EKSY	
9361	Stóra Dímun Heliport	Stora Dimun	Faroe Islands		EKSR	
9362	Frooba Heliport	Frooba	Faroe Islands		EKFA	
9363	Frankfurt Stadion Station	Frankfurt	Germany			
9364	Frankfurt Niederrad Station	Frankfurt	Germany			
9365	Expo MRT Station	Singapore	Singapore			
9366	Boden Central Station	Boden	Sweden			
9367	Vihanti Railway Station	Vihanti	Finland			
9368	Oulainen Railway Station	Oulainen	Finland			
9369	Ylivieska Railway Station	Ylivieska	Finland			
9370	Kokkola Railway Station	Kokkola	Finland			
9371	Seinajoki Railway Station	Seinajoki	Finland			
9372	Tampere Railway Station	Tampere	Finland			
9373	Toijala Railway Station	Akaa	Finland			
9374	Hameenlinna Railway Station	Hameenlinna	Finland			
9375	Riihimaki Railway Station	Riihimaki	Finland			
9376	Hyvinkaa Railway Station	Hyvinkaa	Finland			
9377	Jokela Railway Station	Tuusula	Finland			
9378	Saunakallio Railway Station	 Jarvenpaa	Finland			
9379	Jarvenpaa Railway Station	Jarvenpaa	Finland			
9380	Kyrola Railway Station	Jarvenpaa	Finland			
9381	Kerava Railway Station	Kerava	Finland			
9382	Savio Railway Station	Kerava	Finland			
9383	Korso Railway Station	Vantaa	Finland			
9384	Rekola Railway Station	Vantaa	Finland			
9385	Koivukyla Railway Station	Vantaa	Finland			
9386	Hiekkaharju Railway Station	Vantaa	Finland			
9387	Tikkurila Railway Station	Vantaa	Finland			
9388	Tappahannock Municipal	Tappahannock	United States	W79		
9389	Person County Airport	Roxboro	United States		KTDF	
9390	Chur railway station	Chur	Switzerland		CHUR	
9391	Tirano Rhaetian Railway station	Tirano	Italy		TIRA	
9392	Ballon Mathes	Selzen	Germany			
9393	Ballon Mathes	Gau-Odernheim	Germany			
9394	Helipad	Foz do Iguacu	Brazil			
9395	Skydive	Dubai	United Arab Emirates			
9396	Flugvellir	Skaftafell	Iceland		BISL	
9397	Maibara Station	Maibara	Japan			
9398	Gifu-Hashima Station	Hashima	Japan			
9399	Mikawa-Anjo Station	Anjo	Japan			
9400	Toyohashi Station	Toyohashi	Japan			
9401	Hamamatsu Station	Hamamatsu	Japan			
9402	Kakegawa Station	Kakegawa	Japan			
9403	Shizuoka Station	Shizuoka	Japan			
9404	Shin-Fuji Station	Fuji	Japan			
9405	Mishima Station	Mishima	Japan			
9406	Atami Station	Atami	Japan			
9407	Odawara Station	Odawara	Japan			
9408	Zurich Oerlikon Railway Station	Zurich	Switzerland			
9409	Puistola Railway Station	Helsinki	Finland			
9410	Tapanila Railway Station	Helsinki	Finland			
9411	Malmi Railway Station	Helsinki	Finland			
9412	Pukinmaki Railway Station	Helsinki	Finland			
9413	Oulunkyla Railway Station	Helsinki	Finland			
9414	Kapyla Railway Station	Helsinki	Finland			
9415	Pasila Railway Station	Helsinki	Finland			
9416	Nykobing Falster Railway Station	Nykobing Falster	Denmark			
9417	Orehoved Railway Station	Orehoved	Denmark			
9418	Vordingborg Railway Station	Vordingborg	Denmark			
9419	Lundby Railway Station	Lundby	Denmark			
9420	Naestved Railway Station	Naestved	Denmark			
9421	Ringsted Railway Station	Ringsted	Denmark			
9422	Hedehusene Railway Station	Hedehusene	Denmark			
9423	Roskilde Railway Station	Roskilde	Denmark			
9424	Hoje-Taastrup Railway Station	Hoje-Taastrup	Denmark			
9425	Albertslund Railway Station	Albertslund	Denmark			
9426	Enghave Railway Station	Copenhagen	Denmark			
9427	Dybbolsbro Railway Station	Copenhagen	Denmark			
9428	Osterport Railway Station	Copenhagen	Denmark			
9429	Nordhavn Railway Station	Copenhagen	Denmark			
9430	Svanemollen Railway Station	Copenhagen	Denmark			
9431	Hellerup Railway Station	Hellerup	Denmark			
9432	Klampenborg Railway Station	Copenhagen	Denmark			
9433	Kokkedal Railway Station	Kokkedal	Denmark			
9434	Esperaerde Railway Station	Esperaerde	Denmark			
9435	Hyllie Railway Station	Malmo	Sweden			
9436	Triangeln Railway Station	Malmo	Sweden			
9437	Dusseldorf-Unterrath Station	Dusseldorf	Germany			
9438	Dusseldorf-Derendorf Station	Dusseldorf	Germany			
9439	Dusseldorf Zoo Station	Dusseldorf	Germany			
9440	Dusseldorf Wehrhahn Station	Dusseldorf	Germany			
9441	Dusseldorf-Flingern Station	Dusseldorf	Germany			
9442	Dusseldorf-Gerresheim Station	Dusseldorf	Germany			
9443	Erkrath Railway Station	Erkrath	Germany			
9444	Hochdahl Station	Erkrath	Germany			
9445	Hochdahl-Millrath Station	Erkrath	Germany			
9446	Gruiten Station	Haan	Germany			
9447	Wuppertal-Vohwinkel Station	Wuppertal	Germany			
9448	Wuppertal-Sonnborn Station	Wuppertal	Germany			
9449	Wuppertal Hauptbahnhof	Wuppertal	Germany			
9450	Sonnborner Strasse Schwebebahn Station	Wuppertal	Germany			
9451	Gangehi Island Seaplane	Gangehi Island	Maldives			
9452	Campbelltown Railway Station	Campbelltown	Australia			
9453	Moss Vale Railway Station	Moss Vale	Australia			
9454	Yass Junction Railway Station	Yass Junction	Australia			
9455	Cootamundra Railway Station	Cootamundra	Australia			
9456	Junee Railway Station	Junee	Australia			
9457	Wagga Wagga Railway Station	Wagga Wagga	Australia			
9458	The Rock Railway Station	The Rock	Australia			
9459	Henty Railway Station	Henty	Australia			
9460	Culcairn Railway Station	Culcairn	Australia			
9461	Albury Railway Station	Albury	Australia			
9462	Wangaratta Railway Station	Wangaratta	Australia			
9463	Benalla Railway Station	Benalla	Australia			
9464	Seymour Railway Station	Seymour	Australia			
9465	Broadmeadows Railway Station	Broadmeadows	Australia			
9466	Jacana Railway Station	Jacana	Australia			
9467	Albion Railway Station	Albion	Australia			
9468	Erskineville Railway Station	Erskineville	Australia			
9469	Sydenham Railway Station	Sydenham	Australia			
9470	Redfern Railway Station	Redfern	Australia			
9471	Tempe Railway Station	Tempe	Australia			
9472	Wolli Creek Railway Station	Wolli Creek	Australia			
9473	Bardwell Park Railway Station	Bardwell Park	Australia			
9474	Glenfield Railway Station	Glenfield	Australia			
9475	Dusseldorf Airport Terminal Station	Dusseldorf	Germany			
9476	Hazel Crest Metra Station	Hazel Crest	United States			
9477	Western Springs Metra Station	Western Springs	United States			
9478	Diva Maldives Resort Seaplane Base	Dhiddhoofinolhu	Maldives			
9479	Riem	Munich	Germany			
9480	Lupin Mine Airport	Lupin Mine	Canada	YWO	CYWO	
9481	South San Francisco BART Station	South San Francisco	United States			
9482	Colma BART Station	Colma	United States			
9483	Balboa Park Station	San Francisco	United States			
9484	Glen Park BART Station	Glen Park	United States			
9485	24th Street Mission BART Station	San Francisco	United States			
9486	16th Street Mission BART Station	San Francisco	United States			
9487	Civic Center - UN Plaza Station	San Francisco	United States			
9488	Bridgetown Port	Bridgetown	Barbados			
9489	Gardiner Bay	Bahia Gardiner	Ecuador			
9490	Post Office	Post Office	Ecuador			
9491	Puerto Ayora	Puerto Ayora	Ecuador			
9492	Zulu Inyala Airport	Phinda	South Africa	PZL	FADQ	
9493	Arlanda North Station	Sigtuna	Sweden			
9494	Arlanda South Station	Sigtuna	Sweden			
9495	Liupanshui Yuezhao Airport	Liupanshui	China	LPF	ZUPS	
9496	Kaili Airport	Kaili	China	KJH	ZUKJ	
9497	Shennongjia Hongping Airport	Shennongjia	China	HPG	ZHSN	
9498	Zhangjiakou Ningyuan Airport	Zhangjiakou	China	ZQZ	ZBZJ	
9499	Arxan Yi'ershi Airport	Arxan	China	YIE	ZBES	
9500	Hengyang Nanyue Airport	Hengyang	China	HNY	ZGHY	
9501	Hongyuan Airport	Ngawa	China	AHJ	ZUHY	
9502	ELMERK	EL MERK	Algeria			
9503	OURHOUD	OURHOUD	Algeria			
9504	MLN	MLN	Algeria			
9505	Kuum-Ni	Tongchon	North Korea			
9506	Pukchang	Pukchang	North Korea			
9507	Wonsan Kalma International Airport	Wonsan	North Korea	WOS	ZKWS	
9508	Hyangsan heliport	Hyangsan	North Korea			
9509	Mestia Queen Tamar Airport	Mestia	Georgia		UGMS	
9510	Magas Airport	Magas	Russia	IGT	URMS	Europe/Moscow
9511	Orient Point Ferry Terminal	Orient	United States			
9512	Evanston Davis Street Station	Evanston	United States			
9513	Evanston Central Street Station	Evanston	United States			
9514	Wilmette Station	Wilmette	United States			
9515	Nashville Riverfront Station	Nashville	Uganda			
9516	Birmingham Station	Birmingham	United States			
9517	Tampa Union Station	Tampa	United States			
9518	Montgomery Union Station	Montgomery	United States			
9519	Dokdo	Dokdo	South Korea			
9520	Ulleungdo	Ulleungdo	South Korea			
9521	Ulleungdo	Ulleungdo	South Korea			
9522	Dokdo	Dokdo	South Korea			
9523	Dokdo	Dokdo	South Korea			
9524	Ulleungdo	Ulleungdo	South Korea			
9525	Gangneung	Gangneung	South Korea			
9526	Ulleungdo	Ulleungdo	South Korea			
9527	Ulleungdo	Ulleungdo	South Korea			
9528	Gangneung	Gangneung	South Korea			
9529	Ulleungdo	Ulleungdo	South Korea			
9530	Gangneung	Gangneung	South Korea			
9531	Ulleungdo	Ulleungdo	South Korea			
9532	Ulleungdo	Ulleungdo	South Korea			
9533	Gangneung	Gangneung	South Korea			
9534	Charlotte Amtrak Station	Charlotte	United States			
9535	Fayetteville Amtrak Station	Fayetteville	United States			
9536	Macau Outer Harbour Ferry Terminal	Macau	Macau			
9537	Kenilworth Station	Kenilworth	United States			
9538	Indian Hill Station	Winnetka	United States			
9539	Winnetka Station	Winnetka	United States			
9540	Hubbard Woods Station	Winnetka	United States			
9541	Glencoe Station	Glencoe	United States			
9542	Braeside Station	Highland Park	United States			
9543	Ravinia Station	Highland Park	United States			
9544	Highland Park Station	Highland Park	United States			
9545	Highwood Station	Highwood	United States			
9546	Fort Sheridan Station	Fort Sheridan	United States			
9547	East Lake Forest Station	Lake Forest	United States			
9548	Lake Bluff Station	Lake Bluff	United States			
9549	Great Lakes Station	Great Lakes	United States			
9550	North Chicago Station	North Chicago	United States			
9551	Waukegan Station	Waukegan	United States			
9552	Zion Station	Zion	United States			
9553	Winthrop Harbor Staiton	Winthrop Harbor	United States			
9554	Kenosha Station	Kenosha	United States			
9555	Ulleungdo	Ulleungdo	South Korea			
9556	Ulleungdo	Ulleungdo	South Korea			
9557	Gangneung	Gangneung	South Korea			
9558	Ulleungdo	Ulleungdo	South Korea			
9559	Ulleungdo	Ulleungdo	South Korea			
9560	Ulleungdo	Ulleungdo	South Korea			
9561	Ashland-Lineville Airport	Lineville	United States	26A		
9562	Talladega Municipal Airport	Talladega	United States	ASN	KASN	
9563	Greenville Downtown Airport	Greenville	United States	GMU	KGMU	
9564	Guntersville Municipal Airport - Joe Starnes Field	Guntersville	United States	8A1		
9565	Ravinia Park Station	Highland Park	United States			
9566	Mankato Regional Airport	Mankato	United States		KMKT	
9567	Captain Auguste George Airport	Anegada	British Virgin Islands	NGD	TUPA	
9568	Troy Municipal Airport at N Kenneth Campbell Field	Troy	United States	TOI	KTOI	
9569	Merkel Field Sylacauga Municipal Airport	Sylacauga	United States		KSCD	
9570	Enterprise Municipal Airport	Enterprise	United States	ETS	KEDN	
9571	Carl Folsom Airport	Elba	United States	14J		
9572	Blackwell Field	Ozark	United States	71J		
9573	Reeves Airport	Tallassee	United States	41A		
9574	South Alabama Regional Airport	Andalusia	United States	79J		
9575	Ryan Field	Tucson	United States		KRYN	
9576	Efogi Airport	Efogi	Papua New Guinea	EFG	AYEF	
9577	Kagi Airport	Kagi	Papua New Guinea	KGW	AYKQ	
9578	Nadunumu Airport	Nadunumu	Papua New Guinea	NDN	AYNC	
9579	Bodinumu Airport	Bodinumu	Papua New Guinea	BNM	AYBD	
9580	Thomas C Russell Field	Alexander City	United States	ALX	KALX	
9581	Ntswi	Ntswi	Botswana		FB56	
9582	Moskovsky railway station	St. Petersburg	Russia			
9583	Leningradsky railway station	Moscow	Russia			
9584	Holyhead Ferry Port	Holyhead	United Kingdom			
9585	Amtrak Station	McComb	United States		MCMB	
9586	Singapore-Tanah Merah Ferry Terminal	Singapore	Singapore			
9587	Batam-Nongsapura Ferry Terminal	Batam	Indonesia			
9588	Port Keats Airport	Wadeye	Australia	PKT	YPKT	
9589	Garden Point Airport	Pirlangimpi	Australia	GPN	YGPT	
9590	Stade Airport	Stade	Germany		EDHS	
9591	Hitakatsu International Passenger Terminal	Tsushima	Japan			
9592	Busan International Passenger Terminal	Busan	South Korea			
9593	Meriden Markham Municipal Airport	Meriden	United States		KMMK	
9594	Howard Airport	Balboa	Panama		MPPA	
9595	Mato de Miranda	Azinhaga do Ribatejo	Portugal			
9596	Flinders Island Airport	Elliston	Australia		YFLS	
9597	Van Buren Street Station	Chicago	United States			
9598	Museum Campus 11th St. Station	Chicago	United States			
9599	57th Street Station	Chicago	United States			
9600	East Chicago Station	East Chicago	United States			
9601	Dune Park Station	Chesterton	United States			
9602	Port Tampa Bay	Tampa Bay	United States			
9603	Port of Roatan	Roatan	Honduras			
9604	Genova Piazza Principe	Genoa	Italy			
9605	La Spezia Centrale	La Spezia	Italy			
9606	Luzern-Beromunster Airport	Lucerne	Switzerland		LSZO	
9607	La Grand'combe Airport	La Grand'Combe	France		LFTN	
9608	Natakhtari	Natakhtari	Georgia			
9609	Hamad International Airport	Doha	Qatar	DOH	OTHH	
9610	Valerio Catullo	VILAFRANCA	Italy			
9611	Fort Mackay / Horizon Airport	Wood Buffalo	Canada	HZP	CYNR	
9612	Canmore Municipal Heliport	Canmore	Canada		CEW9	
9613	Krasnokamensk Airport	Krasnokamensk	Russia		UIAE	
9614	AGAP South	AGAP South	Antarctica			
9615	Hialeah Market Station	Hialeah	United States			
9616	Eisenach Hauptbahnhof	Eisenach	Germany			
9617	Station	Lugano	Switzerland			
9618	Station	Bergen op Zoom	Netherlands			
9619	HaHagana Railway Station	Tel-Aviv	Israel			
9620	Beersheba North Railway Station	Beer-sheba	Israel			
9621	TEST	TSST	Switzerland			
9622	TEST	TSST	Switzerland			
9623	Emmen	EMMEN	Switzerland			
9624	Hof HaCarmel	Haifa	Israel			
9625	Ridgely Airpark	Ridgely	United States		KRJD	
9626	New Castle Henry Co. Municipal Airport	New Castle	United States		KUWL	
9627	Scott City Municipal Airport	Scott City	United States		KTQK	
9628	Brewster Field	Holdredge	United States	HDE	KHDE	
9629	Pratt Regional Airport	Pratt	United States	PTT	KPTT	
9630	Yubileyniy Airfield	Baikonur	Kazakhstan		UAON	
9631	Wahoo Municipal Airport	Wahoo	United States		KAHQ	
9632	Jim Kelly Field	Lexington	United States	LXN	KLXN	
9633	Sublette Municipal Airport	Sublette	United States		K19S	
9634	Council Bluffs Municipal Airport	Council Bluffs	United States	CBF	KCBF	
9635	Kokomo Municipal Airport	Kokomo	United States	OKK	KOKK	
9636	Neodesha Municipal Airport	Neodesha	United States		K2K7	
9637	King Ranch Airport	Sutton	United States		AK59	
9638	Elkhart Morton County Airport	Elkhart	United States		KEHA	
9639	Front Range Airport	Denver	United States		KFTG	
9640	Galesburg Municipal Airport	Galesburg	United States	GBG	KGBG	
9641	Tribune	Tribune	United States	5K2	K5K2	
9642	Guymon Municipal Airport	Guymon	United States	GUY	KGUY	
9643	Camdenton	Camdenton	United States	OZS	KOZS	
9644	Meade Municipal Airport	Meade	United States		KMEJ	
9645	Turkey Mountain Estates Airport	Shell Knob	United States		MO00	
9646	Ulysses Airport	Ulysses	United States		KULS	
9647	Flagler Aerial Spraying Inc Airport	Flagler	United States		CO00	
9648	Independence Municipal Airport	Independence	United States	IDP	KIDP	
9649	Augusta Municipal Airport	Augusta	United States		K3AU	
9650	Larned Pawnee County Airport	Larned	United States		KLQR	
9651	Lampasas Airport	Lampasas	United States		KLZZ	
9652	Bay City Municipal Airport	Bay City	United States	BBC	KBYY	
9653	Cox Field	Paris	United States	PRX	KPRX	
9654	Coffeyville Municipal Airport	Coffeyville	United States	CFV	KCFV	
9655	The Farm Airport	Summit	United States		24SC	
9656	Greeley–Weld County Airport	Greeley	United States	GXY	KGXY	
9657	General Dewitt Spain Airport	Memphis	United States		KM01	
9658	Oryol Yuzhny Airport	Oakley	United States	OEL	UUOR	
9659	Fremont Municipal Airport	Fremont	United States	FET	KFET	
9660	La Grande/Union County Airport	La Grande	United States	LGD	KLGD	
9661	Olsztyn-Mazury Airport	Szczytno-Szymany	Poland	SZY	EPSY	
9662	Center HaShmona Railway Station	Haifa	Israel			
9663	Rehovot Railway Station	Rehovot	Israel			
9664	Fort Erie Megabus Stop	Fort Erie	Canada			
9665	St. Cathrines Bus Terminal	St. Cathrines	Canada			
9666	Aviosuperficie Monti della Tolfa	Santa Severa	Italy			
9667	Moyer Field	Line Lexington	United States			
9668	Pocono Mountains Municipal Airport	Mount Pocono	United States	MPO	KMPO	
9669	Quakertown Airport	Quakertown	United States	UKT	KUKT	
9670	Princeton	Princeton	United States	PCT		
9671	King's Wharf	Hamilton 	Bermuda			
9672	St. Georges Harbour	St. George	Bermuda			
9673	Harbor	Newport	United States			
9674	Harbour	Ponta Delgada	Portugal			
9675	Harbour	Lisbon	Portugal			
9676	Harbour	Road Town	British Virgin Islands			
9677	Harbour	Galveston	United States			
9678	Harbour	Simon's Town	South Africa			
9679	Morris Canal Basin	New Jersey	United States			
9680	Harbour	Willamstown	Australia			
9681	Harbour	Oyster Pond	Netherlands Antilles			
9682	Harbour	Georgetown	Cayman Islands			
9683	Northwest Arkansas Samuel Walton International Airport	Bentonville	United States	NRW	KNRW	
9684	Kowloon Macau Ferry Terminal	Kowloon	Hong Kong			
9685	Banff Airport	Banff	Canada	YBA	CYBA	
9686	NAS Agana Airport	Agana	United States	NGM		
9687	Nordborg Flyveplads	Nordborg	Denmark		EKNB	
9688	Nika Island Resort	North Ari Atoll 	Maldives			
9689	Banning Municipal Airport	Banning	United States	BNG	KBNG	
9690	Gießen-Lützellinden Airport	Giessen	Germany		EDFL	
9691	Tököl Airport	Budapest	Hungary		LHTL	
9692	Karl Stefan Memorial Airport	Norfolk  Nebraska	United States	OFK	KOFK	
9693	Keweenaw Waterway	Houghton	United States			
9694	Windigo Harbor Seaplane Dock	Isle Royale National Park	United States			
9695	North Saanich Ferry	Victory	Canada			
9696	Tsawwassen Freey	Vancouver	Canada			
9697	Kotido Airport	Kotido	Uganda		HUKO	
9698	Kajjansi Airfield	Kampala	Uganda		HUKJ	
9699	Arlington Municipal Airport	Arlington	United States		KAWO	
9700	Paracatu Airport	Paracatu	Brazil		SNZR	
9701	Das Bandeirinhas Airport	Conselheiro Lafaiete	Brazil		SNKF	
9702	Janaúba Airport	Janauba	Brazil		SNAP	
9703	Juscelino Kubitscheck Airport	Teofilo Otoni	Brazil	TFL	SNTO	
9704	Cristiano Ferreira Varella Airport	Muriae	Brazil		SNBM	
9705	Horseshoe Bay Ferry Terminal	Horseshoe Bay	Canada		HORS	
9706	Prince George Railway Station	Prince George	Canada	XDV		
9707	Prince Rupert Railway Station and Ferry Terminal	Prince Rupert	Canada	XDW		
9708	Prince Rupert Ferry Terminal	Prince Rupert	Canada		RUPR	
9709	Port Hardy Ferry Terminal	Port Hardy	Canada		HARD	
9710	Depature Bay Ferry Terminal	Nanaimo	Canada		NDEP	
9711	Peter O Knight Airport	Tampa	United States	TPF	KTPF	
9712	Bloor Station	Toronto	Canada			
9713	Weston Station	Toronto	Canada			
9714	Puerto Madero	Buenos Aires	Argentina			
9715	Myrdal Station	Myrdal	Norway		MYRN	
9716	Flam Station	Flam	Norway		FLAM	
9717	Voss Station	Voss	Norway		VOSS	
9718	Barnbougle Dunes	Bridport	Australia			
9719	Chicago Helicopter Experience	Chicago	United States			
9720	Meuer Farm Helicopter Landing	Chilton	United States			
9721	Taita Hills Airport	Taita Hills	Kenya			
9722	Hot Air Safaris Landing Area	Talek	Kenya			
9723	Hot Air Safaris Base	Talek	Kenya			
9724	Angermunde Station	Angermunde	Germany			
9725	Berlin ZOB	Berlin	Germany			
9726	Hannover ZOB	Hannover	Germany			
9727	Gare de Mulhouse	Mulhouse	France			
9728	Lure Malbouhans Air Base	Malbouhans	France		LFYL	
9729	Gare de Belfort	Belfort	France			
9730	Gare de Ronchamp	Ronchamp	France			
9731	Hyannis Inner Harbor	Barnstable	United States			
9732	Straight Warf	Nantucket	United States			
9733	Parati Airport	Paraty	Brazil		SDTK	
9734	Umberto Modiano Airport	Buzios	Brazil	BZC	SBBZ	
9735	Angra dos Reis Airport	Angra dos Reis	Brazil		SDAG	
9736	Itaperuna Airport	Itaperuna	Brazil	ITP	SDUN	
9737	Maricá Airport	Marica	Brazil		SDMC	
9738	Resende Airport	Resende	Brazil	REZ	SDRS	
9739	Saquarema Airport	Saquarema	Brazil		SDSK	
9740	Drumheller Municipal Airport	Drumheller	Canada		CEG4	
9741	Kiel Seehafen	Kiel	Germany			
9742	Saint Johns Sea Port on Antigua	Saint Johns	Antigua and Barbuda		JOHN	
9743	Pointe-a-Pitre Sea Port	Pointe-a-Pitre	Guadeloupe		POIN	
9744	Scarborough Sea Port	Scarborough	Trinidad and Tobago			
9745	Willemstad Sea Port	Willemstad	Netherlands Antilles		WILL	
9746	Oranjestad Sea Port	Oranjestad	Aruba		ORAN	
9747	La Romana Sea Port	La Romana	Dominican Republic		LARO	
9748	Are	Are	Sweden		ARES	
9749	Maafushivaru Seaplane Dock	Maafushivaru Resort	Maldives			
9750	Gare de Saint-Louis	Saint-Louis	France			
9751	Mwene-Ditu Airport	Mwene-Ditu	Congo (Kinshasa)		FZWE	
9752	Tunta Airport	Kabinda	Congo (Kinshasa)	KBN	FZWT	
9753	Ikela Airport	Ikela	Congo (Kinshasa)	IKL	FZGV	
9754	Brighton Railway Station	Brighton	United Kingdom			
9755	Meedhupparu	Meedhupparu	Maldives			
9756	Aripuanã Airport	Aripuana	Brazil	AIR	SWRP	
9757	Juruena Airport	Juruena	Brazil	JRN	SWJU	
9758	Juína Airport	Juina	Brazil	JIA	SWJN	
9759	Vila Rica Airport	Vila Rica	Brazil	VLP	SWVC	
9760	Inácio Luís do Nascimento Airport	Juara	Brazil	JUA	SIZX	
9761	Cáceres Airport	Caceres	Brazil	CCX	SWKC	
9762	Posto Leonardo Vilas Boas Airport	Chapada dos Guimaraes	Brazil		SWPL	
9763	Tangará da Serra Airport	Tangara da Serra	Brazil	TGQ	SWTS	
9764	Canarana Airport	Canarana	Brazil	CQA	SWEK	
9765	Vila Bela da Santíssima Trindade Airport	Vila Bela da Santissima Trindade 	Brazil	MTG	SWVB	
9766	Bumbar Airport	Bumba	Congo (Kinshasa)	BMB	FZFU	
9767	Sobral Airport	Sobral	Brazil		SNOB	
9768	Arapiraca Airport	Arapiraca	Brazil	APQ	SNAL	
9769	Cangapara Airport	Floriano	Brazil	FLB	SNQG	
9770	Picos Airport	Picos	Brazil	PCS	SNPC	
9771	Centara Seaplane Dock	Centara Resort	Maldives			
9772	Tokyo Station	Tokyo	Japan		TOKR	
9773	Odawara Station	Odawara	Japan		ODAW	
9774	Shin-Osaka Station	Osaka	Japan		SOSA	
9775	Himeji Station	Himeji	Japan		HIMJ	
9776	Hiroshima Station	Hiroshima	Japan		HRSM	
9777	Hakone-Yumoto Station	Hakone	Japan		HAYU	
9778	Gora	Hakone	Japan		GORA	
9779	Jackson Union Station	Jackson	United States			
9780	Zion Nationalpark	Zion Nationalpark	United States		ZION	
9781	Yosemite Nationalpark	Yosemite Nationalpark	United States		YOSE	
9782	Hanmer Springs	Hanmer Springs	New Zealand		HANM	
9783	Akaroa	Akaroa	New Zealand		AKAR	
9784	Te Anau	Te Anau	New Zealand		ANAU	
9785	Greymouth	Greymouth	New Zealand		GREY	
9786	Arthurs Pass	Arthur's Pass	New Zealand		ARTH	
9787	Beni Airport	Beni	Congo (Kinshasa)	BNC	FZNP	
9788	Boende Airport	Boende	Congo (Kinshasa)	BNB	FZGN	
9789	Nagoya Station	Nagoya	Japan		NAGO	
9790	Gifu Station	Gifu	Japan		GIFU	
9791	Takayama Station	Takayama	Japan		TAKA	
9792	Shirakawa-go Bus Stop	Shirakawa-go	Japan		SHGO	
9793	Toyama Station	Toyama	Japan		TOYA	
9794	Kanazawa Station	Kanazawa	Japan		KANA	
9795	Ueno Station	Tokyo	Japan		UENO	
9796	Osaka Station	Osaka	Japan		OSAK	
9797	Notohadinegoro	Jember	Indonesia	JBB		
9798	Perkiomen Valley Airport	Collegeville	United States	N10		
9799	Bay Bridge	Stevensville	United States	W29		
9800	Bugalaga Airstrip	Bugalaga	Indonesia			
9801	Montauk Airport	Montauk	United States	MTP	KMTP	
9802	Oshiage Station	Tokyo	Japan		OSHG	
9803	Centennial Station-Amtrak	Olympia	United States	OLW		
9804	Union Depot-Amtrak	Centralia	United States		CTLX	
9805	Gouda Railway Station	Gouda	Netherlands			
9806	Ottawa Central Station	Ottawa	Canada		OTTC	
9807	Nara Station	Nara	Japan		NARA	
9808	Kyoto Station	Kyoto	Japan		KYOT	
9809	Alimataa	Alimataa	Maldives			
9810	Duivendrecht Station	Duivendrecht	Netherlands			
9811	Irving Park Station	Chicago	United States			
9812	Jefferson Park Transit Center	Chicago	United States			
9813	Porter County Municipal Airport	Valparaiso IN	United States	VPZ	KVPZ	
9814	Navi Mumbai	Navi Mumbai	India			
9815	Dharavandhoo Airport	DHARAVANDHOO	Maldives	DRV	VRMD	
9816	Saumlaki/Olilit Airport	Saumlaki	Indonesia	SXK	WAPI	
9817	North Pole	North Pole	Norway			
9818	Domestic Terminal Railway Station	Brisbane	Australia			
9819	Eagle Junction Railway Station	Clayfield	Australia			
9820	International Terminal Railway Station	Brisbane	Australia			
9821	Wooloowin Railway Station	Wooloowin	Australia			
9822	Albion Railway Station Brisbane	Brisbane	Australia			
9823	Bowen Hills Railway Station	Bowen Hills	Australia			
9824	Fortitude Valley Railway Station	Fortitude Valley	Australia			
9825	Central Railway Station	Brisbane	Australia			
9826	Cerro Largo International Airport	Melo	Uruguay	MLZ	SUMO	
9827	Tydeo Larre Borges Airport	Paysandu	Uruguay	PDU	SUPU	
9828	Artigas International Airport	Artigas 	Uruguay	ATI	SUAG	
9829	Trieste Centrale	Treiste	Italy			
9830	Murray Bridge Airport	Murray Bridge	Australia		YMBD	
9831	Horsham Airport	Horsham	Australia	HSM	YHSM	
9832	Swan Hill Airport	Swan Hill	Australia	SWH	YSWH	
9833	Cottbus Station	Cottbus	Germany			
9834	Goerlitz Station	Goerlitz	Germany			
9835	Turtle Island Seaplane Base	Turtle Island	Fiji	TTL	NFUL	
9836	Zgorzelec Station	Zgorzelec	Poland			
9837	Grunau station	Berlin	Germany			
9838	Zeuthen Station	Zeuthen	Germany			
9839	Konigs Wusterhausen Station	Konigs Wusterhausen	Germany			
9840	Lubbenau Station	Lubbenau	Germany			
9841	Lubben-Spreewald Station	Lubben-Spreewald	Germany			
9842	Brand Bahnhof	Brand	Germany			
9843	Spremberg Bahnhof	Spremberg	Germany			
9844	Weisswasser Bahnhof	Weisswasser	Germany			
9845	Rotterdam Noord Railway Station	Rotterdam	Netherlands			
9846	Dewadaru - Kemujan Island	Karimunjawa	Indonesia	KWB	WARU	
9847	Garmisch-Partenkirchen Bahnhof	Garmisch-Partenkirchen	Germany			
9848	Kongolo Airport	Kongolo	Congo (Kinshasa)	KOO	FZRQ	
9849	Attopeu Airport	Attopeu	Laos	AOU	VLAP	
9850	Kahemba Airport	Kahemba	Congo (Kinshasa)		FZCF	
9851	Francisco de Miranda Airport	Caracas	Venezuela		SVFM	
9852	Akselinpolku E3106	Espoo	Finland			
9853	São Miguel do Oeste Airport	Sao Miguel do Oeste	Brazil	SQX	SSOE	
9854	Talpa de Allende	Talpa de Allende	Mexico			
9855	Mascota	Mascota	Mexico			
9856	Lichtenberg Station	Berlin	Germany			
9857	Mason County Airport	Ludington	United States	LDM	KLDM	
9858	Amstel Station	Amsterdam	Netherlands			
9859	Wannsee Station	Berlin	Germany			
9860	Kanash	Kanash	Russia			
9861	Skadovsk	Skadovsk	Ukraine			
9862	Weesperplein Station	Amsterdam	Netherlands			
9863	Mazatlan Port Cruise Terminal	Mazatlan	Mexico			
9864	Cruise Port	Topolobampo	Mexico			
9865	Port of Pichilingue	La Paz	Mexico			
9866	Port Saguenay	Saguenay	Canada			
9867	Quebec City Cruise Port	Quebec	Canada			
9868	Xingtai East train station	Xingtai	China			
9869	Collins Island	Stanage	Australia		YCII	
9870	Reid-Hillview Airport of Santa Clara County	San Jose	United States	RHV	KRHV	
9871	Aerodrom	Balashov	Russia		XWSW	
9872	Fraser CO Winter Park	Fraser CO	United States			
9873	Green River Station	Green River	United States			
9874	Amtrak Station	Helper UT	United States			
9875	Winnemucca Station	Winnemucca	United States			
9876	Colfax Station	Colfax CA	United States			
9877	Roseville station 	Roseville	United States			
9878	Dunsmuir Station	Dunsmuir CA	United States			
9879	Chemult Station	Chemult OR	United States			
9880	Albany Depot 	Albany OR	United States			
9881	Salem Station	Salem OR	United States			
9882	Vancouver WA Station	Vancouver WA	United States			
9883	Amtrak Station	Granby CO	United States			
9884	Stellwagen Bank National Marine Sanctuary	Atlantic Ocean	United States			
9885	Barnstable Harbor	Barnstable	United States			
9886	Sohar Airport	Sohar	Oman	OHS	OOSH	
9887	Buffalo-Exchange Street Station	Buffalo	United States	ZXS		
9888	Kitchener	Kitchener	Canada			
9889	Kadanwari Airport	Kadanwari	Pakistan	KCF	OPKW	
9890	Sawan Airport	Sindh	Pakistan	RZS	OPSW	
9891	Yangshuo Quay	Yangshuo	China			
9892	Guilin Quay	Guilin	China			
9893	Guilin Wharf	Guilin	China			
9894	Freiburg Hauptbahnhof	Freiburg	Germany	QFB		
9895	Rose Bay Airport	Sydney	Australia	RSE		
9896	Bergamo Railway Station	Bergamo	Italy			
9897	Khutzeymateen Lodge	Khutzeymateen Grizzly Bear Sanctuary	Canada		KUTZ	
9898	Europoort Rotterdamn	Maasvlakte	Netherlands			
9899	Kruiningen-Yerseke Railway Station	Kruiningen	Netherlands			
9900	Sint-Niklaas Railway Station	Sint-Niklaas	Belgium			
9901	WWWWW	W Retreat and Spa	Maldives			
9902	MDVRU	Banyan Tree Madivaru	Maldives			
9903	FSLGR	Four Seasons Landaa Giraavaru	Maldives			
9904	ASCRM	King George Island	Antarctica			
9905	Bimbadgen Estate Winery	BIMBA	Australia			
9906	MTPLS	Hunter Valley	Australia			
9907	CHVLB	Cheval Blanc Randheli	Maldives			
9908	Santa Apolonia Railway Station	Lisbon	Portugal			
9909	Campanha Railway Station	Porto	Portugal			
9910	Thamkharka Airport	Thamkharka	Nepal		VNTH	
9911	Thimarafushi Airport	Thimarafushi	Maldives	TMF	VRNT	
9912	Ifuru Airport	Ifuru	Maldives	IFU	VREI	
9913	Kaintiba Airport	Kieta	Papua New Guinea	KZF	AYKT	
9914	Ordu Giresun Airport	Ordu-Giresun	Turkey	OGU	LTCB	
9915	Hakkari Yüksekova Airport	Hakkari	Turkey	YKO	LTCW	
9916	SEA Seaplane	Seattle	United States			
9917	Mataro Train Station	Mataro	Spain			
9918	Dessau Hauptbahnhof	Dessau	Germany			
9919	Basel Badischer Bahnhof	Basel	Switzerland	ZBA		
9920	Mullheim Baden Station	Mullheim	Germany			
9921	Gare de Montbeliard	Montbeliard	France			
9922	Gare de Haricourt	Haricourt	France			
9923	Gare de Besancon-Viotte	Besancon	France			
9924	Gare de Besancon Franche-Comte TGV	Besancon	France			
9925	Gare de Dole	Dole	France			
9926	Gare de Villers-les-Pots	Villers-les-Pots	France			
9927	Gare de Dijon-Ville	Dijon	France			
9928	Gare de Altkirch	Altkirch	France			
9929	Gare de Colmar	Colmar	France			
9930	Gare de Celestat	Celestat	France			
9931	Karlsruhe Hauptbahnhof	Karlsruhe	Germany			
9932	Darmstadt Hauptbahnhof	Darmstadt	Germany			
9933	Fulda Hauptbahnhof	Fulda	Germany			
9934	Kassel Hauptbahnhof	Kassel	Germany			
9935	Wolfsburg Hauptbahnhof	Wolfsburg	Germany			
9936	Kassel-Wilhelmshohe Station	Kassel	Germany			
9937	Gottingen Railway Station	Gottingen	Germany	ZEU		
9938	Hildesheim Hauptbahnhof	Hildesheim	Germany			
9939	Braunschweig Hauptbahnhof	Braunschweig	Germany			
9940	Hanau Hauptbahnhof	Hanau	Germany			
9941	Zaragoza Delicias Railway Station	Zaragoza	Spain			
9942	Camp de Tarragona Railway Station	La Secuita	Spain			
9943	Deming Station	Deming	United States			
9944	Jelenia Góra Glider Airport	Jelenia Gora	Poland		EPJG	
9945	Lake Brooks AK	Katmai National Park 	United States	5Z9		
9946	Passo Campolongo	Arabba	Italy			
9947	Bathpalathang Airport	Jakar	Bhutan	BUT	VQBT	
9948	Norreport Station	Copenhagen	Denmark			
9949	Ludington Ferry Terminal	Ludington	United States			
9950	Manitowoc Ferry Terminal	Manitowoc	United States			
9951	Lancaster Station	Lancaster	United States	ZRL		
9952	Harrisburg Transportation Center	Harrisburg	United States	ZUG		
9953	Gare de Nantes	Nantes	France	QJZ		
9954	Gare de Montpellier-Saint-Roch	Montpellier	France	XPJ		
9955	Helsingborg Central Station	Helsingborg	Sweden	XYH		
9956	Liverpool Street Station	London	United Kingdom	ZLS		
9957	Princeton Junction	Princeton	United States	ZTJ		
9958	Vommuli Island	Vommuli	Maldives			
9959	Sultan Bantilan Airport	Toli-Toli	Indonesia	TLI	WAMI	
9960	Methow Valley State Airport	Winthrop	United States	S52		
9961	Lake Chelan Airport	Chelan	United States	S10		
9962	Lost River Resort Airport	Mazma	United States	W12		
9963	Stehekin State Airport	Stehekin	United States	6S9		
9964	Vuktyl Airport	Vuktyl	Russia		UUYK	
9965	Berezniki Airport	Berezniki	Russia		USPT	
9966	Lehrte Railway Station	Lehrte	Germany			
9967	Stendal Railway Station	Stendal	Germany			
9968	Rathenow Railway Station	Rathenow	Germany			
9969	Wustermark Railway Station	Wustermark	Germany			
9970	Estacion Central Railway Station	Santiago	Chile			
9971	Solikamsk-Berezniki	Berezniki	Russia			
9972	Bielefeld Hauptbahnhof	Bielefeld	Germany			
9973	Westfalen Bahnhof	Hamm 	Germany			
9974	Hagen Hauptbahnhof	Hagen	Germany			
9975	Cologne-Koln Messe Deutz Bahnhof	Cologne	Germany			
9976	Aschaffenburg Hauptbahnhof	Aschaffenburg	Germany			
9977	Wurzburg Hauptbahnhof	Wurzburg	Germany			
9978	Jena Paradies Bahnhof	Jena	Germany			
9979	Naumburg-Saale Hauptbahnhof	Naumburg	Germany			
9980	Lutherstadt Wittenberg Bahnhof	Wittenberg	Germany			
9981	Saalfeld Bahnhof	Saalfeld	Germany			
9982	 Bitterfeld Bahnhof	 Bitterfeld-Wolfen	Germany			
9983	Juterbog Bahnhof	Juterbog	Germany			
9984	Siegburg Bonn Bahnhof	Siegburg	Germany	ZPY		
9985	Museo Nao Victoria	Punta Arenas	Chile			
9986	Far Rockaway Station	Far Rockaway	United States			
9987	Inwood Station	Inwood	United States			
9988	Lawrence Station	Lawrence	United States			
9989	San Sebastián Airport	San Sebastian	Chile		SCSS	
9990	Cedarhurst Station	Cedarhurst	United States			
9991	Tolwin Observatory Airport	Tolhuin	Argentina		SAWL	
9992	Woodmere Station	Woodmere	United States			
9993	Manchester Airport Station	Ringway	United Kingdom			
9994	Tarko-Sale Airport	Tarko-Sale	Russia	TQL	USDS	
9995	Santa Clarita - CA	Santa Clarita	United States		STCL	
9996	Camarillo Airport	Camarillo - CA	United States		KCMA	
9997	Puerto Toro	Puerto Toro	Chile			
9998	Baganara Island Resort Airstrip	Baganara	Guyana			
9999	Eferding	Mauthausen	Austria			
10000	Manchester Oxford Road Railway Station	Manchester	United Kingdom			
10001	Warrington Central Railway Station	Warrington	United Kingdom			
10002	Liverpool South Parkway Railway Station	Liverpool	United Kingdom			
10003	Gare do Oriente	Lisbon	Portugal			
10004	Coimbra-B	Coimbra	Portugal			
10005	Aveiro Railway Station	Aveiro	Portugal			
10006	Vila Nova de Gaia-Devesas	Vila Nova de Gaia	Portugal			
10007	Guadalajara-Yebes Railway Station	Guadalajara	Spain			
10008	Calatayud Railway Station	Calatayud	Spain			
10009	Lleida Pirineus Railway Station	Lleida	Spain			
10010	Leopoldsburg Airfield	Leopoldsburg	Belgium		EBLE	
10011	FAIS	FAIS	Micronesia			
10012	WOLEAI	WOLEAI	Micronesia			
10013	Bellingham-Bellingham Station	Bellingham	United States			
10014	Gare de Rabat Ville	Rabat	Morocco			
10015	Gare de Fes-Ville	Fez	Morocco			
10016	Kahiltna Glacier Base Camp Airstrip	Denali NP	United States			
10017	Guilin North Railway Station	Guilin	China			
10018	Sanshui South Railway Station	Sanshui	China			
10019	Zhaoqing East Railway Station	Zhaoqing	China			
10020	Guangning Railway Station	Guangning	China			
10021	Huaiji Railway Station	Huaiji	China			
10022	Hezhou Railway Station	Hezhou	China			
10023	Kirknewton Railway Station	Kirknewton	United Kingdom			
10024	Monfalcone Railway Station	Monfalcone	Italy			
10025	Portogruaro Caorle Railway Station	Portogruaro Caorle	Italy			
10026	Vamizi island airport	Vamizi island	Mozambique			
10027	Tarragona Railway Station	Tarragona	Spain			
10028	Castello de la Plana Railway Station	Castello de la Plana	Spain			
10029	Joaquin Sorolla Railway Station	Valencia	Spain			
10030	Platja dAro Sarfa Station	Platja dAro	Spain			
10031	Jinchuan Airport	Jinchuan	China	JIC	ZLJC	
10032	Angsana Velavaru TMA Seaplane Dock	Meedhoo	Maldives			
10033	Gare de PSA PCA	Mulhouse	France			
10034	Estacio de Franca	Barcelona	Spain	YJD		
10035	Cologne Deutz Railway	Cologne	Germany	QKU		
10036	San Juan de Nicaragua	San juan de Nicaragua	Nicaragua		MNSN	
10037	Omtepe Airport	Moyogalpa	Nicaragua		MNLP	
10038	Finlyandsky	St. Petersburg	Russia	FVS		
10039	Surama Lodge Airstrip	Surama	Guyana			
10040	Solingen Hauptbahnhof	Solingen	Germany			
10041	Tbilisi Railway station	Tbilisi	Georgia			
10042	Rustavi Railway Station	Rustavi	Georgia			
10043	Baganara Island Resort	Baganara Island Resort	Guyana			
10044	Aghstafa Railway Station	Aghstafa	Georgia			
10045	Ijevan Railway Station	Ijevan	Armenia			
10046	Hrazdan Railway Station	Hrazdan	Armenia			
10047	Yerevan Railway Station	Yerevan	Armenia			
10048	Marneuli Railway Station 	Marneuli	Georgia			
10049	Ayrum Railway Station	Ayrum	Armenia			
10050	Vanadzor Main Train Station	Vanadzor	Armenia			
10051	Spitak Railway Station	Spitak	Armenia			
10052	Gyumri Railway Station	Gyumri	Armenia			
10053	Aragatz Railway Station	Aragatz	Armenia			
10054	Wuxi Railway Station	Wuxi	China			
10055	Suzhou Railway Station	Suzhou	China			
10056	Alashankou Bole (Bortala) airport	Bole	China	BPL	ZWAX	
10057	Fuyun Koktokay Airport	Fuyun	China	FYN	ZWFY	
10058	Segovia AV	Segovia	Spain			
10059	Valladolid Compo Grande	Valladolid	Spain			
10060	Burgos-Rosa de Lima	Burgos	Spain			
10061	Miranda de Ebro Railway Station	Miranda de Ebro	Spain			
10062	Llodio Railway Station	Llodio	Spain			
10063	Avila Railway Station	Avila	Spain			
10064	Kronshtadt	Kronshtadt	Russia			
10065	Honfleur	Honfleur	France			
10066	Mont-Saint-Michel	Mont-Saint-Michel	France			
10067	Rudesheim 	Rudesheim am Rhein	Germany			
10068	Capri	Capri	Italy			
10069	Luzern	Luzern	Switzerland			
10070	Aix-en-Provence	Aix-en-Provence	France			
10071	Narbonne	Narbonne	France			
10072	Armavir	Armavir	Russia			
10073	Makat	Makat	Kazakhstan			
10074	Urbah	Saratov	Russia			
10075	Kartaly	Kartaly	Russia			
10076	Rudnyi	Rudnyi	Kazakhstan			
10077	Tobyl	Tobol	Kazakhstan			
10078	Ereimentau	Ermentau	Kazakhstan			
10079	Kulunda	Kulunda	Russia			
10080	Karasuk	Karasuk	Russia			
10081	Tatarskaia	Tatarskaia	Russia			
10082	Achinsk Airport	Achinsk	Russia	ACS	UNKS	
10083	Angerskaia	Angero-Sudgensk	Russia			
10084	Taiga	Taiga	Russia			
10085	Topki	Topki	Russia			
10086	Artyshta	Artyshta	Russia			
10087	Jurga	Jurga	Russia			
10088	Irtyshskoie	Bolshegrivskoie	Russia			
10089	Pospeliha	Pospeliha	Russia			
10090	Rubzovsk	Rubzvsk	Russia			
10091	Lokot	Lokot	Russia			
10092	Shar	Charsk	Kazakhstan			
10093	Taishet	Taishet	Russia			
10094	Sljudjanka	Sljudjanka	Russia			
10095	Skovorodino	Skovorodino	Russia			
10096	Belogorsk	Belogorsk	Russia			
10097	Jalta	Jalta	Russia			
10098	Alushta	Alushta	Ukraine			
10099	Gaspra	Gaspra	Russia			
10100	Novorossiysk Mor Vokzal	Novorossiysk	Russia			
10101	Kerch	Kerch	Russia			
10102	Dzankoy	Dzankoy	Russia			
10103	Linfen Qiaoli Airport	LINFEN	China	LFQ	ZBLF	
10104	Saidor	Saidor	Papua New Guinea	SDI		
10105	Bambu	Bambu	Papua New Guinea	BCP		
10106	Kalispell City Airport	Kalispell	United States	S27		
10107	Jinan West Railway Station	Jinan	China			
10108	Xuzhou East Railway Station	Xuzhou	China			
10109	Zhenjiang Railway Station	Zhenjiang	China			
10110	Zhenjiang Railway Station	Zhenjiang	China			
10111	Changzhou Railway Station	Changzhou	China			
10112	Cangzhou West Railway Station	Cangzhou	China			
10113	Dezhou East Railway Station	Dezhou	China			
10114	Qufu East Railway Station	Qufu	China			
10115	Zaozhuang Railway Station	Zaozhuang	China			
10116	Suzhou East Railway Station - Anhui	Suzhou	China			
10117	Bengbu South Railway Station	Bengbu	China			
10118	Chuzhou Railway Station	Chuzhou	China			
10119	Chongqing North Railway Station	Chongqing	China			
10120	Chengdu Railway Station	Chengdu	China			
10121	Belomorsk	Belomorsk	Russia			
10122	Konosha	Konosha	Russia			
10123	Obozerskiy	Obozerskiy	Russia			
10124	Danilov	Danilov	Russia			
10125	Mikun'	Mikun'	Russia			
10126	Kotel'nich	Kotel'ich	Russia			
10127	Galich	Galich	Russia			
10128	Bui-Railway	Bui-Kostromskoj	Russia			
10129	Volhovstroy	Volhov	Russia			
10130	Chudovo	Chudovo	Russia			
10131	Bologoye	Bologoye	Russia			
10132	Nevel'	Nevel'	Russia			
10133	Smolensk	Smolensk	Russia			
10134	Gagarin	Gagarin	Russia			
10135	Wyborg	Wyborg	Russia			
10136	Kingisepp	Kingisepp	Russia			
10137	Novgorod-na-Volhove	Novgorod Velikiy	Russia			
10138	Staraya Russa	Staraya Russa	Russia			
10139	Viljandi	Viljandi	Estonia			
10140	Haapsalu	Haapsalu	Estonia			
10141	Hinton/Jasper-Hinton Airport	Hinton	Canada	YJP	CEC4	
10142	University Airport	Davis	United States			
10143	Garibaldi Brothers Airport	Cordelia	United States			
10144	Richmond BART Station	Richmond	United States			
10145	San Antonio Caltrain Station	Mountain View	United States			
10146	Bathurst Street Terminal	Toronto	Canada			
10147	Billy Bishop Toronto City Airport Terminal	Toronto	Canada			
10148	Orsha	Orsha	Belarus			
10149	Zlobin	Zlobin	Belarus			
10150	Kalinkovichy	Kalinkovichy	Belarus			
10151	Krychev	Krychev	Belarus			
10152	Vjaz'ma	Vjaz'ma	Russia			
10153	Bryansk Orlovskiy	Bryans	Russia			
10154	Kiev-Pivdeniy	Kiev	Ukraine			
10155	Korosten'	Korosten'	Ukraine			
10156	Shu Train Station	Shu	Kazakhstan			
10157	Arys-1	Arys	Kazakhstan			
10158	Troitsk	Troitsk	Russia			
10159	Rjazan'	Rjazan'	Russia			
10160	Agryz Railway	Agryz	Russia			
10161	Kanash-1	Kanash	Russia			
10162	Arzamas	Arzamas	Russia			
10163	Vladimir	Vladimir	Russia			
10164	Syzran'	Syzran'	Russia			
10165	Lihaja	Lihovskoy	Russia			
10166	Gorlovka	Gorlovka	Ukraine			
10167	Krinichnaja	Krinichnaja	Ukraine			
10168	Sinel'nikovo	Sinel'nikovo	Ukraine			
10169	Lozovaja	Lozovaja	Ukraine			
10170	Taganrog	Taganrog	Russia			
10171	Sal'sk	Sal'sk	Russia			
10172	Tihoretskaja	Tihoretsk	Russia			
10173	Kavkazskaja	Kropotkin	Russia			
10174	Tuapse	Tuapse	Russia			
10175	Budennovsk	Budennovsk	Russia			
10176	Liski	Liski	Russia			
10177	Rtishchevo-1	Rtishchevo	Russia			
10178	Kupjansk	Kupjansk	Ukraine			
10179	Konotop	Konotop	Ukraine			
10180	Orel	Orel	Russia			
10181	Elets	Elets	Russia			
10182	Grjazi	Grjazi	Russia			
10183	Rjazsk	Razsk	Russia			
10184	Azov	Azov	Russia			
10185	Fuyong Ferry Terminal	Shenzhen	China			
10186	Skypier	Hong Kong	Hong Kong			
10187	Gandria	Gandria	Switzerland			
10188	Bolsherech'e	Bolsherech'e	Russia			
10189	Tara	Tara Omskoy	Russia			
10190	Ust'-Shish	Ust'-Shish	Russia			
10191	Konstanz Station	Konstanz	Germany			
10192	Moenchaltorf	Moenchaltorf	Switzerland			
10193	Frauenfeld	Frauenfeld	Switzerland			
10194	Dinhard	Dinhard	Switzerland			
10195	Las Dunas Airport	Ica	Peru		SPLH	
10196	Watsonville Municipal Airport	Watsonville	United States	WVI	KWVI	
10197	Gurgaon Railway Station	Gurgaon	India			
10198	Amsterdam-Zuid	Amsterndam	Netherlands			
10199	Station Lelylaan	Amsterdam	Netherlands			
10200	Maple Bay Marina	Maple Bay	Canada	YAQ		
10201	Amsterdam Lelylaan	Amsterdam	Netherlands			
10202	Gelephu Airport	Gelephu	Bhutan	GLU	VQGP	
10203	Jachthaven IJburg	Amsterdam	Netherlands			
10204	Jachthaven Stichting Muiden	Muiden	Netherlands			
10205	Fort ann het Pampus	Gooise Meren	Netherlands			
10206	Hollister Municipal Airport	Hollister	United States	HLI	KCVH	
10207	Williamsburg Jamestown Airport	Williamsburg	United States		KJGG	
10208	Osaka Port International Ferry Terminal	Osaka	Japan			
10209	Hakata Port International Terminal	Fukuoka	Japan			
10210	Yongyu Station	Incheon	South Korea			
10211	Vlissingen Station	Vlissingen	Netherlands			
10212	Amboin	Amboin	Papua New Guinea	AMG		
10213	Karanambo	Karanambo	Guyana	KRM		
10214	Wittenom	Wittenom	Australia	WIT		
10215	Rottnest Island	Rottnest Island	Australia			
10216	Dulkaninna Airport	Dulkaninna	Australia	DLK	YDLK	
10217	Etadunna	Etadunna	Australia	ETD		
10218	Mungeranie	Mungeranie	Australia	MNE		
10219	Cowarie	Cowarie	Australia	CWR		
10220	Clifton Hills	Clifton Hills	Australia	CFH		
10221	Durrie	Durrie	Australia	DRR		
10222	Cordillo Downs	Cordillo Downs	Australia	ODL		
10223	Durham Downs	Durham Downs	Australia	DHD		
10224	Innamincka	Innamincka	Australia	INM		
10225	Glengyle	Glengyle	Australia	GLG		
10226	Leigh Creek	Leigh Creek	Australia			
10227	Wilpena Pound	Wilpena Pound	Australia	HWK		
10228	Mitchell Plateau 	Mitchell Plateau	Australia	MIH		
10229	Franz Josef Aerodrome	Franz Josef Aerodrome	New Zealand	WHO		
10230	Martins Bay	Martins Bay	New Zealand			
10231	William Creek Airport	William Creek	Australia		YWMC	
10232	12APO 	12 Apostles	Australia			
10233	ANTFR	St. John's	Antigua and Barbuda			
10234	ANTFR	St. John's	Antigua and Barbuda			
10235	ROCKI	Koror	Palau			
10236	LOYAL	Loyalty Beach	Australia			
10237	CRADL	Cradle Mountain N.P.	Australia			
10238	FURYG	Fury Gorge	Australia			
10239	PORTA	Port Arthur	Australia			
10240	ABNER	Abner Range - Lost City	Australia			
10241	CRAWF	Cape Crawford	Australia			
10242	Kenora Seaplane Base	Kenora	Canada		CJM9	
10243	Rumbula Air Base	Riga	Latvia		EVRC	
10244	FONIM	Fonimagooghoo	Maldives			
10245	BUNGL	Bungle Bungle	Australia			
10246	FRANZ	Franz Josef Glacier	New Zealand			
10247	Tsodilo Hills	Tsodilo Hills	Botswana		FB82	
10248	CHIEF	Chief's Island	Botswana			
10249	CHIEF	Chief's Island	Botswana			
10250	SEREN	Serengeti N.P.	Tanzania			
10251	MASAI	Masai Mara N.P.	Kenya			
10252	CRYST	Crystal Head Beach	Australia			
10253	Logrono Railway Station	Logrono	Spain			
10254	Siheung airport	Siheung	South Korea	SNG	SHNG	
10255	Rushmore Heliport	Keystone	United States			
10256	Kodari Schoolyard Heliport	Kodari	Nepal			
10257	Martorell Central Station	Martorell	Spain			
10258	Siquijor Airport	Siquijor	Philippines		RPVZ	
10259	Gare de La Hulpe	La Hulpe	Belgium			
10260	Opapimiskan Lake Airport	Musselwhite Mine	Canada	YBS	CKM8	
10261	Monistrol de Montserrat	Monistrol de Montserrat	Spain			
10262	Santa Coloma de Cervell Railway Station	Santa Coloma de Cervello	Spain			
10263	Rockville Amtrak Station	Rockville	United States			
10264	Aeri de Montserrat	Monistrol de Montserrat	Spain			
10265	Placa d Espanya Station	Barcelona	Spain			
10266	Bern Railway Station	Bern	Switzerland	ZDJ		
10267	Olten Railway Station	Olten	Switzerland			
10268	Thalwil Railway Station	Thalwil	Switzerland			
10269	Zug Railway Station	Zug	Switzerland			
10270	Baar Railway Station	Baar	Switzerland			
10271	Rizhao Shanzihe Airport	Rizhao	China	RIZ	ZSRZ	
10272	Shaxian Airport	Sanming	China	SQJ	ZSSM	
10273	Bruchsal Station	Bruchsal	Germany			
10274	Izuhara International Passenger Terminal	Tsushima	Japan			
10275	Taroom Airport	Taroom	Australia	XTO	YTAM	
10276	Gelnhausen Airport	Gelnhausen	Germany		EDFG	
10277	Ærø Airport	Aero	Denmark		EKAE	
10278	Lauterbach Airport	Lauterbach-Wernges	Germany		EDFT	
10279	Aschaffenburg Airport	Aschaffenburg	Germany		EDFC	
10280	Squamish Airport	Squamish	Canada	YSE	CYSE	
10281	Hillsdale Station	Hillsdale	United States			
10282	Wuxi East Railway Station	Wuxi	China			
10283	Shanghai Hongqiao Railway Station	Shanghai	China			
10284	Taian Railway Station	Taian	China			
10285	Jinan Railway Station	Jinan	China			
10286	Hangzhou East Railway Station	Hangzhou	China			
10287	Shijiazhuang Railway Station	Shijiazhuang	China			
10288	Huizhou South Railway Station	Huizhou	China			
10289	Plovdiv South Bus Station	Plovdiv	Bulgaria			
10290	Langfang Railway Station	Langfang	China			
10291	Changsha South Railway Station	Changsha	China			
10292	Wuhan Railway Station	Wuhan	China			
10293	Reichelsheim Airport	Reichelsheim	Germany		EDFB	
10294	Dolmar	Dolmar-Kuehndorf	Germany		DOLM	
10295	Marburg-Schönstadt Airport	Schoenstadt	Germany		EDFN	
10296	Lauenbrück Airport	Lauenbrueck	Germany		EDHU	
10297	Hüttenbusch Airport	Huettenbusch	Germany		EDXU	
10298	Vrsar Crljenka Airport	Vsar	Croatia		LDPV	
10299	Kongens Nytorv Station	Copenhagen	Denmark			
10300	Union County Airport	Marysville	United States		KMRT	
10301	La Grande-4 Airport	La Grande-4	Canada	YAH	CYAH	
10302	Alert Bay Airport	Alert Bay	Canada	YAL	CYAL	
10303	Liverpool South Shore Regional Airport	Liverpool	Canada		CYAU	
10304	Kona Dock	Kailua-Kona Hawaii	United States			
10305	Nipawin Airport	Nipawin	Canada		CYBU	
10306	Centralia / James T. Field Memorial Aerodrome	Centralia	Canada	YCE	CYCE	
10307	Blue River Airport	Blue River	Canada		CYCP	
10308	Chetwynd Airport	Chetwynd	Canada	YCQ	CYCQ	
10309	Ross River Airport	Ross River	Canada	XRR	CYDM	
10310	Dolbeau St Felicien Airport	Dolbeau-St-Félicien	Canada	YDO	CYDO	
10311	Amos/Magny Airport	Amos	Canada	YEY	CYEY	
10312	Goderich Airport	Goderich	Canada		CYGD	
10313	Hope Airport	Hope	Canada	YHE	CYHE	
10314	Haines Junction Airport	Haines Junction	Canada	YHT	CYHT	
10315	Digby / Annapolis Regional Airport	Digby	Canada	YDG	CYID	
10316	Fort Liard Airport	Fort Liard	Canada	YJF	CYJF	
10317	Key Lake Airport	Key Lake	Canada	YKJ	CYKJ	
10318	Leaf Rapids Airport	Leaf Rapids	Canada	YLR	CYLR	
10319	Matane Airport	Matane	Canada	YME	CYME	
10320	Charlevoix Airport	Charlevoix	Canada	YML	CYML	
10321	Nejanilini Lake Airport	Nejanilini Lake	Canada		CYNN	
10322	Owen Sound / Billy Bishop Regional Airport	Owen Sound	Canada	YOS	CYOS	
10323	Port Hawkesbury Airport	Port Hawkesbury	Canada	YPS	CYPD	
10324	St Thomas Municipal Airport	St Thomas	Canada	YQS	CYQS	
10325	Ottawa / Rockcliffe Airport	Ottawa	Canada	YRO	CYRO	
10326	Ottawa / Carp Airport	Ottawa	Canada		CYRP	
10327	Smiths Falls-Montague (Russ Beach) Airport	Smiths Falls	Canada	YSH	CYSH	
10328	St Leonard Airport	St Leonard	Canada	YSL	CYSL	
10329	Virden/R.J. (Bob) Andrew Field Regional Aerodrome	Virden	Canada		CYVD	
10330	Vernon Airport	Vernon	Canada	YVE	CYVK	
10331	Beaver Creek Airport	Beaver Creek	Canada	YXQ	CYXQ	
10332	Shuswap Regional Airport	Salmon Arm	Canada	YSN	CZAM	
10333	Kelsey Airport	Kelsey	Canada	KES	CZEE	
10334	Pukatawagan Airport	Pukatawagan	Canada	XPK	CZFG	
10335	Grand Forks Airport	Grand Forks	Canada	ZGF	CZGF	
10336	Jenpeg Airport	Jenpeg	Canada	ZJG	CZJG	
10337	Thicket Portage Airport	Thicket Portage	Canada	YTD	CZLQ	
10338	Pikwitonei Airport	Pikwitonei	Canada	PIW	CZMN	
10339	Poplar River Airport	Poplar River	Canada	XPP	CZNG	
10340	Pincher Creek Airport	Pincher Creek	Canada	WPC	CZPC	
10341	Stewart Airport	Stewart	Canada	ZST	CZST	
10342	Ignace Municipal Airport	Ignace	Canada	ZUC	CZUC	
10343	Neubrandenburg Airport	Neubrandenburg	Germany	FNB	EDBN	
10344	Airport Bamberg-Breitenau	Bamberg	Germany		EDQA	
10345	Zerbst Airport	Zerbst/Anhalt	Germany		EDUZ	
10346	RAF Spadeadam	Spadeadam	United Kingdom		EGOM	
10347	RAF Kinloss	Kinloss	United Kingdom	FSS	EGQK	
10348	Biała Podlaska Airfield	Biała Podlaska	Poland	BXP	EPBP	
10349	Cewice Air Base	Lębork	Poland		EPCE	
10350	Deblin Military Air Base	Dęblin	Poland		EPDE	
10351	Leczyca Military Air Base	Leczyca	Poland		EPLY	
10352	Minsk Mazowiecki Military Air Base		Poland		EPMM	
10353	Powidz Military Air Base		Poland		EPPW	
10354	Tomaszow Mazowiecki Military Air Base	Tomaszów Mazowiecki	Poland		EPTM	
10355	Björkvik Air Base	Björkvik	Sweden		ESKX	
10356	Ljungbyhed Airport	Ljungbyhed	Sweden		ESTL	
10357	Daugavpils Intrenational Airport	Daugavpils	Latvia	DGP	EVDA	
10358	Jēkabpils Air Base	Jēkabpils	Latvia		EVKA	
10359	Jūrmala Airport	Tukums	Latvia		EVTA	
10360	Kėdainiai Air Base	Kėdainiai	Lithuania		EYKD	
10361	Lime Acres Finsch Mine Airport	Lime Acres	South Africa	LMR	FALC	
10362	Sua Pan Airport	Sowa	Botswana	SXN	FBSN	
10363	Lusaka City Airport	Lusaka	Zambia		FLLC	
10364	Sumbe Airport	Sumbe	Angola	NDD	FNSU	
10365	Mangochi Airport	Mangochi	Malawi	MAI	FWMG	
10366	Arandis Airport	Arandis	Namibia	ADI	FYAR	
10367	Mariental Airport	Mariental	Namibia		FYML	
10368	Almaza Air Force Base	Cairo	Egypt		HEAZ	
10369	Beni Suef Air Base	Beni Suef	Egypt		HEBS	
10370	Jiyanklis Air Base	Jiyanklis	Egypt		HEGS	
10371	Merowe New Airport	Merowe	Sudan	MWE	HSMN	
10372	St Louis Regional Airport	Alton/St Louis	United States	ALN	KALN	
10373	Chandler Field	Alexandria	United States	AXN	KAXN	
10374	Columbus Municipal Airport	Columbus	United States	CLU	KBAK	
10375	Curtis Field	Brady	United States	BBD	KBBD	
10376	Eastern Sierra Regional Airport	Bishop	United States	BIH	KBIH	
10377	Baker City Municipal Airport	Baker City	United States	BKE	KBKE	
10378	Miley Memorial Field	Big Piney	United States	BPI	KBPI	
10379	Ozark Regional Airport	Mountain Home	United States	WMH	KBPK	
10380	W K Kellogg Airport	Battle Creek	United States	BTL	KBTL	
10381	Burley Municipal Airport	Burley	United States	BYI	KBYI	
10382	Northeast Iowa Regional Airport	Charles City	United States	CCY	KCCY	
10383	Chanute Martin Johnson Airport	Chanute	United States	CNU	KCNU	
10384	Jacksonville Executive at Craig Airport	Jacksonville	United States	CRG	KCRG	
10385	Crossville Memorial Whitson Field	Crossville	United States	CSV	KCSV	
10386	Davison Army Air Field	Fort Belvoir	United States	DAA	KDAA	
10387	Barstow Daggett Airport	Daggett	United States	DAG	KDAG	
10388	Deming Municipal Airport	Deming	United States	DMN	KDMN	
10389	Desert Rock Airport	Mercury	United States	DRA	KDRA	
10390	Needles Airport	Needles	United States	EED	KEED	
10391	Duke Field	Crestview	United States	EGI	KEGI	
10392	Murray Field	Eureka	United States	EKA	KEKA	
10393	San Marcos Regional Airport	San Marcos	United States		KHYI	
10394	Sawyer County Airport	Hayward	United States	HYR	KHYR	
10395	Kimble County Airport	Junction	United States	JCT	KJCT	
10396	Monticello Municipal Ellis Field	Monticello	United States		KLLQ	
10397	Derby Field	Lovelock	United States	LOL	KLOL	
10398	Mobridge Municipal Airport	Mobridge	United States	MBG	KMBG	
10399	Mc Comb/Pike County Airport/John E Lewis Field	Mc Comb	United States	MCB	KMCB	
10400	Southern Illinois Airport	Carbondale/Murphysboro	United States	MDH	KMDH	
10401	Mc Entire Joint National Guard Base	Eastover	United States	MMT	KMMT	
10402	Brunswick Executive Airport	Brunswick	United States	NHZ	KNHZ	
10403	Naval Station Mayport (Admiral David L. Mcdonald Field)	Mayport	United States	NRB	KNRB	
10404	Orangeburg Municipal Airport	Orangeburg	United States	OGB	KOGB	
10405	Columbus Municipal Airport	Columbus	United States		KOLU	
10406	Ottumwa Regional Airport	Ottumwa	United States	OTM	KOTM	
10407	Cairns AAF (Fort Rucker) Air Field	Fort Rucker/Ozark	United States	OZR	KOZR	
10408	Ralph Wenz Field	Pinedale	United States	PWY	KPNA	
10409	Dutchess County Airport	Poughkeepsie	United States	POU	KPOU	
10410	New Richmond Regional Airport	New Richmond	United States		KRNH	
10411	Russell Municipal Airport	Russell	United States	RSL	KRSL	
10412	Redwood Falls Municipal Airport	Redwood Falls	United States	RWF	KRWF	
10413	Salinas Municipal Airport	Salinas	United States	SNS	KSNS	
10414	Sonora Municipal Airport	Sonora	United States		KSOA	
10415	Saline County Regional Airport	Benton	United States		KSUZ	
10416	Tonopah Airport	Tonopah	United States	TPH	KTPH	
10417	Aurora State Airport	Aurora	United States		KUAO	
10418	Ukiah Municipal Airport	Ukiah	United States	UKI	KUKI	
10419	University Oxford Airport	Oxford	United States	UOX	KUOX	
10420	Huntsville Regional Airport	Huntsville	United States	HTV	KUTS	
10421	Miller Field	Valentine	United States	VTN	KVTN	
10422	Winnemucca Municipal Airport	Winnemucca	United States	WMC	KWMC	
10423	West Woodward Airport	Woodward	United States	WWR	KWWR	
10424	Cape Canaveral AFS Skid Strip	Cocoa Beach	United States		KXMR	
10425	Homey (Area 51) Airport	Groom Lake	United States		KXTA	
10426	Zanesville Municipal Airport	Zanesville	United States	ZZV	KZZV	
10427	Gjadër Air Base	Gjadër	Albania		LAGJ	
10428	Kukës Airport	Kukës	Albania		LAKU	
10429	Kuçovë Air Base	Kuçovë	Albania		LAKV	
10430	Vlorë Air Base	Vlorë	Albania		LAVL	
10431	Haskovo Malevo Airport	Haskovo	Bulgaria		LBHS	
10432	Gabrovnitsa Air Base	Gabrovnitsa	Bulgaria		LBMG	
10433	Graf Ignatievo Air Base	Graf Ignatievo	Bulgaria		LBPG	
10434	Dolna Mitropoliya Air Base	Dolna Mitropoliya	Bulgaria		LBPL	
10435	Balchik Air Base	Balchik	Bulgaria		LBWB	
10436	Cuatro Vientos Airport	Madrid	Spain	ECV	LECU	
10437	Castellón-Costa Azahar Airport	Castellón de la Plana	Spain	CDT	LEDS	
10438	Teruel Airport	Teruel	Spain	TEV	LETL	
10439	Blois-Le Breuil Airport	Blois/Le Breuil	France		LFOQ	
10440	Trento-Mattarello Airport	Trento (TN)	Italy		LIDT	
10441	Alessandria Airport	Alessandria	Italy		LILA	
10442	Biella-Cerrione Airport	Biella (BI)	Italy		LILE	
10443	Vercelli Airport	Vercelli	Italy		LILI	
10444	Casale Monferrato Airport	Casale Monferrato	Italy		LILM	
10445	Varese-Venegono Airport	Varese	Italy		LILN	
10446	Novi Ligure Airport	Novi Ligure	Italy		LIMR	
10447	Sarzana-Luni Air Base	Sarzana (SP)	Italy	QLP	LIQW	
10448	Câmpia Turzii Air Base	Câmpia Turzii	Romania		LRCT	
10449	Mărculeşti International Airport	Mărculeşti	Moldova		LUBM	
10450	Cahul International Airport	Cahul	Moldova		LUCH	
10451	Tiraspol Airport	Tiraspol	Moldova		LUTR	
10452	Batajnica Air Base	Batajnica	Serbia	BJY	LYBT	
10453	Rubelsanto Airport	Rubelsanto	Guatemala	RUV	MGRB	
10454	Coronel Enrique Soto Cano Air Base	Comayagua	Honduras	XPL	MHSC	
10455	Upala Airport	Upala	Costa Rica	UPL	MRUP	
10456	San Nicolas De Bari Airport	San Nicolás	Cuba	QSN	MUNB	
10457	San Julian Air Base	Pinar Del Rio	Cuba	SNJ	MUSJ	
10458	King Salman Abdulaziz Airport		Saudi Arabia	DWD	OEDM	
10459	King Khaled Air Base		Saudi Arabia	KMX	OEKM	
10460	Riyadh Air Base	Riyadh	Saudi Arabia	XXN	OERY	
10461	Jam Airport	Kangan	Iran	KNR	OIBJ	
10462	Hamadan Air Base	Hamadan	Iran		OIHS	
10463	Payam International Airport	Karaj	Iran	PYK	OIIP	
10464	Ahmed Al Jaber Air Base	Ahmed Al Jaber AB	Kuwait	XIJ	OKAJ	
10465	Rayak Air Base	Rayak	Lebanon		OLRA	
10466	Mirpur Khas Air Base	Mirpur Khas	Pakistan		OPMK	
10467	Minhas Air Base	Kamra	Pakistan	ATG	OPMS	
10468	Rafiqui Air Base	Shorkot	Pakistan		OPRQ	
10469	Faisal Air Base	Karachi	Pakistan		OPSF	
10470	Mushaf Air Base	Sargodha	Pakistan	SGI	OPSR	
10471	Qayyarah West Airport	Qayyarah	Iraq	RQW	ORQW	
10472	Al Sahra Army Air Field	Tikrit	Iraq		ORSH	
10473	Tall Afar Army Air Field	Tall Afar	Iraq		ORTF	
10474	Al Taji Army Air Field	Taji	Iraq		ORTI	
10475	Ubaydah Bin Al Jarrah Airport	Al Cut	Iraq		ORUB	
10476	Nenana Municipal Airport	Nenana	United States	ENN	PANN	
10477	Wasilla Airport	Wasilla	United States	WWA	PAWS	
10478	Gangshan Air Force Base	Gangshan	Taiwan		RCAY	
10479	Asahikawa Airfield		Japan		RJCA	
10480	Iwakuni Marine Corps Air Station	Iwakuni	Japan	IWK	RJOI	
10481	Utsunomiya Airport		Japan		RJTU	
10482	Jungwon Air Base/Chungju Airport		South Korea		RKTI	
10483	Ie Jima Airport	Ie	Japan	IEJ	RORE	
10484	Allah Valley Airport	Surallah	Philippines	AAV	RPMA	
10485	Bislig Airport		Philippines	BPH	RPMF	
10486	Mati National Airport		Philippines	MXI	RPMQ	
10487	Presidente Néstor Kirchner Regionsl Airport	Villa Maria	Argentina		SAOV	
10488	Chafei Amsei Airport	Barretos	Brazil	BAT	SBBT	
10489	Base de Aviação de Taubaté Airport	Taubaté	Brazil	QHP	SBTA	
10490	Barriles Airport	Tocopilla	Chile	TOQ	SCBE	
10491	Schroeder's field	Cochrane	Chile		SCHR	
10492	Chañaral Airport	Chañaral	Chile	CNR	SCRA	
10493	Panguilemo Airport	Talca	Chile	TLX	SCTL	
10494	Victoria Airport	Victoria	Chile	ZIC	SCTO	
10495	Las Breas Airport	Taltal	Chile	TTC	SCTT	
10496	Gomez Nino Apiay Air Base	Apiay	Colombia	API	SKAP	
10497	Coveñas Airport	Coveñas	Colombia	CVE	SKCV	
10498	German Olano Air Base	La Dorada	Colombia	PAL	SKPQ	
10499	Paz De Ariporo Airport	Paz De Ariporo	Colombia	PZA	SKPZ	
10500	Tunja Airport	Tunja	Colombia		SKTJ	
10501	Tres Esquinas Air Base	Tres Esquinas	Colombia	TQS	SKTQ	
10502	Marandúa Air Base	Marandúa	Colombia		SKUA	
10503	Juan Simons Vela Airport	Rioja	Peru	RIJ	SPJA	
10504	Shumba Airport	Jaén	Peru	JAE	SPJE	
10505	Metropolitano Airport		Venezuela		SVMP	
10506	Issyk-Kul International Airport	Tamchy	Kyrgyzstan	IKU	UAFL	
10507	Kant Air Base	Kant	Kyrgyzstan		UAFW	
10508	Ayaguz Airport	Ayaguz	Kazakhstan		UASA	
10509	Chelkar Airport	Chelkar	Kazakhstan		UATR	
10510	Kyzyl-Syr Airport	Kyzyl-Syr	Russia		UENK	
10511	Vilyuisk Airport	Vilyuisk	Russia	VYI	UENW	
10512	Belaya Gora Airport		Russia	BGN	UESG	
10513	Dzhermuk Airport	Dzhermuk	Armenia		UGEJ	
10514	Kamenny Ruchey Naval Air Base	Sovetskaya Gavan	Russia		UHKG	
10515	Maygatka Airport.	Sovetskaya Gavan	Russia	GVN	UHKM	
10516	Omsukchan Airport	Omsukchan	Russia		UHMF	
10517	Chaybukha Airport	Chaybukha	Russia		UHMG	
10518	Keperveem Airport	Keperveem	Russia		UHMK	
10519	Magadan-13 Airport	Magadan	Russia		UHMT	
10520	Nikolayevsk-na-Amure Airport	Nikolayevsk-na-Amure Airport	Russia	NLI	UHNN	
10521	Palana Airport	Palana	Russia		UHPL	
10522	Zheleznogorsk Airport	Zheleznogorsk-Ilimsky	Russia		UIBV	
10523	Gvardeyskoe Air Base	Sarabuz	Ukraine		UKFG	
10524	Saki Air Base	Saki	Ukraine		UKFI	
10525	Dzhankoy Airport	Dzhankoy	Ukraine		UKFY	
10526	Ozerne Air Base	Zhytomyr	Ukraine		UKKO	
10527	Severomorsk-1 Naval Air Base	Severomorsk	Russia		ULAK	
10528	Pushkin Airport	St. Petersburg	Russia		ULLP	
10529	Siversky Air Base	Siversky	Russia		ULLS	
10530	Staraya Russa Air Base	Staraya Russa	Russia		ULNR	
10531	Peski Airport	Petrozavodsk	Russia		ULPP	
10532	Baranavichi Air Base	Baranavichi	Belarus		UMMA	
10533	Babruisk Air Base	Babruisk	Belarus		UMNB	
10534	Severo-Eniseysk Airport	Severo-Eniseysk	Russia		UNIS	
10535	Sharypovo Airport	Sharypovo	Russia		UNKO	
10536	Omsk Severny Airport	Omsk	Russia		UNOS	
10537	Nagurskoye	Murmansk	Russia		UODN	
10538	Svetlogorsk Airport	Svetlogorsk	Russia		UOIG	
10539	Valek Airport	Valek	Russia		UOOW	
10540	Khanskaya Air Base	Maykop	Russia		URKH	
10541	Dudinka Airport	Dudinka	Russia		UROD	
10542	Volgodonsk Airport		Russia	VLK	URRY	
10543	Tashkent East Airport	Tashkent	Uzbekistan		UTTP	
10544	Myachkovo Airport	Moscow	Russia		UUBM	
10545	Tretyakovo Airport	Lukhovitsy	Russia		UUMT	
10546	Yermolino Airport	Balabanovo	Russia		UUWE	
10547	Inta Airport	Inta	Russia	INA	UUYI	
10548	Izhma Airport	Izhma	Russia		UUYV	
10549	Borisoglebskoye Airport	Kazan	Russia		UWKG	
10550	Zhigansk Airport	Zhigansk	Russia	ZIX	UWKV	
10551	Maksimovka Airport	Ufa	Russia		UWUM	
10552	Buguruslan Severny Airport	Buguruslan	Russia		UWWB	
10553	Bezymyanka Airfield	Samara	Russia		UWWG	
10554	Ratnagiri Airport		India	RTC	VARG	
10555	Hingurakgoda Air Force Base	Polonnaruwa Town	Sri Lanka	HIM	VCCH	
10556	Kazi Nazrul Islam Airport	Durgapur	India	RDP	VEDG	
10557	Ambala Air Force Station		India		VIAM	
10558	Sirsa Air Force Station		India		VISA	
10559	Udhampur Air Force Station		India		VIUX	
10560	Sri Sathya Sai Airport	Puttaparthi	India	PUT	VOPN	
10561	Meiktila Air Base	Meiktila	Burma		VYML	
10562	Changi Air Base (East)	Singapore	Singapore		WSAC	
10563	Soltsy-2 Air Base	Soltsy	Russia		XLLL	
10564	Severomorsk-3 Naval Air Base	Severomorsk	Russia		XLMV	
10565	Fedotovo Naval Air Base	Kipelovo	Russia		XLWF	
10566	Lebyazhye Air Base	Kamyshin	Russia		XRWL	
10567	Smolensk North Airport	Smolensk	Russia	LNX	XUBS	
10568	Rtishchevo Air Base	Rtishchevo	Russia		XWPR	
10569	Alpha Airport	Alpha	Australia	ABH	YAPH	
10570	Ararat Airport		Australia	ARY	YARA	
10571	Benalla Airport		Australia	BLN	YBLA	
10572	Balranald Airport		Australia	BZD	YBRN	
10573	Brewarrina Airport		Australia	BWQ	YBRW	
10574	Cleve Airport		Australia	CVC	YCEE	
10575	Corowa Airport		Australia	CWW	YCOR	
10576	Corryong Airport		Australia	CYG	YCRG	
10577	Cootamundra Airport		Australia	CMD	YCTM	
10578	Dirranbandi Airport		Australia	DRN	YDBI	
10579	Deniliquin Airport	Deniliquin	Australia	DNQ	YDLQ	
10580	Dysart Airport		Australia	DYA	YDYS	
10581	Echuca Airport		Australia	ECH	YECH	
10582	Forbes Airport	Forbes	Australia	FRB	YFBS	
10583	Gunnedah Airport		Australia	GUH	YGDH	
10584	Hay Airport		Australia	HXX	YHAY	
10585	Hopetoun Airport		Australia	HTU	YHPN	
10586	Kerang Airport		Australia	KRA	YKER	
10587	Kempsey Airport		Australia	KPS	YKMP	
10588	Kingaroy Airport		Australia	KGY	YKRY	
10589	Latrobe Valley Airport	Morwell	Australia	TGN	YLTV	
10590	Mareeba Airport		Australia	MRG	YMBA	
10591	Ngukurr Airport		Australia	RPM	YNGU	
10592	Narromine Airport		Australia	QRM	YNRM	
10593	Port Pirie Airport		Australia	PPI	YPIR	
10594	Smithton Airport		Australia	SIO	YSMI	
10595	Snake Bay Airport		Australia	SNB	YSNB	
10596	Stawell Airport		Australia	SWC	YSWL	
10597	Tibooburra Airport		Australia	TYB	YTIB	
10598	Tumut Airport		Australia	TUM	YTMU	
10599	Wangaratta Airport		Australia	WGT	YWGT	
10600	Warracknabeal Airport		Australia	WKB	YWKB	
10601	Warren Airport		Australia	QRR	YWRN	
10602	West Sale Airport	Sale	Australia	SXE	YWSL	
10603	West Wyalong Airport	West Wyalong	Australia	WWY	YWWL	
10604	Young Airport		Australia	NGA	YYNG	
10605	Guangzhou MR Air Base	Guanghua	China	LHK	ZHGH	
10606	Shiyan Wudangshan Airport	Shiyan	China	WDS	ZHSY	
10607	Sunchon Air Base	Sunchon	North Korea		ZKSC	
10608	Huatugou Airport	Mengnai	China	HTT	ZLHX	
10609	Baruun Urt Airport		Mongolia	UUN	ZMBU	
10610	Bengbu Airport	Bengbu	China	BFU	ZSBB	
10611	Rugao Air Base	Rugao	China	RUG	ZSRG	
10612	Wuhu Air Base	Wuhu	China	WHU	ZSWU	
10613	Shanshan Airport	Shanshan	China	SXJ	ZWSS	
10614	Yingkou Lanqi Airport	Yingkou	China	YKH	ZYYK	
10615	Shenyang Dongta Airport	Shenyang	China		ZYYY	
10616	Bogorodskoye Airport	Bogorodskoe	Russia	BQG	UHNB	
10617	Itapiranga Airport	Itapiranga	Brazil		SSYT	
10618	Kanuhuraa Island	Kanuhuraa Island	Maldives			
10619	Kwara Airstrip	Kwara Camp	Botswana			
10620	Matemo Island	Matemo Island	Mozambique			
10621	Medjumbe Island	Medjumbe Island	Mozambique			
10622	Koh Lanta Harbor	Koh Lanta	Thailand			
10623	Paradise Resort Koh Yao Noi	Koh Yao Noi	Thailand			
10624	Gare Martime Papeete	Papeete	French Polynesia			
10625	Gare Maritime Moorea Vaiare	Moorea	French Polynesia			
10626	Kahului Cruise Terminal	Kahului Maui	United States			
10627	Aguas Calientes Airport	Aguas Calientes	Peru		SPAT	
10628	Kemayoran Airport	Jakarta	Indonesia	JKT	WIID	
10629	Black Rock City Airport	Gerlach	United States			
10630	Takatsuki Station 	Takatsuki	Japan			
10631	Izumi Fuchu Station	Izumi	Japan			
10632	Beijing East Railway Station	Beijing	China			
10633	Binhai Railway Station	Tianjin	China			
10634	Baldi South Railway Station	Baodi	China			
10635	Christianshavn Station	Copenhagen	Denmark			
10636	Amagerbro Station	Copenhagen	Denmark			
10637	Lergravsparken Station	Copenhagen	Denmark			
10638	Oresund Station	Copenhagen	Denmark			
10639	Amager Strand Station	Copenhagen	Denmark			
10640	Kastrup Station	Copenhagen	Denmark			
10641	Brussels-Congress Railway Station	Brussels	Belgium			
10642	Haren-Sud Railway Station	Brussels	Belgium			
10643	Diegem Railway Station	Machelen	Belgium			
10644	Zaventem Railway Station	Zaventem	Belgium			
10645	Rajiv Gandhi International Airport	Hyderabad	India	HYD	VOHS	
10646	North Hsinchu Station	Hsinchu	Taiwan			
10647	Zhubei Station	Zhubei	Taiwan			
10648	Vancouver International Seaplane Base	Vancouver	Canada		CAM9	
10649	Port Washington Water Aerodrome	Port Washington	Canada		CAP8	
10650	Liujia Station	Zhubei	Taiwan			
10651	Den Haag Centraal	Den Haag	Netherlands	ZYH		
10652	Duisburg Hauptbahnhof	Duisburg	Germany			
10653	Dicka	DICKA	United States	DIC	DICK	
10654	Bressaucourt Airport	Bressaucourt-Porrentruy	Switzerland		LSZQ	
10655	Kimana Zebra Lodge	Kimana	Kenya			
10656	Tsavo East Crocodile Camp	Tsave East	Kenya			
10657	Massai Mara Mara Buffalo Camp	Massai Mara	Kenya			
10658	Bamburi Airport	Bamburi	Kenya			
10659	Pioltello-Limito Railway Station	Pioltello	Italy			
10660	Verdello-Dalmine Railway Station	Verdellino	Italy			
10661	Treviglio-Ovest Railway Station	Treviglio	Italy			
10662	Parakou Airport	Parakou	Benin	PKO	DBBP	
10663	Aerodrom Arseniev	Arseniev	Russia	XBA	BXBA	
10664	Kandi Airport	Kandi	Benin	KDC	DBBK	
10665	Luxmore Hut Helipad	Te Anau	New Zealand			
10666	Tasman Glacier	Mt. Cook	New Zealand			
10667	Sokodé Airport	Sokode	Togo		DXSK	
10668	Sansanné-Mango Airport	Mango	Togo		DXMG	
10669	Gorizia Centrale	Gorizia	Italy			
10670	Gallipoli	Gallipoli	Italy			
10671	Zollino	Zollino	Italy			
10672	Lecce	Lecce	Italy			
10673	Valga	Valga	Estonia			
10674	Namba Station	Osaka	Japan			
10675	Lindau Hbf	Lindau	Germany	QII		
10676	Tengachaya Station	Osaka	Japan			
10677	Sakai Station	Osaka	Japan			
10678	Kishiwada Station	Osaka	Japan			
10679	Izumisano Station	Osaka	Japan			
10680	Bregenz	Bregenz	Austria	XGZ		
10681	Rinku Town Station	Osaka	Japan			
10682	Gare de Maintenon	Maintenon	France			
10683	Gare dEpernon	Epernon	France			
10684	Gare de la Loupe	La Loupe	France			
10685	Gare de Courville sur Eure	Courville sur Eure	France			
10686	Chengdu East Railway Station	Chengdu	China			
10687	Ziyang North Railway Station	Ziyang	China			
10688	Neijiang North Railway Station	Neijiang	China			
10689	Velidhoo	Velidhoo	Maldives			
10690	Sundance Helicopters	Quatermaster Canyon	United States			
10691	Arnbruck Airport	Arnbruck	Germany		EDNB	
10692	Bad Schandau Bahnhof	Bad Schandau	Germany			
10693	Sandiaoling Station	Sandiaoling	Taiwan			
10694	High Speed Rail Station	Miaoli	Taiwan			
10695	Sagunto Railway Station	Sagunto	Spain			
10696	Oropesa del Mar Railway Station	Oropesa del Mar	Spain			
10697	Vinaros Railway Station	Vinaros	Spain			
10698	Aldea-Amposta-Tortosa Railway Station	Aldea	Spain			
10699	Castelldefels Railway Station	Castelldefels	Spain			
10700	Sitges Railway Station	Sitges	Spain			
10701	Castejon de Ebro Railway Station	Castejon de Ebro	Spain			
10702	Tudela de Navarra Railway Station	Tudela	Spain			
10703	Alfaro Railway Station	Alfaro	Spain			
10704	Calahorra Railway Station	Calahorra	Spain			
10705	Haro Railway Station	Haro	Spain			
10706	Carl St. and Cole St. Station	San Francisco	United States			
10707	Judah and Sunset	San Francisco	United Kingdom			
10708	2nd and King Station	San Francisco	United States			
10709	Brannan and The Embarcadero Station	San Francisco	United Kingdom			
10710	Folsom and The Embarcadero Station	San Francisco	United States			
10711	Montgomery Street Station	San Francisco	United States			
10712	Powell Street Station	San Francisco	United States			
10713	Van Ness Station	San Francisco	United States			
10714	Duboce and Church Station	San Francisco	United States			
10715	Duboce and Noe Street Station	San Francisco	United States			
10716	Irving and 2nd Avenue Station	San Francisco	United States			
10717	Judah and 9th Avenue	San Francisco	United States			
10718	Bay Shore Blvd and Boutwell St	San Francisco	United States			
10719	7th St and Bryant St	San Francisco	United States			
10720	Cherry and Grundy	San Bruno	United States			
10721	Jacarepaguá - Roberto Marinho Airport	Rio de Janeiro	Brazil		SBJR	
10722	Los Altos Station	Los Altos	United States			
10723	Hacaritama Airport	Aguachica	Colombia		SKAG	
10724	Castro Street Station	San Francisco	United States			
10725	St. Francis Blvd and Clarinada Ave	Daly City	United States			
10726	Downtown Berkeley BART Station	Berkeley	United States			
10727	West Portal Ave and Sloat Blvd	San Francisco	United States			
10728	Portola Dr and Burnett Ave	San Francisco	United States			
10729	Saratoga and Payne	San Jose	United States			
10730	Hermannsburg Airport	Hermannsburg	Australia	HMG	YHMB	
10731	West Oakland BART Station	Oakland	United States			
10732	Lake Merritt BART Station	Oakland	United States			
10733	Fruitvale BART Station	Oakland	United States			
10734	Oakland Coliseum BART Station	Oakland	United States			
10735	Oakland International Airport BART Station	Oakland	United States			
10736	Saratoga and Moorpark	San Jose	United States			
10737	Homestead and Mary	San Jose	United States			
10738	San Antonio and Bayshore	Palo Alto	United States			
10739	Busan Port International Passenger Terminal	Busan	South Korea			
10740	Mount Davies Airport	Pipalyatjara	Australia		YMDV	
10741	Areyonga Airport	Areyonga	Australia		YARN	
10742	North Sea	Arbroath	United Kingdom		ARB1	
10743	Tracy Municipal Airport	Tracy	United States		KTCY	
10744	Embarcadero and Stockton St	San Francisco	United States			
10745	Embarcadero and Ferry Building	San Francisco	United States			
10746	Doolittle Station	Oakland	United States			
10747	Osaka Airport Station	Itami	Japan			
10748	Hotarugaike Station	Osaka	Japan			
10749	Hattori-tenjin Station	Osaka	Japan			
10750	Toyonaka Station	Osaka	Japan			
10751	Okamachi Station	Osaka	Japan			
10752	Sone Osaka Station	Osaka	Japan			
10753	Shonai Osaka Station	Osaka	Japan			
10754	Mikuni Osaka Station	Osaka	Japan			
10755	Juso Osaka Station	Osaka	Japan			
10756	Nakatsu Osaka Hankyu Station	Osaka	Japan			
10757	Umeda Hankyu Station	Osaka	Japan			
10758	Hamamatsucho Station	Tokyo	Japan			
10759	Oi Keibajo-mae Station	Tokyo	Japan			
10760	Ryutsu Center Station	Tokyo	Japan			
10761	Showajima Station	Tokyo	Japan			
10762	Seibijo Station	Tokyo	Japan			
10763	Tenkubashi Station	Tokyo	Japan			
10764	Shin-Seibijo Station	Tokyo	Japan			
10765	Wassmannsdorf Station	Wassmannsdorf	Germany			
10766	Altglienicke Station	Berlin	Germany			
10767	Grunbergallee Station	Berlin	Germany			
10768	Blankenburg Station	Berlin	Germany			
10769	Wartenberg Station	Berlin	Germany			
10770	Gehrenseestrasse Station	Berlin	Germany			
10771	Springpfuhl Station	Berlin	Germany			
10772	Springpfuhl Station	Berlin	Germany			
10773	Pankow Station	Berlin	Germany			
10774	Bornholmer Strasse Station	Berlin	Germany			
10775	Mount Allan Airport	Yuelamu	Australia		YMNA	
10776	Everard Park Airport	Mimili	Australia		YEVP	
10777	Warrabri Airport	Ali-Curung	Australia		YWBI	
10778	Dortmund Hauptbahnhof	Dortmund	Germany			
10779	Essen	Essen Hauptbahnhof	Germany			
10780	Gare de Creil	Creil	France			
10781	Gare de Compiegne	Compiegne	France			
10782	Gare de Tergnier	Tergnier	France			
10783	Gare de Saint-Quentin	Saint-Quentin	France			
10784	Gare de Busigny	Busigny	France			
10785	Gare de Maubeuge	Maubeuge	France			
10786	Mons Railway Station	Mons	Belgium			
10787	Gare de Soignies	Soignies	Belgium			
10788	Halle Railway Station	Halle	Belgium			
10789	Gare de Meaux	Meaux	France			
10790	Gare de Chateau-Thierry	Chateau-Thierry	France			
10791	Gare d Epernay	Epernay	France			
10792	Gare de Chalons-en-Champagne	Chalons-en-Champagne	France			
10793	Gare de Vitry-le-Francois	Vitry-le-Francois	France			
10794	Gare de Nancy-Ville	Nancy	France			
10795	Gare de Remilly	Remilly	France			
10796	Gare de Forbach	Forbach	France			
10797	Saarbrucken Hauptbahnhof	Saarbrucken	Germany			
10798	Sankt Ingbert Bahnhof	Sankt Ingbert 	Germany			
10799	Rohrbach Saar Station	Rohrbach 	Germany			
10800	Homburg Saar Hauptbahnhof	Homburg Saar	Germany			
10801	Kaiserslautern Hauptbahnhof	Kaiserslautern	Germany			
10802	Neustadt Weinstrasse Hauptbahnhof	Neustadt Weinstrasse	Germany			
10803	Ludwigshafen Rhein Hauptbahnhof	Ludwigshafen Rhein	Germany			
10804	Biblis Bahnhof	Biblis	Germany			
10805	Riedstadt-Goddelau Bahnhof	Riedstadt-Goddelau	Germany			
10806	Zeppelinheim Bahnhof	Zeppelinheim	Germany			
10807	Kelsterbach Bahnhof	Kelsterbach	Germany			
10808	Russelsheim Bahnhof	Russelsheim	Germany			
10809	Mainz Romisches Theater Bahnhof	Mainz 	Germany			
10810	Mainz-Mombach Bahnhof	Mainz	Germany			
10811	Bingen Rhein Stadt Bahnhof	Bingen Rhein Stadt Bahnhof	Germany			
10812	Bingen Rhein Hauptbahnhof	Bingen Rhein Stadt	Germany			
10813	Oberwesel Bahnhof	Oberwesel	Germany			
10814	Boppard Hauptbahnhof	Boppard	Germany			
10815	Koblenz Hauptbahnhof	Koblenz	Germany			
10816	Andernach Bahnhof	Andernach	Germany			
10817	Remagen Bahnhof	Remagen	Germany			
10818	Bonn-Mehlem Bahnhof	Bonn	Germany			
10819	Bonn-Bad Godesberg Bahnhof	Bonn	Germany			
10820	Roisdorf Bahnhof	Bornheim	Germany			
10821	Sechtem Bahnhof	Bornheim	Germany			
10822	Bruhl Bahnhof	Bruhl	Germany			
10823	Hurth-Kalscheuren Bahnhof	Hurth	Germany			
10824	Cologne Sud Railway	Cologne	Germany			
10825	Cologne West Railway	Cologne	Germany			
10826	Cologne-Mulheim Bahnhof	Cologne	Germany			
10827	Leverkusen Mitte Railway Station	Leverkusen	Germany			
10828	Duisburg-Grossenbaum Railway Station	Duisburg	Germany			
10829	Munster Hauptbahnhof	Munster	Germany			
10830	Lengerich Railway Station	Lengerich	Germany			
10831	Diepholz Railway Station	Diepholz	Germany			
10832	Bremen Hauptbahnhof	Bremen	Germany			
10833	Rotenburg Railway Station	Rotenburg Wumme	Germany			
10834	Schessel Railway Station	Scheessel	Germany			
10835	Tostedt Railway Station	Tostedt	Germany			
10836	Buchholz Nordheide Railway Station	Buchholz Nordheide	Germany			
10837	Hamburg-Harburg Railway Station	Hamburg	Germany			
10838	Ibbenburen Railway Station	Ibbenburen	Germany			
10839	Salzbergen Railway Station	Salzbergen	Germany			
10840	Bad Bentheim Railway Station	Bad Bentheim	Germany			
10841	Oldenzaal Railway Station	Oldenzaal	Netherlands			
10842	Borne Railway Station	Borne	Netherlands			
10843	Wierden Railway Station	Wierden	Netherlands			
10844	Nijverdal Railway Station	Nijverdal	Netherlands			
10845	Raalte Railway Station	Raalte	Netherlands			
10846	Heino Railway Station	Heino	Netherlands			
10847	Rijssen Railway Station	Rijssen	Netherlands			
10848	Holten Railway Station	Holten	Netherlands			
10849	Twello Railway Station	Twello	Netherlands			
10850	Hoevelaken Railway Station	Hoevelaken	Netherlands			
10851	Baarn Railway Station	Baarn	Netherlands			
10852	Weesp Railway Station	Weesp	Netherlands			
10853	Diemen Railway Station	Diemen	Netherlands			
10854	Amsterdam-De Vlugtlaan	Amsterdam	Netherlands			
10855	Hoofddorp Railway Station	Hoofddorp	Netherlands			
10856	Nieuw-Vennep Railway Station	Nieuw-Vennep	Netherlands			
10857	Sassenheim Railway Station	Sassenheim	Netherlands			
10858	Voorschoten Railway Station	Voorschoten	Netherlands			
10859	Den Haag Laan van NOI Railway Station	Den Haag	Netherlands			
10860	Den Haag-Moerwijk Railway Station	Den Haag	Netherlands			
10861	Rijswijk Railway Station	Rijswijk	Netherlands			
10862	Lage Zwaluwe Railway Station	Lage Zwaluwe	Netherlands			
10863	Zevenbergen Railway Station	Zevenbergen	Netherlands			
10864	Oudenbosch Railway Station	Oudenbosch	Netherlands			
10865	Antwerpen-Berchem Railway Station	Antwerpen	Belgium	ZYZ		
10866	Duffel Railway Station	Duffel	Belgium			
10867	Cambridge Railway Station	Cambridge	United Kingdom		CAMR	
10868	Krefeld-Egelsberg Airport	Krefeld	Germany		EDLK	
10869	Baidoa Airport	Baidoa	Somalia	BIB	HCMB	
10870	Dusseldorf-Flingern Station	Dusseldorf	Germany			
10871	Berliner Tor Station	Hamburg	Germany			
10872	Wandsbek Station	Hamburg	Germany			
10873	Ahrensburg Railway Station	Ahrensburg	Germany			
10874	Bargteheide Railway Station	Bargteheide	Germany			
10875	Bad Oldesloe Railway Station	Bad Oldesloe	Germany			
10876	Reinfeld Holst Railway Station	Reinfeld Holst	Germany			
10877	Bad Schwartau Railway Station	Bad Schwartau	Germany			
10878	Timmendorfer Strand Railway Station	Timmendorfer Strand	Germany			
10879	Scharbeutz Railway Station	Scharbeutz	Germany			
10880	Lensahn Railway Station	Lensahn	Germany			
10881	Oldenburg in Holstein Railway Station	Oldenburg in Holstein	Germany			
10882	Grossenbrode Railway Station	Grossenbrode	Germany			
10883	Amsterdam Bijlmer ArenA Station	Amsterdam	Netherlands			
10884	Amsterdam Holendrecht Station	Amsterdam	Netherlands			
10885	Abcoude Railway Station	Abcoude	Netherlands			
10886	Breukelen Railway Station	Breukelen	Netherlands			
10887	Maarssen Railway Station	Maarssen	Netherlands			
10888	Utrecht Zuilen Railway Station	Utrecht	Netherlands			
10889	Woerden Railway Station	Woerden	Netherlands			
10890	Gouda Goverwelle Railway Station	Gouda	Netherlands			
10891	Nieuwerkerk aan den IJssel Railway Station	Nieuwerkerk aan den IJssel	Netherlands			
10892	Capelle Schollevaar Railway Station	Capelle aan den IJssel	Netherlands			
10893	Rotterdam Alexander Station	Rotterdam	Netherlands			
10894	Gare de Saint-Denis	Saint-Denis	France			
10895	Garges Sarcelles RER	Garges les Gonesse	France			
10896	Gare de Mont de Terre	Lille	France			
10897	Kiwirrkurra	Kiwirrkurra	Australia		YKIC	
10898	Ampilatwatja Airport	Ampilatwatja	Australia		YAMJ	
10899	Wien Mitte Railway Station	Vienna	Austria			
10900	Mannsworth Station	Schwechat	Austria			
10901	Schwechat Railway Station	Schwechat	Austria			
10902	Kaiserbersdorf Station	Vienna	Austria			
10903	Zentralfriedhof Station	Vienna	Austria			
10904	Geiselbergestrasse Station	Vienna	Austria			
10905	St. Marx Station	Vienna	Austria			
10906	Rennweg Station	Vienna	Austria			
10907	Bremen-Mahndorf Station	Bremen	Germany			
10908	Gare des Trois Chenes	Belfort	France			
10909	Gare de Bas Evette	Evette Salbert	France			
10910	Gare de Champagney	Champagney	France			
10911	Gare de Illfurth	Illfurth	France			
10912	Gare d Altkirch	Altkirch	France			
10913	Gare de Dannemarie	Dannemarie	France			
10914	Gare de Montreux-Vieux	Montreux-Vieux	France			
10915	Gare de Petit-Croix	Petit-Croix	France			
10916	Gare de Chevremont	Chevremont	France			
10917	Minden Railway Station	Minden	Germany			
10918	Kings Creek Airport	Petermann	Australia	KCS	YKCS	
10919	Harts Range Airport	Harts Range	Australia		YHTS	
10920	Potsdam Park Sanssouci Bahnhof	Potsdam	Germany			
10921	Werder Railway Station	Werder Havel	Germany			
10922	Gross Kreutz Havel Railway Station	Gross Kreutz Havel	Germany			
10923	Gotz Bahnhof	Gotz Gross Kreutz	Germany			
10924	Kirchmoser Bahnhof	Brandenburg an der Havel	Germany			
10925	Wusterwitz Bahnhof	Wusterwitz	Germany			
10926	Gusen Bahnhof	Gusen	Germany			
10927	Burg Bahnhof	Burg	Germany			
10928	Moser Bahnhof	Moser Ortschaft	Germany			
10929	Biederitz Bahnhof	Biederitz	Germany			
10930	Herrenkrug Bahnhof	Magdeburg	Germany			
10931	Neue Neustadt Bahnhof	Magdeburg	Germany			
10932	Martinsburg Station	Martinsburg	United States			
10933	Cary Station	Cary	United States			
10934	Southern Pines Station	Southern Pines	United States			
10935	Hamlet Station	Hamlet	United States			
10936	Camden Station	Camden	United States			
10937	Denmark Station	Denmark	United States			
10938	Valparaiso Station	Valparaiso	United States			
10939	Warsaw Station	Warsaw	United States			
10940	Lima Station	Lima	United States			
10941	Mansfield Union Station	Mansfield	United States			
10942	Upper Sandusky Station	Upper Sandusky	United States			
10943	Bucyrus Station	Bucyrus	United States			
10944	Wooster Station	Wooster	United States			
10945	Canton Station	Canton	United States			
10946	SkyTrain Parkhaus 4	Dusseldorf	Germany			
10947	SkyTrain Terminal A B	Dusseldorf	Germany			
10948	SkyTrain Terminal C	Dusseldorf	Germany			
10949	Elliott Airport	Elliott	Australia		YELL	
10950	Papunya Airport	Papunya	Australia		YPAY	
10951	Medienstadt Babelsberg Bahnhof	Potsdam 	Germany			
10952	Michendorf Bahnhof	Michendorf	Germany			
10953	Seddin Bahnhof	Neuseddin	Germany			
10954	Bruck Bahnhof	Bruck	Germany			
10955	Baitz Bahnhof	Baitz	Germany			
10956	Wiesenburg Bahnhof	Wiesenburg	Germany			
10957	Rosslau Bahnhof	Rosslau	Germany			
10958	St. Johann Railway Station	Basel	Switzerland			
10959	Gare de Bartenheim	Bartenheim	France			
10960	Gare de Sierentz	Sierentz	France			
10961	Saint-Louis-la-Chaussee	Gare de Saint-Louis-la-Chaussee	France			
10962	Gare de Rixheim	Rixheim	France			
10963	Zbaszynek Railway Station	Zbaszynek	Poland			
10964	Swiebodzin Railway Station	Swiebodzin	Poland			
10965	Rzepin Railway Station	Rzepin	Poland			
10966	Laskowice Railway Station	Laskowice	Poland			
10967	Mogilno Railway Station	Mogilno	Poland			
10968	Dresden Mitte Station	Dresden	Germany			
10969	Rangsdorf Railway Station	Rangsdorf	Germany			
10970	Zossen Railway Station	Zossen	Germany			
10971	Baruth Mark Railway Station	Baruth Mark	Germany			
10972	Golssen Railway Station	Golssen	Germany			
10973	Uckro Station	Luckau	Germany			
10974	Walddrehna Railway Station	Walddrehna	Germany			
10975	Ruckersdorf Railway Station	Ruckersdorf	Germany			
10976	Hohenleipisch Railway Station	Hohenleipisch	Germany			
10977	Elsterwerda Railway Station	Elsterwerda	Germany			
10978	Wildwood Station	Wildwood	United States			
10979	Baldwin Crossing	Baldwin	United States			
10980	Monoi Station	Yotsukaido	Japan			
10981	Tsuga Station	Chiba	Japan			
10982	Higashi-Chiba	Chiba	Japan			
10983	Koiwa Station	Tokyo	Japan			
10984	Kinshicho	Tokyo	Japan			
10985	Munster-Hiltrup Railway Station	Munster-Hiltrup	Germany			
10986	Bohmte Railway Station	Bohmte	Germany			
10987	Lemforde Railway Station	Lemforde	Germany			
10988	Barnstorf Railway Station	Barnstorf	Germany			
10989	Twistringen Railway Station	Twistringen	Germany			
10990	Bassum Railway Station	Bassum	Germany			
10991	Bramstedt bei Syke Railway Station	Bramstedt bei Syke	Germany			
10992	Syke Railway Station	Syke	Germany			
10993	Kirchweyhe Railway Station	Kirchweyhe	Germany			
10994	Aumuhle Station	Aumuhle	Germany			
10995	Friedrichsruh Station	Aumuhle	Germany			
10996	Buchen Keilbahnhof	Buchen	Germany			
10997	Grabow Meckl Station	Grabow	Germany			
10998	Klein Warnow Station	Klein Warnow	Germany			
10999	Karstadt Station	Karstadt	Germany			
11000	Glowen Station	Plattenburg	Germany			
11001	Zernitz Station	Zernitz	Germany			
11002	Fregon Airport	Fregon	Australia		YFRG	
11003	Mount Liebig Airport	Mt Liebig	Australia		YLBG	
11004	Rangali Seaplane Platform	Rangali	Maldives			
11005	Bernau bei Berlin Station	Bernau bei Berlin	Germany			
11006	Eberswalde Hauptbahnhof	Eberswalde	Germany			
11007	Britz Railway Station	Britz	Germany			
11008	Chorin Railway Station	Chorin	Germany			
11009	Angermunde-Wilmersdorf	Angermunde	Germany			
11010	Warnitz Station	Warnitz	Germany			
11011	Seehausen Railway Station	Seehausen	Germany			
11012	Prenzlau Railway Station	Prenzlau	Germany			
11013	Nechlin Railway Station	Nechlin	Germany			
11014	Pasewalk Railway Station	Pasewalk	Germany			
11015	Jatznick Railway Station	Jatznick	Germany			
11016	Ferdinandshof Railway Station	Ferdinandshof	Germany			
11017	Ducherow Railway Station	Ducherow	Germany			
11018	Anklam Railway Station	Anklam	Germany			
11019	Klein Bunzow Railway Station	Klein Bunzow	Germany			
11020	Zussow Railway Station	Zussow	Germany			
11021	Gross Kiesow Railway Station	Gross Kiesow	Germany			
11022	Greifswald Sud Railway Station	Greifswald	Germany			
11023	Greifswald Railway Station	Greifswald	Germany			
11024	Miltzow Railway Station	Miltzow	Germany			
11025	Stralsund Hauptbahnhof	Stralsund	Germany			
11026	Sarajevo Railway Station	Sarajevo	Bosnia and Herzegovina			
11027	Bolton Field	Columbus	United States		KTZR	
11028	Baltrum Airport	Baltrum	Germany	BMR	EDWZ	
11029	Astorp Railway Station	Astorp	Sweden			
11030	Klippan Railway Station	Klippan	Sweden			
11031	Perstorp Railway Station	Perstorp	Sweden			
11032	Hassleholm Centralstation	Hassleholm	Sweden			
11033	Osby Railway Station	Osby	Sweden			
11034	Almhult Railway Station	Almhult	Sweden			
11035	Alvesta Railway Station	Alvesta	Sweden			
11036	Lammhult Railway Station	Lammhult	Sweden			
11037	Stockaryd Railway Station	Stockaryd	Sweden			
11038	Savsjo Railway Station	Savsjo	Sweden			
11039	Nassjo Centralstation	Nassjo	Sweden			
11040	Aneby Railway Station	Aneby	Sweden			
11041	Tranas Railway Station	Tranas	Sweden			
11042	Mjolby Railway Station	Mjolby	Sweden			
11043	Linkoping Centralstation	Linkoping	Sweden			
11044	Norrkoping Centralstation	Norrkoping	Sweden			
11045	Katrineholm Centralstation	Katrineholm	Sweden			
11046	Flen Railway Station	Flen	Sweden			
11047	Gnesta Railway Station	Gnesta	Sweden			
11048	Molnbo Railway Station	Molnbo	Sweden			
11049	Jarna Railway Station	Jarna	Sweden			
11050	Sodertalje Syd Railway Station	Sodertalje	Sweden			
11051	Sodertalje Hamm Railway Station	Sodertalje	Sweden			
11052	Sodertalje Ostertalje Railway Station	Sodertalje	Sweden			
11053	Ronninge Railway Station	Ronninge	Sweden			
11054	Tullinge Railway Station	Tullinge	Sweden			
11055	Flemingsberg Railway Station	Flemingsberg	Sweden	XEW		
11056	Huddinge Railway Station	Huddinge	Sweden			
11057	Alvsjo Railway Station	Alvsjo	Sweden			
11058	Stockholm-Sodra Station	Stockholm	Sweden			
11059	Gare de Clamart	Clamart	France			
11060	Gare de Meudon	Meudon	France			
11061	Gare de Bellevue	Meudon	France			
11062	Gare de Saint-Quentin-en-Yvelines	Montigny-le-Bretonneux	France			
11063	Wattenscheid Station	Bochum	Germany			
11064	Essen West Station	Essen	Germany			
11065	Mulheim Hauptbahnhof	Mulheim	Germany			
11066	Mulheim West Station	Mulheim	Germany			
11067	Mulheim-Styrum Station	Mulheim	Germany			
11068	Essen-Frohnhausen Station	Essen	Germany			
11069	Essen-Steele Station	Essen	Germany			
11070	Essen-Steele Ost Station	Essen	Germany			
11071	Essen-Eiberg Station	Essen	Germany			
11072	Bochum-Ehrenfeld Station	Bochum	Germany			
11073	Bochum-Langendreer West Station	Bochum	Germany			
11074	Bochum-Langendreer Station	Bochum	Germany			
11075	Dortmund-Kley Station	Dortmund	Germany			
11076	Dortmund-Oespel Station	Dortmund	Germany			
11077	Dortmund University Station	Dortmund	Germany			
11078	Dortmund-Dorstfeld Sud Station	Dortmund	Germany			
11079	Dortmund-Dorstfeld Station	Dortmund	Germany			
11080	Dortmund-Scharnhorst Station	Dortmund	Germany			
11081	Dortmund-Kurl Station	Dortmund	Germany			
11082	Kamen Station	Kamen	Germany			
11083	Dusseldorf-Reisholz Station	Dusseldorf	Germany			
11084	Dusseldorf-Benrath Station	Dusseldorf	Germany			
11085	Langenfeld Station	Langenfeld	Germany			
11086	Skagit Regional Airport	Skagit	United States	MVW	KBVS	
11087	Rudnitz Railway Station	Rudnitz	Germany			
11088	Biesenthal Railway Station	Biesenthal	Germany			
11089	Melchow Railway Station	Melchow	Germany			
11090	Eurotunnel Folkestone Terminal	Folkestone	United Kingdom			
11091	Stockholm-Karlberg Station	Stockholm	Sweden			
11092	Stockholm-Solna Station	Stockholm	Sweden			
11093	Stockholm-Ulriksdal Station	Stockholm	Sweden			
11094	Stockholm-Helenelund Station	Stockholm	Sweden			
11095	Sollentuna Railway Station	Sollentuna	Sweden			
11096	Rotebro Railway Station	Rotebro	Sweden			
11097	Upplands Vasby Railway Station	Upplands Vasby	Sweden			
11098	Rosersberg Railway Station	Rosersberg	Sweden			
11099	Marsta Railway Station	Marsta	Sweden			
11100	Knivsta Railway Station	Knivsta	Sweden			
11101	Storvreta Railway Station	Storvreta	Sweden			
11102	Orbyhus Railway Station	Orbyhus	Sweden			
11103	Tierp Railway Station	Tierp	Sweden			
11104	Marma Railway Station	Marma	Sweden			
11105	Skutskar Railway Station	Skutskar	Sweden			
11106	Furuvik Railway Station	Furuvik	Sweden			
11107	Gavle Centralstation	Gavle	Sweden			
11108	Ockelbo Railway Station	Ockelbo	Sweden			
11109	Lingbo Railway Station	Lingbo	Sweden			
11110	Holmsveden Railway Station	Holmsveden	Sweden			
11111	Kilafors Railway Station	Kilafors	Sweden			
11112	Bollnas Railway Station	Bollnas	Sweden			
11113	Arbra Railway Station	Arbra	Sweden			
11114	Jarvso Railway Station	Jarvso	Sweden			
11115	Ljusdal Railway Station	Ljusdal	Sweden			
11116	Alby Industrivagen soda	Alby	Sweden			
11117	Ange Railway Station	Ange	Sweden			
11118	Bracke Railway Station	Bracke	Sweden			
11119	Langsele Railway Station	Langsele	Sweden			
11120	Mellansel Railway Station	Mellansel	Sweden			
11121	Vannas Resecentrum Station	Vannas	Sweden			
11122	Vindeln Resecentrum Station	Vindeln	Sweden			
11123	Hallnas Railway Station	Hallnas	Sweden			
11124	Bastutrask Railway Station	Bastutrask	Sweden			
11125	Jorn Railway Station	Jorn	Sweden			
11126	Alvsbyn Railway Station	Alvsbyn	Sweden			
11127	Morjarv Railway Station	Morjarv	Sweden			
11128	Karungi Railway Station	Karungi	Sweden			
11129	Kemi Railway Station	Kemi	Finland			
11130	Kuivaniemi Railway Statoin	Kuivaniemi	Finland			
11131	Haukipudas Railway Station	Haukipudas	Finland			
11132	Kannas Railway Station	Kannas	Finland			
11133	Bennas Railway Station	Bennas	Finland			
11134	Kauhava Railway Station	Kauhava	Finland			
11135	Lapua Railway Station	Lapua	Finland			
11136	Parkano Railway Station	Parkano	Finland			
11137	Chandauli Majhwar Railway Station	Chandauli	India			
11138	Son Nagar Junction Railway Station	Aurangabad	India			
11139	Sasaram Junction Railway Station	Sasaram	India			
11140	Anugrah Narayan Road Railway Station	Chichmhi	India			
11141	Tughlakabad Railway Station	Tughlakabad	India			
11142	Faridabad New Town Railway Station	Faridabad New Town	India			
11143	Bhuteshwar Railway Station	Mathura	India			
11144	Raja ki Mandi Railway Station	Agra	India			
11145	Grossbeeren Bahnhof	Grossbeeren	Germany			
11146	Dresden-Trachau Station	Dresden	Germany			
11147	Dresden-Coswig Station	Dresden	Germany			
11148	Heidenau Railway Station	Heidenau	Germany			
11149	Schona Railway Station	Schona	Czech Republic			
11150	Duffields MARC Station	Duffields	United States			
11151	Brunswick MARC Station	Brunswick	United States			
11152	Point of Rocks MARC Station	Point of Rocks	United States			
11153	Germantown MARC Station	Germantown	United States			
11154	Gaithersburg MARC Station	Gaithersburg	United States			
11155	Silver Spring MARC Station	Silver Spring	United States			
11156	Crystal City VRE Station	Arlington	United States			
11157	Franconia Springfield Station	Springfield	United States			
11158	Woodbridge VRE Station	Woodbridge	United States			
11159	Fredericksburg Station	Fredericksburg	United States			
11160	Spotsylvania VRE Station	Fredericksburg	United States			
11161	Rippon VRE Station	Woodbridge	United States			
11162	Potomac Shores VRE Station	Dumfries	United States			
11163	Brooke VRE Station	Brooke	United States			
11164	Leeland Road VRE Station	Stafford	United States			
11165	Lorton VRE Station	Lorton	United States			
11166	New Taipei Industrial Park Station	New Taipei	Taiwan			
11167	Chang Gung Memorial Hospital Station	Taoyuan City	Taiwan			
11168	Taoyuan Airport Terminal 1 Station	Taoyuan City	Taiwan			
11169	Taoyuan Airport Terminal 2 Station	Taoyuan City	Taiwan			
11170	Pantin RER Station	Patin	France			
11171	Noisy-le-Sec RER Station	Noisy-le-Sec	France			
11172	Gare de Gagny	Gagny	France			
11173	Gare de Chelles-Gournay	Chelles	France			
11174	Gare de Chaville-Rive-Gauche	Chaville	France			
11175	Gare de Saint-Cyr	Saint-Cyr	France			
11176	Goondiwindi Airport	Goondiwindi	Australia	GOO	YGDI	
11177	Liman Airfield	Odesa	Ukraine		UKOE	
11178	Plesetsk military airfield	Mirny	Russia		XLAP	
11179	Gare de La Courneuve Aubervilliers	La Courneuve	France			
11180	Gare de Drancy	Drancy	France			
11181	Gare du Blanc Mesnil	Le Blanc-Mesnil	France			
11182	Gare de Villepinte	Villepinte	France			
11183	CDGVAL Terminal 1 Station	Tremblay-en-France	France			
11184	CDGVAL Terminal 2 Station	Tremblay-en-France	France			
11185	CDGVAL Terminal 3 Roissypole Station	Tremblay-en-France	France			
11186	CDGVAL Parc de Stationnement PR Station	Tremblay-en-France	France			
11187	CDGVAL Parc de Stationnement PX Station	Tremblay-en-France	France			
11188	Plateau de Vanves Station	Malakoff	France			
11189	Gare de Sevres-Rive Gauche	Sevres	France			
11190	Port harcourt	Port harcourt	Nigeria	PHG		
11191	Pablo Picasso Paris Metro Station	Bobigny	France			
11192	Gallieni Paris Metro Station	Bagnolet	France			
11193	Bois Perrier RER Station	Rosny	France			
11194	Porte Doree Paris Metro Station	Paris	France			
11195	Gentilly RER Station	Gentilly	France			
11196	Le Kremlin-Bicetre Paris Metro Station	Le Kremlin-Bicetre	France			
11197	Chilly-Mazarin RER Station	Chilly-Mazarin	France			
11198	Lognes Emerainville Airport	Lognes	France		LFPL	
11199	Joinville-le-Pont RER Station	Joinville-le-Pont	France			
11200	Aerogare des Invalides	Paris	France			
11201	Gare de Nemours - Saint-Pierre	Nemours	France			
11202	Kaiseraugst Bahnhof	Kaiseraugst	Switzerland			
11203	Sissach Bahnhof	Sissach	Switzerland			
11204	Hagendorf Bahnhof	Hagendorf	Switzerland			
11205	Dagmersellen Bahnhof	Dagmersellen	Switzerland			
11206	Hergiswil Bahnhof	Hergiswil	Switzerland			
11207	Altdorf Bahnhof	Altdorf	Switzerland			
11208	Castione-Arbedo Railway Station	Castione-Arbedo	Switzerland			
11209	Cadenazzo Railway Station	Cadenazzo	Switzerland			
11210	Gallarate Railway Station	Gallarate	Italy			
11211	Saronno Railway Station	Saronno	Italy			
11212	Certosa Railway Station	Milano	Italy			
11213	Brescia Railway Station	Brescia	Italy			
11214	Vicenza Railway Station	Vicenza	Italy			
11215	Ponte di Brenta Railway Station	Padua	Italy			
11216	Portogruaro-Caorle Railway Station	Portogruaro	Italy			
11217	San Marco Railway Station	Palmanova	Italy			
11218	Carina Railway Station	Carnia	Italy			
11219	Pontebba Railway Station	Pontebba	Italy			
11220	Spittal-Millstatter See Bahnhof	Spittal-Millstatter See	Austria			
11221	Eben im Pongau Bahnhof	Eben im Pongau	Austria			
11222	Holzkirchen Bahnhof	Holzkirchen	Germany			
11223	Leipheim Flugplatz	Leipheim	Germany			
11224	Wiesloch-Walldorf Bahnhof 	Wiesloch-Walldorf 	Germany			
11225	Leonberg Bahnhof	Leonberg	Germany			
11226	Weinsberg Bahnhof	Weinsberg	Germany			
11227	Grunstadt Bahnhof	Grunstadt	Germany			
11228	Gare de Saint-Hilaire-au-Temple	Saint-Hilaire-au-Temple	France			
11229	Terminal Station	Chattanooga	United States			
11230	Marion County Brown Field	Jasper	United States	APT	KAPT	
11231	Evergreen Regional Airport/Middleton Field	Evergreen	United States		KGZH	
11232	Flomaton Station	Flomaton	United States			
11233	Pryor Field Regional Airport	Decatur	United States	DCU	KDCU	
11234	Glasgow Municipal Airport	Glasgow	United States	GLW	KGLW	
11235	Lithonia Station	Lithonia	United States			
11236	Madison-Holiday Inn Heliport	Madison	United States			
11237	Augusta Shuttle Station	Augusta	United States			
11238	Harper Ridge Airstrip	Harper Ridge	United States			
11239	Gare de Massy TGV	Massy	France	XJY		
11240	Gare du Mans	Le Mans	France	ZLN		
11241	Gare de Montfort-le-Gesnois	Montfort-le-Gesnois	France			
11242	Gare de Saint-Mars-la-Briere	Saint-Mars-la-Briere	France			
11243	Gare de Champagne	Champagne	France			
11244	Gare de Courtalain	Courtalain	France			
11245	Gare de Voves	Voves	France			
11246	Farasan	Farasan	Saudi Arabia			
11247	Flagler County Airport	Flagler County	United States	FIN	KFIN	
11248	Strausberg Bahnhof	Strausberg	Germany			
11249	Rahnsdorf Station	Berlin	Germany			
11250	Friedrichshagen Station	Berlin	Germany			
11251	Amritsar Junction Railway Station	Amritsar	India			
11252	Chennai Central Railway Station	Chennai	India			
11253	Tavernaero Park Airport	Tavernier	United States			
11254	Hotel Los Recuerdos	Guatape	Colombia			
11255	Largo Station	Key Largo	United States			
11256	Yeehaw Station	Yeehaw Junction	United States			
11257	Williams Hawgwild Airport	Fort Pierce	United States			
11258	Opa-Locka West Airport	Hialeah	United States			
11259	Joe Robbie Stadium Heliport	Miami Gardens	United States			
11260	Homestead Seaboard Air Line Railway Station	Homestead	United States			
11261	Lake Suzy Estates Airfield	Lake Suzy	United States			
11262	Andytown Airstrip	Andytown	United States			
11263	Northside Station	Miami	United States			
11264	Dr. Martin Luther King Jr. Plaza Station	Hialeah	United States			
11265	Brownsville Station	Miami	United States			
11266	Earlington Heights Station	Miami	United States			
11267	Allapattah Station	Miami	United States			
11268	Santa Clara Station	Miami	United States			
11269	Civic Center Station	Miami	United States			
11270	Culmer Station	Miami	United States			
11271	Historic Overtown Lyric Theatre Station	Miami	United States			
11272	Government Center Station	Miami	United States			
11273	Third Street Metromover Station	Miami	United States			
11274	Knight Center Metromover Station	Miami	United States			
11275	Bayfront Park Metromover Station	Miami	United States			
11276	First Street Metromover Station	Miami	United States			
11277	College-Bayside Metromover Station	Miami	United States			
11278	College North Metromover Station	Miami	United States			
11279	Wilkie D. Ferguson Jr. Metromover Station	Miami	United States			
11280	Miami Avenue Metromover Station	Miami	United States			
11281	Highland Gardens Station	Highland Gardens	United States			
11282	College Park MARTA Station	Atlanta	United States			
11283	East Point MARTA Station	Atlanta	United States			
11284	Lakewood-Fort McPherson MARTA Station	Atlanta	United States			
11285	Oakland City MARTA Station	Atlanta	United States			
11286	West End MARTA Station	Atlanta	United States			
11287	Garnett MARTA Station	Atlanta	United States			
11288	Five Points MARTA Station	Atlanta	United States			
11289	Civic Center MARTA Station	Atlanta	United States			
11290	North Avenue MARTA Station	Atlanta	United States			
11291	Midtown MARTA Station	Atlanta	United States			
11292	Arts Center MARTA Station	Atlanta	United States			
11293	Lindbergh Center MARTA Station	Atlanta	United States			
11294	Eglinton TTC Station	Toronto	Canada			
11295	Davisville TTC Station	Toronto	Canada			
11296	St. Clair TTC Station	Toronto	Canada			
11297	Summerhill TTC Station	Toronto	Canada			
11298	Rosedale TTC Station	Toronto	Canada			
11299	Bloor Yonge TTC Station	Toronto	Canada			
11300	Wellesley TTC Station	Toronto	Canada			
11301	College TTC Station	Toronto	Canada			
11302	Dundas TTC Station	Toronto	Canada			
11303	Queen TTC Station	Toronto	Canada			
11304	King TTC Station	Toronto	Canada			
11305	Union TTC Station	Toronto	Canada			
11306	Toronto Pearson Terminal 1 Station	Mississauga	Canada			
11307	Long Branch GO Station	Toronto	Canada			
11308	Badaling Station	Badaling	China			
11309	34th Street Hudson Yards Station	New York	United States			
11310	Battery Park Landing	New York	United States			
11311	59th St BMT 4th Ave Line Brooklyn Station	New York	United States			
11312	8th Ave BMT Sea Beach Line Brooklyn Station	New York	United States			
11313	Goethals Bridge Staten Island Station	New York	United States			
11314	Wall St IRT Lexington Ave Line Station	New York	United States			
11315	Fulton St. Station 	New York	United States			
11316	Brooklyn Bridge City Hall Chambers St	New York	United States			
11317	Canal St. Station	New York	United States			
11318	Spring St. IRT Lexington Ave Line	New York	United States			
11319	Bleecker St. Broadway Lafayette St. Station	New York	United States			
11320	Astor Place IRT Lexington Ave Line Station	New York	United States			
11321	14th St. Union Square Station	New York	United States			
11322	23rd St. IRT Lexington Ave Line Station	New York	United States			
11323	28th St. IRT Lexington Ave Line Station	New York	United States			
11324	33rd St. IRT Lexington Ave Line Station	New York	United States			
11325	Grand Central 42nd St. Station	New York	United States			
11326	Times Square 42nd St. Port Authority Station	New York	United States			
11327	50th St. IRT Broadway 7th Ave Line Station	New York	United States			
11328	59th St. Columbus Circle Station	New York	United States			
11329	66th St. Lincoln Ctr. IRT Broadway 7th Ave. Line Station	New York	United States			
11330	72nd St. IRT Broadway 7th Ave. Line Station	New York	United States			
11331	79th St. IRT Broadway 7th Ave. Line Station	New York	United States			
11332	86th St. IRT Broadway 7th Ave. Line Station	New York	United States			
11333	Paterson Station	Paterson	United States			
11334	Wayne Route 23 Transit Center	Wayne	United States			
11335	Denville Station	Denville	United States			
11336	Mount Arlington Station	Mount Arlington	United States			
11337	Mount Olive Station	Mount Olive	United States			
11338	Columbia NJ Station	Columbia	United States			
11339	Birchwood Pocono Airport	Stroudsburg	United States			
11340	Rye Station	Rye	United States			
11341	Woodbridge NJT Station	Woodbridge	United States			
11342	Meadowlands Station	East Rutherford	United States			
11343	Metuchen Station	Metuchen	United States			
11344	Cranbury Station	Cranbury	United States			
11345	Collins Field	Mount Laurel	United States			
11346	RCA Landing Strip	Deptford Township	United States			
11347	Halltown Airport	Mannington Township	United States			
11348	Riverline Florence Station	Florence	United States			
11349	Larchmont  Metro North Station	Larchmont	United States			
11350	Westerly Station	Westerly	United States			
11351	Wickford Junction MBTA Station	North Kingstown	United States			
11352	TF Green Airport MBTA Station	Providence	United States			
11353	South Attleboro MBTA Station	South Attleboro	United States			
11354	Danielson Airport	Danielson	United States		KLZD	
11355	Waterbury Union Station	Waterbury	United States			
11356	Brewster Station	Brewster	United States			
11357	Route 128 Amtrak Station	Westwood	United States			
11358	Auburndale MBTA Station	Auburndale	United States			
11359	Newtonville Station	Newtonville	United States			
11360	Central MBTA Station	Cambridge	United States			
11361	JFK Umps MBTA Station	Boston	United States			
11362	Andrew MBTA Station	Boston	United States			
11363	Quincy Adams MBTA Station	Quincy	United States			
11364	Aquarium MBTA Station	Boston	United States			
11365	North Station	Boston	United States			
11366	Community College MBTA Station	Boston	United States			
11367	Sullivan Square MBTA Station	Boston	United States			
11368	Wormid Air	Sourthborough	United States			
11369	Palmer Train Depot	Palmer	United States			
11370	Lee Train Depot	Lee	United States			
11371	Lohring Station	Bochum	Germany			
11372	Rathaus Nord Station	Bochum	Germany			
11373	Trevose Station	Trevose	United States			
11374	Hatboro Station	Hatboro	United States			
11375	Fort Washington Station	Fort Washington	United States			
11376	Norristown Transportation Center	Norristown	United States			
11377	Hughes Park Station	Upper Merion Township	United States			
11378	Fetters Construction Airport	Eagle	United States			
11379	Spring Mill Station	Conshohocken	United States			
11380	Conshohocken Station	Conshohocken	United States			
11381	Wissahickon Station	Philadelphia	United States			
11382	East Falls Station	Philadelphia	United States			
11383	Girard Av and 34th St Station	Philadelphia	United States			
11384	University City Station	Philadelphia	United States			
11385	Oregon Station	Philadelphia	United States			
11386	Eastwick Station	Philadelphia	United States			
11387	Crum Lynne Station	Ridley Park	United States			
11388	Marcus Hook Station	Marcus Hook	United States			
11389	Churchmans Crossing station	Newark	United States			
11390	Delaware Crossing	Deepwater	United States			
11391	Wibautstraat Metro Station	Amsterdam	Netherlands			
11392	Stadhuis Metro Station	Rotterdam	Netherlands			
11393	Ropsten Tunnelbanestation	Stockholm	Sweden			
11394	Ostermalmstorg Tunnelbanestation	Stockholm	Sweden			
11395	Gardet Tunnelbanestation	Stockholm	Sweden			
11396	Karlaplan Tunnelbanestation	Stockholm	Sweden			
11397	T-Centralen	Stockholm	Sweden			
11398	Friesenplatz Station	Cologne	Germany			
11399	Rudolfplatz Station	Cologne	Germany			
11400	Barbarossaplatz Station	Cologne	Germany			
11401	Zulpicherplatz Station	Cologne	Germany			
11402	Docker River Airport	Docker River	Australia	DKV	YDVR	
11403	Jerry Phibbs Air	Schenectady	United States			
11404	Amsterdam Station	Amsterdam	United States			
11405	Di Stefano Airpark	Fort Plain	United States			
11406	Riverside Airpark	Utica	United States			
11407	Billinski Airport	McKean	United States			
11408	Double D Skyranch	Drums	United States			
11409	Lackawanna Station	Scranton	United States			
11410	Port Jervis Metro North Station	Port Jervis	United States			
11411	Bloomsburg Municipal Airport	Bloomsburg	United States			
11412	Poverty Air	Mackeyville	United States			
11413	Bellefonte Airport	Bellefonte	United States	N96		
11414	Clearfield Lawrence Airport	Clearfield	United States		KFIG	
11415	Emlenton Municipal Airport	Emlenton	United States			
11416	West Middlesex Airport	West Middlesex	United States			
11417	Wetzl Airport	Jackson	United States			
11418	Hermitage Airstrip	Hermitage	United States			
11419	Cranberry Township Rec Air	Cranberry Township	United States			
11420	Cedar Run Airport	Allison Park	United States			
11421	Greenbelt Station	Greenbelt	United States			
11422	West Falls Church Metro Station	Falls Church	United States			
11423	McLean Metro Station	McLean	United States			
11424	Grosvenor Strathmore Metro Station	North Bethesda	United States			
11425	Forest Glen Metro Station	Forest Glen	United States			
11426	Mansfield MBTA Station	Mansfield	United States			
11427	Gilbert AirPark	Olmsted Park	United States			
11428	Homestead Inn Landing Field	Avery	United States			
11429	Fremont Ind Station	Fremont	United States			
11430	Aretz Airport	Lafayette	United States			
11431	Jasper County Airport	Rensselaer	United States	RNZ	KRZL	
11432	Mayo Clinic Helipad	Rochester	United States			
11433	Piraeus Ferry Terminal	Piraeus	Greece		PIRA	
11434	Santorini Ferry Terminal	Santorini	Greece		RINI	
11435	Heraklion Ferry Terminal	Heraklion	Greece		HERA	
11436	Barcelona-Sants	Barcelona	Spain		BCNR	
11437	Seville Prado San Sebastian Bus Station	Seville	Spain		SEVB	
11438	Madrid Estacion Sur	Madrid	Spain		MADB	
11439	Granada Bus Station	Granada	Spain		GRNB	
11440	Formosa Boulevard KMRT Station	Kaohsiung	Taiwan			
11441	Sinyi Elementary School KMRT Station	Kaohsiung	Taiwan			
11442	Cultural Center KMRT Station	Kaohsiung	Taiwan			
11443	Wukuaicuo KMRT Station	Kaohsiung	Taiwan			
11444	World Games KMRT Station	Kaohsiung	Taiwan			
11445	Ecological District KMRT Station	Kaohsiung	Taiwan			
11446	Kaohsiung Arena KMRT Station	Kaohsiung	Taiwan			
11447	Aozihdi KMRT Station	Kaohsiung	Taiwan			
11448	Houyi KMRT Station	Kaohsiung	Taiwan			
11449	Central Park KMRT Station	Kaohsiung	Taiwan			
11450	Sanduo Shopping District KMRT Station	Kaohsiung	Taiwan			
11451	Shihjia KMRT Station	Kaohsiung	Taiwan			
11452	Kaisyuan KMRT Station	Kaohsiung	Taiwan			
11453	Cianjhen Senior High School KMRT Station	Kaohsiung	Taiwan			
11454	Caoya KMRT Station	Kaohsiung	Taiwan			
11455	Old Bridge Airport	Englishtown	United States	3N6		
11456	Opfikon Railway Station	Opfikon	Switzerland			
11457	Horgen Oberdorf Railway Station	Horgen	Switzerland			
11458	Cham Railway Station	Cham	Switzerland			
11459	Rotkreuz Railway Station	Rotkreuz	Switzerland			
11460	Yuanyangguojizhongxin Station	Tianjin	China			
11461	Shunchiqiao Station	Tianjin	China			
11462	Jingjianglu Station	Tianjin	China			
11463	Cuifuxincun Station	Tianjin	China			
11464	Yudongcheng Station	Tianjin	China			
11465	Dengzhoulu Station	Tianjin	China			
11466	Konggangjingjiqu Station	Tianjin	China			
11467	Guoshanlu Station	Tianjin	China			
11468	Sanchong Station	New Taipei	Taiwan			
11469	Xinzhuang Fuduxin Station	New Taipei	Taiwan			
11470	Taishan Station	New Taipei	Taiwan			
11471	Taishan Guihe Station	New Taipei	Taiwan			
11472	National Taiwan Sport University Station	New Taipei	Taiwan			
11473	Linkou Station	New Taipei	Taiwan			
11474	Shanbi Station	Taoyuan City	Taiwan			
11475	Kengkou Taoyuan Metro Station	Taoyuan City	Taiwan			
11476	Ti Tree Airport	Ti Tree	Australia		YTIT	
11477	Sabetta International Airport	Sabetta	Russia	SBT	USDA	
11478	Punalu'u Waterfall	Punalu'u	United States			
11479	Alxa Left Banner Bayanhot Airport	Alxa Left Banner	China	AXF	ZBAL	
11480	Tuan Chau	Halong Bay	Vietnam			
11481	Port Kent	Port Kent	United States	PRK		
11482	Larvik	Larvik	Norway			
11483	Hirtshals	Hirtshals	Denmark			
11484	Frederikshavn	Frederikshavn	Denmark			
11485	Bergen Norled Ferry	Bergen	Norway	BNF		
11486	Balestrand Ferry Terminal	Balestrand	Norway		BFTN	
11487	Hull Rail Station	Hull	United Kingdom		HULR	
11488	Kalmar Rail Station	Kalmar	Sweden		KARS	
11489	El Fuentero Airport	Svenborg	Denmark		SVFT	
11490	DFDS Copenhagen Terminal	Copenhagen	Denmark		DFDS	
11491	Elvesaeter Center	Elvesaeter 	Norway		ELVE	
11492	Bourges Central Station	Bourges	France		BOCS	
11493	Amboise Central	Amboise	France		AMCS	
11494	Mont St. Michel	Mont St. Michel	France		MTSM	
11495	Bayeux Rail Station	Bayeux	France		BACS	
11496	Wanggoolba Airstrip	Fraser Island	Australia			
11497	Prague na knizeci	Prague	Czech Republic		PRBS	
11498	Pscheveny	Pscheveny	Czech Republic		PSFV	
11499	Sturgate Airfield	Eger	Hungary		EGCS	
11500	Plitvice National Park	Plitvice National Park	Croatia		PLNP	
11501	Rab Ferry Terminal	Rab	Croatia		RAFT	
11502	Lake Bled Central	Lake Bled	Slovenia		LBCS	
11503	Simberi Airport	Simberi Island	Papua New Guinea	NIS	AYSE	
11504	Bulolo Airport	Bulolo	Papua New Guinea	BUL	AYBU	
11505	Quito City old UIO	Quito	Ecuador			
11506	Kintore Airport	Kintore	Australia		YKNT	
11507	Freeport Harbor	Freeport	Bahamas			
11508	Statesboro Bulloch County Airport	Statesboro	United States	TBR	KTBR	
11509	Utopia Airport	Utopia	Australia		YUTP	
11510	Greenwood Heliport	Moscow	Russia			
11511	PCB	Port Campbell	Australia			
11512	Meningie	Meningie	Australia			
11513	Blankenfelde-Mahlow Junction	Blankenfelde	Germany			
11514	Birkengrund-Outer Ring Junction	Birkengrund	Germany			
11515	Nyrripi Airport	Nyirripi	Australia		YNRR	
11516	Amata Airport	Amata	Australia	AMT	YAMT	
11517	Cooperstown	Cooperstown	United States	COP		
11518	OSRUI	Oconomowoc	United States	OCO		
11519	Glacier Country Heliport	Franz Josef	New Zealand		NZGH	
11520	Athens Airport Station	Athens	Greece			
11521	Koropi Station	Athens	Greece			
11522	Paiania Kantza Station	Athens	Greece			
11523	Pallini Station	Athens	Greece			
11524	Doukissis Plakentias Station	Athens	Greece			
11525	Chalandri Metro Station	Athens	Greece			
11526	Agia Paraskevi Metro Station	Athens	Greece			
11527	Nomismatokopio Metro Station	Athens	Greece			
11528	Ethniki Amyna Metro Station	Athens	Greece			
11529	Katechaki Metro Station	Athens	Greece			
11530	Panormou Metro Station	Athens	Greece			
11531	Ambelokipi Metro Station	Athens	Greece			
11532	Megaro Moussikis Metro Station	Athens	Greece			
11533	Evangelismos Metro Station	Athens	Greece			
11534	Syntagma Metro Station	Athens	Greece			
11535	Akropoli Metro Station	Athens	Greece			
11536	O'Hare CTA Station	Chicago	United States			
11537	Erldunda Airport	Erldunda	Australia	EDD	YERL	
11538	Helisul I Heliport	Foz do Iguassu	Brazil		SSHH	
11539	North Sea	Piper Bravo	United Kingdom		PIPB	
11540	North Sea	Seafox 7 - Cygnus Bravo	United Kingdom		SFOX	
11541	Harun Thohir Airport	Bawean	Indonesia	BXW		
11542	Finke Airport	Finke	Australia	FIK	YFNE	
11543	Skypier	Hong Kong	Hong Kong		HKIA	
11544	Camocim	Camocim	Brazil	CMC		
11545	Humberto Ghizzo Bortoluzzi Regional Airport	Jaguaruna	Brazil	JJG	SBJA	
11546	Linz Hauptbahnhof	Linz	Austria	LZS		
11547	Miami Seaplane Tours	Key Biscayne	United States			
11548	Chatsworth Station	Chatsworth	United States			
11549	Timisoara Nord Station	Timisoara	Romania			
11550	Uptown Station	Normal	United States	BNL		
11551	Marrakesh Station	Marrakesh	Morocco			
11552	Tanger-Ville Station	Tanger	Morocco			
11553	Udaipur City Station	Udaipur	India			
11554	Jaipur Junction Station	Jaipur	India			
11555	Agra Fort Station	Agra	India			
11556	Hazrat Nizamuddin Station	Delhi	India	NZM		
11557	Xi'an Railway Station	Xi'an	China			
11558	Tanger Port	Tanger	Morocco			
11559	Kamenari Ferry Port	Kamenari	Montenegro			
11560	Lepetane Ferry Port	Lepetane	Montenegro			
11561	Sunnyside Municipal Airport	Sunnyside	United States	1S5		
11562	Nypari Airport	Angatja Homeland	Australia		YNYP	
11563	Alexanderplatz Station	Berlin	Germany			
11564	Ihtiman Airfield	Ihtiman	Bulgaria		LBHT	
11565	Salisbury train station	Salisbury	United Kingdom			
11566	Bath Spa train station	Bath	United Kingdom			
11567	Vogtareuth Airport	Vogtareuth	Germany		EDNV	
11568	Embarcadero	San Francisco	United States	EMB	KEMB	
11569	[Duplicate] Illertissen see EDMI - ED-0425 location moved out-of-the way	Not Specified	New Zealand		XXXX	
11570	XXSNO	Franz Josef Glacier Snowfield	New Zealand			
11571	Off Airport - Snowfield	Franz Josef	New Zealand		XFGL	
11572	Off Airport - Portage Hotel	Kenepuru Sound	New Zealand		XKEN	
11573	Off Airport - Picton SPB	Picton	New Zealand		XPIC	
11574	New Smyrna Beach Municipal Airport	New Smyrna Beach	United States		KEVB	
11575	Olkurruk Mara Airport	Olkurruk Mara	Kenya		6112	
11576	Las Vegas Helicopters Heliport	Las vegas	United States		NV03	
11577	Delta Camp Airport	Delta Camp	Botswana		FBDT	
11578	Hwange (Town) Airport	Hwange	Zimbabwe	WKI	FVWT	
11579	Off Airport - Zambezi	Victoria Falls	Zimbabwe		XVFA	
11580	Harbour (Public) Heliport	Vancouver	Canada		CBC7	
11581	Victoria Harbour (Camel Point) Heliport	Victoria	Canada		CBF7	
11582	Rostock Hauptbahnhof	Rostock	Germany			
11583	Warnemunde Bahnhof	Warnemunde	Germany			
11584	Kulgera Roadhouse	Kulgera	Australia		YKUL	
11585	Milan Central Railway Station	Milan	Italy		MILC	
11586	Venezia Mestre railway station	Venice	Italy		VENM	
11587	Pisa Centrale railway station	Pisa	Italy		PISR	
11588	Salerno railway station	Salerno	Italy		SALR	
11589	Zurich Hauptbahnhof	Zurich	Switzerland		ZURR	
11590	Shushenskoye Airport	Shushenskoye	Russia		UNAU	
11591	Uberruhr Station	Essen	Germany			
11592	Holthausen Station	Essen	Germany			
11593	Kupferdreh Station	Essen	Germany			
11594	Nierenhof Station	Velbert	Germany			
11595	Langenberg	Velbert	Germany			
11596	Neviges Station	Velbert	Germany			
11597	Rosenhugel Station	Velbert	Germany			
11598	Aprath Station	Wulfrath	Germany			
11599	Rovershagen Station	Rovershagen	Germany			
11600	Gelbensande Station	Gelbensande	Germany			
11601	Ribnitz-Damgarten West Station	Ribnitz-Damgarten	Germany			
11602	Ribnitz-Damgarten Ost Station	Ribnitz-Damgarten	Germany			
11603	Martensdorf Station	Martensdorf	Germany			
11604	Grunhufe Station	Stralsund	Germany			
11605	Warnemunde Fahre	Warnemunde	Germany			
11606	Hohe Dune Fahre	Hohe Dune	Germany			
11607	Bramow Station	Rostock	Germany			
11608	Werft Station	Warnemunde	Germany			
11609	Lutten Klein Station	Rostock	Germany			
11610	Parkstrasse Station	Rostock	Germany			
11611	Kassebohm Station	Rostock	Germany			
11612	Oranienburg Station	Oranienburg	Germany			
11613	Lowenberg Station	Lowenberger Land	Germany			
11614	Gransee Station	Gransee	Germany			
11615	Dannenwalde Station	Dannenwalde	Germany			
11616	Furstenberg Station	Furstenberg	Germany			
11617	Neustrelitz Hauptbahnhof	Neustrelitz	Germany			
11618	Kratzeburg Station	Kratzeburg	Germany			
11619	Waren Station	Waren	Germany			
11620	Langhagen Station	Langhagen	Germany			
11621	Lalendorf Station	Lalendorf	Germany			
11622	Gustrow Station	Gustrow	Germany			
11623	Schwaan Station	Schwaan	Germany			
11624	Stockerau Airport	Stockerau	Austria		LOAU	
11625	Karlskrona Central Station	Karlskrona	Sweden			
11626	Schwedt Station	Schwedt	Poland			
11627	Klaipėda Airport	Klaipeda	Lithuania	KLJ	EYKL	
11628	St. Mary's Railway station	St. mary's	Canada			
11629	Jalal-Abad Airport	Jalal-Abad	Kyrgyzstan	ДЖБ	UCFJ	
11630	Iowa County Airport	MINERAL POINT	United States		KMRJ	
11631	Middleton Municipal Airport - Morey Field	Middleton	United States	C29		
11632	West Bend Municipal Airport	WEST BEND	United States	ETB	KETB	
11633	Gaylord Regional Airport	GAYLORD	United States	GLR	KGLR	
11634	Richard B Helgeson Airport	Two Harbors	United States	TWM		
11635	Anderson Municipal Darlington Field	ANDERSON	United States	AID	KAID	
11636	Cenej Airport	Novi Sad	Serbia	QND	LYNS	
11637	Grundarfjörður Airport	Grundarfjordur	Iceland	GUU	BIGF	
11638	Prairie Du Chien Municipal Airport	Prairie du Chien	United States	PCD	KPDC	
11639	Caoqiao Station	Beijing	China			
11640	City Link Transit Center	Peoria	United States			
11641	Las Vegas Station	Las Vegas	United States			
11642	Lamy Station	Lamy	United States			
11643	Gallup Station	Gallup	United States			
11644	Winslow Station	Winslow	United States			
11645	Flagstaff Station	Flagstaff	United States			
11646	Williams Junction Station	Williams Junction	United States			
11647	Kingman Station	Kingman	United States			
11648	Needles Station	Needles	United States			
11649	Barstow Harvey House	Barstow	United States			
11650	Victor Valley Transportation Center	Victorville	United States			
11651	San Bernardino Santa Fe Depot	San Bernardino	United States			
11652	Joseph Tavaglione Riverside Downtown Station	Riverside	United States			
11653	Fullerton Transportation Center	Fullerton	United States			
11654	Natuashish Airport	Natuashish	Canada			
11655	Cascade Heliport	Kobok	Indonesia		WA98	
11656	Air Orlando Heliport	Orlando	United States		2FD7	
11657	PUCHW	Ballonstartplatz Puch bei Weiz	Austria			
11658	NEUHS	Neuhaus	Austria			
11659	PUCHW	Ballonstartplatz Puch bei Weiz	Austria			
11660	NEUHS	Neuhaus Kulm bei Weiz	Austria			
11661	VOESD	Hotel Boeck Voesendorf	Austria			
11662	WEIBG	Weiden am See Blaue Gans	Austria			
11663	Karolino	Grodno	Belarus		UMNG	
11664	Tórshavn/Bodanes Heliport	Torshavn	Faroe Islands		EKTB	
11665	Furth Hauptbahnhof	Furth	Germany			
11666	Erlangen Station	Erlangen	Germany			
11667	Forchheim Station	Forchheim	Germany			
11668	Hirschaid Station	Hirschaid	Germany			
11669	Santa Ana Regional Transportation Center	Santa Ana	United States			
11670	Otjiwarongo Airport	Otjiwarongo	Namibia	OTJ	FYOW	
11671	Palmwag Airport	Palmwag	Namibia		FYPW	
11672	RAF Mona	Mona	United Kingdom		EGOQ	
11673	San Juan Capistrano Depot	San Juan Capistrano	United States			
11674	San Clemente Pier	San Clemente	United States			
11675	Oceanside Transit Center	Oceanside	United States			
11676	Solana Beach Transit Center	Solana Beach	United States			
11677	Taylor Municipal Airport	Taylor	United States	T74		
11678	Rerik-Zweedorf Airport	Rerik	Germany		EDCR	
11679	Fazenda Vaticano Airport	Cruz	Brazil		SSVV	
11680	Moriarty Airport	Moriarty	United States	0E0		
11681	Stanly County Airport	Albemarle	United States		KVUJ	
11682	Davidson County Airport	Lexington	United States		KEXX	
11683	Grant County Airport	Petersburg	United States	W99		
11684	Windwood Fly-In Resort Airport	Davis	United States		WV62	
11685	Lathan Strip	Mocksville	United States		5NC2	
11686	Twin Lakes Airport	Mocksville	United States	8A7		
11687	Sandia Airpark Estates East Airport	Edgewood	United States	1N1		
11688	Double Eagle II Airport	Albuquerque	United States		KAEG	
11689	Socorro Municipal Airport	Socorro	United States		KONM	
11690	Mid valley Airpark	Los Lunas	United States	E98		
11691	Alexander Municipal Airport	Belen	United States	E80		
11692	Gastons Airport	Lakeview	United States	3M0		
11693	Bentonville Municipal-Louise M Thaden Field	Bentonville	United States		KVBT	
11694	Holbrook Municipal Airport	Holbrook	United States	P14		
11695	Blue Ridge Airport	Martinsville	United States		KMTV	
11696	Mount Airy Surry County Airport	Mount Airy	United States		KMWK	
11697	Taos Regional Airport	Taos	United States	TSM	KSKX	
11698	Sun Valley Airport	Bullhead City	United States	A20		
11699	Avi Suquilla Airport	Parker	United States	P20		
11700	Raton Municipal-Crews Field	Raton	United States	RTN	KRTN	
11701	Fort Collins Downtown Airport	Fort Collins	United States	3V5		
11702	Rusk County Airport	Ladysmith	United States		KRCX	
11703	Prickett-Grooms Field Airport	Sidnaw	United States	6Y9		
11704	Syracuse-Hamilton County Municipal Airport	Syracuse	United States	3K3		
11705	Hatch Municipal Airport	Hatch	United States	E05		
11706	Shiprock Airstrip	Shiprock	United States	5V5		
11707	Aztec Municipal Airport	Aztec	United States	N19		
11708	Navajo Lake Airport	Navajo Dam	United States	1V0		
11709	Jicarilla Apache Nation Airport	Dulce	United States	24N		
11710	Lindrith Airpark	Lindrith	United States	E32		
11711	KSXU	Santa Rosa	United States	SXU	KSXU	
11712	Perry Lefors Field	Pampa	United States	PPA	KPPA	
11713	William R. Pogue Municipal Airport	Sand Springs	United States		KOWP	
11714	Marion County Regional Airport	Flippin	United States	FLP	KFLP	
11715	Allen County Airport	Iola	United States	K88		
11716	Hutchinson County Airport	Borger	United States	BGD	KBGD	
11717	Magdalena Airport	Magdalena	United States	N29		
11718	Carrizozo Municipal Airport	Carrizozo	United States	F37		
11719	Ohkay Owingeh Airport	Espanola	United States	E14		
11720	Questa Municipal Airport Nr 2	Questa	United States	N24		
11721	Springer Municipal Airport	Springer	United States	S42		
11722	Mountainair Municipal Airport	Mountainair	United States	M10		
11723	Estancia Municipal Airport	Estancia	United States	E92		
11724	Conchas Lake Airport	Conchas Dam	United States	E89		
11725	Eagle Airpark	Bullhead City	United States	A09		
11726	Vancouver Holiday Inn Downtown	Vancouver	Canada			
11727	Bridgeport Station	Richmond	Canada			
11728	Campbell River Store	Surrey	Canada			
11729	Swartz Bay Ferry Terminal	Sidney	Canada			
11730	Fulford Harbour	Salt Spring Island	Canada			
11731	Jack Barstow Municipal Airport	Midland	United States	IKW	KIKW	
11732	 American and Normandale Stn	Edina	United States			
11733	Benton and Normandale Stn	Edina	United States			
11734	Budaörs Airfield	Budaoers	Hungary		LHBS	
11735	Jakabszállás Airport	Jakabszallas	Hungary		LHJK	
11736	Mahe - Inter Island Quay	Victoria	Seychelles		MIIQ	
11737	McNeil	McNeil River Camp	United States			
11738	St. Helena Airport	Longwood	United Kingdom	HLE	FHSH	
11739	Homer-Beluga Lake Seaplane Base	Homer	United States	5BL		
11740	North Sea	Glen Lyon FPSO	United Kingdom		GLEN	
11741	Bonn-Hangelar Airport	Sankt-Augustin	Germany	BNJ	EDKB	
11742	Chernyakhovsk	Kaliningrad	Russia		XMWH	
11743	Engel's-2	Engel's	Russia		XWSG	
11744	Nagurskaya	Nagurskaya	Russia		XLDH	
11745	Napoli Centrale Railway Station	Naples	Italy		NAPR	
11746	Nogliki Airport	Nogliki	Russia	NGK	UHSN	
11747	Santa Ynez Airport	Santa Ynez	United States	SQA	KIZA	
11748	Valdau	Kaliningrad	Russia		UMKV	
11749	Ibo Island	Ibo Island	Mozambique	IBO		
11750	Delingha Airport	Haixi	China	HXD	ZLDL	
11751	Qionghai Bo'ao Airport	Qionghai	China	BAR	ZJQH	
11752	Vilamendhu	Vilamendhu	Maldives			
11753	Vilamendhu	Vialamendhu	Maldives			
11754	LUX	LUX South Ari Atoll	Maldives			
11755	Huvahendhoo	Lilly Beach Huvahendhoo	Maldives			
11756	Vilamendhu	Vilamendhu Island	Maldives			
11757	Northeim Airport	Northeim	Germany		EDVN	
11758	Danforth GO Station	Toronto	Canada			
11759	Newark Station - Delaware	Newark	United States	NWK		
11760	Worgl Hbf	Worgl	Austria		PRIV	
11761	Old City Harbour	Tallinn	Estonia			
11762	Port of St. Petersburg	St. Petersburg	Russia			
11763	Roedbyhavn	Roedbyhavn	Denmark			
11764	Belfast Central	Belfast	United Kingdom			
11765	Beamsville GO Bus Stop	Beamsville	Canada			
11766	Niagara College GO Bus Stop	Niagara-on-the-Lake	Canada			
11767	Reggio Emilia Airport	Reggio Emilia	Italy		LIDE	
11768	Bowen Airport	Bowen	Australia	ZBO	YBWN	
11769	Ulanqab Jining Airport	Wulanchabu	China	UCB	ZBUC	
11770	Odienne Airport	Odienne	Cote d'Ivoire	KEO	DIOD	
11771	Sweet	Darwin	Australia			
11772	Siguiri Airport	Siguiri	Guinea	GII	GUSI	
11773	Nzérékoré Airport	Nzerekore	Guinea	NZE	GUNZ	
11774	Diomede Heliport	Diomede	United States	DIO		
11775	Marinda Raja Ampat Airport	Waisai	Indonesia	RJM		
11776	Moscow Passazhirskaya railway station	Moscow	Russia		MORP	
11777	Moskovsky railway station	Saint Petersburg	Russia		SPBM	
11778	Tobolsk	Tobolsk	Russia			
11779	West Kowloon Station	Hong Kong	Hong Kong			
11780	Niagara Falls Station and Customhouse Interpretive Center	Niagara Falls	United States			
11781	North Railway Station	Xian	China			
11782	Landquart Railway Station	Landquart	Switzerland			
11783	Thudufushi Island	Thudufushi Island	Maldives			
11784	Noida City Centre Metro Station	Noida	India			
11785	Boolgeeda	Brockman	Australia	OCM	YBGD	
11786	Helipad - L'union estate	La Digue	Seychelles			
11787	Shaoyang Wugang Airport	Shaoyang	China	WGN	ZGSY	
11788	9 de Maio - Teixeira de Freitas Airport	Teixeira de Freitas	Brazil	TXF	SNTF	
11789	Amanwana seaplane base	Moyo Island	Indonesia			
11790	Austin - Robert Mueller Airport	Austin	United States			
11791	Spartanburg Downtown Memorial Airport	Spartangurg	United States	SPA	KSPA	
11792	Ta'u Airport	Ta'u	American Samoa	TAV		
11793	Tampa Bus Station	Tampa	United States			
11794	St. Petersburg Bus Station	St. Petersburg	United States			
11795	Cattleman Transfer Center	Sarasota	United States			
11796	Port Charlotte Greyhound Stop	Port Charlotte	United States			
11797	Fort Myers Bus Station	Fort Myers	United States			
11798	Naples Bus Stop	Naples	United States			
11799	Fort Lauderdale Bus Station	Fort Lauderdale	United States			
11800	Port of Bonaire	Kralendijk	Netherlands Antilles		BONA	
11801	Bajawa Soa Airport	Bajawa	Indonesia	BJW	WATB	
11802	Lux South Ari Atoll Dhidhdhoofinolhu Island Aiport	Dhidhdhoofinolhu	Maldives			
11803	Hammond Railway Station	Hammond	United States			
11804	New Orleans Union Passenger Terminal	New Orleans	United States			
11805	Uppsala Central Station	Uppsala	Sweden			
11806	Torgau-Beilrode Airport	Gransee	Germany		EDOG	
11807	Annobón Airport	San Antonio de Pale	Equatorial Guinea	NBN	FGAB	
11808	Huangshan Railway Station	Huangshan	China		HSRO	
11809	Shanghai Railway Station	Shanghai	China		SHAR	
11810	Guma Airstrip	Guma Lodge	Botswana			
11811	Mopiri camp	Mopiri Camp	Botswana			
11812	Fox Glacier Overlook	Fox Glacier	New Zealand			
11813	Glacier Country Heliport	Franz Josef	New Zealand			
11814	Hefei South railway station	Hefei	China		HFRS	
11815	Renk Airport	Huangshan	China		HSRN	
11816	Beijing Railway Station	Beijing	China		BJRO	
11817	Hefei Railway Station	Hefei	China		HFRO	
11818	Oyo Ollombo Airport	Oyo	Congo (Brazzaville)	OLL	FCOD	
11819	Tel-Aviv Savidor Center	Tel-Aviv	Israel			
11820	Tel-Aviv HaShalom	Tel-Aviv	Israel			
11821	Port Hardy Seaplane Base	Port Hardy	Canada		CAW5	
11822	Great Bear Lodge	Smith Inlet	Canada			
11823	Tri-City Airport	Parsons	United States	PPF	KPPF	
11824	Boun Neau Airport	Phongsaly	Laos	PCQ	VLFL	
11825	Waycross Ware County Airport	Waycross	United States	AYS	KAYS	
11826	Blaise Diagne International Airport	Diass	Senegal	DSS	GOBD	
11827	Mid-State Regional Airport	Philipsburg	United States		KPSB	
11828	Bader Field	Atlantic City	United States	AIY	KAIY	
11829	Greater Portsmouth Regional Airport	Portsmouth	United States	PMH	KPMH	
11830	Pula Seaplane base	Pula	Croatia		LDPP	
11831	Split-Resnik Airport	Split	Croatia		LDSR	
11832	Kidal	Kidal	Mali			
11833	Warsaw Chopin Airport Railway Station	Warsaw	Poland			
11834	Warszawa Sluzewiec Railway Station	Warszawa	Poland			
11835	Warszawa Zachodnia Station	Warszawa	Poland			
11836	Warszawa Centralna Railway Station	Warszawa	Poland	RWA		
11837	Stazione di Bologna San Ruffillo	Bologna	Italy			
11838	Stazione di Firenze Castello	Florence	Italy			
11839	Firenze Rifredi Railway Station	Florence	Italy			
11840	Milan Junction North Ring	Milan	Italy			
11841	Malpensa Aeroporto Terminal 2 Railway Station	Malpensa	Italy			
11842	SEGRATE Aeroporto Linate	Milan	Italy			
11843	Upper cumberland 	Sparta	United States	SRB		
11844	Warszawa Zwirki i Wigury Railway Station	Warsaw	Poland			
11845	Warszawa Rakowiec Railway Station	Warsaw	Poland			
11846	Warszawa Aleje Jerozolimskie Railway Station	Warsaw	Poland			
11847	Warszawa Ochota Train Station	Warsaw	Poland			
11848	Jefferson Park Transit Center	Chicago	United States			
11849	Kuredu Island	Kuredu Island	Maldives			
11850	Wollankstrasse Station	Berlin	Germany			
11851	Berlin-Wittenau Station	Berlin	Germany			
11852	Birkenwerder Station	Birkenwerder	Germany			
11853	Berlin-Frohnau Station	Berlin	Germany			
11854	Hannover-Nordstadt Station	Hannover	Germany			
11855	Hannover Flughafen Railway Station	Hannover	Germany			
11856	Langenhagen-Pferdemarkt Station	Langenhagen	Germany			
11857	Hannover-Ledeburg Station	Hannover	Germany			
11858	Salzwedel Railway Station	Salzwedel	Germany			
11859	Uelzen Railway Station	Uelzen	Germany			
11860	Celle Railway Station	Celle	Germany			
11861	Langenhagen-Mitte Station	Langenhagen	Germany			
11862	Kavac	Kavac	Venezuela			
11863	Oebisfelde Railway Station	Oebisfelde	Germany			
11864	Coonawarra Airport	Coonawarra	Australia		YCNQ	
11865	Naracoorte Airport	Naracoorte	Australia	NAC	YNRC	
11866	Aerodrom Luncani	Luncani	Romania			
11867	Camilla Mitchell County Airport	Camilla	United States		KCXU	
11868	Eschede Railway Station	Eschede	Germany			
11869	Clarenville Airport	Clarenville	Canada		CCZ3	
11870	Trebbin Railway Station	Trebbin	Germany			
11871	Ludwigsfelde Railway Station	Ludwigsfelde	Germany			
11872	Luckenwalde Railway Station	Luckenwalde	Germany			
11873	Ponta Grossa Airport - Comandante Antonio Amilton Beraldo	Ponta Grossa	Brazil	PGZ	SSZW	
11874	Berlin-Friedrichsfelde Ost Station	Berlin	Germany			
11875	Strausberg Lustgarten	Strausberg	Germany			
11876	Rudersdorf Rathaus	Rudersdorf	Germany			
11877	Woltersdorf Rathaus	Woltersdorf	Georgia			
11878	Livorno - Florence-Pisa Cruise Port	Livorno	Italy			
11879	Civitavecchia Port of Rome	Civitavecchia	Italy			
11880	Palma de Mallorca Cruise Terminal	Palma de Mallorca	Spain			
11881	Coswig Anhalt Railway Station	Coswig Anhalt	Germany			
11882	Don Sheldon Amphitheater	Talkeetna	United States			
11883	Gjakova Air Force Base	Gjakova	Serbia		LYDK	
11884	Wismar Station	Wismar	Germany			
11885	Portland Transportation Center	Portland	United States			
11886	Sun Island Resort and SPA	Sount Ari Atoll	Maldives			
11887	Western Avenue Station	Chicago	United States			
11888	Mayfair Station	Chicago	United States			
11889	Gladstone Park Station	Chicago	United States			
11890	Soutch China Sea	AMPA6	Brunei		AMPA	
11891	Istres Le Tube	Istres	France	QIE		
11892	Palenque International Airport	Palenque	Mexico	PQM	MMPQ	
11893	Caloundra Airport	Caloundra	Australia	CUD	YCDR	
11894	Clarks Point Airport	Clarks Point	United States	CLP	PFCL	
11895	Waterfall Seaplane Base	Waterfall	United States	KWF		
11896	Orange Walk Airport	Orange Walk Town	Belize	ORZ		
11897	Ospika Airport	Williston Lake	Canada		CBA9	
11898	Mayne Island Water Aerodrome	Miners Bay	Canada		CAW7	
11899	Charlottetown Airport	Charlottetown	Canada		CCH4	
11900	Doris Lake	Doris Lake	Canada	JOJ	CDL7	
11901	Bor	Bor	South Sudan			
11902	Costa Esmeralda Airport	Tola	Nicaragua	ECI	MNCE	
11903	Cueva Las Maravillas Airport	San Pedro de Macoris	Dominican Republic		MDSP	
11904	Monte Cristi Airport	Montecristi	Dominican Republic		MDMC	
11905	El Papalon Airport	San Miguel	El Salvador		MSSM	
11906	Carti Airport	Carti Islands	Panama	CTE		
11907	San Jose Airport	San Jose	Panama			
11908	Pedasi Airport	Pedasi	Panama	PDM		
11909	San Miguel Airport	San Miguel	Panama	NMG		
11910	Suderburg Railway Station	Suderburg	Germany			
11911	Unterluss Railway Station	Unterluss	Germany			
11912	Sandpoint Airport	Sandpoint	United States		KSZT	
11913	Attu Heliport	Attu	Greenland	QGQ	BGAT	
11914	Kangaatsiaq Heliport	Kangaatsiaq	Greenland	QPW	BGKA	
11915	Kitsissuarsuit Heliport	Kitsissuarsuit	Greenland	QJE	BGKT	
11916	Niaqornaarsuk Heliport	Niaqornaarsuk	Greenland		BGNK	
11917	Ilimanaq Heliport	Ilimanaq	Greenland	XIQ	BGIL	
11918	Qeqertaq Heliport	Qeqertaq	Greenland	QQT	BGQE	
11919	Saqqaq Heliport	Saqqaq	Greenland		BGSQ	
11920	Moriusaq Heliport	Moriusaq	Greenland		BGMO	
11921	Savissivik Heliport	Savissivik	Greenland		BGSV	
11922	Siorapaluk Heliport	Siorapaluk	Greenland		BGSI	
11923	Aappilattoq (Qaasuitsup) Heliport	Aappilattoq	Greenland		BGAG	
11924	Innarsuit Heliport	Innaarsuit	Greenland		BGIN	
11925	Kangersuatsiaq Heliport	Kangersuatsiaq	Greenland		BGKS	
11926	Kullorsuaq Heliport	Kullorsuaq	Greenland		BGKQ	
11927	Nuussuaq Heliport	Nuussuaq	Greenland		BGNU	
11928	Tasiusaq (Qaasuitsup) Heliport	Tasiusaq	Greenland		BGTA	
11929	Upernavik Kujalleq Heliport	Upernavik Kujalleq	Greenland		BGKL	
11930	Aappilattoq (Kujalleq) Heliport	Aappilattoq	Greenland		BGAQ	
11931	Tasiusaq (Kujalleq) Heliport	Tasiusaq	Greenland		BGTQ	
11932	Narsaq Kujalleq Heliport	Narsaq Kujalleq	Greenland		BGFD	
11933	Ikamiut Heliport	Ikamiut	Greenland	QJI	BGIT	
11934	Suzhou Railway Station	Suzhou	China		SUZR	
11935	Ammassivik Heliport	Ammassivik	Greenland		BGAS	
11936	Eqalugaarsuit Heliport	Eqalugaarsuit	Greenland	QFG	BGET	
11937	Qassimiut Heliport	Qassimiut	Greenland		BGQT	
11938	Tiniteqilaaq Heliport	Tiniteqilaaq	Greenland		BGTN	
11939	Isortoq Heliport	Isortoq	Greenland		BGIS	
11940	Kuummiut Heliport	Kuummiit	Greenland		BGKM	
11941	Sermiligaaq Heliport	Sermiligaaq	Greenland		BGSG	
11942	Ikerassaarsuk Heliport	Ikerasaarsuk	Greenland	QRY	BGIK	
11943	Illorsuit Heliport	Illorsuit	Greenland		BGLL	
11944	Nuugaatsiaq Heliport	Nuugaatsiaq	Greenland		BGNQ	
11945	Saattut Heliport	Saattut	Greenland		BGST	
11946	Ikerasak Heliport	Ikerasak	Greenland		BGIA	
11947	Niaqornat Heliport	Niaqornat	Greenland		BGNT	
11948	Ukkusissat Heliport	Ukkusissat	Greenland		BGUT	
11949	Moscow-Passazhirskaya Railway Station	Moscow	Russia		MOLR	
11950	Sheffield Station	Sheffield	United Kingdom			
11951	Derby Station	Derby	United Kingdom			
11952	Matlock Station	Matlock	United Kingdom			
11953	Bourg-Saint-Maurice	Bourg-saint-maurice	France			
11954	Gare de Sable Sur Sarthe	Sable sur Sarthe	France			
11955	Olhos D`água Airport	Agua Boa	Brazil		SWHP	
11956	Novo Progresso Airport	Novo Progresso	Brazil	NPR	SJNP	
11957	Adolino Bedin Regional Airport	Sorriso	Brazil	SMT	SBSO	
11958	Serra da Capivara Airport	Sao Raimundo Nonato	Brazil		SWKQ	
11959	Encarnación Airport	Encarnacion	Paraguay	ENO	SGEN	
11960	Amatopo Airstrip	Amatopo	Suriname		SMAM	
11961	Poeketi Airstrip	Poeketi	Suriname		SMPE	
11962	Godo Holo Airstrip	Pikienkondre of Miranda	Suriname		SMGH	
11963	Anholt Airport	Anholt	Denmark		EKAT	
11964	Natakhtari Airfield	Natakhtari	Georgia		UGSA	
11965	Ambrolauri Airport	Ambrolauri	Georgia		UGAM	
11966	Hicks Airfield	Fort Worth	United States	T67		
11967	Karuizawa Train Station	Karuizawa	Japan			
11968	Connolly Station	Dublin	Ireland			
11969	St Pierre d'Oléron Airfield	Saint Pierre d'Oleron	France		LFDP	
11970	Semur En Auxois Airfield	Semur en Auxois	France		LFGQ	
11971	North Leominster Station	Leominster	United States			
11972	Madikwe West	Madikwe	South Africa		MBHW	
11973	Urzhar Airport	Urzhar	Kazakhstan	UZR	UASU	
11974	Pyramiden Heliport	Pyramiden	Norway		ENPY	
11975	Basel SBB Bahnhof	Basel	Switzerland	ZDH		
11976	Agok	Agok	Sudan			
11977	Patong Beach	Phuket	Thailand			
11978	Ko Similan	Andaman Sea	Thailand			
11979	Lipki Air Base	Minsk	Belarus		UMMI	
11980	Zermatt  Heliport	Zermatt	Switzerland		LSEZ	
11981	Nikolskoye Airport	Nikolskoye	Russia		UHPX	
11982	Tilichiki Airport	Tilichiki	Russia		UHPT	
11983	Nyurba Airport	Nyurba	Russia	NYR	UENN	
11984	Sakkyryr Airport	Batagay-Alyta	Russia	SUK	UEBS	
11985	Ust-Kuyga Airport	Ust-Kuyga	Russia	UKG	UEBT	
11986	Verkhnevilyuisk Airport	Verkhnevilyuysk	Russia	VHV	UENI	
11987	Mendeleyevo Airport	Yuzhno-Kurilsk	Russia	DEE	UHSM	
11988	Yamburg Airport	Yamburg	Russia		USMQ	
11989	Shakhtyorsk Airport	Shakhtyorsk	Russia	EKS	UHSK	
11990	Talakan Airport	Talakan	Russia	TLK	UECT	
11991	Mama Airport	Mama	Russia		UIKM	
11992	Copenhagen Sea Airport	Copenhagen	Denmark		EKCC	
11993	Aarhus Seaplne Terminal	Aarhus	Denmark		EKAC	
11994	Oakland Troy Airport	Troy	United States		KVLL	
11995	Stratford Municipal Airport	Stratford	Canada		CYSA	
11996	Edmundston Airport	Edmundston	Canada		CYES	
11997	Red Dog Airport	Red Dog	United States	RDB	PADG	
11998	Porter Station	Cambridge	United States			
11999	Koge Railway Station	Koge	Denmark			
12000	Trelleborg Harbour	Trelleborg	Sweden			
12001	Ystad Railway Station	Ystad	Sweden			
12002	Selinda Airstrip	Selinda Camp	Botswana			
12003	At Tarif	At Tarif	Egypt			
12004	At Tod	At Tod	Egypt			
12005	Impfondo Airport	Impfondo	Congo (Brazzaville)	ION	FCOI	
12006	El Bayadh Airport	El Bayadh	Algeria	EBH	DAOY	
12007	Kolcovo	Ekaterinburg	Russia			
12008	Lake Baringo Airport	Lake Baringo	Kenya	LBN		
12009	Alzintan Airport	Zintan	Libya	ZIS	HLZN	
12010	Monkey Bay Airport	Monkey Bay	Malawi	MYZ	FWMY	
12011	Suwałki Airport	Suwalki	Poland		EPSU	
12012	Srr Ahmadu Bello International Airport	Birnin Kebbi	Nigeria		DNBK	
12013	Sir Abubakar Tafawa Balewa International Airport	Bauchi	Nigeria	BCU	DNBC	
12014	Gombe Lawanti International Airport	Gombe	Nigeria	GMO	DNGO	
12015	Dutse International Airport	Dutse	Nigeria		DNDS	
12016	Jalingo Airport	Jalingo	Nigeria		DNJA	
12017	Adado Airport	Adado	Somalia	AAD		
12018	Kolda North Airport	Kolda	Senegal	KDA	GODK	
12019	Guriel Airport	Guriel	Somalia	GUO		
12020	Ed Daein Airport	Ed Daein	Sudan	ADV		
12021	King Mswati III International Airport	Manzini	Swaziland	SHO	FDSK	
12022	Rubondo Airstrip	Rubondo Island	Tanzania			
12023	Kilwa Masoko Airport	Kilwa Masoko	Tanzania	KIY	HTKI	
12024	West Kilimanjaro Airport	Kilimanjaro	Tanzania		HTWK	
12025	Moshi Airport	Moshi	Tanzania	QSI	HTMS	
12026	Mansa Airport	Mansa	Zambia	MNS	FLMA	
12027	Ghazni Airport	Ghazni	Afghanistan	GZI	OAGN	
12028	Baicheng Chang'an Airport	Baicheng	China	DBC	ZYBA	
12029	Longnan Chengzhou Airport	Longnan	China	LNL	ZLLN	
12030	Shangrao Sanqingshan Airport	Shangrao	China	SQD	ZSSR	
12031	Songyuan Chaganhu Airport	Songyuan	China	YSQ	ZYSQ	
12032	Jiansanjiang Airport	Jiansanjiang	China	JSJ	ZYJS	
12033	Shihezi Huayuan Airport	Shihezi	China	SHF	ZWHZ	
12034	Zunyi Maotai Airport	Zunyi	China	WMT	ZUMT	
12035	Libo Airport	Libo	China	LLB	ZULB	
12036	Chengde Puning Airport	Chengde	China	CDE	ZBCD	
12037	Wudalianchi Dedu Airport	Wudalianchi	China	DTU	ZYDU	
12038	Ejin Banner-Taolai Airport	Ejin Banner	China	EJN	ZBEN	
12039	Alxa Right Banner Badanjilin Airport	Alxa Right Banner	China	RHT	ZBAR	
12040	Holingol Huolinhe Airport	Holingol	China	HUO	ZBHZ	
12041	Golog Maqin Airport	Golog	China	GMQ	ZLGL	
12042	INS Baaz	Campbell Bay	India			
12043	Yeerqiang Airport	Yarkant	China	QSZ	ZWSC	
12044	Jagdalpur Airport	Jagdalpur	India	JGB		
12045	Tezu Airport	Tezu	India	TEI	VETJ	
12046	Cangyuan Washan Airport	Cangyuan	China	CWJ	ZPCW	
12047	Lancang Jingmai Airport	Lancang Lahu	China	JMJ	ZPJM	
12048	Ninglang Luguhu Airport	Ninglang	China	NLH	ZPNL	
12049	Pimenta Bueno Airport	Pimenta Bueno	Brazil	PBQ	SWPM	
12050	Ariquemes Airport	ARIQUEMES	Brazil		SJOG	
12051	Fazenda Spartacus Airport	COLNIZA	Brazil		SIXZ	
12052	Xinzhou Wutaishan Airport	Xinzhou	China	WUT	ZBXZ	
12053	Ambikapur Airport	Ambikapur	India			
12054	Chengjisihan Airport	Zhalantun	China	NZL	ZBZL	
12055	Fazenda Mequens Airport	ALTA FLORESTA D'OESTE	Brazil		SJTF	
12056	Prainha Airport	APUI	Brazil		SWYN	
12057	Mostardas Airport	SANTO ANTONIO DO MATUPI	Brazil		SSMT	
12058	Santo Domingo Airport	CONSELVAN	Brazil		SCSN	
12059	Bathinda Airport	Bathinda	India		VBAT	
12060	Adampur Airport	Adampur	India	AIP	VIAX	
12061	Mundra Airport	Mundra	India		VAMA	
12062	MLN	MLN	Algeria			
12063	Lechang East Railway Station	Lechang	China			
12064	Qinhuangdao Railway Station	Qinhuangdao	China			
12065	Shenyang North Railway Station	Shenyang	China			
12066	Detroit Metro. Airport North Transit Center	Detroit	United States			
12067	Vumbura Airstrip	Vumbura	Botswana			
12068	AEROPORTO DE CEREJEIRAS	CEREJEIRAS 	Brazil		SFCR	
12069	Vijayanagar Aerodrome (JSW)	Toranagallu	India	VDY	VOJV	
12070	Jalgaon Airport	Jalgaon	India	JLG	VAJL	
12071	Shirdi Airport	Shirdi	India	SAG	VASD	
12072	Jeypore Airport	Jeypore	India	PYB	VEJP	
12073	Savitri Jindal Airport	Angul	India		VEAL	
12074	Pakyong Airport	Gangtok	India		VEPY	
12075	Neyveli Airport	Neyveli	India	NVY	VONY	
12076	Atung Bungsu Airport	Pagar Alam	Indonesia	PXA		
12077	Kertajati International Airport	Majalengka	Indonesia	KJT	WICA	
12078	Trunojoyo Airport	Sumenep	Indonesia	SUP	WART	
12079	Lasondre Airport	Batu Islands	Indonesia		WIMO	
12080	Syekh Hamzah Fansyuri Airport	Singkil	Indonesia			
12081	Letung Airport	Jamaja Island	Indonesia	LMU	WIDL	
12082	Takengon Rembele Airport	Takengon	Indonesia	TXE	WITK	
12083	Rokot Airport	Sipora	Indonesia	RKO	WIBR	
12084	Pusako Anak Nagari Airport	Simpang Ampek	Indonesia			
12085	Silampari Airport	Lubuklinggau	Indonesia		WIPB	
12086	Alas Leuser Airport	Kutacane	Indonesia		WILD	
12087	Pasir Pangaraan Airport	Pasir Pangaraian	Indonesia	PPR	WIDE	
12088	Sei Bati Airport	Tanjung Balai Karimun	Indonesia	TJB	WIBT	
12089	Tempuling Airport	Tembilahan	Indonesia			
12090	Departi Parbo Airport	Kerinci Regency	Indonesia	KRC	WIPH	
12091	Miangas Airport	Miangas	Indonesia	MKF		
12092	Buli Airport	Buli	Indonesia	WUB	WAME	
12093	Namrole Airport	Buru Island	Indonesia	NRE	WAPG	
12094	Gewayantana Airport	Larantuka	Indonesia	LKA	WATL	
12095	David Constantijn Saudale Airport	Rote Ndao Regency	Indonesia	RTI	WATR	
12096	Namlea Airport	Namlea	Indonesia	NAM	WAPR	
12097	Jos Orno Imsula Airport	Tiakur	Indonesia	JIO		
12098	Rar Gwamar Airport	Dobo	Indonesia	DOB	WAPD	
12099	Gamar Malamo Airport	Galela	Indonesia	GLX	WAEG	
12100	Oesman Sadik Airport	Labuha	Indonesia	LAH	WAEL	
12101	Emalamo Sanana Airport	Sanana	Indonesia	SQN	WAPN	
12102	Ayawasi Airport	Ayawasi	Indonesia	AYW	WASA	
12103	Bunyu Airport	Bunyu	Indonesia	BYQ	WALV	
12104	Buol Airport	Buol	Indonesia	UOL	WAMY	
12105	Bua Airport	Palopo	Indonesia	LLO	WAFD	
12106	Sugimanuru Airport	Raha	Indonesia	RAQ	WAWR	
12107	Matahora Airport	Wangi-wangi	Indonesia	WNI	WAWD	
12108	Jask Airport	Jask	Iran	JSK	OIZJ	
12109	Frankfort Dow Memorial Field	Frankfort	United States		KFKS	
12110	Cheboygan County Airport	Cheboygan	United States		KSLH	
12111	Kozushima Airport	Kozushima	Japan		RJAZ	
12112	Creve Coeur Airport	Creve Coeur	United States	1H0		
12113	Logan	Boston	United States			
12114	Dyce Railway Station	Dyce	United Kingdom			
12115	Dundee Railway Station	Dundee	United Kingdom	ZDU		
12116	Keith Railway Station	Keith	United Kingdom			
12117	Elgin Railway Station	Elgin	United Kingdom			
12118	Perth Railway Station	Perth	United Kingdom			
12119	Kazarman Airport	Kazarman	Kyrgyzstan		UAFZ	
12120	Kerben Airport	Kerben	Kyrgyzstan		UAFE	
12121	Aviemore Railway Station	Aviemore	United Kingdom			
12122	Naryn Airport	Naryn	Kyrgyzstan		UAFN	
12123	Karakol International Airport	Karakol	Kyrgyzstan	КПЖ	UCFP	
12124	Sayaboury Airport	Sainyabuli	Laos	ZBY	VLSB	
12125	Gahcho Kue Mine	Gahcho Kue	Canada	GHK		
12126	Victor Mine	Victor Mine	Canada	CMV		
12127	Ovoot Airport	Ovoot Tolgoi	Mongolia		ZMGT	
12128	Khanbumbat Airport	Khanbogd	Mongolia		ZMKB	
12129	Tavan Tolgoi Airport	Tsogttsetsii	Mongolia		ZMTT	
12130	Baglung Airport	Baglung	Nepal	BGL	VNBL	
12131	Rajbiraj Airport	Rajbiraj	Nepal	RJB	VNRB	
12132	Rukum Salle Airport	Musikot Khalanga	Nepal		VNSL	
12133	Duqm International Airport	Duqm	Oman	DQM	OODQ	
12134	Mukhaizna Airport	Mukhaizna	Oman	UKH	OOMK	
12135	Bay	Misty Fjords	United States			
12136	Inverkeithing Railway Station	Inverkeithing	United Kingdom			
12137	Kirkcaldy Railway Station	Kirkcaldy	United Kingdom			
12138	Palanan Community Airport	Palanan	Philippines		RPLN	
12139	Itbayat Airport	Itbayat	Philippines		RPLT	
12140	San Vicente Airport	San Vicente	Philippines	SWL	RPSV	
12141	Catbalogan Airport	Catbalogan City	Philippines		RPVY	
12142	Maasin Airport	Maasin	Philippines		RPSM	
12143	Isolatorweg Metro Station	Amsterdam	Netherlands			
12144	Dalwhinnie Railway Station	Dalwhinnie	United Kingdom			
12145	Arbroath Railway Station	Arbroath	United Kingdom			
12146	Edinburgh Park Railway Station	Edinburgh	United Kingdom			
12147	Edinburgh Airport Tram Station	Edinburgh	United Kingdom			
12148	Princes Street Tram Station	Edinburgh	United Kingdom			
12149	South Gyle Station	Edinburgh	United Kingdom			
12150	Bantayan Airport	Bantayan	Philippines		RPSB	
12151	Biliran Airport	Biliran	Philippines		RPVQ	
12152	Sipalay Airport	Sipalay	Philippines	SIL		
12153	Fazenda Várzea Funda Airport	PRIMAVERA D'OESTE	Brazil		SIEL	
12154	Luiz Eduardo Magalhaes Airport	CAMPO VERDE	Brazil		SDLZ	
12155	Primavera do Leste Airport	PRIMAVERA DO LESTE	Brazil		SWPY	
12156	Croker Island Airport	Croker Island	Australia	CKI	YCKI	
12157	The Granites Airport	The Granites	Australia		YTGT	
12158	Barimunya Airport	Barimunya	Australia	BYP	YBRY	
12159	Laucala Island Airport	Laucala	Fiji	LUC	NFNH	
12160	Yasawa Island Airport	Yasawa Island	Fiji	YAS	NFSW	
12161	Edinburgh Gateway Station	Edinburgh	United Kingdom			
12162	Dalmeny Railway Station	Dalmeny	United Kingdom			
12163	North Queens Ferry Station	North Queens Ferry	United Kingdom			
12164	North Shore Aerodrome	North Shore	New Zealand		NZNE	
12165	John C Tune Airport	Nashville	United States		KJWN	
12166	Okiwi Station Airport	Okiwi	New Zealand		NZOX	
12167	Waiheke Reeve Airport	Waiheke Island	New Zealand	WIK	NZKE	
12168	Karamea Airport	Karamea	New Zealand		NZKM	
12169	Gerlitzen	Gerlitzen	Austria			
12170	LKH Villach	Villach	Austria			
12171	Cologne Bonn Airport Station	Cologne	Germany			
12172	Koln Frankfurter Strasse Station	Cologne	Germany			
12173	Koln Trimbornstrasse Station	Cologne	Germany			
12174	Bitterfeld Station	Bitterfeld	Germany			
12175	Rimatara roadstead	Rimatara	French Polynesia	RIM		
12176	Rurutu port	Rurutu	French Polynesia	RRT		
12177	Rapa Iti port	Rapa Iti	French Polynesia	RPA		
12178	Tristan da Cunha	Tristan da Cunha	United Kingdom			
12179	Jastarnia Airport	Jastarnia	Poland		EPJA	
12180	Nop Goliat Airport	Dekai	Indonesia	DEX	WAVD	
12181	Napuka Island Airport	Napuka	French Polynesia	NAU	NTGN	
12182	Faaite Airport	Faaite	French Polynesia	FAC	NTKF	
12183	Nukutavake Airport	Nukutavake	French Polynesia	NUK	NTGW	
12184	Vahitahi Airport	Vahitahi	French Polynesia	VHZ	NTUV	
12185	Hikueru Atoll Airport	Hikueru	French Polynesia	HHZ	NTGH	
12186	Raroia Airport	Raroia	French Polynesia	RRR	NTKO	
12187	Kauehi Airport	Kauehi	French Polynesia	KHZ	NTKA	
12188	Tatakoto Airport	Tatakoto	French Polynesia	TKV	NTGO	
12189	Sasereme Airport	Sasereme	Papua New Guinea	TDS	AYSS	
12190	Tanah Merah Airport	Boven Digoel	Indonesia	TMH	WAKT	
12191	North Sea	North Cormorant	United Kingdom		CON1	
12192	Kantishna Airport	Kantishna	United States	5Z5		
12193	Denali Airport	McKinley Park	United States		AK06	
12194	Comte. Rolim Adolfo Amaro–Jundiaí State Airport	Jundiai	Brazil		SBJD	
12195	Coal Creek	Coal Creek	United States	L20		
12196	Roma Termini	Rome	Italy		ROMT	
12197	Yambio	Yambio	South Sudan			
12198	North Conway Station	North Conway Village	United States			
12199	Bartlett Rail Yard	Bartlett	United States			
12200	Potomac Airpark	Berkeley Springs	United States		KW35	
12201	Helisul IV Heliport	Foz Do Iguacu	Brazil		SSHS	
12202	Toshima	Toshima	Japan			
12203	Gemlik Seaport	Gemlik 	Turkey	GEM	TRGE	
12204	Sossusvlei Lodge	Hardap	Namibia		FYSU	
12205	Brits Airport	Brits	South Africa		FABS	
12206	West Melton Aerodrome	West Melton	New Zealand		NZWL	
12207	Rangiora Airfield	Rangiora	New Zealand		NZRT	
12208	Basel-Mulhouse	Bale-Mulhouse-Freiburg	France	MLH		
12209	Halic Seaport	Istanbul	Turkey		LTB1	
12210	Ravenna Railway Station	Ravenna	Italy			
12211	Cochrane Station	Cochrane	Canada			
12212	Clute Station	Cochrane	Canada			
12213	Wurtele Station	Cochrane	Canada			
12214	Island Falls Station	Cochrane	Canada			
12215	Brownrigg Station	Cochrane	Canada			
12216	Fraserdale Station	Fraserdale	Canada			
12217	Otter Rapids Station	Otter Rapids	Canada			
12218	Coral Station	Otter Rapids	Canada			
12219	Ranoke Station	Ranoke	Canada			
12220	Onakawana Station	Onakawana	Canada			
12221	Moose River Station	Moosonee	Canada			
12222	Moosonee Station	Moosonee	Canada			
12223	Galeton Station	Moosonee	Canada			
12224	Renison Station	Moosonee	Canada			
12225	Djugerari	Djugerari	Australia	CBC		
12226	Fazenda Jatobasso Airport	JARU	Brazil		SIDG	
12227	FIC Heliport	MACHADINHO D'OESTE	Brazil		SIMC	
12228	Monguno	Monguno	Nigeria			
12229	Noonkanbah Airport	Noonkanbah	Australia	NKB	YNKA	
12230	AEROPORTO DE PEDRAS NEGRAS	PEDRAS NEGRAS	Brazil		SPNE	
12231	Major Gilbert Field Airport	La Pointe	United States	4R5		
12232	Hocking Hills	Hocking Hills	United States	22I		
12233	Wellington Ferry Terminal	Wellington	New Zealand			
12234	Picton Ferry Terminal	Picton	New Zealand			
12235	Algeciras Heliport	Algeciras	Spain	AEI	LEAG	
12236	Cortina Airport	Cortina d'Ampezzo	Italy	CDF	LIDI	
12237	East Anacapa Island	East Anacapa	United States			
12238	Bila Tserkva Airport	Bila Tserkva	Ukraine		UKBC	
12239	Chepelevka Airport	Uzyn	Ukraine		UKKH	
12240	Rzhevka	St-Peterburg	Russia	RVH	ULSS	
12241	Fazenda São Nicolau Airport	COTRIGUACU	Brazil		SWQT	
12242	Kisoro Airport	Kisoro	Uganda		HUKI	
12243	Savannah Airstrip	Kihihi	Uganda	KHX		
12244	Brooks Aerodrome	Brooks River	United States			
12245	Kasese Airport	Kasese	Uganda	KSE	HUKS	
12246	Schwerin Bahnhof Sud	Schwerin	Germany			
12247	Schwerin Hauptbahnhof	Schwerin	Germany			
12248	NOVA MINE	NOVA MINE	Australia			
12249	Dikwa	Dikwa	Nigeria			
12250	Roissy Junction North	Roissy	France			
12251	Lille Central Junction	Lille	France			
12252	Stennis International Airport	Bay St. Louis	United States		KHSA	
12253	Sunchales Aeroclub Airport	Sunchales	Argentina	NCJ	SAFS	
12254	Istanbul Airport	Istanbul	Turkey	IST	LTFM	
12255	Bovanenkovo	Bovanenkovo	Russia	БОВ	USDB	
12256	Gare de Lille Flandres	Lille	France			
12257	Olare Orok Airstrip	Olare Motorogi Conservancy	Kenya			
12258	Termini	Rome	Italy	XRJ		
12259	Gwoza	Gwoza	Nigeria			
12260	Cape Krusenstern	Northwest Arctic Borough	United States			
12261	Bering Land Bridge National Preserve	Seward Peninsula	United States			
12262	Noatak National Preserve	Northwest Arctic Borough	United States			
12263	Gates of the Arctic National Park	Bettles	United States			
12264	Kobuk Valley National Park	Northwest Arctic Borough	United States			
12265	Seldovia Airport	Seldovia	United States	SOV	PASO	
12266	Bama	Bama	Nigeria			
12267	Aarhus Ferry Terminal	Aarhus	Denmark			
12268	Sjaellands Odde Ferry Terminal	Sjaellands Odde	Denmark			
12269	Lutselk'e Airport	Lutselk'e	Canada	YSG	CYLK	
12270	Engeløy Airport	Engeløy	Norway		ENEN	
12271	Dwangwa Airport	Dwangwa	Malawi	DWA	FWDW	
12272	Paloich Airport	Heliport	Higleig	South Sudan	HGI	
12273	Julian Carroll Airport	Jackson	United States		KJKL	
12274	Beaufort MCAS - Merritt Field	Beaufort	United States		KNBC	
12275	Camp Pendleton MCAS (Munn Field) Airport	Oceanside	United States		KNFG	
12276	Aerodromo de Castelo Branco	Castelo Branco	Portugal		LPCB	
12277	Ponte de Sor Airport	Ponte de Sôr	Portugal		LPSO	
12278	Vilar de Luz Airfield	Maia	Portugal		LPVL	
12279	Hard Bargain Airport		Bahamas		MYLR	
12280	Kenebetsu JASDF Airfield	Kenebetsu	Japan		RJCS	
12281	Augusto Severo Airport	Natal	Brazil		SBNT	
12282	Kishangarh Airport	Ajmer	India	KQH	VIKG	
12283	Kannur International Airport	Kannur	India	CNN	VOKN	
12284	Beijing Xijiao Airport	Beijing	China		ZBBB	
12285	Selous-Stiegler's Gorge Airstrip	Selous	Tanzania			
12286	Gara Centrala	Chisinau	Moldova			
12287	Aeroporto de jericoacoara	Jericoacoara 	Brazil		SBJE	
12288	Baku Railway Station	Baku	Azerbaijan			
12289	Ureki Railway Station	Ureki	Georgia			
12290	Judy	North Sea	United Kingdom		JUDY	
12291	Harris Ranch	Coalinga	United States	3O8		
12292	Rostov-on-Don Airport	Rostov-on-Don	Russia	RVI	URRR	
12293	Flores Airport	MANAUS	Brazil		SWFN	
12294	Lanzhou Railway Station	Lanzhou	China			
12295	Dunhuang Railway Station	Dunhuang	China			
12296	Jiayuguan Railway Station	Jiayuguan	China			
12297	Harbin West Raiway Station	Harbin	China			
12298	Manzhouli Railway Station	Manzhouli	China			
12299	Hailar Raiway Station	Hailar	China			
12300	Kunming Railway Station	Kunming	China			
12301	Dali Railway Station	Dali	China			
12302	Lijiang Railway Station	Lijiang	China			
12303	Azura Helipad	Benguerra Island	Mozambique			
12304	Anantara - Indigo Bay	Bazaruto	Mozambique			
12305	Oxford Railway Station	Oxford	United Kingdom		OXFR	
12306	Marylebone station	London	United Kingdom		LONM	
12307	Venezia Santa Lucia railway station	Venice	Italy		VENS	
12308	Bologna Centrale railway station	Bologna	Italy		BOLC	
12309	Huangshan North railway station	Huangshan	China		HSBZ	
12310	Umuwa Airport	Umuwa	Australia		YUMU	
12311	Iganu Game Ranch	Marken - Limpopo	South Africa			
12312	La Araucanía Airport	Temuco	Chile	ZCO	SCQP	
12313	Conrad Maldives Seaport	Rangali Island	Maldives			
12314	Arathusa Safari Lodge Airport	Arathusa	South Africa	ASS	FACC	
12315	Vidalia Regional Airport	Vidalia	United States	VDI	KVDI	
12316	Granbury Regional Airport	Granbury	United States		KGDJ	
12317	Oswego County Airport	Fulton	United States		KFZY	
12318	New Islamabad International Airport	Islamabad	Pakistan	ISB	OPIS	
12319	Gorokwe	Gorokwe	Botswana			
12320	Vumbura Airport	Vumburu	Botswana		FBVM	
12321	Farm Whitwater East Landing Strip	Hardap	Namibia		FYGK	
12322	Petropavlovskaya Krpost Helipad	St. Petersburg	Russia		ULLQ	
12323	Muwaffaq Salti Air Base	AZRAQ	Jordan		OJ40	
12324	Icy Strait Point Cruise Ship Dock	Hoonah	United States			
12325	Eidfjord	Eidfjord	Norway			
12326	Amsterdam Cruise Port	Amsterdam	Netherlands			
12327	Skjolden	Skjolden	Norway			
12328	Ngala	Ngala	Nigeria			
12329	Kirkjubæjarklaustur Airport	Kirkjubaejarklaustur 	Iceland		BIKL	
12330	Fazenda Uiapuru Airport	COMODORO	Brazil		SWVJ	
12331	Whitehorse Seaplane Base	Whitehorse	Canada		CEZ5	
12332	Canden Airstrip	Camden	Trinidad and Tobago		CAMD	
12333	Atlantic Ocean	Angostura CP	Trinidad and Tobago		ANGC	
12334	Mechanics Bay	Auckland	New Zealand	MHB		
12335	Pertominsk Airport	Pertominsk	Russia		ULAT	
12336	Banki	Banki	Nigeria			
12337	Schushenkoje	Schusheskoje	Russia			
12338	Maina	Maina	Russia			
12339	Leninsk-Kuznetskij	Leninsk-Kuznetskij	Russia			
12340	Moscow Kurskaya railway station	Moscow	Russia			
12341	St. Petersburg-Ladozhsky railway station	St. Petersburg	Russia			
12342	St.Petersburg-Glavny railway station	St. Petersburg	Russia			
12343	Moscow-Oktyabrskaya railway station	Moscow	Russia			
12344	Klong Jilad Pier	Krabi	Thailand			
12345	Tonsai Pier	Phi Phi	Thailand			
12346	Machu Picchu railway station	Aguas Calientes	Peru			
12347	Ollantaytambo railway station	Ollantaytambo	Peru			
12348	Poroy railway station	Cusco	Peru			
12349	Interlaken OST railway station	Interlaken	Switzerland			
12350	Mount Weld Airport	Laverton	Australia		YMNW	
12351	Kidston Airport	Kidston	Australia		YKID	
12352	Yonkers Station	Yonkers	United States			
12353	Valle Aurelia	Rome	Italy			
12354	Viterbo Porta Romana	Viterbo	Italy			
12355	Garrison Station	Garrison	United States			
12356	Cold Spring Station	Cold Spring	United States			
12357	Beacon Station	Beacon	United States			
12358	New Hamburg Station	New Hamburg	United States			
12359	Kirkja Heliport	Kirkja	Faroe Islands		EKKU	
12360	Klaksvik Heliport	Klaksvik	Faroe Islands		EKKV	
12361	Mitchell Municipal Airport	Mitchell	United States	MHE	KMHE	
12362	Solwezi	Solwezi	Zambia	SLI		
12363	Hunda Airport	Tubu Tree Camp	Botswana		FBHU	
12364	Juneau Harbor Seaplane Base	Juneau	United States	5Z1		
12365	Taku Lodge Seaplane Base	Taku Lodge	United States	TKL		
12366	Mchauru Airport	Geita	Tanzania	GIT	HTRU	
12367	Klaksvik Bus Station	Klaksvik	Faroe Islands			
12368	Leirvik Bus Stop	Leirvik	Faroe Islands			
12369	Gotudalur Bus Stop	Nordragota	Faroe Islands			
12370	Soldarfjordur Bus Stop	Soldarfjordur	Faroe Islands			
12371	Skalabotnur Bus Stop	Skalabotnur	Faroe Islands			
12372	Oyrarbakki Bus Stop	Oyrarbakki	Faroe Islands			
12373	Kollafjardatunnilin Bus Stop	Kollafjordur	Faroe Islands			
12374	Kingston Bus Terminal	Kingston	Canada			
12375	Malakal	Malakal	South Sudan			
12376	Maban	Doro	South Sudan			
12377	Grand Cicero	Chicago	United States			
12378	Vaerlose Air Base	Vaerlose	Denmark		EKVL	
12379	Gitega Airport	Gitega	Burundi	GID	HBBE	
12380	Orlyval Ouest Station	Orly	France			
12381	Gare d'Antony	Antony	France			
12382	Gare de Bourg-la-Reine	Bourg-la-Reine	France			
12383	Gare de Denfert-Rochereau	Paris	France			
12384	Aeroporto Lisbon Metro Station	Lisbon	Portugal			
12385	Alameda Lisboa Metro Station	Lisbon	Portugal			
12386	Rossio Lisboa Metro Station	Lisbon	Portugal			
12387	Región de Murcia International Airport	Murcia	Spain	RMU	LEMI	
12388	Fazenda Kajussol Airport	Alta Floresta D'Oeste	Brazil		SJYD	
12389	Gare Saint-Lazare	Paris	France			
12390	Giverny Station	Vernon	France			
12391	Gare de Rouen-Rive-Droite	Rouen	France			
12392	Gare de Mantes-la-Jolie	Mantes-la-Jolie	France			
12393	Gare de Gaillon-Aubevoye	Aubevoye	France			
12394	Gare SNCF Val-de-Reuil	Val-de-Reuil	France			
12395	Gare de Oissel	Oissel	France			
12396	Gare de Rosny-sur-Seine	Rosny-sur-Seine	France			
12397	Gare de Bonnieres	Bonnieres-sur-Seine	France			
12398	Austin Greyhound Station	Austin	United States			
12399	Dallas Greyhound Station	Dallas	United States			
12400	Gare de Amiens	Amiens	France			
12401	Gare de Arras	Arras	France			
12402	Gare de Douai	Douai	France			
12403	Gare de Monterolier-Buchy	Monterolier-Buchy	France			
12404	Gare de Serqueux	Serqueux	France			
12405	Gare de Abancourt	Abancourt	France			
12406	Gare de Poix-de-Picardie	Poix-de-Picardie	France			
12407	Gare de Corbie	Corbie	France			
12408	Gare de Albert	Albert	France			
12409	Gare de Achiet	Achiet	France			
12410	Gare de Hergenrath	Hergenrath	Belgium			
12411	Aachen Schanz Station	Aachen	Germany			
12412	Aachen West Station	Aachen	Germany			
12413	Herzogenrath Station	Herzogenrath	Germany			
12414	Ubach-Palenberg Station	Ubach-Palenberg	Germany			
12415	Geilenkirchen Station	Geilenkirchen	Germany			
12416	Lindern-Geilenkirchen Station	Geilenkirchen	Germany			
12417	Huckelhoven-Baal Station	Huckelhoven	Germany			
12418	Erkelenz Station	Erkelenz	Germany			
12419	Rhydt Hauptbahnhof	Rhydt	Germany			
12420	Monchengladbach Hauptbahnhof	Monchengladbach	Germany			
12421	Neuss Hauptbahnhof	Neuss	Germany			
12422	Rheydt Hauptbahnhof	Rheydt	Germany			
12423	Gare de La Garenne-Colombes	La Garenne-Colombes	France			
12424	Gare de Houille	Carrieres-sur-Seine	France			
12425	Gare de Sartrouville	Sartrouville	France			
12426	Gare de Maisons-Laffitte	Maisons-Laffitte	France			
12427	Gare de Poissy	Poissy	France			
12428	Yida	Yida	South Sudan			
12429	Passo Gardena-Heli	Corvara	Italy			
12430	Halle Hauptbahnhof	Halle	Germany			
12431	Erfurt Hauptbahnhof	Erfurt	Germany			
12432	Leipzig Messe Station	Leipzig	Germany			
12433	Delitzsch	Delitzsch unterer Bahnhof	Germany			
12434	Leipzig Nord Station	Leipzig	Germany			
12435	Rubkona	Bentiu	South Sudan			
12436	Kuajok	Kuajok	South Sudan			
12437	Alek	Wunrok	South Sudan			
12438	Pelee Island Airport	Pelee	Canada		CYPT	
12439	Costa Marques Airport	COSTA MARQUES	Brazil	CQS	SWCQ	
12440	Lille HSL Junction	Fretin	France			
12441	Tienen Railway Station	Tienen	Belgium			
12442	Landen Railway Station	Landen	Belgium			
12443	Waremme Railway Station	Waremme	Belgium			
12444	Tuan Chau Marina	Thanh pho Ha Long	Vietnam			
12445	Bethune Railway Station	Bethune	France			
12446	Lens Railway Station	Lens	France			
12447	Gare de La Bassee - Violaines	La Bassee	France			
12448	Gare de Lille-CHR	Lille	France			
12449	Mangalore Airport	Mangalore	Australia		YMNG	
12450	Brussels South Station	Brussels	Belgium			
12451	Acheres-Grand-Cormier Station	Saint-Germain-en-Laye	France			
12452	Asnieres-sur-Seine Station	Asnieres-sur-Seine	France			
12453	Gare Rosa-Parks	Paris	France			
12454	La Defense Station	Puteaux	France			
12455	Main St. and Longwood Rd.	Hamilton	Canada			
12456	Camrose Airport	Camrose	Canada			
12457	King St. W and Dundurn St.	Hamilton	Canada			
12458	Taoyuan HSR station TAY04	Taoyuan	Taiwan			
12459	MRT Jiantan Station R15	Taipei	Taiwan			
12460	Mystic Seaport	Mystic Seaport	United States			
12461	World Trade Center Station	New York	United States			
12462	Pien am Chiemsee	Prien am Chiemsee	Germany			
12463	Auber Paris RER	Paris	France			
12464	Charles de Gaulle Etoile	Paris	France			
12465	Port Angeles Auto and Passenger Ferry Terminal	Port Angeles	United States			
12466	Victoria Auto and Passenger Ferry Terminal	Victoria	Canada			
12467	Biache-Saint-Vaast Railway Station	Biache-Saint-Vaast	France			
12468	Vitry-en-Artois Railway Station	Vitry-en-Artois	France			
12469	Brebieres Sud Railway Station	Brebieres	France			
12470	Leforest Railway Station	Leforest	France			
12471	Libercourt Railway Station	Libercourt	France			
12472	Seclin Railway Station	Seclin	France			
12473	Noeux-les-Mines Railway Station	Noeux-les-Mines	France			
12474	Bully-Grenay Station	Bully-les-Mines	France			
12475	Haubourdin Railway Station	Haubourdin	France			
12476	Wavrin Railway Station	Wavrin	France			
12477	Don-Sainghin Railway Station	Sainghin-en-Weppes	France			
12478	Cuinchy Railway Station	Cuinchy	France			
12479	Beuvry Railway Station	Beuvry Pas-de-Calais	France			
12480	Halle-Ammendorf Station	Ammendorf	Germany			
12481	Vis Port	Vis Island	Croatia			
12482	Split Port	Split	Croatia			
12483	Comboio-Sintra	Sintra	Portugal			
12484	Comboio-Rossio	Lisbon	Portugal			
12485	Praca do Comercio	Lisbon	Portugal			
12486	Mosteiro dos Jeronimos	Belem	Portugal			
12487	Shibuya Mark City 5F Bus Terminal	Tokyo	Japan			
12488	Sanjo Keihan	Kyoto	Japan			
12489	Demachiyanagi Station	Kyoto	Japan			
12490	Shukugawara Station	Kawasaki	Japan			
12491	Fujiko F Fujio Museum Bus Stop	Kawasaki	Japan			
12492	Noborito Station	Kawasaki	Japan			
12493	Shibuya Station	Tokyo	Japan			
12494	Shinjuku Station	Tokyo	Japan			
12495	Al Ghubaiba Metro Station	Dubai	United Arab Emirates			
12496	Al Ghubaiba Bus Station	Dubai	Japan			
12497	Central Bus Station	Abu Dhabi	United Arab Emirates			
12498	Al Jafiliya Station	Dubai	Japan			
12499	Dubai Metro-ADCB Station	Dubai	United Arab Emirates			
12500	Dubai Metro-Burj Khalifa-Dubai Mall Station	Dubai	United Arab Emirates			
12501	Dubai Metro-Al Fheidi Station	Dubai	United Arab Emirates			
12502	Emeishan Station	Leshan	China			
12503	Bus Terminal	Koper	Slovenia			
12504	Bus Terminal	Dubrovnik	Croatia			
12505	Gare de Lembeek	Halle	Belgium			
12506	Gare de Silly	Silly	Belgium			
12507	Forest-South Railway Station	Brussels	Belgium			
12508	Buttgen Railway Station	Buttgen	Germany			
12509	Neuss Am Kaiser Station	Neuss	Germany			
12510	Neuss Rheinpark-Center Station	Neuss	Germany			
12511	Dusseldorf-Hamm Station	Dusseldorf	Germany			
12512	Dusseldorf-Friedrichstadt Station	Dusseldorf	Germany			
12513	Gare de Chenee	Liege	Belgium			
12514	Riu Caribe	Cancun	Mexico			
12515	Chichen Itza	Chichen Itza	Mexico			
12516	Railway Station	Ganzhou	China			
12517	Kowloon Tong	Hong Kong	Hong Kong			
12518	University Station	Hong Kong	Hong Kong			
12519	Railway Station	Xuzhou	China			
12520	Downtown	Moab	United States			
12521	BART Station	Fremont	United States			
12522	19th St. Station	Oakland	United States			
12523	Transbay Bus Terminal	San Francisco	United States			
12524	Diridon Station	San Jose	United States			
12525	Bus Station	Avenal	United States			
12526	Bus Station	Los Angeles	United States			
12527	Amtrak Station	East Lansing	United States			
12528	Perrache Central Bus Station	Lyon	France			
12529	St Charles	Marseille	France			
12530	De Brouckere Metro Station	Brussels	Belgium			
12531	Train Station	Chambesy	France			
12532	Gare De Sotteville	Rouen	France			
12533	Rouen Junction L'est	Rouen	France			
12534	Train Station	Schleswig	Germany			
12535	Train Station	Flensburg	Germany			
12536	Sildekulevej v Ulsaes Centret Station	Grasten	Denmark			
12537	Ragebol Aabenraavej Station	Sonderborg	Denmark			
12538	Bus Station	Aabenraa	Denmark			
12539	Kongevej v Vestergade Station	Toender	Denmark			
12540	Train Station	Toender	Denmark			
12541	Train Station	Niebuell	Germany			
12542	Westerland Station	Sylt	Germany			
12543	Altona Station	Hamburg	Germany			
12544	Train Station	Husum	Germany			
12545	Bad St Peter-Ording Station	Sankt Peter-Ording	Germany			
12546	Train Station	Kornwestheim	Germany			
12547	Central Bus Station	Munich	Germany			
12548	Carpark Sihlquai Bus Station	Zurich	Switzerland			
12549	Train Station	Floersheim am Main	Germany			
12550	Ost Station	Wiesbaden 	Germany			
12551	Hauptbahnhof	Mainz	Germany			
12552	Herent Railway Station	Herent	Belgium			
12553	UCLA Bus Stop	Los Angeles	United States			
12554	Bus Station	Rijeka	Croatia			
12555	Guilin West Railway Station	Guilin	China			
12556	Yangshuo Railway Station	Yangshuo	China			
12557	North Sea	Captain FPSO	United Kingdom		CAPT	
12558	Bus Station	Mezaira	United Arab Emirates			
12559	Shah Plant 4th Roundabout Bus Station	Hameem	United Arab Emirates			
12560	Oil Field Checkpoint	Asab	United Arab Emirates			
12561	Oil Field Checkpoint	Sahil	United Arab Emirates			
12562	Bus Station	Mussafah	United Arab Emirates			
12563	Abu Al Abyad ADNOC Fod Station	Tarif	United Arab Emirates			
12564	Bus Station	Madinat Zayed	United Arab Emirates			
12565	Bus Station	Tarif	United Arab Emirates			
12566	Bus Station	Ruwais	United Arab Emirates			
12567	ADNOC Compound Bus Station	Ruwais	United Arab Emirates			
12568	Muharraq Ferry Terminal	Jebel Dhanna	United Arab Emirates			
12569	Ferry Terminal	Dalma Island	United Arab Emirates			
12570	Gare de Maisons-Alfort	Alfortville	France			
12571	Gare du Vert de Maisons	Alfortville	France			
12572	Gare de Creteil-Pompadour	Creteil	France			
12573	Gare de Lieusaint-Moissy	Lieusaint	France			
12574	Train Station	Fredericia	Denmark			
12575	Gare de Collonges-au-Mont-dOr	Lyon	France			
12576	Gare de Couzon-au-Mont-dOr	Couzon-au-Mont-dOr	France			
12577	Gare dAlbigny-sur-Saone	Albigny-sur-Saone	France			
12578	Gare de Saint-Germain-au-Mont-dOr	Saint-Germain-au-Mont-dOr	France			
12579	Gare dAnse	Anse	France			
12580	Gare de Villefranche-sur-Saone	Villefranche-sur-Saone	France			
12581	Gare de Romaneche-Thorins	Romaneche-Thorin	France			
12582	Gare de Creches-sur-Saone	Creches-sur-Saone	France			
12583	Porte de Saint-Cloud Station	Paris	France			
12584	Pont de Sevres Station	Boulogne-Billancourt	France			
12585	Porte Maillot Metro Station	Paris	France			
12586	Gare de Denfert-Rochereau	Paris	France			
12587	Gare de Sevran Beaudottes	Sevran	France			
12588	Prato Centrale Railway Station	Prato	Italy			
12589	Mainz-Bischofsheim Station	Bischofsheim	Germany			
12590	Kelsterbach Station	Kelsterbach	Germany			
12591	Frankfurt-Main Junction	Frankfurt-Main	Germany			
12592	Utrecht Cartesiusweg Sidings	Utrecht	Netherlands			
12593	Vleuten Railway Station	Vleuten	Netherlands			
12594	Amsterdam Muiderpoort	Amsterdam	Netherlands			
12595	Amsterdam Rietlanden	Amsterdam	Netherlands			
12596	Amsterdam Henk Sneevlietweg	Amsterdam	Netherlands			
12597	Praha U Krize	Prague	Czech Republic			
12598	Praha Krejcarek	Prague	Czech Republic			
12599	Neustadt-Nord Junction	Cologne	Germany			
12600	Koln Hansaring Station	Cologne	Germany			
12601	Osnabruek Altstadt	Osnabruek	Germany			
12602	Dreye Railway Station	Dreye	Germany			
12603	Veddel Station	Hamburg	Germany			
12604	Elbbrucke Station	Hamburg	Germany			
12605	Oberhafen Station	Hamburg	Germany			
12606	Rothenburgsort Station	Hamburg	Germany			
12607	Tiefstack Station	Hamburg	Germany			
12608	Allermohe Station	Hamburg	Germany			
12609	Landwehr Station	Hamburg	Germany			
12610	Hasselbrook Station	Hamburg	Germany			
12611	Rahlstedt Station	Hamburg	Germany			
12612	Hamburg-Tonndorf Station	Hamburg	Germany			
12613	Arstaberg Station	Stockholm	Sweden			
12614	Poznan Gorczyn Railway Station	Poznan	Poland			
12615	Poznan Junikowo Railway Station	Poznan	Poland			
12616	Poznan Garbary Railway Station	Poznan	Poland			
12617	Poznan Wschod Railway Station	Poznan	Poland			
12618	Meinsdorf bei Rosslau	Rosslau	Germany			
12619	Jeber-Bergfrieden Railway Station	Jeber	Germany			
12620	Medewitz-Mark Station	Medewitz	Germany			
12621	Dresden Mitte Station	Dresden	Germany			
12622	Dresden Freiberger Strasse	Dresden	Germany			
12623	Radebeul Ost Station	Radebeul	Germany			
12624	Radebeul-Weintraube Station	Radebeul	Germany			
12625	Radebeul-Ketzschenbroda Station	Radebeul	Germany			
12626	Radebeul-Zitzschewig Station	Radebeul	Germany			
12627	Dresden Bischofsplatz Station	Dresden	Germany			
12628	Dresden-Pieschen Station	Dresden	Germany			
12629	Dresden-Strehlen Station	Dresden	Germany			
12630	Dresden-Dobritz Station	Dresden	Germany			
12631	Dresden-Niedersedlitz Station	Dresden	Germany			
12632	Goerlitz Svt junction	Goerlitz	Germany			
12633	Horka Bahnhof	Horka	Germany			
12634	Hahnichen Bahnhof	Hahnichen	Germany			
12635	El Kharga Airport	El Kharga	Egypt	UVL	HENY	
12636	Charlottesville Train Station	Charlottesville 	United States			
12637	Bentwisch Railway Station	Bentwisch	Germany			
12638	Hannover-Kleefeld Station	Hannover	Germany			
12639	Hannover Karl-Wiechert-Allee Station	Hannover	Germany			
12640	Hannover-Anderten-Misburg Railway Station	Hannover	Germany			
12641	Ahlten Station	Hannover	Germany			
12642	Grossbrembach Overtaking Loop	Grossbrembach	Germany			
12643	Judendorf Overtaking Loop	Steigra	Germany			
12644	San Isidro del General Airport	San Isidro	Costa Rica		MRSI	
12645	Zabrat Airport	Baku	Azerbaijan	ZXT	UBTT	
12646	Bezmer Air Base	Yambol	Bulgaria	JAM	LBIA	
12647	Osovtsy Air Base	Byaroza	Belarus		UMMO	
12648	Yuanmou Air Base	Yuanmou	China	YUA	ZPYM	
12649	Changsha Datuopu Airport/AFB	Changsha	China		ZGCS	
12650	Xingcheng Air Base		China	XEN	ZYXC	
12651	Lefkoniko Airport	Geçitkale	Cyprus	GEC	LCGK	
12652	Songwe Airport	Mbeya	Tanzania	MBI	HTGW	
12653	Kalocsa/Foktő Airport	Kalocsa/Foktő	Hungary		LHKA	
12654	Bilogai-Sugapa Airport	Sugapa-Papua Island	Indonesia	UGU	WABV	
12655	Jakkur Aerodrome	Bengaluru	India		VOJK	
12656	Jalal-Abad Airport	Jalal-Abad	Kyrgyzstan		UAFJ	
12657	Ramon Airport	Eilat	Israel	ETM	LLER	
12658	Rustaq Airport	Al Masna'ah	Oman	MNH	OORQ	
12659	Laguindingan Airport	Cagayan de Oro City	Philippines	CGY	RPMY	
12660	Kostomuksha Airport	Kostomuksha	Russia		ULPM	
12661	Privolzhskiy Air Base	Astrakhan	Russia		XRAP	
12662	Kubinka Air Base	Kubinka	Russia		UUMB	
12663	Rogachyovo Air Base	Belaya	Russia		ULDA	
12664	Ulan-Ude East Airport	Ulan Ude	Russia		XIUW	
12665	Krechevitsy Air Base	Novgorod	Russia		ULLK	
12666	Desierto de Atacama Airport	Copiapo	Chile	CPO	SCAT	
12667	Melitopol Air Base	Melitopol	Ukraine		UKDM	
12668	Lincoln Train Station LNK	Lincoln	United States			
\.


--
-- Data for Name: bookings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bookings (booking_id, flight_id, citizen_id, first_name, last_name, phone_number, email, dob, total_passengers, booking_date, total_price) FROM stdin;
1	1	359-07-9203	Ashley	Johnson	624-207-9999x897	jparker@example.com	2024-12-21	1	2024-12-21 15:21:13+00	100.00
3	4	123456789123	test	test	1234567890	random@gmail.com	2004-11-20	1	2024-12-21 15:43:14.356+00	125.51
4	4	123456789123	test	test	1234567890	random@gmail.com	2004-11-20	1	2024-12-21 15:49:14.039+00	125.51
5	4	123123123123	test	testt	1234567890	test@gmail.com	2001-12-20	1	2024-12-21 15:52:11.355+00	125.51
6	4	123123123123	test	testt	1234567890	test@gmail.com	2001-12-20	1	2024-12-21 15:55:17.142+00	125.51
7	4	100100100100	Le	Pham	1234567891	testing@gmail.com	2001-12-20	1	2024-12-21 15:57:27.794+00	125.51
8	4	000000000000	La	Thi	3333333333	hello@gmail.com	2003-11-21	1	2024-12-21 16:16:44.193+00	125.51
9	4	123123123123	minh	minh	1234567891	minh@gmail.com	2001-11-20	1	2024-12-21 16:32:49.396+00	125.51
10	4	000123123132	minh	minh	1231231231	minh@mail.com	2004-11-20	1	2024-12-21 16:39:00.036+00	125.51
11	4	000111000111	minh	minh	0901200200	random@gmail.com	2001-11-20	1	2024-12-21 16:43:16.511+00	125.51
12	4	000111000111	minh	minh	0001001000	random@gmail.com	2004-11-20	1	2024-12-21 16:46:17.981+00	125.51
\.


--
-- Data for Name: flights; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.flights (flight_id, flight_number, aircraft_id, departure_airport, arrival_airport, departure_time, arrival_time, status, gate, board_time, price) FROM stdin;
3	QAL748	2	SGN	HAN	2024-12-22 03:00:00+00	2024-12-22 05:00:00+00	upcoming	Right-sized interactive productivity	2024-12-22 02:20:00+00	131.14
4	QAL364	2	HAN	SGN	2024-12-28 08:00:00+00	2024-12-28 10:00:00+00	upcoming	Versatile needs-based collaboration	2024-12-28 07:40:00+00	125.51
5	QAL364	2	HAN	SGN	2024-12-28 09:00:00+00	2024-12-28 11:00:00+00	upcoming	Versatile needs-based collaboration	2024-12-28 08:40:00+00	183.60
6	QAL364	2	HAN	SGN	2024-12-28 10:00:00+00	2024-12-28 12:00:00+00	upcoming	Versatile needs-based collaboration	2024-12-28 09:40:00+00	171.53
7	SH125	2		BKK	2024-12-21 16:21:00+00	2024-12-21 16:27:00+00	On time	A1	2024-12-21 15:21:00+00	6969.00
8	QAL1234	2	HAN	SGN	2024-12-22 00:30:00+00	2024-12-22 02:30:00+00	On time	A1	2024-12-22 00:00:00+00	100.00
1	QAL748	2	SGN	HAN	2024-12-22 01:30:00+00	2024-12-22 15:30:00+00	Delayed	A1	2024-12-22 01:00:00+00	129.34
\.


--
-- Data for Name: news; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.news (news_id, title, content, category) FROM stdin;
\.


--
-- Data for Name: passengers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.passengers (passenger_id, booking_id, citizen_id, seat_id, first_name, last_name, phone_number, email, dob, gender) FROM stdin;
1	1	359-07-9203	1	Ashley	Johnson	624-207-9999x897	jparker@example.com	2024-12-21	male
3	8	000000000000	86	La	Thi	3333333333	000000000000	2003-11-21	female
5	10	000123123132	113	minh	minh	1231231231	000123123132	2004-11-20	male
\.


--
-- Data for Name: planes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.planes (aircraft_id, aircraft_type, capacity) FROM stdin;
\.


--
-- Data for Name: seats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.seats (seat_id, aircraft_id, flight_id, seat_number, seat_type, seat_price, seat_status) FROM stdin;
1	2	1	1A	Economy	100.00	Available
2	2	1	1B	Economy	100.00	Available
3	2	1	1C	Economy	100.00	Available
4	2	1	1D	Economy	100.00	Available
5	2	1	2A	Economy	100.00	Available
6	2	1	2B	Economy	100.00	Available
7	2	1	2C	Economy	100.00	Available
8	2	1	2D	Economy	100.00	Available
9	2	1	3A	Economy	100.00	Available
10	2	1	3B	Economy	100.00	Available
11	2	1	3C	Economy	100.00	Available
12	2	1	3D	Economy	100.00	Available
13	2	1	4A	Economy	100.00	Available
14	2	1	4B	Economy	100.00	Available
15	2	1	4C	Economy	100.00	Available
16	2	1	4D	Economy	100.00	Available
17	2	1	5A	Economy	100.00	Available
18	2	1	5B	Economy	100.00	Available
19	2	1	5C	Economy	100.00	Available
20	2	1	5D	Economy	100.00	Available
21	2	1	6A	Economy	100.00	Available
22	2	1	6B	Economy	100.00	Available
23	2	1	6C	Economy	100.00	Available
24	2	1	6D	Economy	100.00	Available
25	2	1	7A	Economy	100.00	Available
26	2	1	7B	Economy	100.00	Available
27	2	1	7C	Economy	100.00	Available
28	2	1	7D	Economy	100.00	Available
29	2	1	8A	Economy	100.00	Available
30	2	1	8B	Economy	100.00	Available
31	2	1	8C	Economy	100.00	Available
32	2	1	8D	Economy	100.00	Available
33	2	1	9A	Economy	100.00	Available
34	2	1	9B	Economy	100.00	Available
35	2	1	9C	Economy	100.00	Available
36	2	1	9D	Economy	100.00	Available
37	2	1	10A	Economy	100.00	Available
38	2	1	10B	Economy	100.00	Available
39	2	1	10C	Economy	100.00	Available
40	2	1	10D	Economy	100.00	Available
81	2	3	1A	Economy	100.00	Available
82	2	3	1B	Economy	100.00	Available
83	2	3	1C	Economy	100.00	Available
84	2	3	1D	Economy	100.00	Available
85	2	3	2A	Economy	100.00	Available
86	2	3	2B	Economy	100.00	Available
87	2	3	2C	Economy	100.00	Available
88	2	3	2D	Economy	100.00	Available
89	2	3	3A	Economy	100.00	Available
90	2	3	3B	Economy	100.00	Available
91	2	3	3C	Economy	100.00	Available
92	2	3	3D	Economy	100.00	Available
93	2	3	4A	Economy	100.00	Available
94	2	3	4B	Economy	100.00	Available
95	2	3	4C	Economy	100.00	Available
96	2	3	4D	Economy	100.00	Available
97	2	3	5A	Economy	100.00	Available
98	2	3	5B	Economy	100.00	Available
99	2	3	5C	Economy	100.00	Available
100	2	3	5D	Economy	100.00	Available
101	2	3	6A	Economy	100.00	Available
102	2	3	6B	Economy	100.00	Available
103	2	3	6C	Economy	100.00	Available
104	2	3	6D	Economy	100.00	Available
105	2	3	7A	Economy	100.00	Available
106	2	3	7B	Economy	100.00	Available
107	2	3	7C	Economy	100.00	Available
108	2	3	7D	Economy	100.00	Available
109	2	3	8A	Economy	100.00	Available
110	2	3	8B	Economy	100.00	Available
111	2	3	8C	Economy	100.00	Available
112	2	3	8D	Economy	100.00	Available
113	2	3	9A	Economy	100.00	Available
114	2	3	9B	Economy	100.00	Available
115	2	3	9C	Economy	100.00	Available
116	2	3	9D	Economy	100.00	Available
117	2	3	10A	Economy	100.00	Available
118	2	3	10B	Economy	100.00	Available
119	2	3	10C	Economy	100.00	Available
120	2	3	10D	Economy	100.00	Available
121	2	4	1A	Economy	100.00	Available
122	2	4	1B	Economy	100.00	Available
123	2	4	1C	Economy	100.00	Available
124	2	4	1D	Economy	100.00	Available
125	2	4	2A	Economy	100.00	Available
126	2	4	2B	Economy	100.00	Available
127	2	4	2C	Economy	100.00	Available
128	2	4	2D	Economy	100.00	Available
129	2	4	3A	Economy	100.00	Available
130	2	4	3B	Economy	100.00	Available
131	2	4	3C	Economy	100.00	Available
132	2	4	3D	Economy	100.00	Available
133	2	4	4A	Economy	100.00	Available
134	2	4	4B	Economy	100.00	Available
135	2	4	4C	Economy	100.00	Available
136	2	4	4D	Economy	100.00	Available
137	2	4	5A	Economy	100.00	Available
138	2	4	5B	Economy	100.00	Available
139	2	4	5C	Economy	100.00	Available
140	2	4	5D	Economy	100.00	Available
141	2	4	6A	Economy	100.00	Available
142	2	4	6B	Economy	100.00	Available
143	2	4	6C	Economy	100.00	Available
144	2	4	6D	Economy	100.00	Available
145	2	4	7A	Economy	100.00	Available
146	2	4	7B	Economy	100.00	Available
147	2	4	7C	Economy	100.00	Available
148	2	4	7D	Economy	100.00	Available
149	2	4	8A	Economy	100.00	Available
150	2	4	8B	Economy	100.00	Available
151	2	4	8C	Economy	100.00	Available
152	2	4	8D	Economy	100.00	Available
153	2	4	9A	Economy	100.00	Available
154	2	4	9B	Economy	100.00	Available
155	2	4	9C	Economy	100.00	Available
156	2	4	9D	Economy	100.00	Available
157	2	4	10A	Economy	100.00	Available
158	2	4	10B	Economy	100.00	Available
159	2	4	10C	Economy	100.00	Available
160	2	4	10D	Economy	100.00	Available
161	2	5	1A	Economy	100.00	Available
162	2	5	1B	Economy	100.00	Available
163	2	5	1C	Economy	100.00	Available
164	2	5	1D	Economy	100.00	Available
165	2	5	2A	Economy	100.00	Available
166	2	5	2B	Economy	100.00	Available
167	2	5	2C	Economy	100.00	Available
168	2	5	2D	Economy	100.00	Available
169	2	5	3A	Economy	100.00	Available
170	2	5	3B	Economy	100.00	Available
171	2	5	3C	Economy	100.00	Available
172	2	5	3D	Economy	100.00	Available
173	2	5	4A	Economy	100.00	Available
174	2	5	4B	Economy	100.00	Available
175	2	5	4C	Economy	100.00	Available
176	2	5	4D	Economy	100.00	Available
177	2	5	5A	Economy	100.00	Available
178	2	5	5B	Economy	100.00	Available
179	2	5	5C	Economy	100.00	Available
180	2	5	5D	Economy	100.00	Available
181	2	5	6A	Economy	100.00	Available
182	2	5	6B	Economy	100.00	Available
183	2	5	6C	Economy	100.00	Available
184	2	5	6D	Economy	100.00	Available
185	2	5	7A	Economy	100.00	Available
186	2	5	7B	Economy	100.00	Available
187	2	5	7C	Economy	100.00	Available
188	2	5	7D	Economy	100.00	Available
189	2	5	8A	Economy	100.00	Available
190	2	5	8B	Economy	100.00	Available
191	2	5	8C	Economy	100.00	Available
192	2	5	8D	Economy	100.00	Available
193	2	5	9A	Economy	100.00	Available
194	2	5	9B	Economy	100.00	Available
195	2	5	9C	Economy	100.00	Available
196	2	5	9D	Economy	100.00	Available
197	2	5	10A	Economy	100.00	Available
198	2	5	10B	Economy	100.00	Available
199	2	5	10C	Economy	100.00	Available
200	2	5	10D	Economy	100.00	Available
201	2	6	1A	Economy	100.00	Available
202	2	6	1B	Economy	100.00	Available
203	2	6	1C	Economy	100.00	Available
204	2	6	1D	Economy	100.00	Available
205	2	6	2A	Economy	100.00	Available
206	2	6	2B	Economy	100.00	Available
207	2	6	2C	Economy	100.00	Available
208	2	6	2D	Economy	100.00	Available
209	2	6	3A	Economy	100.00	Available
210	2	6	3B	Economy	100.00	Available
211	2	6	3C	Economy	100.00	Available
212	2	6	3D	Economy	100.00	Available
213	2	6	4A	Economy	100.00	Available
214	2	6	4B	Economy	100.00	Available
215	2	6	4C	Economy	100.00	Available
216	2	6	4D	Economy	100.00	Available
217	2	6	5A	Economy	100.00	Available
218	2	6	5B	Economy	100.00	Available
219	2	6	5C	Economy	100.00	Available
220	2	6	5D	Economy	100.00	Available
221	2	6	6A	Economy	100.00	Available
222	2	6	6B	Economy	100.00	Available
223	2	6	6C	Economy	100.00	Available
224	2	6	6D	Economy	100.00	Available
225	2	6	7A	Economy	100.00	Available
226	2	6	7B	Economy	100.00	Available
227	2	6	7C	Economy	100.00	Available
228	2	6	7D	Economy	100.00	Available
229	2	6	8A	Economy	100.00	Available
230	2	6	8B	Economy	100.00	Available
231	2	6	8C	Economy	100.00	Available
232	2	6	8D	Economy	100.00	Available
233	2	6	9A	Economy	100.00	Available
234	2	6	9B	Economy	100.00	Available
235	2	6	9C	Economy	100.00	Available
236	2	6	9D	Economy	100.00	Available
237	2	6	10A	Economy	100.00	Available
238	2	6	10B	Economy	100.00	Available
239	2	6	10C	Economy	100.00	Available
240	2	6	10D	Economy	100.00	Available
241	2	7	1A	Economy	100.00	Available
242	2	7	1B	Economy	100.00	Available
243	2	7	1C	Economy	100.00	Available
244	2	7	1D	Economy	100.00	Available
245	2	7	2A	Economy	100.00	Available
246	2	7	2B	Economy	100.00	Available
247	2	7	2C	Economy	100.00	Available
248	2	7	2D	Economy	100.00	Available
249	2	7	3A	Economy	100.00	Available
250	2	7	3B	Economy	100.00	Available
251	2	7	3C	Economy	100.00	Available
252	2	7	3D	Economy	100.00	Available
253	2	7	4A	Economy	100.00	Available
254	2	7	4B	Economy	100.00	Available
255	2	7	4C	Economy	100.00	Available
256	2	7	4D	Economy	100.00	Available
257	2	7	5A	Economy	100.00	Available
258	2	7	5B	Economy	100.00	Available
259	2	7	5C	Economy	100.00	Available
260	2	7	5D	Economy	100.00	Available
261	2	7	6A	Economy	100.00	Available
262	2	7	6B	Economy	100.00	Available
263	2	7	6C	Economy	100.00	Available
264	2	7	6D	Economy	100.00	Available
265	2	7	7A	Economy	100.00	Available
266	2	7	7B	Economy	100.00	Available
267	2	7	7C	Economy	100.00	Available
268	2	7	7D	Economy	100.00	Available
269	2	7	8A	Economy	100.00	Available
270	2	7	8B	Economy	100.00	Available
271	2	7	8C	Economy	100.00	Available
272	2	7	8D	Economy	100.00	Available
273	2	7	9A	Economy	100.00	Available
274	2	7	9B	Economy	100.00	Available
275	2	7	9C	Economy	100.00	Available
276	2	7	9D	Economy	100.00	Available
277	2	7	10A	Economy	100.00	Available
278	2	7	10B	Economy	100.00	Available
279	2	7	10C	Economy	100.00	Available
280	2	7	10D	Economy	100.00	Available
281	2	8	1A	Economy	100.00	Available
282	2	8	1B	Economy	100.00	Available
283	2	8	1C	Economy	100.00	Available
284	2	8	1D	Economy	100.00	Available
285	2	8	2A	Economy	100.00	Available
286	2	8	2B	Economy	100.00	Available
287	2	8	2C	Economy	100.00	Available
288	2	8	2D	Economy	100.00	Available
289	2	8	3A	Economy	100.00	Available
290	2	8	3B	Economy	100.00	Available
291	2	8	3C	Economy	100.00	Available
292	2	8	3D	Economy	100.00	Available
293	2	8	4A	Economy	100.00	Available
294	2	8	4B	Economy	100.00	Available
295	2	8	4C	Economy	100.00	Available
296	2	8	4D	Economy	100.00	Available
297	2	8	5A	Economy	100.00	Available
298	2	8	5B	Economy	100.00	Available
299	2	8	5C	Economy	100.00	Available
300	2	8	5D	Economy	100.00	Available
301	2	8	6A	Economy	100.00	Available
302	2	8	6B	Economy	100.00	Available
303	2	8	6C	Economy	100.00	Available
304	2	8	6D	Economy	100.00	Available
305	2	8	7A	Economy	100.00	Available
306	2	8	7B	Economy	100.00	Available
307	2	8	7C	Economy	100.00	Available
308	2	8	7D	Economy	100.00	Available
309	2	8	8A	Economy	100.00	Available
310	2	8	8B	Economy	100.00	Available
311	2	8	8C	Economy	100.00	Available
312	2	8	8D	Economy	100.00	Available
313	2	8	9A	Economy	100.00	Available
314	2	8	9B	Economy	100.00	Available
315	2	8	9C	Economy	100.00	Available
316	2	8	9D	Economy	100.00	Available
317	2	8	10A	Economy	100.00	Available
318	2	8	10B	Economy	100.00	Available
319	2	8	10C	Economy	100.00	Available
320	2	8	10D	Economy	100.00	Available
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, citizen_id, username, hashed_password, first_name, last_name, email, phone_number, dob, gender) FROM stdin;
\.


--
-- Name: aircrafts_aircraft_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.aircrafts_aircraft_id_seq', 3, true);


--
-- Name: airports_airport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.airports_airport_id_seq', 12668, true);


--
-- Name: bookings_booking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bookings_booking_id_seq', 12, true);


--
-- Name: flights_flight_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.flights_flight_id_seq', 8, true);


--
-- Name: news_news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.news_news_id_seq', 2, true);


--
-- Name: passengers_passenger_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.passengers_passenger_id_seq', 7, true);


--
-- Name: planes_aircraft_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.planes_aircraft_id_seq', 1, false);


--
-- Name: seats_seat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seats_seat_id_seq', 320, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 1, false);


--
-- Name: aircrafts aircrafts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aircrafts
    ADD CONSTRAINT aircrafts_pkey PRIMARY KEY (aircraft_id);


--
-- Name: airports airports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.airports
    ADD CONSTRAINT airports_pkey PRIMARY KEY (airport_id);


--
-- Name: bookings bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_pkey PRIMARY KEY (booking_id);


--
-- Name: flights flights_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flights
    ADD CONSTRAINT flights_pkey PRIMARY KEY (flight_id);


--
-- Name: news news_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_pkey PRIMARY KEY (news_id);


--
-- Name: passengers passengers_citizen_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passengers
    ADD CONSTRAINT passengers_citizen_id_key UNIQUE (citizen_id);


--
-- Name: passengers passengers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passengers
    ADD CONSTRAINT passengers_pkey PRIMARY KEY (passenger_id);


--
-- Name: passengers passengers_seat_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passengers
    ADD CONSTRAINT passengers_seat_id_key UNIQUE (seat_id);


--
-- Name: planes planes_aircraft_type_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planes
    ADD CONSTRAINT planes_aircraft_type_key UNIQUE (aircraft_type);


--
-- Name: planes planes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planes
    ADD CONSTRAINT planes_pkey PRIMARY KEY (aircraft_id);


--
-- Name: seats seats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seats
    ADD CONSTRAINT seats_pkey PRIMARY KEY (seat_id);


--
-- Name: users users_citizen_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_citizen_id_key UNIQUE (citizen_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: bookings fk_booking_flight; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT fk_booking_flight FOREIGN KEY (flight_id) REFERENCES public.flights(flight_id) ON DELETE SET NULL;


--
-- Name: flights fk_flight_aircraft; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flights
    ADD CONSTRAINT fk_flight_aircraft FOREIGN KEY (aircraft_id) REFERENCES public.aircrafts(aircraft_id) ON DELETE SET NULL;


--
-- Name: passengers fk_passenger_booking; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passengers
    ADD CONSTRAINT fk_passenger_booking FOREIGN KEY (booking_id) REFERENCES public.bookings(booking_id) ON DELETE SET NULL;


--
-- Name: passengers fk_passenger_seat; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passengers
    ADD CONSTRAINT fk_passenger_seat FOREIGN KEY (seat_id) REFERENCES public.seats(seat_id) ON DELETE SET NULL;


--
-- Name: seats fk_seat_aircraft; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seats
    ADD CONSTRAINT fk_seat_aircraft FOREIGN KEY (aircraft_id) REFERENCES public.aircrafts(aircraft_id) ON DELETE CASCADE;


--
-- Name: seats fk_seat_flight; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seats
    ADD CONSTRAINT fk_seat_flight FOREIGN KEY (flight_id) REFERENCES public.flights(flight_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

