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

ActiveRecord::Schema[7.2].define(version: 2025_01_08_170805) do
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
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "centres", force: :cascade do |t|
    t.string "name"
    t.string "pincode"
    t.string "location"
    t.string "phone_number"
    t.bigint "user_id", null: false
    t.bigint "operator_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["operator_id"], name: "index_centres_on_operator_id"
    t.index ["user_id"], name: "index_centres_on_user_id"
  end

  create_table "donor_handbooks", force: :cascade do |t|
    t.boolean "terms_accepted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "donor_history_questionnaires", force: :cascade do |t|
    t.bigint "donor_id", null: false
    t.bigint "user_id", null: false
    t.bigint "question_id", null: false
    t.text "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["donor_id"], name: "index_donor_history_questionnaires_on_donor_id"
    t.index ["question_id"], name: "index_donor_history_questionnaires_on_question_id"
    t.index ["user_id"], name: "index_donor_history_questionnaires_on_user_id"
  end

  create_table "donor_physical_exams", force: :cascade do |t|
    t.boolean "flipchart"
    t.boolean "donor_consents"
    t.text "body_map"
    t.integer "high_risk_questionnaire_score"
    t.boolean "physical_exam"
    t.bigint "donor_id", null: false
    t.bigint "centre_id", null: false
    t.bigint "donor_screening_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["centre_id"], name: "index_donor_physical_exams_on_centre_id"
    t.index ["donor_id"], name: "index_donor_physical_exams_on_donor_id"
    t.index ["donor_screening_id"], name: "index_donor_physical_exams_on_donor_screening_id"
  end

  create_table "donor_screenings", force: :cascade do |t|
    t.boolean "acceptable_arm_check"
    t.integer "donor_height"
    t.integer "donor_weight"
    t.string "donor_blood_pressure"
    t.decimal "donor_temperature"
    t.datetime "fingerstick"
    t.decimal "hematocrit"
    t.decimal "total_protein"
    t.bigint "centre_id", null: false
    t.bigint "donor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["centre_id"], name: "index_donor_screenings_on_centre_id"
    t.index ["donor_id"], name: "index_donor_screenings_on_donor_id"
  end

  create_table "donors", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "centre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.date "birth_date"
    t.string "gender"
    t.string "zipcode"
    t.string "phone_number"
    t.string "alternate_phone_number"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "language"
    t.string "address_line1"
    t.string "address_line2"
    t.text "document"
    t.datetime "arrival_datetime"
    t.string "potential_fraud"
    t.index ["centre_id"], name: "index_donors_on_centre_id"
    t.index ["user_id"], name: "index_donors_on_user_id"
  end

  create_table "operators", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_operators_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "text"
    t.string "answer_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "role", default: 0
    t.string "aadhar_number"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "centres", "users"
  add_foreign_key "donor_history_questionnaires", "donors"
  add_foreign_key "donor_history_questionnaires", "questions"
  add_foreign_key "donor_history_questionnaires", "users"
  add_foreign_key "donor_physical_exams", "donor_screenings"
  add_foreign_key "donor_physical_exams", "donors"
  add_foreign_key "donor_screenings", "donors"
  add_foreign_key "donors", "users"
  add_foreign_key "operators", "users"
end
