class Customer < ActiveRecord::Base
  has_many :line_items, :through => :orders
  has_many :orders, :dependent => :destroy
  validates_acceptance_of :terms_of_service, :accept => "1", :message => "You must accept the terms of service"
  attr_accessor :terms_of_service  # :TODO tos needed
  attr_accessible :terms_of_service
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model :TODO trim these?
  attr_accessible :id, :email, :password, :password_confirmation, :remember_me, :name, :address, :post_code, :urn, :round, :telephone, :admin
 # scope expandedvv, Book.select('books.*, users.name').joins(:user)
  # scope :customer_orders, Orders.select(joins(:orders)

  def customer_orders
     self.orders.map(&:name)
  end
end
