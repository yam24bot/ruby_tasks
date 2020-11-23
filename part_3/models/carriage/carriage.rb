# frozen_string_literal: true

class Carriage
  include Manufacturer
  include InstanceCounter

  def initialize
    register_instance
  end
end
