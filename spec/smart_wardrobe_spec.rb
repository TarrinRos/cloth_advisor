require 'rspec'
require 'smart_wardrobe'
require 'cloth'

describe SmartWardrobe do
  let(:wardrobe) do
    files_list = Dir.glob("spec/fixtures/*.txt")
    SmartWardrobe.new(files_list)
  end

  describe '#advise' do
    it 'returns hash with selected cloth by temperature' do
      advised_cloth_hash = wardrobe.advise(-10)
      advised_cloth_hash.each { |type, cloth| @advised_cloth = cloth.sample.to_s }

      expect(advised_cloth_hash.has_key?('Тело')).to be_truthy
      expect(@advised_cloth).to eq "Тело: Куртка Gore-tex, (-20..-5)"
    end
  end
end