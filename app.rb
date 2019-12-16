require 'sinatra'
require 'sinatra/activerecord'

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
    redirect '/'
  end

  get '/spaces' do
    erb :'spaces/index'
  end 

  run! if app_file == $0
end
