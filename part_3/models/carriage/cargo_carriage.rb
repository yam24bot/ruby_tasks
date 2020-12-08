# frozen_string_literal: true

class CargoCarriage < Carriage
  
  def initialize(volume)
    super()
    @volume = volume
    @filled = 0
  end

  def load_volume(cargo_volume)
    raise 'Already full' if @volume + @filled > @volume

    @filled += cargo_volume
  end

  def free
    volume - filled
  end
end
