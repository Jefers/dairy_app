class DeviseAddLastseenableCustomer < ActiveRecord::Migration
  def self.up
    add_column :customers, :last_seen, :datetime
  end
  
  def self.down
    remove_column :customers, :last_seen
  end
end