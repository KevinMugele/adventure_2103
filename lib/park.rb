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

  def trails_shorter_than(length)
    @trails.find_all do |trail|
      length > trail.length
    end
  end

  def hikeable_miles 
    
  end
end