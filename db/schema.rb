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

ActiveRecord::Schema.define(version: 20171113165016) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drug_identifications", force: :cascade do |t|
    t.bigint "drug_id"
    t.text "source", null: false
    t.text "source_id", null: false
    t.boolean "primary", default: false, null: false
    t.index ["drug_id"], name: "index_drug_identifications_on_drug_id"
    t.index ["source", "source_id"], name: "index_drug_identifications_on_source_and_source_id", unique: true
  end

  create_table "drug_interactions", force: :cascade do |t|
    t.bigint "source_drug_id", null: false
    t.bigint "target_drug_id"
    t.text "description", null: false
    t.text "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_drug_id"], name: "index_drug_interactions_on_source_drug_id"
    t.index ["target_drug_id"], name: "index_drug_interactions_on_target_drug_id"
  end

  create_table "drugs", force: :cascade do |t|
    t.text "drug_type", null: false
    t.datetime "drug_created", null: false
    t.datetime "drug_updated", null: false
    t.text "name", null: false
    t.text "description", null: false
    t.text "cas_number", null: false
    t.text "unii", null: false
    t.text "state"
    t.text "groups", null: false, array: true
    t.text "indication", null: false
    t.text "pharmacodynamics", null: false
    t.text "mechanism_of_action", null: false
    t.text "toxicity", null: false
    t.text "metabolism", null: false
    t.text "absorption", null: false
    t.text "half_life", null: false
    t.text "protein_binding", null: false
    t.text "route_of_elimination", null: false
    t.text "volume_of_distribution", null: false
    t.text "clearance", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "raw_sources", force: :cascade do |t|
    t.bigint "drug_id"
    t.text "source", null: false
    t.text "data_type", null: false
    t.text "data", null: false
    t.index ["drug_id", "source"], name: "index_raw_sources_on_drug_id_and_source", unique: true
    t.index ["drug_id"], name: "index_raw_sources_on_drug_id"
  end

  add_foreign_key "drug_identifications", "drugs"
  add_foreign_key "drug_interactions", "drugs", column: "source_drug_id"
  add_foreign_key "drug_interactions", "drugs", column: "target_drug_id"
  add_foreign_key "raw_sources", "drugs"
end
