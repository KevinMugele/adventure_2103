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

  def possible_trails 
    possible = []
    @parks_visited.each do |park|
      possible << park.trails_by_level(@experience_level)
    end
    possible.flatten
  end

  def favorite_snack
    most = @snacks.max_by do |snack, quantity|
      quantity
    end
    most[0]
  end
end