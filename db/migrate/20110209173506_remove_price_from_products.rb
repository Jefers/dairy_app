class RemovePriceFromProducts < ActiveRecord::Migration
  def self.up
    remove_column :products, :price
  end

  def self.down
    add_column :products, :price, :decimal, :precision => 8, :scale => 2
  end
end
