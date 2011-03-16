class AddOutOfStockToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :out_of_stock, :boolean
  end

  def self.down
    remove_column :products, :out_of_stock
  end
end
