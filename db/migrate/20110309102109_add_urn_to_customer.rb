class AddUrnToCustomer < ActiveRecord::Migration
  def self.up
    add_column :customers, :urn, :integer, :limit => 5
    add_column :customers, :name, :string
    add_column :customers, :address, :text
    add_column :customers, :post_code, :string, :limit => 8
    add_column :customers, :telephone, :string, :limit => 14
    add_column :customers, :round, :string, :limit => 1
  end

  def self.down
    remove_column :customers, :round
    remove_column :customers, :telephone
    remove_column :customers, :post_code
    remove_column :customers, :address
    remove_column :customers, :name
    remove_column :customers, :urn
  end
end