class Cloth
  attr_reader :item

  def initialize(name, type, temperature)
    @item = {}
    @item[:name] = name
    @item[:type] = type
    @item[:temperature] = temperature

    @status = false
  end

  def for_weather?(out_temp, wardrobe)

  end
end