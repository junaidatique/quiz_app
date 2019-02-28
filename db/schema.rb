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

ActiveRecord::Schema.define(version: 2019_02_27_200735) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string "option_1"
    t.string "option_2"
    t.string "option_3"
    t.string "option_4"
    t.integer "correct_answer"
    t.bigint "quiz_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "question"
    t.index ["quiz_id"], name: "index_answers_on_quiz_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "group_id", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products_users", id: false, force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "user_id", null: false
  end

  create_table "quiz_attempts", force: :cascade do |t|
    t.bigint "quiz_id"
    t.bigint "user_id"
    t.bigint "group_id"
    t.integer "total_questions"
    t.integer "correct_answer"
    t.integer "status_cd"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_quiz_attempts_on_group_id"
    t.index ["quiz_id"], name: "index_quiz_attempts_on_quiz_id"
    t.index ["user_id"], name: "index_quiz_attempts_on_user_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "product_id"
    t.bigint "group_id"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_quizzes_on_group_id"
    t.index ["product_id"], name: "index_quizzes_on_product_id"
    t.index ["user_id"], name: "index_quizzes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "employee_code"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answers", "quizzes"
  add_foreign_key "quiz_attempts", "groups"
  add_foreign_key "quiz_attempts", "quizzes"
  add_foreign_key "quiz_attempts", "users"
  add_foreign_key "quizzes", "groups"
  add_foreign_key "quizzes", "products"
  add_foreign_key "quizzes", "users"
end
