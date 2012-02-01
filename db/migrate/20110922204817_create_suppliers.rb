class CreateSuppliers < ActiveRecord::Migration
  def self.up
    create_table :suppliers do |t|
      t.string :name
      t.string :address
      t.string :address_2
      t.string :address_3
      t.string :town
      t.string :post_code
      t.string :contact_telephone
      t.string :email_address
      t.text :information
      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :suppliers
  end
end
