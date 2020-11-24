# frozen_string_literal: true

class TrainMover
  class << self
    attr_reader :station, :train

    def move
      safety = TrainSafety.new(self)

      safety.check_train

      safety.check_station

      check_number
      raise 'There is no train with this number' if train.nil?

      check_station
      raise 'There is no such station' if station.nil?

      station.get_train(train)
    rescue RuntimeError => e
      puts "Error: #{e.message}"
    end

    private

    def check_number
      puts 'Which train? (enter number)'
      number = gets.chomp
      @train = Train.find(number)
    end

    def check_station
      puts 'Which station? (name)'
      name = gets.chomp
      @station = Station.all.detect { |stn| stn.name == name }
    end
  end
end
