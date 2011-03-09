class AddCustomerToOrders < ActiveRecord::Migration
  def self.up
    add_column :orders, :customer_id, :integer
    add_column :orders, :repeat, :boolean, :default => 1
    add_column :orders, :required_date, :date
  end

  def self.down
    remove_column :orders, :customer_id
    remove_column :orders, :repeat
    remove_column :orders, :required_date
  end
end
