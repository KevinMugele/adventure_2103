class Hiker
  attr_reader :name,
              :experience_level,
              :snacks,
              :parks_visited

  def initialize(name, experience_level)
    @name = name
    @experience_level = experience_level
    @snacks = {}
    @parks_visited = []
  end

  def pack(snack, amount)
    return @snacks[snack] = amount if @snacks[snack].nil?
    @snacks[snack] += amount
  end

  def visit(park)
    @parks_visited << park
  end

  # def trails_shorter_than(length)
  #   shorter_trails = []
  #   require 'pry'; binding.pry
  #   @parks_visited.each do |park|
  #     require 'pry'; binding.pry
  #     shorter_trails << park.find_shorter_trails(length)
  #   end
  #   shorter_trails
  # end 
end