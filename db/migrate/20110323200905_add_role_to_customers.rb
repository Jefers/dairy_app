class AddRoleToCustomers < ActiveRecord::Migration
  def self.up
    add_column :customers, :role, :string
  end

  def self.down
    remove_column :customers, :role
  end
end
