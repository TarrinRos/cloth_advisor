class Wardrobe
  attr_reader :wardrobe

  def initialize
    @wardrobe = []
  end

  def add_cloth(cloth)
    @wardrobe << cloth
  end
end