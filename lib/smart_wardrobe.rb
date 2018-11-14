class SmartWardrobe
  def initialize(files_list)
    @wardrobe = files_list.map {|path| Cloth.new(path)}
  end

  # Советует случайные вещи разных типов на основании введеной температуры
  # Учитывает возможность добавления в базу новых типов вещей
  # Возвращает одну случайную вещь по каждому и представленных типов
  def advise(out_temp)
    collect_for_weather(out_temp)
    collect_types
    collect_uniq_by_types
    @types_hash.each { |key, value| puts value.sample }
  end

  def to_a
    @wardrobe
  end

  private

  # Собирает все вещи, подпадающие под введеную температуру
  def collect_for_weather(out_temp)
    @all_collected_clothes = @wardrobe.select { |cloth| cloth.for_weather?(out_temp) }
  end

  # Создает хэш, где ключи - типы выбранных вещей
  def collect_types
    @types_hash = {}
    types = @wardrobe.map { |cloth| cloth.type }.uniq
    types.each {|item| @types_hash[item] = [] }
    @types_hash
  end

  # Записывает вещи в хэш, сортируя их по совпадению "ключ хэша == тип вещи"
  def collect_uniq_by_types
    @all_collected_clothes.each do |item|
      @types_hash[item.type] << item if @types_hash.has_key?(item.type)
    end
  end
end