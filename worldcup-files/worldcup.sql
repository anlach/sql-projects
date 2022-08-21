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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(30) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (65, 2018, 'Final', 343, 344, 4, 2);
INSERT INTO public.games VALUES (66, 2018, 'Third Place', 345, 346, 2, 0);
INSERT INTO public.games VALUES (67, 2018, 'Semi-Final', 344, 346, 2, 1);
INSERT INTO public.games VALUES (68, 2018, 'Semi-Final', 343, 345, 1, 0);
INSERT INTO public.games VALUES (69, 2018, 'Quarter-Final', 344, 352, 3, 2);
INSERT INTO public.games VALUES (70, 2018, 'Quarter-Final', 346, 354, 2, 0);
INSERT INTO public.games VALUES (71, 2018, 'Quarter-Final', 345, 356, 2, 1);
INSERT INTO public.games VALUES (72, 2018, 'Quarter-Final', 343, 358, 2, 0);
INSERT INTO public.games VALUES (73, 2018, 'Eighth-Final', 346, 360, 2, 1);
INSERT INTO public.games VALUES (74, 2018, 'Eighth-Final', 354, 362, 1, 0);
INSERT INTO public.games VALUES (75, 2018, 'Eighth-Final', 345, 364, 3, 2);
INSERT INTO public.games VALUES (76, 2018, 'Eighth-Final', 356, 366, 2, 0);
INSERT INTO public.games VALUES (77, 2018, 'Eighth-Final', 344, 368, 2, 1);
INSERT INTO public.games VALUES (78, 2018, 'Eighth-Final', 352, 370, 2, 1);
INSERT INTO public.games VALUES (79, 2018, 'Eighth-Final', 358, 372, 2, 1);
INSERT INTO public.games VALUES (80, 2018, 'Eighth-Final', 343, 374, 4, 3);
INSERT INTO public.games VALUES (81, 2014, 'Final', 375, 374, 1, 0);
INSERT INTO public.games VALUES (82, 2014, 'Third Place', 377, 356, 3, 0);
INSERT INTO public.games VALUES (83, 2014, 'Semi-Final', 374, 377, 1, 0);
INSERT INTO public.games VALUES (84, 2014, 'Semi-Final', 375, 356, 7, 1);
INSERT INTO public.games VALUES (85, 2014, 'Quarter-Final', 377, 384, 1, 0);
INSERT INTO public.games VALUES (86, 2014, 'Quarter-Final', 374, 345, 1, 0);
INSERT INTO public.games VALUES (87, 2014, 'Quarter-Final', 356, 360, 2, 1);
INSERT INTO public.games VALUES (88, 2014, 'Quarter-Final', 375, 343, 1, 0);
INSERT INTO public.games VALUES (89, 2014, 'Eighth-Final', 356, 392, 2, 1);
INSERT INTO public.games VALUES (90, 2014, 'Eighth-Final', 360, 358, 2, 0);
INSERT INTO public.games VALUES (91, 2014, 'Eighth-Final', 343, 396, 2, 0);
INSERT INTO public.games VALUES (92, 2014, 'Eighth-Final', 375, 398, 2, 1);
INSERT INTO public.games VALUES (93, 2014, 'Eighth-Final', 377, 366, 2, 1);
INSERT INTO public.games VALUES (94, 2014, 'Eighth-Final', 384, 402, 2, 1);
INSERT INTO public.games VALUES (95, 2014, 'Eighth-Final', 374, 362, 1, 0);
INSERT INTO public.games VALUES (96, 2014, 'Eighth-Final', 345, 406, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (343, 'France');
INSERT INTO public.teams VALUES (344, 'Croatia');
INSERT INTO public.teams VALUES (345, 'Belgium');
INSERT INTO public.teams VALUES (346, 'England');
INSERT INTO public.teams VALUES (352, 'Russia');
INSERT INTO public.teams VALUES (354, 'Sweden');
INSERT INTO public.teams VALUES (356, 'Brazil');
INSERT INTO public.teams VALUES (358, 'Uruguay');
INSERT INTO public.teams VALUES (360, 'Colombia');
INSERT INTO public.teams VALUES (362, 'Switzerland');
INSERT INTO public.teams VALUES (364, 'Japan');
INSERT INTO public.teams VALUES (366, 'Mexico');
INSERT INTO public.teams VALUES (368, 'Denmark');
INSERT INTO public.teams VALUES (370, 'Spain');
INSERT INTO public.teams VALUES (372, 'Portugal');
INSERT INTO public.teams VALUES (374, 'Argentina');
INSERT INTO public.teams VALUES (375, 'Germany');
INSERT INTO public.teams VALUES (377, 'Netherlands');
INSERT INTO public.teams VALUES (384, 'Costa Rica');
INSERT INTO public.teams VALUES (392, 'Chile');
INSERT INTO public.teams VALUES (396, 'Nigeria');
INSERT INTO public.teams VALUES (398, 'Algeria');
INSERT INTO public.teams VALUES (402, 'Greece');
INSERT INTO public.teams VALUES (406, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 96, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 406, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: teams teams_team_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_team_key UNIQUE (name);


--
-- Name: games games_loser_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_loser_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_i_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_i_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

