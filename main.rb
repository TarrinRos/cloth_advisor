require_relative 'lib/cloth'
require_relative 'lib/smart_wardrobe'

current_path = File.dirname(__FILE__)

# Считывает одежду из файлов и создает каждый экземпляр класса "Cloth"
# Пользователь вводит текущую температуру
# Программа подбирает случайные вещи на основании введеной температуры
# Выводит список вещей на экран

full_path = Dir.glob("#{current_path}/data/*.txt")

smart_wardrobe = SmartWardrobe.new(full_path)

puts 'Программа "Одевайтес по погоде" v 1.0.3'

puts '========================================'

sleep 2

puts 'Какая температура сейчас на улице?'

puts 'Например: -20 или 20'

out_temp = STDIN.gets.to_i

puts ''

puts 'В такую погоду я Вам советую надеть:'

puts '===================================='

puts ''

smart_wardrobe.advise(out_temp)
