module ApplicationHelper
  def logo
    logo = image_tag("logo.png", :alt => "Sample App", :class => "round")
  end

  # Return a title on a per-page basis.
  def title
    base_title = "Dairy"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

  def quid(price)
    number_to_currency(price, :unit => "&pound;")
  end

end

