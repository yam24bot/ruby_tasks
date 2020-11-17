class CargoCarriage < Carriage
  attr_reader :filled

  def initialize(volume)
    @volume = volume
    @filled = 0
  end

  def load(volume)
    raise 'Already full' if volume + @filled > @volume
    @filled += volume
  end

  def free
    @volume - @filled
  end
end
