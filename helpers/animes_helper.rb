def review_user(id)
    user = run_sql('SELECT * FROM users WHERE id = $1', [id])[0]
    user['first_name']
end