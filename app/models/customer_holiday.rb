class CustomerHoliday < ActiveRecord::Base
  belongs_to :customer
  delegate  :urn, :round, :name, :email, :telephone, :address, :address_2, :address_3, :town, :post_code, :to => :customer, :prefix => true  # ~ LoD ~ this would allow @customer_holiday.customer_name

  validates :from_date, :presence => true
  validates :to_date, :presence => true, :date_range => true

  module Scopes
      def by_customer(customer)
        where(:customer_id => customer)
      end
      def unseen
        where(:status => nil)
      end
  end
  extend Scopes


end
