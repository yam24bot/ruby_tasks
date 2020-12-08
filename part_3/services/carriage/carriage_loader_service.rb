# frozen_string_literal: true

class CarriageLoader
  class << self
    attr_reader :train

    def load
      safety = CarriageSafety.new
      safety.check_created_train

      train_number
      safety.check_train_number(train)

      carriage_number
      safety.check_carriages_on_train(@carriage_number, train)

      carriage_cargo_size
    rescue RuntimeError => e
      puts "Error: #{e.message}"
    end

    private

    def change_cargo_filling
      Train.carriage_cargo_size(train, @carriage_number)
    end

    def carriage_number
      puts 'Enter the carriage number'
      @carriage_number = gets.chomp.to_i
    end

    def train_number
      puts 'Enter train number'
      number = gets.chomp
      @train = Train.find(number)
    end

    def carriage_cargo_size
      case train.type
      when 'cargo'
        puts 'Enter cargo volume'
        cargo_volume = gets.chomp.to_i
        train.carriages[@carriage_number - 1].load_volume(cargo_volume)
      when 'passenger'
        train.carriages[@carriage_number - 1].take_a_seat
      end
      puts 'Complete'
      pry
    end
  end
end
