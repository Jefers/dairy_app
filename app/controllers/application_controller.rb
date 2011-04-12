class ApplicationController < ActionController::Base
  layout :layout_by_resource
  protect_from_forgery
  # check_authorization :unless => :devise_controller?
  rescue_from CanCan::AccessDenied do |exception|
    Rails.logger.debug "Access denied to #{current_customer.name} on action #{exception.action} with subject #{exception.subject.inspect}"
    flash[:error] = "Access denied."
    redirect_to root_url
  end


  protected

  def layout_by_resource
    if devise_controller?
      'devise_layout'
    else
      "application"
    end
  end

  private

  def current_ability
    @current_ability ||= CustomerAbility.new(current_customer)
  end

end
