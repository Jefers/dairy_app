class Product < ActiveRecord::Base
#  attr_accessible :name, :price   this broke paperclip ofcourse!!!
  belongs_to :category
  # belongs_to :customer # :todo really. this must be a mistake
  has_many :line_items
  has_many :orders, :through => :line_items

  has_attached_file :picture, :styles => { :massive  => "930x930>", :medium => "300x300>", :thumb => "98x98#", :tiny => "49x49#", :minute => "28x28#" },
    :url => "/assets/products/:id/:style/:basename.:extension",
    :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

  #validates_attachment_presence :picture
  validates_attachment_size :picture, :less_than => 5.megabytes
  validates_attachment_content_type :picture, :content_type => ['image/jpg', 'image/jpeg', 'image/png']

  validates_presence_of :name
  validates_numericality_of :price
  validate :price_must_be_at_least_a_penny
  validates_uniqueness_of :name
  validates_uniqueness_of :position
  validates_presence_of :category_id

  # default_scope :group => 'category_id'
  scope :discontinued, where(:discontinued => true)
  scope :available, where(:discontinued => false)
  scope :category, proc {|category| where(:category_id => category) }
  # scope :cat, where(:category_id => @cat)
  # scope :autocomplete_name, lambda{ |name| {:conditions => ["products.name LIKE ?", "#{name}%"]} }
  # scope :autocomplete_name1, lambda{ |name| {:include => :product, :conditions => ["products.name LIKE ?", "#{name}%"]} }

  module Scopes
      def by_position
        order('position ASC')
      end
      def order_by_category_and_position
        order('category_id ASC').order('position ASC')
      end
      def order_by_category
        order('category_id ASC')
      end
  end
  extend Scopes

  def self.cheaper_than(price)
    where("products.price < ?", price)
  end

  # scope :cheap, cheaper_than(5)

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

# :TODO not used
  def in_stock?
    ! self.out_of_stock?
  end

protected
  def price_must_be_at_least_a_penny
    errors.add(:price, 'should be at least 0.01') if price.nil? ||
                       price < 0.01
  end

end
