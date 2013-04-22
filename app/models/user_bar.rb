class UserBar < ActiveRecord::Base
  attr_accessible :attended, :bar_id, :user_id

  belongs_to :user
  belongs_to :bar

end
