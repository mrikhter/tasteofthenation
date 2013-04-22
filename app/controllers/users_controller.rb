class UsersController < ApplicationController

  def new  
    @user = User.new  
  end  
    
  def create  
    @user = User.new(params[:user])  
    if @user.save  
      session[:user_id] = @user.id
      current_user = session[:user_id]
      redirect_to welcome_path, :notice => "Signed up!"  
    else  
      render "new"  
    end  
  end  

end
