class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :logged_user
  before_action :store_current_location, :unless => :devise_controller?

  def logged_user
  	if user_signed_in?
  		@current_user_email = current_user.email
  	end
  end

	#def after_sign_in_path_for(resource_or_scope)
	#	products_path
	#end

	def after_sign_out_path_for(resource_or_scope)
  	URI.parse(request.referer).path if request.referer
	end

 	rescue_from CanCan::AccessDenied do |exception|
 	 redirect_to main_app.root_url, :alert => exception.message
	end

  private

    def store_current_location
      store_location_for(:user, request.url)
    end

end
