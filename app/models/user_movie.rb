class UserMovie < ActiveRecord::Base
  attr_accessible :title, :user_id, :status

  
end
