def review_user(id)
    user = run_sql('SELECT * FROM users WHERE id = $1', [id])[0]
    user['username']
end

def anime_details(anime_id, detail)
    anime = run_sql('SELECT * FROM anime_db WHERE id = $1', [anime_id])[0]
    anime[detail]
end