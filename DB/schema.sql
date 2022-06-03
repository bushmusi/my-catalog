CREATE DATABASE my_catalog
  WITH
  OWNER = postgres
  ENCODING = 'UTF8'
  CONNECTION LIMIT = -1;

CREATE TABLE genres(
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100)
);

CREATE TABLE labels (
    id  INT GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(100),
    color VARCHAR(100),
    PRIMARY KEY(id)
);

CREATE TABLE sources (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
);

CREATE TABLE authors (
    id INT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL
);

CREATE TABLE items(
    id SERIAL PRIMARY KEY,
    archived BOOLEAN DEFAULT 'f',
    author_id SERIAL NOT NULL,
    label_id SERIAL NOT NULL,
    genre_id SERIAL NOT NULL,
    publish_date TIMESTAMP NOT NULL,
    CONSTRAINT author_fk FOREIGN KEY (author_id) REFERENCES authors(id),
    CONSTRAINT label_fk FOREIGN KEY (label_id) REFERENCES labels(id),
    CONSTRAINT genre_fk FOREIGN KEY (genre_id) REFERENCES genres(id)
);

CREATE TABLE IF NOT EXISTS public.game (
  multiplayer BOOLEAN,
  last_played_at DATE,
);

CREATE TABLE books (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    publisher VARCHAR(100),
    cover_state VARCHAR(100),
    FOREIGN KEY(item_id) REFERENCES items(id)
);
