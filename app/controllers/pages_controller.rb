class PagesController < ApplicationController

  def home
    @title = "Home"
    render :layout => 'full_page_layout'
  end

  def contact
    @title = "Contact"
    render :layout => 'c2_c3_layout'
  end

  def about
    @title = "About"
    render :layout => 'full_page_layout'
  end

  def help
    @title = "Help"
    render :layout => 'c2_c3_layout'
  end

  def disclaimer
    @title = "Disclaimer"
    render :layout => 'c2_c3_layout'
  end

  def privacy
    @title = "Privacy"
    render :layout => 'c2_c3_layout'
  end

  def security
    @title = "Security"
    render :layout => 'c2_c3_layout'
  end

  def fun
    @title = "Fun"
    render :layout => 'full_page_layout'
  end

  def help_order
    @title = "Order Help"
    render :layout => 'full_page_layout'
  end

  def help_holiday
    @title = "Holiday Help"
    render :layout => 'full_page_layout'
  end

  def news
    @title = "News"
    render :layout => 'full_page_layout'
  end

  def merchant
    @title = "Suppliers"
    render :layout => 'full_page_layout'
  end

  def pantry
    @title = "Suppliers"
    render :layout => 'c1_c2_layout'
  end

end

