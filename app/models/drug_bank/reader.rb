module DrugBank
  class Reader
    PARSERS = {
      name: Parsers::Attribute,
      type: Parsers::Attribute,
      description: Parsers::Attribute,
      cas_number: Parsers::Attribute,
      unii: Parsers::Attribute,
      state: Parsers::Attribute,
      groups: Parsers::AttributeList,
      indication: Parsers::Attribute,
      pharmacodynamics: Parsers::Attribute,
      mechanism_of_action: Parsers::Attribute,
      toxicity: Parsers::Attribute,
      metabolism: Parsers::Attribute,
      absorption: Parsers::Attribute,
      half_life: Parsers::Attribute,
      protein_binding: Parsers::Attribute,
      route_of_elimination: Parsers::Attribute,
      volume_of_distribution: Parsers::Attribute,
      clearance: Parsers::Attribute
    }.freeze

    def initialize(node)
      @node = node
    end

    def process
      type = node.attributes["type"]
      drug = Drug.new(drug_type: type&.value)

      node.element_children.each do |element|
        attr_name = element.name.parameterize.underscore.to_sym
        parser = PARSERS[attr_name]
        if parser
          value = parser.perform(element, node)
          drug.write_attribute(attr_name, value)
        end
      end

      drug.save!
    end

  private
    attr_reader :node
  end
end
