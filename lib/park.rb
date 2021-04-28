class Park 
  attr_reader :name,
              :trails 

  def initialize(name)
    @name = name 
    @trails = []
  end

  def add_trail(trail)
    @trails << trail
  end

  def find_shorter_trails(length)
    @trails.find_all do |trail|
      length > trail.length
    end
  end
end