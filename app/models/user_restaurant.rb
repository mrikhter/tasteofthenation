class UserRestaurant < ActiveRecord::Base
  attr_accessible :attended, :restaurant_id, :user_id

  belongs_to :user
  belongs_to :restaurant



end
