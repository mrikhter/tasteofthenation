class UserRestaurantsController < ApplicationController

  def index
    if current_user
      @user_restaurants = load_user_restaurants(current_user.id)
    else 
      redirect_to :root
    end
  end


  def update_status
    @user_restaurant = load_user_restaurant(params[:user_restaurant_id])
    @user_restaurant.attended = params[:attended]
    @user_restaurant.save
    render :nothing => true
  end


  def load_user_restaurant(user_restaurant_id)
    user_restaurant = UserRestaurant.find(user_restaurant_id)
  end

  private

# Load user courses, allow if user_id is current user or admin logged in
  def load_user_restaurants(user_id)
    UserRestaurant.includes(:restaurant).where(:user_id => user_id)
  end


end
