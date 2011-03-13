class ApplicationController < ActionController::Base
  protect_from_forgery
  # check_authorization :unless => :devise_controller?
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to root_url
  end

  
  private

  def current_ability
    @current_ability ||= CustomerAbility.new(current_customer)
  end
  
end
