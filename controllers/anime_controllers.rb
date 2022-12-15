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

get '/animes/:id/edit' do
    id = params['id']

    review = find_review_by_id(id)
    anime = find_anime_by_id(review['anime_id'])

    erb :'animes/edit', locals: {
        review: review,
        anime: anime
    }
end

put '/animes/:id' do
    id = params['id']
    review_date = params['review_date']
    episodes_watched = params['episodes_watched']
    score = params['score']
    user_review = params['user_review']

    update_review(id, review_date, episodes_watched, score, user_review)
    redirect '/'
end

delete '/animes/:id' do
    id = params['id']
    delete_review(id)
    redirect '/'
end

post '/animes/:id/likes' do
    anime_review_id = params['id']
    user_id = session['user_id']

    if logged_in?
        add_like(anime_review_id, user_id)
        redirect '/'
    else
        redirect '/sessions/new'
    end

end

get '/animes/search' do
    name = params['name']
    anime_id = params['anime_id']

    headers = { 
        "X-MAL-CLIENT-ID"  => ENV['MAL_CLIENT_ID'] 
    }

    anime_search = HTTParty.get("https://api.myanimelist.net/v2/anime?q=#{name}&limit=10", :headers => headers).parsed_response['data']
    anime_data = HTTParty.get("https://api.myanimelist.net/v2/anime/#{anime_id}?fields=title,main_picture,genres,synopsis,num_episodes,start_date", :headers => headers).parsed_response

    erb :'animes/search', locals: {
        anime_search: anime_search,
        anime_data: anime_data
    }
end
