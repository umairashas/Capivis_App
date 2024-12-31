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

ActiveRecord::Schema[7.2].define(version: 2024_12_31_074723) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "centres", force: :cascade do |t|
    t.string "name"
    t.string "pincode"
    t.string "location"
    t.string "phone_number"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.bigint "centre_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["centre_id"], name: "index_operators_on_centre_id"
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

  add_foreign_key "centres", "users"
  add_foreign_key "donor_history_questionnaires", "donors"
  add_foreign_key "donor_history_questionnaires", "questions"
  add_foreign_key "donor_history_questionnaires", "users"
  add_foreign_key "donors", "centres"
  add_foreign_key "donors", "users"
  add_foreign_key "operators", "centres"
end
