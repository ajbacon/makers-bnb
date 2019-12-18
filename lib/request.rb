require 'sinatra/activerecord'

class Request < ActiveRecord::Base

  belongs_to :user

  def self.get_received_requests(session_user_id)
    Request.all.select { |request| 
    space = Space.find(request.space_id)
    user = User.find(space.user_id)
    user.id == session_user_id
    }
  end 
end


