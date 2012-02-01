# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110926062412) do

  create_table "announcements", :force => true do |t|
    t.string   "title"
    t.text     "news"
    t.date     "published_from"
    t.date     "published_to"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  create_table "customer_holidays", :force => true do |t|
    t.integer  "customer_id"
    t.string   "title"
    t.string   "urn"
    t.string   "round"
    t.string   "address"
    t.string   "address_2"
    t.string   "address_3"
    t.string   "town"
    t.string   "post_code"
    t.string   "contact_telephone"
    t.string   "email_address"
    t.date     "from_date"
    t.date     "to_date"
    t.boolean  "confirmed"
    t.text     "notes"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "status",            :limit => 2
    t.boolean  "processed"
  end

  create_table "customers", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
    t.integer  "urn",                  :limit => 8
    t.string   "name"
    t.string   "post_code",            :limit => 8
    t.string   "telephone",            :limit => 14
    t.string   "round",                :limit => 1
    t.string   "role"
    t.string   "address"
    t.string   "address_2"
    t.string   "address_3"
    t.string   "town"
    t.datetime "last_seen"
  end

  add_index "customers", ["email"], :name => "index_customers_on_email", :unique => true
  add_index "customers", ["reset_password_token"], :name => "index_customers_on_reset_password_token", :unique => true

  create_table "line_items", :force => true do |t|
    t.integer  "product_id",                                :null => false
    t.integer  "order_id",                                  :null => false
    t.integer  "quantity",                                  :null => false
    t.decimal  "total_price", :precision => 8, :scale => 2, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "pay_type",      :limit => 10
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "customer_id"
    t.boolean  "repeat",                      :default => true
    t.date     "required_date"
    t.string   "address"
    t.string   "address_2"
    t.string   "address_3"
    t.string   "town"
    t.string   "post_code"
    t.text     "instructions"
    t.string   "status",        :limit => 2
    t.boolean  "processed"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "price",                             :precision => 8, :scale => 2
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.integer  "category_id"
    t.boolean  "discontinued"
    t.boolean  "out_of_stock"
    t.text     "description"
    t.string   "product_code",         :limit => 8
    t.integer  "position"
    t.integer  "supplier_id"
  end

  create_table "quicknotes", :force => true do |t|
    t.integer  "customer_id"
    t.string   "subject"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "suppliers", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "address_2"
    t.string   "address_3"
    t.string   "town"
    t.string   "post_code"
    t.string   "contact_telephone"
    t.string   "email_address"
    t.text     "information"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
