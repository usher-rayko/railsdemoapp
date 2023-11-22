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

ActiveRecord::Schema[7.0].define(version: 2023_11_22_114857) do
  create_table "active_storage_attachments", charset: "latin1", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "latin1", force: :cascade do |t|
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

  create_table "active_storage_variant_records", charset: "latin1", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "articles", charset: "latin1", force: :cascade do |t|
    t.string "title"
    t.string "body"
    t.string "author"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chats", charset: "latin1", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friends", charset: "latin1", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "email"
    t.binary "image", size: :long
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", charset: "latin1", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.float "grade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", charset: "latin1", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.float "grade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tbl_adverts", primary_key: "advert_id", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.integer "created_by", null: false, unsigned: true
    t.string "title", null: false
    t.text "content", size: :long, null: false
    t.datetime "deleted_at", precision: nil
    t.integer "deleted_by", unsigned: true
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.binary "attachment", size: :long
    t.string "attachment_mime"
    t.string "attachment_name"
    t.column "published", "enum('0','1')", default: "0"
    t.integer "invoice_id", unsigned: true
    t.datetime "expiry_time", precision: nil, null: false
    t.index ["created_by"], name: "created_by"
    t.index ["deleted_by"], name: "deleted_by"
  end

  create_table "tbl_alumni", primary_key: "alumni_id", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.string "phone_1"
    t.string "phone_2"
    t.string "address"
    t.text "cv_brief_profile"
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.integer "user_id", null: false, unsigned: true
    t.index ["user_id"], name: "fk_alumni_user"
  end

  create_table "tbl_alumni_achievements", primary_key: "alumni_achievement_id", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.integer "alumni_id", null: false, unsigned: true
    t.text "achievement", null: false
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.boolean "cv_visibility_status", default: true
    t.index ["alumni_id"], name: "alumni_id"
  end

  create_table "tbl_alumni_association_projects", primary_key: "alumni_association_project_id", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.integer "project_participation_type_id", null: false, unsigned: true
    t.integer "association_project_id", null: false, unsigned: true
    t.integer "alumni_id", null: false, unsigned: true
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.boolean "visibility"
    t.index ["alumni_id"], name: "alumni_id"
    t.index ["association_project_id"], name: "association_project_id"
    t.index ["project_participation_type_id", "association_project_id", "alumni_id"], name: "project_participation_type_id", unique: true
  end

  create_table "tbl_alumni_awards", primary_key: "alumni_award_id", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.integer "alumni_id", null: false, unsigned: true
    t.string "award_name", null: false
    t.text "description"
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.boolean "cv_visibility_status", default: true
    t.index ["alumni_id"], name: "alumni_id"
  end

  create_table "tbl_alumni_cv_projects", primary_key: "alumni_cv_project_id", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.integer "alumni_id", null: false, unsigned: true
    t.string "project_name", null: false
    t.text "description", null: false
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.boolean "cv_visibility_status", default: true
    t.index ["alumni_id"], name: "alumni_id"
  end

  create_table "tbl_alumni_donations", primary_key: "alumni_donation_id", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.integer "alumni_id", null: false, unsigned: true
    t.integer "association_project_id", null: false, unsigned: true
    t.string "invoice_number", limit: 10, null: false
    t.float "amount", limit: 53, null: false
    t.datetime "expiry", precision: nil, null: false
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.index ["alumni_id"], name: "alumni_id"
    t.index ["association_project_id"], name: "fk_alumni_donations_association_project_id"
  end

  create_table "tbl_alumni_employment_history", primary_key: "alumni_employment_history_id", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.integer "alumni_id", null: false, unsigned: true
    t.string "organisation", null: false
    t.text "description", null: false
    t.string "job_title", null: false
    t.datetime "start_date", precision: nil, null: false
    t.datetime "end_date", precision: nil
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.boolean "cv_visibility_status", default: true
    t.index ["alumni_id"], name: "alumni_id"
  end

  create_table "tbl_alumni_newsletter_subscriptions", primary_key: "newsletter_subscription_id", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.integer "newsletter_id", null: false, unsigned: true
    t.integer "alumni_id", null: false, unsigned: true
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.column "unsubscribed", "enum('0','1')", default: "0"
    t.datetime "updated_at", precision: nil
    t.index ["alumni_id"], name: "alumni_id"
    t.index ["newsletter_id"], name: "newsletter_id"
  end

  create_table "tbl_alumni_other_qualifications", primary_key: "alumni_qualification_id", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.integer "alumni_id", null: false, unsigned: true
    t.integer "qualification_type_id", unsigned: true
    t.string "qualification_name", null: false
    t.string "classification_of_award", null: false
    t.string "institution_name", null: false
    t.integer "start_year"
    t.integer "end_year"
    t.text "description"
    t.boolean "cv_visibility_status", default: true
    t.index ["alumni_id"], name: "alumni_id"
    t.index ["qualification_type_id"], name: "qualification_type_id"
  end

  create_table "tbl_alumni_programmes", primary_key: "alumni_programme_id", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.integer "alumni_id", null: false, unsigned: true
    t.integer "programme_id", null: false, unsigned: true
    t.integer "programme_qualification_id", unsigned: true
    t.string "classification_of_award"
    t.integer "start_year"
    t.integer "end_year"
    t.integer "graduation_year"
    t.text "description"
    t.index ["alumni_id"], name: "alumni_id"
    t.index ["programme_id"], name: "programme_id"
    t.index ["programme_qualification_id"], name: "programme_qualification_id"
  end

  create_table "tbl_alumni_referees", primary_key: "alumni_referee_id", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.integer "alumni_id", null: false, unsigned: true
    t.column "title", "enum('Mr.','Mrs.','Miss.','Ms.','Dr.','Prof.','Rev.','Pastor','Father','Sister','Prophet','Rev.Fr.Dr','Rev.Dr','Fr.Dr.','Sheikh.Dr')", null: false
    t.string "fullname", null: false
    t.string "phone_1"
    t.string "phone_2"
    t.string "email_address", null: false
    t.string "postal_address"
    t.string "organisation"
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.boolean "cv_visibility_status", default: true
    t.index ["alumni_id"], name: "alumni_id"
  end

  create_table "tbl_alumni_social_links", primary_key: "alumni_social_link_id", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.integer "alumni_id", null: false, unsigned: true
    t.integer "social_media_id", null: false, unsigned: true
    t.string "link", null: false
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.boolean "cv_visibility_status", default: true
    t.index ["alumni_id"], name: "alumni_id"
    t.index ["social_media_id"], name: "social_media_id"
  end

  create_table "tbl_alumni_sockets", primary_key: "alumni_socket_id", id: { type: :bigint, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.integer "alumni_id", null: false, unsigned: true
    t.bigint "resource_id", unsigned: true
    t.integer "status", limit: 2, default: 0
    t.timestamp "updated_at"
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }
    t.index ["alumni_id"], name: "alumni_id"
  end

  create_table "tbl_alumni_special_skills", primary_key: "alumni_special_skill_id", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.integer "alumni_id", null: false, unsigned: true
    t.string "special_skill", null: false
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.boolean "cv_visibility_status", default: true
    t.index ["alumni_id"], name: "alumni_id"
  end

  create_table "tbl_alumni_transcript_requests", primary_key: "alumni_transcript_request_id", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.integer "alumni_id", null: false, unsigned: true
    t.string "invoice_number", limit: 10
    t.float "amount", limit: 53, null: false
    t.column "status", "enum('NOT-PAID','PAID-AND-BEING-PROCESSED','ISSUED','EXPIRED')", default: "NOT-PAID"
    t.datetime "expiry", precision: nil, null: false
    t.column "issued", "enum('YES','NO')", default: "NO"
    t.string "destination_physical_address"
    t.string "destination_email_address"
    t.string "destination_phone_number"
    t.integer "courier_id", unsigned: true
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.index ["alumni_id"], name: "alumni_id"
    t.index ["courier_id"], name: "courier_id"
  end

  create_table "tbl_association_executive_members", primary_key: "association_executive_member_id", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.integer "association_executive_position_id", unsigned: true
    t.integer "alumni_id", unsigned: true
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.index ["alumni_id"], name: "alumni_id"
    t.index ["association_executive_position_id"], name: "association_executive_position_id"
    t.check_constraint "`start_date` <= `end_date`", name: "tbl_association_executive_members_chk_1"
  end

  create_table "tbl_association_executive_positions", primary_key: "association_executive_position_id", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.string "position_name", null: false
    t.integer "position_rank"
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.index ["position_rank"], name: "position_rank", unique: true
  end

  create_table "tbl_association_project_participation_types", primary_key: "association_project_participation_type_id", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.integer "project_participation_type_id", null: false, unsigned: true
    t.integer "association_project_id", null: false, unsigned: true
    t.index ["association_project_id"], name: "association_project_id"
    t.index ["project_participation_type_id"], name: "project_participation_type_id"
  end

  create_table "tbl_association_projects", primary_key: "association_project_id", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.string "project_name", null: false
    t.text "description"
    t.date "start_date", null: false
    t.date "end_date"
    t.integer "created_by", null: false, unsigned: true
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.index ["created_by"], name: "created_by"
  end

  create_table "tbl_blocked_chats", primary_key: "blocked_chat_id", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.integer "alumni_id", null: false, unsigned: true
    t.integer "blocked_alumni", null: false, unsigned: true
    t.index ["alumni_id"], name: "alumni_id"
    t.index ["blocked_alumni"], name: "blocked_alumni"
  end

  create_table "tbl_chats", primary_key: "chat_id", id: { type: :bigint, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.integer "sender", unsigned: true
    t.integer "recipient", unsigned: true
    t.text "chat_message"
    t.integer "seen", limit: 2, default: 0
    t.datetime "deleted_at", precision: nil
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }
    t.bigint "replied_to", unsigned: true
    t.index ["recipient"], name: "recipient"
    t.index ["replied_to"], name: "replied_to"
    t.index ["sender"], name: "sender"
  end

  create_table "tbl_couriers", primary_key: "courier_id", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.string "courier_name", null: false
    t.string "phone_number", null: false
    t.string "physical_address", null: false
    t.string "postal_address"
  end

  create_table "tbl_election_position_candidates", primary_key: "election_position_candidate_id", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.integer "election_position_id", null: false, unsigned: true
    t.integer "candidate", null: false, unsigned: true
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.index ["candidate"], name: "candidate"
    t.index ["election_position_id"], name: "election_position_id"
  end

  create_table "tbl_election_positions", primary_key: "election_position_id", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.integer "election_id", null: false, unsigned: true
    t.string "position_name", null: false
    t.integer "number_of_winners", null: false
    t.integer "position_rank", null: false
    t.index ["election_id"], name: "election_id"
  end

  create_table "tbl_election_voters", primary_key: "election_voter_id", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.integer "election_id", null: false, unsigned: true
    t.integer "voter", null: false, unsigned: true
    t.index ["election_id"], name: "election_id"
    t.index ["voter"], name: "voter"
  end

  create_table "tbl_election_votes", primary_key: "election_voter_id", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.integer "election_position_candidate_id", null: false, unsigned: true
    t.integer "voter", null: false, unsigned: true
    t.index ["election_position_candidate_id"], name: "election_position_candidate_id"
    t.index ["voter"], name: "voter"
  end

  create_table "tbl_elections", primary_key: "election_id", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.integer "created_by", null: false, unsigned: true
    t.string "election_name", null: false
    t.datetime "starting_time", precision: nil, null: false
    t.datetime "closing_time", precision: nil, null: false
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "released_at", precision: nil
    t.index ["created_by"], name: "created_by"
  end

  create_table "tbl_electoral_body_position_holders", primary_key: "electoral_body_position_holder_id", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.integer "electoral_body_position_id", null: false, unsigned: true
    t.integer "election_id", null: false, unsigned: true
    t.integer "position_holder", null: false, unsigned: true
    t.index ["election_id"], name: "election_id"
    t.index ["electoral_body_position_id"], name: "electoral_body_position_id"
    t.index ["position_holder"], name: "position_holder"
  end

  create_table "tbl_electoral_body_positions", primary_key: "electoral_body_position_id", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.string "position_name", null: false
    t.text "description", null: false
  end

  create_table "tbl_forum_individuals", primary_key: "forum_individual_id", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.integer "forum_id", null: false, unsigned: true
    t.integer "alumni_id", null: false, unsigned: true
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.index ["alumni_id"], name: "alumni_id"
    t.index ["forum_id"], name: "forum_id"
  end

  create_table "tbl_forum_posts", primary_key: "forum_post_id", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.integer "forum_id", null: false, unsigned: true
    t.integer "post_id", null: false, unsigned: true
    t.index ["forum_id", "post_id"], name: "forum_id", unique: true
    t.index ["post_id"], name: "post_id"
  end

  create_table "tbl_forum_programmes", primary_key: "forum_programme_id", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.integer "forum_id", null: false, unsigned: true
    t.integer "programme_id", null: false, unsigned: true
    t.integer "graduation_year"
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.index ["forum_id"], name: "forum_id"
    t.index ["programme_id"], name: "programme_id"
  end

  create_table "tbl_forum_schools", primary_key: "forum_school_id", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.integer "forum_id", null: false, unsigned: true
    t.integer "school_id", null: false, unsigned: true
    t.integer "graduation_year"
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.index ["forum_id"], name: "forum_id"
    t.index ["school_id"], name: "school_id"
  end

  create_table "tbl_forums", primary_key: "forum_id", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.string "forum_name", null: false
    t.integer "created_by", null: false, unsigned: true
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.integer "deleted_by", unsigned: true
    t.datetime "deleted_at", precision: nil
    t.index ["created_by"], name: "created_by"
    t.index ["deleted_by"], name: "deleted_by"
  end

  create_table "tbl_logs", primary_key: "log_id", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.integer "user_id", null: false, unsigned: true
    t.string "activity", null: false
    t.datetime "activity_time", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.string "ip_address", limit: 100, null: false
    t.string "user_agent", null: false
    t.index ["user_id"], name: "tbl_logs_ibfk_1"
  end

  create_table "tbl_news_and_announcements", primary_key: "news_and_announcement_id", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.integer "created_by", null: false, unsigned: true
    t.string "title", null: false
    t.string "slug", null: false
    t.text "content", size: :long, null: false
    t.binary "attachment", size: :long
    t.string "attachment_mime"
    t.string "attachment_name"
    t.column "news_or_announcement", "enum('NEWS','ANNOUNCEMENT')", null: false
    t.datetime "deleted_at", precision: nil
    t.integer "deleted_by", unsigned: true
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.column "published", "enum('0','1')", default: "0"
  end

  create_table "tbl_newsletter_posts", primary_key: "newsletter_post", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.integer "newsletter_id", null: false, unsigned: true
    t.string "editors", null: false
    t.text "description", null: false
    t.string "publisher", null: false
    t.binary "attachment", size: :long, null: false
    t.string "attachment_mime", null: false
    t.string "attachment_name", null: false
    t.integer "created_by", null: false, unsigned: true
    t.index ["created_by"], name: "created_by"
    t.index ["newsletter_id"], name: "newsletter_id"
  end

  create_table "tbl_newsletters", primary_key: "newsletter_id", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "tbl_permissions", primary_key: "permission_id", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.string "permission_name", limit: 100, null: false
    t.string "description", null: false
  end

  create_table "tbl_post_comments", primary_key: "post_comment_id", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.integer "forum_post_id", null: false, unsigned: true
    t.integer "created_by", null: false, unsigned: true
    t.text "comment", null: false
    t.datetime "deleted_at", precision: nil
    t.integer "deleted_by", unsigned: true
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.index ["created_by"], name: "created_by"
    t.index ["deleted_by"], name: "deleted_by"
    t.index ["forum_post_id"], name: "forum_post_id"
  end

  create_table "tbl_post_likes", primary_key: "post_like_id", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.integer "forum_post_id", null: false, unsigned: true
    t.column "like_or_dislike", "enum('LIKE','DISLIKE')", null: false
    t.integer "liked_or_disliked_by", null: false, unsigned: true
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.index ["forum_post_id"], name: "forum_post_id"
    t.index ["liked_or_disliked_by"], name: "liked_or_disliked_by"
  end

  create_table "tbl_posts", primary_key: "post_id", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.integer "created_by", null: false, unsigned: true
    t.text "content", size: :long, null: false
    t.datetime "deleted_at", precision: nil
    t.integer "deleted_by", unsigned: true
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.index ["created_by"], name: "created_by"
    t.index ["deleted_by"], name: "deleted_by"
  end

  create_table "tbl_programme_qualifications", primary_key: "programme_qualification_id", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.integer "programme_id", null: false, unsigned: true
    t.string "qualification_name", null: false
    t.string "short_name"
    t.index ["programme_id"], name: "programme_id"
  end

  create_table "tbl_programmes", primary_key: "programme_id", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.string "programme_name", null: false
    t.column "programme_level", "enum('UNDER-GRADUATE','POST-GRADUATE')", null: false
    t.float "duration_in_years", limit: 53, null: false
    t.integer "school_id", null: false, unsigned: true
    t.index ["school_id"], name: "school_id"
  end

  create_table "tbl_project_participation_types", primary_key: "project_participation_type_id", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.string "project_participation_type", null: false
    t.text "description"
  end

  create_table "tbl_qualification_types", primary_key: "qualification_type_id", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.string "qualification_type", null: false
    t.integer "qualification_level", null: false
  end

  create_table "tbl_role_permissions", primary_key: ["role_id", "permission_id"], charset: "latin1", force: :cascade do |t|
    t.integer "role_id", null: false, unsigned: true
    t.integer "permission_id", null: false, unsigned: true
    t.index ["permission_id"], name: "permission_id"
  end

  create_table "tbl_roles", primary_key: "role_id", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.string "role_name", limit: 100, null: false
    t.string "description", limit: 225, null: false
  end

  create_table "tbl_schools", primary_key: "school_id", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.string "school_name", null: false
  end

  create_table "tbl_social_media", primary_key: "social_media_id", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
  end

  create_table "tbl_user_roles", primary_key: "user_role_id", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.integer "user_id", null: false, unsigned: true
    t.integer "role_id", null: false, unsigned: true
    t.index ["role_id"], name: "role_id"
    t.index ["user_id"], name: "user_id"
  end

  create_table "tbl_users", primary_key: "user_id", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.column "title", "enum('Mr.','Mrs.','Miss.','Ms.','Dr.','Prof.','Rev.','Pastor','Father','Sister','Prophet','Rev.Fr.Dr','Rev.Dr','Fr.Dr.','Sheikh.Dr')", null: false
    t.string "first_name", limit: 200, null: false
    t.string "middle_names", limit: 200
    t.string "surname", limit: 200, null: false
    t.string "email", null: false
    t.string "encrypted_password"
    t.column "account_status", "enum('ACTIVE','BLOCKED')", default: "ACTIVE"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.column "sex", "enum('MALE','FEMALE')"
    t.binary "profile_picture", size: :long
  end

  create_table "tbl_vacancies", primary_key: "vacancy_id", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.integer "created_by", null: false, unsigned: true
    t.string "position", null: false
    t.string "slug", null: false
    t.text "content", size: :long, null: false
    t.datetime "deadline", precision: nil, null: false
    t.string "department"
    t.string "organisation"
    t.string "reference_number"
    t.column "category", "enum('TENURE','CONTRACT','CONTRACT/TENURE')", null: false
    t.datetime "deleted_at", precision: nil
    t.integer "deleted_by", unsigned: true
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.column "published", "enum('0','1')", default: "0"
    t.string "location"
    t.index ["created_by"], name: "created_by"
    t.index ["deleted_by"], name: "deleted_by"
  end

  create_table "users", charset: "utf8mb3", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "tbl_adverts", "tbl_alumni", column: "created_by", primary_key: "alumni_id", name: "tbl_adverts_ibfk_1", on_update: :cascade
  add_foreign_key "tbl_adverts", "tbl_alumni", column: "deleted_by", primary_key: "alumni_id", name: "tbl_adverts_ibfk_2", on_update: :cascade
  add_foreign_key "tbl_alumni", "tbl_users", column: "user_id", primary_key: "user_id", name: "fk_alumni_user", on_update: :cascade
  add_foreign_key "tbl_alumni_achievements", "tbl_alumni", column: "alumni_id", primary_key: "alumni_id", name: "tbl_alumni_achievements_ibfk_1", on_update: :cascade
  add_foreign_key "tbl_alumni_association_projects", "tbl_alumni", column: "alumni_id", primary_key: "alumni_id", name: "tbl_alumni_association_projects_ibfk_3", on_update: :cascade
  add_foreign_key "tbl_alumni_association_projects", "tbl_association_projects", column: "association_project_id", primary_key: "association_project_id", name: "tbl_alumni_association_projects_ibfk_2", on_update: :cascade
  add_foreign_key "tbl_alumni_association_projects", "tbl_project_participation_types", column: "project_participation_type_id", primary_key: "project_participation_type_id", name: "tbl_alumni_association_projects_ibfk_1", on_update: :cascade
  add_foreign_key "tbl_alumni_awards", "tbl_alumni", column: "alumni_id", primary_key: "alumni_id", name: "tbl_alumni_awards_ibfk_1", on_update: :cascade
  add_foreign_key "tbl_alumni_cv_projects", "tbl_alumni", column: "alumni_id", primary_key: "alumni_id", name: "tbl_alumni_cv_projects_ibfk_1", on_update: :cascade
  add_foreign_key "tbl_alumni_donations", "tbl_alumni", column: "alumni_id", primary_key: "alumni_id", name: "tbl_alumni_donations_ibfk_1", on_update: :cascade
  add_foreign_key "tbl_alumni_donations", "tbl_association_projects", column: "association_project_id", primary_key: "association_project_id", name: "fk_alumni_donations_association_project_id", on_update: :cascade
  add_foreign_key "tbl_alumni_employment_history", "tbl_alumni", column: "alumni_id", primary_key: "alumni_id", name: "tbl_alumni_employment_history_ibfk_1", on_update: :cascade
  add_foreign_key "tbl_alumni_newsletter_subscriptions", "tbl_alumni", column: "alumni_id", primary_key: "alumni_id", name: "tbl_alumni_newsletter_subscriptions_ibfk_2", on_update: :cascade
  add_foreign_key "tbl_alumni_newsletter_subscriptions", "tbl_newsletters", column: "newsletter_id", primary_key: "newsletter_id", name: "tbl_alumni_newsletter_subscriptions_ibfk_1", on_update: :cascade
  add_foreign_key "tbl_alumni_other_qualifications", "tbl_alumni", column: "alumni_id", primary_key: "alumni_id", name: "tbl_alumni_other_qualifications_ibfk_2", on_update: :cascade
  add_foreign_key "tbl_alumni_other_qualifications", "tbl_qualification_types", column: "qualification_type_id", primary_key: "qualification_type_id", name: "tbl_alumni_other_qualifications_ibfk_1", on_update: :cascade
  add_foreign_key "tbl_alumni_programmes", "tbl_alumni", column: "alumni_id", primary_key: "alumni_id", name: "tbl_alumni_programmes_ibfk_3", on_update: :cascade
  add_foreign_key "tbl_alumni_programmes", "tbl_programme_qualifications", column: "programme_qualification_id", primary_key: "programme_qualification_id", name: "tbl_alumni_programmes_ibfk_1", on_update: :cascade
  add_foreign_key "tbl_alumni_programmes", "tblprogrammes", column: "programme_id", primary_key: "ProgrammeID", name: "tbl_alumni_programmes_ibfk_4"
  add_foreign_key "tbl_alumni_referees", "tbl_alumni", column: "alumni_id", primary_key: "alumni_id", name: "tbl_alumni_referees_ibfk_1", on_update: :cascade
  add_foreign_key "tbl_alumni_social_links", "tbl_alumni", column: "alumni_id", primary_key: "alumni_id", name: "tbl_alumni_social_links_ibfk_1", on_update: :cascade
  add_foreign_key "tbl_alumni_social_links", "tbl_social_media", column: "social_media_id", primary_key: "social_media_id", name: "tbl_alumni_social_links_ibfk_2", on_update: :cascade
  add_foreign_key "tbl_alumni_sockets", "tbl_alumni", column: "alumni_id", primary_key: "alumni_id", name: "tbl_alumni_sockets_ibfk_1", on_update: :cascade
  add_foreign_key "tbl_alumni_special_skills", "tbl_alumni", column: "alumni_id", primary_key: "alumni_id", name: "tbl_alumni_special_skills_ibfk_1", on_update: :cascade
  add_foreign_key "tbl_alumni_transcript_requests", "tbl_alumni", column: "alumni_id", primary_key: "alumni_id", name: "tbl_alumni_transcript_requests_ibfk_2", on_update: :cascade
  add_foreign_key "tbl_alumni_transcript_requests", "tbl_couriers", column: "courier_id", primary_key: "courier_id", name: "tbl_alumni_transcript_requests_ibfk_1", on_update: :cascade
  add_foreign_key "tbl_association_executive_members", "tbl_alumni", column: "alumni_id", primary_key: "alumni_id", name: "tbl_association_executive_members_ibfk_1", on_update: :cascade
  add_foreign_key "tbl_association_executive_members", "tbl_association_executive_positions", column: "association_executive_position_id", primary_key: "association_executive_position_id", name: "tbl_association_executive_members_ibfk_2", on_update: :cascade
  add_foreign_key "tbl_association_project_participation_types", "tbl_association_projects", column: "association_project_id", primary_key: "association_project_id", name: "tbl_association_project_participation_types_ibfk_2", on_update: :cascade
  add_foreign_key "tbl_association_project_participation_types", "tbl_project_participation_types", column: "project_participation_type_id", primary_key: "project_participation_type_id", name: "tbl_association_project_participation_types_ibfk_1", on_update: :cascade
  add_foreign_key "tbl_association_projects", "tbl_alumni", column: "created_by", primary_key: "alumni_id", name: "tbl_association_projects_ibfk_1", on_update: :cascade
  add_foreign_key "tbl_blocked_chats", "tbl_alumni", column: "alumni_id", primary_key: "alumni_id", name: "tbl_blocked_chats_ibfk_1", on_update: :cascade
  add_foreign_key "tbl_blocked_chats", "tbl_alumni", column: "blocked_alumni", primary_key: "alumni_id", name: "tbl_blocked_chats_ibfk_2", on_update: :cascade
  add_foreign_key "tbl_chats", "tbl_alumni", column: "recipient", primary_key: "alumni_id", name: "tbl_chats_ibfk_3_new", on_update: :cascade
  add_foreign_key "tbl_chats", "tbl_alumni", column: "sender", primary_key: "alumni_id", name: "tbl_chats_ibfk_2", on_update: :cascade
  add_foreign_key "tbl_chats", "tbl_chats", column: "replied_to", primary_key: "chat_id", name: "tbl_chats_ibfk_1", on_update: :cascade
  add_foreign_key "tbl_election_position_candidates", "tbl_alumni", column: "candidate", primary_key: "alumni_id", name: "tbl_election_position_candidates_ibfk_2", on_update: :cascade
  add_foreign_key "tbl_election_position_candidates", "tbl_election_positions", column: "election_position_id", primary_key: "election_position_id", name: "tbl_election_position_candidates_ibfk_1", on_update: :cascade
  add_foreign_key "tbl_election_positions", "tbl_elections", column: "election_id", primary_key: "election_id", name: "tbl_election_positions_ibfk_1", on_update: :cascade
  add_foreign_key "tbl_election_voters", "tbl_alumni", column: "voter", primary_key: "alumni_id", name: "tbl_election_voters_ibfk_2", on_update: :cascade
  add_foreign_key "tbl_election_voters", "tbl_elections", column: "election_id", primary_key: "election_id", name: "tbl_election_voters_ibfk_1", on_update: :cascade
  add_foreign_key "tbl_election_votes", "tbl_alumni", column: "voter", primary_key: "alumni_id", name: "tbl_election_votes_ibfk_2", on_update: :cascade
  add_foreign_key "tbl_election_votes", "tbl_election_position_candidates", column: "election_position_candidate_id", primary_key: "election_position_candidate_id", name: "tbl_election_votes_ibfk_1", on_update: :cascade
  add_foreign_key "tbl_elections", "tbl_alumni", column: "created_by", primary_key: "alumni_id", name: "tbl_elections_ibfk_1", on_update: :cascade
  add_foreign_key "tbl_electoral_body_position_holders", "tbl_alumni", column: "position_holder", primary_key: "alumni_id", name: "tbl_electoral_body_position_holders_ibfk_1", on_update: :cascade
  add_foreign_key "tbl_electoral_body_position_holders", "tbl_elections", column: "election_id", primary_key: "election_id", name: "tbl_electoral_body_position_holders_ibfk_2", on_update: :cascade
  add_foreign_key "tbl_electoral_body_position_holders", "tbl_electoral_body_positions", column: "electoral_body_position_id", primary_key: "electoral_body_position_id", name: "tbl_electoral_body_position_holders_ibfk_3", on_update: :cascade
  add_foreign_key "tbl_forum_individuals", "tbl_alumni", column: "alumni_id", primary_key: "alumni_id", name: "tbl_forum_individuals_ibfk_2", on_update: :cascade
  add_foreign_key "tbl_forum_individuals", "tbl_forums", column: "forum_id", primary_key: "forum_id", name: "tbl_forum_individuals_ibfk_1", on_update: :cascade
  add_foreign_key "tbl_forum_posts", "tbl_forums", column: "forum_id", primary_key: "forum_id", name: "tbl_forum_posts_ibfk_1", on_update: :cascade
  add_foreign_key "tbl_forum_posts", "tbl_posts", column: "post_id", primary_key: "post_id", name: "tbl_forum_posts_ibfk_2", on_update: :cascade
  add_foreign_key "tbl_forum_programmes", "tbl_forums", column: "forum_id", primary_key: "forum_id", name: "tbl_forum_programmes_ibfk_1", on_update: :cascade
  add_foreign_key "tbl_forum_programmes", "tbl_programmes", column: "programme_id", primary_key: "programme_id", name: "tbl_forum_programmes_ibfk_2", on_update: :cascade
  add_foreign_key "tbl_forum_schools", "tbl_forums", column: "forum_id", primary_key: "forum_id", name: "tbl_forum_schools_ibfk_1", on_update: :cascade
  add_foreign_key "tbl_forum_schools", "tbl_schools", column: "school_id", primary_key: "school_id", name: "tbl_forum_schools_ibfk_2", on_update: :cascade
  add_foreign_key "tbl_forums", "tbl_alumni", column: "created_by", primary_key: "alumni_id", name: "tbl_forums_ibfk_1", on_update: :cascade
  add_foreign_key "tbl_forums", "tbl_alumni", column: "deleted_by", primary_key: "alumni_id", name: "tbl_forums_ibfk_2", on_update: :cascade
  add_foreign_key "tbl_logs", "tbl_users", column: "user_id", primary_key: "user_id", name: "tbl_logs_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "tbl_newsletter_posts", "tbl_alumni", column: "created_by", primary_key: "alumni_id", name: "tbl_newsletter_posts_ibfk_1", on_update: :cascade
  add_foreign_key "tbl_newsletter_posts", "tbl_newsletters", column: "newsletter_id", primary_key: "newsletter_id", name: "tbl_newsletter_posts_ibfk_2", on_update: :cascade
  add_foreign_key "tbl_post_comments", "tbl_alumni", column: "created_by", primary_key: "alumni_id", name: "tbl_post_comments_ibfk_1", on_update: :cascade
  add_foreign_key "tbl_post_comments", "tbl_alumni", column: "deleted_by", primary_key: "alumni_id", name: "tbl_post_comments_ibfk_3", on_update: :cascade
  add_foreign_key "tbl_post_comments", "tbl_forum_posts", column: "forum_post_id", primary_key: "forum_post_id", name: "tbl_post_comments_ibfk_2", on_update: :cascade
  add_foreign_key "tbl_post_likes", "tbl_alumni", column: "liked_or_disliked_by", primary_key: "alumni_id", name: "tbl_post_likes_ibfk_1", on_update: :cascade
  add_foreign_key "tbl_post_likes", "tbl_forum_posts", column: "forum_post_id", primary_key: "forum_post_id", name: "tbl_post_likes_ibfk_2", on_update: :cascade
  add_foreign_key "tbl_posts", "tbl_alumni", column: "created_by", primary_key: "alumni_id", name: "tbl_posts_ibfk_1", on_update: :cascade
  add_foreign_key "tbl_posts", "tbl_alumni", column: "deleted_by", primary_key: "alumni_id", name: "tbl_posts_ibfk_2", on_update: :cascade
  add_foreign_key "tbl_programme_qualifications", "tbl_programmes", column: "programme_id", primary_key: "programme_id", name: "tbl_programme_qualifications_ibfk_1", on_update: :cascade
  add_foreign_key "tbl_programmes", "tbl_schools", column: "school_id", primary_key: "school_id", name: "tbl_programmes_ibfk_1", on_update: :cascade
  add_foreign_key "tbl_role_permissions", "tbl_permissions", column: "permission_id", primary_key: "permission_id", name: "tbl_role_permissions_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "tbl_role_permissions", "tbl_roles", column: "role_id", primary_key: "role_id", name: "tbl_role_permissions_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "tbl_user_roles", "tbl_roles", column: "role_id", primary_key: "role_id", name: "tbl_user_roles_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "tbl_user_roles", "tbl_users", column: "user_id", primary_key: "user_id", name: "tbl_user_roles_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "tbl_vacancies", "tbl_alumni", column: "created_by", primary_key: "alumni_id", name: "tbl_vacancies_ibfk_1", on_update: :cascade
  add_foreign_key "tbl_vacancies", "tbl_alumni", column: "deleted_by", primary_key: "alumni_id", name: "tbl_vacancies_ibfk_2", on_update: :cascade
end
