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

ActiveRecord::Schema.define(version: 2021_09_21_200358) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "booking_infos", force: :cascade do |t|
    t.string "surname"
    t.string "othernames"
    t.string "phone_number"
    t.string "coordination_preference"
    t.integer "group_count"
    t.string "hotel_type"
    t.integer "tour_duration"
    t.text "purpose_statement"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "tour_id"
    t.string "email"
    t.string "status"
    t.integer "user_id"
    t.string "user_uid"
    t.boolean "tos_agreement"
    t.boolean "payment_status"
  end

  create_table "custom_trips", force: :cascade do |t|
    t.string "destination"
    t.string "surname"
    t.string "othernames"
    t.string "email"
    t.string "phone_number"
    t.string "coordination_preference"
    t.integer "group_count"
    t.string "hotel_type"
    t.integer "trip_duration"
    t.string "purpose_statement"
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "tos_agreement"
    t.boolean "status"
    t.integer "user_id"
  end

  create_table "customer_msgs", force: :cascade do |t|
    t.string "email"
    t.string "surname"
    t.string "othernames"
    t.text "message"
    t.integer "user_id"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "full_name"
  end

  create_table "tours", force: :cascade do |t|
    t.string "tour_id"
    t.string "title"
    t.text "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "price"
    t.string "currency"
    t.integer "sales_count"
    t.boolean "active_status", default: true
    t.boolean "del_status", default: false
    t.string "stripe_trip_id"
    t.string "stripe_product_id"
    t.string "stripe_price_id"
  end

  create_table "user_testimonials", force: :cascade do |t|
    t.string "fullname"
    t.string "trip"
    t.text "testimonial"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.string "role_code"
    t.string "uid"
    t.string "surname"
    t.string "othernames"
    t.boolean "active_status"
    t.boolean "del_status"
    t.string "stripe_customer_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
