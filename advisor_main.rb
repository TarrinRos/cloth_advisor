require_relative 'lib/cloth'
require_relative 'lib/wardrobe'

current_path = File.dirname(__FILE__)

# Считывает одежду из файлов и создает каждый экземпляр класса "Cloth"
# Создает коллекцию вещей Хэш с ключами :name :type :temperature
# Пользовтель вводиттекущую температуру
# Программа проходится по коллекции и по ключу :temperature подбирает вещи по погоде
# Выводит на экран по шаблону: голова - тело - ноги - обувь


full_path = Dir.glob("#{current_path}/data/*.txt")

wardrobe = Wardrobe.new

full_path.each do |path|
  item = File.readlines(path, chomp: true)

  cloth = Cloth.new(item[0], item[1], item[2])

  wardrobe.add_cloth(cloth.item)
end

puts 'Какая температура сейчас на улице?'

puts 'Например:"-20" или "20"'

out_temp = STDIN.gets.to_i