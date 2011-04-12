# app/config/routes.rb
# devise_for :users, :controllers => {:registrations => "registrations"}


# app/controllers/registrations_controller.rb
class MyRegistrationsController < Devise::RegistrationsController
  prepend_view_path "app/views/devise"
  def new
    super
    render :layout => 'two_column_page_layout'
  end

  def create
    super
    # add custom create logic here
  end

  def update
    super
  end
end