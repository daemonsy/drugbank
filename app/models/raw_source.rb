class RawSource < ApplicationRecord
  belongs_to :drug

  def parsed_data
    @parsed_data ||= begin
      Nokogiri::XML(data).at('drug') if data_type == 'xml'
    end
  end
end
