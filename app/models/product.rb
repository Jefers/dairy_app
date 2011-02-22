class Product < ActiveRecord::Base
#  attr_accessible :name, :price   this broke paperclip!!!
  belongs_to :category
  has_many :orders, :through => :line_items
  has_many :line_items
  # default_scope :group => 'category_id'
  scope :discontinued, where(:discontinued => true)
  scope :available, where(:discontinued => false)  
  scope :category, proc {|category| where(:category_id => category) }

  def self.cheaper_than(price)
    where("products.price < ?", price)
  end
  
  scope :cheap, cheaper_than(5)
  
  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
    
  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "98x98#", :tiny => "49x49#" },
    :url => "/assets/products/:id/:style/:basename.:extension",  
    :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension" 

  #validates_attachment_presence :picture
  validates_attachment_size :picture, :less_than => 5.megabytes
  validates_attachment_content_type :picture, :content_type => ['image/jpg', 'image/jpeg', 'image/png']
  
  validates_presence_of :name
  validates_numericality_of :price
  validate :price_must_be_at_least_a_penny
  validates_uniqueness_of :name
  validates_presence_of :category_id

protected
  def price_must_be_at_least_a_penny
    errors.add(:price, 'should be at least 0.01') if price.nil? ||
                       price < 0.01
  end 
end
