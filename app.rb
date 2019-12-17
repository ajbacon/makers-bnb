require 'sinatra'
require 'sinatra/activerecord'
require_relative './lib/space'

ActiveRecord::Base.establish_connection(adapter: 'postgresql', database: 'makersbnb')

class MakersBnB < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  configure do
    enable :sessions
  end

  get '/' do
    @email = session[:email]
    @password = session[:password]
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    redirect '/'
  end
  
  post '/sessions' do
    session[:email] = params['email']
    session[:password] = params['password']
    'authenticate'
    redirect '/spaces'
  end

  get '/spaces' do
    @spaces = Space.all
    erb :'spaces/index'
  end 

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces' do
    @space = Space.create(name: params[:name], description: params[:description], price_per_night: params[:'price-per-night'])
    redirect '/spaces'
  end

  run! if app_file == $0
end
