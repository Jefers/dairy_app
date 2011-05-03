class CustomerHoliday < ActiveRecord::Base
  belongs_to :customer
  # attr_accessor :terms_of_service, :email, :password, :picture, :picture_file_size, :picture_content_type, :price, :position, :category_id, :product_code  # :TODO cs_validations [, :validate => true]
  delegate  :urn, :round, :name, :email, :telephone, :address, :address_2, :address_3, :town, :post_code, :terms_of_service, :to => :customer, :prefix => true  # ~ LoD ~ this would allow @customer_holiday.customer_name

  validates :from_date, :presence => true
  validates :to_date, :presence => true, :date_range => true
  validates :name, :presence => true

  module Scopes
      def by_customer(customer)
        where(:customer_id => customer)
      end
      def unseen
        where(:status => nil)
      end
      def seen
        where("status IS NOT NULL")
      end
  end
  extend Scopes


end
