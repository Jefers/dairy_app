class OrdersController < ApplicationController
  respond_to :html
  before_filter :authenticate_customer!, :except => [:my_orders]
  load_and_authorize_resource
  skip_authorize_resource :only => :my_orders
  # load_and_authorize_resource :only => [:index, :show]
  layout 'full_page_layout'
  # for PDF
  # caches_page :my_orders

  # GET /orders
  # GET /orders.xml
  def index
    @orders = index_resources
    respond_with(@orders)
  end

  # GET /orders/1
  # GET /orders/1.xml
  def show
    @order = resource
    respond_with(@order)
  end

  # GET /orders/new
  # GET /orders/new.xml
  def new
    @order = Order.new
    respond_with(@order)
  end

  # GET /orders/1/edit
  def edit
    @order = resource
  end

  # POST /orders
  # POST /orders.xml
  def create
    @order = Order.new(params[:order])

    respond_to do |format|
      if @order.save
        flash[:notice] = 'Order was successfully created.'
        format.html { redirect_to(@order) }
        format.xml  { render :xml => @order, :status => :created, :location => @order }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.xml
  def update
    @order = resource
    respond_to do |format|
      if @order.update_attributes(params[:order])
        flash[:notice] = 'Order was successfully updated.'
        format.html { redirect_to(@order) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.xml
  def destroy
    @order = resource
    @order.destroy

    respond_to do |format|
      format.html { redirect_to(orders_url) }
      format.xml  { head :ok }
    end
  end

  def my_orders
    if current_customer.try(:admin?)
      @orders = Order.unseen
    else
      @orders = current_customer.try(:orders).reverse
    end

    # format.pdf {
    #   html = render_to_string(:action => "my_orders.html.erb")
    #   kit = PDFKit.new(html)
    #   kit.stylesheets << "#{Rails.root}/public/stylesheets/print.css"
    #   send_data kit.to_pdf, :filename => "Your-custom-filename.pdf", :type => 'application/pdf'
    # }

    # respond_to do |format|
    #       format.html # show.html.erb
    #       format.pdf { render :text => PDFKit.new( post_url(@post) ).to_pdf }
    # end

    respond_to do |format|
      format.html # index.html.erb
      format.pdf {
        html = render_to_string(:action => "my_orders.html.erb")
        kit = PDFKit.new(html)
        kit.stylesheets << "#{Rails.root}/public/stylesheets/compiled/print.css"
        send_data kit.to_pdf, :filename => "My_Orders.pdf", :type => 'application/pdf'
      }
      format.xml  { render :xml => @orders }
    end
  end

  private

  def index_resources
    if params[:customer_id]
      current_customer.try(:admin?) ? Order.by_customer(params[:customer_id]) : Order.by_customer(current_customer)
    else
      current_customer.try(:admin?) ? Order.find(:all).reverse : Order.by_customer(current_customer)
    end
  end

  def resource
    current_customer.try(:admin?) ? Order.find(params[:id]) : Order.by_customer(current_customer).find(params[:id])
  end

end
