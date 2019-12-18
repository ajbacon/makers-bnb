require 'sinatra/activerecord'

class User < ActiveRecord::Base
  validates :email, uniqueness: true
  has_many :requests
  has_many :spaces
end
