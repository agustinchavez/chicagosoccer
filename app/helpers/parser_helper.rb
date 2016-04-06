module ParserHelper

  def self.get_data
    response = HTTParty.get("http://www.json-generator.com/api/json/get/caiIDdbTPC?indent=2")
    response.each{|row| Pitch.create(row) if row["latitude"] && row["longitude"]}
  end

end


