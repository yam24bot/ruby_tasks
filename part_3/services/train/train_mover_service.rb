# frozen_string_literal: true

class TrainMover
  class << self
    def move
      raise 'First you need to create a train' if Train.all.empty?
      raise 'First you need to create a station' if Station.all.empty?

      check_number
      raise 'There is no train with this number' if @train.nil?

      check_station
      raise 'There is no such station' if @station.nil?

      @station.get_train(@train)
    rescue RuntimeError => e
      puts "Error: #{e.message}"
    end

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
