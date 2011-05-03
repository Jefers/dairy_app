class CustomerHolidaysController < ApplicationController
  # load_and_authorize_resource
  before_filter :authenticate_customer!
  layout 'full_page_layout'
  respond_to :html
  # GET /customer_holidays
  def index
    @customer_holidays = index_resources
    respond_with(@customer_holidays)
  end

  # GET /customer_holidays/1
  def show
    @customer_holiday = resource
    respond_with(@customer_holiday)
  end

  # GET /customer_holidays/new
  def new
    @customer_holiday = CustomerHoliday.new
    @customer_holiday.customer_id = current_customer.id
    customer_default_values
    respond_with(@customer_holiday)
  end

  # GET /customer_holidays/1/edit
  def edit
    @customer_holiday = resource
    customer_default_values
  end

  # POST /customer_holidays
  def create
    @customer_holiday = CustomerHoliday.new(params[:customer_holiday])

    if @customer_holiday.save
      # cookies[:last_customer_holiday_id] = @customer_holiday.id
      flash[:notice] = "Customer holiday was successfully created. An email has been sent to you."
      CustomerHolidayMailer.customer_holiday_email(@customer_holiday).deliver
    end
    respond_with(@customer_holiday)
  end

  # PUT /customer_holidays/1
  def update
    @customer_holiday = CustomerHoliday.find(params[:id])
    if @customer_holiday.update_attributes(params[:customer_holiday])
      flash[:notice] = "Successfully updated customer holiday."
    end
    respond_with @customer_holiday
  end

  # DELETE /customer_holidays/1
  def destroy
    @customer_holiday = CustomerHoliday.find(params[:id])
    if @customer_holiday.destroy
      flash[:notice] = "Customer holiday is deleted."
    else
      flash[:notice] = "Customer holiday. Error_deleting."
    end
    respond_with @customer_holiday
  end


  def old
    @customer_holidays = current_customer.try(:admin?) ? CustomerHoliday.seen.reverse : CustomerHoliday.by_customer(current_customer)
    respond_with(@customer_holidays)
  end

  private

  def index_resources
      current_customer.try(:admin?) ? CustomerHoliday.unseen.reverse : CustomerHoliday.by_customer(current_customer)
  end

  def resource
    current_customer.try(:admin?) ? CustomerHoliday.find(params[:id]) : CustomerHoliday.by_customer(current_customer).find(params[:id])
  end

  def customer_default_values
   #@customer_holiday.urn ||= @customer_holiday.customer_urn.to_s        # :todo alternative? not working!!!
   #@customer_holiday.urn &&= @customer_holiday.customer_urn.to_s        # :todo this is not working!!!
   @customer_holiday.urn = @customer_holiday.customer_urn.to_s if @customer_holiday.urn.blank?
   @customer_holiday.round = @customer_holiday.customer_round if @customer_holiday.round.blank?
   @customer_holiday.name = @customer_holiday.customer_name if @customer_holiday.name.blank?
   @customer_holiday.address = @customer_holiday.customer_address if @customer_holiday.address.blank?
   @customer_holiday.address_2 = @customer_holiday.customer_address_2 if @customer_holiday.address_2.blank?
   @customer_holiday.address_3 = @customer_holiday.customer_address_3 if @customer_holiday.address_3.blank?
   @customer_holiday.town = @customer_holiday.customer_town if @customer_holiday.town.blank?
   @customer_holiday.post_code = @customer_holiday.customer_post_code if @customer_holiday.post_code.blank?
   @customer_holiday.contact_telephone = @customer_holiday.customer_telephone if @customer_holiday.contact_telephone.blank?
   @customer_holiday.email_address = @customer_holiday.customer_email if @customer_holiday.email_address.blank?
  end
end
