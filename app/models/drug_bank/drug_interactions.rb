module DrugBank
  class DrugInteractions
    def process
      Drug.includes(:drugbank_source).find_each do |drug|
        k = drug
          .drugbank_source
          .parsed_data
          .element_children
          .find { |element| element.name == 'drug-interactions' }
          .element_children
          .each do |interaction|
            data = interaction.element_children.each_with_object({}) { |node, hash| hash[node.name] = node.text }
            interaction = drug.interactions.find_or_initialize_by(
              target_drug: DrugIdentification.find_by(source: :drugbank, source_id: data.fetch("drugbank-id"))&.drug,
              description: data.fetch("description"),
              name: data.fetch("name")
            )
            interaction.save!
          end
      end
    end

  private
    attr_reader :node
  end
end
