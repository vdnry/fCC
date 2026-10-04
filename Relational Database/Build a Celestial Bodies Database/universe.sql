--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: astronaut; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.astronaut (
    astronaut_id integer NOT NULL,
    name character varying(30),
    moon_id integer NOT NULL
);


ALTER TABLE public.astronaut OWNER TO freecodecamp;

--
-- Name: astronaut_astronaut_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.astronaut_astronaut_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.astronaut_astronaut_id_seq OWNER TO freecodecamp;

--
-- Name: astronaut_astronaut_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.astronaut_astronaut_id_seq OWNED BY public.astronaut.astronaut_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric(6,2) NOT NULL,
    distance_from_earth integer,
    radius integer
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
    name character varying(30),
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric(6,2) NOT NULL,
    distance_from_earth integer,
    radius integer,
    planet_id integer
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
    name character varying(30),
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric(6,2) NOT NULL,
    distance_from_earth integer,
    radius integer,
    star_id integer
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
    name character varying(30),
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric(6,2) NOT NULL,
    distance_from_earth integer,
    radius integer,
    galaxy_id integer
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
-- Name: astronaut astronaut_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronaut ALTER COLUMN astronaut_id SET DEFAULT nextval('public.astronaut_astronaut_id_seq'::regclass);


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
-- Data for Name: astronaut; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.astronaut VALUES (1, 'Astronaut1', 1);
INSERT INTO public.astronaut VALUES (2, 'Astronaut2', 1);
INSERT INTO public.astronaut VALUES (3, 'Astronaut3', 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'galaxy1', 'Some description...', true, true, 1000.01, 9, 9000);
INSERT INTO public.galaxy VALUES (2, 'galaxy2', 'Some description...', false, true, 1234.56, 112458, 8045);
INSERT INTO public.galaxy VALUES (3, 'galaxy3', 'Some description...', false, false, 1824.01, 1284124, 1924);
INSERT INTO public.galaxy VALUES (4, 'galaxy4', 'Some description...', false, true, 1818.95, 1934315, 1531);
INSERT INTO public.galaxy VALUES (5, 'galaxy5', 'Some description...', false, false, 1533.13, 18353, 1384);
INSERT INTO public.galaxy VALUES (6, 'galaxy6', 'Some description...', false, false, 1325.12, 135135, 1835);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon1', 'Some description...', true, true, 1000.01, 9, 9000, 1);
INSERT INTO public.moon VALUES (2, 'moon2', 'Some description...', false, true, 1234.56, 112458, 8045, 2);
INSERT INTO public.moon VALUES (3, 'moon3', 'Some description...', false, false, 1824.01, 1284124, 1924, 5);
INSERT INTO public.moon VALUES (4, 'moon4', 'Some description...', false, true, 1818.95, 1934315, 1531, 6);
INSERT INTO public.moon VALUES (5, 'moon5', 'Some description...', false, false, 1533.13, 18353, 1384, 3);
INSERT INTO public.moon VALUES (6, 'moon6', 'Some description...', false, false, 1325.12, 135135, 1835, 5);
INSERT INTO public.moon VALUES (7, 'moon7', 'Some description...', true, true, 1000.01, 9, 9000, 1);
INSERT INTO public.moon VALUES (8, 'moon8', 'Some description...', false, true, 1234.56, 112458, 8045, 2);
INSERT INTO public.moon VALUES (9, 'moon9', 'Some description...', false, false, 1824.01, 1284124, 1924, 5);
INSERT INTO public.moon VALUES (10, 'moon10', 'Some description...', false, true, 1818.95, 1934315, 1531, 6);
INSERT INTO public.moon VALUES (11, 'moon11', 'Some description...', false, false, 1533.13, 18353, 1384, 3);
INSERT INTO public.moon VALUES (12, 'moon12', 'Some description...', false, false, 1325.12, 135135, 1835, 5);
INSERT INTO public.moon VALUES (13, 'moon13', 'Some description...', true, true, 1000.01, 9, 9000, 1);
INSERT INTO public.moon VALUES (14, 'moon14', 'Some description...', false, true, 1234.56, 112458, 8045, 2);
INSERT INTO public.moon VALUES (15, 'moon15', 'Some description...', false, false, 1824.01, 1284124, 1924, 5);
INSERT INTO public.moon VALUES (16, 'moon16', 'Some description...', false, true, 1818.95, 1934315, 1531, 6);
INSERT INTO public.moon VALUES (17, 'moon17', 'Some description...', false, false, 1533.13, 18353, 1384, 3);
INSERT INTO public.moon VALUES (18, 'moon18', 'Some description...', false, false, 1325.12, 135135, 1835, 5);
INSERT INTO public.moon VALUES (19, 'moon19', 'Some description...', true, true, 1000.01, 9, 9000, 1);
INSERT INTO public.moon VALUES (20, 'moon20', 'Some description...', false, true, 1234.56, 112458, 8045, 2);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'planet1', 'Some description...', true, true, 1000.01, 9, 9000, 1);
INSERT INTO public.planet VALUES (2, 'planet2', 'Some description...', false, true, 1234.56, 112458, 8045, 2);
INSERT INTO public.planet VALUES (3, 'planet3', 'Some description...', false, false, 1824.01, 1284124, 1924, 5);
INSERT INTO public.planet VALUES (4, 'planet4', 'Some description...', false, true, 1818.95, 1934315, 1531, 6);
INSERT INTO public.planet VALUES (5, 'planet5', 'Some description...', false, false, 1533.13, 18353, 1384, 3);
INSERT INTO public.planet VALUES (6, 'planet6', 'Some description...', false, false, 1325.12, 135135, 1835, 5);
INSERT INTO public.planet VALUES (7, 'planet7', 'Some description...', true, true, 1000.01, 9, 9000, 1);
INSERT INTO public.planet VALUES (8, 'planet8', 'Some description...', false, true, 1234.56, 112458, 8045, 2);
INSERT INTO public.planet VALUES (9, 'planet9', 'Some description...', false, false, 1824.01, 1284124, 1924, 5);
INSERT INTO public.planet VALUES (10, 'planet10', 'Some description...', false, true, 1818.95, 1934315, 1531, 6);
INSERT INTO public.planet VALUES (11, 'planet11', 'Some description...', false, false, 1533.13, 18353, 1384, 3);
INSERT INTO public.planet VALUES (12, 'planet12', 'Some description...', false, false, 1325.12, 135135, 1835, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'star1', 'Some description...', true, true, 1000.01, 9, 9000, 1);
INSERT INTO public.star VALUES (2, 'star2', 'Some description...', false, true, 1234.56, 112458, 8045, 2);
INSERT INTO public.star VALUES (3, 'star3', 'Some description...', false, false, 1824.01, 1284124, 1924, 5);
INSERT INTO public.star VALUES (4, 'star4', 'Some description...', false, true, 1818.95, 1934315, 1531, 6);
INSERT INTO public.star VALUES (5, 'star5', 'Some description...', false, false, 1533.13, 18353, 1384, 3);
INSERT INTO public.star VALUES (6, 'star6', 'Some description...', false, false, 1325.12, 135135, 1835, 5);


--
-- Name: astronaut_astronaut_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.astronaut_astronaut_id_seq', 3, true);


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
-- Name: astronaut astronaut_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronaut
    ADD CONSTRAINT astronaut_name_key UNIQUE (name);


--
-- Name: astronaut astronaut_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronaut
    ADD CONSTRAINT astronaut_pkey PRIMARY KEY (astronaut_id);


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
-- Name: astronaut astronaut_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronaut
    ADD CONSTRAINT astronaut_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


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

