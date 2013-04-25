class UserRestaurantsController < ApplicationController

  def index
    if current_user
      @user_restaurants = load_user_restaurants(current_user.id)
      @percent = percentage_visited(current_user.id)
    else 
      redirect_to :root
    end
  end


  def update_status
    user_restaurant = load_user_restaurant(params[:user_restaurant_id])
    user_restaurant.attended = params[:attended]
    user_restaurant.save
    percent = percentage_visited(current_user.id)
    render :json => percent
  end


  def load_user_restaurant(user_restaurant_id)
    user_restaurant = UserRestaurant.find(user_restaurant_id)
  end

  def percentage_visited(user)
    restaurants_visited = UserRestaurant.where(:user_id => user).where(:attended => true).count 
    restaurants_total = UserRestaurant.where(:user_id => user).count
    percent = (restaurants_visited.to_f/restaurants_total.to_f) * 100
    percent.to_i
  end

  private

  def load_user_restaurants(user_id)
    UserRestaurant.includes(:restaurant).where(:user_id => user_id)
  end


end
