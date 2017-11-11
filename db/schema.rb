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

ActiveRecord::Schema.define(version: 20171111174259) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drugs", force: :cascade do |t|
    t.text "drug_type"
    t.text "name", null: false
    t.text "description"
    t.text "cas_number", null: false
    t.text "unii", null: false
    t.text "state", null: false
    t.text "groups", null: false, array: true
    t.text "indication", null: false
    t.text "pharmacodynamics", null: false
    t.text "mechanism_of_action", null: false
    t.text "toxicity", null: false
    t.text "metabolism", null: false
    t.text "absorption", null: false
    t.text "half_life", null: false
    t.text "protein_binding"
    t.text "route_of_elimination", null: false
    t.text "volume_of_distribution", null: false
    t.text "clearance", null: false
  end

end
