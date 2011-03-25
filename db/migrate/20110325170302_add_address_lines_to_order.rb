class AddAddressLinesToOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :address, :string
    add_column :orders, :address_2, :string
    add_column :orders, :address_3, :string
    add_column :orders, :town, :string
    add_column :orders, :post_code, :string
    add_column :orders, :instructions, :text
  end

  def self.down
    remove_column :orders, :instructions
    remove_column :orders, :post_code
    remove_column :orders, :town
    remove_column :orders, :address_3
    remove_column :orders, :address_2
    remove_column :orders, :address
  end
end
