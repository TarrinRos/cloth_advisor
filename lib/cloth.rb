class Cloth
  attr_reader :item

  def initialize(current_path)

    full_path = Dir.glob("#{current_path}/data/*.txt")

    full_path.each do |path|
      @item = File.readlines(path, chomp: true)
    end
  end
end