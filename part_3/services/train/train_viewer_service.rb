# frozen_string_literal: true

class TrainViewer
  class << self
    def list
      safety = TrainSafety.new(self)
      safety.check_station

      find_by_name

      check_station

      trains_on_station
    rescue RuntimeError => e
      puts "Error: #{e.message}"
    end

    def find_by_name
      puts 'Which one? (name)'
      name = gets.chomp
      @station = Station.name_detect(name)
      pry
    end

    def check_station
      raise 'There is no such station' if station.nil?
    end

    def trains_on_station
      station.iterate_trains { |train| puts "№#{train.number} #{train.type} wagons #{train.carriages.count}" }
    end

    def station
      @station
    end
  end
end
