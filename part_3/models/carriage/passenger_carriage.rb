# frozen_string_literal: true

class PassengerCarriage < Carriage
  attr_reader :filled, :seats_count

  def initialize(seats_count)
    super()
    @seats_count = seats_count
    @filled = 0
  end

  def take_a_seat
    raise 'No free places' if filled == seats_count

    @filled += 1
  end

  def free
    @seats_count - filled
  end
end
