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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180114085605) do

  create_table "admins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email"
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "article_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "image"
    t.integer  "articles_count",               default: 0
    t.text     "description",    limit: 65535
    t.string   "slug"
    t.integer  "position",                     default: 0
    t.integer  "scope_index"
    t.integer  "scope_show"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["parent_id"], name: "index_article_categories_on_parent_id", using: :btree
    t.index ["position"], name: "index_article_categories_on_position", using: :btree
    t.index ["scope_index"], name: "index_article_categories_on_scope_index", using: :btree
    t.index ["scope_show"], name: "index_article_categories_on_scope_show", using: :btree
    t.index ["slug"], name: "index_article_categories_on_slug", using: :btree
  end

  create_table "attachments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "file"
    t.integer  "user_id"
    t.string   "target_type"
    t.integer  "target_id"
    t.string   "second_target_type"
    t.integer  "second_target_id"
    t.string   "third_target_type"
    t.integer  "third_target_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["user_id"], name: "index_attachments_on_user_id", using: :btree
  end

  create_table "exception_logs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "error_class"
    t.text     "message",     limit: 65535
    t.text     "backtrace",   limit: 4294967295
    t.text     "data",        limit: 65535
    t.text     "request",     limit: 4294967295
    t.text     "session",     limit: 4294967295
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "pages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "content",    limit: 65535
    t.string   "slug"
    t.string   "image"
    t.integer  "scope"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["scope"], name: "index_pages_on_scope", using: :btree
    t.index ["slug"], name: "index_pages_on_slug", using: :btree
  end

  create_table "seos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "seoable_id"
    t.string   "seoable_type"
    t.string   "seo_title"
    t.string   "seo_description"
    t.string   "seo_keywords"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "settings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "var",                      null: false
    t.text     "value",      limit: 65535
    t.integer  "thing_id"
    t.string   "thing_type", limit: 30
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["thing_type", "thing_id", "var"], name: "index_settings_on_thing_type_and_thing_id_and_var", unique: true, using: :btree
  end

  create_table "templates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "file_name"
    t.integer  "content_type",               default: 0
    t.string   "file_path"
    t.text     "content",      limit: 65535
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["content_type"], name: "index_templates_on_content_type", using: :btree
  end

end
