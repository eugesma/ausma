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

ActiveRecord::Schema.define(version: 2019_10_04_111602) do

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "assignatures", force: :cascade do |t|
    t.decimal "preparation", precision: 9, scale: 2, default: "0.0"
    t.decimal "implementation", precision: 9, scale: 2, default: "0.0"
    t.decimal "consultation", precision: 9, scale: 2, default: "0.0"
    t.decimal "credit", precision: 9, scale: 2, default: "0.0"
    t.text "observation"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "min_preparation", precision: 9, scale: 2, default: "0.0"
    t.decimal "min_implementation", precision: 9, scale: 2, default: "0.0"
    t.decimal "min_consultation", precision: 9, scale: 2, default: "0.0"
    t.decimal "min_credit", precision: 9, scale: 2, default: "0.0"
    t.integer "teachers_count", default: 0
    t.bigint "career_id"
    t.index ["career_id"], name: "index_assignatures_on_career_id"
  end

  create_table "career_assignatures", force: :cascade do |t|
    t.bigint "career_id"
    t.bigint "assignature_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assignature_id"], name: "index_career_assignatures_on_assignature_id"
    t.index ["career_id"], name: "index_career_assignatures_on_career_id"
  end

  create_table "careers", force: :cascade do |t|
    t.string "name"
    t.integer "year_duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "assignatures_count", default: 0
  end

  create_table "dedications", force: :cascade do |t|
    t.string "name"
    t.decimal "credit", precision: 9, scale: 2, default: "0.0"
    t.text "observation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "min_credit", precision: 9, scale: 2, default: "0.0"
    t.integer "hours_per_week", default: 0
    t.integer "hours_per_year", default: 0
  end

  create_table "evaluation_assignatures", force: :cascade do |t|
    t.bigint "evaluation_id"
    t.bigint "assignature_id"
    t.decimal "preparation", precision: 9, scale: 2, default: "0.0"
    t.decimal "implementation", precision: 9, scale: 2, default: "0.0"
    t.decimal "consultation", precision: 9, scale: 2, default: "0.0"
    t.decimal "total_credit", precision: 9, scale: 2, default: "0.0"
    t.decimal "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assignature_id"], name: "index_evaluation_assignatures_on_assignature_id"
    t.index ["evaluation_id"], name: "index_evaluation_assignatures_on_evaluation_id"
  end

  create_table "evaluation_dedications", force: :cascade do |t|
    t.bigint "evaluation_id"
    t.bigint "dedication_id"
    t.decimal "total_credit", precision: 9, scale: 2, default: "0.0"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dedication_id"], name: "index_evaluation_dedications_on_dedication_id"
    t.index ["evaluation_id"], name: "index_evaluation_dedications_on_evaluation_id"
  end

  create_table "evaluation_extension_activities", force: :cascade do |t|
    t.bigint "evaluation_id"
    t.bigint "extension_activity_id"
    t.decimal "preparation", precision: 9, scale: 2, default: "0.0"
    t.decimal "implementation", precision: 9, scale: 2, default: "0.0"
    t.decimal "evaluation", precision: 9, scale: 2, default: "0.0"
    t.decimal "total_credit", precision: 9, scale: 2, default: "0.0"
    t.decimal "quantity", precision: 9, scale: 2, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evaluation_id"], name: "index_evaluation_extension_activities_on_evaluation_id"
    t.index ["extension_activity_id"], name: "index_evaluation_extension_activities_on_extension_activity_id"
  end

  create_table "evaluation_governments", force: :cascade do |t|
    t.bigint "evaluation_id"
    t.bigint "government_id"
    t.decimal "preparation", precision: 9, scale: 2, default: "0.0"
    t.decimal "meeting", precision: 9, scale: 2, default: "0.0"
    t.decimal "credit", precision: 9, scale: 2, default: "0.0"
    t.decimal "total_credit", precision: 9, scale: 2, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evaluation_id"], name: "index_evaluation_governments_on_evaluation_id"
    t.index ["government_id"], name: "index_evaluation_governments_on_government_id"
  end

  create_table "evaluation_paticipations", force: :cascade do |t|
    t.bigint "evaluation_id"
    t.bigint "participation_id"
    t.decimal "preparation", precision: 9, scale: 2, default: "0.0"
    t.decimal "meeting", precision: 9, scale: 2, default: "0.0"
    t.decimal "credit", precision: 9, scale: 2, default: "0.0"
    t.decimal "total_credit", precision: 9, scale: 2, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evaluation_id"], name: "index_evaluation_paticipations_on_evaluation_id"
    t.index ["participation_id"], name: "index_evaluation_paticipations_on_participation_id"
  end

  create_table "evaluation_posts", force: :cascade do |t|
    t.bigint "evaluation_id"
    t.bigint "post_id"
    t.decimal "credit", precision: 9, scale: 2, default: "0.0"
    t.decimal "total_credit", precision: 9, scale: 2, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evaluation_id"], name: "index_evaluation_posts_on_evaluation_id"
    t.index ["post_id"], name: "index_evaluation_posts_on_post_id"
  end

  create_table "evaluation_projects", force: :cascade do |t|
    t.bigint "evaluation_id"
    t.bigint "project_id"
    t.decimal "credit", precision: 9, scale: 2, default: "0.0"
    t.decimal "total_credit", precision: 9, scale: 2, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evaluation_id"], name: "index_evaluation_projects_on_evaluation_id"
    t.index ["project_id"], name: "index_evaluation_projects_on_project_id"
  end

  create_table "evaluation_teacher_formations", force: :cascade do |t|
    t.bigint "evaluation_id"
    t.bigint "teacher_formation_id"
    t.decimal "quantity", precision: 9, scale: 2, default: "0.0"
    t.decimal "total_credit", precision: 9, scale: 2, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evaluation_id"], name: "index_evaluation_teacher_formations_on_evaluation_id"
    t.index ["teacher_formation_id"], name: "index_evaluation_teacher_formations_on_teacher_formation_id"
  end

  create_table "evaluations", force: :cascade do |t|
    t.bigint "teacher_id"
    t.bigint "user_id"
    t.decimal "credit", precision: 9, scale: 2, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_id"], name: "index_evaluations_on_teacher_id"
    t.index ["user_id"], name: "index_evaluations_on_user_id"
  end

  create_table "extension_activities", force: :cascade do |t|
    t.decimal "preparation", precision: 9, scale: 2, default: "0.0"
    t.decimal "implementation", precision: 9, scale: 2, default: "0.0"
    t.decimal "evaluation", precision: 9, scale: 2, default: "0.0"
    t.decimal "credit", precision: 9, scale: 2, default: "0.0"
    t.text "observation"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "min_preparation", precision: 9, scale: 2, default: "0.0"
    t.decimal "min_implementation", precision: 9, scale: 2, default: "0.0"
    t.decimal "min_evaluation", precision: 9, scale: 2, default: "0.0"
    t.decimal "min_credit", precision: 9, scale: 2, default: "0.0"
  end

  create_table "governments", force: :cascade do |t|
    t.string "name"
    t.decimal "preparation", precision: 9, scale: 2, default: "0.0"
    t.decimal "meeting", precision: 9, scale: 2, default: "0.0"
    t.decimal "credit", precision: 9, scale: 2, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "min_preparation", precision: 9, scale: 2, default: "0.0"
    t.decimal "min_meeting", precision: 9, scale: 2, default: "0.0"
    t.decimal "min_credit", precision: 9, scale: 2, default: "0.0"
  end

  create_table "participations", force: :cascade do |t|
    t.string "name"
    t.decimal "preparation", precision: 9, scale: 2, default: "0.0"
    t.decimal "meeting", precision: 9, scale: 2, default: "0.0"
    t.decimal "credit", precision: 9, scale: 2, default: "0.0"
    t.text "observation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "min_preparation", precision: 9, scale: 2, default: "0.0"
    t.decimal "min_meeting", precision: 9, scale: 2, default: "0.0"
    t.decimal "min_credit", precision: 9, scale: 2, default: "0.0"
  end

  create_table "posts", force: :cascade do |t|
    t.string "name"
    t.decimal "credit", precision: 9, scale: 2, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "min_credit", precision: 9, scale: 2, default: "0.0"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.string "email"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.decimal "credit", precision: 9, scale: 2, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "min_credit", precision: 9, scale: 2, default: "0.0"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "teacher_assignatures", force: :cascade do |t|
    t.bigint "teacher_id"
    t.bigint "assignature_id"
    t.integer "duration", default: 0
    t.decimal "total_credit", precision: 9, scale: 2, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "preparation", precision: 9, scale: 2, default: "0.0"
    t.decimal "implementation", precision: 9, scale: 2, default: "0.0"
    t.decimal "consultation", precision: 9, scale: 2, default: "0.0"
    t.index ["assignature_id"], name: "index_teacher_assignatures_on_assignature_id"
    t.index ["teacher_id"], name: "index_teacher_assignatures_on_teacher_id"
  end

  create_table "teacher_formations", force: :cascade do |t|
    t.string "name"
    t.decimal "credit", precision: 9, scale: 2, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "min_credit", precision: 9, scale: 2, default: "0.0"
  end

  create_table "teachers", force: :cascade do |t|
    t.bigint "profile_id"
    t.bigint "user_id"
    t.string "employee_num"
    t.decimal "credit", precision: 9, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_teachers_on_profile_id"
    t.index ["user_id"], name: "index_teachers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "assignatures", "careers"
  add_foreign_key "career_assignatures", "assignatures"
  add_foreign_key "career_assignatures", "careers"
  add_foreign_key "evaluation_assignatures", "assignatures"
  add_foreign_key "evaluation_assignatures", "evaluations"
  add_foreign_key "evaluation_dedications", "dedications"
  add_foreign_key "evaluation_dedications", "evaluations"
  add_foreign_key "evaluation_extension_activities", "evaluations"
  add_foreign_key "evaluation_extension_activities", "extension_activities"
  add_foreign_key "evaluation_governments", "evaluations"
  add_foreign_key "evaluation_governments", "governments"
  add_foreign_key "evaluation_paticipations", "evaluations"
  add_foreign_key "evaluation_paticipations", "participations"
  add_foreign_key "evaluation_posts", "evaluations"
  add_foreign_key "evaluation_posts", "posts"
  add_foreign_key "evaluation_projects", "evaluations"
  add_foreign_key "evaluation_projects", "projects"
  add_foreign_key "evaluation_teacher_formations", "evaluations"
  add_foreign_key "evaluation_teacher_formations", "teacher_formations"
  add_foreign_key "evaluations", "teachers"
  add_foreign_key "evaluations", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "teacher_assignatures", "assignatures"
  add_foreign_key "teacher_assignatures", "teachers"
  add_foreign_key "teachers", "profiles"
  add_foreign_key "teachers", "users"
end
