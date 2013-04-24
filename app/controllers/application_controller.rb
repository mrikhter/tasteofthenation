class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user  
  
  # before_filter :add_www

  # def add_www
  #   if request.env["HTTP_HOST"] == "totnnyc2013.com"
  #     redirect_to "http://www.totnnyc2013.com/"
  #   end
  # end

  # def add_www
  #   if Rails.env == 'production'
  #     redirect_to request.protocol + "www." + request.host_with_port + request.request_uri, :status => :found if !/^www/.match(request.host)
  #   end
  # end


  private  
  def current_user  
    @current_user ||= User.find(session[:user_id]) if session[:user_id]  
  end
end
