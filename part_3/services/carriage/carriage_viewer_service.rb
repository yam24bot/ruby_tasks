# frozen_string_literal: true

class CarriageViewer
  class << self
    def list
      safety = CarriageSafety.new

      safety.check_created_train

      enter_train_number
      safety.check_train_number(train)

      carriage_output
    rescue RuntimeError => e
      puts "Error: #{e.message}"
    end

    def enter_train_number
      puts 'Enter train number'
      number = gets.chomp
      @train = Train.find(number)
    end

    def carriage_output
      train.iterate_carriages.with_index do |carriage, carriage_number|
        puts "№#{carriage_number += 1} #{train.type} free #{carriage.free!}, busy #{carriage.filled}"
      end
    end

    def train
      @train
    end
  end
end
