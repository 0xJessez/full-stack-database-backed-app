get '/' do
    
    reviews = all_reviews()
    animes = all_anime()
    
    erb :'animes/index', locals: {
        reviews: reviews,
        animes: animes
    }
end

get '/animes/new' do
    if logged_in?
        erb :'animes/new'
    else
        redirect '/'
    end
end

post '/animes' do
    name = params['name']
    image_url = params['image_url']
    genres = params['genres']
    synposis = params['synopsis']
    num_episodes = params['num_episodes']
    episodes_watched = params['episodes_watched']
    year = params['year']
    review_date = params['review_date']
    score = params['score']
    user_review = params['user_review']
    user_id = session['user_id']

    anime = find_anime_by_name(name)

    if logged_in?
        if anime
        create_review(review_date, episodes_watched, score, user_review, user_id, anime['id'])
        redirect '/'
        else
        add_anime_to_db(name, image_url, genres, synopsis, num_episodes, year)
        anime = find_anime_by_name(name)
        create_review(review_date, episodes_watched, score, user_review, user_id, anime['id'])
        redirect '/'
        end
    else
        redirect '/sessions/new'
    end
end