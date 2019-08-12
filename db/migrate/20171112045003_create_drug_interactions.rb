class CreateDrugInteractions < ActiveRecord::Migration[5.1]
  def change
    create_table :drug_interactions do |t|
      t.references :source_drug, foreign_key: { to_table: :drugs }, index: true, null: false
      t.references :target_drug, foreign_key: { to_table: :drugs }, index: true, null: true
      t.text :description, null: false
      t.text :name, null: false
      t.timestamps null: false
    end
  end
end
