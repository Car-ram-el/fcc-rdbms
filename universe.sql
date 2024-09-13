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
-- Name: crater; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.crater (
    crater_id integer NOT NULL,
    name character varying(40) NOT NULL,
    c_desc text,
    has_life boolean,
    has_death boolean,
    age integer,
    humans integer,
    depth numeric(10,2)
);


ALTER TABLE public.crater OWNER TO freecodecamp;

--
-- Name: crater_crater_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.crater_crater_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.crater_crater_id_seq OWNER TO freecodecamp;

--
-- Name: crater_crater_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.crater_crater_id_seq OWNED BY public.crater.crater_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    g_desc text,
    has_life boolean,
    has_death boolean,
    age integer,
    humans integer,
    color numeric(10,2)
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
    name character varying(40) NOT NULL,
    m_desc text,
    has_life boolean,
    has_death boolean,
    age integer,
    humans integer,
    color numeric(10,2),
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
    name character varying(40) NOT NULL,
    p_desc text,
    has_life boolean,
    has_death boolean,
    age integer,
    humans integer,
    color numeric(10,2),
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
    name character varying(40) NOT NULL,
    s_desc text,
    has_life boolean,
    has_death boolean,
    age integer,
    humans integer,
    brightness numeric(10,2),
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
-- Name: crater crater_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.crater ALTER COLUMN crater_id SET DEFAULT nextval('public.crater_crater_id_seq'::regclass);


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
-- Data for Name: crater; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.crater VALUES (1, 'Boomblam', 'A massive crater formed by a cosmic explosion, still radiating heat.', false, true, 800, 0, 12.34);
INSERT INTO public.crater VALUES (2, 'Whisperhole', 'A silent crater that absorbs sound, creating an eerie quiet zone.', false, false, 500, 0, 4.56);
INSERT INTO public.crater VALUES (3, 'Gloopgash', 'A slimy, sticky crater filled with bubbling goo, rumored to have strange life forms.', true, false, 300, 50, 7.89);
INSERT INTO public.crater VALUES (4, 'Razzledazzle', 'A dazzling crater with sparkling mineral deposits that light up under moonlight.', false, false, 600, 0, 3.45);
INSERT INTO public.crater VALUES (5, 'Sizzlepit', 'A steaming crater with constant geysers, filled with toxic vapors.', false, true, 1000, 0, 9.01);
INSERT INTO public.crater VALUES (6, 'Bouncebowl', 'A springy crater with a rubber-like surface, used for zero-gravity sports.', true, false, 400, 20, 5.67);
INSERT INTO public.crater VALUES (7, 'Glowgorge', 'A glowing crater that emits a soft, neon light, believed to have mysterious origins.', true, true, 700, 100, 8.23);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Zogron', 'A chaotic galaxy filled with glowing nebulae and unpredictable starbursts.', true, false, 5400, 1200, 6.42);
INSERT INTO public.galaxy VALUES (2, 'Blipzorp', 'A tiny, vibrant galaxy famous for its neon-green stars and wild space parties.', true, true, 2300, 500, 7.89);
INSERT INTO public.galaxy VALUES (3, 'Nebulon 9', 'A galaxy where gravity seems to dance, creating spiral arms that wiggle.', false, false, 4800, 0, 3.14);
INSERT INTO public.galaxy VALUES (4, 'Glimmerax', 'Known for its shimmering, crystal-like stars that twinkle in rainbow hues.', false, true, 6500, 0, 8.56);
INSERT INTO public.galaxy VALUES (5, 'Wobblewoo', 'A galaxy that wobbles in space, confusing astronomers with its unpredictable orbit.', true, false, 7200, 300, 2.22);
INSERT INTO public.galaxy VALUES (6, 'Fuzzlebub', 'Filled with fuzzy, pastel-colored stars that look like cosmic cotton candy.', true, true, 1500, 800, 5.67);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (5, 'Crackle', 'A fiery moon with an ever-cracking surface, constantly breaking and reforming.', false, true, 2200, 0, 7.67, 7);
INSERT INTO public.moon VALUES (10, 'Cheesoid', 'A moon that looks and smells like cheese, complete with craters like Swiss holes.', true, false, 1100, 80, 1.77, 7);
INSERT INTO public.moon VALUES (15, 'Gigglemoon', 'A moon that emits soft giggling sounds, believed to be due to tiny sound stones.', true, false, 900, 200, 3.14, 7);
INSERT INTO public.moon VALUES (20, 'Flutterby', 'A moon filled with flying creatures resembling cosmic butterflies.', true, true, 1600, 100, 3.88, 7);
INSERT INTO public.moon VALUES (1, 'Luminara', 'A glowing moon with a radiant surface that lights up the night sky.', true, false, 1200, 300, 6.14, 8);
INSERT INTO public.moon VALUES (6, 'Jellymoon', 'A gelatinous moon that wobbles in space and changes shape under pressure.', true, true, 1400, 200, 5.89, 8);
INSERT INTO public.moon VALUES (11, 'Blorpt', 'A slimy, ooze-covered moon that’s strangely home to many bizarre life forms.', true, true, 1300, 150, 4.99, 8);
INSERT INTO public.moon VALUES (16, 'Glowbug', 'A bioluminescent moon crawling with tiny glowing creatures.', true, true, 1700, 50, 4.44, 8);
INSERT INTO public.moon VALUES (3, 'Bloop', 'A bouncy moon with a squishy surface, fun for cosmic trampoline parties.', true, false, 900, 100, 2.33, 10);
INSERT INTO public.moon VALUES (8, 'Shadowveil', 'A dark, mysterious moon that absorbs light, shrouded in permanent twilight.', false, false, 2500, 0, 0.88, 10);
INSERT INTO public.moon VALUES (13, 'Snugglefluff', 'A cozy, fluffy moon with soft, cloud-like terrain perfect for naps.', true, false, 1500, 300, 2.20, 10);
INSERT INTO public.moon VALUES (18, 'Whisp', 'A delicate moon that seems to fade in and out of visibility, like a mirage.', false, false, 2400, 0, 1.09, 10);
INSERT INTO public.moon VALUES (4, 'Dustbunny', 'A small, fluffy moon with dust clouds that swirl in the slightest breeze.', false, false, 2000, 0, 1.45, 12);
INSERT INTO public.moon VALUES (9, 'Fizzgig', 'A bubbly moon with gaseous pockets that burst in fizzy explosions.', false, true, 800, 0, 6.33, 12);
INSERT INTO public.moon VALUES (14, 'Zizzle', 'A zippy moon with strong winds, constantly blowing in spiral patterns.', false, true, 700, 0, 7.42, 12);
INSERT INTO public.moon VALUES (19, 'Puddlehop', 'A moon with shimmering pools of liquid that ripple with every movement.', true, false, 1300, 400, 6.58, 12);
INSERT INTO public.moon VALUES (2, 'Glimmerglobe', 'A sparkling moon covered in reflective crystals, shining like a disco ball.', false, true, 1800, 0, 4.78, 1);
INSERT INTO public.moon VALUES (7, 'Pebblepop', 'A rocky moon filled with popping geysers that shoot colorful pebbles.', true, false, 1600, 50, 3.12, 1);
INSERT INTO public.moon VALUES (12, 'Shimmerdust', 'Covered in shimmering dust that sparkles with every step.', false, false, 2100, 0, 5.01, 1);
INSERT INTO public.moon VALUES (17, 'Quasaroo', 'A fast-spinning moon with a colorful aurora that changes every minute.', false, false, 1900, 0, 8.35, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Glorbon', 'A shimmering blue planet with floating crystal mountains and constant rainfall.', true, false, 3200, 500, 4.56, 2);
INSERT INTO public.planet VALUES (9, 'Globulex', 'A molten, volcanic world constantly reshaping itself with rivers of lava.', false, false, 5100, 0, 9.76, 2);
INSERT INTO public.planet VALUES (4, 'Kroznak', 'An icy world where towering glaciers slowly dance under a pale green sky.', false, false, 4500, 0, 1.88, 3);
INSERT INTO public.planet VALUES (5, 'Blimblor', 'A desert planet with sand dunes that sing in the wind and ancient, mysterious ruins.', true, false, 3100, 50, 6.23, 3);
INSERT INTO public.planet VALUES (6, 'Wizzlewump', 'A lively jungle world with oversized plants and peculiar, bouncing creatures.', true, true, 2800, 1000, 2.34, 3);
INSERT INTO public.planet VALUES (8, 'Mugglin', 'Covered in thick, toxic fog, this planet is uninhabitable but oddly beautiful.', false, true, 4700, 0, 8.15, 3);
INSERT INTO public.planet VALUES (2, 'Zogorax', 'Known for its bizarre flora that glows in the dark, making nights as bright as days.', true, true, 1500, 200, 3.21, 5);
INSERT INTO public.planet VALUES (7, 'Quirkoid', 'A quirky planet where gravity fluctuates, causing objects to randomly float.', true, false, 3900, 150, 7.89, 5);
INSERT INTO public.planet VALUES (10, 'Flufferoon', 'A pastel-colored planet with fluffy landscapes and floating land masses.', true, true, 1600, 300, 3.45, 1);
INSERT INTO public.planet VALUES (11, 'Zibzab', 'An unpredictable planet where the terrain changes daily, from mountains to plains.', true, false, 2000, 400, 2.58, 1);
INSERT INTO public.planet VALUES (12, 'Twinkletoes', 'A vibrant, jewel-toned planet that sparkles as if dusted with diamonds.', false, false, 3300, 0, 4.12, 5);
INSERT INTO public.planet VALUES (3, 'Fizzlop', 'A bubbly, gas-filled planet with frequent storms and seas of sparkling liquid.', false, true, 2400, 0, 5.67, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Flareon', 'A fiery star known for its intense solar flares that can light up nearby planets.', true, false, 5000, 200, 9.78, 1);
INSERT INTO public.star VALUES (4, 'Gloombulb', 'A dim, dying star with a history of swallowing its own planets.', false, true, 8000, 0, 0.33, 1);
INSERT INTO public.star VALUES (5, 'Twinklespark', 'A tiny, cheerful star that blinks in Morse code patterns to neighboring stars.', true, false, 4000, 150, 3.47, 2);
INSERT INTO public.star VALUES (6, 'Novaqueen', 'An ancient star that exploded into a supernova but somehow refuses to fade.', false, true, 12000, 0, 11.12, 2);
INSERT INTO public.star VALUES (3, 'Blitzstar', 'A hyperactive star that pulsates unpredictably, changing its brightness frequently.', false, true, 3000, 0, 7.56, 5);
INSERT INTO public.star VALUES (2, 'Dimwisp', 'A faint, cool star often overlooked by astronomers but beloved by cosmic artists.', false, false, 2000, 0, 1.05, 6);


--
-- Name: crater_crater_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.crater_crater_id_seq', 7, true);


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
-- Name: crater crater_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.crater
    ADD CONSTRAINT crater_name_key UNIQUE (name);


--
-- Name: crater crater_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.crater
    ADD CONSTRAINT crater_pkey PRIMARY KEY (crater_id);


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

