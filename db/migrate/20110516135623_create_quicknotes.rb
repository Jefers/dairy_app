class CreateQuicknotes < ActiveRecord::Migration
  def self.up
    create_table :quicknotes do |t|
      t.integer :customer_id
      t.string :subject
      t.text :note

      t.timestamps
    end
  end

  def self.down
    drop_table :quicknotes
  end
end
