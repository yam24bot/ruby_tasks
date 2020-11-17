# frozen_string_literal: true

class CarriageLoader
  class << self
    def load
      safety.check_created_train

      train_number
      safety.check_train_number

      carriage_number
      safety.check_carriages_on_train

      cargo_size(@train.type)
    rescue RuntimeError => e
      puts "Error: #{e.message}"
    end

    def cargo_size
      case type
      when 'cargo'
        puts 'Enter cargo volume '
        @train.carriages[@carriage_number - 1].load(gets.chomp.to_f)
      when 'passenger'
        @train.carriages[@carriage_number - 1].take_a_seat
      end
      puts 'Complete'
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
  end
end
