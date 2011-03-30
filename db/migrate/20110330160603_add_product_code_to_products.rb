class AddProductCodeToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :product_code, :string, :limit => 8
  end

  def self.down
    remove_column :products, :product_code
  end
end
