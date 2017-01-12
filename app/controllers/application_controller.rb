class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :logged_user

  def logged_user
  	if user_signed_in?
  		@current_user = current_user.email
  	end
  end

end
