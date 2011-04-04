class AddStatusToCustomerHolidays < ActiveRecord::Migration
  def self.up
    add_column :customer_holidays, :status, :string, :limit => 2
    add_column :customer_holidays, :processed, :boolean
  end

  def self.down
    remove_column :customer_holidays, :processed
    remove_column :customer_holidays, :status
  end
end
