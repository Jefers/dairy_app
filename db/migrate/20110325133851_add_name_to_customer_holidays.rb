class AddNameToCustomerHolidays < ActiveRecord::Migration
  def self.up
    add_column :customer_holidays, :name, :string
  end

  def self.down
    remove_column :customer_holidays, :name
  end
end
