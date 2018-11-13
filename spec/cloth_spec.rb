require 'rspec'
require 'cloth'

describe Cloth do
  let(:cloth) { Cloth.new("spec/fixtures/cloth_sample.txt") }

  describe '#initialize' do
    it 'assings title, type and temperature from array' do
      temper_range = [-20, -5]

      expect(cloth.title).to eq 'Куртка Gore-tex'
      expect(cloth.type).to eq 'Тело'
      expect(cloth.temper).to eq temper_range
    end
  end

  describe '#for_weather?' do
    it 'returns true if cloth is for weather' do
      temper = -10
      expect(cloth.for_weather?(temper)).to be_truthy
    end

    it 'returns false if cloth is not for weather`' do
      temper = 25
      expect(cloth.for_weather?(temper)).to be_falsey
    end
  end

  describe '#to_s' do
    it 'returns string with parameters' do
      expect(cloth.to_s).to eq "#{cloth.type}: #{cloth.title}, (#{cloth.temper[0]}..#{cloth.temper[1]})"
    end
  end
end