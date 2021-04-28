require 'rspec'
require './lib/park'
require './lib/trail'

describe Park do
  describe '::initialize' do
    it 'exists' do
      park1 = Park.new('Capitol Reef')

      expect(park1).is_a? Park
    end
    
    it 'has attributes' do
     park1 = Park.new('Capitol Reef')

     expect(park1.name).to eq 'Capitol Reef'
     expect(park1.trails).to eq ([])
    end 
  end

  describe '#add trail' do
    it 'adds trail to trails array' do
      park1 = Park.new('Capitol Reef')
      park2 = Park.new('Bryce Canyon')
      trail1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})
      trail2 = Trail.new({name: 'Cohab Canyon', length: '1.7 miles', level: :moderate})
      trail3 = Trail.new({name: 'Tower Bridge', length: '3.0 miles', level: :moderate})
      
      park1.add_trail(trail1)
      park1.add_trail(trail2)
      park2.add_trail(trail3)

      expect(park1.trails).to eq ([trail1, trail2])
      expect(park2.trails).to eq ([trail3])
    end
  end

  describe '#trails_shorter_than' do
    it 'returns trails that are shorter than given length' do
      park1 = Park.new('Capitol Reef')
      trail1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})
      trail2 = Trail.new({name: 'Cohab Canyon', length: '1.7 miles', level: :moderate})
      trail3 = Trail.new({name: 'Tower Bridge', length: '3.0 miles', level: :moderate})

      park1.add_trail(trail1)
      park1.add_trail(trail2)
      park1.add_trail(trail3)

      expect(park1.trails_shorter_than(2.5)).to eq ([trail1, trail2])
    end
  end

  describe '#hikeable miles' do
    it 'sums total number of miles of all trails' do
      trail1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})
      trail2 = Trail.new({name: 'Cohab Canyon', length: '1.7 miles', level: :moderate})
      trail3 = Trail.new({name: 'Chimney Rock Loop', length: '3.6 miles', level: :strenuous})
      trail4 = Trail.new({name: "Queen's/Navajo Loop", length: '2.9 miles', level: :moderate})
      trail5 = Trail.new({name: 'Rim Trail', length: '11 miles', level: :easy})
      trail6 = Trail.new({name: 'Tower Bridge', length: '3 miles', level: :moderate})
      park1 = Park.new('Capitol Reef')
      park2 = Park.new('Bryce Canyon')

      park1.add_trail(trail1)
      park1.add_trail(trail2)
      park1.add_trail(trail3)
      park2.add_trail(trail4)
      park2.add_trail(trail5)
      park2.add_trail(trail6)

      expect(park1.hikeable_miles).to eq 7.5
      expect(park2.hikeable_miles).to eq 16.9
    end
  end

  describe '#find trails by level' do
    it 'returns trails by given level' do
      park1 = Park.new('Capitol Reef')
      trail1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})
      trail2 = Trail.new({name: 'Cohab Canyon', length: '1.7 miles', level: :moderate})
      trail3 = Trail.new({name: 'Tower Bridge', length: '3.0 miles', level: :moderate})

      park1.add_trail(trail1)
      park1.add_trail(trail2)
      park1.add_trail(trail3)

      expect(park1.find_trails_by_level(:easy)).to eq ([trail1])
      expect(park1.find_trails_by_level(:moderate)).to eq ([trail2, trail3])
    end
  end

  describe '#trail names by level' do
    it 'returns array with trail names by level' do
      trail1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})
      trail2 = Trail.new({name: 'Cohab Canyon', length: '1.7 miles', level: :moderate})
      trail3 = Trail.new({name: 'Chimney Rock Loop', length: '3.6 miles', level: :strenuous})
      park1 = Park.new('Capitol Reef')

      park1.add_trail(trail1)
      park1.add_trail(trail2)
      park1.add_trail(trail3)

      expect(park1.trail_names_by_level(:easy)).to eq (['Grand Wash'])
      expect(park1.trail_names_by_level(:moderate)).to eq (['Cohab Canyon'])
      expect(park1.trail_names_by_level(:strenuous)).to eq (['Chimney Rock Loop'])
    end
  end

  describe '#trails by level' do
    it 'returns hash with trail level as key and trails names as values' do
      trail1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})
      trail2 = Trail.new({name: 'Cohab Canyon', length: '1.7 miles', level: :moderate})
      trail3 = Trail.new({name: 'Chimney Rock Loop', length: '3.6 miles', level: :strenuous})
      trail4 = Trail.new({name: "Queen's/Navajo Loop", length: '2.9 miles', level: :moderate})
      trail5 = Trail.new({name: 'Rim Trail', length: '11 miles', level: :easy})
      trail6 = Trail.new({name: 'Tower Bridge', length: '3 miles', level: :moderate})
      park1 = Park.new('Capitol Reef')
      park2 = Park.new('Bryce Canyon')

      park1.add_trail(trail1)
      park1.add_trail(trail2)
      park1.add_trail(trail3)
      park2.add_trail(trail4)
      park2.add_trail(trail5)
      park2.add_trail(trail6)
      expected = {
                  :easy => ["Grand Wash"],
                  :moderate => ["Cohab Canyon"],
                  :strenuous => ["Chimney Rock Loop"]}

      expect(park1.trails_by_level).to eq expected

      expected = {
                  :moderate => ["Queen's/Navajo Loop", "Tower Bridge"],
                  :easy => ["Rim Trail"] }

      expect(park2.trails_by_level).to eq expected 
    end
  end
end