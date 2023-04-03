--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(20) NOT NULL,
    eng_name character varying(20),
    vi_name character varying(20),
    meaning character varying(255),
    quadrant_id integer,
    is_zodiacal boolean
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    radius_in_ly integer,
    age_in_billion_year double precision,
    distance_from_earth_in_ly integer,
    galaxy_type_id integer
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
    name character varying(15) NOT NULL,
    description text
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
    name character varying(20) NOT NULL,
    planet_id integer,
    year_discovery integer,
    sidereal_period_in_day numeric(6,3)
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
    name character varying(25) NOT NULL,
    has_life boolean,
    star_id integer,
    radius_earth double precision,
    mass_earth double precision,
    temperature_in_celsius double precision,
    orbital_period_in_day double precision
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
-- Name: quadrant; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.quadrant (
    quadrant_id integer NOT NULL,
    name character varying(3) NOT NULL,
    delineation character varying(255)
);


ALTER TABLE public.quadrant OWNER TO freecodecamp;

--
-- Name: quadrant_quadrant_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.quadrant_quadrant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quadrant_quadrant_id_seq OWNER TO freecodecamp;

--
-- Name: quadrant_quadrant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.quadrant_quadrant_id_seq OWNED BY public.quadrant.quadrant_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer,
    constellation_id integer,
    distance_from_earth_in_ly integer,
    age_in_million_year double precision,
    mass_solar double precision,
    radius_solar double precision,
    temperature_in_celsius integer
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Name: quadrant quadrant_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.quadrant ALTER COLUMN quadrant_id SET DEFAULT nextval('public.quadrant_quadrant_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Lyra', 'Lyr', 'Thien Cam', 'Cay dan lyr', 7, false);
INSERT INTO public.constellation VALUES (2, 'Hercules', 'Hercules', 'Vu Tien', 'Dung si Hercules', 5, false);
INSERT INTO public.constellation VALUES (3, 'Centaurus', 'Centaur', 'Ban Nhan Ma', 'Nhan ma ', 7, false);
INSERT INTO public.constellation VALUES (4, 'Canis Major', 'Greater Dog', 'Dai Khuyen', 'Cho lon ', 6, false);
INSERT INTO public.constellation VALUES (5, 'Scutum', 'Shield (of Sobieski)', 'La Chan', 'Khien cua vua Sobieski ', 2, false);
INSERT INTO public.constellation VALUES (6, 'Scorpius', 'Scorpion', 'Bo Cap', 'Con bo cap ', 7, true);
INSERT INTO public.constellation VALUES (7, 'Sagittarius', 'Archer', 'Cung thu', 'Nguoi ban cung ', 2, true);
INSERT INTO public.constellation VALUES (10, 'Aquarius', 'Water Bearer', 'Bao Binh', 'Nguoi ganh nuoc', 2, true);
INSERT INTO public.constellation VALUES (12, 'Aries', 'Ram', 'Bach Duong', 'Con cuu trang', 4, true);
INSERT INTO public.constellation VALUES (13, 'Taurus', 'Bull', 'Kim Nguu', 'Con trau vang', 4, true);
INSERT INTO public.constellation VALUES (14, 'Gemini', 'Twins', 'Song Tu', 'Cap sinh doi', 5, true);
INSERT INTO public.constellation VALUES (15, 'Cancer', 'Crab', 'Cu Giai', 'Con cua', 5, true);
INSERT INTO public.constellation VALUES (16, 'Leo', 'Lion', 'Su Tu', 'Con su tu', 5, true);
INSERT INTO public.constellation VALUES (17, 'Virgo', 'Virgin', 'Trinh Nu', 'Nguoi trinh nu', 7, true);
INSERT INTO public.constellation VALUES (18, 'Libra', 'Scales', 'Thien Binh', 'Cai can robecvan', 7, true);
INSERT INTO public.constellation VALUES (19, 'Ophiuchus', 'Serpent Bearer', 'Xa Phu', 'Nguoi giu ran', 1, true);
INSERT INTO public.constellation VALUES (11, 'Pisces', 'Fishes', 'Song Ngu', 'Hai con ca', 4, true);
INSERT INTO public.constellation VALUES (8, 'Ursa Major', 'Great Bear', 'Dai Hung', 'Gau lon', 3, false);
INSERT INTO public.constellation VALUES (9, 'Capricornus', 'Sea Goat', 'Ma ket', 'De bien', 2, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 52850, 13.61, 25800, 1);
INSERT INTO public.galaxy VALUES (2, 'Canis Major Dwarf', 75047, NULL, 25000, 4);
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 7000, 1.101, 158200, 4);
INSERT INTO public.galaxy VALUES (4, 'Andromeda Galaxy', 110000, 10.01, 2537000, 1);
INSERT INTO public.galaxy VALUES (5, 'Sculptor Galaxy', 45000, 5.7, 11420000, 1);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 25000, 13.25, 29350000, 1);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Spiral', 'Wide, flat disks of ratating gas and dust');
INSERT INTO public.galaxy_type VALUES (2, 'Elliptical', 'Oblong shape and lack of overall structure. Some are nearly spherical, while others are shaped more like a cigar');
INSERT INTO public.galaxy_type VALUES (3, 'Penculiar', 'Penculiar galaxies are almost always the result of galactic collisions');
INSERT INTO public.galaxy_type VALUES (4, 'Irregular', 'These galaxies tend to be small, dwarf galaxies that lack any distinguishable shape');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 7, NULL, 27.322);
INSERT INTO public.moon VALUES (2, 'Deimos', 8, 1877, 0.319);
INSERT INTO public.moon VALUES (3, 'Phobos', 8, 1877, 1.262);
INSERT INTO public.moon VALUES (4, 'Amalthea', 9, 1892, 0.498);
INSERT INTO public.moon VALUES (5, 'Callisto', 9, 1610, 16.690);
INSERT INTO public.moon VALUES (7, 'Ganymede', 9, 1610, 7.155);
INSERT INTO public.moon VALUES (8, 'Io', 9, 1610, 1.769);
INSERT INTO public.moon VALUES (9, 'Dione', 10, 1684, 2.737);
INSERT INTO public.moon VALUES (11, 'Hyperion', 10, 1848, 21.280);
INSERT INTO public.moon VALUES (13, 'Mimas', 10, 1789, 0.942);
INSERT INTO public.moon VALUES (14, 'Phoebe', 10, 1899, 550.310);
INSERT INTO public.moon VALUES (15, 'Rhea', 10, 1672, 4.518);
INSERT INTO public.moon VALUES (16, 'Tethys', 10, 1684, 1.888);
INSERT INTO public.moon VALUES (17, 'Titan', 10, 1655, 15.950);
INSERT INTO public.moon VALUES (18, 'Ariel', 12, 1851, 2.520);
INSERT INTO public.moon VALUES (19, 'Miranda', 12, 1948, 1.413);
INSERT INTO public.moon VALUES (20, 'Oberon', 12, 1787, 13.460);
INSERT INTO public.moon VALUES (21, 'Titania', 12, 1787, 8.706);
INSERT INTO public.moon VALUES (22, 'Umbriel', 12, 1851, 4.144);
INSERT INTO public.moon VALUES (23, 'Nereid', 13, 1949, 360.140);
INSERT INTO public.moon VALUES (24, 'Triton', 13, 1846, 5.877);
INSERT INTO public.moon VALUES (10, 'Enceladus', 10, 1789, 1.370);
INSERT INTO public.moon VALUES (12, 'Iapetus', 10, 1671, 79.330);
INSERT INTO public.moon VALUES (6, 'Europa', 9, 1610, 3.551);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Proxima Centauri b', false, 8, NULL, 1.07, -39, 11.2);
INSERT INTO public.planet VALUES (2, 'Proxima Centauri d', false, 8, NULL, 0.26, 87, 5.1);
INSERT INTO public.planet VALUES (3, 'Gliese 411 b', false, 9, NULL, 2.64, NULL, 12.9);
INSERT INTO public.planet VALUES (4, 'Gliese 411 c', false, 9, NULL, 14.2, NULL, 2806);
INSERT INTO public.planet VALUES (5, 'Mercury', false, 1, 0.67, 0.055, 164, 115.88);
INSERT INTO public.planet VALUES (6, 'Venus', false, 1, 0.95, 0.815, -41, 583.92);
INSERT INTO public.planet VALUES (7, 'Earth', true, 1, 1, 1, 13.9, 365.25);
INSERT INTO public.planet VALUES (8, 'Mars', false, 1, 0.53, 0.107, -64, 686.98);
INSERT INTO public.planet VALUES (9, 'Jupiter', false, 1, 10.97, 317.8, -185, 398.88);
INSERT INTO public.planet VALUES (10, 'Saturn', false, 1, 9.14, 95.16, -176, 10759.22);
INSERT INTO public.planet VALUES (12, 'Uranus', false, 1, 3.98, 14.5, -214, 30688.5);
INSERT INTO public.planet VALUES (13, 'NNeptune', false, 1, 33.86, 17.15, -2125, 60195);


