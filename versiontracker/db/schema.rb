# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100306100901) do

  create_table "components", :force => true do |t|
    t.string   "name"
    t.string   "c_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "signature_versions", :force => true do |t|
    t.integer  "signature_id"
    t.integer  "version_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "signatures", :force => true do |t|
    t.datetime "date"
    t.float    "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",               :null => false
    t.string   "crypted_password",    :null => false
    t.string   "password_salt",       :null => false
    t.string   "persistence_token",   :null => false
    t.string   "single_access_token", :null => false
    t.string   "perishable_token",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "versions", :force => true do |t|
    t.string   "version_num"
    t.integer  "component_id"
    t.string   "sig_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
