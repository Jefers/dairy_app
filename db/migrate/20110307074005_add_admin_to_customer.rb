class AddAdminToCustomer < ActiveRecord::Migration
  def self.up
    add_column :customers, :admin, :boolean
  end

  def self.down
    remove_column :customers, :admin
  end
end
