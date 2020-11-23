# frozen_string_literal: true

CARRIAGE_TYPES = { 'cargo' => CargoCarriage, 'passenger' => PassengerCarriage }.freeze

class CarriageAddon
  class << self
    def add
      safety = CarriageSafety.new

      safety.check_created_train

      enter_train_number

      safety.check_train_number(train)
      carriage_size(train.type)

      connect_carriage
    rescue RuntimeError => e
      puts "Error: #{e.message}"
      retry unless Train.all.empty?
    end

    def carriage_size(type)
      case type
      when 'passenger'
        puts 'Enter the number of seats in the car'
        @size = gets.chomp.to_i
      when 'cargo'
        puts 'Enter the volume of the car'
        @size = gets.chomp.to_f
      end
    end

    def enter_train_number
      puts 'Enter train number'
      number = gets.chomp
      @train = Train.find(number)
    end

    def connect_carriage
      train.add_carriage(CARRIAGE_TYPES[train.type].new(@size))
    end

    def train
      @train
    end
  end
end
