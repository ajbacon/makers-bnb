require 'bcrypt'
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
require_relative 'lib/user'
require_relative 'lib/space'
require_relative 'lib/request'
require_relative 'lib/date_helper'
require 'json'
require 'dotenv/load'

ActiveRecord::Base.establish_connection(adapter: 'postgresql', database: 'makersbnb')

class MakersBnB < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  configure do
    enable :sessions, :method_override
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
    user = User.create({ email: params['email address'], password: encrypted_password })
    session[:user_id] = user.id
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
    unless session[:user_id]
      flash[:notice] = 'Please log in or sign up to list a space'
      redirect '/'
    end
    erb :'spaces/new'
  end

  post '/spaces' do
    user = User.find(session[:user_id])
    user.spaces.create({ 
      name: params[:name], 
      description: params[:description], 
      price_per_night: params[:'price-per-night'],
      available_from: to_date(params[:'available-from']),
      available_to: to_date(params[:'available-to']),
    })

    redirect '/spaces'
  end

  get '/availability' do
    space = Space.find(session[:space_id])
    confirmed_bookings = Request.where(space_id: session[:space_id], status: "confirmed")
    confirmed_bookings = confirmed_bookings.map { |request| request.date_requested }
    { 
      available_from: space.available_from,
      available_to: space.available_to,
      confirmed_bookings: confirmed_bookings,
    }.to_json
  end

  get '/spaces/:id' do
    @space = Space.find(params[:id])
    session
    @available_range_of_dates = { 
      available_from: @space.available_from, 
      available_to: @space.available_to
    }
    session[:space_id] = @space.id
    erb :'spaces/profile'
  end

  post '/requests' do
    unless session[:user_id]
      flash[:notice] = 'Please log in or sign up to request a space'
      redirect '/'
    end
    user = User.find(session[:user_id])
    user.requests.create({ date_requested: params['requested-date'], 
                           space_id: session[:space_id], 
                           status: "Pending" })

    redirect '/requests'
  end

  get '/requests' do
    @requests_made = Request.where(user_id: session[:user_id])
    @requests_received = Request.get_received_requests(session[:user_id])
    erb :'requests/index'
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out'
    redirect '/'
  end

  get '/requests/:id' do
    @booking = Request.find(params[:id]) # We called it booking because we can't use "request"
    @user_from = User.find(@booking.user_id)
    erb :'requests/profile'
  end

  patch '/requests/:id' do
    status = params.keys.include?('confirm') ? 'confirmed' : 'declined'
    booking = Request.update(params[:id], status: status)

    if status == 'confirmed'
      space_id = booking.space_id
      date_requested = booking.date_requested
      Request.all.each do |request|
        request.update(status: 'declined') if request.space_id == space_id && request.date_requested == date_requested && request.id != booking.id
      end
    end

    redirect '/requests'
  end

  run! if app_file == $0
end
