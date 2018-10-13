class Wardrobe
  attr_reader :wardrobe

  def initialize(full_path)
    @wardrobe = full_path.map {|path| Cloth.new(path)}
  end

  def advise_head(out_temp)
    head = @wardrobe.select { |cloth| cloth.for_weather?(out_temp) && cloth.type == "Голова" }
    head.sample
  end

  def advise_body(out_temp)
    body = @wardrobe.select { |cloth| cloth.for_weather?(out_temp) && cloth.type == "Тело" }
    body.sample
  end

  def advise_legs(out_temp)
    legs = @wardrobe.select { |cloth| cloth.for_weather?(out_temp) && cloth.type == "Ноги" }
    legs.sample
  end

  def advise_boots(out_temp)
    boots = @wardrobe.select { |cloth| cloth.for_weather?(out_temp) && cloth.type == "Обувь" }
    boots.sample
  end
end