class AddAddressLinesToCustomer < ActiveRecord::Migration
  def self.up
    add_column :customers, :address, :string
    add_column :customers, :address_2, :string
    add_column :customers, :address_3, :string
    add_column :customers, :town, :string
  end

  def self.down
    remove_column :customers, :town
    remove_column :customers, :address_3
    remove_column :customers, :address_2
    remove_column :customers, :address
  end
end
