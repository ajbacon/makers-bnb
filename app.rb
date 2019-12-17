require 'sinatra'
require 'sinatra/activerecord'
require_relative 'lib/user'

ActiveRecord::Base.establish_connection(adapter: 'postgresql', database: 'makersbnb')

class MakersBnB < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  configure do
    enable :sessions
  end

  get '/' do
    erb :index
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end 

  post '/users/new' do
    User.create({ email: params['email address'], password: params['password'] })
    redirect '/spaces'
  end

  post '/sessions/new' do
    user = User.where({ email: params['email address'], password: params['password'] }).first
    redirect '/sessions/new' unless user
    redirect '/spaces'
  end

  get '/spaces' do
    erb :'spaces/index'
  end 

  run! if app_file == $0
end
