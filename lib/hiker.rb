class Hiker

  attr_reader :name,
              :experience_level,
              :snacks,
              :parks_visited
  def initialize(name, experience_level)
    @name = name
    @experience_level = experience_level
    @snacks = Hash.new(0)
    @parks_visited = []
  end

  def pack(item, amount)
    @snacks[item] += amount
  end

  def visit(park)
    @parks_visited << park
  end

  def possible_trails
    possible_trails = []
    @parks_visited.each do |park|
      park.trails.each do |trail|
        if trail.level == @experience_level
          possible_trails << trail
        end
      end
    end
    possible_trails
  end

  def favorite_snack
    favorite = @snacks.max_by do |item,amount|
      amount
    end
    favorite[0]
  end
end