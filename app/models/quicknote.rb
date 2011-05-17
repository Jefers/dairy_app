class Quicknote < ActiveRecord::Base
  belongs_to :customer
  delegate  :id, :name, :email, :last_seen, :to => :customer, :prefix => true
end
