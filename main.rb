require_relative 'lib/cloth'
require_relative 'lib/smart_wardrobe'
require_relative 'lib/meteo_service'

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
towns_list = MeteoService.get_towns_list

puts
puts 'Под погоду какого города Вы бы хотели подобрать одежду?'
puts

# выводит список на экран с индексом
towns_list.each_with_index do |town, index|
  puts "#{index + 1}. #{town}"
end

user_choice = STDIN.gets.to_i

selected_town = towns_list[user_choice - 1]

xml_body = MeteoService.get_xml(selected_town)

meteo_data = MeteoData.get_from_xml(xml_body)

# Выводит строку с сформированными данными прогноза
puts
puts "В городе #{meteo_data.city_name} сейчас: #{meteo_data.min_temp} ℃"
puts
puts "Я бы посоветовал Вам надеть:"
puts

advised_clothes = smart_wardrobe.advise(meteo_data.min_temp)

advised_clothes.each { |type, cloth| puts cloth.sample }