class Trail
  attr_reader :name,
              :length,
              :level

  def initialize(details)
    @name = details[:name]
    @length = details[:length]
    @level = details[:level]
  end

end