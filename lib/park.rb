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

  def trails_shorter_than(milage)
    @trails.find_all do |trail|
      trail.length < 2.5
    end
  end

  def hikeable_miles
    @trails.sum do |trail|
      trail.length
    end
  end

  def trails_by_level
    trails_by_level = {}
    @trails.each do |trail|
      trails_by_level[trail.level] = []
    end
    @trails.each do |trail|
      trails_by_level.keys.each do |trail_level|
        if trail_level == trail.level
          trails_by_level[trail.level] << trail.name
        end
      end
    end
    trails_by_level
  end
end