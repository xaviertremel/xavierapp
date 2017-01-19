class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :logged_user

  def logged_user
  	if user_signed_in?
  		@current_user_email = current_user.email
  	end
  end

 	rescue_from CanCan::AccessDenied do |exception|
 	 redirect_to main_app.root_url, :alert => exception.message
	end

end
