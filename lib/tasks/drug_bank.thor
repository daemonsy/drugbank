require "thor"
require_relative File.expand_path('../../../config/environment',  __FILE__)

class DrugBank < Thor
  desc "seed_drugbank_data", "Translates db/drugs.xml to drug records"
  def seed_drugbank_data
    file = File.open(Rails.root.join("db", "drugs.xml"))
    count = 0

    Nokogiri::XML::Reader(file).each do |node|
      if node.name == "drug" && node.node_type == Nokogiri::XML::Reader::TYPE_ELEMENT && node.depth == 1
        say "Processed: #{count}" if count % 1000 == 0

        ::DrugBank::Reader.new(
          Nokogiri::XML(node.outer_xml).at('drug')
        ).process

        count += 1
      end
    end
    say "Number of drugs processed successfully: #{count}"
  end
end
