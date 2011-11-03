# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20111103120938) do

  create_table "dependencies", :force => true do |t|
    t.integer  "version_id"
    t.string   "name"
    t.string   "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dependencies", ["version_id"], :name => "index_dependencies_on_version_id"

  create_table "downloads", :force => true do |t|
    t.integer  "vendor_id"
    t.integer  "version_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "downloads", ["vendor_id"], :name => "index_downloads_on_vendor_id"
  add_index "downloads", ["version_id"], :name => "index_downloads_on_version_id"

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

  create_table "vendors", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "homepage"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "authors"
    t.string   "email"
    t.string   "slug"
    t.string   "source"
    t.string   "docs"
  end

  add_index "vendors", ["name"], :name => "index_vendors_on_name"
  add_index "vendors", ["slug"], :name => "index_vendors_on_slug", :unique => true
  add_index "vendors", ["user_id"], :name => "index_vendors_on_user_id"

  create_table "versions", :force => true do |t|
    t.integer  "vendor_id"
    t.integer  "user_id"
    t.string   "number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "package"
    t.text     "vendor_spec"
  end

  add_index "versions", ["user_id"], :name => "index_versions_on_user_id"
  add_index "versions", ["vendor_id"], :name => "index_versions_on_vendor_id"

end
