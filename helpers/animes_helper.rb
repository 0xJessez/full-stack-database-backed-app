def user_details(user_id, detail)
    user = run_sql('SELECT * FROM users WHERE id = $1', [user_id])[0]
    user[detail]
end

def anime_details(anime_id, detail)
    anime = run_sql('SELECT * FROM anime_db WHERE id = $1', [anime_id])[0]
    anime[detail]
end

def count_reviews(user_id)
    run_sql(' SELECT user_id, COUNT(*) FROM anime_reviews WHERE user_id = $1 GROUP BY user_id;', [user_id])[0]['count']
end

def avg_score(user_id)
    run_sql('SELECT AVG(score) FROM anime_reviews WHERE user_id = $1', [user_id])[0]['avg'].to_f
end