class CustomerHolidaysController < ApplicationController
  # load_and_authorize_resource
  before_filter :authenticate_customer!
  layout 'full_page_layout'
  # GET /customer_holidays
  # GET /customer_holidays.xml
  def index
    if current_customer.try(:admin?)
      @customer_holidays = CustomerHoliday.unseen
    else
      @customer_holidays = CustomerHoliday.by_customer(current_customer)
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @customer_holidays }
    end
  end

  # GET /customer_holidays/1
  # GET /customer_holidays/1.xml
  def show
    if current_customer.try(:admin?)
      @customer_holiday = CustomerHoliday.find(params[:id])
    else
      @customer_holiday = CustomerHoliday.by_customer(current_customer).find(params[:id])
    end
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @customer_holiday }
    end
  end

  # GET /customer_holidays/new
  # GET /customer_holidays/new.xml
  def new
    @customer_holiday = CustomerHoliday.new
    @customer_holiday.customer_id = current_customer.id
    customer_default_values
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @customer_holiday }
    end
  end

  # GET /customer_holidays/1/edit
  def edit
    if current_customer.try(:admin?)
      @customer_holiday = CustomerHoliday.find(params[:id])
    else
      @customer_holiday = CustomerHoliday.by_customer(current_customer).find(params[:id])
    end

    customer_default_values

  end

  # POST /customer_holidays
  # POST /customer_holidays.xml
  def create
    @customer_holiday = CustomerHoliday.new(params[:customer_holiday])

    respond_to do |format|
      if @customer_holiday.save
        CustomerHolidayMailer.customer_holiday_email(@customer_holiday).deliver
        format.html { redirect_to(@customer_holiday, :notice => 'Customer holiday was successfully created. An email has been sent to you.') }
        format.xml  { render :xml => @customer_holiday, :status => :created, :location => @customer_holiday }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @customer_holiday.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /customer_holidays/1
  # PUT /customer_holidays/1.xml
  def update
    @customer_holiday = CustomerHoliday.find(params[:id])

    respond_to do |format|
      if @customer_holiday.update_attributes(params[:customer_holiday])
        format.html { redirect_to(@customer_holiday, :notice => 'Customer holiday was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @customer_holiday.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /customer_holidays/1
  # DELETE /customer_holidays/1.xml
  def destroy
    @customer_holiday = CustomerHoliday.find(params[:id])
    @customer_holiday.destroy

    respond_to do |format|
      format.html { redirect_to(customer_holidays_url) }
      format.xml  { head :ok }
    end
  end


  private
   def customer_default_values
     @customer_holiday.urn = @customer_holiday.customer_urn if @customer_holiday.urn.blank?
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
