-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  name TEXT[] NOT NULL
);

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  name TEXT[] NOT NULL
);

CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL
);

CREATE TABLE logger
(
  id SERIAL PRIMARY KEY,
  song_id INTEGER REFERENCES songs,
  artist_id INTEGER REFERENCES artists,
  album_id INTEGER REFERENCES albums,
  producer_id INTEGER REFERENCES producers
);

INSERT INTO artists
  (name)
VALUES
  ('{Camellia}'), ('{"TatshMusicCircle", "void"}');

INSERT INTO producers
  (name)
VALUES
  ('{PRODUCER1}'), ('{"PRODUCER2", "PRODUCER3"}');

INSERT INTO albums
  (name)
VALUES
  ('IDK1'), ('IDK2');

INSERT INTO songs
  (title, duration_in_seconds, release_date)
VALUES
  ('Light it Up', 236, '2016-08-12'), ('Random Song', 1000000, '2100-09-12');

INSERT INTO logger
  (song_id, artist_id, album_id, producer_id)
VALUES
  (1, 1, 1, 1), (2, 2, 2, 2);