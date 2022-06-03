CREATE TABLE IF NOT EXISTS public.item (
  id  INT GENERATED ALWAYS AS IDENTITY,
  label_id INT,
  genre_id INT,
  author_id INT,
  publish_date DATE,
  archived BOOLEAN,
  PRIMARY KEY(id),
  FOREIGN KEY (label_id) REFERENCES labels (id),
  FOREIGN KEY (genre_id) REFERENCES genres (id),
  FOREIGN KEY (author_id) REFERENCES authors (id),
);