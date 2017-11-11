require "thor"
require_relative File.expand_path('../../../config/environment',  __FILE__)

class DrugBank < Thor
  desc "parse_drugbank_data", "Translates db/drugs.xml to drug records"
  def parse_drugbank_data
    file = File.open(Rails.root.join("db", "drugs.xml"))

    Nokogiri::XML::Reader(file).each do |node|
      ::DrugBank::Reader.new(
        Nokogiri::XML(node.outer_xml).at('drug')
      ).process if node.name == "drug" && node.node_type == Nokogiri::XML::Reader::TYPE_ELEMENT
    end
  end
end
