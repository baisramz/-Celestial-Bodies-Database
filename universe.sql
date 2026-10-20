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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_type_id integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(12,2) NOT NULL,
    is_visible boolean NOT NULL,
    description text NOT NULL
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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    planet_id integer NOT NULL,
    orbital_period_days numeric(10,3) NOT NULL,
    radius_km integer NOT NULL,
    is_spherical boolean NOT NULL,
    description text NOT NULL
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
    name character varying(60) NOT NULL,
    star_id integer NOT NULL,
    planet_type character varying(30) NOT NULL,
    orbital_period_days integer NOT NULL,
    has_life boolean NOT NULL,
    description text NOT NULL
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
    name character varying(60) NOT NULL,
    galaxy_id integer NOT NULL,
    temperature_kelvin integer NOT NULL,
    solar_mass numeric(8,3) NOT NULL,
    is_main_sequence boolean NOT NULL,
    description text NOT NULL
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1, 13600, 0.00, true, 'Our home galaxy.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1, 10000, 2537000.00, true, 'The nearest large spiral galaxy.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 1, 12000, 2730000.00, true, 'A smaller spiral in the Local Group.');
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 3, 13000, 163000.00, true, 'A satellite irregular galaxy.');
INSERT INTO public.galaxy VALUES (5, 'Messier 87', 2, 13000, 53500000.00, false, 'A giant elliptical galaxy in Virgo.');
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 1, 13000, 29350000.00, true, 'A bright galaxy with a distinctive central bulge.');


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Spiral', 'A rotating disk with prominent arms.');
INSERT INTO public.galaxy_type VALUES (2, 'Elliptical', 'A smooth, rounded collection of stars.');
INSERT INTO public.galaxy_type VALUES (3, 'Irregular', 'A galaxy without a regular symmetrical shape.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 27.322, 1737, true, 'Earths only natural satellite.');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 0.319, 11, false, 'The larger of Mars two moons.');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 1.263, 6, false, 'The smaller outer moon of Mars.');
INSERT INTO public.moon VALUES (4, 'Io', 5, 1.769, 1821, true, 'A volcanically active moon of Jupiter.');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3.551, 1561, true, 'An icy moon with a subsurface ocean.');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 7.155, 2634, true, 'The largest moon in the solar system.');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 16.689, 2410, true, 'A heavily cratered moon of Jupiter.');
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 0.498, 84, false, 'A small inner moon of Jupiter.');
INSERT INTO public.moon VALUES (9, 'Himalia', 5, 250.566, 85, false, 'An irregular outer moon of Jupiter.');
INSERT INTO public.moon VALUES (10, 'Thebe', 5, 0.675, 49, false, 'A small inner moon of Jupiter.');
INSERT INTO public.moon VALUES (11, 'Mimas', 6, 0.942, 198, true, 'A small moon with a large crater.');
INSERT INTO public.moon VALUES (12, 'Enceladus', 6, 1.370, 252, true, 'An icy moon with active geysers.');
INSERT INTO public.moon VALUES (13, 'Tethys', 6, 1.888, 531, true, 'An icy moon of Saturn.');
INSERT INTO public.moon VALUES (14, 'Dione', 6, 2.737, 561, true, 'A moon with bright ice cliffs.');
INSERT INTO public.moon VALUES (15, 'Rhea', 6, 4.518, 764, true, 'The second-largest moon of Saturn.');
INSERT INTO public.moon VALUES (16, 'Titan', 6, 15.945, 2575, true, 'A moon with lakes of liquid hydrocarbons.');
INSERT INTO public.moon VALUES (17, 'Hyperion', 6, 21.277, 135, false, 'A porous, irregularly shaped moon.');
INSERT INTO public.moon VALUES (18, 'Iapetus', 6, 79.321, 734, true, 'A moon with contrasting bright and dark hemispheres.');
INSERT INTO public.moon VALUES (19, 'Miranda', 7, 1.413, 236, true, 'A moon with an unusually varied surface.');
INSERT INTO public.moon VALUES (20, 'Ariel', 7, 2.520, 579, true, 'A bright icy moon of Uranus.');
INSERT INTO public.moon VALUES (21, 'Umbriel', 7, 4.144, 585, true, 'A dark moon of Uranus.');
INSERT INTO public.moon VALUES (22, 'Titania', 7, 8.706, 789, true, 'The largest moon of Uranus.');
INSERT INTO public.moon VALUES (23, 'Oberon', 7, 13.463, 761, true, 'An outer moon of Uranus.');
INSERT INTO public.moon VALUES (24, 'Triton', 8, 5.877, 1353, true, 'A large retrograde moon of Neptune.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', 88, false, 'The smallest planet in our solar system.');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', 225, false, 'A rocky world with a dense atmosphere.');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', 365, true, 'The only known world with life.');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', 687, false, 'A cold desert world.');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas giant', 4333, false, 'The largest planet in our solar system.');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas giant', 10759, false, 'A gas giant famous for its rings.');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice giant', 30687, false, 'An ice giant that rotates on its side.');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice giant', 60190, false, 'A distant blue ice giant.');
INSERT INTO public.planet VALUES (9, 'Sirius b', 2, 'Terrestrial', 780, false, 'A fictional survey planet orbiting Sirius.');
INSERT INTO public.planet VALUES (10, 'Proxima b', 3, 'Terrestrial', 11, false, 'An exoplanet orbiting Proxima Centauri.');
INSERT INTO public.planet VALUES (11, 'Vega b', 5, 'Gas giant', 1200, false, 'A fictional gas giant orbiting Vega.');
INSERT INTO public.planet VALUES (12, 'Rigel b', 6, 'Gas giant', 900, false, 'A fictional gas giant orbiting Rigel.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 5778, 1.000, true, 'The star at the center of our solar system.');
INSERT INTO public.star VALUES (2, 'Sirius', 1, 9940, 2.063, true, 'The brightest star in Earths night sky.');
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 1, 3042, 0.122, true, 'The closest known star to the Sun.');
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 3500, 16.500, false, 'A red supergiant in Orion.');
INSERT INTO public.star VALUES (5, 'Vega', 1, 9602, 2.135, true, 'A bright star in the constellation Lyra.');
INSERT INTO public.star VALUES (6, 'Rigel', 1, 12100, 21.000, false, 'A luminous blue supergiant.');
INSERT INTO public.star VALUES (7, 'Andromeda Alpha', 2, 8500, 1.800, true, 'A representative star in Andromeda.');
INSERT INTO public.star VALUES (8, 'Triangulum Alpha', 3, 7200, 1.400, true, 'A representative star in Triangulum.');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


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
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


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
-- Name: galaxy galaxy_galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_id_fkey FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


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

