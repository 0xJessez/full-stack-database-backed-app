def all_reviews()
    run_sql('SELECT * FROM anime_reviews ORDER BY user_id DESC')
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
    run_sql('INSERT INTO anime_db(name, image_url, genres, synopsis, num_episodes, year) VALUES($1, $2, $3, $4, $5, $6, $7)', [name, image_url, genres, synopsis, num_episodes, year])
end

def create_review(review_date, episodes_watched, score, user_review, user_id, anime_id)
    run_sql('INSERT INTO anime_reviews(review_date, episodes_watched, score, user_review, user_id, anime_id) VALUES($1, $2, $3, $4, $5, $6)', [review_date, episodes_watched, score, user_review, user_id, anime_id])
end