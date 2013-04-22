class Restaurant < ActiveRecord::Base
  attr_accessible :restaurant

  has_many :user_restaurants, :dependent => :destroy
  has_many :users, through: :user_restaurants

end
