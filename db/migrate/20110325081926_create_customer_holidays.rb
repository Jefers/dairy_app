class CreateCustomerHolidays < ActiveRecord::Migration
  def self.up
    create_table :customer_holidays do |t|
      t.integer :customer_id
      t.string :title
      t.string :urn
      t.string :round
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :address_2
      t.string :address_3
      t.string :town
      t.string :post_code
      t.string :contact_telephone
      t.string :email_address
      t.date :from_date
      t.date :to_date
      t.boolean :confirmed
      t.text :notes
      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :customer_holidays
  end
end
