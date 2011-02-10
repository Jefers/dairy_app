class Product < ActiveRecord::Base
  
  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "98x98#" },
    :url => "/assets/products/:id/:style/:basename.:extension",  
    :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension" 

     #validates_attachment_presence :logo  
     # validates_attachment_size :picture, :less_than => 5.megabytes  
     # validates_attachment_content_type :picture, :content_type => ['image/jpg', 'image/jpeg', 'image/png'] 
end
