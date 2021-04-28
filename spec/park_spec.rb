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
end