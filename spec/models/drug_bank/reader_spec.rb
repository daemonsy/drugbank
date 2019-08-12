require "rails_helper"

module DrugBank
  RSpec.describe Reader do
    describe "#process" do
      let(:fixture) { File.read(Rails.root.join("spec", "support", "fixtures", "drugs", "lepirudin.xml")) }
      let(:drug_data) { Nokogiri::XML(fixture).at('drug') }

      it "parses and map the XML drug representation" do
        drug = described_class.new(drug_data).process

        # Sanity check. Most attributes have constraints, so I'm gonna be lazy
        expect(drug.name).to eq("Lepirudin")
      end

      it "creates drug identifications" do
        drug = described_class.new(drug_data).process
        primary_id = drug.identifications.find(&:primary)

        expect(drug.identifications.size).to eq(3)
        expect(primary_id).to be_present
        expect(primary_id.source_id).to eq("DB00001")
      end
    end
  end
end
