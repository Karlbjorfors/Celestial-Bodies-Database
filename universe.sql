--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    mass numeric(10,2) NOT NULL,
    is_periodic boolean NOT NULL,
    discovery_year integer
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: come_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.come_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.come_comet_id_seq OWNER TO freecodecamp;

--
-- Name: come_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.come_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    age integer NOT NULL,
    has_life boolean NOT NULL,
    num_stars bigint
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    diameter integer NOT NULL,
    is_geologically_active boolean NOT NULL,
    composition text NOT NULL,
    orbital_period numeric(8,2)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    mass numeric(12,3) NOT NULL,
    has_life boolean NOT NULL,
    planet_type character varying(50) NOT NULL,
    distance_from_star integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    type character varying(50) NOT NULL,
    age integer NOT NULL,
    is_binary boolean NOT NULL,
    luminosity numeric(10,2)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.come_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 'Famous periodic comet', 2.20, true, 1758);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 'Very bright comet', 3.00, false, 1995);
INSERT INTO public.comet VALUES (3, 'Encke', 'Shortest known period', 1.70, true, 1786);
INSERT INTO public.comet VALUES (4, 'Hyakutake', 'Great comet of 1996', 2.50, false, 1996);
INSERT INTO public.comet VALUES (5, 'Tempel 1', 'Target of Deep Impact mission', 1.50, true, 1867);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 13600, true, 100000000000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest spiral galaxy', 10000, false, 1000000000000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Third largest in Local Group', 9000, false, 40000000000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Interacting grand-design spiral', 8000, false, 100000000000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Unusual bright nucleus', 11000, false, 80000000000);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Face-on spiral galaxy', 7000, false, 100000000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 3474, false, 'Rocky', 27.30);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 22, false, 'Rocky', 0.30);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 12, false, 'Rocky', 1.30);
INSERT INTO public.moon VALUES (4, 'Io', 3, 3643, true, 'Volcanic', 1.80);
INSERT INTO public.moon VALUES (5, 'Europa', 3, 3122, false, 'Icy', 3.50);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 5268, false, 'Icy', 7.10);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 4820, false, 'Icy', 16.70);
INSERT INTO public.moon VALUES (8, 'Amalthea', 3, 250, false, 'Rocky', 0.50);
INSERT INTO public.moon VALUES (9, 'Metis', 3, 43, false, 'Rocky', 0.30);
INSERT INTO public.moon VALUES (10, 'Adrastea', 3, 20, false, 'Rocky', 0.30);
INSERT INTO public.moon VALUES (11, 'Venus Moon 1', 4, 10, false, 'Rocky', 2.00);
INSERT INTO public.moon VALUES (12, 'Mercury Moon 1', 5, 15, false, 'Rocky', 1.50);
INSERT INTO public.moon VALUES (13, 'Sirius b Moon 1', 6, 30, false, 'Icy', 3.00);
INSERT INTO public.moon VALUES (14, 'Alpha Centauri Bb Moon 1', 7, 25, false, 'Rocky', 2.50);
INSERT INTO public.moon VALUES (15, 'Proxima b Moon 1', 8, 18, false, 'Icy', 1.80);
INSERT INTO public.moon VALUES (16, 'Andromeda Moon 1', 9, 40, false, 'Rocky', 4.00);
INSERT INTO public.moon VALUES (17, 'Triangulum Moon 1', 10, 22, false, 'Rocky', 2.20);
INSERT INTO public.moon VALUES (18, 'Triangulum Moon 2', 11, 28, false, 'Icy', 3.10);
INSERT INTO public.moon VALUES (19, 'Triangulum Moon 3', 12, 35, false, 'Icy', 4.50);
INSERT INTO public.moon VALUES (20, 'Triangulum Moon 4', 12, 20, false, 'Rocky', 1.90);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 5.972, true, 'Terrestrial', 150);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 0.641, false, 'Terrestrial', 228);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 1898.000, false, 'Gas Giant', 778);
INSERT INTO public.planet VALUES (4, 'Venus', 1, 4.867, false, 'Terrestrial', 108);
INSERT INTO public.planet VALUES (5, 'Mercury', 1, 0.330, false, 'Terrestrial', 58);
INSERT INTO public.planet VALUES (6, 'Sirius b Planet 1', 2, 2.500, false, 'Ice Giant', 300);
INSERT INTO public.planet VALUES (7, 'Alpha Centauri Bb', 3, 1.100, false, 'Terrestrial', 110);
INSERT INTO public.planet VALUES (8, 'Proxima b', 4, 1.300, false, 'Terrestrial', 40);
INSERT INTO public.planet VALUES (9, 'Andromeda Planet 1', 5, 3.200, false, 'Gas Giant', 500);
INSERT INTO public.planet VALUES (10, 'Triangulum Planet 1', 6, 0.900, false, 'Terrestrial', 120);
INSERT INTO public.planet VALUES (11, 'Triangulum Planet 2', 6, 2.200, false, 'Gas Giant', 400);
INSERT INTO public.planet VALUES (12, 'Triangulum Planet 3', 6, 1.500, false, 'Ice Giant', 700);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-type', 4600, false, 1.00);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'A-type', 242, true, 25.40);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 1, 'G-type', 5000, true, 1.52);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, 'M-type', 4500, false, 0.00);
INSERT INTO public.star VALUES (5, 'Andromeda Star 1', 2, 'F-type', 3000, false, 2.10);
INSERT INTO public.star VALUES (6, 'Triangulum Star 1', 3, 'K-type', 2000, false, 0.80);


--
-- Name: come_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.come_comet_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet come_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT come_name_key UNIQUE (name);


--
-- Name: comet come_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT come_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

