class DrugInteraction < ApplicationRecord
  belongs_to :source_drug, class_name: 'Drug'
  belongs_to :target_drug, class_name: 'Drug'
end
