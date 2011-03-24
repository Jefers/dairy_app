class CustomersController < ApplicationController
  load_and_authorize_resource
  before_filter :authenticate_customer!
  layout 'full_page_layout'
  respond_to :html

  def index
    respond_with(@customers = Customer.all)
  end

  def new
    respond_with(@customer = Customer.new)
  end

  def create
    @customer = Customer.new(params[:customer])
    flash[:notice] = "Customer successfully created" if @customer.save
    respond_with(@customer)
  end

  def edit
    respond_with(@customer = Customer.find(params[:id]))
  end

  def update
    # @customer = Customer.find(params[:id])
    # @customer.update_attributes(params[:customer])
    # respond_with(@customer)
    if @customer.update_attributes(params[:customer])
      redirect_to @customer, :notice => "Successfully updated customer."
    else
      render :action => 'edit'
    end
  end


end
