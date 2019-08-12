class CreateRawSources < ActiveRecord::Migration[5.1]
  def change
    create_table :raw_sources do |t|
      t.references :drug, foreign_key: true
      t.text :source, null: false
      t.text :data_type, null: false
      t.text :data, null: false
    end
    add_index :raw_sources, [:drug_id, :source], unique: true
  end
end
