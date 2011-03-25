class RemoveAddressFromOrder < ActiveRecord::Migration
  def self.up
    remove_column :orders, :address
  end

  def self.down
    add_column :orders, :address, :text
  end
end
