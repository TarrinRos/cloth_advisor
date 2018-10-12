class Wardrobe
  attr_reader :wardrobe

  def initialize(full_path)
    @wardrobe = full_path.map { |path| Cloth.new(path) }
  end

  def advise(out_temp)

  end
end