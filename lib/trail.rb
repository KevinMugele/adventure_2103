class Trail
  attr_reader :name,
              :length_str,
              :level

  def initialize(details)
    @name = details[:name]
    @length_str = details[:length]
    @level = details[:level]
  end

  def length
    @length_str.gsub('miles', '').to_f
  end
end