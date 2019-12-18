require 'sinatra'
require 'sinatra/activerecord'

require 'sinatra/flash'
require_relative 'lib/user'
require_relative 'lib/space'
require 'bcrypt'

ActiveRecord::Base.establish_connection(adapter: 'postgresql', database: 'makersbnb')

class MakersBnB < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  configure do
    enable :sessions
    register Sinatra::Flash
  end

  get '/' do
    erb :index
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end 

  post '/users/new' do
    encrypted_password = BCrypt::Password.create(params[:password])
    User.create({ email: params['email address'], password: encrypted_password })
    redirect '/spaces'
  end

  post '/sessions/new' do
    user = User.where({ email: params['email address'] }).first
    if user && BCrypt::Password.new(user.password) == params[:password]
      session[:user_id] = user.id
      redirect '/spaces'
    else
      flash[:notice] = 'Please check your email or password'
      redirect '/sessions/new'
    end
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
