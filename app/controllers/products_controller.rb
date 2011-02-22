class ProductsController < ApplicationController 
  respond_to :html, :xml, :json
  autocomplete :search, :name, :full => true
  before_filter :authenticate_customer!, :except => [:show, :index, :for_category]
  before_filter :find_cart, :except => :empty_cart
  helper_method :sort_column, :sort_direction
  respond_to :js    #autocomplete - needed? needs respond_with in method
  attr_accessor :perPage, :show_pictures
  
  # GET /products
  # GET /products.xml
  def index
    if params[:per_page]
      cookies.permanent[:perPage] = params[:per_page]
    else
      cookies[:perPage] = 7
    end

    # @products = Product.all.paginate(:per_page => 3, :page => params[:page])
    # cookies.permanent[:perPage] = params[:per_page] ||= 7
    # @products = Product.all.paginate(:per_page => 3, :page => params[:page])
    @categories = Category.all
    # @products = Product.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => cookies[:perPage], :page => params[:page])
    @products = Product.search(params[:search]).available.order(sort_column + " " + sort_direction)

    # Would have been nice to have this integrated in but pagination doesn't play well with it!
    # if params[:discontinued]
    #   @products = @products.where(:discontinued => (params[:discontinued] == "1"))
    # end   

    if params[:category_id]
      @products = @products.where(:category_id => (params[:category_id] == "1"))    
    end 

    respond_with(@products)
    
  end
  
  def for_category
    if params[:per_page]
      cookies.permanent[:perPage] = params[:per_page]
    else
      cookies[:perPage] = 7
    end

    @categories = Category.all
    @category = Category.find(params[:category_id])
    @products = Product.search(params[:search]).available.order(sort_column + " " + sort_direction)
    @products = @products.select{ |product| product.category == @category }

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
    #@product.attributes = params[:product]
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

    def checkout
      if @cart.items.empty?
        redirect_to_index("Your cart is empty")
      else
        @order = Order.new
      end
    end

    def save_order
      @order = Order.new(params[:order])
      @order.add_line_items_from_cart(@cart)
      if @order.save
        session[:cart] = nil
        redirect_to_index("Thank you for your order")
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
