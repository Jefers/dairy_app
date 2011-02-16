class ProductsController < ApplicationController
  autocomplete :search, :name, :full => true
  before_filter :authenticate_customer!, :except => [:show, :index]
  helper_method :sort_column, :sort_direction
  respond_to :js    #autocomplete - needed? needs respond_with in method
  attr_accessor :perPage, :show_pictures
  
  # GET /products
  # GET /products.xml
  def index
    if params[:per_page]
      cookies[:perPage] = params[:per_page]
    else
      cookies[:perPage] = 7
    end

    if params[:show_pictures]
      cookies.permanent[:show_pictures] = params[:show_pictures]
    else
      cookies[:show_pictures] = false
    end
    # @products = Product.all.paginate(:per_page => 3, :page => params[:page])
    # cookies.permanent[:perPage] = params[:per_page] ||= 7
    # @products = Product.all.paginate(:per_page => 3, :page => params[:page])
    @categories = Category.all
    @products = Product.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => cookies[:perPage], :page => params[:page])

    # Would have been nice to have this integrated in but pagination doesn't play well with it!
    # if params[:discontinued]
    #   @products = @products.where(:discontinued => (params[:discontinued] == "1"))
    # end   

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end

  # GET /products/1
  # GET /products/1.xml
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/new
  # GET /products/new.xml
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/1/edit
  def edit
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
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to(products_url) }
      format.xml  { head :ok }
    end
  end

  
  private
  
  def sort_column
    Product.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
