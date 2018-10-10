class ClothCollection
  attr_reader :wardrobe

  def initialize(cloth)
    @wardrobe = []
    @wardrobe = cloth.item
  end
end