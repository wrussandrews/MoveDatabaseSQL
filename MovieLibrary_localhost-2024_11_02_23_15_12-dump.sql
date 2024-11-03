--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

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

--
-- Name: MovieLibrary; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "MovieLibrary" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE "MovieLibrary" OWNER TO postgres;

\connect "MovieLibrary"

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

--
-- Name: DATABASE "MovieLibrary"; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE "MovieLibrary" IS 'Movie Library';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: LastWatched; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."LastWatched" (
    "PackageId" integer NOT NULL,
    "SeasonId" integer NOT NULL,
    "Part" character varying(30),
    "EpsiodeNumber" integer,
    "LastWatchedDate" date NOT NULL
);


ALTER TABLE public."LastWatched" OWNER TO postgres;

--
-- Name: MediaPackage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MediaPackage" (
    "Id" integer NOT NULL,
    "TitleId" integer,
    "MediaTypeIds" integer
);


ALTER TABLE public."MediaPackage" OWNER TO postgres;

--
-- Name: MediaPackageTypeLink; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MediaPackageTypeLink" (
    "PackageId" integer NOT NULL,
    "MediaTypeId" integer NOT NULL
);


ALTER TABLE public."MediaPackageTypeLink" OWNER TO postgres;

--
-- Name: MediaPackage_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."MediaPackage" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."MediaPackage_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: MediaTypes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MediaTypes" (
    "Id" integer NOT NULL,
    "Name" character varying(20) NOT NULL,
    "FriendlyName" character varying(30) NOT NULL,
    "Description" text
);


ALTER TABLE public."MediaTypes" OWNER TO postgres;

--
-- Name: MediaTypes_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."MediaTypes" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."MediaTypes_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Ratings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Ratings" (
    "Id" integer NOT NULL,
    "Name" character varying(20) NOT NULL,
    "FriendlyName" character varying(30) NOT NULL,
    "Description" text
);


ALTER TABLE public."Ratings" OWNER TO postgres;

--
-- Name: TABLE "Ratings"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Ratings" IS 'Movie rating enumerations.';


--
-- Name: COLUMN "Ratings"."Name"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Ratings"."Name" IS 'Enumeration name of the rating';


--
-- Name: COLUMN "Ratings"."FriendlyName"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Ratings"."FriendlyName" IS 'Name shown to the user.';


--
-- Name: COLUMN "Ratings"."Description"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Ratings"."Description" IS 'Optional description of the rating';


--
-- Name: Ratings_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Ratings" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Ratings_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Seasons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Seasons" (
    "Id" integer NOT NULL,
    "Number" numeric NOT NULL,
    "Name" character varying(20) NOT NULL,
    "FriendlyName" character varying(30) NOT NULL,
    "Description" text
);


ALTER TABLE public."Seasons" OWNER TO postgres;

--
-- Name: TitleGenre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TitleGenre" (
    "Id" integer NOT NULL,
    "Name" character varying(20)[] NOT NULL,
    "FriendlyName" character varying(30) NOT NULL,
    "Description" text
);


ALTER TABLE public."TitleGenre" OWNER TO postgres;

--
-- Name: TABLE "TitleGenre"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."TitleGenre" IS 'Genre of a title.';


--
-- Name: COLUMN "TitleGenre"."Id"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."TitleGenre"."Id" IS 'Identity';


--
-- Name: COLUMN "TitleGenre"."Name"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."TitleGenre"."Name" IS 'Enumeration name.';


--
-- Name: COLUMN "TitleGenre"."FriendlyName"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."TitleGenre"."FriendlyName" IS 'Name shown to the user';


--
-- Name: TitleGenre_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."TitleGenre" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."TitleGenre_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: TitleTypes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TitleTypes" (
    "Id" integer NOT NULL,
    "Name" character varying(20) NOT NULL,
    "FriendlyName" character varying(30) NOT NULL,
    "Description" text
);


ALTER TABLE public."TitleTypes" OWNER TO postgres;

--
-- Name: TABLE "TitleTypes"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."TitleTypes" IS 'Title type enumeration, such as a movie, series, or miniseries.';


--
-- Name: COLUMN "TitleTypes"."Id"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."TitleTypes"."Id" IS 'Identity Column';


--
-- Name: COLUMN "TitleTypes"."Name"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."TitleTypes"."Name" IS 'Enumeration name.';


--
-- Name: COLUMN "TitleTypes"."FriendlyName"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."TitleTypes"."FriendlyName" IS 'Name shown to the user';


--
-- Name: COLUMN "TitleTypes"."Description"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."TitleTypes"."Description" IS 'Optional description.';


--
-- Name: TitleTypes_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."TitleTypes" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."TitleTypes_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Titles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Titles" (
    "Id" integer NOT NULL,
    "Title" character varying(50) NOT NULL,
    "Description" text,
    "TitleTypeId" integer NOT NULL,
    "Year" integer NOT NULL,
    "Url" character varying(30),
    "GenreId" integer NOT NULL,
    "RaitingId" integer NOT NULL
);


ALTER TABLE public."Titles" OWNER TO postgres;

--
-- Name: TABLE "Titles"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Titles" IS 'List of media titles';


