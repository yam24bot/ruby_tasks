# frozen_string_literal: true

class CarriageDestroyer
  class << self
    attr_reader :train

    def destroy
      safety = CarriageSafety.new

      safety.check_created_train

      enter_train_number

      safety.check_train_number(train)
      safety.check_wagons(train)

      train.remove_carriage(train.carriages.last)
    rescue RuntimeError => e
      puts "Error: #{e.message}"
    end

    private

    def enter_train_number
      puts 'Enter train number'
      number = gets.chomp
      @train = Train.find(number)
    end
  end
end
