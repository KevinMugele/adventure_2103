require 'rspec'
require './lib/hiker'
require './lib/park'
require './lib/trail'

describe Hiker do
  describe '::initialize' do
    it 'exists' do
      hiker = Hiker.new('Dora', :moderate)

      expect(hiker).is_a? Hiker 
    end
    
    it 'has attributes' do
      hiker = Hiker.new('Dora', :moderate)

      expect(hiker.name).to eq 'Dora'
      expect(hiker.experience_level).to eq :moderate
      expect(hiker.snacks).to eq ({})
    end 
  end

  describe '#pack' do
    it 'adds snack and snack quantity to snacks hash' do
      hiker = Hiker.new('Dora', :moderate)
      hiker.pack('water', 1)
      hiker.pack('trail mix', 3)

      expect(hiker.snacks).to eq ({"water"=>1, "trail mix"=>3})

      hiker.pack('water', 1)

      expect(hiker.snacks).to eq ({"water"=>2, "trail mix"=>3})
    end
  end
end