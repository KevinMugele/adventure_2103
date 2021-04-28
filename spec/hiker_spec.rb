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
      expect(hiker.parks_visited).to eq ([])
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

  describe '#vist' do
    it 'adds park to parks visited array' do
      hiker = Hiker.new('Dora', :moderate)
      park1 = Park.new('Capitol Reef')
      park2 = Park.new('Bryce Canyon')

      hiker.visit(park1)
      hiker.visit(park2)

      expect(hiker.parks_visited).to eq ([park1, park2])

    end

    it 'will not add the same park more than once' do
      hiker = Hiker.new('Dora', :moderate)
      park1 = Park.new('Capitol Reef')
      park2 = Park.new('Bryce Canyon')

      hiker.visit(park1)
      hiker.visit(park2)
      hiker.visit(park1)
  
      expect(hiker.parks_visited).to eq ([park1, park2])
    end
  end

  describe '#possible trails' do
    it 'returns all trails shorter than given length' do
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

      hiker = Hiker.new('Dora', :moderate)

      hiker.visit(park1)
      hiker.visit(park2)

      expect(hiker.possible_trails).to eq ([trail2, trail4, trail6])
    end
  end

  describe '#favorite snack' do
    it 'returns snack the hiker packed most of' do
      hiker = Hiker.new('Dora', :moderate)
      hiker.pack('water', 2)
      hiker.pack('trail mix', 1)
      hiker.pack('apple', 4)
      hiker.pack('carrot', 3)

      expect(hiker.favorite_snack).to eq 'apple'
    end
  end

  describe '#visitor log' do
    it 'contains date specific info on each hiker visit' do
      trail1 = Trail.new({name: 'Rim Trail', length: '11 miles', level: :easy})
      trail2 = Trail.new({name: "Queen's/Navajo Loop", length: '2.9 miles', level: :moderate})
      trail3 = Trail.new({name: 'Tower Bridge', length: '3 miles', level: :moderate})
      trail4 = Trail.new({name: 'Peekaboo Loop', length: '5.5 miles', level: :strenuous})
      park = Park.new('Bryce Canyon')

      park.add_trail(trail1)
      park.add_trail(trail2)
      park.add_trail(trail3)
      park.add_trail(trail4)

      hiker1 = Hiker.new('Dora', :moderate)
      hiker2 = Hiker.new('Frank', :easy)
      hiker3 = Hiker.new('Jack', :strenuous)
      hiker4 = Hiker.new('Sally', :strenuous)

      hiker1.visit(park)
      hiker2.visit(park)
      hiker3.visit(park)
      hiker4.visit(park)
      hiker1.visit(park)
      hiker2.visit(park)
      hiker3.visit(park)
      hiker4.visit(park)
    
      expect = {
                 1980 => {
                   "06/23" => {
                     hiker1 => [trail2, trail3]
                   },
                   "06/24" => {
                     hiker2 => [trail1],
                     hiker3 => [trail4]
                   },
                   "06/25" => {
                     hiker4 => [trail4]
                   }
                 },
                 2020 => {
                   "06/23" => {
                     hiker1 => [trail2, trail3]
                   },
                   "06/24" => {
                     hiker2 => [trail1],
                     hiker3 => [trail4]
                   },
                   "06/25" => {
                    hiker4 => [trail4]
                   }
                 },
        }

      expect(park.visitor_log).to eq expected
    end
  end
end