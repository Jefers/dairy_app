class QuicknotesController < ApplicationController
  before_filter :authenticate_customer!
  layout 'full_page_layout'
  respond_to :html
  # GET /quicknotes
  # GET /quicknotes.xml
  def index
    @quicknotes = Quicknote.all
    respond_with(@quicknotes)
  end

  # GET /quicknotes/1
  # GET /quicknotes/1.xml
  def show
    @quicknote = Quicknote.find(params[:id])
    respond_with(@quicknote)
  end

  # GET /quicknotes/new
  # GET /quicknotes/new.xml
  def new
    @quicknote = Quicknote.new
    customer_id = params[:customer_id]
    @quicknote.customer_id = customer_id

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @quicknote }
    end
  end

  # GET /quicknotes/1/edit
  def edit
    @quicknote = Quicknote.find(params[:id])
  end

  # POST /quicknotes
  # POST /quicknotes.xml
  def create
    @quicknote = Quicknote.new(params[:quicknote])

    if @quicknote.save
      flash[:notice] = "Quicknote was successfully created. An email has been sent to you."
      QuicknoteMailer.quicknote_email(@quicknote).deliver
    end
    respond_with(@quicknote)
  end

  # PUT /quicknotes/1
  # PUT /quicknotes/1.xml
  def update
    @quicknote = Quicknote.find(params[:id])

    respond_to do |format|
      if @quicknote.update_attributes(params[:quicknote])
        format.html { redirect_to(@quicknote, :notice => 'Quicknote was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @quicknote.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /quicknotes/1
  # DELETE /quicknotes/1.xml
  def destroy
    @quicknote = Quicknote.find(params[:id])
    @quicknote.destroy

    respond_to do |format|
      format.html { redirect_to(quicknotes_url) }
      format.xml  { head :ok }
    end
  end
end
