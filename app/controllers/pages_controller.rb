class PagesController < ApplicationController

  def home
    @title = "Home"
  end

  def contact
    @title = "Contact"
  end

  def about
    @title = "About"
  end

  def help
    @title = "Help"
  end

  def disclaimer
    @title = "Disclaimer"
  end

  def privacy
    @title = "Privacy"
  end

  def security
    @title = "Security"
  end

end

