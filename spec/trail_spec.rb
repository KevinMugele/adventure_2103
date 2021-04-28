require 'rspec'
require './lib/trail'

describe Trail do
  describe '::initialize' do
    it 'exists' do
      trail1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})

      expect(trail1).is_a? Trail
    end
    
    it 'has attributes' do
      trail1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})

      expect(trail1.name).to eq "Grand Wash"
      expect(trail1.length_str).to eq '2.2 miles'
      expect(trail1.level).to eq :easy
    end 
  end

  describe '#length' do
    it 'converts length string to float' do
      trail1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})

      expect(trail1.length).to eq 2.2
    end
  end
end