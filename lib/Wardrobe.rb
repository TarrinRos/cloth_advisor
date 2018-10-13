class Wardrobe
  attr_reader :wardrobe

  def initialize(full_path)
    @wardrobe = full_path.map {|path| Cloth.new(path)}
    @selected_cothes = {}
  end

  def advise(out_temp)
    selected_clothes = []
    @wardrobe.map do |cloth|
      if cloth.for_weather?(out_temp)
        selected_clothes << cloth
      end
    end
    selected_clothes.inspect
  end
end