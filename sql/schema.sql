-- Delete tables if already exist
DROP TABLE IF EXISTS MusicAlbum
DROP TABLE IF EXISTS Genre

-- Genre table
CREATE TABLE Genre (
  id INT GENERATED ALWAYS AS IDENTITY,
  name varchar(100),
  PRIMARY KEY(id)
);

-- MusicAlbum table
CREATE TABLE MusicAlbum (
  id INT GENERATED ALWAYS AS IDENTITY,
  name varchar(100),
  publish_date DATE,
  archived BOOLEAN,
  on_spotify BOOLEAN,
  genre_id INT REFERENCES Genre(id),
  PRIMARY KEY(id)
);