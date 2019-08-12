module DrugBank
  module Parsers
    class DrugIdentification
      def self.perform(options)
        record = options.fetch(:record)

        record.identifications
          .find_or_initialize_by(attributes(options))
      end

      def self.attributes(options)
        node = options.fetch(:node)
        primary = node.attributes.transform_values(&:value).fetch("primary", nil) == 'true'

        { source: 'drugbank', source_id: node.text, primary: primary }
      end
    end
  end
end
