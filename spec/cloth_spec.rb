require 'rspec'
require 'cloth'

describe Cloth do
  let(:cloth) { Cloth.new("spec/fixtures/cloth_sample.txt") }
  describe '#initialize' do
    it 'returns title, type and temperature' do
      temper = [-20, -5]

      expect(cloth.title).to eq 'Куртка Gore-tex'
      expect(cloth.type).to eq 'Тело'
      expect(cloth.temper).to eq temper
    end
  end

  describe '#for_weather?' do

  end

  describe '#to_s' do

  end
end