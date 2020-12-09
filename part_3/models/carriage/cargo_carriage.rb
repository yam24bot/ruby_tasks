# frozen_string_literal: true

class CargoCarriage < Carriage
  attr_accessor :filled

  def initialize(volume)
    super()
    @volume = volume
    @filled = 0
  end

  def load(volume)
    raise 'Already full' if volume + filled > @volume

    filled += volume
  end

  def free!
    volume - filled
  end
end
