get '/sessions/new' do
    erb :'sessions/new'
end

post '/sessions' do
    email = params['email']
    password = params['password']

    user = find_user_by_email(email)

    if user && BCrypt::Password.new(user['password_digest']) == password
        session['user_id'] = user['id']
        redirect '/'
    else
        erb :'sessons/new'
    end
end

get '/sessions/:id/profile' do
    
    user_id = params['id']
    reviews = find_reviews_by_id(user_id)
    
    if logged_in?
        erb :'sessions/profile', locals: {
            reviews: reviews
        }
    else
        redirect 'sessions/new'
    end
end