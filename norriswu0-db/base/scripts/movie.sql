-- 32606 / 31061, Semester 2, 2026
-- Student name: [Your name as shown on your student card]
-- Email: [Your student email]
-- Student number: [Your student number]
-- Project: Movie Catalogue and Personal Watchlists
-- People can browse movies by their primary genre and find cast members.
-- Each user can save movies to a personal watchlist.
-- The catalogue records movie lengths, age ratings and cast roles.
-- Inspired by: https://www.netflix.com/
-- Feature reference: https://help.netflix.com/en/node/10523
-- All people, movies and watchlist entries below are fictional.
-- Scope: movies only, one primary genre per movie, no accounts or billing.
-- User names need not be unique.
-- Each actor has one credited role per movie in this simplified model.
-- Run in a dedicated assignment database: this script replaces its own tables.

BEGIN;

DROP VIEW IF EXISTS movie_catalogue;
DROP TABLE IF EXISTS watchlist;
DROP TABLE IF EXISTS movie_actor;
DROP TABLE IF EXISTS "user";
DROP TABLE IF EXISTS movie;
DROP TABLE IF EXISTS actor;
DROP TABLE IF EXISTS genre;

CREATE TABLE genre (
    genre_id    INTEGER,
    genre_name  VARCHAR(40) NOT NULL,
    CONSTRAINT genre_pk PRIMARY KEY (genre_id),
    CONSTRAINT genre_name_unique UNIQUE (genre_name),
    CONSTRAINT genre_name_check CHECK (btrim(genre_name) <> '')
);

CREATE TABLE movie (
    movie_id          INTEGER,
    title             VARCHAR(100) NOT NULL,
    release_year      INTEGER NOT NULL,
    duration_minutes  INTEGER NOT NULL,
    maturity_rating   VARCHAR(5) NOT NULL,
    genre_id          INTEGER NOT NULL,
    CONSTRAINT movie_pk PRIMARY KEY (movie_id),
    CONSTRAINT movie_title_check CHECK (btrim(title) <> ''),
    CONSTRAINT movie_year_check CHECK (release_year BETWEEN 1888 AND 2100),
    CONSTRAINT movie_duration_check CHECK (duration_minutes BETWEEN 1 AND 600),
    CONSTRAINT movie_rating_check
        CHECK (maturity_rating IN ('G', 'PG', 'M', 'MA15+', 'R18+')),
    CONSTRAINT movie_genre_fk FOREIGN KEY (genre_id)
        REFERENCES genre (genre_id) ON DELETE RESTRICT
);

CREATE TABLE actor (
    actor_id  INTEGER,
    name      VARCHAR(100) NOT NULL,
    CONSTRAINT actor_pk PRIMARY KEY (actor_id),
    CONSTRAINT actor_name_check CHECK (btrim(name) <> '')
);

CREATE TABLE movie_actor (
    movie_id   INTEGER,
    actor_id   INTEGER,
    role_name  VARCHAR(100) NOT NULL,
    CONSTRAINT movie_actor_pk PRIMARY KEY (movie_id, actor_id),
    CONSTRAINT movie_actor_role_check CHECK (btrim(role_name) <> ''),
    CONSTRAINT movie_actor_movie_fk FOREIGN KEY (movie_id)
        REFERENCES movie (movie_id) ON DELETE CASCADE,
    CONSTRAINT movie_actor_actor_fk FOREIGN KEY (actor_id)
        REFERENCES actor (actor_id) ON DELETE CASCADE
);

CREATE TABLE "user" (
    user_id    INTEGER,
    user_name  VARCHAR(40) NOT NULL,
    created_on    DATE NOT NULL,
    CONSTRAINT user_pk PRIMARY KEY (user_id),
    CONSTRAINT user_name_check CHECK (btrim(user_name) <> '')
);

CREATE TABLE watchlist (
    user_id  INTEGER,
    movie_id    INTEGER,
    added_on    DATE NOT NULL,
    CONSTRAINT watchlist_pk PRIMARY KEY (user_id, movie_id),
    CONSTRAINT watchlist_user_fk FOREIGN KEY (user_id)
        REFERENCES "user" (user_id) ON DELETE CASCADE,
    CONSTRAINT watchlist_movie_fk FOREIGN KEY (movie_id)
        REFERENCES movie (movie_id) ON DELETE CASCADE
);

INSERT INTO genre (genre_id, genre_name) VALUES
    (1, 'Science Fiction'), (2, 'Adventure'), (3, 'Drama'),
    (4, 'Comedy'), (5, 'Documentary');

INSERT INTO movie
    (movie_id, title, release_year, duration_minutes, maturity_rating, genre_id)
VALUES
    (101, 'Star Quest',     2020, 120, 'PG',    1),
    (102, 'Lost Island',    2022, 110, 'M',     2),
    (103, 'Lunar Signal',   2024, 105, 'M',     1),
    (104, 'Beyond Mars',    2024, 135, 'MA15+', 1),
    (105, 'River Trail',    2021,  95, 'PG',    2),
    (106, 'The Last Train', 2023, 115, 'M',     3),
    (107, 'Quiet Harbour',  2020, 100, 'PG',    3),
    (108, 'Weekend Mixup',  2022,  90, 'PG',    4),
    (109, 'Office Escape',  2025,  98, 'M',     4),
    (110, 'Hidden Valley',  2025, 125, 'PG',    2);

INSERT INTO actor (actor_id, name) VALUES
    (201, 'Alex Chen'), (202, 'Jordan Lee'), (203, 'Sam Patel'),
    (204, 'Mia Torres'), (205, 'Noah Kim'), (206, 'Ella Brown');

