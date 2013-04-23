class SessionsController < ApplicationController
  def new
  end

  def create  
    user = User.authenticate(params[:username])
    if user  
      session[:user_id] = user.id  
      redirect_to welcome_path, :notice => "Logged in!"  
    else  
      flash.now.alert = "No such username, are you sure you created one?"  
      render "new"  
    end  
  end 

  def destroy  
    session[:user_id] = nil  
    redirect_to root_url, :notice => "Logged out!"  
  end

end
