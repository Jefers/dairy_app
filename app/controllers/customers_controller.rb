class CustomersController < ApplicationController
  load_and_authorize_resource
  before_filter :authenticate_customer!  
  layout 'full_page_layout'
  respond_to :html

  def index
    respond_with(@customers = Customer.all)
  end

  def edit
    respond_with(@customer = Customer.find(params[:id]))
  end
  
  def update
    @customer = Customer.find(params[:id])
    respond_to do |format|
      if @customer.update_attributes(params[:customer])
        flash[:notice] = 'Customer was successfully updated.'
        format.html { redirect_to(@customer.index) }
      else
        format.html { render :action => "edit" }
      end
    end
    
  end
  
end
