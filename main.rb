require_relative 'lib/cloth'
require_relative 'lib/smart_wardrobe'
require 'net/http'
require 'uri'
require_relative 'lib/forecast_parser'

TOWNS = {'Москва': '37', 'Рига': '312', 'ГонКонг': '256', 'Женева': '374', 'Вашингтон': '384', 'Каир': '334'}

puts 'Программа "Одевайтесь по погоде" v 2'
puts '========================================'

sleep 0.5

current_path = File.dirname(__FILE__)

# Считывает одежду из файлов и создает каждый экземпляр класса "Cloth"
# Пользователь вводит текущую температуру
# Программа подбирает случайные вещи на основании введеной температуры
# Выводит список вещей на экран

files_list = Dir.glob("#{current_path}/data/*.txt")

smart_wardrobe = SmartWardrobe.new(files_list)

# Получает все названия городов, формирует из них массив, сортирует по алфавиту
towns_list = TOWNS.keys.to_a.sort

puts
puts 'Под погоду какого города Вы бы хотели подобрать одежду?'
puts

# выводт список на экран с индексом
towns_list.each_with_index do |town, index|
  puts "#{index + 1}. #{town}"
end

user_choice = STDIN.gets.to_i

selected_town = towns_list[user_choice - 1]

forecast = ForecastParser.get_data_from_xml(selected_town)

meteo_data = MeteoData.new(forecast.node)

# Выводит строку с сформированными данными прогноза
puts
puts "В городе #{forecast.city_name} сейчас: #{meteo_data.min_temp} ℃"
puts
puts "Я бы посоветовал Вам надеть:"
puts

advised_clothes = smart_wardrobe.advise(meteo_data.min_temp)

advised_clothes.each { |type, cloth| puts cloth.sample }