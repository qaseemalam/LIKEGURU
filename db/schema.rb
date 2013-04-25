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

ActiveRecord::Schema.define(:version => 20120903023955) do

  create_table "fbclickdata", :force => true do |t|
    t.string   "Like_Id"
    t.string   "Like_category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fblikes", :force => true do |t|
    t.string   "User_Id"
    t.string   "Like_Id"
    t.string   "Like_Name"
    t.string   "Like_Category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fbusers", :force => true do |t|
    t.string   "User_Id"
    t.string   "User_Name"
    t.string   "User_Email"
    t.string   "Image_Ref"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
