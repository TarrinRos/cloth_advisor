require_relative 'lib/cloth'
require_relative 'lib/cloth_collection'

current_path = File.dirname(__FILE__)

# Считывает одержу из файлов и создает каждый экземпляр класса "Вещь"
# Создает коллекцию вещей Хэш с ключами :name :type :temperature
# Пользовтель вводиттекущую температуру
# Программа проходится по коллекции и по ключу :temperature подбирает вещи по погоде
# Выводит на экран по шаблону: голова - тело - ноги - обувь

cloth_collection = ClothCollection.new(cloth)