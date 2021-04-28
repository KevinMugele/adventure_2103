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
    @trails.sum do |trail|
      trail.length
    end
  end

  def find_trails_by_level(level)
    @trails.find_all do |trail|
      level == trail.level
    end
  end

  def trail_names_by_level(level)
    find_trails_by_level(level).map do |trail|
      trail.name
    end
  end

  def trails_by_level
    by_level = {}
    @trails.each do |trail|
      by_level[trail.level] = trail_names_by_level(trail.level)
    end
    by_level
  end
end