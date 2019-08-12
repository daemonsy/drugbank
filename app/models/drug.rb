class Drug < ApplicationRecord
  has_many :identifications, class_name: 'DrugIdentification'
  has_many :interactions, class_name: 'DrugInteraction', foreign_key: :source_drug_id
  has_many :raw_sources
  has_one :drugbank_source, -> { where(source: :drugbank) }, class_name: 'RawSource'
end
