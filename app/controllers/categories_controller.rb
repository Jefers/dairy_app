class CategoriesController < ApplicationController
    respond_to :html
    before_filter :authenticate_customer!, :except => [:show, :index]
    load_and_authorize_resource
  # GET /categories
  # GET /categories.xml
  def index
    @categories = Category.all
    respond_with(@categories)
  end

  # GET /categories/1
  # GET /categories/1.xml
  def show
    @categories = Category.all
    @category = Category.find(params[:id])
    respond_with(@category)
  end

  # GET /categories/new
  # GET /categories/new.xml
  def new
    @categories = Category.all
    @category = Category.new
    respond_with(@category)
  end

  # GET /categories/1/edit
  def edit
    @categories = Category.all
    @category = Category.find(params[:id])
  end

  # POST /categories
  # POST /categories.xml
  def create
    @category = Category.new(params[:category])

    respond_to do |format|
      if @category.save
        flash[:notice] = 'new Category was successfully created.'
        format.html { redirect_to(@category) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /categories/1
  # PUT /categories/1.xml
  def update
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to(@category, :notice => 'Category was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.xml
  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to(categories_url) }
      format.xml  { head :ok }
    end
  end

  # Left_bar menu list
  def list
    @categories = Category.all
    respond_with(@categories)
  end
end
