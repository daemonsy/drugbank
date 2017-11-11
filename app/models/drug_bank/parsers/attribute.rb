module DrugBank
  module Parsers
    class Attribute
      def self.perform(node, parent)
        node.text
      end
    end
  end
end
