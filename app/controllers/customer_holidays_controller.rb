class CustomerHolidaysController < ApplicationController
  before_filter :authenticate_customer!
  layout 'full_page_layout'
  # GET /customer_holidays
  # GET /customer_holidays.xml
  def index
    if current_customer.try(:admin?)
      @customer_holidays = CustomerHoliday.all
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
    @customer_holiday = CustomerHoliday.by_customer(current_customer).find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @customer_holiday }
    end
  end

  # GET /customer_holidays/new
  # GET /customer_holidays/new.xml
  def new
    @customer_holiday = CustomerHoliday.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @customer_holiday }
    end
  end

  # GET /customer_holidays/1/edit
  def edit
    @customer_holiday = CustomerHoliday.by_customer(current_customer).find(params[:id])
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
end
