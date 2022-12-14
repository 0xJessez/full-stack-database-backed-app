CREATE DATABASE anime_db;
\c anime_db

CREATE TABLE anime_reviews(
  id SERIAL PRIMARY KEY,
  name TEXT,
  image_url TEXT,
  genres TEXT,
  synopsis TEXT, 
  num_episodes INT,
  episodes_watched INT,
  year INT,
  review_date DATE,
  score INT,
  user_review TEXT
);

INSERT INTO anime_reviews(name, image_url, genres, synopsis, num_episodes, episodes_watched, year, review_date, score, user_review)
VALUES
    ('Haikyuu!!', 'https://cdn.myanimelist.net/images/anime/4/60431l.jpg', 'Sports', 'enter synopsis here', 25, 18, 2014, '2022-12-14', 9, 'Incredible show even for those who don''t like sports'),
    ('Code Geass: Hangyaku no Lelouch', 'https://cdn.myanimelist.net/images/anime/5/50331.jpg', 'Action, Drama, Sci-Fi', 'enter synopsis here', 25, 25, 2006, '2022-12-13', 10, 'Masterpiece, would recommend to anyone looking for a sci-fi drama with incredible character development!');

CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  first_name TEXT,
  last_name TEXT,
  email TEXT,
  image_url TEXT,
  password_digest TEXT
);

CREATE TABLE likes(
  id SERIAL PRIMARY KEY,
  user_id INT,
  anime_review_id INT
);

ALTER TABLE likes
ADD CONSTRAINT unique_likes
UNIQUE(user_id, anime_review_id);