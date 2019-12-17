require 'sinatra/activerecord'

class Request < ActiveRecord::Base
  belongs_to :user
end