# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_27_051659) do

  create_table "blocks", force: :cascade do |t|
    t.integer "number"
    t.integer "timestamp"
    t.string "hash"
    t.string "parent_hash"
    t.string "state_root"
    t.string "extrinsics_root"
    t.string "logs"
    t.text "extrinsics"
    t.integer "event_count"
    t.integer "extrinsic_count"
    t.text "events"
    t.integer "spec_version"
    t.string "validator"
    t.boolean "codec_error"
    t.boolean "finalized"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "index"
    t.integer "idx"
    t.integer "block_id"
    t.integer "block_number"
    t.integer "extrinsic_idx"
    t.string "type"
    t.string "module_id"
    t.string "event_id"
    t.text "params"
    t.string "extrinsic_hash"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "extrinsics", force: :cascade do |t|
    t.string "index"
    t.integer "block_id"
    t.integer "block_number"
    t.integer "timestamp"
    t.string "length"
    t.string "version_info"
    t.string "call_code"
    t.string "call_module_function"
    t.string "call_module"
    t.text "params"
    t.string "account_id"
    t.string "signature"
    t.integer "nonce"
    t.string "era"
    t.string "hash"
    t.boolean "is_signed"
    t.boolean "success"
    t.integer "fee", limit: 30
    t.integer "batch_index"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "logs", force: :cascade do |t|
    t.integer "block_id"
    t.integer "block_number"
    t.string "index"
    t.string "type"
    t.text "data"
    t.boolean "finalized"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "runtime_versions", force: :cascade do |t|
    t.string "name"
    t.integer "spec_version"
    t.string "modules"
    t.string "raw_data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
