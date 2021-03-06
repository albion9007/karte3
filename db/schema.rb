# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_01_122058) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "observations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.decimal "temperature", precision: 3, scale: 1
    t.integer "pulse"
    t.integer "respiration"
    t.integer "high_blood_pressure"
    t.integer "low_blood_pressure"
    t.integer "spo2"
    t.string "food_intake"
    t.string "water_intake"
    t.string "excresion"
    t.string "ex_amount"
    t.string "atten_sound"
    t.string "atten_part"
    t.string "sputum"
    t.string "cough"
    t.string "sleep"
    t.bigint "user_id"
    t.bigint "patient_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "time", null: false
    t.string "user_name", null: false
    t.string "hainyou"
    t.date "date", default: "2020-01-01", null: false
    t.index ["patient_id"], name: "index_observations_on_patient_id"
    t.index ["user_id"], name: "index_observations_on_user_id"
  end

  create_table "patient_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "patient_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["patient_id"], name: "index_patient_users_on_patient_id"
    t.index ["user_id"], name: "index_patient_users_on_user_id"
  end

  create_table "patients", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "birth_date"
    t.string "tel", default: ""
    t.string "post_num", default: ""
    t.integer "prefecture_id", null: false
    t.string "city", default: ""
    t.string "house_num", default: ""
    t.string "apart_name", default: ""
    t.string "key_person", default: ""
    t.string "kp_tel", default: ""
    t.string "main_disease", null: false
    t.string "sub_disease", default: ""
    t.string "main_doctor", null: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "gender", null: false
    t.index ["user_id"], name: "index_patients_on_user_id"
  end

  create_table "treatments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "time", null: false
    t.string "test"
    t.string "medicine"
    t.string "injection"
    t.bigint "patient_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "user_name", null: false
    t.index ["patient_id"], name: "index_treatments_on_patient_id"
    t.index ["user_id"], name: "index_treatments_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "position", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "observations", "patients"
  add_foreign_key "observations", "users"
  add_foreign_key "patient_users", "patients"
  add_foreign_key "patient_users", "users"
  add_foreign_key "patients", "users"
  add_foreign_key "treatments", "patients"
  add_foreign_key "treatments", "users"
end
