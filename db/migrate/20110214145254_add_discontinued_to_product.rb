class AddDiscontinuedToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :discontinued, :boolean
  end

  def self.down
    remove_column :products, :discontinued
  end
end
