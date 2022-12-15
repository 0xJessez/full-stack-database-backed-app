def user_details(user_id, detail)
    user = run_sql('SELECT * FROM users WHERE id = $1', [user_id])[0]
    user[detail]
end

def anime_details(anime_id, detail)
    anime = run_sql('SELECT * FROM anime_db WHERE id = $1', [anime_id])[0]
    anime[detail]
end

def count_reviews(user_id)
    if run_sql('SELECT user_id, COUNT(*) FROM anime_reviews WHERE user_id = $1 GROUP BY user_id', [user_id]).to_a.count > 0
        run_sql('SELECT user_id, COUNT(*) FROM anime_reviews WHERE user_id = $1 GROUP BY user_id', [user_id])[0]['count']
    else
        nil
    end
end

def avg_score(user_id)
    run_sql('SELECT AVG(score) FROM anime_reviews WHERE user_id = $1', [user_id])[0]['avg'].to_f
end

def likes_count(anime_review_id)
    if run_sql('SELECT anime_review_id, COUNT(*) FROM likes WHERE anime_review_id = $1 GROUP BY anime_review_id', [anime_review_id]).to_a.count > 0
        run_sql('SELECT anime_review_id, COUNT(*) FROM likes WHERE anime_review_id = $1 GROUP BY anime_review_id', [anime_review_id])[0]['count']
    else
        0
    end
end