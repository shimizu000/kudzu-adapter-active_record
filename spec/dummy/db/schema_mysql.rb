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

ActiveRecord::Schema.define(version: 20171023054358) do

  create_table "kudzu_chunks", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "page_id"
    t.binary "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["page_id"], name: "index_kudzu_chunks_on_page_id"
  end

  create_table "kudzu_links", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "uuid"
    t.text "url"
    t.text "title"
    t.integer "state"
    t.integer "depth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state"], name: "index_kudzu_links_on_state"
    t.index ["url"], name: "index_kudzu_links_on_url", length: { url: 32 }
    t.index ["uuid"], name: "index_kudzu_links_on_uuid", length: { uuid: 4 }
  end

  create_table "kudzu_pages", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "url"
    t.text "title"
    t.integer "status"
    t.text "mime_type"
    t.integer "size"
    t.text "charset"
    t.text "digest"
    t.text "response_header"
    t.float "response_time", limit: 24
    t.text "redirect_from"
    t.datetime "fetched_at"
    t.datetime "revised_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["digest"], name: "index_kudzu_pages_on_digest", length: { digest: 6 }
    t.index ["url"], name: "index_kudzu_pages_on_url", length: { url: 32 }
  end

end
