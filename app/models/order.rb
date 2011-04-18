class Order < ActiveRecord::Base
  belongs_to :customer
  has_many :products, :through => :line_items
  has_many :line_items
  attr_accessible :status, :name, :address, :email, :pay_type, :required_date
  attr_writer :current_step

  PAYMENT_TYPES = [
                  #  Displayed       stored in db
                  [ "Cheque",          "Chq" ],
                  [ "BACS",           "Bacs" ]
                  ]

# from: http://rails-bestpractices.com/posts/16-dry-metaprogramming
#   STATUSES = [ "ok", "ig" ]
# validates_inclusion_of :status, :in => STATUSES
#
#   class << self
#     STATUSES.each do |status_name|
#       define_method "all_#{status}" do
#         find.where(:status => status_name)
#       end
#     end
#   end
#
#
#   STATUSES.each do |status_name|
#     define_method "#{status_name}?" do
#       self.status == status_name
#     end
#   end

  validates_presence_of :name, :address, :email, :required_date, :pay_type
  # validates_inclusion_of :pay_type, :in => PAYMENT_TYPES.map {|disp, value| value}

  module Scopes
      def by_customer(customer)
        where(:customer_id => customer)
      end
      def unseen
        where(:status => nil)
      end
  end
  extend Scopes

  def total_price
    # self.line_items.map(&:total_price).sum
    self.line_items.sum('total_price')
  end

  def add_line_items_from_cart(cart)
    cart.items.each do |item|
      li = LineItem.from_cart_item(item)
      line_items << li
    end
  end


  # validates_presence_of :shipping_name, :if => lambda { |o| o.current_step == "shipping" }
  # validates_presence_of :billing_name, :if => lambda { |o| o.current_step == "billing" }

  def current_step
    @current_step || steps.first
  end

  def steps
    %w[shipping confirmation]
  end

  def next_step
    self.current_step = steps[steps.index(current_step)+1]
  end

  def previous_step
    self.current_step = steps[steps.index(current_step)-1]
  end

  def first_step?
    current_step == steps.first
  end

  def last_step?
    current_step == steps.last
  end

  def all_valid?
    steps.all? do |step|
      self.current_step = step
      valid?
    end
  end

end

