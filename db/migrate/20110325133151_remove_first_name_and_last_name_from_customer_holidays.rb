class RemoveFirstNameAndLastNameFromCustomerHolidays < ActiveRecord::Migration
  def self.up
    remove_column :customer_holidays, :first_name
    remove_column :customer_holidays, :last_name
  end

  def self.down
    add_column :customer_holidays, :first_name, :string
    add_column :customer_holidays, :last_name, :string
  end
end
