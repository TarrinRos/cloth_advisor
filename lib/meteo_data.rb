require 'rexml/document'

class MeteoData

  # Возвращает дату в формате ДД.ММ.ГГГГ
  def self.get_from_xml(xml)
    doc = REXML::Document.new(xml)

    city_name = URI.unescape(doc.root.elements['REPORT/TOWN'].attributes['sname'])

    node = doc.root.elements['REPORT/TOWN'].elements.to_a[0]

    min_temp = node.elements['TEMPERATURE'].attributes['min'].to_i

    new(city_name, min_temp)
  end

  attr_reader :city_name, :min_temp

  def initialize(city_name, min_temp)
    @city_name = city_name
    @min_temp = min_temp
  end
end