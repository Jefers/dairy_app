class AddTitleToCategory < ActiveRecord::Migration
  def self.up
    add_column :categories, :title, :string
  end

  def self.down
    remove_column :categories, :title
  end
end
