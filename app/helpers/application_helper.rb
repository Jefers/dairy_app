module ApplicationHelper
  
  def hidden_div_if(condition, attributes = {}, &block)
    if condition
      attributes["style"] = "display: none"
    end
    content_tag("div", attributes, &block)
  end
  
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  end
  
  def logo
    logo = image_tag("logo.png", :alt => "Walden Dairy", :id => "logo")
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

