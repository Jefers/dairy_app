class Customer < ActiveRecord::Base
  has_many :customer_holidays, :dependent => :destroy
  has_many :line_items, :through => :orders
  has_many :orders, :dependent => :destroy
  before_update :uppercase_post_code
  validates_acceptance_of :terms_of_service, :accept => "1", :message => "You must accept the terms of service"
  attr_accessor :terms_of_service  # :TODO tos needed
  attr_accessible :terms_of_service
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :lastseenable

  # Setup accessible (or protected) attributes for your model :TODO trim these?
  attr_accessible :id, :last_seen, :email, :password, :password_confirmation, :remember_me, :name, :address, :address_2, :address_3, :town, :post_code, :urn, :round, :telephone, :admin, :role
 # scope expandedvv, Book.select('books.*, users.name').joins(:user)
  # scope :customer_orders, Orders.select(joins(:orders)

  ROLES = %w[customer admin moderator banned]


  module Scopes
      def on_line_now
        where('last_seen >= ?', 20.minutes.ago).count
      end
  end
  extend Scopes

  private

  def uppercase_post_code
    self.post_code.try(:upcase!)
  end

  # def customer_orders
  #    self.orders.map(&:name)
  # end
end
