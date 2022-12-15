get '/users/new' do
    erb :'users/new'
end

post '/users' do
    first_name = params['first_name']
    last_name = params['last_name']
    email = params['email']
    image_url = params['image_url']
    username = params['username']
    password = params['password']

    if email != "" && username != "" && password != ""
        create_user(first_name, last_name, email, image_url, username, password)
        redirect '/'
    else
        redirect '/users/new'
    end
end