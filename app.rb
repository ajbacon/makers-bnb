require 'sinatra'
require 'sinatra/activerecord'

ActiveRecord::Base.establish_connection(adapter: 'postgresql', database: 'makersbnb')

class MakersBnB < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  configure do
    enable :sessions
  end

  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    redirect '/'
  end
  

  run! if app_file == $0
end
