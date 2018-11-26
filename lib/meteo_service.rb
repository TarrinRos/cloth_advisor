require 'uri'
require 'net/http'
require_relative 'meteo_data'

class MeteoService
  TOWNS = {'Москва': '37', 'Рига': '312', 'ГонКонг': '256', 'Женева': '374', 'Вашингтон': '384', 'Каир': '334'}

  def self.get_towns_list
    TOWNS.keys.sort
  end

  def self.get_xml(selected_town)
    town_id = TOWNS[selected_town]
    response = Net::HTTP.get_response(URI("https://xml.meteoservice.ru/export/gismeteo/point/#{town_id}.xml"))
    response.body
  end
end