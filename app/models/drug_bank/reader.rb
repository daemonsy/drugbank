module DrugBank
  class Reader
    PARSERS = {
      drugbank_id: Parsers::DrugIdentification,
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
      meta = node.attributes.transform_values(&:value)
      drug = Drug.new(
        drug_type: meta["type"],
        drug_created: DateTime.parse(meta["created"]),
        drug_updated: DateTime.parse(meta["updated"]))
      drug.raw_sources.build(source: :drugbank, data: node.to_xml, data_type: :xml)

      node.element_children.each do |element|
        attr_name = element.name.parameterize.underscore.to_sym
        parser = PARSERS[attr_name]
        parser.perform({ node: element, parent: node, record: drug, attr_name: attr_name }) if parser
      end

      drug.tap(&:save!)
    end

  private
    attr_reader :node
  end
end
