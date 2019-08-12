module DrugBank
  module Parsers
    class AttributeList
      def self.perform(options)
        node, record, attr_name = options.values_at(:node, :record, :attr_name)

        record.write_attribute(attr_name, node.element_children.map(&:text))
      end
    end
  end
end
