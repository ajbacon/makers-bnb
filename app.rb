require 'sinatra'
require 'sinatra/activerecord'

ActiveRecord::Base.establish_connection(adapter: 'postgresql', database: 'makersbnb')

class MakersBnB < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  configure do
    enable :sessions
  end


  run! if app_file == $0
end