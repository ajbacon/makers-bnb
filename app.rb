require 'sinatra'
require 'sinatra/activerecord'

require 'sinatra/flash'
require_relative 'lib/user'
require_relative 'lib/space'
require_relative 'lib/request'

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
    session[:user] = User.where({ email: params['email address'], password: params['password'] }).first
    redirect '/sessions/new' unless session[:user]

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
    Space.create(name: params[:name], user_id: session[:user].id, description: params[:description], price_per_night: params[:'price-per-night'])
    redirect '/spaces'
  end

  get '/spaces/:id' do
    p params[:id]
    session[:space] = Space.find(params[:id])
    @space = session[:space]
    erb :'spaces/profile'
  end

  post '/requests' do
    Request.create({ user_id: session[:user].id, date_requested: params['requested-date'], space_id: session[:space].id })
    redirect '/requests'
  end

  get '/requests' do
    p 'this is session user', session[:user]
    p 'this is arequest', @requests = Request.where(user_id: session[:user].id)
    # p 'this is a space', @space = Space.where({ user_id: @found_request.user_id })
    erb :'requests/index'
  end

  run! if app_file == $0
end
