class CreateDrugs < ActiveRecord::Migration[5.1]
  def change
    create_table :drugs do |t|
      t.text :drug_type, null: false
      t.datetime :drug_created, null: false
      t.datetime :drug_updated, null: false
      t.text :name, null: false
      t.text :description, null: false
      t.text :cas_number, null: false
      t.text :unii, null: false
      t.text :state
      t.text :groups, array: true, null: false
      t.text :indication, null: false
      t.text :pharmacodynamics, null: false
      t.text :mechanism_of_action, null: false
      t.text :toxicity, null: false
      t.text :metabolism, null: false
      t.text :absorption, null: false
      t.text :half_life, null: false
      t.text :protein_binding, null: false
      t.text :route_of_elimination, null: false
      t.text :volume_of_distribution, null: false
      t.text :clearance, null: false

      t.timestamps null: false
    end
  end
end
