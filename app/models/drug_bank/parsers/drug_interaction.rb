module DrugBank
  module Parsers
    class DrugInteraction
      def self.perform(options)
        node, record = options.values_at(:node, :record)

        node.element_children.each do |interaction|
          data = interaction.element_children.each_with_object({}) { |node, hash| hash[node.name] = node.text }
          binding.pry

          record.interactions
            .find_or_initialize_by(
              drug_identification: DrugIdentification.find_or_initialize_by()
            )
        end
      end
    end
  end
end
