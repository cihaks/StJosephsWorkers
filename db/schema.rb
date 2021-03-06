# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110913070044) do

  create_table "activity_logs", :force => true do |t|
    t.integer  "client_id"
    t.integer  "model_id"
    t.string   "action"
    t.string   "model_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  create_table "address_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  create_table "addresses", :force => true do |t|
    t.integer  "client_id"
    t.integer  "state_id"
    t.integer  "address_type_id"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.integer  "zip_code",        :limit => 8
    t.boolean  "primary_ind"
    t.boolean  "current_ind"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.integer  "shelter_id"
  end

  create_table "agencies", :force => true do |t|
    t.integer  "agency_type_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  create_table "agency_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  create_table "app_interviews", :force => true do |t|
    t.integer  "client_id"
    t.integer  "company_id"
    t.integer  "industry_id"
    t.date     "meeting_date"
    t.boolean  "application"
    t.boolean  "interview"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  create_table "assigned_agencies", :force => true do |t|
    t.integer  "client_id"
    t.integer  "agency_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.string   "staff_contact"
  end

  create_table "assigned_resources", :force => true do |t|
    t.integer  "client_id"
    t.integer  "resource_type_id"
    t.float    "amount"
    t.integer  "number"
    t.boolean  "verified"
    t.boolean  "required_verification"
    t.date     "resource_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  create_table "assigned_resources_industries", :id => false, :force => true do |t|
    t.integer "assigned_resource_id"
    t.integer "industry_id"
  end

  create_table "assigned_status_types", :force => true do |t|
    t.integer  "status_type_id"
    t.integer  "client_id"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  create_table "benefits_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  create_table "clients", :force => true do |t|
    t.integer  "race_id"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "gender"
    t.date     "birth_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.integer  "education_id"
    t.string   "education_subjects"
    t.boolean  "deleted"
    t.string   "work_note",          :limit => 2048
    t.integer  "work_history_id"
  end

  create_table "clothings", :force => true do |t|
    t.integer  "assigned_resource_id"
    t.string   "note",                 :limit => 2048
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  create_table "companies_daily_passes", :id => false, :force => true do |t|
    t.integer "company_id"
    t.integer "daily_pass_id"
  end

  create_table "contact_types", :force => true do |t|
    t.string   "name",              :limit => 25
    t.string   "description",       :limit => 500
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.boolean  "default_selection"
  end

  create_table "contacts", :force => true do |t|
    t.integer  "contact_type_id"
    t.integer  "client_id"
    t.date     "contact_date"
    t.boolean  "contact_negative"
    t.boolean  "alert"
    t.string   "note",             :limit => 2048
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  create_table "convictions", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  create_table "convictions_crime_sentences", :id => false, :force => true do |t|
    t.integer "crime_sentence_id"
    t.integer "conviction_id"
  end

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  create_table "crime_sentences", :force => true do |t|
    t.integer  "client_id"
    t.integer  "prison_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.integer  "incarceration_length_id"
    t.boolean  "furlough"
  end

  create_table "crime_sentences_crime_types", :id => false, :force => true do |t|
    t.integer "crime_sentence_id", :null => false
    t.integer "crime_type_id",     :null => false
  end

  create_table "crime_types", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  create_table "daily_passes", :force => true do |t|
    t.integer  "assigned_resource_id"
    t.string   "company"
    t.string   "note",                 :limit => 2048
    t.boolean  "application"
    t.boolean  "interview"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  create_table "educations", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "list_order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  create_table "hygienes", :force => true do |t|
    t.integer  "assigned_resource_id"
    t.string   "note",                 :limit => 2048
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  create_table "incarceration_lengths", :force => true do |t|
    t.string   "name"
    t.integer  "list_order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  create_table "industries", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  create_table "job_applications", :force => true do |t|
    t.integer  "client_id"
    t.integer  "company_id"
    t.integer  "industry_id"
    t.date     "application_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  create_table "job_interviews", :force => true do |t|
    t.integer  "client_id"
    t.integer  "company_id"
    t.integer  "industry_id"
    t.date     "interview_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  create_table "job_leads", :force => true do |t|
    t.integer  "client_id"
    t.string   "client_name"
    t.date     "activity_date"
    t.integer  "job_developer_id"
    t.string   "job_developer_name"
    t.string   "company"
    t.boolean  "bus_pass"
    t.boolean  "verified"
    t.boolean  "application"
    t.boolean  "interview"
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "job_rates", :force => true do |t|
    t.integer  "job_id"
    t.decimal  "hourly_rate",      :precision => 6, :scale => 2
    t.date     "hourly_rate_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  create_table "job_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  create_table "jobs", :force => true do |t|
    t.integer  "client_id"
    t.integer  "job_type_id"
    t.integer  "industry_id"
    t.integer  "pay_scale_low"
    t.integer  "pay_scale_high"
    t.boolean  "current"
    t.date     "start_date"
    t.date     "end_date"
    t.date     "last_verified_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.integer  "benefits_type_id"
    t.integer  "company_id"
  end

  create_table "monthly_passes", :force => true do |t|
    t.integer  "assigned_resource_id"
    t.decimal  "amount_paid",                          :precision => 10, :scale => 2
    t.decimal  "amount_due",                           :precision => 10, :scale => 2
    t.string   "note",                 :limit => 2048
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  create_table "phones", :force => true do |t|
    t.integer  "client_id"
    t.string   "phone_number"
    t.boolean  "primary_ind"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.string   "extension",    :limit => 20
  end

  create_table "pictures", :force => true do |t|
    t.integer  "client_id"
    t.binary   "picture"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
  end

  create_table "prisons", :force => true do |t|
    t.string   "name"
    t.string   "county"
    t.boolean  "out_of_state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  create_table "races", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  create_table "registered_classes", :force => true do |t|
    t.integer  "client_id"
    t.string   "completed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.integer  "scheduled_course_id"
  end

  create_table "resource_types", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.string   "type_name"
    t.integer  "status_type_id"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "roles_users", ["role_id"], :name => "index_roles_users_on_role_id"
  add_index "roles_users", ["user_id"], :name => "index_roles_users_on_user_id"

  create_table "scheduled_courses", :force => true do |t|
    t.integer  "course_id"
    t.integer  "capacity"
    t.datetime "course_date"
    t.string   "teacher"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shelters", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  create_table "states", :force => true do |t|
    t.string   "code",        :limit => 2
    t.string   "description"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  create_table "status_types", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.string   "category"
    t.boolean  "inactive",          :default => false
  end

  create_table "substances", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  create_table "used_substances", :force => true do |t|
    t.integer  "client_id"
    t.integer  "substance_id"
    t.date     "sober_date"
    t.boolean  "treatment_program_ind"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

  create_table "voice_mails", :force => true do |t|
    t.integer  "assigned_resource_id"
    t.string   "cvm_number"
    t.string   "cvm_password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  create_table "work_histories", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
