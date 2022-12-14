require 'dotenv/load'
require 'sinatra'
require 'bcrypt'
require './db/db'
require 'httparty'

# session
enable :sessions

# models
require './models/anime'
require './models/user'

# controllers
require './controllers/anime_controllers'
require './controllers/user_controllers'
require './controllers/session_controllers'


# helpers
require './helpers/sessions_helper'






