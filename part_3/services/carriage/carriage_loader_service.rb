# frozen_string_literal: true

class CarriageLoader
  class << self
    def load
      attr_reader :train

      safety.check_created_train

      train_number
      safety.check_train_number

      carriage_number
      safety.check_carriages_on_train

      cargo_size(train.type)
    rescue RuntimeError => e
      puts "Error: #{e.message}"
    end

    private

    def cargo_size
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
  end
end