INSERT INTO movie_actor (movie_id, actor_id, role_name) VALUES
    (101, 201, 'Captain'),    (101, 202, 'Pilot'),
    (102, 201, 'Explorer'),   (102, 203, 'Guide'),
    (103, 202, 'Scientist'),  (103, 204, 'Engineer'),
    (104, 201, 'Commander'),  (104, 204, 'Navigator'),
    (105, 203, 'Ranger'),     (105, 205, 'Traveller'),
    (106, 204, 'Conductor'),  (106, 206, 'Passenger'),
    (107, 205, 'Fisher'),     (107, 206, 'Teacher'),
    (108, 202, 'Neighbour'),  (108, 203, 'Chef'),
    (109, 205, 'Manager'),    (109, 206, 'Designer');

INSERT INTO "user" (user_id, user_name, created_on) VALUES
    (301, 'Avery',  DATE '2026-09-01'),
    (302, 'Blake',  DATE '2026-09-03'),
    (303, 'Casey',  DATE '2026-09-05'),
    (304, 'Drew',   DATE '2026-09-08'),
    (305, 'Morgan', DATE '2026-09-10');

INSERT INTO watchlist (user_id, movie_id, added_on) VALUES
    (301, 101, DATE '2026-09-11'), (301, 103, DATE '2026-09-12'),
    (301, 108, DATE '2026-09-13'), (302, 101, DATE '2026-09-11'),
    (302, 102, DATE '2026-09-14'), (302, 110, DATE '2026-09-15'),
    (303, 103, DATE '2026-09-16'), (303, 106, DATE '2026-09-17'),
    (303, 109, DATE '2026-09-18'), (304, 102, DATE '2026-09-19'),
    (304, 105, DATE '2026-09-20'), (304, 108, DATE '2026-09-21');

-- Optional participation examples: Documentary has no movies,
-- Morgan has no watchlist entries, Hidden Valley has no recorded cast yet.

CREATE VIEW movie_catalogue AS
SELECT m.movie_id, m.title, m.release_year, m.duration_minutes,
       m.maturity_rating, g.genre_name
FROM movie AS m
JOIN genre AS g ON g.genre_id = m.genre_id;

COMMIT;

-- QUERY QUESTIONS (SQL answers follow all six questions)
-- Outputs below were verified in PostgreSQL 18 on 14 October 2026.
-- Q1: Find movies released in 2024 or later, ordered by title.
-- title         | release_year
-- --------------+-------------
-- Beyond Mars   | 2024
-- Hidden Valley | 2025
-- Lunar Signal  | 2024
-- Office Escape | 2025
-- (4 rows)
--
-- Q2: List Science Fiction movies with their primary genre, using NATURAL JOIN.
-- title        | genre_name
-- -------------+----------------
-- Beyond Mars  | Science Fiction
-- Lunar Signal | Science Fiction
-- Star Quest   | Science Fiction
-- (3 rows)
--
-- Q3: Return the same result as Q2 using a cross product and WHERE condition.
-- title        | genre_name
-- -------------+----------------
-- Beyond Mars  | Science Fiction
-- Lunar Signal | Science Fiction
-- Star Quest   | Science Fiction
-- (3 rows)
--
-- Q4: Find movies saved by at least two users, with their save counts.
-- title         | saved_by_users
-- --------------+------------------
-- Lost Island   | 2
-- Lunar Signal  | 2
-- Star Quest    | 2
-- Weekend Mixup | 2
-- (4 rows)
--
-- Q5: Find movies saved by the user with user_id 301 (Avery).
-- title
-- -------------
-- Lunar Signal
-- Star Quest
-- Weekend Mixup
-- (3 rows)
--
-- Q6: Find pairs of different movies in the same genre and release year.
--     Show each pair once, using a self cross product rather than NATURAL JOIN.
-- first_movie  | second_movie
-- -------------+-------------
-- Lunar Signal | Beyond Mars
-- (1 row)

-- QUERY ANSWERS
-- Q1: Single-table query.
SELECT title, release_year
FROM movie
WHERE release_year >= 2024
ORDER BY title;

-- Q2: NATURAL JOIN matches the shared genre_id column.
SELECT title, genre_name
FROM movie NATURAL JOIN genre
WHERE genre_name = 'Science Fiction'
ORDER BY title;

-- Q3: Cross-product equivalent of Q2.
SELECT m.title, g.genre_name
FROM movie AS m, genre AS g
WHERE m.genre_id = g.genre_id
  AND g.genre_name = 'Science Fiction'
ORDER BY m.title;

-- Q4: GROUP BY and HAVING.
SELECT m.title, COUNT(*) AS saved_by_users
FROM movie AS m
JOIN watchlist AS w ON w.movie_id = m.movie_id
GROUP BY m.movie_id, m.title
HAVING COUNT(*) >= 2
ORDER BY m.title;

-- Q5: Subquery.
SELECT title
FROM movie
WHERE movie_id IN (
    SELECT movie_id
    FROM watchlist
    WHERE user_id = 301
)
ORDER BY title;

-- Q6: A bare NATURAL JOIN would match every shared movie column,
-- including movie_id. It cannot express this distinct-pair condition.
SELECT a.title AS first_movie, b.title AS second_movie
FROM movie AS a, movie AS b
WHERE a.genre_id = b.genre_id
  AND a.release_year = b.release_year
  AND a.movie_id < b.movie_id
ORDER BY a.title, b.title;

-- View example: a reusable catalogue without repeating the genre join.
SELECT title, release_year, genre_name
FROM movie_catalogue
WHERE maturity_rating = 'PG'
ORDER BY title;
