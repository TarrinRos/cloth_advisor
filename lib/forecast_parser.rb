require 'uri'
require 'rexml/document'
require_relative 'meteo_data'

class ForecastParser
  attr_reader :node, :city_name

  def self.get_data_from_xml(choiced_town)
    # Формирует ссылку на XML файл исходя из выбранного города и отправляет запрос
    uri = URI.parse("https://xml.meteoservice.ru/export/gismeteo/point/#{TOWNS[choiced_town]}.xml")

    # Получает ответ от сервера по указаной ссылке
    response = Net::HTTP.get_response(uri)

    doc = REXML::Document.new(response.body)

    new(doc)
  end

  def initialize(doc)
    @node = to_a(doc)
    @city_name = get_city_name(doc)
  end

  private

  # Передает каждый выбранный элемент в массив
  def to_a(doc)
    doc.root.elements['REPORT/TOWN'].elements.to_a[0]
  end

  # Вытаскивает название города и преобразует его из "%D0%A0%D0" в читаемый вид
  def get_city_name(doc)
    URI.unescape(doc.root.elements['REPORT/TOWN'].attributes['sname'])
  end
end