-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE suns
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
)

CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around INTEGER REFERENCES suns,
  galaxy INTEGER REFERENCES galaxies,
);

CREATE TABLE planet_moons
(
  id SERIAL PRIMARY KEY,
  moons TEXT[],
  planet_id INTEGER REFERENCES planets,
);

INSERT INTO suns
  (name)
VALUES
  ('The Sun'),
  ('Proxima Centauri'),
  ('Gliese 876');

INSERT INTO galaxies
  (name)
VALUES
  ('Milky Way'),
  ('Proxima Centauri');

INSERT INTO planets
  (name, orbital_period_in_years, orbits_around, galaxy, moons)
VALUES
  ('Earth', 1.00, 1, 1),
  ('Mars', 1.88, 1, 1),
  ('Venus', 0.62, 1, 1),
  ('Neptune', 164.8, 1, 1),
  ('Proxima Centauri b', 0.03, 2, 1),
  ('Gliese 876 b', 0.23, 3, 1);

INSERT INTO planet_moons
  (moons, planet_id)
VALUES
  ('{"The Moon"}', 1),
  ('{"Phobos", "Deimos"}', 2),
  ('{}', 3),
  ('{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}', 4),
  ('{}', 5),
  ('{}', 6);
