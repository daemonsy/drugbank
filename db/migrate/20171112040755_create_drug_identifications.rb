class CreateDrugIdentifications < ActiveRecord::Migration[5.1]
  def change
    create_table :drug_identifications do |t|
      t.references :drug, foreign_key: true, index: true
      t.text :source, null: false
      t.text :source_id, null: false
      t.boolean :primary, null: false, default: false
    end
    add_index :drug_identifications, [:source, :source_id], unique: true
  end
end
