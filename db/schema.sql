CREATE DATABASE anime_db;
\c anime_db

CREATE TABLE anime_reviews(
  review_date DATE,
  episodes_watched INT,
  score INT,
  user_review TEXT,
  anime_id INT,
  user_id INT
);

INSERT INTO anime_reviews(episodes_watched, review_date, score, user_review, anime_id, user_id)
VALUES
    (18, '2022-12-14', 9, 'Incredible show even for those who don''t like sports', 1, 1),
    (25, '2022-12-13', 10, 'Masterpiece, would recommend to anyone looking for a sci-fi drama with incredible character development!', 2, 1);

CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  first_name TEXT,
  last_name TEXT,
  email TEXT,
  username TEXT,
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

CREATE TABLE anime_db(
  id SERIAL PRIMARY KEY,
  name TEXT,
  image_url TEXT,
  genres TEXT,
  synopsis TEXT, 
  num_episodes INT,
  year INT
);

INSERT INTO anime_db(name, image_url, genres, synopsis, num_episodes, year)
VALUES
    ('Haikyuu!!', 'https://cdn.myanimelist.net/images/anime/4/60431l.jpg', 'Sports', 'enter synopsis here', 25, 2014),
    ('Code Geass: Hangyaku no Lelouch', 'https://cdn.myanimelist.net/images/anime/5/50331.jpg', 'Action, Drama, Sci-Fi', 'enter synopsis here', 25, 2006);