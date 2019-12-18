require 'sinatra/activerecord'

class User < ActiveRecord::Base
  validates :email, uniqueness: true
  
end 