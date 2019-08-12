module DrugBank
  module Parsers
    class Attribute
      def self.perform(options)
        node, record, attr_name = options.values_at(:node, :record, :attr_name)
        record.write_attribute(attr_name, node.text)
      end
    end
  end
end
