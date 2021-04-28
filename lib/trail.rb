class Trail

  attr_reader :name,
              :length,
              :level
  def initialize(attributes)
    @name = attributes[:name]
    @length = attributes[:length].split(' ')[0...-1].join(' ').to_f
    @level = attributes[:level]
  end
end