# frozen_string_literal: true

class Carriage
  include Manufacturer
  include InstanceCounter
  # include CarriageSafety

  # attr_reader :safety

  def initialize
    register_instance
    # @safety = CarriageSafety
  end
end
