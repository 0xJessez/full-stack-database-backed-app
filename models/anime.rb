def all_reviews()
    run_sql('SELECT * FROM anime_reviews ORDER BY review_date DESC')
end

def all_anime()
    run_sql('SELECT * FROM anime_db ORDER BY id')
end

def find_anime_by_name(name)
    anime =  run_sql('SELECT * FROM anime_db WHERE name = $1', [name])

    if anime.to_a.count > 0
        anime[0]
    else
        nil
    end
end

def add_anime_to_db(name, image_url, genres, synopsis, num_episodes, year)
    run_sql('INSERT INTO anime_db(name, image_url, genres, synopsis, num_episodes, year) VALUES($1, $2, $3, $4, $5, $6)', [name, image_url, genres, synopsis, num_episodes, year])
end

def create_review(review_date, episodes_watched, score, user_review, user_id, anime_id)
    run_sql('INSERT INTO anime_reviews(review_date, episodes_watched, score, user_review, user_id, anime_id) VALUES($1, $2, $3, $4, $5, $6)', [review_date, episodes_watched, score, user_review, user_id, anime_id])
end

def find_reviews_by_id(user_id)
    run_sql('SELECT * FROM anime_reviews WHERE user_id = $1 ORDER BY review_date DESC',[user_id])
end

def find_review_by_id(id)
    run_sql('SELECT * FROM anime_reviews WHERE id = $1', [id])[0]
end

def find_anime_by_id(id)
    run_sql('SELECT * FROM anime_db WHERE id = $1', [id])[0]
end

def update_review(id, review_date, episodes_watched, score, user_review)
    run_sql('UPDATE anime_reviews SET review_date = $2, episodes_watched = $3, score = $4, user_review = $5 WHERE id = $1', [id, review_date, episodes_watched, score, user_review])
end

def delete_review(id)
    run_sql('DELETE FROM anime_reviews WHERE id = $1', [id])
end

def add_like(anime_review_id, user_id)
    if run_sql('SELECT * FROM likes WHERE anime_review_id = $1 AND user_id = $2', [anime_review_id, user_id]).to_a.count > 0
        nil
    else
        run_sql('INSERT INTO likes(anime_review_id, user_id) VALUES($1, $2)', [anime_review_id, user_id])
    end
end