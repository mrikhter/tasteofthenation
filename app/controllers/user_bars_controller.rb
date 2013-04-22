class UserBarsController < ApplicationController

  def index
    if current_user
      @user_bars = load_user_bars(current_user.id)
    else 
      redirect_to :root
    end
  end


  def update_status
    @user_bar = load_user_bar(params[:user_bar_id])
    @user_bar.attended = params[:attended]
    @user_bar.save
    render :nothing => true
  end


  def load_user_bar(user_bar_id)
    user_bar = UserBar.find(user_bar_id)
  end

  private

# Load user courses, allow if user_id is current user or admin logged in
  def load_user_bars(user_id)
    UserBar.includes(:bar).where(:user_id => user_id)
  end

end
