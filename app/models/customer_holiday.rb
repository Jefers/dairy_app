class CustomerHoliday < ActiveRecord::Base
  belongs_to :customer
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
