class ProductsController < ApplicationController
  respond_to :html, :xml, :json, :js
  autocomplete :product, :name , :full => true
  before_filter :authenticate_customer!, :except => [:show, :index, :for_category, :autocomplete_product_name]
  before_filter :find_cart, :except => :empty_cart
  helper_method :sort_column, :sort_direction
  attr_accessor :perPage, :show_pictures


  def quick_list
     # render :layout => 'full_page_layout'
    @products = Product.order_by_category_and_position.all

  end

  # GET /products
  # GET /products.xml
  def index
    if params[:per_page]
      cookies.permanent[:perPage] = params[:per_page]
    else
      cookies[:perPage] ||= 20
    end

    @categories = Category.all
    if params[:search]
      @products = Product.search(params[:search]).available.order_by_category.page(params[:page]).per(cookies[:perPage])
    else
      if current_customer.try(:admin?)
        @products = Product.order(sort_column + " " + sort_direction).page(params[:page]).per(cookies[:perPage])
      else
        @products = Product.available.order(sort_column + " " + sort_direction).page(params[:page]).per(cookies[:perPage])
      end
    end

    if params[:category_id]
      @products = @products.where(:category_id => (params[:category_id] == "1"))
    end

    respond_with(@products)

  end

  def for_category
    if params[:per_page]
      cookies.permanent[:perPage] = params[:per_page]
    else
      cookies[:perPage] ||= 20
    end

    @categories = Category.all
    @category = Category.find(params[:category_id])
    @cat = params[:category_id]
    @products = Product.search(params[:search]).where(:category_id => @cat).order(sort_column + " " + sort_direction).page(params[:page]).per(cookies[:perPage])
    # @products = @products.select{ |product| product.category == @category }

    respond_with(@products)

  end

  # GET /products/1
  # GET /products/1.xml
  def show
    @categories = Category.all
    @product = Product.find(params[:id])

    respond_with(@product)

  end

  # GET /products/new
  # GET /products/new.xml
  def new
    @categories = Category.all
    @product = Product.new

    respond_with(@product)

  end

  # GET /products/1/edit
  def edit
    @categories = Category.all
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.xml
  def create
    @product = Product.new(params[:product])
    @product = Product.create( params[:product] )  #TODO why is this line here???
    #@product.accessible = :all if admin?
    # @product.attributes = params[:product]
    respond_to do |format|
      if @product.save
        format.html { redirect_to(@product, :notice => 'Product was successfully created.') }
        format.xml  { render :xml => @product, :status => :created, :location => @product }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.xml
  def update
    @product = Product.find(params[:id])
    #@product.accessible = :all if admin?
    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to(@product, :notice => 'Product was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.xml
  def destroy
    @categories = Category.all
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to(products_url) }
      format.xml  { head :ok }
    end
  end

  def add_to_cart
    product = Product.find(params[:id])
    @current_item = @cart.add_product(product)
    respond_to do |format|
      format.js if request.xhr?
      format.html {redirect_to_index}
    end
  rescue ActiveRecord::RecordNotFound
    logger.error("Attempt to access invalid product #{params[:id]}")
    redirect_to_index("Invalid product")
  end

  def remove_from_cart
    product = Product.find(params[:id])
    @current_item = @cart.remove_product(product)
      respond_to do |format|
        format.js if request.xhr?
        format.html {redirect_to_index}
      end
    rescue ActiveRecord::RecordNotFound
      logger.error("Attempt to access invalid product #{params[:id]}")
      redirect_to_index("Invalid product")
  end

  def checkout
    if @cart.items.empty?
      redirect_to_index("Your cart is empty")
    else
      @order = Order.new
    end
  end

  def save_order
    # @order = Order.new(params[:order])
    # @order.customer_id = params[:customer_id]  # :TODO review this later
    @order = current_customer.orders.build(params[:order])

    @order.add_line_items_from_cart(@cart)
    if @order.save
      # raise @order.add_line_items_from_cart(@cart).inspect
      OrderMailer.order_email(@order).deliver
      session[:cart] = nil
      redirect_to_index("Thank you for your order. An email has been sent to you.")
    else
      render :action => 'checkout'
    end
  end

  def empty_cart
    session[:cart] = nil
    redirect_to_index
  end


  private

  def redirect_to_index(msg = nil)
    flash[:notice] = msg if msg
    redirect_to(root_path)
  end

  def find_cart
    @cart = (session[:cart] ||= Cart.new)
  end

  def sort_column
    Product.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
