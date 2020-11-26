# frozen_string_literal: true

class RouteViewer
  # class << self
    # attr_reader :train
    def self.check
      # enter_train_number
      #
      # carriage_output
    rescue RuntimeError => e
      puts "Error: #{e.message}"
    end

    private

    # def enter_train_number
    #   puts 'Enter train number'
    #   number = gets.chomp
    #   @train = Train.find(number)
    # end
    #
    # def carriage_output
    #   train.iterate_carriages.with_index do |carriage, carriage_number|
    #     puts "№#{carriage_number += 1} #{train.type} free #{carriage.free!}, busy #{carriage.filled}"
    #   end
    # end
  # end
end
