class AddStatusToOrders < ActiveRecord::Migration
  def self.up
    add_column :orders, :status, :string, :limit => 2
    add_column :orders, :processed, :boolean
  end

  def self.down
    remove_column :orders, :processed
    remove_column :orders, :status
  end
end
