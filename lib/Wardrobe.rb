class Wardrobe
  attr_reader :wardrobe, :types

  def initialize(full_path)
    @wardrobe = full_path.map {|path| Cloth.new(path)}
    @types = collect_types
  end

  def collect_for_weather(out_temp)
    all_collected_clothes = @wardrobe.select { |cloth| cloth.for_weather?(out_temp) }

    all_collected_clothes
  end

  def collect_types
    hh = @wardrobe.map { |cloth| cloth.type }.uniq
    hh.each_with_index.to_h
  end

  def advise

  end

  # def advise_head(out_temp)
  #   head = @wardrobe.select { |cloth| cloth.for_weather?(out_temp) && cloth.type == "Голова" }
  #   head.sample
  # end
  #
  # def advise_body(out_temp)
  #   body = @wardrobe.select { |cloth| cloth.for_weather?(out_temp) && cloth.type == "Тело" }
  #   body.sample
  # end
  #
  # def advise_legs(out_temp)
  #   legs = @wardrobe.select { |cloth| cloth.for_weather?(out_temp) && cloth.type == "Ноги" }
  #   legs.sample
  # end
  #
  # def advise_boots(out_temp)
  #   boots = @wardrobe.select { |cloth| cloth.for_weather?(out_temp) && cloth.type == "Обувь" }
  #   boots.sample
  # end
end