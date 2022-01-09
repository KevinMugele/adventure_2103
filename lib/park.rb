# frozen_string_literal: true

class Park
  attr_reader :name, :trails

  def initialize(name)
    @name = name
    @trails = []
  end

  def add_trail(trail)
    @trails << trail
  end

  def trails_shorter_than(length)
    @trails.find_all do |trail|
      trail.length < length
    end
  end

  def hikeable_miles
    @trails.sum(&:length)
  end

  def trails_by_level
    trails_by_level = {}
    @trails.each do |trail|
      if trails_by_level[trail.level].nil?
        trails_by_level[trail.level] = [trail.name]
      else
        trails_by_level[trail.level] << trail.name
      end
    end
    trails_by_level
  end
end
