class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation
  attr_accessor :password  

  has_many :user_restaurants, :dependent => :destroy
  has_many :restaurants, through: :user_restaurants

  has_many :user_bars, :dependent => :destroy
  has_many :bars, through: :user_bars

  before_save :encrypt_password  

  validates_confirmation_of :password  
  validates :password, :confirmation => true, :on => :create  
  validates_presence_of :email  
  # validates_uniqueness_of :email 

  after_save :create_associations

  def encrypt_password  
    if password.present?  
      self.password_salt = BCrypt::Engine.generate_salt  
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)  
    end  
  end  

  def self.authenticate(email, password)  
    user = find_by_email(email)  
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user  
    else  
      nil  
    end  
  end  

  def create_associations
    restaurants = Restaurant.all
    bars = Bar.all
    restaurants.each { |restaurant| add_restaurant_to_user(restaurant) }
    bars.each { |bar| add_bar_to_user(bar) }
  end

  def add_restaurant_to_user(restaurant)
    self.user_restaurants.build(:restaurant_id => restaurant.id, :attended => false).save
  end
  
    def add_bar_to_user(bar)
    self.user_bars.build(:bar_id => bar.id, :attended => false).save
  end

end
