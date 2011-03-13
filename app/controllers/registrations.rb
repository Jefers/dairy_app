# app/config/routes.rb
# devise_for :users, :controllers => {:registrations => "registrations"}


# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    # add custom create logic here
  end

  def update
    super
  end
end