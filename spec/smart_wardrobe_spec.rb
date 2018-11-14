require 'rspec'
require 'smart_wardrobe'
require 'cloth'

describe SmartWardrobe do
  let(:wardrobe) do
    files_list = Dir.glob("spec/fixtures/*.txt")
    SmartWardrobe.new(files_list)
  end

  describe '#to_a' do
    it 'fills wardrobe array by the cloth instances' do
      expect(wardrobe.to_a[0]).to be_an_instance_of Cloth
    end
  end

  describe '#advise' do
    it 'returns hash with selected cloth by temperature' do
      advised_cloth_hash = wardrobe.advise(10)

      expect(advised_cloth_hash).to be_an_instance_of Hash
      expect(advised_cloth_hash.has_key?('Тело')).to be_truthy
    end
  end
end