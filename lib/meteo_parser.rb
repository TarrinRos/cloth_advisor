require 'uri'
require 'net/http'
require_relative 'meteo_data'

class MeteoParser
  TOWNS = {'Москва': '37', 'Рига': '312', 'ГонКонг': '256', 'Женева': '374', 'Вашингтон': '384', 'Каир': '334'}

  attr_reader :node, :city_name

  def self.get_towns_list
    TOWNS.keys.sort
  end

  def self.get_data_from_xml(choiced_town)
    # Формирует ссылку на XML файл исходя из выбранного города и отправляет запрос
    uri = URI.parse("https://xml.meteoservice.ru/export/gismeteo/point/#{TOWNS[choiced_town]}.xml")

    # Получает ответ от сервера по указаной ссылке
    response = Net::HTTP.get_response(uri)

    doc = REXML::Document.new(response.body)

    new(doc)
  end

  def initialize(selected_town)
    @town_id = selected_town
    response = Net::HTTP.get_response(URI("https://xml.meteoservice.ru/export/gismeteo/point/#{@town_id}.xml"))
    response.body
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