--
-- Name: Titles_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Titles" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Titles_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: LastWatched; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."LastWatched" ("PackageId", "SeasonId", "Part", "EpsiodeNumber", "LastWatchedDate") FROM stdin;
\.


--
-- Data for Name: MediaPackage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."MediaPackage" ("Id", "TitleId", "MediaTypeIds") FROM stdin;
\.


--
-- Data for Name: MediaPackageTypeLink; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."MediaPackageTypeLink" ("PackageId", "MediaTypeId") FROM stdin;
\.


--
-- Data for Name: MediaTypes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."MediaTypes" ("Id", "Name", "FriendlyName", "Description") FROM stdin;
1	DVD	DVD	DVD
2	Blu-Ray	Blu-Ray	Blu-Ray
3	Amazon Digital	Amazon Digital	Amazon Digital
\.


--
-- Data for Name: Ratings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Ratings" ("Id", "Name", "FriendlyName", "Description") FROM stdin;
\.


--
-- Data for Name: Seasons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Seasons" ("Id", "Number", "Name", "FriendlyName", "Description") FROM stdin;
\.


--
-- Data for Name: TitleGenre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."TitleGenre" ("Id", "Name", "FriendlyName", "Description") FROM stdin;
\.


--
-- Data for Name: TitleTypes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."TitleTypes" ("Id", "Name", "FriendlyName", "Description") FROM stdin;
\.


--
-- Data for Name: Titles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Titles" ("Id", "Title", "Description", "TitleTypeId", "Year", "Url", "GenreId", "RaitingId") FROM stdin;
\.


--
-- Name: MediaPackage_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."MediaPackage_Id_seq"', 1, false);


--
-- Name: MediaTypes_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."MediaTypes_Id_seq"', 3, true);


--
-- Name: Ratings_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Ratings_Id_seq"', 1, false);


--
-- Name: TitleGenre_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."TitleGenre_Id_seq"', 1, false);


--
-- Name: TitleTypes_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."TitleTypes_Id_seq"', 1, false);


--
-- Name: Titles_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Titles_Id_seq"', 1, false);


--
-- Name: LastWatched LastWatched_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LastWatched"
    ADD CONSTRAINT "LastWatched_pkey" PRIMARY KEY ("PackageId", "SeasonId");


--
-- Name: MediaPackage MediaPackage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MediaPackage"
    ADD CONSTRAINT "MediaPackage_pkey" PRIMARY KEY ("Id");


--
-- Name: MediaTypes MediaTypes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MediaTypes"
    ADD CONSTRAINT "MediaTypes_pkey" PRIMARY KEY ("Id");


--
-- Name: Ratings Ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ratings"
    ADD CONSTRAINT "Ratings_pkey" PRIMARY KEY ("Id");


--
-- Name: Seasons Seasons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Seasons"
    ADD CONSTRAINT "Seasons_pkey" PRIMARY KEY ("Id");


--
-- Name: TitleGenre TitleGenre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TitleGenre"
    ADD CONSTRAINT "TitleGenre_pkey" PRIMARY KEY ("Id");


--
-- Name: TitleTypes TitleTypes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TitleTypes"
    ADD CONSTRAINT "TitleTypes_pkey" PRIMARY KEY ("Id");


--
-- Name: Titles Titles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Titles"
    ADD CONSTRAINT "Titles_pkey" PRIMARY KEY ("Id");


--
-- Name: Titles Genre_Ref_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Titles"
    ADD CONSTRAINT "Genre_Ref_FK" FOREIGN KEY ("GenreId") REFERENCES public."TitleGenre"("Id") NOT VALID;


--
-- Name: LastWatched MediaPackage_Ref_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LastWatched"
    ADD CONSTRAINT "MediaPackage_Ref_FK" FOREIGN KEY ("PackageId") REFERENCES public."MediaPackage"("Id") NOT VALID;


--
-- Name: MediaPackageTypeLink MediaType_Ref_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MediaPackageTypeLink"
    ADD CONSTRAINT "MediaType_Ref_FK" FOREIGN KEY ("MediaTypeId") REFERENCES public."MediaTypes"("Id") NOT VALID;


--
-- Name: MediaPackageTypeLink PackageId_Ref_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MediaPackageTypeLink"
    ADD CONSTRAINT "PackageId_Ref_FK" FOREIGN KEY ("PackageId") REFERENCES public."MediaPackage"("Id") NOT VALID;


--
-- Name: Titles Rating_Ref_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Titles"
    ADD CONSTRAINT "Rating_Ref_FK" FOREIGN KEY ("RaitingId") REFERENCES public."Ratings"("Id") NOT VALID;


--
-- Name: LastWatched Season_Ref_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LastWatched"
    ADD CONSTRAINT "Season_Ref_FK" FOREIGN KEY ("SeasonId") REFERENCES public."Seasons"("Id") NOT VALID;


--
-- Name: Titles TitleType_Ref_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Titles"
    ADD CONSTRAINT "TitleType_Ref_FK" FOREIGN KEY ("TitleTypeId") REFERENCES public."TitleTypes"("Id") NOT VALID;


--
-- PostgreSQL database dump complete
--

