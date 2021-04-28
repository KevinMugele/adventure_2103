class Trail
  attr_reader :name,
              :length,
              :level

  def initialize(details)
    @name = details[:name]
    @length_str = details[:length]
    @level = details[:level]
  end

  

end