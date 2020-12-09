# frozen_string_literal: true

class PassengerTrain < Train
  validate :number, :presence
  validate :number, :format, TRAIN_NUMBER
  def initialize(number)
    super(number, 'passenger')
  end

  def add_car(carriage)
    unless carriage.instance_of?(PassengerCarriage)
      raise 'К пассажирскому поезду можно прицеплять только пассажирские вагоны'
    end

    super
  rescue RuntimeError => e
    puts "Ошибка: #{e.message}"
  end
end
