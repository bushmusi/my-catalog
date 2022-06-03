CREATE TABLE IF NOT EXISTS public.game (
  multiplayer BOOLEAN,
  last_played_at DATE,
);

CREATE TABLE IF NOT EXISTS public.authors (
  id  INT GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR(500),
  last_name VARCHAR(500),
  PRIMARY KEY(id)
  FOREIGN KEY(id) REFERENCES item(id)
);