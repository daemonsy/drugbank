module DrugBank
  module Parsers
    class AttributeList
      def self.perform(node, parent)
        node.element_children.map(&:text)
      end
    end
  end
end
