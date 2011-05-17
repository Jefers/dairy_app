module ApplicationHelper

  # Use within views to set the page's HTML meta description
  def description(text)
    content_for(:description) { text }
  end

  def url_for(options = nil)
    if Hash === options
      options[:protocol] ||= 'http'
    end
    super(options)
  end

  def process_status(status, attributes = {}, &block)
    not_processed = " Not processed"
    processed = " Processed"
    if status.nil?
      not_processed
    else
      processed
    end
  end

  def spacer(number)   # :TODO would be nice if this sort of thing worked!!!
    puts "&#160;" * number
  end

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

  def del
    del = image_tag("del.png", :alt => "", :class => "del")
  end

  def logo
    logo = image_tag("wd_banner_opt.png", :alt => "Walden Dairy", :id => "logo")
  end

  def hols
    hols = image_tag("easter_grass.png", :alt => "hols", :id => "hols")
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

  # Format a float as £123.45
  def format_sterling(amt)
    sprintf("&pound;%0.2f", amt)
  end

  def format_price(n)
    a,b = sprintf("%0.2f", n).split('.')
    a.gsub!(/(\d)(?=(\d{3})+(?!\d))/, '\\1,')
    "#{a}.#{b}"
  end


  # Format a date as dd/mm/yy
  def format_date(date)
    if date != nil
      date.strftime("%d-%m-%Y")
    end
  end

  # Format a date as DD, MM, d, yy
  def format_long_date(date)
    if date != nil
      date.strftime("%a %d/%m/%y")
    end
  end

  # Format a date as DD, MM, d, yy
  def format_very_long_date(date)
    if date != nil
      date.strftime("%A %d %B %Y")
    end
  end

  def format_date_time(datetime)
    datetime.strftime('%d/%m/%Y @ %r')
  end

  def datedmy(date)
    date.strftime(date, '%d/%m/%Y')
  end

  def link_to_show(record)
    link_to image_tag("icon_view.gif", :title=>"view", :mouseover => "/images/icon_view.png"), :action => "show", :id => record.id
  end

  def link_to_edit(record)
    link_to image_tag("icon_edit.gif", :title=>"edit", :mouseover => "/images/icon_edit.png"), :action => "edit", :id => record.id
  end

# :TODO must be able to come up with better than this? when you do remove the link_to_delete method
  def edit_img()
    image_tag("icon_edit.gif", :title=>"edit", :mouseover => "/images/icon_edit.png")
  end

  def destroy_img()
    image_tag("icon_trash.gif", :title=>"delete", :mouseover => "/images/icon_trash.png")
  end

  def link_to_delete(record)
    link_to image_tag("icon_trash.gif", :title=>"delete", :mouseover => "/images/icon_trash.png"), record, :confirm => 'Are you sure you want to delete this?', :method => :delete
  end

  def empty_basket
    image_tag("basket.png", :alt => "", :class => "empty_basket")
  end

  def full_basket
    image_tag("basket.png", :alt => "", :class => "full_basket")
  end

  def image_sprite(image, options = {})
      sprites = {
        :add_icon           => {:w => 16,   :h => 16,   :x => 0,    :y => 0},
        :email              => {:w => 26,   :h => 16,   :x => 41,   :y => 0},
        :print              => {:w => 25,   :h => 17,   :x => 68,   :y => 0},
        :trash              => {:w => 10,   :h => 11,   :x => 94,   :y => 0},
        :comments           => {:w => 13,   :h => 13,   :x => 105,  :y => 0},
        :comments_read      => {:w => 13,   :h => 13,   :x => 120,  :y => 0},
        :comments_unread    => {:w => 13,   :h => 13,   :x => 135,  :y => 0},
        :rss                => {:w => 14,   :h => 14,   :x => 150,  :y => 0},
        :ical               => {:w => 14,   :h => 16,   :x => 166,  :y => 0},
        :drag               => {:w => 11,   :h => 11,   :x => 360,  :y => 0},
        :timeclock          => {:w => 17,   :h => 17,   :x => 375,  :y => 0},
        :timeclock_off      => {:w => 17,   :h => 17,   :x => 392,  :y => 0}
      }
      %(<span class="sprite #{options[:class]}" style="background: url(#{path_to_image('/images/wd_sprites.png')}) no-repeat -#{sprites[image][:x]}px -#{sprites[image][:y]}px; width: #{sprites[image][:w]}px; padding-top: #{sprites[image][:h]}px; #{options[:style]}" title="#{options[:title]}">#{options[:title]}</span>)
    end

  def wd_sprite(image, options = {})
    sprites = {
      :sectionsprites  => { :w => 260, :h => 96, :x => 0  , :y => 0     },
      :tweetbird_opt   => { :w => 264, :h => 90, :x => 0  , :y => -96    },
      :i_notice        => { :w => 36,  :h => 32, :x => 0  , :y => -186   },
      :basket          => { :w => 19,  :h => 32, :x => -36 , :y => -186   },
      :mag_glass       => { :w => 25,  :h => 25, :x => -55 , :y => -186   },
      :icon_view       => { :w => 16,  :h => 16, :x => -80 , :y => -186   },
      :icon_edit       => { :w => 16,  :h => 16, :x => -96 , :y => -186   },
      :icon_view       => { :w => 16,  :h => 16, :x => -112, :y => -186   },
      :icon_edit       => { :w => 16,  :h => 16, :x => -128, :y => -186   },
      :island_beta     => { :w => 80,  :h => 15, :x => -144, :y => -186   },
      :icon_trash      => { :w => 10,  :h => 12, :x => -224, :y => -186   },
      :icon_trash      => { :w => 10,  :h => 12, :x => -234, :y => -186   },
      :del             => { :w => 8 ,  :h => 8,  :x => -244, :y => -186   },
    }
    %(<span class="sprite #{options[:class]}" style="background: url(#{path_to_image('/images/walden_sprite.png')}) no-repeat -#{sprites[image][:x]}px -#{sprites[image][:y]}px; width: #{sprites[image][:w]}px; padding-top: #{sprites[image][:h]}px; #{options[:style]}" title="#{options[:title]}">#{options[:title]}</span>)
  end
end