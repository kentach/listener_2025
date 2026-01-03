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

ActiveRecord::Schema[7.2].define(version: 2026_01_03_131248) do
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

  create_table "audios", force: :cascade do |t|
    t.bigint "chapter_id", null: false
    t.string "file_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chapter_id"], name: "index_audios_on_chapter_id"
  end

  create_table "chapters", force: :cascade do |t|
    t.string "title", null: false
    t.string "series", null: false
    t.bigint "textbook_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["textbook_id"], name: "index_chapters_on_textbook_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "audio_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["audio_id"], name: "index_favorites_on_audio_id"
    t.index ["user_id", "audio_id"], name: "index_favorites_on_user_id_and_audio_id", unique: true
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "rhythmas", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.string "level"
    t.string "series"
    t.string "cover_image", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "test_progresses", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "series", null: false
    t.integer "cleared_count", default: 0, null: false
    t.boolean "max_cleared", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "series"], name: "index_test_progresses_on_user_id_and_series", unique: true
    t.index ["user_id"], name: "index_test_progresses_on_user_id"
  end

  create_table "test_questions", force: :cascade do |t|
    t.bigint "test_id", null: false
    t.bigint "vocabulary_id", null: false
    t.integer "position", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_answer"
    t.string "result"
    t.string "correct_answers"
    t.index ["test_id", "position"], name: "index_test_questions_on_test_id_and_position", unique: true
    t.index ["test_id"], name: "index_test_questions_on_test_id"
    t.index ["vocabulary_id"], name: "index_test_questions_on_vocabulary_id"
  end

  create_table "tests", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "series", null: false
    t.integer "range_start", null: false
    t.integer "range_end", null: false
    t.string "question_language", null: false
    t.integer "score"
    t.boolean "passed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "level"
    t.index ["user_id"], name: "index_tests_on_user_id"
  end

  create_table "textbooks", force: :cascade do |t|
    t.string "name", null: false
    t.string "level"
    t.string "series"
    t.string "cover_image", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "eiken_level", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vocabularies", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "series", null: false
    t.integer "number"
    t.string "english", null: false
    t.string "japanese", null: false
    t.string "level"
    t.string "audio"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "audios", "chapters"
  add_foreign_key "chapters", "textbooks"
  add_foreign_key "favorites", "audios"
  add_foreign_key "favorites", "users"
  add_foreign_key "test_progresses", "users"
  add_foreign_key "test_questions", "tests"
  add_foreign_key "test_questions", "vocabularies"
  add_foreign_key "tests", "users"
end