--
-- Data for Name: quadrant; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.quadrant VALUES (1, 'NQ1', '0-90 degree of the North');
INSERT INTO public.quadrant VALUES (2, 'SQ1', '0-90 degree of the South');
INSERT INTO public.quadrant VALUES (3, 'NQ2', '90-180 degree of the North');
INSERT INTO public.quadrant VALUES (4, 'SQ2', '90-180 degree of the South');
INSERT INTO public.quadrant VALUES (5, 'NQ3', '180-270 degree of the North');
INSERT INTO public.quadrant VALUES (6, 'SQ3', '180-270 degree of the South');
INSERT INTO public.quadrant VALUES (7, 'NQ4', '270-360 degree of the North');
INSERT INTO public.quadrant VALUES (8, 'SQ4', '270-360 degree of the South');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, NULL, 0, 4603, 1, 1, 5499);
INSERT INTO public.star VALUES (2, 'VY Canis Majoris', 2, 4, 4892, 8.2, 17, 1420, 3217);
INSERT INTO public.star VALUES (3, 'UY Scuti', 1, 5, 9459, NULL, 8, 755, 3365);
INSERT INTO public.star VALUES (4, 'Sigma Canis Majoris', 2, 4, 1300, 16.4, 12.3, 399, 3437);
INSERT INTO public.star VALUES (5, 'Antares', 1, 6, 554, 11, 12, 680, 3387);
INSERT INTO public.star VALUES (6, 'Pistol Star ', 1, 7, 26090, 4, 27.5, 420, 11527);
INSERT INTO public.star VALUES (7, 'Stephenson 2-18', 1, 5, 19570, 14, NULL, 2150, 2927);
INSERT INTO public.star VALUES (8, 'Proxima Centauri', 1, 3, 4246, 4850, 0.1221, 0.1542, 2719);
INSERT INTO public.star VALUES (9, 'Gliese 411', 1, 8, 8307, NULL, 0.389, 0.392, 3547);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 19, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 4, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: quadrant_quadrant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.quadrant_quadrant_id_seq', 8, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: quadrant quadrant_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.quadrant
    ADD CONSTRAINT quadrant_pkey PRIMARY KEY (quadrant_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: constellation uni_constellation_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT uni_constellation_name UNIQUE (name);


--
-- Name: galaxy uni_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT uni_galaxy_name UNIQUE (name);


--
-- Name: galaxy_type uni_galaxy_type_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT uni_galaxy_type_name UNIQUE (name);


--
-- Name: moon uni_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT uni_moon_name UNIQUE (name);


--
-- Name: planet uni_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT uni_planet_name UNIQUE (name);


--
-- Name: quadrant uni_quadrant_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.quadrant
    ADD CONSTRAINT uni_quadrant_name UNIQUE (name);


--
-- Name: star uni_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT uni_star_name UNIQUE (name);


--
-- Name: constellation constellation_quadrant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_quadrant_id_fkey FOREIGN KEY (quadrant_id) REFERENCES public.quadrant(quadrant_id);


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
-- Name: star star_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

