class Bar < ActiveRecord::Base
  attr_accessible :name

  has_many :user_bars, :dependent => :destroy
  has_many :users, through: :user_bars

end
